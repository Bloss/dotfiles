# show ip address
ip() {
	ip="$(ifconfig | grep -w inet | grep 'inet.*netmask.*broadcast' | cut -c6-21)"
	# yellow color print
	echo -e "\033[33m $ip \033[0m"
}
