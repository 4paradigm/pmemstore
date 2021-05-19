echo "[INFO] Waiting for both PMEM and DRAM tables to be recovered ..."
finished=$(cat rtidb/logs/tablet.info.log | grep "Finish loading" | sed "s/^.*Finish/Finish/" | wc -l)
while [ $finished -ne 2 ]
do
        sleep 1
        finished=$(cat rtidb/logs/tablet.info.log | grep "Finish loading" | sed "s/^.*Finish/Finish/" | wc -l)
done
cat rtidb/logs/tablet.info.log | grep "Finish loading" | sed "s/^.*Finish/Finish/"
echo "[INFO] Done"