# Stappenplan: VM's zo klein mogelijk maken voor `.ova`

Dit stappenplan is bedoeld voor beide VM's, zodat je ze eerst zo licht mogelijk maakt en pas daarna exporteert naar `.ova`.

## 1. Basis opruimen op de VM
- Verwijder tijdelijke bestanden:
  - `sudo apt clean`
  - `sudo apt autoremove --purge -y`
  - `sudo journalctl --vacuum-time=1s`
  - `sudo truncate -s 0 /var/log/syslog`
  - `sudo truncate -s 0 /var/log/auth.log`
  - `sudo truncate -s 0 /var/log/kern.log`
- Leeg shell history:
  - `history -c`
  - `cat /dev/null > ~/.bash_history`

## 4. Schijfruimte echt teruggeven
  - `dd if=/dev/zero of=/tmp/zero.fill bs=1M status=progress`
  - `sync`
  - `rm /tmp/zero.fill`
- Synchroniseer de schijf met:
  - `sync`
## 5. Verwijder nutteloze packahge
### rootkit
sudo apt remove --purge -y build-essential clang-11 llvm-11 gcc make git pkg-config libssl-dev bpfcc-tools libbpf-dev wget curl graphviz golang-go
sudo apt autoremove -y
sudo apt clean
sudo rm -rf /opt/ebpfkit /tmp/dwarf2json || true
sync

## 5. VirtualBox-export zo klein mogelijk houden
- Zet de VM volledig uit, niet in pauze of savestate.
- Controleer of er geen snapshots meer nodig zijn.
- Als je VirtualBox gebruikt, kies export vanuit de uitgeschakelde VM.
- Gebruik daarna:
    - ./VBoxManage list runningvms
    - ./VBoxManage controlvm "ebpfkit" pause
    - ./VBoxManage debugvm "ebpfkit" dumpvmcore --filename="C:\Users\username\Downloads\memory_dump.elf"
    - ./VBoxManage controlvm "ebpfkit" resume