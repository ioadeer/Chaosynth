// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A basic implementation of John Conway's Game of Life CA
// how could this be improved to use object oriented programming?
// think of it as similar to our particle system, with a "cell" class
// to describe each individual cell and a "cellular automata" class
// to describe a collection of cells

GOL gol;

import controlP5.*;

ControlFrame cf;

void settings(){
  size(600, 600);
}

void setup() {
  //size(640, 360);
  //size(600, 600);
  frameRate(24);
  gol = new GOL();

  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
}

void draw() {
  background(255);

	if(mousePressed){
		gol.draw(mouseX,mouseY);
	}
 	gol.display();
	if((frameCount % 15) == 0){
  	gol.generate();
	}
	//if((frameCount % 30) == 0){
  //	gol.printAverageValues();
	//}
	if(keyPressed){
		switch(key){
			case 'r':
						//gol.init();
						gol.initCellBoard();
						break;
			default:
						println("Press 'r' to restart");
		}
	}
	//noLoop();
}

// reset board when mouse is pressed
//void mousePressed() {
//  //gol.init();
//	gol.draw(mouseX, mouseY);
//}

void controlEvent(ControlEvent theEvent) {
  println("got a control event from controller with id "+theEvent.getController().getId());
  
  if (theEvent.isFrom(cf.cp5.getController("n1"))) {
    println("this event was triggered by Controller n1");
  }
  
  switch(theEvent.getController().getId()) {
    case(1):
    float myColorRect1 = (float)(theEvent.getController().getValue());
		println(myColorRect1);
    break;
    case(2):
    float myColorRect2 = (float)(theEvent.getController().getValue());
		println(myColorRect2);
    break;
    case(3):
    println(theEvent.getController().getStringValue());
    break;
  }
}
