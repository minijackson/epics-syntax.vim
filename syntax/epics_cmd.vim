" Documentation: https://epics.anl.gov/base/R3-14/12-docs/AppDevGuide/node19.html

syntax clear

"if exists("b:current_syntax")
"    finish
"endif

runtime! syntax/tcsh.vim

" Do not put 'cd' and 'exit' here, as they already are tcsh buitins
syntax keyword cmdBuiltin ClockTime_Report ClockTime_Shutdown asDumpHash asInit asSetFilename asSetSubstitutions ascar asdbdump asphag aspmem asprules aspuag astac callbackParallelThreads callbackSetQueueSize casr coreRelease date dbDumpBreaktable dbDumpDevice dbDumpDriver dbDumpField dbDumpFunction dbDumpMenu dbDumpPath dbDumpRecord dbDumpRecordType dbDumpRegistrar dbDumpVariable dbLoadDatabase dbLoadRecords dbLoadTemplate dbLockShowLocked dbNotifyDump dbPutAttribute dbPvdDump dbPvdTableSize dbReportDeviceConfig dbStateClear dbStateCreate dbStateSet dbStateShow dbStateShowAll dba dbap dbb dbc dbcar dbd dbel dbgf dbgrep dbhcr dbior dbl dbla dblsr dbnr dbp dbpf dbpr dbs dbsr dbstat dbtgf dbtpf dbtpn dbtr echo eltc epicsEnvSet epicsEnvShow epicsEnvUnset epicsMutexShowAll epicsParamShow epicsPrtEnvParams epicsThreadResume epicsThreadShow epicsThreadShowAll epicsThreadSleep errlog errlogInit errlogInit2 generalTimeReport gft help installLastResortEventProvider iocBuild iocInit iocLogInit iocLogPrefix iocLogShow iocPause iocRun iocshCmd iocshLoad iocshRun myExample_registerRecordDeviceDriver pft postEvent pwd registryDeviceSupportFind registryDriverSupportFind registryDump registryFunctionFind registryRecordTypeFind scanOnceSetQueueSize scanpel scanpiol scanppl setIocLogDisable taskwdShow tpn traceIocInit var

highlight default link cmdBuiltin tcshBuiltin
