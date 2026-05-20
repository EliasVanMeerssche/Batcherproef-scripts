# eBPF rootkit
- .ova bestand (besmette VM)
- .json ISF-profiel
## Belangerijke info
- Wat is een eBPF en wat is het verschil met LKM
- Wat al de hooks van een eBPF zijn
- Belangerijk om de besmette machine nooit te vertrouwen
- Hoe volatility3 werkt en wat we hiervoor nodig hebben
## Fase 1
- Gebruik llm om basis detectie te doen van een eBPF rootkit
## Fase 2
- Geef github link naar LiME voor een Memory Forensics onderzoek
- https://github.com/jtsylve/LiME
- Toon de output van volatility3 en vergelijk output met een niet besmet systeem
## Fase 3
- Laat hun sukkelen met LiME, de rootkit blocked dit
- Leg uit dat het belangerijk is om altijd vanbuiten het systeem een analyse te doen, hint virtualbox
- het resulaat moet mijn volatility3 output

## Vragen
- Waarom kan LiME niet geladen worden
- Hoe wordt de eBPF ingeladen in het systeem als het opstart

# eBPF command & control
- .ova bestand (clean VM)
1. Zet de client op van de rootkit
2. Zet de c2 op
3. Probeer met tcpdump het verkeer te detecteren



