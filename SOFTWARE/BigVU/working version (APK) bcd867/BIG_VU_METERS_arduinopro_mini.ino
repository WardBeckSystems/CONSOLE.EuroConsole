
//20150609 - Calibration
// 20150601 - Addidtion of second dot
// 20150520 - Addition of pot for ceiling adjust
// 20150508 - adjust log scale
//20150505 - Changed variables for left and right

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
#define AUDIO_PIN_left   A1 // Line input left
#define AUDIO_PIN_right  A3   // Line Input Right
#define CEILING_CTRL A5  // Adjusts the ceiling scale of the meter
#define LED_PIN_left    6  // Left NeoPixel LED strand is connected to this pin
#define LED_PIN_right   9 // Right NeoPixel LED strand is connected to this pin
#define SAMPLE_WINDOW   35// 10 //30  // Sample window for average level = reaction Speed 
#define PEAK_HANG 1//10 //Time of pause before peak dot falls
#define PEAK_FALL 3//10 //Rate of falling peak dot
#define INPUT_FLOOR 4//20 //Lower range of analogRead input

//NEW SECOND PEAK
#define PEAK_HANG2 30 //Time of pause before peak dot falls
#define PEAK_FALL2 8 //Rate of falling peak dot



//replaced with a pot    #define INPUT_CEILING 500 //200 //Max range of analogRead input, the lower the value the more sensitive (1023 = max)



byte peak_left = 16;      // Peak level of column; used for falling dots
byte peak_right = 16;     // Peak level of column; used for falling dots



unsigned int sample_left;  // Left  input sample 
unsigned int sample_right; // Right input sample

int INPUT_CEILING;  // Top value of the Meter Scale
long CeilingCounter;  // Counter that only samples the pot  

byte dotCount_left = 0;  //Frame counter for peak dot
byte dotCount_right = 0;


byte dotHangCount_left = 0; //Frame counter for holding peak dot
byte dotHangCount_right = 0;

//NEW DOT
byte dotHangCount_left2 = 0; //Frame counter for holding peak dot
byte dotCount_left2 = 0;  //Frame counter for peak dot
byte peak_left2 = 16;      // Peak level of column; used for falling dots

byte dotHangCount_right2 = 0; //Frame counter for holding peak dot
byte dotCount_right2 = 0;  //Frame counter for peak dot
byte peak_right2 = 16;      // Peak level of column; used for falling dots


//Definition of Neopixel
Adafruit_NeoPixel strip_left = Adafruit_NeoPixel(N_PIXELS, LED_PIN_left, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip_right = Adafruit_NeoPixel(N_PIXELS, LED_PIN_right, NEO_GRB + NEO_KHZ800);

void setup() 
{
// This is only needed on 5V Arduinos (Uno, Leonardo, etc.).
// Connect 3.3V to mic AND TO AREF ON ARDUINO and enable this
// line.  Audio samples are 'cleaner' at 3.3V.
// COMMENT OUT THIS LINE FOR 3.3V ARDUINOS (FLORA, ETC.):
//analogReference(EXTERNAL);


 Serial.begin(9600);
   
  pinMode(AUDIO_PIN_right, INPUT);
  pinMode(AUDIO_PIN_left, INPUT);
  
  strip_left.begin();
  strip_left.show(); // Initialize all pixels to 'off'

  strip_right.begin();
  strip_right.show();

}

void loop() 
{
  
  unsigned long startMillis_left= millis();  // Start of sample window
  unsigned long startMillis_right = millis();
  float peakToPeak_left = 0;   // peak-to-peak level
  float peakToPeak_right = 0;


  unsigned int signalMax_left = 0;
  unsigned int signalMin_left = 1023;
  unsigned int c_left, y_left;
  
//NEW SECOND PEAK
  unsigned int c_left2, y_left2;
  unsigned int c_right2, y_right2;
  
  unsigned int signalMax_right = 0;
  unsigned int signalMin_right = 1023;
  unsigned int c_right, y_right;



  // collect data for length of sample window (in mS)
  while (millis() - startMillis_left < SAMPLE_WINDOW)
  {
    sample_left = analogRead(AUDIO_PIN_left);
    sample_right = analogRead(AUDIO_PIN_right);
    
  Serial.println(sample_left);
    if (sample_left < 1024)  // toss out spurious readings
    {
      if (sample_left > signalMax_left)
      {
        signalMax_left = sample_left;  // save just the max levels
      }
      else if (sample_left < signalMin_left)
      {
        signalMin_left = sample_left;  // save just the min levels
      }
    }
    
    if (sample_right < 1024)  // toss out spurious readings
    {
      if (sample_right > signalMax_right)
      {
        signalMax_right = sample_right;  // save just the max levels
      }
      else if (sample_right < signalMin_right)
      {
        signalMin_right = sample_right;  // save just the min levels
      }

    }
  }
// Serial.print(peakToPeak_left); 
 
  peakToPeak_left = signalMax_left - signalMin_left;  // max - min = peak-peak amplitude
  peakToPeak_right = signalMax_right - signalMin_right;  // max - min = peak-peak amplitude
 
// Serial.println(peakToPeak);


  //Fill the strip with rainbow gradient
  for (int i=0;i<=strip_left.numPixels()-1;i++){
    strip_left.setPixelColor(i,Wheel_left(map(i,0,strip_left.numPixels()-1,30,150)));
    strip_right.setPixelColor(i,Wheel_right(map(i,0,strip_right.numPixels()-1,30,150)));  
  }

// SENSITIVITY ADJUSTMENT  - APK
CeilingCounter = CeilingCounter + 1000;
// Serial.print("  SC=");
//  Serial.println(CeilingCounter);
if (CeilingCounter >= 10000) {
   INPUT_CEILING = analogRead(CEILING_CTRL); //reads adjustment to calibrate the ceiling
  CeilingCounter = 0;
;
 // Serial.print("IC=");
 // Serial.println(INPUT_CEILING);
  }

  //Scale the input logarithmically instead of linearly
  c_left = fscale(INPUT_FLOOR, INPUT_CEILING, strip_left.numPixels(), 0, peakToPeak_left, 2);
  c_right = fscale(INPUT_FLOOR, INPUT_CEILING, strip_right.numPixels(), 0, peakToPeak_right, 2);
//NEWDOT
c_left2 = fscale(INPUT_FLOOR, INPUT_CEILING, strip_left.numPixels(), 0, peakToPeak_left, 2);
c_right2 = fscale(INPUT_FLOOR, INPUT_CEILING, strip_right.numPixels(), 0, peakToPeak_right, 2);  
  

//  DOT HANGING

  if(c_left < peak_left) {
    peak_left = c_left;        // Keep dot on top
    dotHangCount_left = 0;    // make the dot hang before falling
  }
    
   if(c_right < peak_right) {
    peak_right = c_right;        // Keep dot on top
    dotHangCount_right = 0;    // make the dot hang before falling
  }
  
    /////////  NEW SECOND PEEAK
  if(c_left2 < peak_left2) {
    peak_left2 = c_left2;        // Keep dot on top
    dotHangCount_left2 = 0;    // make the dot hang before falling
  }
    
   if(c_right2 < peak_right2) {
    peak_right2 = c_right2;        // Keep dot on top
    dotHangCount_right2 = 0;    // make the dot hang before falling
  }     
 
  
  
  if (c_left <= strip_left.numPixels()) { // Fill partial column with off pixels
    drawLine(strip_left.numPixels(), strip_left.numPixels()-c_left, strip_left.Color(10, 10, 10)); 
  }
 
  if (c_right <= strip_right.numPixels()) { // Fill partial column with off pixels
    drawLine_right(strip_right.numPixels(), strip_right.numPixels()-c_right, strip_right.Color(10, 0, 0));
  }

  
  //NEW DOT
    if (c_left2 <= strip_left.numPixels()) { // Fill partial column with off pixels
    drawLine(strip_left.numPixels(), strip_left.numPixels()-c_left2, strip_left.Color(0, 0, 0)); 
  }
 if (c_right2 <= strip_right.numPixels()) { // Fill partial column with off pixels
    drawLine_right(strip_right.numPixels(), strip_right.numPixels()-c_right2, strip_right.Color(0, 0, 0));
  }
  
 

  // Set the peak dot to match the rainbow gradient
  y_left = strip_left.numPixels() - peak_left;
  y_right = strip_right.numPixels() - peak_right;
  
  /////////  NEW SECOND PEEAK
  y_left2 = strip_left.numPixels() - peak_left2;
  y_right2 = strip_right.numPixels() - peak_right2;


//Solid Colored firstPeak
//  strip_left.setPixelColor(y_left-1,Wheel_PEAK1(map(y_left,0,strip_left.numPixels()-1,30,150)));
//  strip_right.setPixelColor(y_right-1,Wheel_PEAK1(map(y_right,0,strip_right.numPixels()-1,30,150)));

//Scaled first Peak
strip_left.setPixelColor(y_left-1,Wheel_left(map(y_left,0,strip_left.numPixels()-1,30,150)));
strip_right.setPixelColor(y_right-1,Wheel_right(map(y_right,0,strip_right.numPixels()-1,30,150)));



  /////////  NEW SECOND PEEAK - LONGER
  
  //Solid Colored second Peak
//strip_left.setPixelColor(y_left2-1,Wheel_PEAK2(map(y_left,0,strip_left.numPixels()-1,30,150)));
//strip_right.setPixelColor(y_right2-1,Wheel_PEAK2(map(y_right,0,strip_right.numPixels()-1,30,150)));

//Scaled second Peak
strip_left.setPixelColor(y_left2-1,Wheel_left(map(y_left,0,strip_left.numPixels()-1,30,150)));
strip_right.setPixelColor(y_right2-1,Wheel_right(map(y_right,0,strip_right.numPixels()-1,30,150)));

 
 
// DOT that's Always on
strip_right.setPixelColor(35,strip_right.Color(255, 0, 0));
strip_left.setPixelColor(35,strip_left.Color(255, 0, 0));

strip_left.show();
strip_right.show();







  // Frame based peak dot animation
  if(dotHangCount_left > PEAK_HANG) { //Peak pause length
    if(++dotCount_left >= PEAK_FALL) { //Fall rate 
      peak_left++;
      dotCount_left = 0;
    }
  } 
  else {
    dotHangCount_left++; 
  }
  
  
  
  /////////    /////////    /////////    /////////    /////////  NEW SECOND PEEAK
  // LEFT
    if(dotHangCount_left2 > PEAK_HANG2) { //Peak pause length
    if(++dotCount_left2 >= PEAK_FALL2) { //Fall rate 
      peak_left2++;
      dotCount_left2 = 0;
    }
  } 
  else {
    dotHangCount_left2++; 
  }
  
  
  /////////  NEW SECOND PEEAK
  //RIGHT
    // Frame based peak dot animation
  if(dotHangCount_right2 > PEAK_HANG2) { //Peak pause length
    if(++dotCount_right2 >= PEAK_FALL2) { //Fall rate 
      peak_right2++;
      dotCount_right2 = 0;
    }
  } 
  else {
    dotHangCount_right2++; 
  }

  /////////  END NEW

  
  
    // Frame based peak dot animation
  if(dotHangCount_right > PEAK_HANG) { //Peak pause length
    if(++dotCount_right >= PEAK_FALL) { //Fall rate 
      peak_right++;
      dotCount_right = 0;
    }
  } 
  else {
    dotHangCount_right++; 
  }
}
  
 

//---------------------LEFT DRAW LINE-----------------------

//Used to draw a line between two points of a given color
void drawLine(uint8_t from, uint8_t to, uint32_t c_left) {
  uint8_t fromTemp;
  if (from > to) {
    fromTemp = from;
    from = to;
    to = fromTemp;
  }
  for(int i=from; i<=to; i++){
    strip_left.setPixelColor(i, c_left);
  }
}

//---------------------RIGHT DRAW LINE-----------------------
void drawLine_right(uint8_t from, uint8_t to, uint32_t c_right) {
  uint8_t fromTemp;
  if (from > to) {
    fromTemp = from;
    from = to;
    to = fromTemp;
  }
  for(int i=from; i<=to; i++){
    strip_right.setPixelColor(i, c_right);
  }
}




//---------------------LEFT COLOR-----------------------
// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel_left(byte WheelPos_left) {
  if(WheelPos_left <= 90) {
//ali-rem    return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
    return strip_left.Color(0, 200, 0); //ali-add
  } 
    
  else if(WheelPos_left < 120) {
    WheelPos_left -= 90;
//rem    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
    return strip_left.Color(255, 100, 0); //ali-add
  }
        
   
  else {
    WheelPos_left -= 140;
//rem    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
    return strip_left.Color(255, 0, 0); //ali-add
  }
}



//---------------------RIGHT COLOR-----------------------
// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel_right(byte WheelPos_right) {
  if(WheelPos_right <= 90) {
//ali-rem    return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
    return strip_right.Color(0, 200, 0); //ali-add
  } 
  else if(WheelPos_right < 120) {
    WheelPos_right -= 90;
//rem    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
    return strip_right.Color(255, 100, 0); //ali-add
  } 
  else {
    WheelPos_right -= 140;
//rem    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
    return strip_right.Color(200, 0, 0); //ali-add
  }
}

//---------------------First PEAK COLOR-----------------------
// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel_PEAK1(byte WheelPos_left) {
    return strip_left.Color(255, 255, 255);
}

//---------------------SECOND PEAK COLOR-----------------------
// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel_PEAK2(byte WheelPos_left) {
    return strip_left.Color(255, 255, 255); //ali-add
}


//---------------LOGRYTHMIC SCALE----------------

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

  curve = (curve * -.12) ; // - invert and scale - this seems more intuitive - postive numbers give more weight to high end on output 
  curve = pow(40, curve);//10, curve); // convert linear scale into lograthimic exponent for other pow function

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




