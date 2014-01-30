// based on Daniel Shiffman example

// NOTES:
// a line of cells is called "a generation"

class CellularAutomata {
  int[] cells; // stores the cells for one line
  int[] ruleset; // holds the computeStateFromUpperCellsStateset (256 computeStateFromUpperCellsStates are possible, given in reverse binary from, from 0 to 255)
  final int cellSize = 3;
  int generation = 0;
  final int maxGen;
    
  CellularAutomata(int[] ruleset) {
    this.cells = new int[width/cellSize];
    this.ruleset = ruleset;
    this.cells[this.cells.length/2] = 1; // initialize the middle cell (everything starts here!)
    this.maxGen = height/cellSize;
  }
  
  void generate() {
    
    // loop over all the lines that can fit into the image window
    for (generation=0; generation<maxGen; generation++) {
      
      // compute the next generation cells applying the rule to the cells of this generation
      int[] nextGen = new int[cells.length];
      
      // compute the first cell of the row (considering the upper left cell 0)
      nextGen[0] = computeStateFromUpperCellsStates(0,cells[0],cells[1]);
      // loop over the cells of the row
      for (int i=1; i< cells.length-1; i++) {
        nextGen[i] = computeStateFromUpperCellsStates(cells[i-1], cells[i], cells[i+1]);
      }
      // compute the last cell of the row (considering the upper right cell 0)
      nextGen[cells.length-1] = computeStateFromUpperCellsStates(cells[cells.length-2],cells[cells.length-1],0);
      
      // actually draw this generation
      drawGeneration();
      
      // the generation computed at this iteration (nextGen) will be drawn at next iteration
      cells = nextGen;
      
    } // loop over all the lines
  } // generate method
  
  int computeStateFromUpperCellsStates(int a, int b, int c) {
    String s = "" + a + b + c;
    // the decimal number corresponding to the string concatenation
    int index = Integer.parseInt(s,2);
    // returns the value as stated in the ruleset
    return ruleset[index];
  }
  
  // draws a generation on screen
  void drawGeneration() {
    for (int i=0; i<cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else fill(255);
      stroke(0); // a cool variant is stroke(255) --> avoids the grid effect
      rect(i*cellSize, generation*cellSize, cellSize, cellSize);
    }
  }
}
