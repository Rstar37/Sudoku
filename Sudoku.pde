int cell[][];
int code[][] = new int[9][9];
int iunit = 20;
int junit = 20;
int gap = 10;
void setup(){
  //size(2*gap + 9*iunit, 2*gap + 9*junit);
  size(800, 800);
  cell = hardproblem();
  decode();
  
  display();
  frameRate(1);
}
void draw(){
  //decode();
  for (int number = 1; number < 10; number++){
    for (int Box = 0; Box < 9; Box++){
      if (inBox(number, Box)){
        for (int b = 0; b < 9; b++){
          if(box(Box)[b] == 0) crossOut(number, row(Box, b), col(Box, b));
        }
      }
      else{
        for (int b = 0; b < 9; b++){
          if(box(Box)[b] == 0){
            if(inRow(number, row(Box, b))) crossOut(number, row(Box, b), col(Box, b));
            else if(inCol(number, col(Box, b))) crossOut(number, row(Box, b), col(Box, b));
          }
        }
      }
    }
  }
  encode();
  display();
  //displaycode();
}
int[][] problem(){
int cell[][] = {{0, 0, 0, 9, 8, 7, 0, 2, 0}, 
                {0, 7, 8, 0, 5, 0, 1, 0, 9}, 
                {0, 0, 2, 3, 0, 0, 0, 0, 0}, 
                {6, 1, 0, 7, 0, 5, 3, 0, 0}, 
                {0, 0, 3, 0, 4, 0, 5, 0, 0}, 
                {0, 0, 5, 1, 0, 3, 0, 4, 6}, 
                {0, 0, 0, 0, 0, 6, 2, 0, 0}, 
                {1, 0, 7, 0, 3, 0, 6, 8, 0}, 
                {0, 5, 0, 8, 1, 2, 0, 0, 0}};
      return cell;
}
int[][] hardproblem(){
int cell[][] = {{0, 0, 0, 0, 3, 1, 0, 0, 0}, 
                {0, 9, 1, 0, 0, 0, 0, 0, 3}, 
                {0, 2, 0, 6, 0, 0, 5, 0, 0}, 
                {0, 0, 9, 2, 0, 0, 4, 0, 7}, 
                {0, 0, 0, 3, 0, 9, 0, 0, 0}, 
                {7, 0, 5, 0, 0, 6, 9, 0, 0}, 
                {0, 0, 3, 0, 0, 8, 0, 2, 0}, 
                {1, 0, 0, 0, 0, 0, 6, 4, 0}, 
                {0, 0, 0, 7, 5, 0, 0, 0, 0}};
      return cell;
}
int[][] worldhardestproblem(){
int cell[][] = {{8, 0, 0, 0, 0, 0, 0, 0, 0}, 
                {0, 0, 3, 6, 0, 0, 0, 0, 0}, 
                {0, 7, 0, 0, 9, 0, 2, 0, 0}, 
                {0, 5, 0, 0, 0, 7, 0, 0, 0}, 
                {0, 0, 0, 0, 4, 5, 7, 0, 0}, 
                {0, 0, 0, 1, 0, 0, 0, 3, 0}, 
                {0, 0, 1, 0, 0, 0, 0, 6, 8}, 
                {0, 0, 8, 5, 0, 0, 0, 1, 0}, 
                {0, 9, 0, 0, 0, 0, 4, 0, 0}};
      return cell;
}
String strSquare(String S){
  if(S.length() > 3)
      return S.substring(0, 3) + '\n'+ strSquare(S.substring(3));
    else return S;
}
void display(){
  scale(4);
  textSize(junit);
  for (int i = 0; i < cell[0].length; i++){
    for (int j = 0; j < cell.length; j++){
      fill(255);
      rect(10+i*iunit, 10+j*junit, iunit, junit);
      fill(0);
      if (cell[j][i] > 0){
        text(cell[j][i], gap + i*iunit + 5, gap + (j+1)*junit - 3);
      }
      else {
        textSize(junit/3);
        textLeading(5);
        String rev = new String(reverse(Integer.toString(code[j][i], 2).toCharArray()));
        text(strSquare(rev), gap + i*iunit + 5, gap + (j+1)*junit - 13);
        textSize(junit);
      }
    }
  }
}
void displaycode(){
  //scale(4);
  translate(200, 0);
  textSize(junit/3);
  for (int i = 0; i < code[0].length; i++){
    for (int j = 0; j < code.length; j++){
      fill(255);
      rect(10+i*iunit, 10+j*junit, iunit, junit);
      //if (code[j][i] > 0){
        fill(0);
        text(code[j][i], gap + i*iunit + 5, gap + (j+1)*junit - 3);
      //}
    }
  }
}
void loopSolve(){
  
}