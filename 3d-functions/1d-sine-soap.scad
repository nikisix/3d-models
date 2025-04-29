//VARIABLES
	$fn=64;
	Freq=20;
	Amp=5;
	TrayWidthInside=60;
	TrayLengthInside=100;
	WallThickness=2;
	FloorThickness=2;
//EXEC
	ripple();
	base();
//MODULES
module ripple(){
	translate([-45,-50,0])
		linear_extrude(height=58,scale=([.6,1]))
			for(i=[0:99])
				translate([sin(i*Freq)*Amp,i,0])
				   circle(3);}
module base(){
	difference(){
		baseOuter();
			translate([0,0,FloorThickness])
				#baseInner();}}
module baseOuter(){
	hull(){
		end2(TrayWidthInside/2+WallThickness);
		end2(-(TrayWidthInside/2+WallThickness));}}	   
module baseInner(){
	hull(){
		end(TrayWidthInside/2);
		end(-TrayWidthInside/2);}}
module end(X){
	translate([X,0,0]){
		corner(TrayLengthInside/2);
		corner(-TrayLengthInside/2);}}
module corner(Y){
	translate([0,Y,0])
		cylinder(3,2);}
module end2(X){ //outer end
	translate([X,0,0]){
		corner2(TrayLengthInside/2+WallThickness);
		corner2(-(TrayLengthInside/2+WallThickness));}}
module corner2(Y){ //outer corner with taper
	translate([0,Y,0])
		cylinder(h=4,r1=4,r2=2);}