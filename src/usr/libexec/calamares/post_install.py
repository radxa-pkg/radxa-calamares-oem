# /usr/bin/env python3 
# -*- coding: utf-8 -*-

import os,subprocess

# Remove live user service
rm_live_user_service = '''
[Unit]
Description=Remove live user

[Service]
Type=oneshot
ExecStartPre=userdel -rf radxa
ExecStartPre=userdel -rf rock
ExecStart=systemctl disable remove-live-user.service

[Install]
WantedBy=multi-user.target
'''
# remove calamares service
# TODO: add calamares-settings when this becomes a package
rm_calamares_service = '''
[Unit]
Description=Remove Calamares

[Service]
Type=oneshot
ExecStartPre=apt remove -y calamares 
ExecStartPre=apt autoremove -y 
ExecStart=systemctl disable remove-calamares.service

[Install]
WantedBy=multi-user.target'''
with open('/usr/lib/systemd/system/remove-live-user.service', 'w') as f:
    f.write(rm_live_user_service)
with open('/usr/lib/systemd/system/remove-calamares.service', 'w') as f:
    f.write(rm_calamares_service)
subprocess.run(['systemctl', 'enable', 'remove-live-user.service'])
subprocess.run(['systemctl', 'enable', 'remove-calamares.service'])
