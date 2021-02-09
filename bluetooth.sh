#!/usr/bin/expect -f

set prompt "#"
set address [lindex $argv 0]

spawn bluetoothctl
expect -re $prompt
send "remove $address\r"
expect "removed"
set timeout 45
send "scan on\r"
send_user "\nScanning for $address...\n"
expect -re ".*?NEW.*? Device $address"
send_user "\nScan successful!\n"
send "scan off\r"
expect -re $prompt
send "pair $address\r"
expect "Paired: yes"
send "connect $address\r"
expect -re $prompt
send "trust $address\r"
expect -re $prompt
send_user "\nShould be connected now.\n"
send "quit\r"
expect eof
