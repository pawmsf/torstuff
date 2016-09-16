nmap 127.0.0.1 -p 9990,9991,9992,9993,9050,9051,9052,9053 --open -sT  -T5;
echo "Killing old tor";
./killall.sh;
sleep 1;
echo "Killing more..";
sudo service tor stop;
for nu in $(ps aux |grep "torrc"|grep -v "kate\|aux" |cut -d' ' -f6 ; );
do  sudo killall -9 $nu;

done
sleep 2;
echo "chek if all is down";
nmap 127.0.0.1 -p 9990,9991,9992,9993,9050,9051,9052,9053 --open -sT  -T5;

#for i in {0,1,2,3};
#do echo "starting node on 999$i and controll port on 9050";

#done
sleep 1
for b in {0,1,2,3};
do tor -f /home/baws/tor/$b/torrc_999$b ;
echo "starting node on 999$i and controll port on 9050";
sleep 3; 
done