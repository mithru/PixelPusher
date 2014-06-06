// add colours here
final color RED = color(255, 0, 0);
final color GREEN = color(0, 255, 0);
final color LIGHT_GREEN = color(0, 100, 0); // for testing
final color YELLOW = color(255, 255, 0);
final color NO_COLOR = color(0, 0, 0);

boolean invertMode = false;


// sets colour for a single colour
// strip_id refers to the strip(s) connected on the pixel pusher board minus 1 (0 - 7)
// led_id refers to the led on each strip - id starts from 0
void setPixelColor(int strip_id, int led_id, color c) {
  if (strip_id == 4) {
    if (led_id > 0)
      strip[strip_id].setPixel(c, led_id - 1);
  } 
  else {
    strip[strip_id].setPixel(c, max_leds_per_strip - led_id - 1);
  }
}

// sets a continuous group of pixels to a specified colour
void setPixelArray(int strip_id, int start_led, int count, color c) {
  for (int i = start_led; i < (start_led + count); i++) {
    setPixelColor(strip_id, i, c);
  }
}

//turns off leds in a strip
void setStripOff(int strip_id) {
  for (int i = 0; i < strip[strip_id].getLength(); i++) {
    setPixelColor(strip_id, i, NO_COLOR);
  }
}


