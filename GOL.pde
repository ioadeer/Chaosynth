// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
import java.io.*;

class GOL {

  int w = 30;
  int columns, rows;
//	An example of the application of the transition rules to one neuron. Assume
//  that P = {0, 1, 2, 3, 4}, r 1 = 8.5, r 2 = 5.2 and k = 3.
  // Game of life board
  int[][] board;
	float r1, r2;
	float k; // capacitance of the nerve cell
	int states;	

  GOL() {
    // Initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
		states = 15;
		r1 = 8.5;
		r2 = 5.2;
		k  = 3;
    //next = new int[columns][rows];
    // Call function to fill array with random values 0 or 1
    init();
  }

  void init() {
    for (int i =0;i < columns;i++) {
      for (int j =0;j < rows;j++) {
        board[i][j] = int(random(states-1));
        //board[i][j] = 0;
      }
    }
  }

  // The process of creating the new generation
  void generate() {

    int[][] next = new int[columns][rows];


    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

				int numberOfPolarizedCells = 0;
				int numberOfBurnedCells = 0;

        // Add up all the states in a 3x3 surrounding grid
        int degreeOfPolarization = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
						//int lookUpCol, lookUpRow;
						//lookUpCol = (x+i)%columns == -1 ? columns -1 : (x+i)%columns;
						//lookUpRow = (y+j)%rows == -1 ? rows - 1 : (y+j)%rows;
						int lookUpCol, lookUpRow;
						int colReminder= (x+i)%columns;
						int rowReminder= (y+j)%rows;
						lookUpCol = colReminder <= -1 ? columns + colReminder : colReminder;
						lookUpRow = rowReminder <= -1 ? rows + rowReminder : rowReminder;
						degreeOfPolarization += board[lookUpCol][lookUpRow]; // corresponde al valor de polarizacion
						if(board[lookUpCol][lookUpRow] > 0)
							numberOfPolarizedCells++;
						if(board[lookUpCol][lookUpRow] == (states-1))
							numberOfBurnedCells++;
          }
        }

        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        degreeOfPolarization -= board[x][y]; 

        // Rules of Life
        //if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Loneliness
        //else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overpopulation
        //else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Reproduction
        //else                                            next[x][y] = board[x][y];  // Stasis
				//Rules of ChaosSynth
				if(board[x][y] == 0) next[x][y] = int(numberOfPolarizedCells/r1) + int(numberOfBurnedCells/r2);
				else if((board[x][y] > 0) && (board[x][y] < (states -1))) next[x][y] = int(k) + int(degreeOfPolarization/numberOfPolarizedCells);
				else if(board[x][y] == states -1) next[x][y] = 0;	
      }
    }

    // Next is now our board
    board = next;
  }

  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void display() {
		float colorStep = 255 / states;
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        //if ((board[i][j] == 1)) fill(0);
        //else fill(255); 
				fill(board[i][j] * colorStep);			
        //stroke(0);
				noStroke();
        rect(i*w, j*w, w, w);
      }
    }
  }

	void draw(int x, int y){
		//board[floor(x/w)][floor(y/w)] = 1;
		x /= w;
		y /= w;
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
				int lookUpCol, lookUpRow;
				int colReminder= (x+i)%columns;
				int rowReminder= (y+j)%rows;
				lookUpCol = colReminder <= -1 ? columns + colReminder : colReminder;
				lookUpRow = rowReminder <= -1 ? rows + rowReminder : rowReminder;
				//lookUpCol = (x+i)%columns <= -1 ? columns -1 : (x+i)%columns;
				//lookUpRow = (y+j)%rows <= -1 ? rows - 1 : (y+j)%rows;
				board[lookUpCol][lookUpRow] = 1;
      }
    }
	}
}
