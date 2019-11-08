while 1
    while brick.TouchPressed(1) == 0
        brick.MoveMotor('B',-50);
        if brick.TouchPressed(2) == 0
            brick.MoveMotor('A',-70);
        else
            brick.MoveMotor('A',10);
        end
    end
    brick.MoveMotor('A',30);
    brick.MoveMotor('B',30);
    pause(1);
end