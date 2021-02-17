class Menu{
  PImage fondo2, fondo3;
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
    fill(75, 255, 255);
    textSize(12);
    text("FPS:" + frameRate, width-64, height-8);
    
  }
  
  void instruccion(){
       float data[] = { 204.0, 336.0, 477.0 }; // arreglo con la posicion en y de los botones
    for(int n=0; n <data.length;n++){ 
      float d = dist(mouseX, mouseY, 212, data[n]);
        if(d<radio&&data[n]==data[0]&&mouseButton==LEFT&&mousePressed){
          player.play();
        }else if(d<radio&&data[n]==data[1]&&mouseButton==LEFT&&mousePressed){
          player.pause();
        }else if(d<radio&&data[n]==data[2]&&mouseButton==LEFT&&mousePressed){
          game=1; 
        }
    }
  }
}
