$fn=150;
smaller_diam=36.6;
bigger_diam=40.4;

smallest_diam=12;
offset = 24.7;



module hole(){

hull(){
cylinder(r=bigger_diam/2,h=0.0001);
translate([0,0,offset])cylinder(r=smaller_diam/2,h=0.0001);

}

hull(){
    translate([0,0,offset])cylinder(r=smaller_diam/2,h=0.0001);
    translate([0,0,offset+8])cylinder(r=smaller_diam/2,h=0.0001);
    
}


hull(){
    translate([0,0,offset+25])cylinder(r=smallest_diam/2,h=0.0001);
    translate([0,0,offset+8])cylinder(r=smaller_diam/2,h=0.0001);
    
}

 translate([0,0,offset+25])cylinder(r=smallest_diam/2,h=100);




}

difference(){
    
    scale([1.3,1.3,1])hole();
    hole();
}

