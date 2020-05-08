#!/bin/bash
wget https://memcpy.io/files/2017-10-28/BCM-0a5c-6410.hcd
sudo cp BCM-0a5c-6410.hcd /lib/firmware/brcm/
sudo chmod 0644 /lib/firmware/brcm/BCM-0a5c-6410.hcd
