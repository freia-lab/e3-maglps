requireSnippet(modPath.cmd)

require(s7plc,1.4.0)

epicsEnvSet("PREFIX", "$(MAGLPS_PREFIX=CstatV-MagLPS)")
epicsEnvSet("PLCIP", "$(MAGLPS_IP=192.168.1.65)")

#var s7plcDebug 5

## Datablocks
epicsEnvSet("TCPPORTCPU", "3000")
epicsEnvSet("PLCPORTCPU", "PLCCPU")
epicsEnvSet("INSIZECPU", "8")
epicsEnvSet("OUTSIZECPU", "4")

epicsEnvSet("TCPPORTAF", "3001")
epicsEnvSet("PLCPORTAF", "PLCAF")
epicsEnvSet("INSIZEAF", "1232")
epicsEnvSet("OUTSIZEAF", "728")

epicsEnvSet("TCPPORTDIO", "3002")
epicsEnvSet("PLCPORTDIO", "PLCDIO")
epicsEnvSet("INSIZEDIO", "864")
epicsEnvSet("OUTSIZEDIO", "144")

epicsEnvSet("TCPPORTPSU", "3003")
epicsEnvSet("PLCPORTPSU", "PLCPSU")
epicsEnvSet("INSIZEPSU", "430")
epicsEnvSet("OUTSIZEPSU", "256")

s7plcConfigure("$(PLCPORTCPU)","$(PLCIP)",$(TCPPORTCPU),$(INSIZECPU),$(OUTSIZECPU),1,2500,500)
s7plcConfigure("$(PLCPORTAF)","$(PLCIP)",$(TCPPORTAF),$(INSIZEAF),$(OUTSIZEAF),1,2500,500)
s7plcConfigure("$(PLCPORTDIO)","$(PLCIP)",$(TCPPORTDIO),$(INSIZEDIO),$(OUTSIZEDIO),1,2500,500)
s7plcConfigure("$(PLCPORTPSU)","$(PLCIP)",$(TCPPORTPSU),$(INSIZEPSU),$(OUTSIZEPSU),1,2500,500)

dbLoadRecords(maglpsCPU.db, "PREFIX=$(PREFIX)")
dbLoadRecords(maglpsAF.db, "PREFIX=$(PREFIX)")
dbLoadRecords(maglpsDIO.db, "PREFIX=$(PREFIX)")
dbLoadRecords(maglpsPSU.db, "PREFIX=$(PREFIX)")
#dbLoadRecords(maglpsCPU.db, "PREFIX=$(PREFIX), PLC=$(PLCPORTCPU), HOLDHIGH=1.0")
#dbLoadRecords(maglpsAF.db, "PREFIX=$(PREFIX), PLC=$(PLCPORTAF)")
#dbLoadRecords(maglpsDIO.db, "PREFIX=$(PREFIX), PLC=$(PLCPORTDIO)")
#dbLoadRecords(maglpsPSU.db, "PREFIX=$(PREFIX), PLC=$(PLCPORTPSU)")

#dbLoadTemplate(../db/maglpsCPU.substitutions, "PREFIX=$(PREFIX)")
#dbLoadTemplate(../db/maglpsAF.substitutions, "PREFIX=$(PREFIX)")
#dbLoadTemplate(../db/maglpsDIO.substitutions, "PREFIX=$(PREFIX)")
#dbLoadTemplate(../db/maglpsPSU.substitutions, "PREFIX=$(PREFIX)")

