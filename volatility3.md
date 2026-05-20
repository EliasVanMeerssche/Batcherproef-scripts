## Default
python vol.py -s "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\symbols" -f "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\memory_dump_clean.elf" linux.ebpf.EBPF
``` bash
Volatility 3 Framework 2.28.1
Progress:  100.00               Stacking attempts finished
Address Name    Tag     Type

0xcf3a0005d000  -       e3dbd137be8d6168        BPF_PROG_TYPE_CGROUP_DEVICE
0xcf3a00065000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xcf3a0006d000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xcf3a00121000  -       0ecd07b7b633809f        BPF_PROG_TYPE_CGROUP_DEVICE
0xcf3a00129000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xcf3a00131000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xcf3a00245000  -       e3dbd137be8d6168        BPF_PROG_TYPE_CGROUP_DEVICE
0xcf3a00249000  -       c8b47a902f1cc68b        BPF_PROG_TYPE_CGROUP_DEVICE
0xcf3a0060d000  -       8b9c33f36f812014        BPF_PROG_TYPE_CGROUP_DEVICE
0xcf3a00615000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xcf3a0061d000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
```
python vol.py -s "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\symbols" -f "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\memory_dump_clean.elf" linux.pstree.PsTree
``` bash
Volatility 3 Framework 2.28.1
Progress:  100.00               Stacking attempts finished
OFFSET (V)      PID     TID     PPID    COMM

0x8efc80240000  1       1       0       systemd
* 0x8efc80a16600        383     383     1       systemd-journal
* 0x8efc97829980        424     424     1       multipathd
* 0x8efc9782b300        425     425     1       systemd-udevd
* 0x8efc85a7e600        525     525     1       systemd-network
* 0x8efc87416600        582     582     1       systemd-resolve
* 0x8efc87411980        610     610     1       dbus-daemon
* 0x8efc98201980        614     614     1       networkd-dispat
* 0x8efc9a176600        621     621     1       systemd-logind
* 0x8efc89829980        653     653     1       sshd
** 0x8efc8982b300       920     920     653     sshd
*** 0x8efc8e964c80      951     951     920     sshd
**** 0x8efc85a79980     952     952     951     bash
* 0x8efc97ab0000        655     655     1       agetty
* 0x8efc98270000        891     891     1       VBoxDRMClient
* 0x8efc87413300        895     895     1       VBoxService
* 0x8efc89828000        923     923     1       systemd
** 0x8efc8982cc80       924     924     923     (sd-pam)
0x8efc80246600  2       2       0       kthreadd
* 0x8efc80243300        3       3       2       rcu_gp
* 0x8efc80244c80        4       4       2       rcu_par_gp
* 0x8efc80241980        5       5       2       slub_flushwq
* 0x8efc80251980        6       6       2       netns
* 0x8efc80250000        7       7       2       kworker/0:0
* 0x8efc80256600        8       8       2       kworker/0:0H
* 0x8efc80253300        9       9       2       kworker/u4:0
* 0x8efc80254c80        10      10      2       mm_percpu_wq
* 0x8efc8025b300        11      11      2       rcu_tasks_rude_
* 0x8efc8025cc80        12      12      2       rcu_tasks_trace
* 0x8efc80259980        13      13      2       ksoftirqd/0
* 0x8efc80258000        14      14      2       rcu_sched
* 0x8efc8025e600        15      15      2       migration/0
* 0x8efc80263300        16      16      2       idle_inject/0
* 0x8efc80264c80        17      17      2       kworker/0:1
* 0x8efc80260000        18      18      2       cpuhp/0
* 0x8efc80266600        19      19      2       cpuhp/1
* 0x8efc80368000        20      20      2       idle_inject/1
* 0x8efc8036e600        21      21      2       migration/1
* 0x8efc8036b300        22      22      2       ksoftirqd/1
* 0x8efc8036cc80        23      23      2       kworker/1:0
* 0x8efc80369980        24      24      2       kworker/1:0H
* 0x8efc80374c80        25      25      2       kdevtmpfs
* 0x8efc80371980        26      26      2       inet_frag_wq
* 0x8efc80370000        27      27      2       kauditd
* 0x8efc80376600        28      28      2       khungtaskd
* 0x8efc80373300        29      29      2       oom_reaper
* 0x8efc80396600        30      30      2       writeback
* 0x8efc80393300        31      31      2       kcompactd0
* 0x8efc80394c80        32      32      2       ksmd
* 0x8efc80391980        33      33      2       khugepaged
* 0x8efc80a11980        37      37      2       kworker/1:1
* 0x8efc80a14c80        80      80      2       kintegrityd
* 0x8efc80a13300        81      81      2       kblockd
* 0x8efc80a10000        82      82      2       blkcg_punt_bio
* 0x8efc80390000        83      83      2       kworker/u4:1
* 0x8efc80a1e600        84      84      2       tpm_dev_wq
* 0x8efc80a1b300        85      85      2       ata_sff
* 0x8efc80a18000        86      86      2       md
* 0x8efc80a1cc80        87      87      2       edac-poller
* 0x8efc80a19980        88      88      2       devfreq_wq
* 0x8efc80a2b300        89      89      2       watchdogd
* 0x8efc80a2cc80        90      90      2       kworker/1:1H
* 0x8efc80a28000        92      92      2       kswapd0
* 0x8efc80a2e600        93      93      2       ecryptfs-kthrea
* 0x8efc80a20000        95      95      2       kthrotld
* 0x8efc80a21980        96      96      2       kworker/u4:2
* 0x8efc80a24c80        97      97      2       acpi_thermal_pm
* 0x8efc80a23300        98      98      2       kworker/u4:3
* 0x8efc80a26600        99      99      2       scsi_eh_0
* 0x8efc80a29980        100     100     2       scsi_tmf_0
* 0x8efc830a8000        101     101     2       scsi_eh_1
* 0x8efc830ae600        102     102     2       scsi_tmf_1
* 0x8efc830ab300        103     103     2       vfio-irqfd-clea
* 0x8efc830acc80        104     104     2       kworker/u4:4
* 0x8efc830a9980        105     105     2       kworker/1:2
* 0x8efc83ede600        106     106     2       mld
* 0x8efc83edb300        107     107     2       ipv6_addrconf
* 0x8efc83ef1980        116     116     2       kstrp
* 0x8efc83ef3300        119     119     2       zswap-shrink
* 0x8efc83ef6600        120     120     2       kworker/u5:0
* 0x8efc83ed9980        125     125     2       charger_manager
* 0x8efc97afb300        159     159     2       kworker/0:1H
* 0x8efc97b04c80        189     189     2       kworker/0:2
* 0x8efc97839980        192     192     2       cryptd
* 0x8efc97838000        193     193     2       kworker/1:3
* 0x8efc98200000        212     212     2       scsi_eh_2
* 0x8efc98204c80        214     214     2       scsi_tmf_2
* 0x8efc97830000        230     230     2       ttm_swap
* 0x8efc97834c80        231     231     2       irq/18-vmwgfx
* 0x8efc97836600        234     234     2       card0-crtc0
* 0x8efc97833300        235     235     2       card0-crtc1
* 0x8efc97831980        236     236     2       card0-crtc2
* 0x8efc9782e600        237     237     2       card0-crtc3
* 0x8efc9783b300        238     238     2       card0-crtc4
* 0x8efc9783e600        239     239     2       card0-crtc5
* 0x8efc9783cc80        240     240     2       card0-crtc6
* 0x8efc98271980        241     241     2       card0-crtc7
* 0x8efc98274c80        247     247     2       kdmflush
* 0x8efc99ed0000        273     273     2       raid5wq
* 0x8efc98273300        320     320     2       jbd2/dm-0-8
* 0x8efc97b06600        321     321     2       ext4-rsv-conver
* 0x8efc83ed8000        415     415     2       kaluad
* 0x8efc97afe600        418     418     2       kmpath_rdacd
* 0x8efc97af9980        422     422     2       kmpathd
* 0x8efc9782cc80        423     423     2       kmpath_handlerd
* 0x8efc8982e600        502     502     2       iprt-VBoxWQueue
* 0x8efc97ab6600        543     543     2       jbd2/sda2-8
* 0x8efc97ab1980        545     545     2       ext4-rsv-conver
* 0x8efc897b3300        584     584     2       kworker/0:3
``` 
## Rootkit
python vol.py -s "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\symbols" -f "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\memory_dump.elf" linux.ebpf.EBPF
``` bash
Volatility 3 Framework 2.28.1
Progress:  100.00               Stacking attempts finished
Address Name    Tag     Type

0xccbb8005d000  -       e3dbd137be8d6168        BPF_PROG_TYPE_CGROUP_DEVICE
0xccbb80065000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xccbb8006d000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xccbb80125000  -       0ecd07b7b633809f        BPF_PROG_TYPE_CGROUP_DEVICE
0xccbb80121000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xccbb80123000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xccbb80251000  -       e3dbd137be8d6168        BPF_PROG_TYPE_CGROUP_DEVICE
0xccbb80535000  -       c8b47a902f1cc68b        BPF_PROG_TYPE_CGROUP_DEVICE
0xccbb80655000  -       8b9c33f36f812014        BPF_PROG_TYPE_CGROUP_DEVICE
0xccbb80253000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xccbb80255000  -       6deef7357e7b4530        BPF_PROG_TYPE_CGROUP_SKB
0xccbb80051000  kretprobe__64_s 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb8004f000  kprobe__64_sys_ 558728e464da7dd1        BPF_PROG_TYPE_KPROBE
0xccbb81eb5000  _vfs_open       e571209159c34cd3        BPF_PROG_TYPE_KPROBE
0xccbb80053000  __x64_sys_finit 8e961e4bbcad9f1e        BPF_PROG_TYPE_KPROBE
0xccbb8013b000  kretprobe__64_s fbef67bdb241355b        BPF_PROG_TYPE_KPROBE
0xccbb8013d000  kretprobe__64_s 8149a9c1ea8fdca5        BPF_PROG_TYPE_KPROBE
0xccbb8013f000  kretprobe__32_c 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb804e7000  kprobe__64_sys_ 41b087e993a64786        BPF_PROG_TYPE_KPROBE
0xccbb804e9000  kprobe__64_sys_ fcea3ad7c5dc4dc2        BPF_PROG_TYPE_KPROBE
0xccbb804eb000  kretprobe__64_s 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb8062f000  kretprobe__64_s 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb81f06000  kprobe__64_sys_ 9a5517ec1956fc75        BPF_PROG_TYPE_KPROBE
0xccbb81f10000  kprobe__64_sys_ 22f1156e32b401da        BPF_PROG_TYPE_KPROBE
0xccbb80631000  kprobe__64_sys_ 558728e464da7dd1        BPF_PROG_TYPE_KPROBE
0xccbb80633000  kretprobe__32_c 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb80647000  kretprobe__64_s 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb80649000  _vfs_read       2e38195ad756391a        BPF_PROG_TYPE_KPROBE
0xccbb8064b000  kretprobe__64_s 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb81f1a000  _vfs_getattr    e571209159c34cd3        BPF_PROG_TYPE_KPROBE
0xccbb80707000  kretprobe__64_s 72a675d136f86ad3        BPF_PROG_TYPE_KPROBE
0xccbb806f2000  __x64_sys_getde 2b9a2ad203222920        BPF_PROG_TYPE_KPROBE
0xccbb806fb000  xdp_ingress_del b489bab0c6d5985c        BPF_PROG_TYPE_XDP
0xccbb80703000  kretprobe__64_s 5faefaeb0d1fbdec        BPF_PROG_TYPE_KPROBE
0xccbb8322b000  egress_dispatch f7ef2bda3a4006f0        BPF_PROG_TYPE_SCHED_CLS
0xccbb81f42000  sqlite_conn_que 13cc21da02a32f77        BPF_PROG_TYPE_KPROBE
```

python vol.py -s "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\symbols" -f "C:\Users\elias\Downloads\volatility3-develop\volatility3-develop\memory_dump.elf" linux.pstree.PsTree
``` bash
Volatility 3 Framework 2.28.1
Progress:  100.00               Stacking attempts finished
OFFSET (V)      PID     TID     PPID    COMM

0x8a8dc0240000  1       1       0       systemd
* 0x8a8dd8224c80        384     384     1       systemd-journal
* 0x8a8dc5d96600        423     423     1       multipathd
* 0x8a8dc0a23300        428     428     1       systemd-udevd
* 0x8a8dcfe58000        583     583     1       systemd-network
* 0x8a8dc4eeb300        599     599     1       systemd-resolve
* 0x8a8dc2856600        612     612     1       dbus-daemon
* 0x8a8dcfc84c80        616     616     1       networkd-dispat
* 0x8a8dc68d3300        624     624     1       systemd-logind
* 0x8a8dc4eee600        646     646     1       sshd
** 0x8a8dc3278000       1001    1001    646     sshd
*** 0x8a8dd1c9e600      1034    1034    1001    sshd
**** 0x8a8dd8223300     1035    1035    1034    bash
* 0x8a8dc0391980        662     662     1       agetty
* 0x8a8dd82c0000        666     666     1       unattended-upgr
* 0x8a8dc4ee9980        901     901     1       VBoxDRMClient
* 0x8a8dd5b26600        903     903     1       VBoxService
* 0x8a8dc5d94c80        1006    1006    1       systemd
** 0x8a8dc5d91980       1009    1009    1006    (sd-pam)
* 0x8a8dd09acc80        3272    3272    1       packagekitd
* 0x8a8dce6bcc80        3276    3276    1       polkitd
* 0x8a8dd09ae600        3575    3575    1       .system-health
0x8a8dc0241980  2       2       0       kthreadd
* 0x8a8dc0246600        3       3       2       rcu_gp
* 0x8a8dc0243300        4       4       2       rcu_par_gp
* 0x8a8dc0244c80        5       5       2       slub_flushwq
* 0x8a8dc0256600        6       6       2       netns
* 0x8a8dc0253300        7       7       2       kworker/0:0
* 0x8a8dc0254c80        8       8       2       kworker/0:0H
* 0x8a8dc0251980        10      10      2       mm_percpu_wq
* 0x8a8dc0258000        11      11      2       rcu_tasks_rude_
* 0x8a8dc0259980        12      12      2       rcu_tasks_trace
* 0x8a8dc025e600        13      13      2       ksoftirqd/0
* 0x8a8dc025b300        14      14      2       rcu_sched
* 0x8a8dc025cc80        15      15      2       migration/0
* 0x8a8dc0264c80        16      16      2       idle_inject/0
* 0x8a8dc0260000        17      17      2       kworker/0:1
* 0x8a8dc0266600        18      18      2       cpuhp/0
* 0x8a8dc0263300        19      19      2       cpuhp/1
* 0x8a8dc0369980        20      20      2       idle_inject/1
* 0x8a8dc036e600        21      21      2       migration/1
* 0x8a8dc036b300        22      22      2       ksoftirqd/1
* 0x8a8dc036cc80        23      23      2       kworker/1:0
* 0x8a8dc0368000        24      24      2       kworker/1:0H
* 0x8a8dc0374c80        25      25      2       kdevtmpfs
* 0x8a8dc0370000        26      26      2       inet_frag_wq
* 0x8a8dc0371980        27      27      2       kauditd
* 0x8a8dc0376600        28      28      2       khungtaskd
* 0x8a8dc0373300        29      29      2       oom_reaper
* 0x8a8dc0396600        30      30      2       writeback
* 0x8a8dc0393300        31      31      2       kcompactd0
* 0x8a8dc0394c80        32      32      2       ksmd
* 0x8a8dc0390000        33      33      2       khugepaged
* 0x8a8dc0a2cc80        80      80      2       kintegrityd
* 0x8a8dc0a28000        81      81      2       kblockd
* 0x8a8dc0a29980        82      82      2       blkcg_punt_bio
* 0x8a8dc0a2b300        83      83      2       kworker/u4:1
* 0x8a8dc0a2e600        84      84      2       tpm_dev_wq
* 0x8a8dc0a19980        85      85      2       ata_sff
* 0x8a8dc0a1e600        86      86      2       md
* 0x8a8dc0a1cc80        87      87      2       edac-poller
* 0x8a8dc0a18000        88      88      2       devfreq_wq
* 0x8a8dc0a1b300        89      89      2       watchdogd
* 0x8a8dc0a14c80        90      90      2       kworker/1:1H
* 0x8a8dc0a11980        92      92      2       kswapd0
* 0x8a8dc0a13300        93      93      2       ecryptfs-kthrea
* 0x8a8dc2824c80        96      96      2       kthrotld
* 0x8a8dc2820000        97      97      2       acpi_thermal_pm
* 0x8a8dc2821980        98      98      2       scsi_eh_0
* 0x8a8dc2826600        99      99      2       scsi_tmf_0
* 0x8a8dc2823300        100     100     2       scsi_eh_1
* 0x8a8dc2828000        101     101     2       scsi_tmf_1
* 0x8a8dc282e600        103     103     2       vfio-irqfd-clea
* 0x8a8dc282b300        104     104     2       kworker/u4:4
* 0x8a8dc2850000        106     106     2       mld
* 0x8a8dc2851980        107     107     2       ipv6_addrconf
* 0x8a8dc2853300        109     109     2       kworker/0:1H
* 0x8a8dc5d89980        117     117     2       kstrp
* 0x8a8dc5d88000        120     120     2       zswap-shrink
* 0x8a8dc5d8cc80        121     121     2       kworker/u5:0
* 0x8a8dc5d90000        126     126     2       charger_manager
* 0x8a8dd7aae600        187     187     2       cryptd
* 0x8a8dd7aab300        188     188     2       kworker/1:2
* 0x8a8dd7aa8000        189     189     2       kworker/1:3
* 0x8a8dd7a9e600        219     219     2       scsi_eh_2
* 0x8a8dd8226600        221     221     2       scsi_tmf_2
* 0x8a8dc2e31980        231     231     2       ttm_swap
* 0x8a8dc2e33300        232     232     2       irq/18-vmwgfx
* 0x8a8dc2e30000        234     234     2       card0-crtc0
* 0x8a8dc2e36600        235     235     2       card0-crtc1
* 0x8a8dc2e34c80        236     236     2       card0-crtc2
* 0x8a8dd7aa9980        237     237     2       card0-crtc3
* 0x8a8dd7aacc80        238     238     2       card0-crtc4
* 0x8a8dc5d8e600        239     239     2       card0-crtc5
* 0x8a8dd82c3300        240     240     2       card0-crtc6
* 0x8a8dd82c4c80        241     241     2       card0-crtc7
* 0x8a8dda1ecc80        247     247     2       kdmflush
* 0x8a8dd82c6600        274     274     2       raid5wq
* 0x8a8dda1e8000        321     321     2       jbd2/dm-0-8
* 0x8a8dd7a88000        322     322     2       ext4-rsv-conver
* 0x8a8dda1eb300        407     407     2       kworker/1:4
* 0x8a8dda1ee600        417     417     2       kaluad
* 0x8a8dd7a8b300        420     420     2       kmpath_rdacd
* 0x8a8dd7a8cc80        421     421     2       kmpathd
* 0x8a8dd7a89980        422     422     2       kmpath_handlerd
* 0x8a8dcfc83300        525     525     2       iprt-VBoxWQueue
* 0x8a8dcfc80000        529     529     2       jbd2/sda2-8
* 0x8a8dcafb9980        530     530     2       ext4-rsv-conver
* 0x8a8dce6be600        663     663     2       kworker/0:4
* 0x8a8dc5461980        921     921     2       kworker/0:5
* 0x8a8dc5460000        922     922     2       kworker/0:6
* 0x8a8dc5463300        923     923     2       kworker/0:7
* 0x8a8dd5b24c80        924     924     2       kworker/0:8
* 0x8a8dcafbe600        927     927     2       kworker/0:11
* 0x8a8dcafb8000        928     928     2       kworker/0:12
* 0x8a8dcafbb300        929     929     2       kworker/0:13
* 0x8a8dcafbcc80        930     930     2       kworker/0:14
* 0x8a8dcfe59980        938     938     2       kworker/0:15
* 0x8a8dcfe5cc80        939     939     2       kworker/0:16
* 0x8a8dc68d1980        940     940     2       kworker/0:17
* 0x8a8dd0026600        941     941     2       kworker/1:5
* 0x8a8dd0023300        942     942     2       kworker/1:6
* 0x8a8dd0020000        944     944     2       kworker/1:8
* 0x8a8dd0021980        945     945     2       kworker/1:9
* 0x8a8dce0b6600        965     965     2       kworker/1:10
* 0x8a8dce0b4c80        966     966     2       kworker/1:11
* 0x8a8dce0b0000        967     967     2       kworker/1:12
* 0x8a8dce0b1980        969     969     2       kworker/1:14
* 0x8a8dc5d93300        970     970     2       kworker/1:15
* 0x8a8dc0a26600        971     971     2       kworker/1:16
* 0x8a8dc0a24c80        972     972     2       kworker/1:17
* 0x8a8dc0a21980        973     973     2       kworker/1:18
* 0x8a8dc5d8b300        974     974     2       kworker/1:19
* 0x8a8dcfc81980        975     975     2       kworker/1:20
* 0x8a8dce6bb300        976     976     2       kworker/1:21
* 0x8a8dc4199980        977     977     2       kworker/1:22
* 0x8a8dc419e600        978     978     2       kworker/1:23
* 0x8a8dc419b300        979     979     2       kworker/1:24
* 0x8a8dc419cc80        980     980     2       kworker/1:25
* 0x8a8dcec01980        982     982     2       kworker/1:27
* 0x8a8dcec03300        984     984     2       kworker/1:29
* 0x8a8dcec00000        986     986     2       kworker/1:31
* 0x8a8dc327cc80        1007    1007    2       kworker/0:18
* 0x8a8dd8221980        1052    1052    2       kworker/0:20
* 0x8a8dd8220000        1053    1053    2       kworker/0:21
* 0x8a8dd1c9b300        1054    1054    2       kworker/0:22
* 0x8a8dd1c9cc80        1055    1055    2       kworker/0:23
* 0x8a8dc3279980        1064    1064    2       kworker/0:24
* 0x8a8dd1c98000        1065    1065    2       kworker/0:25
* 0x8a8dcfc86600        1067    1067    2       kworker/0:27
* 0x8a8dcfe5e600        1068    1068    2       kworker/0:28
* 0x8a8dda1e9980        1069    1069    2       kworker/0:29
* 0x8a8dd19de600        1070    1070    2       kworker/0:30
* 0x8a8dd19dcc80        1072    1072    2       kworker/0:32
* 0x8a8dd2023300        1599    1599    2       kworker/1:30
* 0x8a8dd19d9980        1658    1658    2       kworker/0:3
* 0x8a8dc333e600        1666    1666    2       kworker/1:32
* 0x8a8dcec04c80        1703    1703    2       kworker/0:19
* 0x8a8dc327b300        1892    1892    2       kworker/0:2
* 0x8a8dcac93300        2322    2322    2       kworker/0:31
* 0x8a8dc3339980        2552    2552    2       kworker/1:7
* 0x8a8dc4198000        2822    2822    2       kworker/u4:0
* 0x8a8dc333b300        2862    2862    2       kworker/0:10
* 0x8a8dd2020000        3435    3435    2       kworker/1:1
* 0x8a8dcac94c80        3436    3436    2       kworker/1:13
* 0x8a8dc2829980        3459    3459    2       kworker/1:26
* 0x8a8dc0a10000        3498    3498    2       kworker/0:9
* 0x8a8dcac91980        3537    3537    2       kworker/u4:2
* 0x8a8dd09a8000        3559    3559    2       kworker/1:28
```