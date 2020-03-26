Grid g; //Crear un elemento de la clase g

void initGrid() {
  g = new Grid(100); // dar un valor al elemento g - 100 equivale a el tamaño en decimal de una celda
}

void drawGrid() {
  g.display();
}

class Grid { //CLASE GRID------------------------------------------------------------------------------------

  Cell [][] cells; //Arreglo 2d 
  int cols, rows; // numero de filas y columnas del arreglo
  float cellSize; // tamaño de la celda 

  Grid(float cellSize) { //VALOR DE LA CLASE

    this.cellSize = cellSize; //? obtener el valor la esta clase ???

    //Aquí  coge el tamaño de la celda y lo divide por el ancho y el ato del canvas para dar el numero de filas y columnas
    // ceil redondea el número decimal, es decir convierte el valor a entero por ejermplo si el valor es 5.6 lo derondea a 6.
    //float() convierte el valor de la operación a un decimal.
    rows = ceil(float(width)/cellSize);  
    cols = ceil(float(height)/cellSize);

    //println("filas: " + rows + " columnas: " + cols); 

    cells = new Cell[rows][cols]; // se asigna al arreglo el valor de filas y columnas

    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        cells[i][j] = new Cell(); //En cada celda del arreglo 2d estará la lista de la Clase cell
      }
    }
  }

  void display() { //aquí se crea la CUADRICULA

    for (int i=0; i<rows; i++) { //recorre las filas {0,1,2,3,4,5}
      for (int j=0; j<cols; j++) { // recorre las columnas {0,1,2,3,4,5}

        //cuadros que conforman la cuadricula
        noFill(); 
        strokeWeight(2);
        stroke(0, 255, 255, 64);
        float tmpX = j*cellSize; // posición X valor de j *100 (ojo teniendo en cuenta 0,1,2,3,4,5)
        float tmpY = i*cellSize; // posición y valor de i *100 (ojo teniendo en cuenta 0,1,2,3,4,5)

        //println("esto es i: " + i + "esto es j: " + j);
        rect(tmpX, tmpY, cellSize, cellSize);
      }
    }
  }
}

class Cell { // CLASE CELL------------------------------------------------------------------------------------

  //las listas seven igual que un arreglo solo que sirven para añadir, quitar y encontrar elementos mas facilmente. 
  // Se crea una lista que contendra elementos PTC -> Esto esta en el archivo Ptc
  ArrayList <Ptc> containingPtcs; //esta lista se llamará containingPtcs - se declara aquí

  //Aqui se indica que cell contiene una lista
  Cell() {
    containingPtcs = new ArrayList<Ptc>(); // se inicializa aquí
  }
}
