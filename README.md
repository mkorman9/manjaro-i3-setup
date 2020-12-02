Port of my regular Ubuntu setup (https://github.com/mkorman9/ubuntu-setup) for Arch-based systems.

# Install software

Install NVIDIA proprietary drivers (if necessary)
```bash
inxi -G  # displays graphic adapters
sudo mhwd -a pci nonfree 0300  # installs nonfree driver
# reboot
mhwd -li  # verify which driver is running

# Open settings with
sudo nvidia-settings
```

Regular stuff
```bash
sudo pacman -Syy
sudo pacman -Syu

sudo pacman -S base-devel \
               zsh \
               git \
               curl \
               wget \
               vim \
               nano \
               tree \
               jq \
               libxml2 \
               screen \
               tmux \
               unrar \
               netcat \
               nmap \
               tracroute \
               dnsutils \
               net-tools \
               htop \
               neofetch \
               libmpc \
               attr \
               binwalk \
               hashcat \
               docker
```

Desktop stuff
```bash
sudo pacman -S thunar \
               firefox \
               chromium \
               gimp \
               ffmpeg \
               vlc \
               audacity \
               obs-studio \
               pulseaudio \
               pavucontrol \
               qemu \
               libvirt \
               virt-manager \
               virt-viewer \
               code \
               intellij-idea-community-edition \
               jdk11-openjdk \
               jdk8-openjdk \
               go \
               graphviz
```

Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -s --batch
```

Install fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Configure Docker
```bash
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
# relog
```

Configure libvirt
```bash
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
```

Configure PulseAudio
```bash
systemctl --user start pulseaudio.socket
systemctl --user start pulseaudio.service
systemctl --user enable pulseaudio.socket
systemctl --user enable pulseaudio.service
```

Configure Java
```bash
archlinux-java status  # to list available versions
sudo archlinux-java set java-8-openjdk  # to select Java 8
```

Configure AUR
```bash
sudo mkdir /usr/local/src/aur && sudo chmod o+rwx /usr/local/src/aur
```

Install Spotify
```bash
cd /usr/local/src/aur
git clone https://aur.archlinux.org/spotify.git
cd spotify
makepkg -si

# In case of "FAILED (unknown public key <KEY ID>)"
gpg --keyserver pool.sks-keyservers.net --recv-key <KEY ID>
makepkg -si
```

Install widevine (for Netflix)
```bash
cd /usr/local/src/aur
git clone https://aur.archlinux.org/chromium-widevine.git
cd chromium-widevine
makepkg -si
```

Install Sublime
```bash
cd /usr/local/src/aur
git clone https://aur.archlinux.org/sublime-text-dev.git
cd sublime-text-dev
makepkg -si
sudo ln -s /usr/bin/subl3 /usr/bin/subl
```

Configure Python
```bash
mkdir ~/.virtualenvs

python -m venv ~/.virtualenvs/common_py3

sudo pacman -S python2 python2-pip python2-virtualenv
python2 -m virtualenv ~/.virtualenvs/common_py27

# For both virtual envs
pip install boto \
    ipython \
    numpy \
    matplotlib \
    paramiko \
    Pillow \
    pudb \
    pwntools \
    pycrypto \
    pyserial \
    requests \
    z3-solver \
    flask
```

# Interface tweaking

### Remap Caps Lock to Escape

Append to `~/.i3/config`
```
exec_always --no-startup-id xmodmap -e "clear lock"
exec_always --no-startup-id xmodmap -e "keycode 66 = Escape NoSymbol Escape"
```

### Change key-repeating speed

Append to `~/.i3/config`
```
exec_always --no-startup-id xset r rate 240 80
```

### Change wallpaper

- Download my wallpaper: https://drive.google.com/file/d/1d70qhHiSogltAjQFXmVq2D9EvT14hL8f/view
- Run `nitrogen` and select it
- Make it reappear on i3 restart by appending to `~/.i3/config`
```
exec --no-startup-id nitrogen --restore
```

Press `MOD+Shift+R` to refresh i3

### Move status bar to the top

- Open `~/.i3/config` and find `bar` section. Replace `position bottom` with `position top`
- For example
```
bar {
    position bottom
    ...
}
```

should become
```
bar {
    position top
}
```

Press `MOD+Shift+R` to refresh i3

### Change status bar layout

- Modify `/etc/i3status.conf` as a root
- Press `MOD+Shift+R` to refresh i3

### Make gaps between windows smaller

- Open `~/.i3/config` and find a line with `gaps inner`
- Replace it with something like `gaps inner 2`
- Press `MOD+Shift+R` to refresh i3

### Make focus not follow mouse

- Uncomment `# focus_follows_mouse no` in `~/.i3/config`
- Press `MOD+Shift+R` to refresh i3

### Modify locking app

- Open `~/.i3/config`
- Replace every use of `blurlock` with `i3lock -c 474747`
- Replace use of `i3exit lock` with `i3lock -c 474747`
- Press `MOD+Shift+R` to refresh i3

### Remove desktop overlay with the default shortcuts

- Edit `/usr/bin/start_conky_maia` as root
- Find and comment out a line with `conky1.10_shortcuts_maia`
- Relog (`WIN+0` -> `e`)

# Dot files

Copy from Ubuntu-specific repo - https://github.com/mkorman9/ubuntu-setup
