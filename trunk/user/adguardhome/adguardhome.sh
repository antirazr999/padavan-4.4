#!/bin/sh

change_dns() {
  if [ "$(nvram get adg_redirect)" = 1 ]; then
    sed -i '/no-resolv/d' /etc/storage/dnsmasq/dnsmasq.conf
    sed -i '/server=127.0.0.1/d' /etc/storage/dnsmasq/dnsmasq.conf
    cat >> /etc/storage/dnsmasq/dnsmasq.conf << EOF
no-resolv
server=127.0.0.1#5335
EOF
    /sbin/restart_dhcpd
    logger -t "AdGuardHome" "添加DNS转发到5335端口"
  fi
}

del_dns() {
  sed -i '/no-resolv/d' /etc/storage/dnsmasq/dnsmasq.conf
  sed -i '/server=127.0.0.1#5335/d' /etc/storage/dnsmasq/dnsmasq.conf
  /sbin/restart_dhcpd
}

set_iptable()
{
  if [ "$(nvram get adg_redirect)" = 2 ]; then
    IPS="`ifconfig | grep "inet addr" | grep -v ":127" | grep "Bcast" | awk '{print $2}' | awk -F : '{print $2}'`"
    for IP in $IPS
    do
      iptables -t nat -A PREROUTING -p tcp -d $IP --dport 53 -j REDIRECT --to-ports 5335 >/dev/null 2>&1
      iptables -t nat -A PREROUTING -p udp -d $IP --dport 53 -j REDIRECT --to-ports 5335 >/dev/null 2>&1
    done

    IPS="`ifconfig | grep "inet6 addr" | grep -v " fe80::" | grep -v " ::1" | grep "Global" | awk '{print $3}'`"
    for IP in $IPS
    do
      ip6tables -t nat -A PREROUTING -p tcp -d $IP --dport 53 -j REDIRECT --to-ports 5335 >/dev/null 2>&1
      ip6tables -t nat -A PREROUTING -p udp -d $IP --dport 53 -j REDIRECT --to-ports 5335 >/dev/null 2>&1
    done
      logger -t "AdGuardHome" "重定向53端口"
  fi
}

clear_iptable()
{
	OLD_PORT="5335"
	IPS="`ifconfig | grep "inet addr" | grep -v ":127" | grep "Bcast" | awk '{print $2}' | awk -F : '{print $2}'`"
	for IP in $IPS
	do
		iptables -t nat -D PREROUTING -p udp -d $IP --dport 53 -j REDIRECT --to-ports $OLD_PORT >/dev/null 2>&1
		iptables -t nat -D PREROUTING -p tcp -d $IP --dport 53 -j REDIRECT --to-ports $OLD_PORT >/dev/null 2>&1
	done

	IPS="`ifconfig | grep "inet6 addr" | grep -v " fe80::" | grep -v " ::1" | grep "Global" | awk '{print $3}'`"
	for IP in $IPS
	do
		ip6tables -t nat -D PREROUTING -p udp -d $IP --dport 53 -j REDIRECT --to-ports $OLD_PORT >/dev/null 2>&1
		ip6tables -t nat -D PREROUTING -p tcp -d $IP --dport 53 -j REDIRECT --to-ports $OLD_PORT >/dev/null 2>&1
	done
}

getconfig(){
  adg_file="/etc/storage/adg.sh"
  if [ ! -f "$adg_file" ] || [ ! -s "$adg_file" ] ; then
	  cat > "$adg_file" <<-\EEE
bind_host: 0.0.0.0
bind_port: 3030
language: zh-cn
beta_bind_port: 0
users:
- name: root
  password: 
auth_attempts: 500
block_auth_min: 1
http_proxy: ""
rlimit_nofile: 0
debug_pprof: false
web_session_ttl: 720
dns:
  bind_hosts:
  - 0.0.0.0
  port: 5335
  statistics_interval: 1
  querylog_enabled: true
  querylog_file_enabled: true
  querylog_interval: 1
  querylog_size_memory: 1000
  anonymize_client_ip: false
  protection_enabled: true
  blocking_mode: nxdomain
  blocking_ipv4: ""
  blocking_ipv6: ""
  blocked_response_ttl: 10
  parental_block_host: family-block.dns.adguard.com
  safebrowsing_block_host: standard-block.dns.adguard.com
  ratelimit: 20
  ratelimit_whitelist: []
  refuse_any: true
  upstream_dns:
  - https://dns.alidns.com/dns-query
  upstream_dns_file: /root/AdguardHome_Upstreams.txt
  bootstrap_dns:
  - tls://223.5.5.5
  all_servers: true
  fastest_addr: false
  allowed_clients: []
  disallowed_clients: []
  blocked_hosts:
  - version.bind
  - id.server
  - hostname.bind
  cache_size: 0
  cache_ttl_min: 0
  cache_ttl_max: 60
  bogus_nxdomain: []
  aaaa_disabled: false
  enable_dnssec: true
  edns_client_subnet: true
  max_goroutines: 300
  ipset: []
  filtering_enabled: true
  filters_update_interval: 24
  parental_enabled: false
  safesearch_enabled: false
  safebrowsing_enabled: false
  safebrowsing_cache_size: 1048576
  safesearch_cache_size: 1048576
  parental_cache_size: 1048576
  cache_time: 30
  rewrites:
  - domain: 'translate.googleapis.com'
    answer: hkg07s37-in-f14.1e100.net
  blocked_services: []
  local_domain_name: lan
  resolve_clients: true
  local_ptr_upstreams: []
tls:
  enabled: false
  server_name: ""
  force_https: false
  port_https: 443
  port_dns_over_tls: 853
  port_dns_over_quic: 784
  port_dnscrypt: 0
  dnscrypt_config_file: ""
  allow_unencrypted_doh: false
  strict_sni_check: false
  certificate_chain: ""
  private_key: ""
  certificate_path: ""
  private_key_path: ""
filters:
- enabled: true
  url: https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  name: AdGuard DNS filter
  id: 1
- enabled: false
  url: https://adaway.org/hosts.txt
  name: AdAway Default Blocklist
  id: 2
- enabled: false
  url: https://www.malwaredomainlist.com/hostslist/hosts.txt
  name: MalwareDomainList.com Hosts List
  id: 4
- enabled: true
  url: https://easylist-downloads.adblockplus.org/easylistchina.txt
  name: EasyList-CN
  id: 1636299944
- enabled: true
  url: https://easylist-downloads.adblockplus.org/easyprivacy.txt
  name: EasyList-Privacy
  id: 1636299945
- enabled: true
  url: https://www.i-dont-care-about-cookies.eu/abp/
  name: cookies
  id: 1636299946
- enabled: true
  url: https://gitee.com/xinggsf/Adblock-Rule/raw/master/rule.txt
  name: 乘风-广告规则
  id: 1636299947
- enabled: true
  url: https://gitee.com/xinggsf/Adblock-Rule/raw/master/mv.txt
  name: 乘风-视频规则
  id: 1636299948
whitelist_filters: []
user_rules:
- '||funshion.com^'
dhcp:
  enabled: false
  interface_name: ""
  dhcpv4:
    gateway_ip: ""
    subnet_mask: ""
    range_start: ""
    range_end: ""
    lease_duration: 86400
    icmp_timeout_msec: 1000
    options: []
  dhcpv6:
    range_start: ""
    lease_duration: 86400
    ra_slaac_only: false
    ra_allow_slaac: false
clients: []
log_compress: false
log_localtime: false
log_max_backups: 0
log_max_size: 100
log_max_age: 3
log_file: ""
verbose: false
schema_version: 10

EEE
	  chmod 755 "$adg_file"
  fi
}

start_adg(){
  mkdir -p /tmp/AdGuardHome
	mkdir -p /etc/storage/AdGuardHome
	getconfig
	change_dns
	set_iptable
	logger -t "AdGuardHome" "启动 AdGuardHome"
	eval "AdGuardHome -c $adg_file -w /tmp/AdGuardHome -v" &
}

stop_adg(){
  rm -rf /tmp/AdGuardHome
  logger -t "AdGuardHome" "停止 AdGuardHome"
  killall -9 AdGuardHome
  del_dns
  clear_iptable
}

case $1 in
start)
	start_adg
	;;
stop)
	stop_adg
	;;
*)
	echo "check"
	;;
esac
