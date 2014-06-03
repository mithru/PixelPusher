import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
import processing.core.*;

DeviceRegistry registry;
TestObserver testObserver;

// this could be looked up perhaps? 
final int num_of_strips = 6;

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
  
  // required for pixel pushing to work
  // calling this here and leaving it on. 
  // Currently not sure if leaving this on is too expensive.
  registry.startPushing();
}


void draw() {
  setPixelArray(0, 0, 5, RED);
  delay(1000);

  setStripOff(0);
  delay(1000);
}

void stop()
{
  super.stop();
  registry.stopPushing();
}

