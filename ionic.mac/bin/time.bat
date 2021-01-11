for i in {1..100}
do
./gradlew clean > /dev/null
start=`gdate +%s%3N`
# echo $start
eval $@ > /dev/null 2>&1
end=`gdate +%s%3N`
# echo $end
runtime=$((end-start))
echo $runtime
done
