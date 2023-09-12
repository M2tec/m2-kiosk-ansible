sudo apt install unattended-upgrades

sudo systemctl status unattended-upgrades


sudo nano /etc/apt/apt.conf.d/50unattended-upgrades


Unattended-Upgrade::Origins-Pattern {
        "origin=Debian,codename=${distro_codename},label=Debian";
        "origin=Debian,codename=${distro_codename},label=Debian-Security";
        "origin=Debian,codename=${distro_codename}-security,label=Debian-Security";

        "origin=M2tec,codename=${distro_codename},label=M2tec";
};

// Python regular expressions, matching packages to exclude from upgrading
Unattended-Upgrade::Package-Blacklist {
};

Unattended-Upgrade::Mail "m.menheere@m2tec.nl";
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";

# Package list is updated every day this has to be done before the upgrade works. 
cat /etc/apt/apt.conf.d/20auto-upgrades 
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";

