#!/bin/bash

# Set up the routing needed for the simulation.
/setup.sh

# The following variables are available for use:
# - ROLE contains the role of this execution context, client or server
# - SERVER_PARAMS contains user-supplied command line parameters
# - CLIENT_PARAMS contains user-supplied command line parameters


#sysctl -w net.ipv4.conf.all.rp_filter=0
#sysctl -w net.ipv4.ip_nonlocal_bind=0    
#sysctl -p
#ifconfig eth0 down
#ifconfig eth0 up
    
/wait-for-it.sh sim:57832 -s -t 10

if [ -n "$TESTCASE" ]; then
    # interop runner compliance
    case "$TESTCASE" in
        "chacha20")
            ;;
        "handshake")
            ;;
        "http3")
            ;;
        "multiconnect")
            ;;
        "resumption")
            ;;
        "retry")
            ;;
        "transfer")
            ;;
        "zerortt")
            ;;
        *)
            exit 127
            ;;
    esac
fi
if [ -n "$ATTACK" ]; then
    case "$ATTACK" in
        "init-flood")
            python3 /scapy-quic/init-flood.py -t 193.167.100.100 -net 193.167.0.0/24  2>> /logs/stderr.log
    esac
fi

