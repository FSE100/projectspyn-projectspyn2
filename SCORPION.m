%brick = ConnectBrick('SCORPION');
%A Left Motor
%B Right Motor
%D Tail Motor
% while brick.TouchPressed(1) == 0
% brick.MoveMotor('B',-50);
% while brick.TouchPressed(2) == 0
%     brick.MoveMotor('A',-70);
% end
% brick.StopMotor('A');
% end
% brick.StopMotor('A');
% brick.StopMotor('B');

global key
InitKeyboard();

while 1
   pause(.01);
   switch key
       case 'uparrow'
           brick.MoveMotor('A',-50);
           disp('UP Arrow Pressed');
           
       case 'downarrow'
           brick.MoveMotor('A',50);
           disp('Down Arrow Pressed');
           
       case '1'
           brick.MoveMotor('D',-50);
           disp('Tail Down');
           
       case '2'
           brick.MoveMotor('D',50)
           disp('Tail Up');
           
       case 'rightarrow'
           brick.MoveMotor('B',50);
           disp('Right Arrow Pressed');
           
       case 'leftarrow'
           brick.MoveMotor('B',-50);
           disp('Left Arrow Pressed');
           
       case 0
           disp('No Key Pressed!')
       
       case ('q')
           break;
           
   end
end
CloseKeyboard();

brick.MoveMotor('D',-50);
pause(2.5);
brick.StopMotor('A');
brick.StopMotor('B');
brick.StopMotor('D');
%
brick.MoveMotor('A',50);
brick.MoveMotor('B',50);
brick.MoveMotor('D',10);
brick.MoveMotor('D',70);
pause(2);
brick.StopMotor('A');
brick.StopMotor('B');
brick.StopMotor('D');
