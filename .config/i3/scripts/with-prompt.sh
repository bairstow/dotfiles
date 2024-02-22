#!/usr/bin/expect

set arg1 [lindex $argv 0]
set arg2 [lindex $argv 1]
spawn -noecho zsh
expect "~ "
send $arg1
send "\r"
send $arg2
interact
exit
