classdef EquilateralTriangle < Triangle & ColorMixin
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sideLength
    end
    
    methods
        function obj = EquilateralTriangle(name, sideLength, color)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            base = sideLength;
            height = sideLength / 2 * sqrt(3);
            obj@Triangle(name, base, height, color);
            
            obj@ColorMixin(color);

            obj.sideLength = sideLength;
        end
        
        function obj = Display(obj)
            fprintf(['The area of the %s equilateral triangle with the name: %s,\n' ...
                'and a side length of %d units, has an area of\n' ...
                'approximately %.2f square units.'], ...
                obj.color, obj.name, obj.sideLength, obj.area);
        end
    end
end
