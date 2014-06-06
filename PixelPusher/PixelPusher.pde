import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
import processing.core.*;

DeviceRegistry registry;
TestObserver testObserver;

// this could be looked up perhaps? 
final int num_of_strips = 5;
int max_leds_per_strip;

Strip[] strip = new Strip[num_of_strips];

void setup() {
  size(50, 50);

  // need to check relevance of below lines
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  registry.setAntiLog(true);

  // make sure everything is connected before proceeding
  while (testObserver.hasStrips == false) {
    println("Check connections - no strips detected");
  }

  // setting up strip array to make things easier to understand
  for (int i = 0; i < num_of_strips; i++) {
    strip[i] = registry.getStrips().get(i);
  }

  // get the length of longest strip
  max_leds_per_strip = strip[0].getLength();

  // Products
  for (int i = 0; i < products0.length; i++) {
    products0[i] = new Product(0, 1 + (i*4), 4); // ignoring first led for physical alignment
    products1[i] = new Product(1, 1 + (i*4), 4); // products0 and products1 are similar
  }

  for (int i = 0; i < products2.length; i++) {
    products2[i] = new Product(2, 1 + (i*2), 2); // ignoring first led for physical alignment
  }

  for (int i = 0; i < products3.length; i++) {
    products3[i] = new Product(3, 1 + (i*2), 2); // ignoring first led for physical alignment
//    products3[i].setInvertMode(false);
  }
  //  products3[0] = new Product(3, 0, 10); // ignoring first led for physical alignment
  //  products3[0].setInvertMode(false);

  // required for pixel pushing to work
  // calling this here and leaving it on. 
  // Currently not sure if leaving this on is too expensive.
  registry.startPushing();
}


void draw() {
//  setPixelArray(0, 0, 4, GREEN);
  for (int i = 0; i < products3.length; i++) {
    turnLookOn(0);
    delay(500);
    allLooksOff();
    delay(500);
  }
}

void stop()
{
  super.stop();
  registry.stopPushing();
}

