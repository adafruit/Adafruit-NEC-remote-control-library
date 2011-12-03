// Basic timer-less NEC mini-remote library 

// MIT license

#if ARDUINO >= 100
 #include "Arduino.h"
#else
 #include "WProgram.h"
#endif

// what our timing resolution should be, larger is better
// as its more 'precise' - but too large and you wont get
// accurate timing
#define RESOLUTION 20 

class NECremote {
 public:
  NECremote(uint8_t pin);
  int16_t listen(int16_t maxwaitseconds = 0);

 private:
  uint8_t _irpin, _irpinport, _irpinmask;

  boolean timedout, timing;
  int32_t maxwaiting;

  uint16_t measurePulse(boolean state);
  uint8_t readNECbit();
};

