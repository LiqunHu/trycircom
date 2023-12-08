pragma circom 2.1.6;
include "../node_modules/circomlib/circuits/comparators.circom";
include "../node_modules/circomlib/circuits/mux1.circom";

template Multiplier2() {
    signal input a;
    signal input b;
    signal output c;

    component lt = LessThan(10);

    lt.in[0] <== a;
    lt.in[1] <== b;

    component mux = Mux1();

    lt.out ==> mux.s;
    a + b ==> mux.c[0];
    a * b ==> mux.c[1];
    c <== mux.out;
 }

 component main = Multiplier2();