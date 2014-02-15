doorberry-piface
================

Doorberry port designed to work with the PiFace Digital

Description:
Guest presses doorbell (input 1), the system calls a configured SIP address and the guest to talk to them.
The IP Phone keypad 1 or 2 will trigger relay 1 or 2 to open the door.


Requirements:
- Raspian Pi
- Piface Digital
- usb soundcard
- Raspbian (OS)


Howto:
- "git clone https://github.com/achmed20/doorberry-piface"
- run "install.sh"


Todo: 
- Currently just input 1 is used as "doorbell" switch.
- adding USB video support (capture or webcam)
- voicemail or similar if noones answers


uses following programs:
- Doorberry (original): https://github.com/mpodroid/door-berry)
- wireingPi (http://wiringpi.com/)
- pjsip (http://http://www.pjsip.org/)
- asterisk
