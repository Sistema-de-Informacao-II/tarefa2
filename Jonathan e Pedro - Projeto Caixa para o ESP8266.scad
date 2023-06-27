largura = 26.3;
profundidade = 35;
altura = 20.5;
parede = 2;

profDHT = 18.5;   // prof real: 15.5
largDHT = 14;   // larg real: 12

altUSB = 9;
largUSB = 14;
profUSB = 9;

locProfUSB = ((profundidade)/2)-3.4;
locLargUSB = -0.5;
locAltUSB = ((altUSB-altura)/2)-0.1;

module caixa(){
    difference(){
        cube([profundidade+parede, largura+parede, altura], center=true); //volume externo
        translate([0,0,parede]) cube([profundidade, largura, altura], center=true); // volume interno
        translate([locProfUSB, locLargUSB, locAltUSB]) cube([profUSB, largUSB, altUSB], center=true); // abertura usb
    }
}

module tampa(){
    difference(){
        cube([profundidade+parede, largura+parede, parede], center=true);
        translate([9.3,-0.5,0]) cube([profDHT, largDHT, 3], center=true); // abertuda DHT
    }
}

// tampa e caixa
translate([0,largura+3.5,-((altura/2)-1)]) tampa();
caixa();
