class SpaceShip extends Floater 
{   
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


    public SpaceShip()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -4;
      yCorners[3] = 0;

      myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
      setX(300);
      setY(300);
      setDirectionX(0);
      setDirectionY(0);
      setPointDirection(0);
    }

}
