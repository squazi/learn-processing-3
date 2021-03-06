// create original myColor
color myColor = color(200, 175, 100, 200);
println("myColor = " + myColor);
println("myColor in binary = " + binary(myColor));
// extract myColor ARGB components
int a = myColor >> 24 & 0xFF;
println("alpha = " + a);
int r = myColor >> 16 & 0xFF;
println("red = " + r);
int g = myColor >> 8 & 0xFF;
println("green = " + g);
int b = myColor & 0xFF;
println("blue = " + b);
// build newColor from myColor components
color newColor = (a << 24) | (r << 16) | (g << 8) | b;
println("newColor = " + newColor);
println("newColor in binary = " + binary(newColor));