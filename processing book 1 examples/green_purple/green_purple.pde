// bitwise operations
size(200, 300);
noStroke();
color c = color(45, 120, 96);
// fill top of window
fill(c);
rect(0, 0, width, height/2);
// get color components
int r = c >> 16 & 0xFF;
int g = c >> 8 & 0xFF;
int b = c & 0xFF;
int a = c >> 24 & 0xFF;
// alter component values
r += 100;
g -= 50;
b += 100;
// combine components back into a 32-bit integer
c = (a << 24) | (r << 16) | (g << 8) | b;
// fill bottom of window
fill(c);
rect(0, height/2, width, height/2);