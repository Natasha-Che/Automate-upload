hadoop fs -cat /user/hive/warehouse/tq_browser_os_distribution/*|zcat|sed 's/\x01/\t/g' >tq_browser_os_distribution

sort -t$'\t' -k 5 -n -r -o tq_browser_os_distribution1 tq_browser_os_distribution


${WORK_DIR}/calculate.pl >tq_browser_os_distribution2.xls
${WORK_DIR}/calculate5.pl > tq_browser_distribution.xls
${WORK_DIR}/calculate6.pl > tq_os_distribution.xls

sort -t$'\t' -k 2 -n -r -o tq_browser_distribution1.xls tq_browser_distribution.xls

sort -t$'\t' -k 2 -n -r -o tq_os_distribution1.xls tq_os_distribution.xls

${WORK_DIR}/calculate3.pl > tq_browser_distribution2.xls
${WORK_DIR}/calculate4.pl > tq_os_distribution2.xls


