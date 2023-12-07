classdef ColorMixin
    %COLORMIXIN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        color
    end
    
    methods
        function obj = ColorMixin(color)
            %COLORMIXIN Construct an instance of this class
            %   Detailed explanation goes here
            obj.color = color;
        end
        
        function obj = SetColor(obj, newColor)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.color = newColor;
        end

        function color = GetColor(obj)
            color = obj.color;
        end
    end
end

        
        % This getter method also works:
        %function color = get.color(obj)
            %color = obj.color;
        %end
        
        % Inputs that work:
        % >> blueCircle.color
        % >> GetColor(blueCircle)
        % >> blueCircle.GetColor