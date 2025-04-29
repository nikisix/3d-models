// dice.scad

difference () {
    // dice with rounded corners
    intersection() {
        cube(15, center=true);
        sphere(10);
    }

    //one
    translate([0, 0, 7.5]) sphere(1);

    //six
    translate([ 3,  3, -7.5]) sphere(1);
    translate([ 0,  3, -7.5]) sphere(1);
    translate([ 0, -3, -7.5]) sphere(1);
    translate([-3, -3, -7.5]) sphere(1);
    translate([ 3, -3, -7.5]) sphere(1);
    translate([-3,  3, -7.5]) sphere(1);
    
    //two
    translate([ 3, 7.5,  3]) sphere(1);
    translate([-3, 7.5, -3]) sphere(1);

    //four
    translate([ 3, -7.5,  3]) sphere(1);
    translate([-3, -7.5, -3]) sphere(1);
    translate([ 3, -7.5, -3]) sphere(1);
    translate([-3, -7.5,  3]) sphere(1);

    //three
    translate([7.5,  3, -3]) sphere(1);
    translate([7.5,  0,  0]) sphere(1);
    translate([7.5, -3,  3]) sphere(1);
    
    //Five
    translate([-7.5,  0,  0]) sphere(1);
    translate([-7.5,  3,  3]) sphere(1);
    translate([-7.5, -3, -3]) sphere(1);
    translate([-7.5, -3,  3]) sphere(1);
    translate([-7.5,  3, -3]) sphere(1);

}

echo(version=version());
