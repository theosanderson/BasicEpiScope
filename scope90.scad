$fn=90;
use <./threads.scad>

offset = 80;

module aligned_cube( size, align = [ 0, 0, 0 ] )
 translate(size/2*[[align[0],0,0],[0,align[1],0],[0,0,align[2]]])
  cube( size, center = true );


module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
}

module quad_copy(){
   # copy_mirror([1,0,0])copy_mirror() children();
}

module make_holes(){
    difference(){
        union(){children();}
        quad_copy(){
            translate([30,30,0]) cylinder(r=1.5,h=150,center=true);
        }
        
    
}
}

function rms_radius(tight=false) = let(
    nominal_r = 25.4*0.8/2,
    adjustment = tight ? -0.25 : 0
) nominal_r+adjustment;


module lid(internal_height=26+6, internal_dim=40,thickness=3, flange=15){
    difference(){
    union(){
        
pitch=0.7056;
radius = rms_radius();

translate([0,0,35]){
    translate([0,0,offset])
inner_thread(radius=radius-0.1,pitch=pitch,thread_base_width = 0.60,thread_length=5);
    

difference(){
cylinder(r=radius+2,h=5+offset);
    cylinder(r=radius+0.45-0.1,h=6+offset);
    
}
}
    aligned_cube([internal_dim+flange*2, internal_dim+flange*2, thickness],align=[0,0,1]);
    aligned_cube([internal_dim+thickness*2, internal_dim+thickness*2, internal_height+thickness],align=[0,0,1]);
        
        
    }
    aligned_cube([internal_dim, internal_dim, internal_height],align=[0,0,1]);
    cylinder(r=10,h=50);
    
}
    
}

torch_hole = 12*1.3*1.03;



module full_top_bit(){
    translate([0,0,-offset])
color("green")
difference(){
    union(){
make_holes() lid();
        translate([0,40/2,21]) rotate([-90,0,0]) cylinder(r=1.3*torch_hole/2,h=30);

    }
translate([0,0,21])
rotate([-90,0,0]) cylinder(r=torch_hole/2,h=50);
}
}



module bottom_bit( internal_dim=40,thickness=3, flange=15){
    difference(){
        union(){
aligned_cube([internal_dim+flange*2,internal_dim+flange*2,thickness], align=[0,0,-1]);
    
cylinder(r=21/2+1.5,h=6);
        }
        cylinder(r=21/2,h=14,center=true);
        
    }
    
}



    
    
    module full_bottom_bit(){
    
        make_holes() {
translate([0,0,-offset]) bottom_bit();
    
    
translate([0,0,-118])


color("red")
union(){
outer_thread(radius=24.5/2,pitch=0.794,thread_base_width = 0.60,thread_length=5);
    difference(){
cylinder(r=12.27,h=118-offset);
        cylinder(r=9.7,h=118-offset);
    }
}

    
}
}

full_bottom_bit();

