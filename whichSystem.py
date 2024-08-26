#!/usr/bin/env python3
#coding: utf-8

import re
import sys
import subprocess

# Ensure correct usage
if len(sys.argv) != 2:
    print(f"\n[!] Usage: python3 {sys.argv[0]} <IP_ADDRESS>\n")
    sys.exit(1)

def get_ttl(ip_address):
    try:
        # Run the ping command and capture its output
        proc = subprocess.Popen(
            ["ping", "-c", "1", ip_address],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        out, err = proc.communicate()
        
        if proc.returncode != 0:
            raise Exception(f"Ping failed: {err.decode('utf-8')}")
        
        # Decode output and extract TTL value
        out = out.decode('utf-8')
        match = re.search(r"ttl=(\d+)", out)
        if not match:
            raise Exception("TTL value not found in ping output")
        
        ttl_value = match.group(1)
        return ttl_value
    
    except Exception as e:
        print(f"[!] Error: {e}")
        sys.exit(1)

def get_os(ttl):
    ttl = int(ttl)

    if 0 <= ttl <= 64:
        return "Linux"
    elif 65 <= ttl <= 128:
        return "Windows"
    else:
        return "Not Found"

if __name__ == '__main__':
    ip_address = sys.argv[1]

    ttl = get_ttl(ip_address)
    os_name = get_os(ttl)
    print(f"\n\t{ip_address} (TTL -> {ttl}): {os_name}")
