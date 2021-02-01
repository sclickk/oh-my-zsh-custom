#!/bin/bash

welcome() {
	local user=$USER;
	local kernel=$(uname -s);
	local kernel_version=$(uname -r);
	local machine=$(uname -n);
	local architecture=$(arch);
	local tz=$(cat /etc/timezone);
	local date_local=$(date --iso-8601=s);
	local date_utc=$(date --iso-8601=s --utc);
	local uptime=$(uptime -p);
	local package_count=$(dpkg --list | grep "^ii" | wc -l);
	local cpuList=$(cat /proc/cpuinfo | grep "model name" | sed "s/model name.*: //");
	local cpuName=$(echo "$cpuList" | head -1);
	local cores=$(echo "$cpuList" | wc -l);
	local ip=$(hostname -I);
	echo "🌌 $machine";
	echo "🌽 $kernel $kernel_version";
	echo "🐚 $SHELL";
	echo "👤 $user"
	echo "⚡ $uptime";
	echo "📦 dpkg: $package_count packages";
	echo "🧠 $cpuName ($cores)";
	echo "🌐 $ip";
	echo "⏰ $date_utc UTC";
	echo "⏰ $date_local $tz";
}
