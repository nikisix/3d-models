include <BOSL2/std.scad>

size = 45;
s2 = 20;
difference() {
  //bracket
  cuboid([size*1.5, size, size], center = true, rounding=2);
  translate(v = [s2/1.5,0,s2/1.5]) cube([size*1.5, size-s2, size], center = true);
  translate(v = [s2-10,0,s2+1]) rotate([90,0,0]) cyl(h=size+1, r=s2*1.5, center = true, $fn = 100);
  translate(v = [size,0,s2/1.5]) cube([size*1.5, size+s2, size], center = true);

  //screw holes
  //vertical
  translate(v=[-5,0,-(size-s2-2)]) cyl(h=14, r1=3.5, r2=5, chamfer2=-3, center=false);
  translate(v=[20,0,-(size-s2-2)]) cyl(h=14, r1=3.5, r2=5, chamfer2=-3, center=false);

  //horizontal
  translate(v=[-34,0,3]) rotate([0,90,0]) cyl(h=14, r1=8, r2=8, center=false);
}
