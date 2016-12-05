
class Asteroid extends Floater
{
  public String confirmation() {return "Asteroid";}

  protected int rotSpeed;
  public void setrotSpeed(int x) {rotSpeed = x;}
  public int getrotSpeed() {return rotSpeed;}

  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() { return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() { return myPointDirection;}





  public Asteroid()
  {
    rotSpeed = (int)(Math.random()*8-4);

    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20;
    yCorners[0] = -15;
    xCorners[1] = 7;
    yCorners[1] = -15;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -20;
    yCorners[4] = 15;
    xCorners[5] = -5;
    yCorners[5] = 0;



      myColor = color(128,128,128);
      setX((int)(Math.random()*600));
      setY((int)(Math.random()*600));
      setDirectionX((int)(Math.random()*8-4));
      setDirectionY((int)(Math.random()*8-4));
      setPointDirection((int)(Math.random()*360));
  }




  public void move()
  {
    rotate(rotSpeed);       
    super.move();
  }


  

}





// Testing mode (TM)
class SmallAsteroid extends Asteroid
{
  public String confirmation() {return "SmallAsteroid";}

  public SmallAsteroid(Asteroid rock)
  {
    setrotSpeed((int)(Math.random()*8-4));

    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -15;
    yCorners[0] = -10;
    xCorners[1] = 2;
    yCorners[1] = -10;
    xCorners[2] = 8;
    yCorners[2] = 0;
    xCorners[3] = 1;
    yCorners[3] = 5;
    xCorners[4] = -10;
    yCorners[4] = 10;
    xCorners[5] = -5;
    yCorners[5] = 0;



      myColor = color(128,128,128);
      setX((int)(rock.getX()));
      setY((int)(rock.getY()));
      setDirectionX((int)(Math.random()*8-4));
      setDirectionY((int)(Math.random()*8-4));
      setPointDirection((int)(Math.random()*360));
  }

}