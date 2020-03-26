boolean onPressed;

void mousePressed(){
  showSubtitle = false; //esta true al dar play (variable bearybear) al dar click desaparece y pasa a ser false
  onPressed = true; // se presiona el click - Verdadero
  
}

void mouseReleased(){
  onPressed = false; // NO se presiona el click - Falso
  
}

void keyPressed(){
  if(key == 'g'){
    showGrid = !showGrid; // muestra la grilla
  }
  else if(key == 'i'){
    showSrcImg = !showSrcImg; // muestra la imagenen
  }
}
