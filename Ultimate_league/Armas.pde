class Armas {
 
  PVector bulletPosition;                    //position and velocity vectors used in the calculation
  PVector bulletVelocity;                    //of movement. There is no acceleration vector because they have a constant speed
  boolean bulletHidden;                      //determines whether physics should be updated and if it should be drawn or not
  int bulletSize;                            //the diameter of the bullet
  int bulletCreationTime;                    //used in calculating the lifespan of the bullet
  int bulletLifespan;                        //the time in milli seconds that bullets last  
  int bulletSpeed;                           //the speed of the bullet

  //Constructor that sets the default values for the vars above
  Armas(){
    bulletHidden = true;
    bulletSize = 5;
    bulletPosition = new PVector();
    bulletVelocity = new PVector();
    bulletCreationTime = 0;
    bulletLifespan = 2000;
    bulletSpeed = 3;
  }

  //Handles the bullet movement. It only runs calculations if the bullet is active and checks that the bullet is not past its lifespan.
  //it also handles screen wrapping
  void update(){
    if (!bulletHidden){
      bulletPosition.add(bulletVelocity);
      if (millis() - bulletCreationTime > bulletLifespan)
        {bulletHidden = true;}
    bulletPosition.x %= width;
    if(bulletPosition.x < -1)
      {bulletPosition.x = width;}
    bulletPosition.y %= height;
    if(bulletPosition.y < -1)
      {bulletPosition.y = height;}
    }
  }

  //Draw the function after ensuring the bullet is active
  void drawBullet(){
    if (!bulletHidden){
      update();
      ellipse(bulletPosition.x, bulletPosition.y, bulletSize, bulletSize);
    }
  }

  //This function is called when the bullet is 'dead' and is now being recycled. It handles the restting of the 
  //applicabel variables. This method of reusing objects and limiting object instantiation was implemented in an 
  //effort to increase the performance of the game. 
  void reset(PVector pos, PVector spe, float direct){
    bulletPosition = new PVector(pos.x + (20 * cos(radians(direct) - PI/2)), pos.y + (20 * sin(radians(direct) - PI/2)));
    bulletVelocity.x = bulletSpeed * cos(radians(direct) - PI/2) + spe.x;
    bulletVelocity.y = bulletSpeed * sin(radians(direct) - PI/2) + spe.y;
    bulletCreationTime =  millis();
    bulletHidden = false;
  }
}
