doorberry-piface
================

Doorberry port designed to work with the PiFace Digital

Description:
Guest presses doorbell and the system calls a SIP address and uses an USB soundcard to talk to them.
on the IP Phone keys 1 or 2 cca be used to trigger relay 1 or 2 to open the door.


Requirements:
- Raspian Pi
- Piface Digital
- usb soundcard
- Raspbian (OS)


Todo: 
- Currently just input 1 is used as "doorbell" switch.
- adding USB video support (capture or webcam)
- voicemail or similar if noones answers


uses following programs:
- Doorberry (original): https://github.com/mpodroid/door-berry)
- wireingPi (http://wiringpi.com/)
- pjsip (http://http://www.pjsip.org/)
- asterisk
