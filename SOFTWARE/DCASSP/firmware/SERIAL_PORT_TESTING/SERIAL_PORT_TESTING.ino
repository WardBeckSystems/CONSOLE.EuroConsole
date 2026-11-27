void setup() {
  // put your setup code here, to run once:
Serial3.begin(9600,SERIAL_8N1);


}

void loop() {
  // put your main code here, to run repeatedly:


Serial3.write(0xF0);
 Serial3.write(0x81);
 delay(100);


Serial3.write(0xF0);
 Serial3.write(0x82);
 delay(100);



Serial3.write(0xF0);
 Serial3.write(0x83);
 delay(100);


 
}
