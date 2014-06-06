/* making an object array for each column of 
 products because it seems easier to manage this way.
 Not making 2d array since each column is different
 */

// change this if you find it shitty - the class is pretty handy though
Product[] products0 = new Product[4];
Product[] products1 = new Product[4];
Product[] products2 = new Product[8];
Product[] products3 = new Product[5]; // <-- reason this idea may be dumb
class Product {

  int product_column; // column id of product (0-4)
  int start_led;  // index of led from which the leds should light up for this product
  int num_of_leds; // num of leds from start_led to light up for this product
  int product_id; // may not be required - check later

  // we managed to fuck up the base plate design and couldnt fix it in time
  // hence the need for the below two
  // the below two variables ('invert mode') cannot be applied to the last strip since it is shorter than the others
  boolean invert = false; 
  int led_index; 

  // LIGHT_GREEN if debugging - bright lights tend to give me headaches 
  color prod_color = LIGHT_GREEN;

  Product(int column, int start, int num_leds) {
    product_column = column;
    start_led = start;
    num_of_leds = num_leds;
  }


  void setLightsOn() {
    // the strip to the left of the product
    setPixelArray(product_column, start_led, num_of_leds, prod_color); 

    // the strip to the right of the product
    setPixelArray(product_column + 1, start_led, num_of_leds, prod_color);
  }

  void setLightsOff() {
    // the strip to the left of the product
    setPixelArray(product_column, start_led, num_of_leds, NO_COLOR); 

    // the strip to the right of the product
    setPixelArray(product_column + 1, start_led, num_of_leds, NO_COLOR);
  }
}

// functions that set certain lights (products) on/off for each look

void turnLookOn(int id) {

  //  products0[0].setLightsOn();
  //  products1[2].setLightsOn();
  //  products2[6].setLightsOn();
  //  products3[0].setLightsOn();

  switch(id) {
  case 0:
    products0[0].setLightsOn();
    products1[2].setLightsOn();
    products2[6].setLightsOn();
    products3[0].setLightsOn();

    break;
  }
}

void allLooksOff() {
  for (int i = 0; i < num_of_strips; i++) {
    setStripOff(i);
  }
}

