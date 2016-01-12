// Script created for processing 3

import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.event.InputEvent;

boolean start = false; 
boolean rectSet = false; 

int[] topLeft = new int[2];
int[] bottomRight = new int[2]; 
int[] nextPage = new int[2];
int lastTime = 0; 

int totalPages = 750; // Change this number, based on what you're copying.
int currentPage = 700;

String outFile = "Documents/Poole4th/page-";
String outType = "png";
String newOut;

Robot bot;

BufferedImage capture; 
File outputFile;
Rectangle screenRect;

void setup() {
  topLeft[0] = 0; 
  topLeft[1] = 0; 
  bottomRight[0] = 1;
  bottomRight[1] = 1; 
  nextPage[0] = 0;
  nextPage[1] = 0; 
  try {
    bot = new Robot();
  } catch (AWTException e) {
    println("Error creating robot.");
  }
  println("Hover over the top left corner, Click t.");
  println("Hover over the bottom right corner, Click b.");
  println("Hover over the 'next page' button, click n."); 
  println("If you are satisfied, click r then s to start capturing");
}
  
void draw() {
  
  if (rectSet) {
    screenRect = new Rectangle(topLeft[0],topLeft[1],
                               bottomRight[0] - topLeft[0],
                               bottomRight[1] - topLeft[1]);
    rectSet = false; 
  }
  if (start) {
    currentPage += 1;
    newOut = outFile + currentPage + "." + outType;
    try {
      click(nextPage[0], nextPage[1]);
    } catch (AWTException e) {
      println ("Error clicking."); 
    }
    sleep(800); 
    captureScreen(screenRect, newOut, outType);
    if (currentPage >= (totalPages - 1) ) {
      start = false; 
    }
  }
}

void keyPressed() {
  Point mouse;
  mouse = MouseInfo.getPointerInfo().getLocation();
  if (key == 't') {
    start = false; 
    topLeft[0] = mouse.x;
    topLeft[1] = mouse.y;
    println("topLeft Coordinates set as");
    println(mouse.x, mouse.y); 
    
  } else if (key == 'b') {
    start = false; 
    bottomRight[0] = mouse.x;
    bottomRight[1] = mouse.y;
    println("bottomRight Coordinates set as");
    println(mouse.x, mouse.y);
  } else if (key == 'n') {
    start = false;
    nextPage[0] = mouse.x;
    nextPage[1] = mouse.y; 
    println("nextPage Coordinates set as");
    println(mouse.x, mouse.y);
  } else if (key == 's') {
    start = true;
  } else if (key == 'r') {
    rectSet = true; 
  } else {
    start = false;
  }
}
  
void captureScreen(Rectangle screenRect, String outputFile, String outputType) {
  try {
    capture = new Robot().createScreenCapture(screenRect);
    File output = new File(outputFile);
    File parentDir = output.getParentFile();
    if(parentDir !=null && ! parentDir.exists() ){
      if(!parentDir.mkdirs()){
        throw new IOException("error creating directories");
      }
    }
    ImageIO.write(capture, outputType, output);
  } catch (AWTException e) {
    println("Something went wrong when capturing."); 
  } catch (IOException i) {
    println("Something went wrong when outputting the image.");
  }
}

void wait(int milli) {
  lastTime = millis();
  while(millis() - lastTime < milli) {
  }
}

void click(int x, int y) throws AWTException{
    bot.mouseMove(x, y);    
    bot.mousePress(InputEvent.BUTTON1_MASK);
    bot.mouseRelease(InputEvent.BUTTON1_MASK);
}

void sleep(int milli) {
    try {
    Thread.sleep(milli); // In milliseconds
    } catch(InterruptedException ex) {
        Thread.currentThread().interrupt();
    }
}
