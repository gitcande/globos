PImage img;

class Globo
{
  float x, y, vx, vy;
  color c;

  Globo(float _x, float _y)
  {
    x = _x;
    y = _y;
    vx = random(-0.25, 0.25);
    vy = random(-2, -0.5);
    c = color(random(255), random(255), random(255));
  }

  void update()
  {
    y += vy;
    x += vx;
  }

  void dibujate()
  {
    // Globo
    fill(c);
    ellipse(x, y, 80, 100);

    // Imagen dentro del globo
    imageMode(CENTER);
    image(img, x, y, 60, 60);

    // Parte de abajo del globo
    fill(c);
    triangle(x, y+50, x-10, y+60, x+10, y+60);

    // Cuerda
    noFill();
    bezier(x, y+60, x-30, y+80, x+30, y+110, x, y+130);
  }
}

ArrayList<Globo> globos;

void setup()
{
  size(640, 480);

  img = loadImage("images.jpg");

  globos = new ArrayList<Globo>();
}

void draw()
{
  background(20, 200, 200);

  for (int i = 0; i < globos.size(); i++)
  {
    globos.get(i).update();
    globos.get(i).dibujate();
  }
}

void mousePressed()
{
  globos.add(new Globo(mouseX, mouseY));
}
