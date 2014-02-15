#import RPi.GPIO as GPIO
import time
import os
import pifacedigitalio as p

class RaspiBoard():


    def __init__(self):
        '''
        Constructor        '''
	p.init()
    
    def keyPressed(self):
	return p.digital_read(0)
        #pif = pifacedigitalio.PiFaceDigital()
	#return pif.switches[0].value
        #return 0
