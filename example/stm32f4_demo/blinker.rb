#To (re)compile C bytecode:
#
#/path/to/mruby/bin/mrbc -Bblinker -oblinker.c blinker.rb
#

class Blinker
	include Arduino
	attr_accessor :interval ,:pin
	
	def initialize(pin, interval_ms)
		Serial2.println("new Blinker:pin=#{pin}, interval=#{interval_ms}[ms]")
		@pin = pin
		@interval = interval_ms
	end

	def blink_once
		#Serial2.println("start LED:#{@pin}")
		digitalWrite(@pin, HIGH)
		FreeRTOS.sleep(@interval)
		digitalWrite(@pin, LOW)
		FreeRTOS.sleep(@interval)
		#Serial2.println("end LED:#{@pin}")
		nil
	end
end