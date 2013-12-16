#!/bin/bash                                                                                                                                                          

i=`head -1 dates`
task_date=$i

task_year=${task_date:0:4}
task_month=${task_date:4:2}
task_day=${task_date:6:2}

echo $task_year
echo $task_month
echo $task_day

rm -rf temptask
mkdir temptask

cp browser_os_dist1.sql temptask


sed -i s/\$YEAR/${task_year}/g temptask/browser_os_dist1.sql
sed -i s/\$MONTH/${task_month}/g temptask/browser_os_dist1.sql
sed -i s/\$DAY/${task_day}/g temptask/browser_os_dist1.sql


hive -f temptask/browser_os_dist1.sql
if [[ $? -ne 0 ]]; then
    echo $1 |mail -s "Failed!!$1 calculating stats step" natasha.che@openx.com
    exit 1
else
    echo $1 |mail -s "$1 calculating stats step finished" natasha.che@openx.com
fi








