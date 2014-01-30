/* ***************************
 * Cellular Automata generator
 * ***************************
 *
 * based on Daniel Shiffman code
 *
 * Date: January the 30th, 2014
 *
 * Info: paolondon@gmail.com
 */

CellularAutomata theCA;

void setup() {
  // change this according to the dimensions of the image you want to obtain
  // a big image could lead to memory problems: set a smaller or increase memory (Processing preferences)
  size(1400,800); 
  // The rule must be inserted in reverse order
  // (rule 2 becomes 0,1,0,0,0,0,0,0, instead of 0,0,0,0,0,0,1,0)
  int[] ruleSet = {0,1,0,1,1,0,1,0}; // Sierpinski Gasket (Rule 90)
  // int[] ruleSet = {0,1,1,1,1,0,0,0}; // Rule 30 (interesting chaotic 
  theCA = new CellularAutomata(ruleSet);
  theCA.generate();
  save("ca.png"); // saves the resulting drawing into the sketch folder
}
