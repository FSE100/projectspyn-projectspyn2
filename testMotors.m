% 
% global key
% InitKeyboard();
% 
% while 0
%     pause (0.1);
%     switch key
%         case 'leftarrow'
%             brick.MoveMotor('A',-30);
%             disp('Left');
%             
%         case 'rightarrow'
%             brick.MoveMotor('B',-30);
%             disp('Right');
%             
%         case 'a'
%             brick.MoveMotor('A',30);
%             disp('Left');
%             
%         case 'd'
%             brick.MoveMotor('B',30);
%             disp('Right');
%             
%         case 'w'
%                brick.MoveMotor('B',-30);
%                brick.MoveMotor('A',-30);
%                disp('Fowards')
%             
%         case 's'
%                brick.MoveMotor('B',30);
%                brick.MoveMotor('A',30);
%                disp('Backwards')
%             
%         case 'uparrow'
%             brick.MoveMotor('D',60);
%             disp('Up');
%             
%         case 'downarrow'
%             brick.MoveMotor('D',-30);
%             disp('Down');
%             
%         case 0
%             disp('No key is pressed!');
%             brick.StopMotor('A');
%             brick.StopMotor('D');
%             brick.StopMotor('B');
%             
%         case 'q'
%             brick.StopMotor('A');
%             brick.StopMotor('D');
%             brick.StopMotor('B');
%             break;
%             
%     end
% end
% CloseKeyboard();

runRobot = 1;

while runRobot
    %brick.SetColorMode(3, 2);
    %color = brick.ColorCode(3);
    %brick.beep();
    switch(7)
        case 5
            brick.StopMotor('AB', 'Brake'); %stop motor A & B suddenly
            brick.beep();
            pause(4);
        otherwise
            %%%%%%%%%%%%%%%%%%%%
            x = 17;
            navigating = mod(x, x)+1;
            if navigating %turning right
                if brick.TouchPressed(1) == 0 %while nothing touching left pincher, move right motor
                    brick.MoveMotor('B',-40); %move motor forward at 4/10 speed
                    if brick.TouchPressed(2) == 0 %while nothing touching right pincher, move left motor
                        brick.MoveMotor('A',-70); %move motor forward at 7/10 speed
                    else
                        brick.MoveMotor('B',10); %move motor backward at 1/10 speed (correct after crashing)
                        brick.MoveMotor('A',30); %move motor backward at 3/10 speed (correct after crashing)
                    end
                else
                    %backs up for space
                    brick.MoveMotor('A',30); %move motor backward at 3/10 speed
                    brick.MoveMotor('B',30); %move motor backward at 3/10 speed
                    pause(1); %let's motor turn for 1 second, after this turning begins
                    if brick.TouchPressed(1)== 1 && brick.TouchPressed(2) == 1
                        brick.StopMotor('AB', 'Brake'); %stop motor A & B suddenly
                        break; %terminate process
                    end
                    %turn left
                    brick.MoveMotor('A',30); %move motor backward at 3/10 speed
                    brick.MoveMotor('B',-30); %move motor forward at 3/10 speed
                    pause (0.5);
                   brick.StopMotor('AB','Brake'); 
                end
            end


            %%%%%%%%%%%%%%%%%%%%
            
            
        
            
            
            
            
            
        
        
        
    end
    
    
 end











    