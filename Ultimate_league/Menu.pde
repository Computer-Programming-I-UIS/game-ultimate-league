class Menu{
  PImage fondo2, fondo3, fondo4;
  int radio=55;
  
   Menu(){
    
  }
  
  void poner(){
    fondo2 = loadImage("00802584.jpg");
    
    image(fondo2,0,0);    
    boton();
   
  }
  void boton(){
    float data[] = { 204.0, 336.0, 477.0 }; // arreglo con la posicion en y de los botones
    for(int n=0; n <data.length;n++){ 
      float d = dist(mouseX, mouseY, 145, data[n]);
        if(d<radio&&data[n]==data[0]&&mouseButton==LEFT&&mousePressed){
          game=3;
        }else if(d<radio&&data[n]==data[1]&&mouseButton==LEFT&&mousePressed){
          game=2;
        }else if(d<radio&&data[n]==data[2]&&mouseButton==LEFT&&mousePressed){
          exit(); 
        }
    }
     
  }
  void opciones(){
    
    fondo3 = loadImage("opciones.jpg");
    image(fondo3,0,0);
    println(mouseX);
    println(mouseY);
    instruccion();
    
    
  }
  
  void instruccion(){
       float data[] = { 217.0, 347.0, 483.0 }; // arreglo con la posicion en y de los botones
    for(int n=0; n <data.length;n++){ 
      float d = dist(mouseX, mouseY, 212, data[n]);
      //ellipse(212,data[0], radio*2, radio*2);
      //ellipse(212,data[1], radio*2, radio*2);
      //ellipse(212,data[2], radio*2, radio*2);
        if(d<radio&&data[n]==data[0]&&mouseButton==LEFT&&mousePressed){
          player.pause();
          
        }else if(d<radio&&data[n]==data[1]&&mouseButton==LEFT&&mousePressed){
          player.play();
          
        }else if(d<radio&&data[n]==data[2]&&mouseButton==LEFT&&mousePressed){
          game=1; 
         
        }
    }
  }
  
  void gameover(){
     fondo4 = loadImage("000802584.jpg");
     image(fondo4,0,0);
     if(key=='r'&& keyPressed == true){
       game=3;
     }
     if(key=='m'&& keyPressed == true){
       game=1;
     }
     
     
  }
}
