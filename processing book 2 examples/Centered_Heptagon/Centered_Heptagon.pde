void polygon(int sideCount, float radius) {
float theta = 0.0;
float x = 0.0;
float y = 0.0;
beginShape();
for (int i=0; i<sideCount; i++) {
x = cos(theta)*radius;
y = sin(theta)*radius;
vertex(x, y);
theta += TWO_PI/sideCount;
}
endShape(CLOSE);
} // end polygon
void setup(){
size(400, 400);
background(255);
fill(100);
translate(width/2, height/2);
rotate(PI/7);
polygon(7, 100.0);
}