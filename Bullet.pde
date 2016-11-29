class Bullet extends Floater 
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

	public Bullet(SpaceShip theShip)
	{
		setX(theShip.getX());
		setY(theShip.getY());
		setPointDirection((int)theShip.getPointDirection());
		double dRadians =getPointDirection()*(Math.PI/180);
		setDirectionX((5* Math.cos(dRadians)) + theShip.getDirectionX());
		setDirectionY((5* Math.sin(dRadians)) + theShip.getDirectionY());
	}

	public void show()
	{
		noStroke();
		fill(255,255,0);
		ellipse(getX(), getY(), 10, 10);
	}

	public void move()
	{
		myCenterX += myDirectionX;    
    	myCenterY += myDirectionY;     
	}
}


