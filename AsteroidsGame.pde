SpaceShip astroBoy = new SpaceShip();
ArrayList <Asteroid> aster = new ArrayList <Asteroid>();
Star[] twinkle = new Star[200];
ArrayList <Bullet> bullets = new ArrayList <Bullet>();


public void setup() 
{
  size(600,600);
  for (int i = 0; i < twinkle.length; i++)
  {
    twinkle[i] = new Star();
  }

  for (int i = 0; i < 15; i++)
  {
    aster.add(new Asteroid());
  }
}





public void draw() 
{
  background(0);
  for (int i = 0; i < twinkle.length; i++)
  {
    twinkle[i].show();
  }


  for (int i = 0; i < aster.size(); i++)
  {
    aster.get(i).show();
    aster.get(i).move();

    if (dist(astroBoy.getX(),astroBoy.getY(),aster.get(i).getX(),aster.get(i).getY()) < 20)
      aster.remove(i);
    }
  

    for (int i = 0; i < bullets.size(); i++)
    {
      bullets.get(i).show();
      bullets.get(i).move();
    }

    for (int i = 0; i < aster.size(); i++)
    {
      for (int j = 0; j < bullets.size(); j++)
      {
        if (dist(aster.get(i).getX(), aster.get(i).getY(), bullets.get(j).getX(), bullets.get(j).getY()) < 20)
        {
          if (aster.get(i).confirmation() == "Asteroid")
          {
            aster.add(new SmallAsteroid(aster.get(i)));
            aster.add(new SmallAsteroid(aster.get(i)));
            aster.remove(i);
            bullets.remove(j);
            break;
          }
          else
          {
            aster.remove(i);
            bullets.remove(j);
            break;
          }
        }
      }
    }

    astroBoy.show();
    astroBoy.move();

    if (aster.size() == 0)
    {
      textSize(50);
      textAlign(CENTER);
      fill(255,255,255);
      text("YOU WON!", 300, 300); 
    }
}


public void keyPressed() 
{
    if (key == CODED) 
    {
        if (keyCode == LEFT)
          astroBoy.rotate(-30);
        if (keyCode == RIGHT)
          astroBoy.rotate(30);
        if (keyCode == UP)
        {
          astroBoy.accelerate(0.2);
        }
        if (keyCode == DOWN)
        {
         astroBoy.setDirectionX(0);
         astroBoy.setDirectionY(0);
         astroBoy.setX((int)(Math.random()*600));
         astroBoy.setY((int)(Math.random()*600));
         astroBoy.setPointDirection((int)(Math.random()*360));
        }
    }

    if (key == ' ')
    {
      bullets.add(new Bullet(astroBoy));
    }
    
    if (key == CODED)
    {
      if ((keyCode == RIGHT) && (key == ' '))
      {
        astroBoy.rotate(30);
        bullets.add(new Bullet(astroBoy));
      }
    }
}



