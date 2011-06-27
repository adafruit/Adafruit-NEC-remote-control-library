// Example sketch for NEC remote - public domain

#include "NECremote.h"
 
// Connect a 38KHz remote control sensor to the pin below
#define IRpin         4
 
NECremote remote(IRpin);

void setup(void) {
  Serial.begin(115200);
  Serial.println("Ready to decode IR!");
}


void loop(void) {
  // You can set the listen() time out to 'n' seconds
  int c = remote.listen(5);  // seconds to wait before timing out!
  // Or you can wait 'forever' for a valid code
  //int c = remote.listen();  // Without a #, it means wait forever

  if (c >= 0) {
    Serial.print("Received code #"); 
    Serial.println(c, DEC);
  } else {
    Serial.println("Timed out waiting!");
  }
}