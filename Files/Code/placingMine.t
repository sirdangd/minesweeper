% procedure placingMine(x, y : int)
% 
%     map(x,y) := mine
%     var checkX : int
%     var checkY : int
%     
%     for xOff : -1 .. 1
%         for yOff : -1 .. 1
%             checkX := x + xOff
%             checkY := y + yOff
%             if checkX > 0 and checkX <= gameSizeX and checkY > 0 and checkY <= gameSizeY and map(checkX, checkY) not= mine then
%                 map(checkX, checkY) += 1
%                 
%             end if
%         end for
%     end for
% 
% end placingMine
