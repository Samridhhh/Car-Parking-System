
`timescale 1ns / 1ps
module tb_parking_system;
    
    reg clk;
    reg reset_n;
    reg sensor_entrance;
    reg sensor_exit;
    reg [1:0] password_1;
    reg [1:0] password_2;

   
    wire GREEN_LED;
    wire RED_LED;
    wire [6:0] HEX_1;
    wire [6:0] HEX_2;

  
    car_park uut (
        .clk(clk),
        .reset_n(reset_n),
        .sensor_entrance(sensor_entrance),
        .sensor_exit(sensor_exit),
        .password_1(password_1),
        .password_2(password_2),
        .GREEN_LED(GREEN_LED),
        .RED_LED(RED_LED),
        .HEX_1(HEX_1),
        .HEX_2(HEX_2)
    );

   
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
     
        reset_n        = 0;
        sensor_entrance = 0;
        sensor_exit     = 0;
        password_1      = 2'b00;
        password_2      = 2'b00;

       
        #100;
        reset_n = 1;

     
        sensor_entrance = 1;
        password_1      = 2'b01;
        password_2      = 2'b10;

        
        #100;   
        sensor_entrance = 0;

        #500;

        sensor_exit = 1;
        #100;
        sensor_exit = 0;

        #200;
        $finish;
    end
endmodule
