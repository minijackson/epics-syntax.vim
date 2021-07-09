if exists("b:current_syntax")
    finish
endif

syntax region dbString start=/"/ skip=/\\"/ end=/"/ contains=@dbMacro,dbStringSpecial,dbStringKeyword,dbStringFreq
syntax match dbStringSpecial /\\"/ contained
syntax match dbStringSpecial /\\\\/ contained
syntax keyword dbStringKeyword Full Incremental supervisory closed_loop Passive Event All Specified Mask contained
syntax match dbStringKeyword "I/O Intr" contained
syntax match dbStringKeyword "Every Time" contained
syntax match dbStringKeyword "On Change" contained
syntax match dbStringKeyword "When Zero" contained
syntax match dbStringKeyword "When Non-zero" contained
syntax match dbStringKeyword "Transition To Zero" contained
syntax match dbStringKeyword "Transition To Non-zero" contained
syntax match dbStringFreq /\d\+\(\.\d*\)\? \a\+/ contained contains=dbInteger,dbFloat,dbStringFreqUnit
syntax keyword dbStringFreqUnit Hertz Hz contained
syntax match dbStringFreqUnit /hours\?/ contained
syntax match dbStringFreqUnit /minutes\?/ contained
syntax match dbStringFreqUnit /seconds\?/ contained

syntax cluster dbMacro contains=dbParenMacro,dbBraceMacro
syntax region dbParenMacro matchgroup=dbMacroDelimiter start=/$(/ end=/)/ contains=dbVariableWithDefault,dbVariable contained
syntax region dbBraceMacro matchgroup=dbMacroDelimiter start=/${/ end=/}/ contains=dbVariableWithDefault,dbVariable contained
syntax match dbVariable /\I\i*/ contained
syntax match dbVariableWithDefault /\I\i*/ nextgroup=dbVariableWithDefaultOpr skipwhite contained
syntax match dbVariableWithDefaultOpr /=/ nextgroup=@dbValue skipwhite contained

syntax match dbInteger /\<\d\+\>/
syntax match dbFloat /\<\d\+\.\d*\>/

syntax cluster dbValue contains=@dbMacro,dbString,dbInteger,dbFloat

syntax match dbComment /#.*/ contains=dbTodo
syntax keyword dbTodo TODO FIXME XXX contained

syntax keyword dbKeyword include substitute
syntax keyword dbRecordType aai aao ai ao aSub bi bo calc calcout compress dfanout event fanout histogram longin longout int64in int64out mbbi mbbiDirect mbbo mbboDirect permissive printf sel seq state stringin stringout lsi lso subArray sub waveform xxx contained
syntax keyword dbFieldType A A1CD A1NV A1PV AAWAIT ACKS ACKT ACQM ACQT ACT ADEL AFT AFTC AFVL ALG ALRT ALST AOFF APST AQT AR ASCD ASG ASLO ASNV ASP ASPV ASWAIT ATIME AWAIT AWCT B B0 B1 B2 B3 B4 B5 B6 B7 B8 B9 BA BB BC BCPT BD BE BF BKPT BPTR BRSV BSCD BSNV BSPV BSWAIT BUSY C CADR CALC CLCV CMD CMND COPYTO COSV CPT CSTA CVB D D01CA D01CV D01DA D01EU D01HR D01LR D01LV D01NE D01NV D01PR D01PV D02CA D02CV D02DA D02EU D02HR D02LR D02LV D02NE D02NV D02PR D02PV D03CA D03CV D03DA D03EU D03HR D03LR D03LV D03NE D03NV D03PR D03PV D04CA D04CV D04DA D04EU D04HR D04LR D04LV D04NE D04NV D04PR D04PV D05CA D05CV D05DA D05EU D05HR D05LR D05LV D05NE D05NV D05PR D05PV D06CA D06CV D06DA D06EU D06HR D06LR D06LV D06NE D06NV D06PR D06PV D07CA D07CV D07DA D07EU D07HR D07LR D07LV D07NE D07NV D07PR D07PV D08CA D08CV D08DA D08EU D08HR D08LR D08LV D08NE D08NV D08PR D08PV D09CA D09CV D09DA D09EU D09HR D09LR D09LV D09NE D09NV D09PR D09PV D10CA D10CV D10DA D10EU D10HR D10LR D10LV D10NE D10NV D10PR D10PV D11CA D11CV D11DA D11EU D11HR D11LR D11LV D11NE D11NV D11PR D11PV D12CA D12CV D12DA D12EU D12HR D12LR D12LV D12NE D12NV D12PR D12PV D13CA D13CV D13DA D13EU D13HR D13LR D13LV D13NE D13NV D13PR D13PV D14CA D14CV D14DA D14EU D14HR D14LR D14LV D14NE D14NV D14PR D14PV D15CA D15CV D15DA D15EU D15HR D15LR D15LV D15NE D15NV D15PR D15PV D16CA D16CV D16DA D16EU D16HR D16LR D16LV D16NE D16NV D16PR D16PV D17CA D17CV D17DA D17EU D17HR D17LR D17LV D17NE D17NV D17PR D17PV D18CA D18CV D18DA D18EU D18HR D18LR D18LV D18NE D18NV D18PR D18PV D19CA D19CV D19DA D19EU D19HR D19LR D19LV D19NE D19NV D19PR D19PV D20CA D20CV D20DA D20EU D20HR D20LR D20LV D20NE D20NV D20PR D20PV D21CA D21CV D21DA D21EU D21HR D21LR D21LV D21NE D21NV D21PR D21PV D22CA D22CV D22DA D22EU D22HR D22LR D22LV D22NE D22NV D22PR D22PV D23CA D23CV D23DA D23EU D23HR D23LR D23LV D23NE D23NV D23PR D23PV D24CA D24CV D24DA D24EU D24HR D24LR D24LV D24NE D24NV D24PR D24PV D25CA D25CV D25DA D25EU D25HR D25LR D25LV D25NE D25NV D25PR D25PV D26CA D26CV D26DA D26EU D26HR D26LR D26LV D26NE D26NV D26PR D26PV D27CA D27CV D27DA D27EU D27HR D27LR D27LV D27NE D27NV D27PR D27PV D28CA D28CV D28DA D28EU D28HR D28LR D28LV D28NE D28NV D28PR D28PV D29CA D29CV D29DA D29EU D29HR D29LR D29LV D29NE D29NV D29PR D29PV D30CA D30CV D30DA D30EU D30HR D30LR D30LV D30NE D30NV D30PR D30PV D31CA D31CV D31DA D31EU D31HR D31LR D31LV D31NE D31NV D31PR D31PV D32CA D32CV D32DA D32EU D32HR D32LR D32LV D32NE D32NV D32PR D32PV D33CA D33CV D33DA D33EU D33HR D33LR D33LV D33NE D33NV D33PR D33PV D34CA D34CV D34DA D34EU D34HR D34LR D34LV D34NE D34NV D34PR D34PV D35CA D35CV D35DA D35EU D35HR D35LR D35LV D35NE D35NV D35PR D35PV D36CA D36CV D36DA D36EU D36HR D36LR D36LV D36NE D36NV D36PR D36PV D37CA D37CV D37DA D37EU D37HR D37LR D37LV D37NE D37NV D37PR D37PV D38CA D38CV D38DA D38EU D38HR D38LR D38LV D38NE D38NV D38PR D38PV D39CA D39CV D39DA D39EU D39HR D39LR D39LV D39NE D39NV D39PR D39PV D40CA D40CV D40DA D40EU D40HR D40LR D40LV D40NE D40NV D40PR D40PV D41CA D41CV D41DA D41EU D41HR D41LR D41LV D41NE D41NV D41PR D41PV D42CA D42CV D42DA D42EU D42HR D42LR D42LV D42NE D42NV D42PR D42PV D43CA D43CV D43DA D43EU D43HR D43LR D43LV D43NE D43NV D43PR D43PV D44CA D44CV D44DA D44EU D44HR D44LR D44LV D44NE D44NV D44PR D44PV D45CA D45CV D45DA D45EU D45HR D45LR D45LV D45NE D45NV D45PR D45PV D46CA D46CV D46DA D46EU D46HR D46LR D46LV D46NE D46NV D46PR D46PV D47CA D47CV D47DA D47EU D47HR D47LR D47LV D47NE D47NV D47PR D47PV D48CA D48CV D48DA D48EU D48HR D48LR D48LV D48NE D48NV D48PR D48PV D49CA D49CV D49DA D49EU D49HR D49LR D49LV D49NE D49NV D49PR D49PV D50CA D50CV D50DA D50EU D50HR D50LR D50LV D50NE D50NV D50PR D50PV D51CA D51CV D51DA D51EU D51HR D51LR D51LV D51NE D51NV D51PR D51PV D52CA D52CV D52DA D52EU D52HR D52LR D52LV D52NE D52NV D52PR D52PV D53CA D53CV D53DA D53EU D53HR D53LR D53LV D53NE D53NV D53PR D53PV D54CA D54CV D54DA D54EU D54HR D54LR D54LV D54NE D54NV D54PR D54PV D55CA D55CV D55DA D55EU D55HR D55LR D55LV D55NE D55NV D55PR D55PV D56CA D56CV D56DA D56EU D56HR D56LR D56LV D56NE D56NV D56PR D56PV D57CA D57CV D57DA D57EU D57HR D57LR D57LV D57NE D57NV D57PR D57PV D58CA D58CV D58DA D58EU D58HR D58LR D58LV D58NE D58NV D58PR D58PV D59CA D59CV D59DA D59EU D59HR D59LR D59LV D59NE D59NV D59PR D59PV D60CA D60CV D60DA D60EU D60HR D60LR D60LV D60NE D60NV D60PR D60PV D61CA D61CV D61DA D61EU D61HR D61LR D61LV D61NE D61NV D61PR D61PV D62CA D62CV D62DA D62EU D62HR D62LR D62LV D62NE D62NV D62PR D62PV D63CA D63CV D63DA D63EU D63HR D63LR D63LV D63NE D63NV D63PR D63PV D64CA D64CV D64DA D64EU D64HR D64LR D64LV D64NE D64NV D64PR D64PV D65CA D65CV D65DA D65EU D65HR D65LR D65LV D65NE D65NV D65PR D65PV D66CA D66CV D66DA D66EU D66HR D66LR D66LV D66NE D66NV D66PR D66PV D67CA D67CV D67DA D67EU D67HR D67LR D67LV D67NE D67NV D67PR D67PV D68CA D68CV D68DA D68EU D68HR D68LR D68LV D68NE D68NV D68PR D68PV D69CA D69CV D69DA D69EU D69HR D69LR D69LV D69NE D69NV D69PR D69PV D70CA D70CV D70DA D70EU D70HR D70LR D70LV D70NE D70NV D70PR D70PV DATA DDLY DESC DISA DISP DISS DISV DLY0 DLY1 DLY2 DLY3 DLY4 DLY5 DLY6 DLY7 DLY8 DLY9 DLYA DLYB DLYC DLYD DLYE DLYF DO0 DO1 DO2 DO3 DO4 DO5 DO6 DO7 DO8 DO9 DOA DOB DOC DOD DOE DOF DOL DOL0 DOL1 DOL2 DOL3 DOL4 DOL5 DOL6 DOL7 DOL8 DOL9 DOLA DOLB DOLC DOLD DOLE DOLF DOPT DPT DPV DPVT DRVH DRVL DSET DSTATE DTYP E EFLG EGU EGUF EGUL EIST EISV EIVL ELST ELSV ELVL EOFF EP EPVT ESLO EVNT EXSC F FAZE FFO FFST FFSV FFVL FLNK FMT FPTS FRST FRSV FRVL FTA FTB FTC FTD FTE FTF FTG FTH FTI FTJ FTK FTL FTM FTN FTO FTP FTQ FTR FTS FTST FTSV FTT FTU FTVA FTVB FTVC FTVD FTVE FTVF FTVG FTVH FTVI FTVJ FTVK FTVL FTVM FTVN FTVO FTVP FTVQ FTVR FTVS FTVT FTVU FVST FVSV FVVL G GO H HASH HHSV HIGH HIHI HOPR HSV HYST I IACT IHIL ILIL IMP INAM INAV INBV INCV INDV INDX INEV INFV INGV INHV INIT INIV INJV INKV INLV INP INP0 INP1 INP2 INP3 INP4 INP5 INP6 INP7 INP8 INP9 INPA INPB INPC INPD INPE INPF INPG INPH INPI INPJ INPK INPL INPM INPN INPO INPP INPQ INPR INPS INPT INPU INX IVLS IVOA IVOV J K KILL L LA LABL LALM LB LBRK LC LCNT LD LE LEN LF LFLG LG LH LI LINR LJ LK LL LLIM LLSV LNK0 LNK1 LNK2 LNK3 LNK4 LNK5 LNK6 LNK7 LNK8 LNK9 LNKA LNKB LNKC LNKD LNKE LNKF LOAD LOLO LOPR LOW LPAU LSET LSTP LSV M MALM MASK MCNT MDEL MLIS MLOK MLST MP MPST MPTS N NAME NEA NEB NEC NED NEE NEF NEG NEH NEI NEJ NEK NEL NELM NEM NEN NEO NEP NEQ NER NES NET NEU NEVA NEVB NEVC NEVD NEVE NEVF NEVG NEVH NEVI NEVJ NEVK NEVL NEVM NEVN NEVO NEVP NEVQ NEVR NEVS NEVT NEVU NIST NISV NIVL NLST NOA NOB NOBT NOC NOD NOE NOF NOG NOH NOI NOJ NOK NOL NOM NON NOO NOP NOQ NOR NORD NOS NOT NOU NOVA NOVB NOVC NOVD NOVE NOVF NOVG NOVH NOVI NOVJ NOVK NOVL NOVM NOVN NOVO NOVP NOVQ NOVR NOVS NOVT NOVU NP NPTS NSAM NSEV NSTA NUSE NVL O OAFT OAQT OAR OCAL OCLV ODLY ODPV OEP OEVT OFF OFFS OFLG OGO OIF OLDN OLEN OLOAD OMOD OMSL ONAM ONP ONST ONSV ONVA ONVB ONVC ONVD ONVE ONVF ONVG ONVH ONVI ONVJ ONVK ONVL ONVM ONVN ONVO ONVP ONVQ ONVR ONVS ONVT ONVU OOPT OPPV OPRE ORAW ORBV OROC ORPC ORPV OSC OSM OSP OSV OTPV OUSE OUT OUTA OUTB OUTC OUTD OUTE OUTF OUTG OUTH OUTI OUTJ OUTK OUTL OUTM OUTN OUTO OUTP OUTQ OUTR OUTS OUTT OUTU OUTV OVAL OVLA OVLB OVLC OVLD OVLE OVLF OVLG OVLH OVLI OVLJ OVLK OVLL OVLM OVLN OVLO OVLP OVLQ OVLR OVLS OVLT OVLU P P1AR P1CA P1CP P1CV P1DV P1EP P1EU P1FC P1FE P1FI P1FS P1FW P1HR P1LR P1LV P1NV P1PA P1PP P1PR P1PV P1RA P1SI P1SM P1SP P1WD P2AR P2CA P2CP P2CV P2DV P2EP P2EU P2FC P2FE P2FI P2FS P2FW P2HR P2LR P2LV P2NV P2PA P2PP P2PR P2PV P2RA P2SI P2SM P2SP P2WD P3AR P3CA P3CP P3CV P3DV P3EP P3EU P3FC P3FE P3FI P3FS P3FW P3HR P3LR P3LV P3NV P3PA P3PP P3PR P3PV P3RA P3SI P3SM P3SP P3WD P4AR P4CA P4CP P4CV P4DV P4EP P4EU P4FC P4FE P4FI P4FS P4FW P4HR P4LR P4LV P4NV P4PA P4PP P4PR P4PV P4RA P4SI P4SM P4SP P4WD PACT PASM PAUS PBRK PCPT PDLY PHAS PINI POVL PPN PPNR PPV PRE PREC PRIO PROC PUTF PVAL PXSC Q R R1CV R1DL R1LV R1NV R1PV R2CV R2DL R2LV R2NV R2PV R3CV R3DL R3LV R3NV R3PV R4CV R4DL R4LV R4NV R4PV RARM RBV RDES RDLY REFD RES ROFF RPCL RPRO RPV RPVT RSET RVAL S SADR SC SCAN SDEF SDEL SDIS SELL SELM SELN SEVR SGNL SHFT SIML SIMM SIMS SIOL SIZV SM SMOO SMSG SNAM SP SPTR SPVT STAT STEP SUBL SVAL SVL SVST SVSV SVVL SXST SXSV SXVL T T1CD T1NV T1PV T2CD T2NV T2PV T3CD T3NV T3PV T4CD T4NV T4PV TEST TESV TEVL THST THSV THVL TIME TLAP TOLP TPRO TPV TSE TSEL TTST TTSV TTVL TVST TVSV TVVL TWST TWSV TWVL U UDF UDFS ULIM UNSV VAL VALA VALB VALC VALD VALE VALF VALG VALH VALI VALJ VALK VALL VALM VALN VALO VALP VALQ VALR VALS VALT VALU VERS WAIT WCNT WDOG WDPT WDTH WFLG WPTR WTNG XSC ZNAM ZRST ZRSV ZRVL ZSV contained

syntax keyword dbRecord record nextgroup=dbRecordParameters,dbComment skipwhite skipempty
syntax region dbRecordParameters start=/(/ end=/)/ nextgroup=dbRecordContent contains=dbRecordType,@dbValue,dbComment skipwhite skipempty contained
syntax region dbRecordContent start=/{/ end=/}/ contains=dbField,dbComment skipempty contained

syntax keyword dbField field nextgroup=dbFieldParameters,dbComment skipwhite skipempty
syntax region dbFieldParameters start=/(/ end=/)/ contains=dbFieldType,@dbValue,dbComment contained

highlight default link dbString String
highlight default link dbStringSpecial Special
highlight default link dbStringKeyword Special
highlight default link dbStringFreqUnit Special
highlight default link dbMacroDelimiter Delimiter
highlight default link dbVariable Identifier
highlight default link dbVariableWithDefault Identifier
highlight default link dbVariableWithDefaultOpr Operator
highlight default link dbInteger Number
highlight default link dbFloat Float
highlight default link dbTodo Todo
highlight default link dbComment Comment
highlight default link dbKeyword Keyword
highlight default link dbRecordType Type
highlight default link dbFieldType Type
highlight default link dbRecord Keyword
highlight default link dbField Keyword
