nmap 127.0.0.1 -p 9990,9991,9992,9993,9050,9051,9052,9053 --open -sT  -T5|grep open;
echo "Killing old tor";
for nu in $(ps aux |grep "torrc"|grep -v "kate\|aux" |cut -d' ' -f6 ; );
do  sudo kill -9 $nu;
echo "Run a check to see if we kill tor";
nmap 127.0.0.1 -p 9990,9991,9992,9993,9050,9051,9052,9053 --open -sT  -T5|grep open;
done