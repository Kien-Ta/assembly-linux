bits 64
default rel

%include "asm12_addin.asm"

%define ELFMAG 464C457Fh

; Some constants from glibc elf.h
%define EM_NONE			0        ; No machine 
%define EM_M32			1        ; AT&T WE 32100 
%define EM_SPARC		2        ; SUN SPARC 
%define EM_386                  3        ; Intel 80386 
%define EM_68K                  4        ; Motorola m68k family 
%define EM_88K                  5        ; Motorola m88k family 
%define EM_IAMCU                6        ; Intel MCU 
%define EM_860                  7        ; Intel 80860 
%define EM_MIPS                 8        ; MIPS R3000 big-endian 
%define EM_S370                 9        ; IBM System/370 
%define EM_MIPS_RS3_LE          10       ; MIPS R3000 little-endian 
                               		 ; reserved 11-14 
%define EM_PARISC               15       ; HPPA 
                               		 ; reserved 16 
%define EM_VPP500               17       ; Fujitsu VPP500 
%define EM_SPARC32PLUS          18       ; Sun"s "v8plus" 
%define EM_960                  19       ; Intel 80960 
%define EM_PPC                  20       ; PowerPC 
%define EM_PPC64                21       ; PowerPC 64-bit 
%define EM_S390                 22       ; IBM S390 
%define EM_SPU                  23       ; IBM SPU/SPC 
                               		 ; reserved 24-35 
%define EM_V800                36        ; NEC V800 series 
%define EM_FR20                37        ; Fujitsu FR20 
%define EM_RH32                38        ; TRW RH-32 
%define EM_RCE                39        ; Motorola RCE 
%define EM_ARM                40        ; ARM 
%define EM_FAKE_ALPHA        41        ; Digital Alpha 
%define EM_SH                42        ; Hitachi SH 
%define EM_SPARCV9        43        ; SPARC v9 64-bit 
%define EM_TRICORE        44        ; Siemens Tricore 
%define EM_ARC                45        ; Argonaut RISC Core 
%define EM_H8_300        46        ; Hitachi H8/300 
%define EM_H8_300H        47        ; Hitachi H8/300H 
%define EM_H8S                48        ; Hitachi H8S 
%define EM_H8_500        49        ; Hitachi H8/500 
%define EM_IA_64        50        ; Intel Merced 
%define EM_MIPS_X        51        ; Stanford MIPS-X 
%define EM_COLDFIRE        52        ; Motorola Coldfire 
%define EM_68HC12        53        ; Motorola M68HC12 
%define EM_MMA                54        ; Fujitsu MMA Multimedia Accelerator 
%define EM_PCP                55        ; Siemens PCP 
%define EM_NCPU                56        ; Sony nCPU embeeded RISC 
%define EM_NDR1                57        ; Denso NDR1 microprocessor 
%define EM_STARCORE        58        ; Motorola Start*Core processor 
%define EM_ME16                59        ; Toyota ME16 processor 
%define EM_ST100        60        ; STMicroelectronic ST100 processor 
%define EM_TINYJ        61        ; Advanced Logic Corp. Tinyj emb.fam 
%define EM_X86_64        62        ; AMD x86-64 architecture 
%define EM_PDSP                63        ; Sony DSP Processor 
%define EM_PDP10        64        ; Digital PDP-10 
%define EM_PDP11        65        ; Digital PDP-11 
%define EM_FX66                66        ; Siemens FX66 microcontroller 
%define EM_ST9PLUS        67        ; STMicroelectronics ST9+ 8/16 mc 
%define EM_ST7                68        ; STmicroelectronics ST7 8 bit mc 
%define EM_68HC16        69        ; Motorola MC68HC16 microcontroller 
%define EM_68HC11        70        ; Motorola MC68HC11 microcontroller 
%define EM_68HC08        71        ; Motorola MC68HC08 microcontroller 
%define EM_68HC05        72        ; Motorola MC68HC05 microcontroller 
%define EM_SVX                73        ; Silicon Graphics SVx 
%define EM_ST19                74        ; STMicroelectronics ST19 8 bit mc 
%define EM_VAX                75        ; Digital VAX 
%define EM_CRIS                76        ; Axis Communications 32-bit emb.proc 
%define EM_JAVELIN        77        ; Infineon Technologies 32-bit emb.proc 
%define EM_FIREPATH        78        ; Element 14 64-bit DSP Processor 
%define EM_ZSP                79        ; LSI Logic 16-bit DSP Processor 
%define EM_MMIX                80        ; Donald Knuth"s educational 64-bit proc 
%define EM_HUANY        81        ; Harvard University machine-independent object files 
%define EM_PRISM        82        ; SiTera Prism 
%define EM_AVR                83        ; Atmel AVR 8-bit microcontroller 
%define EM_FR30                84        ; Fujitsu FR30 
%define EM_D10V                85        ; Mitsubishi D10V 
%define EM_D30V                86        ; Mitsubishi D30V 
%define EM_V850                87        ; NEC v850 
%define EM_M32R                88        ; Mitsubishi M32R 
%define EM_MN10300        89        ; Matsushita MN10300 
%define EM_MN10200        90        ; Matsushita MN10200 
%define EM_PJ                91        ; picoJava 
%define EM_OPENRISC        92        ; OpenRISC 32-bit embedded processor 
%define EM_ARC_COMPACT        93        ; ARC International ARCompact 
%define EM_XTENSA        94        ; Tensilica Xtensa Architecture 
%define EM_VIDEOCORE        95        ; Alphamosaic VideoCore 
%define EM_TMM_GPP        96        ; Thompson Multimedia General Purpose Proc 
%define EM_NS32K        97        ; National Semi. 32000 
%define EM_TPC                98        ; Tenor Network TPC 
%define EM_SNP1K        99        ; Trebia SNP 1000 
%define EM_ST200        100        ; STMicroelectronics ST200 
%define EM_IP2K                101        ; Ubicom IP2xxx 
%define EM_MAX                102        ; MAX processor 
%define EM_CR                103        ; National Semi. CompactRISC 
%define EM_F2MC16        104        ; Fujitsu F2MC16 
%define EM_MSP430        105        ; Texas Instruments msp430 
%define EM_BLACKFIN        106        ; Analog Devices Blackfin DSP 
%define EM_SE_C33        107        ; Seiko Epson S1C33 family 
%define EM_SEP                108        ; Sharp embedded microprocessor 
%define EM_ARCA                109        ; Arca RISC 
%define EM_UNICORE        110        ; PKU-Unity & MPRC Peking Uni. mc series 
%define EM_EXCESS        111        ; eXcess configurable cpu 
%define EM_DXP                112        ; Icera Semi. Deep Execution Processor 
%define EM_ALTERA_NIOS2 113        ; Altera Nios II 
%define EM_CRX                114        ; National Semi. CompactRISC CRX 
%define EM_XGATE        115        ; Motorola XGATE 
%define EM_C166                116        ; Infineon C16x/XC16x 
%define EM_M16C                117        ; Renesas M16C 
%define EM_DSPIC30F        118        ; Microchip Technology dsPIC30F 
%define EM_CE                119        ; Freescale Communication Engine RISC 
%define EM_M32C                120        ; Renesas M32C 
                                ; reserved 121-130 
%define EM_TSK3000        131        ; Altium TSK3000 
%define EM_RS08                132        ; Freescale RS08 
%define EM_SHARC        133        ; Analog Devices SHARC family 
%define EM_ECOG2        134        ; Cyan Technology eCOG2 
%define EM_SCORE7        135        ; Sunplus S+core7 RISC 
%define EM_DSP24        136        ; New Japan Radio (NJR) 24-bit DSP 
%define EM_VIDEOCORE3        137        ; Broadcom VideoCore III 
%define EM_LATTICEMICO32 138        ; RISC for Lattice FPGA 
%define EM_SE_C17        139        ; Seiko Epson C17 
%define EM_TI_C6000        140        ; Texas Instruments TMS320C6000 DSP 
%define EM_TI_C2000        141        ; Texas Instruments TMS320C2000 DSP 
%define EM_TI_C5500        142        ; Texas Instruments TMS320C55x DSP 
%define EM_TI_ARP32        143        ; Texas Instruments App. Specific RISC 
%define EM_TI_PRU        144        ; Texas Instruments Prog. Realtime Unit 
                                ; reserved 145-159 
%define EM_MMDSP_PLUS        160        ; STMicroelectronics 64bit VLIW DSP 
%define EM_CYPRESS_M8C        161        ; Cypress M8C 
%define EM_R32C                162        ; Renesas R32C 
%define EM_TRIMEDIA        163        ; NXP Semi. TriMedia 
%define EM_QDSP6        164        ; QUALCOMM DSP6 
%define EM_8051                165        ; Intel 8051 and variants 
%define EM_STXP7X        166        ; STMicroelectronics STxP7x 
%define EM_NDS32        167        ; Andes Tech. compact code emb. RISC 
%define EM_ECOG1X        168        ; Cyan Technology eCOG1X 
%define EM_MAXQ30        169        ; Dallas Semi. MAXQ30 mc 
%define EM_XIMO16        170        ; New Japan Radio (NJR) 16-bit DSP 
%define EM_MANIK        171        ; M2000 Reconfigurable RISC 
%define EM_CRAYNV2        172        ; Cray NV2 vector architecture 
%define EM_RX                173        ; Renesas RX 
%define EM_METAG        174        ; Imagination Tech. META 
%define EM_MCST_ELBRUS        175        ; MCST Elbrus 
%define EM_ECOG16        176        ; Cyan Technology eCOG16 
%define EM_CR16                177        ; National Semi. CompactRISC CR16 
%define EM_ETPU                178        ; Freescale Extended Time Processing Unit 
%define EM_SLE9X        179        ; Infineon Tech. SLE9X 
%define EM_L10M                180        ; Intel L10M 
%define EM_K10M                181        ; Intel K10M 
                                ; reserved 182 
%define EM_AARCH64        183        ; ARM AARCH64 
                                ; reserved 184 
%define EM_AVR32        185        ; Amtel 32-bit microprocessor 
%define EM_STM8                186        ; STMicroelectronics STM8 
%define EM_TILE64        187        ; Tileta TILE64 
%define EM_TILEPRO        188        ; Tilera TILEPro 
%define EM_MICROBLAZE        189        ; Xilinx MicroBlaze 
%define EM_CUDA                190        ; NVIDIA CUDA 
%define EM_TILEGX        191        ; Tilera TILE-Gx 
%define EM_CLOUDSHIELD        192        ; CloudShield 
%define EM_COREA_1ST        193        ; KIPO-KAIST Core-A 1st gen. 
%define EM_COREA_2ND        194        ; KIPO-KAIST Core-A 2nd gen. 
%define EM_ARC_COMPACT2        195        ; Synopsys ARCompact V2 
%define EM_OPEN8        196        ; Open8 RISC 
%define EM_RL78                197        ; Renesas RL78 
%define EM_VIDEOCORE5        198        ; Broadcom VideoCore V 
%define EM_78KOR        199        ; Renesas 78KOR 
%define EM_56800EX        200        ; Freescale 56800EX DSC 
%define EM_BA1                201        ; Beyond BA1 
%define EM_BA2                202        ; Beyond BA2 
%define EM_XCORE        203        ; XMOS xCORE 
%define EM_MCHP_PIC        204        ; Microchip 8-bit PIC(r) 
                                ; reserved 205-209 
%define EM_KM32                210        ; KM211 KM32 
%define EM_KMX32        211        ; KM211 KMX32 
%define EM_EMX16        212        ; KM211 KMX16 
%define EM_EMX8                213        ; KM211 KMX8 
%define EM_KVARC        214        ; KM211 KVARC 
%define EM_CDP                215        ; Paneve CDP 
%define EM_COGE                216        ; Cognitive Smart Memory Processor 
%define EM_COOL                217        ; Bluechip CoolEngine 
%define EM_NORC                218        ; Nanoradio Optimized RISC 
%define EM_CSR_KALIMBA        219        ; CSR Kalimba 
%define EM_Z80                220        ; Zilog Z80 
%define EM_VISIUM        221        ; Controls and Data Services VISIUMcore 
%define EM_FT32                222        ; FTDI Chip FT32 
%define EM_MOXIE        223        ; Moxie processor 
%define EM_AMDGPU        224        ; AMD GPU 
                                ; reserved 225-242 
%define EM_RISCV        243        ; RISC-V 
%define EM_BPF                247        ; Linux BPF -- in-kernel virtual machine 
%define EM_CSKY                252     ; C-SKY 
%define EM_NUM                253
; Old spellings/synonyms.  
%define EM_ARC_A5        EM_ARC_COMPACT

; If it is necessary to assign new unofficial EM_* values, please
;   pick large random numbers (0x8523, 0xa7f2, etc.) to minimize the
;   chances of collision with official or non-GNU unofficial values.  

%define EM_ALPHA        0x9026
; Legal values for e_version (version).  
%define EV_NONE                0                ; Invalid ELF version 
%define EV_CURRENT        1                ; Current version 
%define EV_NUM                2



section .data
	STDIN	equ	0
	STDOUT	equ	1
	SYS_EXIT	equ	60
	SYS_READ	equ	0
	SYS_WRITE	equ	1
	linenew		db	10, 0
	space		db	" ", 0
	separate	db	" | ", 0
	minus		db	"-", 0

	hexa		db	"0123456789abcdef", 0	

	BintoF		db	" (bytes into file)", 10, 0
	Bytes		db	" (bytes)", 10, 0	

	UsageMsg	db	"Usage: ./asm12_ELFHeader filename", 10, 0
	CantOpenMsg	db	"Cannot open this file", 10, 0
	NotElfMsg	db	"Not an ELF file", 10
	ELFHeaderMsg	db	"ELF Header:", 10, 0
	MagicMsg	db	"Magic: ", 0
	ClassMsg	db	"Class: 					", 0
	Class32Msg	db	"ELF32", 10, 0
	Class64Msg	db	"ELF64", 10, 0
	DataMsg		db	"Data:				 	", 0
	DataLEMsg	db	"2 complement, little endian", 10, 0
	DataBEMsg	db	"2 complement, big endian", 10, 0
	VersionMsg	db	"Version:				", 0
	VerCurrMsg	db	"1 (Current version)", 10, 0
	VerInvalidMsg	db	"EV_NONE (Invalid version)", 10, 0
	OS_ABIMsg	db	"OS/ABI:					", 0
	ABIVerMsg	db	"ABI Version:				", 0
	TypeMsg		db	"Type:					", 0
	MachineMsg	db	"Machine:				", 0
	EPAMsg		db	"Entry point address: 			0x", 0
	SPHMsg		db	"Start of program headers:		", 0
	SSHMsg		db	"Start of section headers:		", 0
	FlagsMsg	db	"Flags:					0x", 0
	STHMsg		db	"Size of this header:			", 0
	SizePHMsg	db	"Size of program headers:		", 0
	NPHMsg		db	"Number of program headers:		", 0
	SiSHMsg		db	"Size of section headers:		", 0
	NSHMsg		db	"Number of section headers:		", 0
	SHSTIMsg	db	"Section header string table index:	", 0

	ClassUnknown	db "0x   (Unknown or invalid file class)", 10, 0
    	OSUnknown   	db "0x   (Unknown or invalid OS ABI)", 10, 0
    	DataUnk		db "0x   (Unknown or invalid data encoding)", 10, 0
   	IDUnknown	db "0x   (Unknown object file type)", 10, 0
   	IDproc		db "0x   (Processor-specific)", 10, 0
   	ARCHUnknown	db "0x   (Unknown architecture)", 10, 0
   	VERUnknown	db "0x   (Unknown version)", 10, 0
   	ENTRYUnk	db "0x          ", 10, 0
   	SectionStr	db "Nr | Name | Type | Addr | Off | Size | ES | Flg | Lk | Inf | Al", 10, 0
   	SegmentStr	db "Type | Offset | VirtAddr | PhysAddr | FileSiz | MemSiz | Flg | Align", 10, 0
   	SectionHdrStr	db "Section Headers:", 0
   	ProgramHdrStr 	db "Program Headers:", 0

	flagE	db	"E", 0
	flagW	db	"W", 0
	flagR	db	"R", 0

	flagA	db	"A", 0
	flagX	db	"X", 0
	flagM	db	"M", 0
	flagS	db	"S", 0
	flagI	db	"I", 0
	flagL	db	"L", 0
	flagO	db	"O", 0
	flagG	db	"G", 0
	flagT	db	"T", 0

	OSstr:
        dq 0
        db "UNIX - System V", 0Ah, 0
        dq 1
        db "UNIX - HP-UX", 0Ah, 0
        dq 2
        db "UNIX - NetBSD", 0Ah, 0
        dq 3
        db "UNIX - GNU", 0Ah, 0
        dq 6
        db "UNIX - Solaris", 0Ah, 0
        dq 7
        db "UNIX - AIX", 0Ah, 0
        dq 8
        db "UNIX - IRIX", 0Ah, 0
        dq 9
        db "UNIX - FreeBSD", 0Ah, 0
        dq 19
        db "UNIX - TRU64", 0Ah, 0
        dq 11
        db "Novell - Modesto", 0Ah, 0
        dq 12
        db "UNIX - OpenBSD", 0Ah, 0
        dq 13
        db "VMS - OpenVMS", 0Ah, 0
        dq 14
        db "HP - Non-Stop Kernel", 0Ah, 0
        dq 15
        db "AROS", 0Ah, 0
        dq 16
        db "FenixOS", 0Ah, 0
        dq 17
        db "Nuxi CloudABI", 0Ah, 0
        dq 18
        db "Stratus Technologies OpenVOS", 0Ah, 0
        dq -1
    TYPEstr:
        dq 0
        db 'ET_NONE (No file type)        ', 0Ah, 0
        dq 1
        db 'ET_REL (Relocatable file)     ', 0Ah, 0
        dq 2
        db 'ET_EXEC (Executable file)     ', 0Ah, 0
        dq 3
        db 'ET_DYN (Shared object file)   ', 0Ah, 0
        dq 4
        db 'ET_CORE (Core file)           ', 0Ah, 0
        dq 0xff00
        db 'ET_LOPROC (Processor-specific)', 0Ah, 0
        dq 0xffff
        db 'ET_HIPROC (Processor-specific)', 0Ah, 0
        dq -1

    ; incompleted list of ISA
    ARCHstr:
        dq EM_NONE		
        db "None", 0AH, 0
        dq EM_M32		
        db "WE32100", 0AH, 0
        dq EM_SPARC		
        db "Sparc", 0AH, 0
        dq EM_386		
        db "Intel 80386", 0AH, 0
        dq EM_68K		
        db "MC68000", 0AH, 0
        dq EM_88K		
        db "MC88000", 0AH, 0
        dq EM_IAMCU		
        db "Intel MCU", 0AH, 0
        dq EM_860		
        db "Intel 80860", 0AH, 0
        dq EM_MIPS		
        db "MIPS R3000", 0AH, 0
        dq EM_S370		
        db "IBM System/370", 0AH, 0
        ; 10 
        dq EM_MIPS_RS3_LE	
        db "MIPS R4000 big-endian", 0AH, 0
        dq EM_PARISC		
        db "HPPA", 0AH, 0
        dq EM_SPARC32PLUS	
        db "Sparc v8+" , 0AH, 0
        dq EM_960		
        db "Intel 80960", 0AH, 0
        dq EM_PPC		
        db "PowerPC", 0AH, 0
        ; 20 
        dq EM_PPC64		
        db "PowerPC64", 0AH, 0
        dq EM_S390		
        db "IBM S/390", 0AH, 0
        dq EM_SPU		
        db "SPU", 0AH, 0
        ; 30 
        dq EM_V800		
        db "Renesas V850 (using RH850 ABI)", 0AH, 0
        dq EM_FR20		
        db "Fujitsu FR20", 0AH, 0
        dq EM_RH32		
        db "TRW RH32", 0AH, 0
        ; 40 
        dq EM_ARM		
        db "ARM", 0AH, 0
        dq EM_SH			
        db "Renesas / SuperH SH", 0AH, 0
        dq EM_SPARCV9		
        db "Sparc v9", 0AH, 0
        dq EM_TRICORE		
        db "Siemens Tricore", 0AH, 0
        dq EM_ARC		
        db "ARC", 0AH, 0
        dq EM_H8_300		
        db "Renesas H8/300", 0AH, 0
        dq EM_H8_300H		
        db "Renesas H8/300H", 0AH, 0
        dq EM_H8S		
        db "Renesas H8S", 0AH, 0
        dq EM_H8_500		
        db "Renesas H8/500", 0AH, 0
        ; 50 
        dq EM_IA_64		
        db "Intel IA-64", 0AH, 0
        dq EM_MIPS_X		
        db "Stanford MIPS-X", 0AH, 0
        dq EM_COLDFIRE		
        db "Motorola Coldfire", 0AH, 0
        dq EM_68HC12		
        db "Motorola MC68HC12 Microcontroller", 0AH, 0
        dq EM_MMA		
        db "Fujitsu Multimedia Accelerator", 0AH, 0
        dq EM_PCP		
        db "Siemens PCP", 0AH, 0
        dq EM_NCPU		
        db "Sony nCPU embedded RISC processor", 0AH, 0
        dq EM_NDR1		
        db "Denso NDR1 microprocesspr", 0AH, 0
        dq EM_STARCORE		
        db "Motorola Star*Core processor", 0AH, 0
        dq EM_ME16		
        db "Toyota ME16 processor", 0AH, 0
        ; 60 
        dq EM_ST100		
        db "STMicroelectronics ST100 processor", 0AH, 0
        dq EM_TINYJ		
        db "Advanced Logic Corp. TinyJ embedded processor", 0AH, 0
        dq EM_X86_64		
        db "Advanced Micro Devices X86-64", 0AH, 0
        dq EM_PDSP		
        db "Sony DSP processor", 0AH, 0
        dq EM_PDP10		
        db "Digital Equipment Corp. PDP-10", 0AH, 0
        dq EM_PDP11		
        db "Digital Equipment Corp. PDP-11", 0AH, 0
        dq EM_FX66		
        db "Siemens FX66 microcontroller", 0AH, 0
        dq EM_ST9PLUS		
        db "STMicroelectronics ST9+ 8/16 bit microcontroller", 0AH, 0
        dq EM_ST7		
        db "STMicroelectronics ST7 8-bit microcontroller", 0AH, 0
        dq EM_68HC16		
        db "Motorola MC68HC16 Microcontroller", 0AH, 0
        ; 70 
        dq EM_68HC11		
        db "Motorola MC68HC11 Microcontroller", 0AH, 0
        dq EM_68HC08		
        db "Motorola MC68HC08 Microcontroller", 0AH, 0
        dq EM_68HC05		
        db "Motorola MC68HC05 Microcontroller", 0AH, 0
        dq EM_SVX		
        db "Silicon Graphics SVx", 0AH, 0
        dq EM_ST19		
        db "STMicroelectronics ST19 8-bit microcontroller", 0AH, 0
        dq EM_VAX		
        db "Digital VAX", 0AH, 0
        dq EM_CRIS		
        db "Axis Communications 32-bit embedded processor", 0AH, 0
        dq EM_JAVELIN		
        db "Infineon Technologies 32-bit embedded cpu", 0AH, 0
        dq EM_FIREPATH		
        db "Element 14 64-bit DSP processor", 0AH, 0
        dq EM_ZSP		
        db "LSI Logic's 16-bit DSP processor", 0AH, 0
        ; 80 
        dq EM_MMIX		
        db "Donald Knuth's educational 64-bit processor", 0AH, 0
        dq EM_HUANY		
        db "Harvard Universitys's machine-independent object format", 0AH, 0
        dq EM_PRISM		
        db "Vitesse Prism", 0AH, 0
        dq EM_AVR		
        db "Atmel AVR 8-bit microcontroller", 0AH, 0
        dq EM_FR30		
        db "Fujitsu FR30", 0AH, 0
        dq EM_D10V		
        db "d10v", 0AH, 0
        dq EM_D30V		
        db "d30v", 0AH, 0
        dq EM_V850		
        db "Renesas V850", 0AH, 0
        dq EM_M32R		
        db "Renesas M32R (formerly Mitsubishi M32r)", 0AH, 0
        dq EM_MN10300		
        db "mn10300", 0AH, 0
        ; 90 
        dq EM_MN10200		
        db "mn10200", 0AH, 0
        dq EM_PJ			
        db "picoJava", 0AH, 0
        dq EM_ARC_COMPACT	
        db "ARCompact", 0AH, 0
        dq EM_XTENSA		
        db "Tensilica Xtensa Processor", 0AH, 0
        dq EM_VIDEOCORE		
        db "Alphamosaic VideoCore processor", 0AH, 0
        dq EM_TMM_GPP		
        db "Thompson Multimedia General Purpose Processor", 0AH, 0
        dq EM_NS32K		
        db "National Semiconductor 32000 series", 0AH, 0
        dq EM_TPC		
        db "Tenor Network TPC processor", 0AH, 0
        dq EM_SNP1K	        
        db "Trebia SNP 1000 processor", 0AH, 0
        ; 100 
        dq EM_ST200		
        db "STMicroelectronics ST200 microcontroller", 0AH, 0
        dq EM_IP2K		
        db "Ubicom IP2xxx 8-bit microcontrollers", 0AH, 0
        dq EM_MAX		
        db "MAX Processor", 0AH, 0
        dq EM_CR			
        db "National Semiconductor CompactRISC", 0AH, 0
        dq EM_F2MC16		
        db "Fujitsu F2MC16", 0AH, 0
        dq EM_MSP430		
        db "Texas Instruments msp430 microcontroller", 0AH, 0
        dq EM_BLACKFIN		
        db "Analog Devices Blackfin", 0AH, 0
        dq EM_SE_C33		
        db "S1C33 Family of Seiko Epson processors", 0AH, 0
        dq EM_SEP		
        db "Sharp embedded microprocessor", 0AH, 0
        dq EM_ARCA		
        db "Arca RISC microprocessor", 0AH, 0
        ; 110 
        dq EM_UNICORE		
        db "Unicore", 0AH, 0
        dq EM_EXCESS		
        db "eXcess 16/32/64-bit configurable embedded CPU", 0AH, 0
        dq EM_DXP		
        db "Icera Semiconductor Inc. Deep Execution Processor", 0AH, 0
        dq EM_ALTERA_NIOS2	
        db "Altera Nios II", 0AH, 0
        dq EM_CRX		
        db "National Semiconductor CRX microprocessor", 0AH, 0
        dq EM_XGATE		
        db "Motorola XGATE embedded processor", 0AH, 0
        dq EM_M16C		
        db "Renesas M16C series microprocessors", 0AH, 0
        dq EM_DSPIC30F		
        db "Microchip Technology dsPIC30F Digital Signal Controller", 0AH, 0
        dq EM_CE			
        db "Freescale Communication Engine RISC core", 0AH, 0
        ; 120 
        dq EM_M32C	        
        db "Renesas M32c", 0AH, 0
        ; 130 
        dq EM_TSK3000		
        db "Altium TSK3000 core", 0AH, 0
        dq EM_RS08		
        db "Freescale RS08 embedded processor", 0AH, 0
        dq EM_ECOG2		
        db "Cyan Technology eCOG2 microprocessor", 0AH, 0
        dq EM_DSP24		
        db "New Japan Radio (NJR) 24-bit DSP Processor", 0AH, 0
        dq EM_VIDEOCORE3		
        db "Broadcom VideoCore III processor", 0AH, 0
        dq EM_LATTICEMICO32	
        db "Lattice Mico32", 0AH, 0
        dq EM_SE_C17		
        db "Seiko Epson C17 family", 0AH, 0
        ; 140 
        dq EM_TI_C6000		
        db "Texas Instruments TMS320C6000 DSP family", 0AH, 0
        dq EM_TI_C2000		
        db "Texas Instruments TMS320C2000 DSP family", 0AH, 0
        dq EM_TI_C5500		
        db "Texas Instruments TMS320C55x DSP family", 0AH, 0
        dq EM_TI_PRU		
        db "TI PRU I/O processor", 0AH, 0
        ; 160 
        dq EM_MMDSP_PLUS		
        db "STMicroelectronics 64bit VLIW Data Signal Processor", 0AH, 0
        dq EM_CYPRESS_M8C	
        db "Cypress M8C microprocessor", 0AH, 0
        dq EM_R32C		
        db "Renesas R32C series microprocessors", 0AH, 0
        dq EM_TRIMEDIA		
        db "NXP Semiconductors TriMedia architecture family", 0AH, 0
        dq EM_QDSP6		
        db "QUALCOMM DSP6 Processor", 0AH, 0
        dq EM_8051		
        db "Intel 8051 and variants", 0AH, 0
        dq EM_STXP7X		
        db "STMicroelectronics STxP7x family", 0AH, 0
        dq EM_NDS32		
        db "Andes Technology compact code size embedded RISC processor family", 0AH, 0
        dq EM_ECOG1X		
        db "Cyan Technology eCOG1X family", 0AH, 0
        dq EM_MAXQ30		
        db "Dallas Semiconductor MAXQ30 Core microcontrollers", 0AH, 0
        ; 170 
        dq EM_XIMO16		
        db "New Japan Radio (NJR) 16-bit DSP Processor", 0AH, 0
        dq EM_MANIK		
        db "M2000 Reconfigurable RISC Microprocessor", 0AH, 0
        dq EM_CRAYNV2		
        db "Cray Inc. NV2 vector architecture", 0AH, 0
        dq EM_RX			
        db "Renesas RX", 0AH, 0
        dq EM_METAG		
        db "Imagination Technologies Meta processor architecture", 0AH, 0
        dq EM_MCST_ELBRUS	
        db "MCST Elbrus general purpose hardware architecture", 0AH, 0
        dq EM_ECOG16		
        db "Cyan Technology eCOG16 family", 0AH, 0
        dq EM_CR16
        db "Xilinx MicroBlaze", 0AH, 0
        dq EM_MICROBLAZE
        db "Xilinx MicroBlaze", 0AH, 0
        dq EM_ETPU		
        db "Freescale Extended Time Processing Unit", 0AH, 0
        dq EM_SLE9X		
        db "Infineon Technologies SLE9X core", 0AH, 0
        ; 180 
        dq EM_AARCH64		
        db "AArch64", 0AH, 0
        dq EM_AVR32		
        db "Atmel Corporation 32-bit microprocessor", 0AH, 0
        dq EM_STM8		
        db "STMicroeletronics STM8 8-bit microcontroller", 0AH, 0
        dq EM_TILE64		
        db "Tilera TILE64 multicore architecture family", 0AH, 0
        dq EM_TILEPRO		
        db "Tilera TILEPro multicore architecture family", 0AH, 0
        ; 190 
        dq EM_CUDA		
        db "NVIDIA CUDA architecture", 0AH, 0
        dq EM_TILEGX		
        db "Tilera TILE-Gx multicore architecture family", 0AH, 0
        dq EM_CLOUDSHIELD	
        db "CloudShield architecture family", 0AH, 0
        dq EM_COREA_1ST		
        db "KIPO-KAIST Core-A 1st generation processor family", 0AH, 0
        dq EM_COREA_2ND		
        db "KIPO-KAIST Core-A 2nd generation processor family", 0AH, 0
        dq EM_ARC_COMPACT2	
        db "ARCv2", 0AH, 0
        dq EM_OPEN8		
        db "Open8 8-bit RISC soft processor core", 0AH, 0
        dq EM_RL78		
        db "Renesas RL78", 0AH, 0
        dq EM_VIDEOCORE5		
        db "Broadcom VideoCore V processor", 0AH, 0
        ; 200 
        dq EM_56800EX		
        db "Freescale 56800EX Digital Signal Controller (DSC)", 0AH, 0
        dq EM_BA1		
        db "Beyond BA1 CPU architecture", 0AH, 0
        dq EM_BA2		
        db "Beyond BA2 CPU architecture", 0AH, 0
        dq EM_XCORE		
        db "XMOS xCORE processor family", 0AH, 0
        dq EM_MCHP_PIC		
        db "Microchip 8-bit PIC(r) family", 0AH, 0
        ; 210 
        dq EM_KM32		
        db "KM211 KM32 32-bit processor", 0AH, 0
        dq EM_KMX32		
        db "KM211 KMX32 32-bit processor", 0AH, 0
        dq EM_KVARC		
        db "KM211 KVARC processor", 0AH, 0
        dq EM_CDP		
        db "Paneve CDP architecture family", 0AH, 0
        dq EM_COGE		
        db "Cognitive Smart Memory Processor", 0AH, 0
        dq EM_COOL		
        db "Bluechip Systems CoolEngine", 0AH, 0
        dq EM_NORC		
        db "Nanoradio Optimized RISC", 0AH, 0
        dq EM_CSR_KALIMBA	
        db "CSR Kalimba architecture family", 0AH, 0
        ; 220 
        dq EM_Z80		
        db "Zilog Z80", 0AH, 0
        dq EM_VISIUM		
        db "CDS VISIUMcore processor", 0AH, 0
        dq EM_FT32               
        db "FTDI Chip FT32", 0AH, 0
        dq EM_MOXIE              
        db "Moxie", 0AH, 0
        dq EM_AMDGPU 	 	
        db "AMD GPU", 0AH, 0
        ; 230 (all reserved) 
        ; 240 
        dq EM_RISCV 	 	
        db "RISC-V", 0AH, 0
        dq EM_BPF		
        db "Linux BPF", 0AH, 0
        ; 250 
        dq EM_CSKY		
        db "C-SKY", 0AH, 0

        ; Large numbers...  
        dq EM_ALPHA		
        db "Alpha", 0AH, 0
        dq -1
    ptypeStr:
        dq 0x00000000
        db "PT_NULL", 0
        dq 0x00000001
        db "PT_LOAD", 0
        dq 0x00000002
        db "PT_DYNAMIC", 0
        dq 0x00000003
        db "PT_INTERP", 0
        dq 0x00000004
        db "PT_NOTE", 0
        dq 0x00000005
        db "PT_SHLIB", 0
        dq 0x00000006
        db "PT_PHDR", 0
        dq 0x00000007
        db "PT_TLS", 0
        dq 0x60000000
        db "PT_LOOS", 0
        dq 0x6FFFFFFF
        db "PT_HIOS", 0
        dq 0x70000000
        db "PT_LOPROC", 0
        dq 0x6474e551
        db 'PT_GNU_STACK', 0
        dq 0x6474e552
        db 'PT_GNU_RELRO', 0
        dq 0x6474e553
        db 'PT_GNU_PROPERTY', 0
        dq 0x65041580
        db 'PT_PAX_FLAGS', 0
        dq 0x6ffffffa
        db 'PT_LOSUNW', 0
        dq 0x6ffffffa      
        db 'PT_SUNWBSS', 0
        dq 0x6ffffffb      
        db 'PT_SUNWSTACK', 0
        dq -1
    shtypeStr:
        dq 0x0
        db "SHT_NULL", 0
        dq 0x1
        db "SHT_PROGBITS", 0
        dq 0x2
        db "SHT_SYMTAB", 0
        dq 0x3
        db "SHT_STRTAB", 0
        dq 0x4
        db "SHT_RELA", 0
        dq 0x5
        db "SHT_HASH", 0
        dq 0x6
        db "SHT_DYNAMIC", 0
        dq 0x7
        db "SHT_NOTE", 0
        dq 0x8
        db "SHT_NOBITS", 0
        dq 0x9
        db "SHT_REL", 0
        dq 0x0A
        db "SHT_SHLIB", 0
        dq 0x0B
        db "SHT_DYNSYM", 0
        dq 0x0E
        db "SHT_INIT_ARRAY", 0
        dq 0x0F
        db "SHT_FINI_ARRAY", 0
        dq 0x10
        db "SHT_PREINIT_ARRAY", 0
        dq 0x11
        db "SHT_GROUP", 0
        dq 0x12
        db "SHT_SYMTAB_SHNDX", 0
        dq 0x13
        db "SHT_NUM", 0
        dq 0x60000000
        db "SHT_LOOS", 0
        dq -1

section .bss
	file_descriptor	resq	1
	filedata	resb	200000
	stat		resb	144
	program_flag	resd	1
	section_flag	resd	1
	
	sectionHdr	resq 1
	programHdr 	resq 1
	shentsize 	resw 1
	phentsize 	resw 1
	shnum 		resw 1
	phnum 		resw 1
	shstrtab 	resq 1
	tmp 		resq 1
	sec 		resq 1

struc STAT
    .st_dev         resq 1
    .st_ino         resq 1
    .st_nlink       resq 1
    .st_mode        resd 1
    .st_uid         resd 1
    .st_gid         resd 1
    .pad0           resb 4
    .st_rdev        resq 1
    .st_size        resq 1
    .st_blksize     resq 1
    .st_blocks      resq 1
    .st_atime       resq 1
    .st_atime_nsec  resq 1
    .st_mtime       resq 1
    .st_mtime_nsec  resq 1
    .st_ctime       resq 1
    .st_ctime_nsec  resq 1
endstruc
    
struc e_ident
	.EI_MAG		resb 4	; ELF "magic number" (0x7f, 'ELF')
	.EI_CLASS	resb 1	; file's class, or capacity
	.EI_DATA	resb 1	; data encoding of the cpu-specific data
	.EI_VERSION	resb 1	; ELF header version number (set to EV_CURRENT)
	.EI_PAD		resb 1	; marks the beginning of the unused bytes
	.EI_NIDENT	resb 8	; unused bytes in e_ident
endstruc

struc ELF32_Ehdr
    .e_ident        resb 16
    .e_type         resw 1
    .e_machine      resw 1
    .e_version      resd 1
    .e_entry        resd 1
    .e_phoff        resd 1
    .e_shoff        resd 1
    .e_flags        resd 1
    .e_ehsize       resw 1
    .e_phentsize    resw 1
    .e_phnum        resw 1
    .e_shentsize    resw 1
    .e_shnum        resw 1
    .e_shstrndx     resw 1
endstruc

struc ELF64_Ehdr
    .e_ident        resb 16
    .e_type         resw 1
    .e_machine      resw 1
    .e_version      resd 1
    .e_entry        resq 1
    .e_phoff        resq 1
    .e_shoff        resq 1
    .e_flags        resd 1
    .e_ehsize       resw 1
    .e_phentsize    resw 1
    .e_phnum        resw 1
    .e_shentsize    resw 1
    .e_shnum        resw 1
    .e_shstrndx     resw 1
endstruc

struc ELF32_Phdr
    .p_type         resd 1
    .p_offset       resd 1
    .p_vaddr        resd 1
    .p_paddr        resd 1
    .p_filesz       resd 1
    .p_memsz        resd 1
    .p_flags        resd 1
    .p_align        resd 1
endstruc

struc ELF64_Phdr
    .p_type         resd 1
    .p_flags        resd 1
    .p_offset       resq 1
    .p_vaddr        resq 1
    .p_paddr        resq 1
    .p_filesz       resq 1
    .p_memsz        resq 1
    .p_align        resq 1
endstruc

struc ELF32_Shdr;
    .sh_name        resd 1
    .sh_type        resd 1
    .sh_flags       resd 1
    .sh_addr        resd 1
    .sh_offset      resd 1
    .sh_size        resd 1
    .sh_link        resd 1
    .sh_info        resd 1
    .sh_addralign   resd 1
    .sh_entsize     resd 1
endstruc

struc ELF64_Shdr
    .sh_name        resd 1
    .sh_type        resd 1
    .sh_flags       resq 1
    .sh_addr        resq 1
    .sh_offset      resq 1
    .sh_size        resq 1
    .sh_link        resd 1
    .sh_info        resd 1
    .sh_addralign   resq 1
    .sh_entsize     resq 1
endstruc

section .text
global _start
_start:
; check num of args
	mov	rax, [rsp]
	cmp	rax, 1
	jle	usage

; open file
	mov	rax, 2
	mov	rdi, [rsp + 16]
	mov	rsi, 0 
	mov	rdx, 0
	syscall

	cmp	rax, -1
	je	cannot_open

	mov	[file_descriptor], rax

; get file size
	mov	rax, 4
	mov	rdi, [rsp + 16]
	mov	rsi, stat
	syscall
	
	cmp	rax, -1
	je	usage

	mov	rax, [stat + STAT.st_size]
	cmp	rax, 16
	jle	usage

; read ELF magic num
	mov	rax, SYS_READ
	mov	rdi, [file_descriptor]
	mov	rsi, filedata
	mov	rdx, [stat + STAT.st_size]
	syscall

	cmp	dword [filedata], ELFMAG
	jne	not_ELF

	mov	rdi, ELFHeaderMsg
	call	strPrint

	mov	rdi, MagicMsg
	call	strPrint

	mov	rcx, 0
printMagic:
	cmp	rcx, 16
	je	checkClass
	movzx	rdi, byte [filedata + rcx]
	push	rcx
	call	hexBytePrint
	mov	rdi, space
	call	strPrint
	pop	rcx
	inc	rcx
	jmp	printMagic

checkClass:
	mov	rdi, linenew
	call	strPrint
	mov	rdi, ClassMsg
	call	strPrint
	cmp	byte [filedata + 4], 1
	je 	Class32
	cmp	byte [filedata + 4], 2
	je	Class64
	mov	rdi, ClassUnknown	
	jmp	printClass
Class32:
	mov	rdi, Class32Msg
	jmp	printClass
Class64:
	mov	rdi, Class64Msg
printClass:
	call	strPrint

checkEncoding:
	mov	rdi, DataMsg
	call	strPrint
	cmp	byte [filedata + 5], 1
	je	littleEndian
	cmp	byte [filedata + 5], 2
	je	bigEndian
	mov	rdi, DataUnk
	jmp	printEncode
littleEndian:
	mov	rdi, DataLEMsg
	jmp	printEncode
bigEndian:	
	mov	rdi, DataBEMsg
printEncode:
	call	strPrint

checkVersion:
	mov	rdi, VersionMsg
	call	strPrint
	
	movzx	rdi, byte [filedata + 6]
	cmp	rdi, 1
	je	ver1

	mov	rdi, VerInvalidMsg
	jmp	printVersion
ver1:
	mov	rdi, VerCurrMsg
printVersion:
	call	strPrint

checkABI:
	mov	rdi, OS_ABIMsg
	call	strPrint
	movzx	rdi, byte [filedata + 7]
	mov	rsi, OSstr
	call	findAndPrint
	cmp	rax, -1
	jne	ABIVer
	mov	rdi, OSUnknown
	call	strPrint
ABIVer:
	mov	rdi, ABIVerMsg
	call	strPrint
	movzx	rdi, byte [filedata + 8]
	call	int64Print
	mov	rdi, linenew
	call	strPrint

; reverse Big endian 
	mov	al, byte [filedata + 5]
	cmp	al, 2
	jne 	printType

	mov	rdi, filedata + ELF32_Ehdr.e_type
	mov	rsi, 2
	call	revBytes
	
	mov	rdi, filedata + ELF32_Ehdr.e_machine
	mov	rsi, 2
	call	revBytes
	
	mov	rdi, filedata + ELF32_Ehdr.e_version
	mov	rsi, 4
	call	revBytes

	mov	al, byte [filedata + 4]
	cmp	al, 1
	je	rev32
	cmp	al, 2
	je	rev64
	jmp	printType

rev32:
	mov rdi, filedata+ELF32_Ehdr.e_entry
    	mov rsi, 4
    	call revBytes
    
    	mov rdi, filedata+ELF32_Ehdr.e_phoff
    	mov rsi, 4
    	call revBytes

    	mov rdi, filedata+ELF32_Ehdr.e_shoff
    	mov rsi, 4
    	call revBytes

    	mov rdi, filedata+ELF32_Ehdr.e_flags
    	mov rsi, 4
    	call revBytes

    	mov rdi, filedata+ELF32_Ehdr.e_ehsize
    	mov rsi, 2
    	call revBytes

    	mov rdi, filedata+ELF32_Ehdr.e_phentsize
    	mov rsi, 2
    	call revBytes
    	jmp printType

rev64:
	mov rdi, filedata+ELF64_Ehdr.e_entry
    	mov rsi, 8
    	call revBytes
    
    	mov rdi, filedata+ELF64_Ehdr.e_phoff
    	mov rsi, 8
    	call revBytes

    	mov rdi, filedata+ELF64_Ehdr.e_shoff
    	mov rsi, 8
    	call revBytes

    	mov rdi, filedata+ELF64_Ehdr.e_flags
    	mov rsi, 4
    	call revBytes

    	mov rdi, filedata+ELF64_Ehdr.e_ehsize
    	mov rsi, 2
    	call revBytes

    	mov rdi, filedata+ELF64_Ehdr.e_phentsize
    	mov rsi, 2
    	call revBytes
	
printType:
	mov	rdi, TypeMsg
	call	strPrint
	movzx	rdi, word [filedata + ELF32_Ehdr.e_type]
	mov	rsi, TYPEstr
	call	findAndPrint
	cmp	rax, -1
	jne	printMachine
	mov	rdi, IDUnknown
	call	strPrint

printMachine:
	mov	rdi, MachineMsg
	call	strPrint
	movzx	rdi, word [filedata + ELF32_Ehdr.e_machine]
	mov	rsi, ARCHstr
	call	findAndPrint
	cmp	rax, -1
	jne	printVer
	mov	rdi, ARCHUnknown
	call	strPrint

printVer:
	mov	rdi, VersionMsg
	call	strPrint
	xor	rdi, rdi
	mov	edi, dword [filedata + ELF32_Ehdr.e_version]
	call	uint64Print
	mov	rdi,linenew
	call	strPrint

	cmp	byte [filedata + 4], 1
	je	Ver32
	cmp	byte [filedata + 4], 2
	je 	Ver64

Ver32:
	mov	rdi, EPAMsg
	call	strPrint
	xor	rdi, rdi
	mov	edi, dword [filedata + ELF32_Ehdr.e_entry]
	mov	rsi, 4
	call	nHexPrint
	mov	rdi, linenew
	call	strPrint

	mov	rdi, SPHMsg
	call 	strPrint
    	xor 	rdi, rdi
	mov 	edi, dword [filedata + ELF32_Ehdr.e_phoff]
	call 	uint64Print
	mov 	rdi, BintoF    
	call 	strPrint

	mov	rdi, SSHMsg
	call strPrint
	xor rdi, rdi
	mov edi, dword [filedata + ELF32_Ehdr.e_shoff]
	call uint64Print
	mov	rdi, BintoF    
	call strPrint

	mov rdi, FlagsMsg
	call strPrint
	xor rdi, rdi
	mov edi, dword [filedata + ELF32_Ehdr.e_flags]
	mov rsi, 4
	call nHexPrint
	mov	rdi, linenew
	call strPrint

	mov	rdi, STHMsg
	call strPrint
	movzx rdi, word [filedata + ELF32_Ehdr.e_ehsize]
	call uint64Print
	mov	rdi, Bytes
	call strPrint

	mov	rdi, SizePHMsg
	call strPrint
	movzx rdi, word [filedata + ELF32_Ehdr.e_phentsize]
	call uint64Print
	mov	rdi, Bytes
	call strPrint

	mov	rdi, NPHMsg
	call strPrint
	xor rdi, rdi
	movzx rdi, word [filedata + ELF32_Ehdr.e_phnum]
	call uint64Print
	mov	rdi, linenew
	call strPrint

	mov	rdi, SiSHMsg
	call strPrint
	movzx rdi, word [filedata + ELF32_Ehdr.e_shentsize]
	call uint64Print
	mov	rdi, Bytes
	call strPrint

	mov	rdi, NSHMsg
	call strPrint
	xor rdi, rdi
	movzx rdi, word [filedata + ELF32_Ehdr.e_shnum]
	call uint64Print
	mov	rdi, linenew
	call strPrint

	mov	rdi, SHSTIMsg
	call strPrint
	xor rdi, rdi
	movzx rdi, word [filedata + ELF32_Ehdr.e_shstrndx]
	call uint64Print
	mov	rdi, linenew
	call strPrint

	jmp printSHT
	
Ver64:
	mov	rdi, EPAMsg
	call	strPrint
	mov	rdi, [filedata + ELF64_Ehdr.e_entry]
	mov	rsi, 8
	call	nHexPrint
	mov	rdi, linenew
	call	strPrint

	mov	rdi, SPHMsg
	call 	strPrint
	mov 	rdi, [filedata + ELF64_Ehdr.e_phoff]
	call 	uint64Print
	mov 	rdi, BintoF    
	call 	strPrint

	mov	rdi, SSHMsg
	call strPrint
	mov edi, [filedata + ELF64_Ehdr.e_shoff]
	call uint64Print
	mov	rdi, BintoF    
	call strPrint

	mov rdi, FlagsMsg
	call strPrint
	xor rdi, rdi
	mov edi, dword [filedata + ELF64_Ehdr.e_flags]
	mov rsi, 4
	call nHexPrint
	mov	rdi, linenew
	call strPrint

	mov	rdi, STHMsg
	call strPrint
	movzx rdi, word [filedata + ELF64_Ehdr.e_ehsize]
	call uint64Print
	mov	rdi, Bytes
	call strPrint

	mov	rdi, SizePHMsg
	call strPrint
	movzx rdi, word [filedata + ELF64_Ehdr.e_phentsize]
	call uint64Print
	mov	rdi, Bytes
	call strPrint

	mov	rdi, NPHMsg
	call strPrint
	xor rdi, rdi
	movzx rdi, word [filedata + ELF64_Ehdr.e_phnum]
	call uint64Print
	mov	rdi, linenew
	call strPrint

	mov	rdi, SiSHMsg
	call strPrint
	movzx rdi, word [filedata + ELF64_Ehdr.e_shentsize]
	call uint64Print
	mov	rdi, Bytes
	call strPrint

	mov	rdi, NSHMsg
	call strPrint
	xor rdi, rdi
	movzx rdi, word [filedata + ELF64_Ehdr.e_shnum]
	call uint64Print
	mov	rdi, linenew
	call strPrint

	mov	rdi, SHSTIMsg
	call strPrint
	xor rdi, rdi
	movzx rdi, word [filedata + ELF64_Ehdr.e_shstrndx]
	call uint64Print
	mov	rdi, linenew
	call strPrint

printSHT:
	mov	rdi, linenew
	call	strPrint
	mov	rdi, SectionHdrStr
	call	strPrint
	mov	rdi, linenew
	call	strPrint
	mov	rdi, SectionStr
	call	strPrint
	
	cmp	byte [filedata + 4], 1
	je	SHT32
	cmp	byte [filedata + 4], 2
	je 	SHT64

SHT32:
	mov eax, [filedata+ELF32_Ehdr.e_shoff]
    	lea rax, [filedata+eax]
    	mov [sectionHdr], rax

    	mov ax, [filedata+ELF32_Ehdr.e_shentsize]
    	mov [shentsize], ax
    
    	mov ax, [filedata+ELF32_Ehdr.e_shnum]
    	mov [shnum], ax

 	xor rax, rax
    	mov ax, [filedata+ELF32_Ehdr.e_shstrndx]
    	movzx ebx, word [shentsize]
    	mul ebx
    	add rax, [sectionHdr]
    	mov eax, [rax + ELF32_Shdr.sh_offset]

    	mov [shstrtab], rax
    	mov qword [tmp], 0
	
printSHT32Loop:
    	xor rax, rax
    	mov ax, [shnum]
    	cmp qword [tmp], rax
    	jge printPHT

    	mov rdi, [tmp]
    	call uint64Print
    	lea rdi, [separate]
    	call strPrint
    	
    	mov rax, [tmp]
    	movzx ebx, word [shentsize]
    	mul ebx
    	add rax, [sectionHdr]
	
    	mov [sec], rax
    	mov edi, [rax+ELF32_Shdr.sh_name]
    	add rdi, [shstrtab]
    	add rdi, filedata
    	call strPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_type]
    	lea rsi, [shtypeStr]
    	call findAndPrint

 	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_addr]
    	mov rsi, 4
    	call nHexPrint

   	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_offset]
    	mov rsi, 4
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_size]
    	mov rsi, 4
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_entsize]
    	mov rsi, 4
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_flags]
	mov [section_flag], edi
	and edi, 0x1
	cmp edi, 0x1
	jne checkSectionA32
	mov edi, flagW
	call strPrint
checkSectionA32:
	mov edi, [section_flag]
	and edi, 0x2
	cmp edi, 0x2
	jne checkSectionX32
	mov edi, flagA
	call strPrint
checkSectionX32:
	mov edi, [section_flag]
	and edi, 0x4
	cmp edi, 0x4
	jne checkSectionM32
	mov edi, flagX
	call strPrint
checkSectionM32:
	mov edi, [section_flag]
	and edi, 0x10
	cmp edi, 0x10
	jne checkSectionS32
	mov edi, flagM
	call strPrint
checkSectionS32:
	mov edi, [section_flag]
	and edi, 0x20
	cmp edi, 0x20
	jne checkSectionI32
	mov edi, flagS
	call strPrint
checkSectionI32:
	mov edi, [section_flag]
	and edi, 0x40
	cmp edi, 0x40
	jne checkSectionL32
	mov edi, flagI
	call strPrint
checkSectionL32:
	mov edi, [section_flag]
	and edi, 0x80
	cmp edi, 0x80
	jne checkSectionO32
	mov edi, flagL
	call strPrint
checkSectionO32:
	mov edi, [section_flag]
	and edi, 0x100
	cmp edi, 0x100
	jne checkSectionG32
	mov edi, flagO
	call strPrint
checkSectionG32:
	mov edi, [section_flag]
	and edi, 0x200
	cmp edi, 0x200
	jne checkSectionT32
	mov edi, flagG
	call strPrint
checkSectionT32:
	mov edi, [section_flag]
	and edi, 0x400
	cmp edi, 0x400
	jne checkSectionE32
	mov edi, flagT
	call strPrint
checkSectionE32:
	mov edi, [section_flag]
	and edi, 0x80000000
	cmp edi, 0x80000000
	jne goNextS32
	mov edi, flagE
	call strPrint


    	;mov rsi, 4
    	;call nHexPrint
goNextS32:
    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_link]
    	call uint64Print

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_info]
    	call uint64Print

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF32_Shdr.sh_addralign]
    	call uint64Print

    	lea rdi, [linenew]
    	call strPrint

    	inc qword [tmp]
    	jmp printSHT32Loop

SHT64:
	mov rax, [filedata+ELF64_Ehdr.e_shoff]
    	lea rax, [filedata+rax]
    	mov [sectionHdr], rax

    	mov ax, [filedata+ELF64_Ehdr.e_shentsize]
    	mov [shentsize], ax

    	mov ax, [filedata+ELF64_Ehdr.e_shnum]
    	mov [shnum], ax

    	xor rax, rax
    	mov ax, [filedata+ELF64_Ehdr.e_shstrndx]
    	movzx ebx, word [shentsize]
    	mul ebx
    	add rax, [sectionHdr]
    	mov rax, [rax + ELF64_Shdr.sh_offset]

    	mov [shstrtab], rax
    	mov qword [tmp], 0

printSHT64Loop:
    	xor rax, rax
    	mov ax, [shnum]
    	cmp qword [tmp], rax
    	jge printPHT

    	mov rdi, [tmp]
    	call uint64Print
    	lea rdi, [separate]
    	call strPrint
    
    	mov rax, [tmp]
    	movzx ebx, word [shentsize]
    	mul ebx
    	add rax, [sectionHdr]

    	mov [sec], rax
    	mov edi, [rax+ELF64_Shdr.sh_name]
    	add rdi, [shstrtab]
    	add rdi, filedata
    	call strPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF64_Shdr.sh_type]
    	lea rsi, [shtypeStr]
    	call findAndPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Shdr.sh_addr]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Shdr.sh_offset]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Shdr.sh_size]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov rdi, [rax+ELF64_Shdr.sh_entsize]
	    mov rsi, 8
	    call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	mov rax, [sec]
	xor rdi, rdi
	mov rdi, [rax+ELF64_Shdr.sh_flags]
	mov [section_flag], edi
	and edi, 0x1
	cmp edi, 0x1
	jne checkSectionA64
	mov edi, flagW
	call strPrint
checkSectionA64:
	mov edi, [section_flag]
	and edi, 0x2
	cmp edi, 0x2
	jne checkSectionX64
	mov edi, flagA
	call strPrint
checkSectionX64:
	mov edi, [section_flag]
	and edi, 0x4
	cmp edi, 0x4
	jne checkSectionM64
	mov edi, flagX
	call strPrint
checkSectionM64:
	mov edi, [section_flag]
	and edi, 0x10
	cmp edi, 0x10
	jne checkSectionS64
	mov edi, flagM
	call strPrint
checkSectionS64:
	mov edi, [section_flag]
	and edi, 0x20
	cmp edi, 0x20
	jne checkSectionI64
	mov edi, flagS
	call strPrint
checkSectionI64:
	mov edi, [section_flag]
	and edi, 0x40
	cmp edi, 0x40
	jne checkSectionL64
	mov edi, flagI
	call strPrint
checkSectionL64:
	mov edi, [section_flag]
	and edi, 0x80
	cmp edi, 0x80
	jne checkSectionO64
	mov edi, flagL
	call strPrint
checkSectionO64:
	mov edi, [section_flag]
	and edi, 0x100
	cmp edi, 0x100
	jne checkSectionG64
	mov edi, flagO
	call strPrint
checkSectionG64:
	mov edi, [section_flag]
	and edi, 0x200
	cmp edi, 0x200
	jne checkSectionT64
	mov edi, flagG
	call strPrint
checkSectionT64:
	mov edi, [section_flag]
	and edi, 0x400
	cmp edi, 0x400
	jne checkSectionE64
	mov edi, flagT
	call strPrint
checkSectionE64:
	mov edi, [section_flag]
	and edi, 0x80000000
	cmp edi, 0x80000000
	jne goNextS64
	mov edi, flagE
	call strPrint


    	;mov rsi, 4
    	;call nHexPrint
goNextS64:

	    ;mov rsi, 4
	    ;call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF64_Shdr.sh_link]
	    call uint64Print

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF64_Shdr.sh_info]
	    call uint64Print

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF64_Shdr.sh_addralign]
	    call uint64Print

	    lea rdi, [linenew]
	    call strPrint

	    inc qword [tmp]
	    jmp printSHT64Loop


printPHT:
	mov	rdi, linenew
	call	strPrint
	mov	rdi, ProgramHdrStr
	call	strPrint
	mov	rdi, linenew
	call	strPrint
	mov	rdi, SegmentStr
	call	strPrint

	cmp	byte [filedata + 4], 1
	je	PHT32
	cmp	byte [filedata + 4], 2
	je 	PHT64
	jmp	exit

PHT32:
	mov eax, [filedata+ELF32_Ehdr.e_phoff]
    	lea rax, [filedata+eax]
    	mov [programHdr], rax

    	mov ax, [filedata+ELF32_Ehdr.e_phentsize]
    	mov [phentsize], ax

    	mov ax, [filedata+ELF32_Ehdr.e_phnum]
    	mov [phnum], ax
    	mov qword [tmp], 0

printPHT32Loop:
	    xor rax, rax
	    mov ax, [phnum]
	    cmp qword [tmp], rax
	    jge exit

	    mov rax, [tmp]
	    movzx ebx, word [phentsize]
	    mul ebx
	    add rax, [programHdr]

	    mov [sec], rax
	    xor rdi, rdi
	    mov edi, [rax+ELF32_Phdr.p_type]
	    lea rsi, [ptypeStr]
	    call findAndPrint

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF32_Phdr.p_offset]
	    mov rsi, 4
	    call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF32_Phdr.p_vaddr]
	    mov rsi, 4
	    call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF32_Phdr.p_paddr]
	    mov rsi, 4
	    call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF32_Phdr.p_filesz]
	    mov rsi, 4
	    call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov rdi, [rax+ELF32_Phdr.p_memsz]
	    mov rsi, 4
	    call nHexPrint

	    lea rdi, [separate]
	    call strPrint

	mov rax, [sec]
	xor rdi, rdi
	mov edi, [rax+ELF32_Phdr.p_flags]
	mov [program_flag], edi
	and edi, 0x1
	cmp edi, 0x1
	jne checkProgramW32
	mov rdi, flagE
	call strPrint
checkProgramW32:
	mov edi, [program_flag]
	and edi, 0x2
	cmp edi, 0x2
	jne checkProgramR32
	mov rdi, flagW
	call strPrint
checkProgramR32:
	mov edi, [program_flag]
	and edi, 0x4
	cmp edi, 0x4
	jne goNextP32
	mov rdi, flagR
	call strPrint


	    ;mov rsi, 4
	    ;call nHexPrint
goNextP32:
	    lea rdi, [separate]
	    call strPrint

	    mov rax, [sec]
	    xor rdi, rdi
	    mov edi, [rax+ELF32_Phdr.p_align]
	    mov rsi, 4
	    call nHexPrint
	    
	    lea rdi, [linenew]
	    call strPrint

	    inc qword [tmp]
	    jmp printPHT32Loop	

PHT64:
	mov rax, [filedata+ELF64_Ehdr.e_phoff]
    	lea rax, [filedata+rax]
    	mov [programHdr], rax

    	mov ax, [filedata+ELF64_Ehdr.e_phentsize]
    	mov [phentsize], ax

    	mov ax, [filedata+ELF64_Ehdr.e_phnum]
    	mov [phnum], ax
    	mov qword [tmp], 0

printPHT64Loop:
    	xor rax, rax
    	mov ax, [phnum]
    	cmp qword [tmp], rax
    	jge exit

    	mov rax, [tmp]
    	movzx ebx, word [phentsize]
    	mul ebx
    	add rax, [programHdr]

    	mov [sec], rax
    	xor rdi, rdi
    	mov edi, [rax+ELF64_Phdr.p_type]
    	lea rsi, [ptypeStr]
    	call findAndPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Phdr.p_offset]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Phdr.p_vaddr]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Phdr.p_paddr]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Phdr.p_filesz]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov rdi, [rax+ELF64_Phdr.p_memsz]
    	mov rsi, 8
    	call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
    	xor rdi, rdi
    	mov edi, [rax+ELF64_Phdr.p_flags]
	mov [program_flag], edi
	and edi, 0x1
	cmp edi, 0x1
	jne checkProgramW64
	mov rdi, flagE
	call strPrint
checkProgramW64:
	mov edi, [program_flag]
	and edi, 0x2
	cmp edi, 0x2
	jne checkProgramR64
	mov rdi, flagW
	call strPrint
checkProgramR64:
	mov edi, [program_flag]
	and edi, 0x4
	cmp edi, 0x4
	jne goNextP64
	mov rdi, flagR
	call strPrint

goNextP64:
    	;mov rsi, 4
    	;call nHexPrint

    	lea rdi, [separate]
    	call strPrint

    	mov rax, [sec]
   	xor rdi, rdi
    	mov rdi, [rax+ELF64_Phdr.p_align]
    	mov rsi, 8
    	call nHexPrint
    
    	lea rdi, [linenew]
    	call strPrint

    	inc qword [tmp]
    	jmp printPHT64Loop

usage:
	mov	rdi, UsageMsg	
	call	strPrint
	jmp	exit

cannot_open:
	mov	rdi, CantOpenMsg
	call	strPrint
	jmp	exit

not_ELF:
	mov	rdi, NotElfMsg
	call	strPrint
	jmp	exit

hexBytePrint:
	push	rbp
	mov	rbp, rsp
	and rdi, 0xff
    	push rdi
    	shr rdi, 4 ; take higher nibble to print first
    	movzx rax, byte [hexa+rdi]
    	push 0 ; local variable for printing character
    	mov byte [rsp], al
    	lea rdi, [rsp]
   	call strPrint
	pop rdi
	pop rdi
	and rdi, 0xf
	movzx rax, byte [hexa+rdi]
	push 0 ; local variable for printing character
	mov byte [rsp], al
	lea rdi, [rsp]
	call strPrint
	   
	leave
	ret

nHexPrint:
	push rbp
    	mov rbp, rsp
    	push r8
    	push r9

    	mov r8, rsi
    	mov r9, rdi
hexPrintLoop:
    	cmp r8, 0
    	je nHexPrintEnd
    	dec r8
    	mov rdi, r9
    	mov rcx, 8
    	imul ecx, r8d
    	shr rdi, cl
    	call hexBytePrint
   	jmp hexPrintLoop


nHexPrintEnd:
    	pop r9
   	pop r8
    	leave
    	ret

findAndPrint:
    	push rbp
    	mov rbp, rsp
    
    	cmp rdi, 0
    	jz printStr
findLoop:
    	cmp qword [rsi], -1
    	je unknown
   	cmp rdi, [rsi]
    	je printStr
    	inc rsi
    	jmp findLoop


unknown:
    	mov rax, -1
    	jmp epil

printStr:
    	mov rdi, rsi
    	add rdi, 8
    	call strPrint

epil:
    	leave
    	ret

revBytes:
   	push rbp
   	mov rbp, rsp

    	xor rcx, rcx
    	xor rdx, rdx
pushLoop: 
    	cmp rcx, rsi
    	je popLoop
    
    	movzx rax, byte [rdi+rcx]
    	push rax

    	inc rcx
    	jmp pushLoop

popLoop:
    	cmp rdx, rsi
    	je revBytesEnd
    
    	pop rax
    	mov [rdi+rdx], al

    	inc rdx
    	jmp popLoop


revBytesEnd:
    	leave
    	ret

exit:
	mov	rax, 60
	mov	rdi, 0
	syscall