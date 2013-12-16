#!/bin/bash                                                                                                                                                          

export WORK_DIR=/home/natasha.che/ea416

cd ${WORK_DIR}
cd ..
. .bash_profile
. .bashrc

cd ${WORK_DIR}

./gen_date.pl $1 > dates

echo "Started running ${WORK_DIR}/cal.sh"
${WORK_DIR}/cal.sh

echo "Started running ${WORK_DIR}/getdata.sh"
${WORK_DIR}/getdata.sh

echo "Started running ${WORK_DIR}/upload1.sh"
${WORK_DIR}/upload1.sh

echo "Started running ${WORK_DIR}/upload.sh"
${WORK_DIR}/upload.sh


exit 0
