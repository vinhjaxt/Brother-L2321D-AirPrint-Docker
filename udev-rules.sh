cat > /etc/udev/rules.d/99-usb-printer.rules <<'EOF'
ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="04f9", ENV{ID_MODEL_ID}=="0062", RUN+="/bin/bash /home/vinh/containers/printer/restart.sh"
EOF

udevadm control --reload
