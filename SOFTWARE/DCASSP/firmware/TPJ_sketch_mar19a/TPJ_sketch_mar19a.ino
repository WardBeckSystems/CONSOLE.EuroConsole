#include <Adafruit_NeoPixel.h>
#include <Wire.h>



// Neopixels ATTACHED TO THESE PINS
#define FNT_NEO_PIXEL_PIN 48

//Number of Neopixels ATTACHED TO THESE PINS
#define N_PIXELS 5

//neopixel Index nick names.  0 is the bottom NEOPIXEL in the line
#define FNT_NEO_PIXEL_SEL 4
#define FNT_NEO_PIXEL_SUN 3
#define FNT_NEO_PIXEL_SKY 2
#define FNT_NEO_PIXEL_GRASS 1
#define FNT_NEO_PIXEL_EARTH 0

//LED Lights ATTACHED TO THESE PINS
#define  FDR_LED_KEY_CHON_PIN  25
#define FDR_LED_KEY_ONLY_PIN  22
#define FDR_LED_KEY_SEL_PIN 23
#define  FNT_LED_KEY_EARTH_PIN 39
#define FNT_LED_KEY_GRASS_PIN 41
#define FNT_LED_KEY_SEL_PIN 50
#define FNT_LED_KEY_SKY_PIN 49
#define FNT_LED_KEY_SUN_PIN 51

//Potentionmeters ATTACHED TO THESE PINS
#define FNT_POT_SUN_PIN A0
#define FNT_POT_SKY_PIN A1
#define FNT_POT_GRASS_PIN A6
#define FNT_POT_EARTH_PIN A12
#define FDR_POT_POSITION_PIN  A14
#define FDR_POT_SLIDE_PIN A15

// KEYS ATTACHED TO THESE PINS
#define  FDR_KEY_CHON_PIN  27
#define FDR_KEY_ONLY_PIN  31
#define FDR_KEY_SEL_PIN 29
#define  FNT_KEY_EARTH_PIN 37
#define FNT_KEY_GRASS_PIN 35
#define FNT_KEY_SEL_PIN 52
#define FNT_KEY_SKY_PIN 47
#define FNT_KEY_SUN_PIN 45



//POT VALUES
int FNT_POT_EARTH_STATE;
int FNT_POT_GRASS_STATE;
int FNT_POT_SKY_STATE;
int FNT_POT_SUN_STATE;
int FDR_POT_POSITION_STATE;
int FDR_POT_SLIDE_STATE;

int FDR_POT_POSITION_CHANGE;
int FDR_POT_SLIDE_CHANGE;


//POT SCALERS
byte FNT_POT_EARTH_SCALE;
byte FNT_POT_GRASS_SCALE;
byte FNT_POT_SKY_SCALE;
byte FNT_POT_SUN_SCALE;
byte FDR_POT_POSITION_SCALE;
byte FDR_POT_SLIDE_SCALE;




//FADER LED PANEL
int  FDR_LED_KEY_CHON_STATE = 1;
int FDR_LED_KEY_ONLY_STATE  = 1 ;
int FDR_LED_KEY_SEL_STATE  = 1;

// FADER KEY
int  FDR_KEY_CHON_STATE;
int FDR_KEY_ONLY_STATE;
int FDR_KEY_SEL_STATE;





// FADER KEY
int  FDR_KEY_CHON_LAST_STATE;
int FDR_KEY_ONLY_LAST_STATE;
int FDR_KEY_SEL_LAST_STATE;


// FRONT LED
int  FNT_LED_KEY_EARTH_STATE = 1 ;
int FNT_LED_KEY_GRASS_STATE = 1;
int FNT_LED_KEY_SEL_STATE = 1;
int FNT_LED_KEY_SKY_STATE = 1;
int FNT_LED_KEY_SUN_STATE = 1;


//FRONT KEYS
int  FNT_KEY_EARTH_STATE ;
int FNT_KEY_GRASS_STATE ;
int FNT_KEY_SEL_STATE ;
int FNT_KEY_SKY_STATE ;
int FNT_KEY_SUN_STATE ;

//FRONT KEYS
int  FNT_KEY_EARTH_LAST_STATE ;
int FNT_KEY_GRASS_LAST_STATE ;
int FNT_KEY_SEL_LAST_STATE ;
int FNT_KEY_SKY_LAST_STATE ;
int FNT_KEY_SUN_LAST_STATE ;




//Digital POTS
byte attenuation = 32;                            // Attenuation value of volume potentiometer gangs. Initially set to minimum volume.
byte tempattenuation = 0;                         // Holds attenuation value for second pot bitwise operation
byte PotScaler = 63;

Adafruit_NeoPixel FNT_NEO_PIXEL = Adafruit_NeoPixel(N_PIXELS, FNT_NEO_PIXEL_PIN, NEO_GRB + NEO_KHZ800);

//Debounce times
long lastDebounceTime = 0;  // the last time the output pin was toggled
long debounceDelay = 2;    // the debounce time; increase if the output flickers
int buttonState;             // the current reading from the input pin
int lastButtonState = LOW;   // the previous reading from the input pin

int StateMachinePodSelect = 1;
int StateMachinePodInput=0;

byte readingSUN, readingSKY, readingGRASS, readingEARTH;


/*The five pointNone array takes an index value from 0 to 1023 and performs a look up from 
math pre-solved. By Looking up the pre-solved math the microcontrollers performes minimal calculations 
This array stores the behavior of the Positioning.  By indexing [A] is the position
Indexing [b] is the value at the channel
*/
byte fivepoint[1024][5] = {
  {64,  0,  0,  0,  0},
  {63,  0,  0,  0,  0},
  {63,  0,  0,  0,  0},
  {63,  1,  0,  0,  0},
  {63,  1,  0,  0,  0},
  {63,  2,  0,  0,  0},
  {63,  2,  0,  0,  0},
  {63,  3,  0,  0,  0},
  {63,  3,  0,  0,  0},
  {63,  4,  0,  0,  0},
  {63,  4,  0,  0,  0},
  {63,  5,  0,  0,  0},
  {63,  5,  0,  0,  0},
  {63,  6,  0,  0,  0},
  {63,  6,  0,  0,  0},
  {63,  7,  0,  0,  0},
  {63,  7,  0,  0,  0},
  {63,  8,  0,  0,  0},
  {63,  8,  0,  0,  0},
  {63,  9,  0,  0,  0},
  {63,  9,  0,  0,  0},
  {63,  10, 0,  0,  0},
  {63,  10, 0,  0,  0},
  {63,  10, 0,  0,  0},
  {63,  11, 0,  0,  0},
  {63,  11, 0,  0,  0},
  {63,  12, 0,  0,  0},
  {63,  12, 0,  0,  0},
  {63,  13, 0,  0,  0},
  {63,  13, 0,  0,  0},
  {63,  14, 0,  0,  0},
  {63,  14, 0,  0,  0},
  {63,  15, 0,  0,  0},
  {62,  15, 0,  0,  0},
  {62,  15, 0,  0,  0},
  {62,  16, 0,  0,  0},
  {62,  16, 0,  0,  0},
  {62,  17, 0,  0,  0},
  {62,  17, 0,  0,  0},
  {62,  18, 0,  0,  0},
  {62,  18, 0,  0,  0},
  {62,  18, 0,  0,  0},
  {62,  19, 0,  0,  0},
  {62,  19, 0,  0,  0},
  {62,  20, 0,  0,  0},
  {62,  20, 0,  0,  0},
  {61,  20, 0,  0,  0},
  {61,  21, 0,  0,  0},
  {61,  21, 0,  0,  0},
  {61,  22, 0,  0,  0},
  {61,  22, 0,  0,  0},
  {61,  22, 0,  0,  0},
  {61,  23, 0,  0,  0},
  {61,  23, 0,  0,  0},
  {61,  24, 0,  0,  0},
  {61,  24, 0,  0,  0},
  {60,  24, 0,  0,  0},
  {60,  25, 0,  0,  0},
  {60,  25, 0,  0,  0},
  {60,  26, 0,  0,  0},
  {60,  26, 0,  0,  0},
  {60,  26, 0,  0,  0},
  {60,  27, 0,  0,  0},
  {60,  27, 0,  0,  0},
  {60,  28, 0,  0,  0},
  {59,  28, 0,  0,  0},
  {59,  28, 0,  0,  0},
  {59,  29, 0,  0,  0},
  {59,  29, 0,  0,  0},
  {59,  29, 0,  0,  0},
  {59,  30, 0,  0,  0},
  {59,  30, 0,  0,  0},
  {58,  30, 0,  0,  0},
  {58,  31, 0,  0,  0},
  {58,  31, 0,  0,  0},
  {58,  32, 0,  0,  0},
  {58,  32, 0,  0,  0},
  {58,  32, 0,  0,  0},
  {58,  33, 0,  0,  0},
  {57,  33, 0,  0,  0},
  {57,  33, 0,  0,  0},
  {57,  34, 0,  0,  0},
  {57,  34, 0,  0,  0},
  {57,  34, 0,  0,  0},
  {57,  35, 0,  0,  0},
  {56,  35, 0,  0,  0},
  {56,  35, 0,  0,  0},
  {56,  36, 0,  0,  0},
  {56,  36, 0,  0,  0},
  {56,  36, 0,  0,  0},
  {56,  37, 0,  0,  0},
  {55,  37, 0,  0,  0},
  {55,  37, 0,  0,  0},
  {55,  38, 0,  0,  0},
  {55,  38, 0,  0,  0},
  {55,  38, 0,  0,  0},
  {55,  39, 0,  0,  0},
  {54,  39, 0,  0,  0},
  {54,  39, 0,  0,  0},
  {54,  39, 0,  0,  0},
  {54,  40, 0,  0,  0},
  {54,  40, 0,  0,  0},
  {53,  40, 0,  0,  0},
  {53,  41, 0,  0,  0},
  {53,  41, 0,  0,  0},
  {53,  41, 0,  0,  0},
  {53,  42, 0,  0,  0},
  {52,  42, 0,  0,  0},
  {52,  42, 0,  0,  0},
  {52,  42, 0,  0,  0},
  {52,  43, 0,  0,  0},
  {51,  43, 0,  0,  0},
  {51,  43, 0,  0,  0},
  {51,  44, 0,  0,  0},
  {51,  44, 0,  0,  0},
  {51,  44, 0,  0,  0},
  {50,  44, 0,  0,  0},
  {50,  45, 0,  0,  0},
  {50,  45, 0,  0,  0},
  {50,  45, 0,  0,  0},
  {49,  45, 0,  0,  0},
  {49,  46, 0,  0,  0},
  {49,  46, 0,  0,  0},
  {49,  46, 0,  0,  0},
  {48,  46, 0,  0,  0},
  {48,  47, 0,  0,  0},
  {48,  47, 0,  0,  0},
  {48,  47, 0,  0,  0},
  {48,  48, 0,  0,  0},
  {47,  48, 0,  0,  0},
  {47,  48, 0,  0,  0},
  {47,  48, 0,  0,  0},
  {46,  48, 0,  0,  0},
  {46,  49, 0,  0,  0},
  {46,  49, 0,  0,  0},
  {46,  49, 0,  0,  0},
  {45,  49, 0,  0,  0},
  {45,  50, 0,  0,  0},
  {45,  50, 0,  0,  0},
  {45,  50, 0,  0,  0},
  {44,  50, 0,  0,  0},
  {44,  51, 0,  0,  0},
  {44,  51, 0,  0,  0},
  {44,  51, 0,  0,  0},
  {43,  51, 0,  0,  0},
  {43,  51, 0,  0,  0},
  {43,  52, 0,  0,  0},
  {42,  52, 0,  0,  0},
  {42,  52, 0,  0,  0},
  {42,  52, 0,  0,  0},
  {42,  53, 0,  0,  0},
  {41,  53, 0,  0,  0},
  {41,  53, 0,  0,  0},
  {41,  53, 0,  0,  0},
  {40,  53, 0,  0,  0},
  {40,  54, 0,  0,  0},
  {40,  54, 0,  0,  0},
  {39,  54, 0,  0,  0},
  {39,  54, 0,  0,  0},
  {39,  54, 0,  0,  0},
  {39,  55, 0,  0,  0},
  {38,  55, 0,  0,  0},
  {38,  55, 0,  0,  0},
  {38,  55, 0,  0,  0},
  {37,  55, 0,  0,  0},
  {37,  55, 0,  0,  0},
  {37,  56, 0,  0,  0},
  {36,  56, 0,  0,  0},
  {36,  56, 0,  0,  0},
  {36,  56, 0,  0,  0},
  {35,  56, 0,  0,  0},
  {35,  56, 0,  0,  0},
  {35,  57, 0,  0,  0},
  {34,  57, 0,  0,  0},
  {34,  57, 0,  0,  0},
  {34,  57, 0,  0,  0},
  {33,  57, 0,  0,  0},
  {33,  57, 0,  0,  0},
  {33,  58, 0,  0,  0},
  {32,  58, 0,  0,  0},
  {32,  58, 0,  0,  0},
  {32,  58, 0,  0,  0},
  {31,  58, 0,  0,  0},
  {31,  58, 0,  0,  0},
  {30,  58, 0,  0,  0},
  {30,  59, 0,  0,  0},
  {30,  59, 0,  0,  0},
  {29,  59, 0,  0,  0},
  {29,  59, 0,  0,  0},
  {29,  59, 0,  0,  0},
  {28,  59, 0,  0,  0},
  {28,  59, 0,  0,  0},
  {28,  60, 0,  0,  0},
  {27,  60, 0,  0,  0},
  {27,  60, 0,  0,  0},
  {26,  60, 0,  0,  0},
  {26,  60, 0,  0,  0},
  {26,  60, 0,  0,  0},
  {25,  60, 0,  0,  0},
  {25,  60, 0,  0,  0},
  {24,  60, 0,  0,  0},
  {24,  61, 0,  0,  0},
  {24,  61, 0,  0,  0},
  {23,  61, 0,  0,  0},
  {23,  61, 0,  0,  0},
  {22,  61, 0,  0,  0},
  {22,  61, 0,  0,  0},
  {22,  61, 0,  0,  0},
  {21,  61, 0,  0,  0},
  {21,  61, 0,  0,  0},
  {20,  61, 0,  0,  0},
  {20,  62, 0,  0,  0},
  {20,  62, 0,  0,  0},
  {19,  62, 0,  0,  0},
  {19,  62, 0,  0,  0},
  {18,  62, 0,  0,  0},
  {18,  62, 0,  0,  0},
  {18,  62, 0,  0,  0},
  {17,  62, 0,  0,  0},
  {17,  62, 0,  0,  0},
  {16,  62, 0,  0,  0},
  {16,  62, 0,  0,  0},
  {15,  62, 0,  0,  0},
  {15,  62, 0,  0,  0},
  {15,  63, 0,  0,  0},
  {14,  63, 0,  0,  0},
  {14,  63, 0,  0,  0},
  {13,  63, 0,  0,  0},
  {13,  63, 0,  0,  0},
  {12,  63, 0,  0,  0},
  {12,  63, 0,  0,  0},
  {11,  63, 0,  0,  0},
  {11,  63, 0,  0,  0},
  {10,  63, 0,  0,  0},
  {10,  63, 0,  0,  0},
  {10,  63, 0,  0,  0},
  {9, 63, 0,  0,  0},
  {9, 63, 0,  0,  0},
  {8, 63, 0,  0,  0},
  {8, 63, 0,  0,  0},
  {7, 63, 0,  0,  0},
  {7, 63, 0,  0,  0},
  {6, 63, 0,  0,  0},
  {6, 63, 0,  0,  0},
  {5, 63, 0,  0,  0},
  {5, 63, 0,  0,  0},
  {4, 63, 0,  0,  0},
  {4, 63, 0,  0,  0},
  {3, 63, 0,  0,  0},
  {3, 63, 0,  0,  0},
  {2, 63, 0,  0,  0},
  {2, 63, 0,  0,  0},
  {1, 63, 0,  0,  0},
  {1, 63, 0,  0,  0},
  {0, 63, 0,  0,  0},
  {0, 63, 0,  0,  0},
  {0, 64, 0,  0,  0},
  {0, 63, 0,  0,  0},
  {0, 63, 0,  0,  0},
  {0, 63, 1,  0,  0},
  {0, 63, 1,  0,  0},
  {0, 63, 2,  0,  0},
  {0, 63, 2,  0,  0},
  {0, 63, 3,  0,  0},
  {0, 63, 3,  0,  0},
  {0, 63, 4,  0,  0},
  {0, 63, 4,  0,  0},
  {0, 63, 5,  0,  0},
  {0, 63, 5,  0,  0},
  {0, 63, 6,  0,  0},
  {0, 63, 6,  0,  0},
  {0, 63, 7,  0,  0},
  {0, 63, 7,  0,  0},
  {0, 63, 8,  0,  0},
  {0, 63, 8,  0,  0},
  {0, 63, 9,  0,  0},
  {0, 63, 9,  0,  0},
  {0, 63, 10, 0,  0},
  {0, 63, 10, 0,  0},
  {0, 63, 10, 0,  0},
  {0, 63, 11, 0,  0},
  {0, 63, 11, 0,  0},
  {0, 63, 12, 0,  0},
  {0, 63, 12, 0,  0},
  {0, 63, 13, 0,  0},
  {0, 63, 13, 0,  0},
  {0, 63, 14, 0,  0},
  {0, 63, 14, 0,  0},
  {0, 63, 15, 0,  0},
  {0, 62, 15, 0,  0},
  {0, 62, 15, 0,  0},
  {0, 62, 16, 0,  0},
  {0, 62, 16, 0,  0},
  {0, 62, 17, 0,  0},
  {0, 62, 17, 0,  0},
  {0, 62, 18, 0,  0},
  {0, 62, 18, 0,  0},
  {0, 62, 18, 0,  0},
  {0, 62, 19, 0,  0},
  {0, 62, 19, 0,  0},
  {0, 62, 20, 0,  0},
  {0, 62, 20, 0,  0},
  {0, 61, 20, 0,  0},
  {0, 61, 21, 0,  0},
  {0, 61, 21, 0,  0},
  {0, 61, 22, 0,  0},
  {0, 61, 22, 0,  0},
  {0, 61, 22, 0,  0},
  {0, 61, 23, 0,  0},
  {0, 61, 23, 0,  0},
  {0, 61, 24, 0,  0},
  {0, 61, 24, 0,  0},
  {0, 60, 24, 0,  0},
  {0, 60, 25, 0,  0},
  {0, 60, 25, 0,  0},
  {0, 60, 26, 0,  0},
  {0, 60, 26, 0,  0},
  {0, 60, 26, 0,  0},
  {0, 60, 27, 0,  0},
  {0, 60, 27, 0,  0},
  {0, 60, 28, 0,  0},
  {0, 59, 28, 0,  0},
  {0, 59, 28, 0,  0},
  {0, 59, 29, 0,  0},
  {0, 59, 29, 0,  0},
  {0, 59, 29, 0,  0},
  {0, 59, 30, 0,  0},
  {0, 59, 30, 0,  0},
  {0, 58, 30, 0,  0},
  {0, 58, 31, 0,  0},
  {0, 58, 31, 0,  0},
  {0, 58, 32, 0,  0},
  {0, 58, 32, 0,  0},
  {0, 58, 32, 0,  0},
  {0, 58, 33, 0,  0},
  {0, 57, 33, 0,  0},
  {0, 57, 33, 0,  0},
  {0, 57, 34, 0,  0},
  {0, 57, 34, 0,  0},
  {0, 57, 34, 0,  0},
  {0, 57, 35, 0,  0},
  {0, 56, 35, 0,  0},
  {0, 56, 35, 0,  0},
  {0, 56, 36, 0,  0},
  {0, 56, 36, 0,  0},
  {0, 56, 36, 0,  0},
  {0, 56, 37, 0,  0},
  {0, 55, 37, 0,  0},
  {0, 55, 37, 0,  0},
  {0, 55, 38, 0,  0},
  {0, 55, 38, 0,  0},
  {0, 55, 38, 0,  0},
  {0, 55, 39, 0,  0},
  {0, 54, 39, 0,  0},
  {0, 54, 39, 0,  0},
  {0, 54, 39, 0,  0},
  {0, 54, 40, 0,  0},
  {0, 54, 40, 0,  0},
  {0, 53, 40, 0,  0},
  {0, 53, 41, 0,  0},
  {0, 53, 41, 0,  0},
  {0, 53, 41, 0,  0},
  {0, 53, 42, 0,  0},
  {0, 52, 42, 0,  0},
  {0, 52, 42, 0,  0},
  {0, 52, 42, 0,  0},
  {0, 52, 43, 0,  0},
  {0, 51, 43, 0,  0},
  {0, 51, 43, 0,  0},
  {0, 51, 44, 0,  0},
  {0, 51, 44, 0,  0},
  {0, 51, 44, 0,  0},
  {0, 50, 44, 0,  0},
  {0, 50, 45, 0,  0},
  {0, 50, 45, 0,  0},
  {0, 50, 45, 0,  0},
  {0, 49, 45, 0,  0},
  {0, 49, 46, 0,  0},
  {0, 49, 46, 0,  0},
  {0, 49, 46, 0,  0},
  {0, 48, 46, 0,  0},
  {0, 48, 47, 0,  0},
  {0, 48, 47, 0,  0},
  {0, 48, 47, 0,  0},
  {0, 48, 48, 0,  0},
  {0, 47, 48, 0,  0},
  {0, 47, 48, 0,  0},
  {0, 47, 48, 0,  0},
  {0, 46, 48, 0,  0},
  {0, 46, 49, 0,  0},
  {0, 46, 49, 0,  0},
  {0, 46, 49, 0,  0},
  {0, 45, 49, 0,  0},
  {0, 45, 50, 0,  0},
  {0, 45, 50, 0,  0},
  {0, 45, 50, 0,  0},
  {0, 44, 50, 0,  0},
  {0, 44, 51, 0,  0},
  {0, 44, 51, 0,  0},
  {0, 44, 51, 0,  0},
  {0, 43, 51, 0,  0},
  {0, 43, 51, 0,  0},
  {0, 43, 52, 0,  0},
  {0, 42, 52, 0,  0},
  {0, 42, 52, 0,  0},
  {0, 42, 52, 0,  0},
  {0, 42, 53, 0,  0},
  {0, 41, 53, 0,  0},
  {0, 41, 53, 0,  0},
  {0, 41, 53, 0,  0},
  {0, 40, 53, 0,  0},
  {0, 40, 54, 0,  0},
  {0, 40, 54, 0,  0},
  {0, 39, 54, 0,  0},
  {0, 39, 54, 0,  0},
  {0, 39, 54, 0,  0},
  {0, 39, 55, 0,  0},
  {0, 38, 55, 0,  0},
  {0, 38, 55, 0,  0},
  {0, 38, 55, 0,  0},
  {0, 37, 55, 0,  0},
  {0, 37, 55, 0,  0},
  {0, 37, 56, 0,  0},
  {0, 36, 56, 0,  0},
  {0, 36, 56, 0,  0},
  {0, 36, 56, 0,  0},
  {0, 35, 56, 0,  0},
  {0, 35, 56, 0,  0},
  {0, 35, 57, 0,  0},
  {0, 34, 57, 0,  0},
  {0, 34, 57, 0,  0},
  {0, 34, 57, 0,  0},
  {0, 33, 57, 0,  0},
  {0, 33, 57, 0,  0},
  {0, 33, 58, 0,  0},
  {0, 32, 58, 0,  0},
  {0, 32, 58, 0,  0},
  {0, 32, 58, 0,  0},
  {0, 31, 58, 0,  0},
  {0, 31, 58, 0,  0},
  {0, 30, 58, 0,  0},
  {0, 30, 59, 0,  0},
  {0, 30, 59, 0,  0},
  {0, 29, 59, 0,  0},
  {0, 29, 59, 0,  0},
  {0, 29, 59, 0,  0},
  {0, 28, 59, 0,  0},
  {0, 28, 59, 0,  0},
  {0, 28, 60, 0,  0},
  {0, 27, 60, 0,  0},
  {0, 27, 60, 0,  0},
  {0, 26, 60, 0,  0},
  {0, 26, 60, 0,  0},
  {0, 26, 60, 0,  0},
  {0, 25, 60, 0,  0},
  {0, 25, 60, 0,  0},
  {0, 24, 60, 0,  0},
  {0, 24, 61, 0,  0},
  {0, 24, 61, 0,  0},
  {0, 23, 61, 0,  0},
  {0, 23, 61, 0,  0},
  {0, 22, 61, 0,  0},
  {0, 22, 61, 0,  0},
  {0, 22, 61, 0,  0},
  {0, 21, 61, 0,  0},
  {0, 21, 61, 0,  0},
  {0, 20, 61, 0,  0},
  {0, 20, 62, 0,  0},
  {0, 20, 62, 0,  0},
  {0, 19, 62, 0,  0},
  {0, 19, 62, 0,  0},
  {0, 18, 62, 0,  0},
  {0, 18, 62, 0,  0},
  {0, 18, 62, 0,  0},
  {0, 17, 62, 0,  0},
  {0, 17, 62, 0,  0},
  {0, 16, 62, 0,  0},
  {0, 16, 62, 0,  0},
  {0, 15, 62, 0,  0},
  {0, 15, 62, 0,  0},
  {0, 15, 63, 0,  0},
  {0, 14, 63, 0,  0},
  {0, 14, 63, 0,  0},
  {0, 13, 63, 0,  0},
  {0, 13, 63, 0,  0},
  {0, 12, 63, 0,  0},
  {0, 12, 63, 0,  0},
  {0, 11, 63, 0,  0},
  {0, 11, 63, 0,  0},
  {0, 10, 63, 0,  0},
  {0, 10, 63, 0,  0},
  {0, 10, 63, 0,  0},
  {0, 9,  63, 0,  0},
  {0, 9,  63, 0,  0},
  {0, 8,  63, 0,  0},
  {0, 8,  63, 0,  0},
  {0, 7,  63, 0,  0},
  {0, 7,  63, 0,  0},
  {0, 6,  63, 0,  0},
  {0, 6,  63, 0,  0},
  {0, 5,  63, 0,  0},
  {0, 5,  63, 0,  0},
  {0, 4,  63, 0,  0},
  {0, 4,  63, 0,  0},
  {0, 3,  63, 0,  0},
  {0, 3,  63, 0,  0},
  {0, 2,  63, 0,  0},
  {0, 2,  63, 0,  0},
  {0, 1,  63, 0,  0},
  {0, 1,  63, 0,  0},
  {0, 0,  63, 0,  0},
  {0, 0,  63, 0,  0},
  {0, 0,  64, 0,  0},
  {0, 0,  63, 0,  0},
  {0, 0,  63, 0,  0},
  {0, 0,  63, 1,  0},
  {0, 0,  63, 1,  0},
  {0, 0,  63, 2,  0},
  {0, 0,  63, 2,  0},
  {0, 0,  63, 3,  0},
  {0, 0,  63, 3,  0},
  {0, 0,  63, 4,  0},
  {0, 0,  63, 4,  0},
  {0, 0,  63, 5,  0},
  {0, 0,  63, 5,  0},
  {0, 0,  63, 6,  0},
  {0, 0,  63, 6,  0},
  {0, 0,  63, 7,  0},
  {0, 0,  63, 7,  0},
  {0, 0,  63, 8,  0},
  {0, 0,  63, 8,  0},
  {0, 0,  63, 9,  0},
  {0, 0,  63, 9,  0},
  {0, 0,  63, 10, 0},
  {0, 0,  63, 10, 0},
  {0, 0,  63, 10, 0},
  {0, 0,  63, 11, 0},
  {0, 0,  63, 11, 0},
  {0, 0,  63, 12, 0},
  {0, 0,  63, 12, 0},
  {0, 0,  63, 13, 0},
  {0, 0,  63, 13, 0},
  {0, 0,  63, 14, 0},
  {0, 0,  63, 14, 0},
  {0, 0,  63, 15, 0},
  {0, 0,  62, 15, 0},
  {0, 0,  62, 15, 0},
  {0, 0,  62, 16, 0},
  {0, 0,  62, 16, 0},
  {0, 0,  62, 17, 0},
  {0, 0,  62, 17, 0},
  {0, 0,  62, 18, 0},
  {0, 0,  62, 18, 0},
  {0, 0,  62, 18, 0},
  {0, 0,  62, 19, 0},
  {0, 0,  62, 19, 0},
  {0, 0,  62, 20, 0},
  {0, 0,  62, 20, 0},
  {0, 0,  61, 20, 0},
  {0, 0,  61, 21, 0},
  {0, 0,  61, 21, 0},
  {0, 0,  61, 22, 0},
  {0, 0,  61, 22, 0},
  {0, 0,  61, 22, 0},
  {0, 0,  61, 23, 0},
  {0, 0,  61, 23, 0},
  {0, 0,  61, 24, 0},
  {0, 0,  61, 24, 0},
  {0, 0,  60, 24, 0},
  {0, 0,  60, 25, 0},
  {0, 0,  60, 25, 0},
  {0, 0,  60, 26, 0},
  {0, 0,  60, 26, 0},
  {0, 0,  60, 26, 0},
  {0, 0,  60, 27, 0},
  {0, 0,  60, 27, 0},
  {0, 0,  60, 28, 0},
  {0, 0,  59, 28, 0},
  {0, 0,  59, 28, 0},
  {0, 0,  59, 29, 0},
  {0, 0,  59, 29, 0},
  {0, 0,  59, 29, 0},
  {0, 0,  59, 30, 0},
  {0, 0,  59, 30, 0},
  {0, 0,  58, 30, 0},
  {0, 0,  58, 31, 0},
  {0, 0,  58, 31, 0},
  {0, 0,  58, 32, 0},
  {0, 0,  58, 32, 0},
  {0, 0,  58, 32, 0},
  {0, 0,  58, 33, 0},
  {0, 0,  57, 33, 0},
  {0, 0,  57, 33, 0},
  {0, 0,  57, 34, 0},
  {0, 0,  57, 34, 0},
  {0, 0,  57, 34, 0},
  {0, 0,  57, 35, 0},
  {0, 0,  56, 35, 0},
  {0, 0,  56, 35, 0},
  {0, 0,  56, 36, 0},
  {0, 0,  56, 36, 0},
  {0, 0,  56, 36, 0},
  {0, 0,  56, 37, 0},
  {0, 0,  55, 37, 0},
  {0, 0,  55, 37, 0},
  {0, 0,  55, 38, 0},
  {0, 0,  55, 38, 0},
  {0, 0,  55, 38, 0},
  {0, 0,  55, 39, 0},
  {0, 0,  54, 39, 0},
  {0, 0,  54, 39, 0},
  {0, 0,  54, 39, 0},
  {0, 0,  54, 40, 0},
  {0, 0,  54, 40, 0},
  {0, 0,  53, 40, 0},
  {0, 0,  53, 41, 0},
  {0, 0,  53, 41, 0},
  {0, 0,  53, 41, 0},
  {0, 0,  53, 42, 0},
  {0, 0,  52, 42, 0},
  {0, 0,  52, 42, 0},
  {0, 0,  52, 42, 0},
  {0, 0,  52, 43, 0},
  {0, 0,  51, 43, 0},
  {0, 0,  51, 43, 0},
  {0, 0,  51, 44, 0},
  {0, 0,  51, 44, 0},
  {0, 0,  51, 44, 0},
  {0, 0,  50, 44, 0},
  {0, 0,  50, 45, 0},
  {0, 0,  50, 45, 0},
  {0, 0,  50, 45, 0},
  {0, 0,  49, 45, 0},
  {0, 0,  49, 46, 0},
  {0, 0,  49, 46, 0},
  {0, 0,  49, 46, 0},
  {0, 0,  48, 46, 0},
  {0, 0,  48, 47, 0},
  {0, 0,  48, 47, 0},
  {0, 0,  48, 47, 0},
  {0, 0,  48, 48, 0},
  {0, 0,  47, 48, 0},
  {0, 0,  47, 48, 0},
  {0, 0,  47, 48, 0},
  {0, 0,  46, 48, 0},
  {0, 0,  46, 49, 0},
  {0, 0,  46, 49, 0},
  {0, 0,  46, 49, 0},
  {0, 0,  45, 49, 0},
  {0, 0,  45, 50, 0},
  {0, 0,  45, 50, 0},
  {0, 0,  45, 50, 0},
  {0, 0,  44, 50, 0},
  {0, 0,  44, 51, 0},
  {0, 0,  44, 51, 0},
  {0, 0,  44, 51, 0},
  {0, 0,  43, 51, 0},
  {0, 0,  43, 51, 0},
  {0, 0,  43, 52, 0},
  {0, 0,  42, 52, 0},
  {0, 0,  42, 52, 0},
  {0, 0,  42, 52, 0},
  {0, 0,  42, 53, 0},
  {0, 0,  41, 53, 0},
  {0, 0,  41, 53, 0},
  {0, 0,  41, 53, 0},
  {0, 0,  40, 53, 0},
  {0, 0,  40, 54, 0},
  {0, 0,  40, 54, 0},
  {0, 0,  39, 54, 0},
  {0, 0,  39, 54, 0},
  {0, 0,  39, 54, 0},
  {0, 0,  39, 55, 0},
  {0, 0,  38, 55, 0},
  {0, 0,  38, 55, 0},
  {0, 0,  38, 55, 0},
  {0, 0,  37, 55, 0},
  {0, 0,  37, 55, 0},
  {0, 0,  37, 56, 0},
  {0, 0,  36, 56, 0},
  {0, 0,  36, 56, 0},
  {0, 0,  36, 56, 0},
  {0, 0,  35, 56, 0},
  {0, 0,  35, 56, 0},
  {0, 0,  35, 57, 0},
  {0, 0,  34, 57, 0},
  {0, 0,  34, 57, 0},
  {0, 0,  34, 57, 0},
  {0, 0,  33, 57, 0},
  {0, 0,  33, 57, 0},
  {0, 0,  33, 58, 0},
  {0, 0,  32, 58, 0},
  {0, 0,  32, 58, 0},
  {0, 0,  32, 58, 0},
  {0, 0,  31, 58, 0},
  {0, 0,  31, 58, 0},
  {0, 0,  30, 58, 0},
  {0, 0,  30, 59, 0},
  {0, 0,  30, 59, 0},
  {0, 0,  29, 59, 0},
  {0, 0,  29, 59, 0},
  {0, 0,  29, 59, 0},
  {0, 0,  28, 59, 0},
  {0, 0,  28, 59, 0},
  {0, 0,  28, 60, 0},
  {0, 0,  27, 60, 0},
  {0, 0,  27, 60, 0},
  {0, 0,  26, 60, 0},
  {0, 0,  26, 60, 0},
  {0, 0,  26, 60, 0},
  {0, 0,  25, 60, 0},
  {0, 0,  25, 60, 0},
  {0, 0,  24, 60, 0},
  {0, 0,  24, 61, 0},
  {0, 0,  24, 61, 0},
  {0, 0,  23, 61, 0},
  {0, 0,  23, 61, 0},
  {0, 0,  22, 61, 0},
  {0, 0,  22, 61, 0},
  {0, 0,  22, 61, 0},
  {0, 0,  21, 61, 0},
  {0, 0,  21, 61, 0},
  {0, 0,  20, 61, 0},
  {0, 0,  20, 62, 0},
  {0, 0,  20, 62, 0},
  {0, 0,  19, 62, 0},
  {0, 0,  19, 62, 0},
  {0, 0,  18, 62, 0},
  {0, 0,  18, 62, 0},
  {0, 0,  18, 62, 0},
  {0, 0,  17, 62, 0},
  {0, 0,  17, 62, 0},
  {0, 0,  16, 62, 0},
  {0, 0,  16, 62, 0},
  {0, 0,  15, 62, 0},
  {0, 0,  15, 62, 0},
  {0, 0,  15, 63, 0},
  {0, 0,  14, 63, 0},
  {0, 0,  14, 63, 0},
  {0, 0,  13, 63, 0},
  {0, 0,  13, 63, 0},
  {0, 0,  12, 63, 0},
  {0, 0,  12, 63, 0},
  {0, 0,  11, 63, 0},
  {0, 0,  11, 63, 0},
  {0, 0,  10, 63, 0},
  {0, 0,  10, 63, 0},
  {0, 0,  10, 63, 0},
  {0, 0,  9,  63, 0},
  {0, 0,  9,  63, 0},
  {0, 0,  8,  63, 0},
  {0, 0,  8,  63, 0},
  {0, 0,  7,  63, 0},
  {0, 0,  7,  63, 0},
  {0, 0,  6,  63, 0},
  {0, 0,  6,  63, 0},
  {0, 0,  5,  63, 0},
  {0, 0,  5,  63, 0},
  {0, 0,  4,  63, 0},
  {0, 0,  4,  63, 0},
  {0, 0,  3,  63, 0},
  {0, 0,  3,  63, 0},
  {0, 0,  2,  63, 0},
  {0, 0,  2,  63, 0},
  {0, 0,  1,  63, 0},
  {0, 0,  1,  63, 0},
  {0, 0,  0,  63, 0},
  {0, 0,  0,  63, 0},
  {0, 0,  0,  64, 0},
  {0, 0,  0,  63, 0},
  {0, 0,  0,  63, 0},
  {0, 0,  0,  63, 1},
  {0, 0,  0,  63, 1},
  {0, 0,  0,  63, 2},
  {0, 0,  0,  63, 2},
  {0, 0,  0,  63, 3},
  {0, 0,  0,  63, 3},
  {0, 0,  0,  63, 4},
  {0, 0,  0,  63, 4},
  {0, 0,  0,  63, 5},
  {0, 0,  0,  63, 5},
  {0, 0,  0,  63, 6},
  {0, 0,  0,  63, 6},
  {0, 0,  0,  63, 7},
  {0, 0,  0,  63, 7},
  {0, 0,  0,  63, 8},
  {0, 0,  0,  63, 8},
  {0, 0,  0,  63, 9},
  {0, 0,  0,  63, 9},
  {0, 0,  0,  63, 10},
  {0, 0,  0,  63, 10},
  {0, 0,  0,  63, 10},
  {0, 0,  0,  63, 11},
  {0, 0,  0,  63, 11},
  {0, 0,  0,  63, 12},
  {0, 0,  0,  63, 12},
  {0, 0,  0,  63, 13},
  {0, 0,  0,  63, 13},
  {0, 0,  0,  63, 14},
  {0, 0,  0,  63, 14},
  {0, 0,  0,  63, 15},
  {0, 0,  0,  62, 15},
  {0, 0,  0,  62, 15},
  {0, 0,  0,  62, 16},
  {0, 0,  0,  62, 16},
  {0, 0,  0,  62, 17},
  {0, 0,  0,  62, 17},
  {0, 0,  0,  62, 18},
  {0, 0,  0,  62, 18},
  {0, 0,  0,  62, 18},
  {0, 0,  0,  62, 19},
  {0, 0,  0,  62, 19},
  {0, 0,  0,  62, 20},
  {0, 0,  0,  62, 20},
  {0, 0,  0,  61, 20},
  {0, 0,  0,  61, 21},
  {0, 0,  0,  61, 21},
  {0, 0,  0,  61, 22},
  {0, 0,  0,  61, 22},
  {0, 0,  0,  61, 22},
  {0, 0,  0,  61, 23},
  {0, 0,  0,  61, 23},
  {0, 0,  0,  61, 24},
  {0, 0,  0,  61, 24},
  {0, 0,  0,  60, 24},
  {0, 0,  0,  60, 25},
  {0, 0,  0,  60, 25},
  {0, 0,  0,  60, 26},
  {0, 0,  0,  60, 26},
  {0, 0,  0,  60, 26},
  {0, 0,  0,  60, 27},
  {0, 0,  0,  60, 27},
  {0, 0,  0,  60, 28},
  {0, 0,  0,  59, 28},
  {0, 0,  0,  59, 28},
  {0, 0,  0,  59, 29},
  {0, 0,  0,  59, 29},
  {0, 0,  0,  59, 29},
  {0, 0,  0,  59, 30},
  {0, 0,  0,  59, 30},
  {0, 0,  0,  58, 30},
  {0, 0,  0,  58, 31},
  {0, 0,  0,  58, 31},
  {0, 0,  0,  58, 32},
  {0, 0,  0,  58, 32},
  {0, 0,  0,  58, 32},
  {0, 0,  0,  58, 33},
  {0, 0,  0,  57, 33},
  {0, 0,  0,  57, 33},
  {0, 0,  0,  57, 34},
  {0, 0,  0,  57, 34},
  {0, 0,  0,  57, 34},
  {0, 0,  0,  57, 35},
  {0, 0,  0,  56, 35},
  {0, 0,  0,  56, 35},
  {0, 0,  0,  56, 36},
  {0, 0,  0,  56, 36},
  {0, 0,  0,  56, 36},
  {0, 0,  0,  56, 37},
  {0, 0,  0,  55, 37},
  {0, 0,  0,  55, 37},
  {0, 0,  0,  55, 38},
  {0, 0,  0,  55, 38},
  {0, 0,  0,  55, 38},
  {0, 0,  0,  55, 39},
  {0, 0,  0,  54, 39},
  {0, 0,  0,  54, 39},
  {0, 0,  0,  54, 39},
  {0, 0,  0,  54, 40},
  {0, 0,  0,  54, 40},
  {0, 0,  0,  53, 40},
  {0, 0,  0,  53, 41},
  {0, 0,  0,  53, 41},
  {0, 0,  0,  53, 41},
  {0, 0,  0,  53, 42},
  {0, 0,  0,  52, 42},
  {0, 0,  0,  52, 42},
  {0, 0,  0,  52, 42},
  {0, 0,  0,  52, 43},
  {0, 0,  0,  51, 43},
  {0, 0,  0,  51, 43},
  {0, 0,  0,  51, 44},
  {0, 0,  0,  51, 44},
  {0, 0,  0,  51, 44},
  {0, 0,  0,  50, 44},
  {0, 0,  0,  50, 45},
  {0, 0,  0,  50, 45},
  {0, 0,  0,  50, 45},
  {0, 0,  0,  49, 45},
  {0, 0,  0,  49, 46},
  {0, 0,  0,  49, 46},
  {0, 0,  0,  49, 46},
  {0, 0,  0,  48, 46},
  {0, 0,  0,  48, 47},
  {0, 0,  0,  48, 47},
  {0, 0,  0,  48, 47},
  {0, 0,  0,  48, 48},
  {0, 0,  0,  47, 48},
  {0, 0,  0,  47, 48},
  {0, 0,  0,  47, 48},
  {0, 0,  0,  46, 48},
  {0, 0,  0,  46, 49},
  {0, 0,  0,  46, 49},
  {0, 0,  0,  46, 49},
  {0, 0,  0,  45, 49},
  {0, 0,  0,  45, 50},
  {0, 0,  0,  45, 50},
  {0, 0,  0,  45, 50},
  {0, 0,  0,  44, 50},
  {0, 0,  0,  44, 51},
  {0, 0,  0,  44, 51},
  {0, 0,  0,  44, 51},
  {0, 0,  0,  43, 51},
  {0, 0,  0,  43, 51},
  {0, 0,  0,  43, 52},
  {0, 0,  0,  42, 52},
  {0, 0,  0,  42, 52},
  {0, 0,  0,  42, 52},
  {0, 0,  0,  42, 53},
  {0, 0,  0,  41, 53},
  {0, 0,  0,  41, 53},
  {0, 0,  0,  41, 53},
  {0, 0,  0,  40, 53},
  {0, 0,  0,  40, 54},
  {0, 0,  0,  40, 54},
  {0, 0,  0,  39, 54},
  {0, 0,  0,  39, 54},
  {0, 0,  0,  39, 54},
  {0, 0,  0,  39, 55},
  {0, 0,  0,  38, 55},
  {0, 0,  0,  38, 55},
  {0, 0,  0,  38, 55},
  {0, 0,  0,  37, 55},
  {0, 0,  0,  37, 55},
  {0, 0,  0,  37, 56},
  {0, 0,  0,  36, 56},
  {0, 0,  0,  36, 56},
  {0, 0,  0,  36, 56},
  {0, 0,  0,  35, 56},
  {0, 0,  0,  35, 56},
  {0, 0,  0,  35, 57},
  {0, 0,  0,  34, 57},
  {0, 0,  0,  34, 57},
  {0, 0,  0,  34, 57},
  {0, 0,  0,  33, 57},
  {0, 0,  0,  33, 57},
  {0, 0,  0,  33, 58},
  {0, 0,  0,  32, 58},
  {0, 0,  0,  32, 58},
  {0, 0,  0,  32, 58},
  {0, 0,  0,  31, 58},
  {0, 0,  0,  31, 58},
  {0, 0,  0,  30, 58},
  {0, 0,  0,  30, 59},
  {0, 0,  0,  30, 59},
  {0, 0,  0,  29, 59},
  {0, 0,  0,  29, 59},
  {0, 0,  0,  29, 59},
  {0, 0,  0,  28, 59},
  {0, 0,  0,  28, 59},
  {0, 0,  0,  28, 60},
  {0, 0,  0,  27, 60},
  {0, 0,  0,  27, 60},
  {0, 0,  0,  26, 60},
  {0, 0,  0,  26, 60},
  {0, 0,  0,  26, 60},
  {0, 0,  0,  25, 60},
  {0, 0,  0,  25, 60},
  {0, 0,  0,  24, 60},
  {0, 0,  0,  24, 61},
  {0, 0,  0,  24, 61},
  {0, 0,  0,  23, 61},
  {0, 0,  0,  23, 61},
  {0, 0,  0,  22, 61},
  {0, 0,  0,  22, 61},
  {0, 0,  0,  22, 61},
  {0, 0,  0,  21, 61},
  {0, 0,  0,  21, 61},
  {0, 0,  0,  20, 61},
  {0, 0,  0,  20, 62},
  {0, 0,  0,  20, 62},
  {0, 0,  0,  19, 62},
  {0, 0,  0,  19, 62},
  {0, 0,  0,  18, 62},
  {0, 0,  0,  18, 62},
  {0, 0,  0,  18, 62},
  {0, 0,  0,  17, 62},
  {0, 0,  0,  17, 62},
  {0, 0,  0,  16, 62},
  {0, 0,  0,  16, 62},
  {0, 0,  0,  15, 62},
  {0, 0,  0,  15, 62},
  {0, 0,  0,  15, 63},
  {0, 0,  0,  14, 63},
  {0, 0,  0,  14, 63},
  {0, 0,  0,  13, 63},
  {0, 0,  0,  13, 63},
  {0, 0,  0,  12, 63},
  {0, 0,  0,  12, 63},
  {0, 0,  0,  11, 63},
  {0, 0,  0,  11, 63},
  {0, 0,  0,  10, 63},
  {0, 0,  0,  10, 63},
  {0, 0,  0,  10, 63},
  {0, 0,  0,  9,  63},
  {0, 0,  0,  9,  63},
  {0, 0,  0,  8,  63},
  {0, 0,  0,  8,  63},
  {0, 0,  0,  7,  63},
  {0, 0,  0,  7,  63},
  {0, 0,  0,  6,  63},
  {0, 0,  0,  6,  63},
  {0, 0,  0,  5,  63},
  {0, 0,  0,  5,  63},
  {0, 0,  0,  4,  63},
  {0, 0,  0,  4,  63},
  {0, 0,  0,  3,  63},
  {0, 0,  0,  3,  63},
  {0, 0,  0,  2,  63},
  {0, 0,  0,  2,  63},
  {0, 0,  0,  1,  63},
  {0, 0,  0,  1,  63},
  {0, 0,  0,  0,  63}
};




//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
void setup() {

  //Serial.begin(9600);


  //POD 2 serial port
  Serial3.begin(9600, SERIAL_8N1);

  //SETUP THE DS1882 POTENTIONMETERS
  Wire.begin(); // join i2c bus (address optional for master)
  Wire.beginTransmission(40);                 //Setup the
  Wire.write(B10000110);  //B10000110
  Wire.endTransmission();
  delay(500);

  Wire.beginTransmission(41);                 //Setup the
  Wire.write(B10000110);  //B10000110
  Wire.endTransmission();
  delay(500);

  Wire.beginTransmission(42);                 //Setup the
  Wire.write(B10000110);  //B10000110
  Wire.endTransmission();
  delay(500);

  ChangePot(0, 0, 1);
  ChangePot(0, 1, 1);
  ChangePot(1, 0, 1);
  ChangePot(1, 1, 1);
  ChangePot(2, 0, 1);
  ChangePot(2, 1, 1);


  //Position initialization
  FDR_POT_POSITION_CHANGE =  FDR_POT_POSITION_STATE;

  pinMode(FDR_POT_POSITION_PIN, INPUT);
  pinMode(FDR_POT_SLIDE_PIN, INPUT);
  pinMode(FNT_POT_EARTH_PIN, INPUT);
  pinMode(FNT_POT_GRASS_PIN, INPUT);
  pinMode(FNT_POT_SKY_PIN, INPUT);
  pinMode(FNT_POT_SUN_PIN, INPUT);

  //FADER LED
  pinMode(FDR_LED_KEY_CHON_PIN, OUTPUT);
  pinMode(FDR_LED_KEY_ONLY_PIN, OUTPUT);
  pinMode(FDR_LED_KEY_SEL_PIN, OUTPUT);

  //FADER KEY
  pinMode(FDR_KEY_CHON_PIN, INPUT);
  pinMode(FDR_KEY_ONLY_PIN, INPUT);
  pinMode(FDR_KEY_SEL_PIN, INPUT);

  //FRONT LED

  pinMode(FNT_LED_KEY_EARTH_PIN, OUTPUT);
  pinMode(FNT_LED_KEY_GRASS_PIN, OUTPUT);
  pinMode(FNT_LED_KEY_SEL_PIN, OUTPUT);
  pinMode(FNT_LED_KEY_SKY_PIN, OUTPUT);
  pinMode(FNT_LED_KEY_SUN_PIN, OUTPUT);

  //FRONT KEY
  pinMode(FNT_KEY_EARTH_PIN, INPUT);
  pinMode(FNT_KEY_GRASS_PIN, INPUT);
  pinMode(FNT_KEY_SEL_PIN, INPUT);
  pinMode(FNT_KEY_SKY_PIN, INPUT);
  pinMode(FNT_KEY_SUN_PIN, INPUT);

  //FRONT NEOPIXELS
  FNT_NEO_PIXEL.begin();
  FNT_NEO_PIXEL.show(); // Initialize all pixels to 'off'
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
//MAIN LOOP

void loop() {


  CheckAnalog();  // Check the Analog value of the pots and the slider


  PotScale();  // Scale the pot values into range of  1-64


  //If the position or slide changes
  if (!(FDR_POT_POSITION_CHANGE ==  FDR_POT_POSITION_SCALE) | !(FDR_POT_SLIDE_CHANGE ==  FDR_POT_SLIDE_SCALE)) {

    // FDR_POT_SLIDE_STATE is converted into a percentage, multiplied by the lookup value of the fivepoint array
    // fivepoint[FDR_POT_POSITION_STATE looks up the value stored in the array][ is the colum number 0 = Ls 4 = Rs]
    ChangePot(0, 0, ((int)((float)FDR_POT_SLIDE_STATE / 1024 * fivepoint[FDR_POT_POSITION_STATE][0])));
    ChangePot(0, 1, ((int)((float)FDR_POT_SLIDE_STATE / 1024 * fivepoint[FDR_POT_POSITION_STATE][1])));
    ChangePot(1, 0, ((int)((float)FDR_POT_SLIDE_STATE / 1024 * fivepoint[FDR_POT_POSITION_STATE][2])));
    ChangePot(1, 1, ((int)((float)FDR_POT_SLIDE_STATE / 1024 * fivepoint[FDR_POT_POSITION_STATE][3])));
    ChangePot(2, 0, ((int)((float)FDR_POT_SLIDE_STATE / 1024 * fivepoint[FDR_POT_POSITION_STATE - 1][4])));

    FDR_POT_POSITION_CHANGE =  FDR_POT_POSITION_SCALE;
    FDR_POT_SLIDE_CHANGE =  FDR_POT_SLIDE_SCALE;
  }


  CheckKeys(); // Check if any keys have been pressed
  LEDupdate();  // Update the LEDs on the keys
  UpdateNeopixel();  // Update the colors of the neopixels







//KEY DBOUNCE - SUN
  readingSUN = digitalRead(FNT_KEY_SUN_PIN);
  if (readingSUN != FNT_KEY_SUN_LAST_STATE) {
    lastDebounceTime = millis();
  }
  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (readingSUN != FNT_KEY_SUN_STATE) {
      FNT_KEY_SUN_STATE = readingSUN;
      StateMachinePodSelect = 1;
    }
  }
  FNT_KEY_SUN_LAST_STATE = readingSUN;

//KEY DBOUNCE - SKY
  readingSKY = digitalRead(FNT_KEY_SKY_PIN);
  if (readingSKY != FNT_KEY_SKY_LAST_STATE) {
    lastDebounceTime = millis();
  }
  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (readingSKY != FNT_KEY_SKY_STATE) {
      FNT_KEY_SKY_STATE = readingSKY;
      StateMachinePodSelect = 2;
    }
  }
  FNT_KEY_SKY_LAST_STATE = readingSKY;

//KEY DBOUNCE - GRASS
  readingGRASS = digitalRead(FNT_KEY_GRASS_PIN);
  if (readingGRASS != FNT_KEY_GRASS_LAST_STATE) {
    lastDebounceTime = millis();
  }
  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (readingGRASS != FNT_KEY_GRASS_STATE) {
      FNT_KEY_GRASS_STATE = readingGRASS;
      StateMachinePodSelect = 3;
    }
  }
  FNT_KEY_GRASS_LAST_STATE = readingGRASS;


//KEY DBOUNCE - EARTH
  readingEARTH = digitalRead(FNT_KEY_EARTH_PIN);
  if (readingEARTH != FNT_KEY_EARTH_LAST_STATE) {
    lastDebounceTime = millis();
  }
  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (readingEARTH != FNT_KEY_EARTH_STATE) {
      FNT_KEY_EARTH_STATE = readingEARTH;
      StateMachinePodSelect = 4;
    }
  }
  FNT_KEY_EARTH_LAST_STATE = readingEARTH;




  //STATEMACHINE TO CHANGE POD
  switch (StateMachinePodSelect) {
    case 1:
      digitalWrite(FNT_LED_KEY_SUN_PIN, 0);
      digitalWrite(FNT_LED_KEY_SKY_PIN, 1);
      digitalWrite(FNT_LED_KEY_GRASS_PIN, 1);
      digitalWrite(FNT_LED_KEY_EARTH_PIN, 1);
      PodInput(1);
      break;
    case 2:
      digitalWrite(FNT_LED_KEY_SUN_PIN, 1);
      digitalWrite(FNT_LED_KEY_SKY_PIN, 0);
      digitalWrite(FNT_LED_KEY_GRASS_PIN, 1);
      digitalWrite(FNT_LED_KEY_EARTH_PIN, 1);
      PodInput(2);
      break;

    case 3:
      digitalWrite(FNT_LED_KEY_SUN_PIN, 1);
      digitalWrite(FNT_LED_KEY_SKY_PIN, 1);
      digitalWrite(FNT_LED_KEY_GRASS_PIN, 0);
      digitalWrite(FNT_LED_KEY_EARTH_PIN, 1);
      PodInput(3);
      break;

    case 4:
      digitalWrite(FNT_LED_KEY_SUN_PIN, 1);
      digitalWrite(FNT_LED_KEY_SKY_PIN, 1);
      digitalWrite(FNT_LED_KEY_GRASS_PIN, 1);
      digitalWrite(FNT_LED_KEY_EARTH_PIN, 0);
      PodInput(4);
      break;

    default:
      // if nothing else matches, do the default
      // default is optional
      break;
  }


  //DISPLAY TO SERIAL FOR TESTING

  //DisplayKeyValues();
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
// This function Changes the input of the POD2 using Serial 3
void PodInput(byte channel) {

//if you are not currently on this channel
if(StateMachinePodInput != channel){
 
 //Get Ward-Beck Systems POD Attention
  Serial3.write(0xF0);

  //Write command to Change Channel
  Serial3.write(0x80 | channel);
  delay(10); 
 }
}


void CheckKeys()
{

  FDR_LED_KEY_CHON_STATE = digitalRead(FDR_KEY_CHON_PIN);

  FDR_LED_KEY_ONLY_STATE = digitalRead(FDR_KEY_ONLY_PIN);
  FDR_LED_KEY_SEL_STATE = digitalRead(FDR_KEY_SEL_PIN);

  FNT_LED_KEY_EARTH_STATE = digitalRead(FNT_KEY_EARTH_PIN);
  FNT_LED_KEY_GRASS_STATE = digitalRead(FNT_KEY_GRASS_PIN);
  FNT_LED_KEY_SEL_STATE = digitalRead(FNT_KEY_SEL_PIN);
  FNT_LED_KEY_SKY_STATE = digitalRead(FNT_KEY_SKY_PIN);








}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
//This function writes the status of the LED state
void LEDupdate()
{
  digitalWrite(FDR_LED_KEY_CHON_PIN, FDR_LED_KEY_CHON_STATE);
  digitalWrite(FDR_LED_KEY_ONLY_PIN, FDR_LED_KEY_ONLY_STATE);
  digitalWrite(FDR_LED_KEY_SEL_PIN, FDR_LED_KEY_SEL_STATE);

  digitalWrite(FNT_LED_KEY_EARTH_PIN, FNT_LED_KEY_EARTH_STATE);
  digitalWrite(FNT_LED_KEY_GRASS_PIN, FNT_LED_KEY_GRASS_STATE);
  digitalWrite(FNT_LED_KEY_SEL_PIN, FNT_LED_KEY_SEL_STATE);
  digitalWrite(FNT_LED_KEY_SKY_PIN, FNT_LED_KEY_SKY_STATE);
  digitalWrite(FNT_LED_KEY_SUN_PIN, FNT_LED_KEY_SUN_STATE);
}


//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
//This functions gets the analog value and stores it into the STATE variables
void CheckAnalog() {

  FDR_POT_POSITION_STATE = analogRead(FDR_POT_POSITION_PIN);
  FDR_POT_SLIDE_STATE = analogRead(FDR_POT_SLIDE_PIN);

  FNT_POT_EARTH_STATE = analogRead(FNT_POT_EARTH_PIN);
  FNT_POT_GRASS_STATE = analogRead(FNT_POT_GRASS_PIN);
  FNT_POT_SKY_STATE = analogRead(FNT_POT_SKY_PIN);
  FNT_POT_SUN_STATE = analogRead(FNT_POT_SUN_PIN);
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
// This function scales the state values as a percentage of the defined PotScaler

void PotScale()
{

  FNT_POT_EARTH_SCALE = ((int)((float)FNT_POT_EARTH_STATE / 1024 * PotScaler));
  FNT_POT_GRASS_SCALE = ((int)((float)FNT_POT_GRASS_STATE / 1024 * PotScaler));
  FNT_POT_SKY_SCALE = ((int)((float)FNT_POT_SKY_STATE / 1024 * PotScaler));
  FNT_POT_SUN_SCALE = ((int)((float)FNT_POT_SUN_STATE / 1024 * PotScaler));

  FDR_POT_SLIDE_SCALE = ((int)((float)FDR_POT_SLIDE_STATE / 1024 * PotScaler));
  FDR_POT_POSITION_SCALE = ((int)((float)FDR_POT_POSITION_STATE / 1024 * PotScaler));
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
//This function recieves the Pot number(0-8), the section  (0 or 1), and the value of Resistance (0-64)
void ChangePot(byte Pot, int Section, byte PotVal)
{
  // Transmit to DS1808, device #40 (0x28) = 0101 000, LSB is auto sent by Arduino Wire
  Wire.beginTransmission((40 + Pot));
  // choose section 0 or 1
  if (Section == 0) {
    Wire.write(PotScaler - PotVal);                  // Write wiper value to the first pot
  }
  if  (Section == 1) { // Section 1 needs a mask
    Wire.write(((((PotScaler) - PotVal)) | 0b01000000)); // Write wiper value for second pot
  }
  Wire.endTransmission();
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
void UpdateNeopixel() {
  FNT_NEO_PIXEL.setPixelColor(FNT_NEO_PIXEL_SEL, ((float)FDR_POT_SLIDE_STATE / 1024) * 255, 0, 0) ;

  FNT_NEO_PIXEL.setPixelColor(FNT_NEO_PIXEL_SUN, ((float)FNT_POT_SUN_STATE / 1024) * 244, ((float)FNT_POT_SUN_STATE / 1024) * 144, ((float)FNT_POT_SUN_STATE / 1024) * 44) ;
  FNT_NEO_PIXEL.setPixelColor(FNT_NEO_PIXEL_SKY, 0, 0, ((float)FNT_POT_SKY_STATE / 1024) * 255) ;
  FNT_NEO_PIXEL.setPixelColor(FNT_NEO_PIXEL_GRASS, 0, ((float)FNT_POT_GRASS_STATE / 1024) * 255, 0) ;
  FNT_NEO_PIXEL.setPixelColor(FNT_NEO_PIXEL_EARTH, ((float)FNT_POT_EARTH_STATE / 1024) * 105, ((float)FNT_POT_EARTH_STATE / 1024) * 69, 0) ;
  FNT_NEO_PIXEL.show();
};

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
void DisplayScalers() {
  Serial.print(FNT_POT_SUN_SCALE, DEC);  Serial.print("\t");
  Serial.print(FNT_POT_SKY_SCALE, DEC);  Serial.print("\t");
  Serial.print(FNT_POT_GRASS_SCALE, DEC);  Serial.print("\t");
  Serial.print(FNT_POT_EARTH_SCALE, DEC);  Serial.print("\t");

  Serial.print(FDR_POT_SLIDE_SCALE, DEC);  Serial.print("\t");
  Serial.print(FDR_POT_POSITION_SCALE, DEC);  Serial.print("\t");

  Serial.println("\n");      // prints another carriage return
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
void DisplayKeyValues() {
  Serial.print(FNT_KEY_EARTH_STATE, DEC);
  Serial.print(FNT_KEY_GRASS_STATE, DEC);

  Serial.print(FNT_KEY_SEL_STATE, DEC);
  Serial.print(FNT_KEY_SKY_STATE, DEC);
  Serial.print(FNT_KEY_SUN_STATE, DEC);
}

//▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░
void DisplayPotValues() {
  Serial.print(FDR_POT_POSITION_STATE, DEC);  Serial.print("\t");
  Serial.print(FDR_POT_SLIDE_STATE, DEC);  Serial.print("\t");

  Serial.print(FNT_POT_EARTH_STATE, DEC);     Serial.print("\t");
  Serial.print(FNT_POT_GRASS_STATE, DEC);      Serial.print("\t");
  Serial.print(FNT_POT_SKY_STATE, DEC);   Serial.print("\t");
  Serial.print(FNT_POT_SUN_STATE, DEC);   Serial.print("\t");
  Serial.println("\n");      // prints another carriage return
}
