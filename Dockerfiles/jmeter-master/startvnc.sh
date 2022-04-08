#! /usr/bin/expect -f

set timeout -1
set user root

set path_to_vnc_script [lindex $argv 0]
set password [lindex $argv 1]
set vnc_script_name "vnc.sh"
spawn $path_to_vnc_script$vnc_script_name

expect "Password:"
send -- "$password\n"

expect "Verify:"
send -- "$password\n"

expect "Would you like to enter a view-only password (y/n)?"
send -- "n\n"

expect eof
