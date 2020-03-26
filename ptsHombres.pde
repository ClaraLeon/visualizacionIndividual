//crea una tabla que guarda los datos del archivo .csv
Table table;
//me da el valor maximo 
int maxDato;
//numero de filas en el archivo
int rowCount;

//año
String [] anio;

int [] bogotaHombres;
int datoHombres = 0;

/* @pjs preload="bearyBear300.jpg"; */

boolean showGrid =true, showSrcImg, showSubtitle = true; // crea 3 variables que sera usadas mas adelante
PImage srcImg; //img

void setup() {
  //P2D: renderizador de gráficos 2D que utiliza hardware de gráficos compatible con OpenGL./
  size(600, 600, P2D); 
  smooth();
  textAlign(CENTER, CENTER);
  textSize(24);

  srcImg = loadImage("prueba.jpg");

  initGrid(); // esta función esta dentro del archivo GridAndCell
  initPtcs(); //esta función esta en el archivo Ptc

  table = loadTable("hombresVSmujeres.csv", "header");
  //numero de filas en el archivo
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");

  anio = new String [rowCount]; //columna anio
  bogotaHombres = new int [rowCount];

  for (int i = 0; i < rowCount; i++)
  {
    //creamos un objeto que guarda la información de las filas de la tabla
    TableRow row = table.getRow(i);//una variable que guarda los datos de una filas- toda la informacion de las filas

    //guardamos la información de la fila "tiempo" en un arreglo
    anio[i]= row.getString("anio");
    bogotaHombres[i]= row.getInt("bogota-hombres");


    datoHombres = bogotaHombres[i];
    if (datoHombres > maxDato) 
    {
      maxDato = datoHombres;
    }
  }
}

void draw() {

  updatePtcs(); //esta función esta en el archivo Ptc / carga los puntos

  text("hombres", 100, 100); 

  background(0);
  //srcImg.resize(600, 600);
  //if(showSrcImg)image(srcImg, 0, 0); //muestra la imagen con la tecla i / archivo io
  //if(showGrid)drawGrid();  //muestra la grilla con la tecla g / archivo io


  fill(255);
  text("Número de casos de suicidios - BOGOTÁ", width*.5, 50);
  text("Hombres", width*.5, 90);

  for (int i = 0; i < rowCount; i++) 
  {
    //println("yo soy i : " + i);
    //AÑOS
    fill(255);
    if (i==0) {
      text(anio[i], 176, 340);
    }
    if (i==1) {
      text(anio[i], 423, 340);
    }
    if (i==2) {
      text(anio[i], 176, 550);
    }
    if (i==3) {
      text(anio[i], 423, 550);
    }
  }

  drawPtcs(); //esta función esta en el archivo Ptc / dibuja los puntos
  if (showSubtitle) { // si show subtitle es verdadero entonces muestre esto y si no - acción archivo io
    fill(0);
    noStroke();
    rect(50, 30, 500, 580);
    fill(255);
    text("¡Da click sobre los circulos!", width*.5, 50);
  }

  for (int i = 0; i < rowCount; i++) 
  {

    fill(0);
    if (i==0) {
      text(bogotaHombres[i], 176, 245);
    }
    if (i==1) {
      text(bogotaHombres[i], 423, 245);
    }
    if (i==2) {
      text(bogotaHombres[i], 176, 464);
    }
    if (i==3) {
      text(bogotaHombres[i], 423, 464);
    }
  }


  for (int i = 0; i < rowCount; i++)  //desde la 0 hasta la 13
  {
    //      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
    int tamano =  int(map(bogotaHombres[i], 0, maxDato, 50, 130));

    stroke(#E0BA22);
    noFill();
    strokeWeight(1);
    if (i==0) {
      ellipse(176, 245, tamano, tamano);
    }
    if (i==1) {
       ellipse(423, 245, tamano, tamano);
    }
    if (i==2) {
      ellipse(176, 464, tamano, tamano);
    }
    if (i==3) {
       ellipse(423, 464, tamano, tamano);
    }
  }

 /* stroke(#E0BA22);
  noFill();
  strokeWeight(1);
  ellipse(176, 245, 130, 130);
  ellipse(423, 245, 130, 130);
  ellipse(176, 464, 130, 130);

  stroke(#1DED5D);
  ellipse(423, 464, 130, 130);*/
}
