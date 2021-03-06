//Simple Image Encryption
int ENCRYPTION_LOW = 0;
int ENCRYPTION_MEDIUM = 1;
int ENCRYPTION_HIGH = 2;
int ENCRYPTION_VERY_HIGH = 3;
void setup(){
size(600, 400);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
// call the fragment function
fragment(ENCRYPTION_HIGH);
}
void fragment(int encryptionLevel){
int fragW = 0;
int fragH = 0;
int frags = 0;
// set size of blocks
switch(encryptionLevel){
case 0:
fragW = width/2;
fragH = height/2;
frags = 4;
break;
case 1:
fragW = width/4;
fragH = height/4;
frags = 16;
break;
case 2:
fragW = width/8;
fragH = height/8;
frags = 64;
break;
case 3:
fragW = width/10;
fragH = height/10;
frags = 100;
break;
}
// fill array with image blocks
PImage[]imgs = new PImage[frags];
int fragCounter = 0;
for (int i=0, ii=0; i<width; i+=fragW, ii++){
for (int j=0, jj=0; j<height; j+=fragH, jj++){
imgs[fragCounter++] = get(i, j, fragW, fragH);
}
}
// call encryption function
encrypt(imgs);
}
//encrypt
void encrypt(PImage[]imgs){
PImage[]imgs2 = new PImage[imgs.length];
for (int i=imgs.length-1; i>=0; i--){
// reverse fragment order
imgs2[abs(i-(imgs.length-1))] = imgs[i];
}
update(imgs2);
}
// repaint Display window
void update(PImage[]imgs){
//reset counter
int counter = 0;
//reassemble image
for (int i=0; i<width; i+=imgs[0].width){
for (int j=0; j<height; j+=imgs[0].height){
image(imgs[counter], i, j);
counter++;
}
}
}