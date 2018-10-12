Particle[] bob;
void setup()
{
	size(500,500);
	background(0);
	bob = new Particle[1000];
	for (int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
	}
	bob[0] = new OddballParticle();
	bob[1] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i < bob.length; i++)
	{
		bob[i].show();
		bob[i].move();
	}
}
class NormalParticle implements Particle
{
	double myX, myY, speed, angle;
	color myColor;
	NormalParticle()
	{
		speed = (Math.random()*8);
		angle = (Math.random()*3)*(Math.PI);
		myX = 250;
		myY = 250;
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move()
	{
		myX = myX + (Math.cos(angle))*(speed);
		myY = myY + (Math.sin(angle))*(speed);
		if (myX > 1000 || myY > 1000 || myX < -500 || myY < -500)
		{
			myX = myY = 250;
		}
	}
	public void show()
	{
		fill(myColor,125);
		noStroke();
		quad((int)myX,(int)myY,(int)myX+7,(int)myY+7,(int)myX,(int)myY+14,(int)myX-7,(int)myY+7);
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int myX, myY;
	color myColor;
	OddballParticle()
	{
		myX = myY = 300;
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move()
	{
		myX = myX + (int)(Math.random()*5)-2;
		myY = myY + (int)(Math.random()*5)-2;
	}
	public void show()
	{
        fill(myColor);
        noStroke();
        rect((int)myX,(int)myY,50,50);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill(myColor,125);
		noStroke();
		quad((int)myX,(int)myY,(int)myX+30,(int)myY+30,(int)myX,(int)myY+60,(int)myX-30,(int)myY+30);
	}
}