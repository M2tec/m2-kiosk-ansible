swapon -s
swapoff -a
dd if=/dev/zero of=/swapfile bs=1M count=4096
mkswap /var/swap
swapon /var/swap
