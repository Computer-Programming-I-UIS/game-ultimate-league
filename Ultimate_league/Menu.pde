class Menu{
  
  PImage fondo2, fondo3, fondo4, fondo5;
  int radio=55;

  
   Menu(){
     
   }
  
  void poner(){
    fondo2 = loadImage("00802584.jpg");
     image(fondo2,0,0);    
    boton();
  }
  
  void boton(){
    float data[] = {88.0, 215.0, 345.0, 477.0 }; // arreglo con la posicion en y de los botones
    for(int n=0; n <data.length;n++){ 
      float d = dist(mouseX, mouseY, 145, data[n]);
        if(d<radio&&data[n]==data[0]&&mouseButton==LEFT&&mousePressed){
          game=3;
          mousePressed=false;
          soundMenu.play();
          if(sonido==0){
          ingame.play();
          }
        }else if(d<radio&&data[n]==data[1]&&mouseButton==LEFT&&mousePressed){
          game=2;
          mousePressed=false;
        }else if(d<radio&&data[n]==data[2]&&mouseButton==LEFT&&mousePressed){
          game=5;
          mousePressed=false;
        }else if(d<radio&&data[n]==data[3]&&mouseButton==LEFT&&mousePressed){
          soundMenu.play();
          exit(); 
        }
      }
    }
  
  
  void opciones(){
    fondo3 = loadImage("opciones.jpg");
    image(fondo3,0,0);
    instruccion();
  }
  
  void instruccion(){
       float data[] = { 217.0, 347.0, 483.0 }; // arreglo con la posicion en y de los botones
    for(int n=0; n <data.length;n++){ 
      float d = dist(mouseX, mouseY, 212, data[n]);
        if(d<radio&&data[n]==data[0]&&mouseButton==LEFT&&mousePressed){
          player.pause();
          sonido=1;
          mousePressed=false;
        
        }else if(d<radio&&data[n]==data[1]&&mouseButton==LEFT&&mousePressed){
          player.play();
          sonido=0;
           mousePressed=false;
         
        }else if(d<radio&&data[n]==data[2]&&mouseButton==LEFT&&mousePressed){
          game=1;
          mousePressed=false;
          
        }
     }
  }
  
  void gameover(){
     fondo4 = loadImage("000802584.jpg");
     image(fondo4,0,0);
     if(key=='r'&& keyPressed == true){
       game=3;
        if(game==3){
        if(sonido==0){
          ingame.play();
        }
       bandera=1;
      }
     }
     if(key=='m'&& keyPressed == true){
       game=1;
        if(game==1){
        if(sonido==0){
          player.play();
        }
        bandera=1;
      }
    }
  }
  
  void creditos(){
    fondo5 = loadImage("creditos.png");
    image(fondo5, 0,0);
    if(keyPressed || mousePressed){
      game=1;
      mousePressed=false;
    }
  }
}
