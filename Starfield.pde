NormalParticle[] bob;
void setup()
{
	size(500,500);
	background(0);
	bob = new NormalParticle[1000];
	for (int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
		bob[0] = new OddballParticle();
	}

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
		speed = (Math.random()*11);
		angle = (Math.random()*3)*(Math.PI);
		myX = 250;
		myY = 250;
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move()
	{
		myX = myX + (Math.cos(angle))*(speed);
		myY = myY + (Math.sin(angle))*(speed);
	}
	public void show()
	{
		fill(myColor,125);
		noStroke();
		ellipse((int)myX,(int)myY,8,8);
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	public void move()
	{
		myX = myX + (int)(Math.random()*7);
		myY = myY + (int)(Math.random()*7);
	}
	public void show()
	{
        fill(myColor,200);
        noStroke();
        rect((int)myX,(int)myY,20,20);
	}
}
class JumboParticle //uses inheritance
{
	//your code here
}

