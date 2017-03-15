void decode(){
  for (int i = 0; i < 9; i++){
    for (int j = 0; j < 9; j++){
      if (cell[i][j] == 0) code[i][j] = power2(9) - 1;
      else code[i][j] = power2(cell[i][j] - 1);
    }
  }
}
void encode(){
  for (int i = 0; i < 9; i++){
    for (int j = 0; j < 9; j++){
      if (numCheck(code[i][j])) cell[i][j] = log2(code[i][j]) + 1;
    }
  }
}
boolean isThere(int num, int i, int j){
  if (code[i][j]/power2(num-1)%2 == 1) return true;
  else return false;
}
void crossOut(int num, int i, int j){
  if (isThere(num, i, j)) code[i][j] -= power2(num - 1);
}
boolean numCheck(int num){
  if (num % 2 == 0) return numCheck(num/2);
  else if (num == 1) return true;
  else return false;
}
int log2(int num){ //example log of 32 is 5
  if (num == 1) return 0;
  return log2(num/2) + 1;
  //return null;
}
int power2(int num){
  if (num == 0) return 1;
  return 2*power2(num-1);
}
int[] box(int unit){
  int ro = unit / 3;
  int co = unit % 3;
  int zone[] = new int[9];
  for (int i = 0; i < 3; i++){
    for (int j = 0; j < 3; j++){
      zone[3*i + j] = cell[3*ro + i][3*co + j];
    }
  }
  return zone;
}
int row(int box, int sq){
  int ro = box/3;
  int jo = sq/3;
  return 3*ro + jo;
}
int col(int box, int sq){
  int co = box%3;
  int ko = sq%3;
  return 3*co + ko;
}
boolean inRow(int num, int unit){
  for (int i : cell[unit]){
    if (i == num) return true;
  }
  return false;
}
boolean inCol(int num, int unit){
  for (int i = 0; i < 9; i++){
    if (cell[i][unit] == num) return true;
  }
  return false;
}
boolean inBox(int num, int unit){
  for (int i: box(unit)){
    if (i == num) return true;
  }
  return false;
}
boolean contains(final int[] array, final int key) {
    for (final int i : array) {
        if (i == key)
            return true;
    }
    return false;
}