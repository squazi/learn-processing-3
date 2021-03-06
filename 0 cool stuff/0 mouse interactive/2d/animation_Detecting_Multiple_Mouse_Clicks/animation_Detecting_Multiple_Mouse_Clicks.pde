// Detecting Multiple Mouse Clicks
int clickCount = 0;
void setup(){
size(400, 400);
smooth();
}
void draw(){
background(255);
translate(width/2, height/2);
rotate(frameCount*PI/180);
drawPoly();
}
void mouseClicked(){
clickCount = mouseEvent.getClickCount();
}
void drawPoly(){
// draw point if single click
if (clickCount==1){
point(0, 0);
}
else {
float ang = 0;
int verts = clickCount;
beginShape();
for (int i=0; i<verts; i++){
ang += 360.0/verts;
vertex(cos(radians(ang))*150.0, sin(radians(ang))*150.0);
}
endShape(CLOSE);
}
}