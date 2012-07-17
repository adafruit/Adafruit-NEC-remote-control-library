/*************************************************** 
  This is an example for the Adafruit NEC Remote Control

  Designed specifically to work with the Adafruit NEC Remote Control
	----> http://www.adafruit.com/products/389
  and IR Receiver Sensor
	----> http://www.adafruit.com/products/157

  These devices use IR to communicate, 1 pin is required to  
  interface
  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ****************************************************/
 

#include "Adafruit_NECremote.h"
 
// Connect a 38KHz remote control sensor to the pin below
#define IRpin         4
 
Adafruit_NECremote remote(IRpin);

void setup(void) {
  Serial.begin(115200);
  Serial.println("Ready to decode IR!");
}

int lastcode = -1;

void loop(void) {
  // You can set the listen() time out to 'n' seconds
  int c = remote.listen(5);  // seconds to wait before timing out!
  // Or you can wait 'forever' for a valid code
  //int c = remote.listen();  // Without a #, it means wait forever

  if (c >= 0) {
    Serial.print("Received code #"); 
    Serial.println(c, DEC);
    lastcode = c;
  } else if (c == -3) {
    Serial.print("Repeat (");
    Serial.print(lastcode);
    Serial.println(")");
  } else if (c == -2) {
    Serial.println("Data error");
  } else {
    Serial.println("Timed out waiting!");
  }
}