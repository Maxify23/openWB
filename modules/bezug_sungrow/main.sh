#!/bin/bash
OPENWBBASEDIR=$(cd "$(dirname "$0")/../../" && pwd)
RAMDISKDIR="$OPENWBBASEDIR/ramdisk"
#DMOD="EVU"
DMOD="MAIN"

if [ ${DMOD} == "MAIN" ]; then
	MYLOGFILE="$RAMDISKDIR/openWB.log"
else
	MYLOGFILE="$RAMDISKDIR/evu.log"
fi

bash "$OPENWBBASEDIR/packages/legacy_run.sh" "modules.devices.sungrow.device" "counter" "$pv1_ipa" "$pv1_ida" "$sungrowsr" >>"$MYLOGFILE" 2>&1
ret=$?

openwbDebugLog $DMOD 2 "EVU RET: $ret"

cat "${RAMDISKDIR}/wattbezug"
