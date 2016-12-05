
class Star
{
  private int myX, myY;
  public Star() 
  { 
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
  }

  private int myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), 120);

  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, 5, 5);
  }
}
