#!/bin/bash

# Add this to startup to remove bluetooth devices

# Remove K380 keyboard
bluetoothctl remove F4:73:35:89:50:BE

# Remove Microsoft Bluetooth Mouse
bluetoothctl remove F5:67:60:8F:D3:39