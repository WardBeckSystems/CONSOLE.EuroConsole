/*
LED VU meter for Arduino and Adafruit NeoPixel LEDs. More info: http://learn.adafruit.com/led-ampli-tie/
 
 Hardware requirements:
 - Most Arduino or Arduino-compatible boards (ATmega 328P or better).
 - Adafruit Electret Microphone Amplifier (ID: 1063)
 - Adafruit Flora RGB Smart Pixels (ID: 1260)
 OR
 - Adafruit NeoPixel Digital LED strip (ID: 1138)
 - Optional: battery for portable use (else power through USB or adapter)
 Software requirements:
 - Adafruit NeoPixel library
 
 Connections:
 - 3.3V to mic amp +
 - GND to mic amp -
 - Analog pin to microphone output (configurable below)
 - Digital pin to LED data input (configurable below)
 See notes in setup() regarding 5V vs. 3.3V boards - there may be an
 extra connection to make and one line of code to enable or disable.
 
 Written by Adafruit Industries.  Distributed under the BSD license.
 This paragraph must be included in any redistribution.
 
 fscale function:
 Floating Point Autoscale Function V0.1
 Written by Paul Badger 2007
 Modified from code by Greg Shakar
 
 */

#include <Adafruit_NeoPixel.h>
#include <math.h>

#define N_PIXELS  57  // Number of pixels in strand
#define MIC_PIN   A5  // Microphone is attached to this analog pin
#define MIC_PIN_R  A1
#define LED_PIN    6  // NeoPixel LED strand is connected to this pin
#define LED_PIN_R   11
#define SAMPLE_WINDOW   30  // Sample window for average level
#define PEAK_HANG 10 //Time of pause before peak dot falls
#define PEAK_FALL 2 //Rate of falling peak dot
#define INPUT_FLOOR 10 //Lower range of analogRead input
#define INPUT_CEILING 200 //Max range of analogRead input, the lower the value the more sensitive (1023 = max)



byte peak = 16;      // Peak level of column; used for falling dots
byte peak_r = 16;
unsigned int sample;
unsigned int sample_r;

byte dotCount = 0;  //Frame counter for peak dot
byte dotHangCount = 0; //Frame counter for holding peak dot
byte dotCount_r = 0;
byte dotHangCount_r = 0;

Adafruit_NeoPixel strip = Adafruit_NeoPixel(N_PIXELS, LED_PIN, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip_r = Adafruit_NeoPixel(N_PIXELS, LED_PIN_R, NEO_GRB + NEO_KHZ800);

void setup() 
{
  // This is only needed on 5V Arduinos (Uno, Leonardo, etc.).
  // Connect 3.3V to mic AND TO AREF ON ARDUINO and enable this
  // line.  Audio samples are 'cleaner' at 3.3V.
  // COMMENT OUT THIS LINE FOR 3.3V ARDUINOS (FLORA, ETC.):
  //analogReference(EXTERNAL);


   //Serial.begin(9600);
  pinMode(MIC_PIN_R, INPUT);
  
  strip.begin();
  strip.show(); // Initialize all pixels to 'off'
  strip_r.begin();
  strip_r.show();

}

void loop() 
{
  unsigned long startMillis= millis();  // Start of sample window
  unsigned long startMillis_r = millis();
  float peakToPeak = 0;   // peak-to-peak level
  float peakToPeak_r = 0;

  unsigned int signalMax = 0;
  unsigned int signalMin = 1023;
  unsigned int c, y;
  
  unsigned int signalMax_r = 0;
  unsigned int signalMin_r = 1023;
  unsigned int c_r, y_r;


  // collect data for length of sample window (in mS)
  while (millis() - startMillis < SAMPLE_WINDOW)
  {
    sample = analogRead(MIC_PIN);
    if (sample < 1024)  // toss out spurious readings
    {
      if (sample > signalMax)
      {
        signalMax = sample;  // save just the max levels
      }
      else if (sample < signalMin)
      {
        signalMin = sample;  // save just the min levels
      }
    }
  }
  peakToPeak = signalMax - signalMin;  // max - min = peak-peak amplitude
 
   //Serial.println(peakToPeak);


  //Fill the strip with rainbow gradient
  for (int i=0;i<=strip.numPixels()-1;i++){
    strip.setPixelColor(i,Wheel(map(i,0,strip.numPixels()-1,30,150)));
  }


  //Scale the input logarithmically instead of linearly
  c = fscale(INPUT_FLOOR, INPUT_CEILING, strip.numPixels(), 0, peakToPeak, 2);

  


  if(c < peak) {
    peak = c;        // Keep dot on top
    dotHangCount = 0;    // make the dot hang before falling
  }
  if (c <= strip.numPixels()) { // Fill partial column with off pixels
    drawLine(strip.numPixels(), strip.numPixels()-c, strip.Color(0, 0, 0));
  }

  // Set the peak dot to match the rainbow gradient
  y = strip.numPixels() - peak;
  
  strip.setPixelColor(y-1,Wheel(map(y,0,strip.numPixels()-1,30,150)));

  strip.show();

  // Frame based peak dot animation
  if(dotHangCount > PEAK_HANG) { //Peak pause length
    if(++dotCount >= PEAK_FALL) { //Fall rate 
      peak++;
      dotCount = 0;
    }
  } 
  else {
    dotHangCount++; 
  }
  
  // collect data for length of sample window (in mS)
  while (millis() - startMillis_r < (SAMPLE_WINDOW *2))
  {
    sample_r = analogRead(MIC_PIN_R);
    if (sample_r < 1024)  // toss out spurious readings
    {
      if (sample_r > signalMax_r)
      {
        signalMax_r = sample_r;  // save just the max levels
      }
      else if (sample_r < signalMin_r)
      {
        signalMin_r = sample_r;  // save just the min levels
      }
    }
  }
  peakToPeak_r = signalMax_r - signalMin_r;  // max - min = peak-peak amplitude
 
   //Serial.println(peakToPeak_r);


  //Fill the strip with rainbow gradient
  for (int i=0;i<=strip_r.numPixels()-1;i++){
    strip_r.setPixelColor(i,Wheel_r(map(i,0,strip_r.numPixels()-1,30,150)));
  }


  //Scale the input logarithmically instead of linearly
  c_r = fscale(INPUT_FLOOR, INPUT_CEILING, strip_r.numPixels(), 0, peakToPeak_r, 2);

  


  if(c_r < peak_r) {
    peak_r = c_r;        // Keep dot on top
    dotHangCount_r = 0;    // make the dot hang before falling
  }
  if (c_r <= strip_r.numPixels()) { // Fill partial column with off pixels
    drawLine_r(strip_r.numPixels(), strip_r.numPixels()-c_r, strip_r.Color(0, 0, 0));
  }

  // Set the peak dot to match the rainbow gradient
  y_r = strip_r.numPixels() - peak_r;
  
  strip_r.setPixelColor(y_r-1,Wheel_r(map(y_r,0,strip_r.numPixels()-1,30,150)));

  strip_r.show();

  // Frame based peak dot animation
  if(dotHangCount_r > PEAK_HANG) { //Peak pause length
    if(++dotCount_r >= PEAK_FALL) { //Fall rate 
      peak_r++;
      dotCount_r = 0;
    }
  } 
  else {
    dotHangCount_r++; 
  }
}

//Used to draw a line between two points of a given color
void drawLine(uint8_t from, uint8_t to, uint32_t c) {
  uint8_t fromTemp;
  if (from > to) {
    fromTemp = from;
    from = to;
    to = fromTemp;
  }
  for(int i=from; i<=to; i++){
    strip.setPixelColor(i, c);
  }
}

void drawLine_r(uint8_t from, uint8_t to, uint32_t c_r) {
  uint8_t fromTemp;
  if (from > to) {
    fromTemp = from;
    from = to;
    to = fromTemp;
  }
  for(int i=from; i<=to; i++){
    strip_r.setPixelColor(i, c_r);
  }
}


float fscale( float originalMin, float originalMax, float newBegin, float
newEnd, float inputValue, float curve){

  float OriginalRange = 0;
  float NewRange = 0;
  float zeroRefCurVal = 0;
  float normalizedCurVal = 0;
  float rangedValue = 0;
  boolean invFlag = 0;


  // condition curve parameter
  // limit range

  if (curve > 10) curve = 10;
  if (curve < -10) curve = -10;

  curve = (curve * -.1) ; // - invert and scale - this seems more intuitive - postive numbers give more weight to high end on output 
  curve = pow(10, curve); // convert linear scale into lograthimic exponent for other pow function

  /*
   Serial.println(curve * 100, DEC);   // multply by 100 to preserve resolution  
   Serial.println(); 
   */

  // Check for out of range inputValues
  if (inputValue < originalMin) {
    inputValue = originalMin;
  }
  if (inputValue > originalMax) {
    inputValue = originalMax;
  }

  // Zero Refference the values
  OriginalRange = originalMax - originalMin;

  if (newEnd > newBegin){ 
    NewRange = newEnd - newBegin;
  }
  else
  {
    NewRange = newBegin - newEnd; 
    invFlag = 1;
  }

  zeroRefCurVal = inputValue - originalMin;
  normalizedCurVal  =  zeroRefCurVal / OriginalRange;   // normalize to 0 - 1 float

  // Check for originalMin > originalMax  - the math for all other cases i.e. negative numbers seems to work out fine 
  if (originalMin > originalMax ) {
    return 0;
  }

  if (invFlag == 0){
    rangedValue =  (pow(normalizedCurVal, curve) * NewRange) + newBegin;

  }
  else     // invert the ranges
  {   
    rangedValue =  newBegin - (pow(normalizedCurVal, curve) * NewRange); 
  }

  return rangedValue;
}


// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel(byte WheelPos) {
  if(WheelPos < 90) {
//ali-rem    return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
    return strip.Color(0, 255, 0); //ali-add
  } 
  else if(WheelPos < 120) {
    WheelPos -= 90;
//rem    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
    return strip.Color(255, 200, 0); //ali-add
  } 
  else {
    WheelPos -= 140;
//rem    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
    return strip.Color(255, 0, 0); //ali-add
  }
}

// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel_r(byte WheelPos_r) {
  if(WheelPos_r < 90) {
//ali-rem    return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
    return strip_r.Color(0, 255, 0); //ali-add
  } 
  else if(WheelPos_r < 120) {
    WheelPos_r -= 90;
//rem    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
    return strip_r.Color(255, 200, 0); //ali-add
  } 
  else {
    WheelPos_r -= 140;
//rem    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
    return strip_r.Color(255, 0, 0); //ali-add
  }
}





