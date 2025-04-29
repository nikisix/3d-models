include <BOSL2/std.scad>
path = [for(theta = [0:360]) [25*cos(theta), 25*sin(theta), 4*cos(theta*4)]];
normal = [for(theta = [0:360]) [cos(theta), sin(theta),0]];
zrot(-120)
difference(){
  cyl(r=25, h=20, $fn=120);
  path_text(path, "A sine wave wiggles", font="Liberation Mono", lettersize=5/1.2, size=5, normal=normal);
}