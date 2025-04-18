#!/bin/sh


start() {
		pid=`pidof ralinkiappd`
	    if [ "$pid" != "" ]; then
	        killall -q  ralinkiappd
		sleep 1
		killall -q  ralinkiappd
		sleep 1
		killall -q  ralinkiappd
		sleep 1
	    fi 
     
	    sysctl -wq net.ipv4.neigh.br0.base_reachable_time_ms=10000
	    sysctl -wq net.ipv4.neigh.br0.delay_first_probe_time=1
	    sysctl -wq net.ipv4.neigh.eth2.base_reachable_time_ms=10000
	    sysctl -wq net.ipv4.neigh.eth2.delay_first_probe_time=1
	    sysctl -wq net.ipv4.neigh.ra0.base_reachable_time_ms=10000
	    sysctl -wq net.ipv4.neigh.ra0.delay_first_probe_time=1
	    sysctl -wq net.ipv4.neigh.rai0.base_reachable_time_ms=10000
	    sysctl -wq net.ipv4.neigh.rai0.delay_first_probe_time=1
	    sysctl -wq net.ipv4.neigh.ra.base_reachable_time_ms=10000
	    sysctl -wq net.ipv4.neigh.ra.delay_first_probe_time=1
	    
	    iptables -A INPUT -i br0 -p udp --dport 3517 -j ACCEPT
	    iptables -A INPUT -i br0 -p tcp --dport 3517 -j ACCEPT
     
     	    ralinkiappd -wi rai0 -d 0 &
     	    ralinkiappd -wi ra0 -d 0 &
     	    ralinkiappd -wi ra -d 0 &

}





stop() {
    pid=`pidof ralinkiappd`
    if [ "$pid" != "" ]; then
        killall -q  ralinkiappd
	sleep 1
	killall -q  ralinkiappd
	sleep 1
	killall -q  ralinkiappd
	sleep 1
    fi
    
}


case "$1" in
        start)
            start
            ;;

        stop)
            stop
            ;;

        restart)
            stop
            start
            ;;

        *)
            echo $"Usage: $0 {start|stop|restart}"
esac
