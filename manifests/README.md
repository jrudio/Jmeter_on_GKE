## Wishlist

- auto port-forward vnc server via script
- startup script:
  - download user.properties (remote worker IP I believe)
  - download .jmx (has sensitive information baked in)
  - use Kubernetes Secrets
  - install expect from apt
  - create expect script to autofill the password prompt from vncserver
  - create a <home-dir>/.Xresources, otherwise it may gray out the vnc viewer[1]
  - If the above doesn't work then add the following to the ~/.vnc/xstartup file:
    ```
    unset SESSION_MANAGER
    exec /etc/X11/xinit/xinitrc
    ```
  - `apt install -y expect && touch /root/.Xresources`

  [1] https://wiki.parabola.nu/TightVNC - 6.3 Window manager issues
  [2] https://wiki.centos.org/HowTos/VNC-Server#Start_the_VNC_server - 2.5. Create xstartup scripts