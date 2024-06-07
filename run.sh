#!/bin/bash
set -xe


checkExitCode() {
if [ $? -ne 0 ]; then
    echo "Error"
    exit 1;
fi
}

INPUTS_DIR=${_tapisExecSystemInputDir}
OUTPUTS_DIR=${_tapisExecSystemOutputDir}
NAM=${OUTPUTS_DIR}/tmp.nam

BAS6=$(basename ${INPUTS_DIR}/input.ba6)
DIS=$(basename ${INPUTS_DIR}/input.dis)
BCF6=$(basename ${INPUTS_DIR}/input.bc6)
OC=$(basename ${INPUTS_DIR}/input.oc)
WEL=$(basename ${INPUTS_DIR}/input.wel)
DRN=$(basename ${INPUTS_DIR}/input.drn)
RCH=$(basename ${INPUTS_DIR}/input.rch)
HFB6=$(basename ${INPUTS_DIR}/input.hf6)
SIP=$(basename ${INPUTS_DIR}/input.sip)

echo "## MODFLOW-2005 name-file" >> $NAM
echo "LIST    7    LST" >> $NAM
echo "BAS6    1    $BAS6" >> $NAM
echo "DIS    10    $DIS" >> $NAM
echo "BCF6    11   $BCF6" >> $NAM
echo "OC    22    $OC" >> $NAM
echo "WEL    12    $WEL" >> $NAM
echo "DRN    13    $DRN" >> $NAM
echo "RCH    18    $RCH" >> $NAM
echo "HFB6    26    $HFB6" >> $NAM
echo "SIP    19    $SIP" >> $NAM
echo "DATA(BINARY)    50    CBB" >> $NAM
echo "DATA(BINARY)    51    HDS" >> $NAM
echo "DATA(BINARY)    52    DDN" >> $NAM

mf2005 $NAM

mv LST ${OUTPUTS_DIR}/LST
mv CBB ${OUTPUTS_DIR}/CBB
mv HDS ${OUTPUTS_DIR}/HDS
mv DDN ${OUTPUTS_DIR}/DDN
checkExitCode