// Cute Ghost Cup - 3D Printable Desk Organizer
// Parameters
height = 110;      // Total height in mm
outer_diam = 85;   // Outer base diameter
wall_thickness = 3;
inner_diam = 68;   // Interior for 12oz can
face_offset = 25;  // Vertical position of face

// Main body
difference() {
    union() {
        // Tapered body
        cylinder(h=height*0.75, d1=outer_diam, d2=outer_diam*0.95, $fn=80);
        
        // Wavy base
        for(i = [0:5]) {
            rotate([0,0,i*60]) 
                translate([outer_diam/2 - 8, 0, height*0.05])
                    scale([1.1, 0.7, 1]) 
                    cylinder(h=height*0.32, d=outer_diam*0.48, $fn=50);
        }
    }
    
    // Hollow interior
    translate([0,0,wall_thickness]) 
        cylinder(h=height, d=inner_diam, $fn=80);
    
    // Clean top rim
    translate([0,0,height - 8]) 
        cylinder(h=20, d=outer_diam + 2, $fn=80);
}

// Debossed face
translate([0, outer_diam/2 - 10, height - face_offset]) {
    // Eyes
    translate([-13, 0, 10]) sphere(r=5.5, $fn=30);
    translate([13, 0, 10]) sphere(r=5.5, $fn=30);
    // Mouth
    translate([0, -3, 4]) rotate([90,0,0]) cylinder(h=4, d=7, center=true, $fn=30);
    // Cheeks
    translate([-19, -6, 5]) sphere(r=2.5, $fn=20);
    translate([19, -6, 5]) sphere(r=2.5, $fn=20);
}