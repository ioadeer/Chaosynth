// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A basic implementation of John Conway's Game of Life CA
// how could this be improved to use object oriented programming?
// think of it as similar to our particle system, with a "cell" class
// to describe each individual cell and a "cellular automata" class
// to describe a collection of cells

GOL gol;

void setup() {
  //size(640, 360);
  size(600, 600);
  frameRate(24);
  gol = new GOL();
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
}

// reset board when mouse is pressed
//void mousePressed() {
//  //gol.init();
//	gol.draw(mouseX, mouseY);
//}

