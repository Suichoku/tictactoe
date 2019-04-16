class Tile {

  int[] position;
  int state;
  
  public Tile(int[] position) {
    
    this.position = position;
    this.state = 0;
  } // constructor
  
  public int mark(int state) {
    
    if(this.state == 0) {
    
      this.state = state;
      return 0;
    } return -1;
  } // method: mark
} // class
