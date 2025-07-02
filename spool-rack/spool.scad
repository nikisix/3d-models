// L-Bracket 3d Model
// written in openSCAD
//
// Description
// This is an l-bracket.
// The bracket should have two indentations for a 34mm dowel rod
//
// L-Bracket 3d Model
// written in OpenSCAD
//
// Description:
// This is an L-bracket.
// The bracket should have two indentations for a 34mm dowel rod.

// Parameters
bracket_thickness = 10;      // Thickness of the bracket walls (mm)
bracket_width = 10;         // Width of each arm (mm)
bracket_length = 150;        // Length of each arm (mm)
dowel_diameter = 34;        // Diameter of dowel rod (mm)
dowel_indent_depth = 8;     // Depth of indentation for dowel (mm)
dowel_indent_offset = 12;   // Distance from end to indentation center (mm)
screw_body_diameter = 3;        // Diameter of screw holes (mm)
screw_head_diameter = 10;

// Main L-bracket with two dowel indentations
module l_bracket() {
    union() {
        // Arm 1 (vertical)
        cube([bracket_length+screw_head_diameter*4, bracket_width, bracket_thickness]);
        // Arm 2 (horizontal), joined at one end to form an L
        translate([0, bracket_width - bracket_thickness, 0])
            cube([bracket_thickness, bracket_length+screw_head_diameter*4, bracket_thickness]);
        // Nubbin
        translate([bracket_thickness, bracket_length+screw_head_diameter, 0])
          rotate(90)
            cube([bracket_thickness*2, screw_head_diameter*4, bracket_thickness]);
        translate([bracket_length, bracket_width - bracket_thickness, 0])
          rotate(45)
            //cube([bracket_thickness, sqrt((2*(bracket_length/2)^2)), bracket_thickness]);
            cube([bracket_thickness, sqrt(2*bracket_length^2), bracket_thickness]);
    }
}


// // Indentation for dowel on each arm
module cylinder_indent(pos, rot, height, diameter) {
    translate(pos)
        rotate(rot)
            cylinder(h=height, d=diameter, center=false);
}

// // Indentation for dowel on each arm
module dowel_indent(pos, rot) {
    cylinder_indent(
        pos,
        rot,
        bracket_width,
        dowel_diameter
    );
}

// Assemble L-bracket with dowel indentations
difference() {
    l_bracket();
    // Indentation Outer
    #dowel_indent(
        [-dowel_indent_offset, bracket_length, 0],
        [0,0,0]
    );

    // Screw Head indent
    #cylinder_indent(
        [bracket_width*2, bracket_width-2, bracket_thickness/2],
        [-90, 0, 0],
        bracket_width*2,
        screw_head_diameter
    );

    #cylinder_indent(
        [bracket_width*2, 0, bracket_thickness/2],
        [-90, 0, 0],
        bracket_width*2,
        screw_body_diameter
    );

    // Screw Head indent
    #cylinder_indent(
        [bracket_length+screw_head_diameter*2, bracket_width-2, bracket_thickness/2],
        [-90, 0, 0],
        bracket_length,
        screw_head_diameter
    );

    // Screw Body indent
    #cylinder_indent(
        [bracket_length+screw_head_diameter*2, 0, bracket_thickness/2],
        [-90, 0, 0],
        bracket_length,
        screw_body_diameter
    );

}
