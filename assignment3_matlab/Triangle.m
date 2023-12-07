classdef Triangle < Shape & ColorMixin
    %TRIANGLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        base
        height
    end
    
    methods
        function obj = Triangle(name, base, height, color)
            %TRIANGLE Construct an instance of this class
            %   Detailed explanation goes here
            obj@Shape(name);
            obj@ColorMixin(color);
            obj.base = base;
            obj.height = height;
        end
        
        function obj = CalculateArea(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.area = (obj.base * obj.height) / 2;
        end

        function obj = Display(obj)
            fprintf(['The area of the %s triangle with name: %s,\n' ...
                'base: %d units, and height: %d units, is\n' ...
                'approximately %.2f square units.'], ...
                obj.color, obj.name, obj.base, obj.height, obj.area);
        end

        function Draw(obj)
            figure;
            axis equal;
            hold on;
            xCoords = [0, obj.base, obj.base / 2];
            yCoords = [0, 0, obj.height];
            fill(xCoords, yCoords, obj.color);
            plot(xCoords, yCoords, 'k', 'LineWidth', 2);
            title(['Triangle: ' obj.name]);
            xlabel(['Base: ' num2str(obj.base)]);
            ylabel(['Height: ' num2str(obj.height)]);
            zlabel(['Area: ' num2str(obj.area)]);
        end
    end
end
