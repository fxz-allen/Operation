viewstatus() {
        echo -n "/proc/sys/net/core/wmem_max is: "
        cat /proc/sys/net/core/wmem_max

        echo -n "/proc/sys/net/core/rmem_max is: "
        cat /proc/sys/net/core/rmem_max

        echo -n "/proc/sys/net/ipv4/tcp_wmem is: "
        cat /proc/sys/net/ipv4/tcp_wmem

        echo -n "/proc/sys/net/ipv4/tcp_rmem is: "
        cat /proc/sys/net/ipv4/tcp_rmem

        echo -n "/proc/sys/net/ipv4/tcp_mem is: "
        cat /proc/sys/net/ipv4/tcp_mem

        echo -n "/proc/sys/net/core/netdev_max_backlog is: "
        cat /proc/sys/net/core/netdev_max_backlog

        echo -n "/proc/sys/net/core/somaxconn is: "
        cat /proc/sys/net/core/somaxconn

        echo -n "/proc/sys/net/ipv4/tcp_max_syn_backlog is: "
        cat /proc/sys/net/ipv4/tcp_max_syn_backlog

        echo -n "/proc/sys/net/ipv4/tcp_retries2 is: "
        cat /proc/sys/net/ipv4/tcp_retries2

        echo -n "/proc/sys/net/ipv4/tcp_keepalive_time is: "
        cat /proc/sys/net/ipv4/tcp_keepalive_time

        echo -n "/proc/sys/net/ipv4/tcp_keepalive_intvl is: "
        cat /proc/sys/net/ipv4/tcp_keepalive_intvl

        echo -n "/proc/sys/net/ipv4/tcp_keepalive_probes is: "
        cat /proc/sys/net/ipv4/tcp_keepalive_probes

        echo -n "/proc/sys/net/ipv4/tcp_syn_retries is: "
        cat /proc/sys/net/ipv4/tcp_syn_retries

        echo -n "/proc/sys/net/ipv4/tcp_synack_retries is: "
        cat /proc/sys/net/ipv4/tcp_synack_retries

        echo -n "/proc/sys/net/ipv4/tcp_timestamps is: "
        cat /proc/sys/net/ipv4/tcp_timestamps

        echo
}

tuneargs() {
        echo "873200" > /proc/sys/net/core/wmem_max
        echo "873200" > /proc/sys/net/core/rmem_max
        echo "8192      436600  873200" > /proc/sys/net/ipv4/tcp_wmem
        echo "32768     436600  873200" > /proc/sys/net/ipv4/tcp_rmem
        echo "786432 1048576 1572864" > /proc/sys/net/ipv4/tcp_mem
        echo "2048" > /proc/sys/net/core/netdev_max_backlog
        echo "8192" > /proc/sys/net/core/somaxconn
        echo "81920" > /proc/sys/net/ipv4/tcp_max_syn_backlog
        echo "5" > /proc/sys/net/ipv4/tcp_retries2
        echo "60" > /proc/sys/net/ipv4/tcp_keepalive_time
        echo "30" > /proc/sys/net/ipv4/tcp_keepalive_intvl
        echo "3" > /proc/sys/net/ipv4/tcp_keepalive_probes
        echo "3" > /proc/sys/net/ipv4/tcp_syn_retries
        echo "3" > /proc/sys/net/ipv4/tcp_synack_retries
        echo "5" > /proc/sys/net/ipv4/tcp_reordering

        echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse
        echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle
        echo "30" > /proc/sys/net/ipv4/tcp_fin_timeout
        echo "1024    65000"  > /proc/sys/net/ipv4/ip_local_port_range
        echo "10000" > /proc/sys/net/ipv4/tcp_max_tw_buckets
        echo 1000000 >  /proc/sys/net/netfilter/nf_conntrack_max
        echo 10800 >  /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established

        # 参见RFC1323, syn包无响应
        echo "1" > /proc/sys/net/ipv4/tcp_timestamps

        #route del -net 0.0.0.0 gw 113.106.185.1 metric 100 dev eth1
        #route add -net 0.0.0.0 gw 113.106.185.1
        #route add -net 123.0.0.0 gw 58.249.61.1 netmask 255.0.0.0
#        route del -net 0.0.0.0 gw 58.22.107.161 metric 100
#        route add -net 0.0.0.0 gw 58.22.107.161
#
#        ip route flush table tel
#        ip route add default via 121.207.227.1 dev eth0 src 121.207.227.58 table tel
#        ip rule add from 121.207.227.58 table tel
#
#        ip route flush table cnc
#        ip route add default via 58.22.107.161 dev eth1 src 58.22.107.163 table cnc
#        ip rule add from 58.22.107.163 table cnc
}

echo "before tunning:"
viewstatus

# tuning tcp kernel arguments
tuneargs

echo "after tunning:"
viewstatus
