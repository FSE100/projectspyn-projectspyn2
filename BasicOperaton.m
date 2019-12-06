runRobot = 1;
ignoredColor = -1;
passengerReturned = -1; %-1 for not started, 0 for being held, 1 for put down
while runRobot == 1
    brick.SetColorMode(3,2);
    color = brick.ColorCode(3);
    if color ~= ignoredColor
        switch(color)
            case 5 %RED- Stop Sign
                brick.beep();
                disp('red');
                brick.StopMotor('AB','Brake');
                pause(4);
                ignoredColor = 5;
            case 4 %YELLOW- Final Parking Space
                disp('yellow');
                if passengerReturned == 1
                    brick.beep();
                    brick.StopMotor('AB','Coast');
                    runRobot = -1;
                end
            case 2 %BLUE- Passenger Pickup
                brick.beep();
                disp('blue');
                passengerDetection = 60; % brick.UltrasonicDist(4);
                if passengerDetection > 30 && passengerReturned == -1
                    %PICKUP CODE HERE
                    brick.StopMotor('AB','Brake');
                    j = 0;
                    while j == 0
                        j = KeyboardControl(brick);
                    end
                    passengerReturned = 0;
                    disp('PassengerReturned = 0');
                end
                ignoredColor = 3;
            case 3 %GREEN- Passenger Dropoff
                brick.beep();
                disp('green');
                passengerDetection = 20; % brick.UltrasonicDist(4);
                if passengerDetection < 30 && passengerReturned == 0
                    %DROPOFF CODE HERE
                    brick.StopMotor('AB','Brake');
                    j = 0;
                    while j == 0
                        j = KeyboardControl(brick);
                    end
                    passengerReturned = 1;
                    disp('PassengerReturned = 1');
                end
                ignoredColor = 4;
            otherwise
                %MOTION CODE HERE
                disp('move');
                navigating = 1;
                j = move(navigating, brick);
                ignoredColor = -1;
        end
    else
            navigating = 1;
            j = move(navigating, brick);
    end
end

%Keyboard/Manual Control
function out = KeyboardControl(brick)
    global key
    InitKeyboard();

    while 1
        pause (0.1);
        switch key
            case 'leftarrow'
                brick.MoveMotor('A',-30);
                disp('Left');

            case 'rightarrow'
                brick.MoveMotor('B',-30);
                disp('Right');

            case 'a'
                brick.MoveMotor('A',30);
                disp('Left');

            case 'd'
                brick.MoveMotor('B',30);
                disp('Right');

            case 'w'
                   brick.MoveMotor('B',-30);
                   brick.MoveMotor('A',-30);
                   disp('Fowards')

            case 's'
                   brick.MoveMotor('B',30);
                   brick.MoveMotor('A',30);
                   disp('Backwards')

            case 'uparrow'
                brick.MoveMotor('D',60);
                disp('Up');

            case 'downarrow'
                brick.MoveMotor('D',-30);
                disp('Down');

            case 0
                disp('No key is pressed!');
                brick.StopMotor('A');
                brick.StopMotor('D');
                brick.StopMotor('B');

            case 'q'
                brick.StopMotor('A');
                brick.StopMotor('D');
                brick.StopMotor('B');
                break;

        end
    end
    CloseKeyboard();

    out = 1;
end
function out = move(navigating, brick)
    if navigating %turning right
        if brick.TouchPressed(1) == 0 %while nothing touching left pincher, move right motor
            brick.MoveMotor('B',-38); %move motor forward at 4/10 speed
            if brick.TouchPressed(2) == 0 %while nothing touching right pincher, move left motor
                brick.MoveMotor('A',-72); %move motor forward at 7/10 speed
            else
                brick.MoveMotor('B',10); %move motor backward at 1/10 speed (correct after crashing)
                brick.MoveMotor('A',30); %move motor backward at 3/10 speed (correct after crashing)
            end
        else
            %backs up for space
            brick.MoveMotor('A',30); %move motor backward at 3/10 speed
            brick.MoveMotor('B',30); %move motor backward at 3/10 speed
            pause(1); %let's motor turn for 1 second, after this turning begins
            %turn left
            brick.MoveMotor('A',45); %move motor backward at 3/10 speed
            brick.MoveMotor('B',-45); %move motor forward at 3/10 speed
            pause (0.75);
           brick.StopMotor('AB','Brake'); 
        end
    end
    out = 1;
end

