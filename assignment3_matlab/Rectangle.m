classdef Rectangle < Shape & ColorMixin
    %RECTANGLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        length
        width
    end
    
    methods
        function obj = Rectangle(name, length, width, color)
            %RECTANGLE Construct an instance of this class
            %   Detailed explanation goes here
            obj@Shape(name);
            obj@ColorMixin(color);
            obj.length = length;
            obj.width = width;
        end
        
        function obj = CalculateArea(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.area = obj.length * obj.width;
        end

        function obj = Display(obj)
            fprintf(['The area of the %s rectangle with name: %s,\n' ...
                'length: %d units, and width: %d units, is\n' ...
                'approximately %.2f square units.'], ...
                obj.color, obj.name, obj.length, obj.width, obj.area);
        end

        function Draw(obj)
            figure;
            axis equal;
            rectangle('Position', [0, 0, obj.width, obj.length], 'EdgeColor', obj.color, 'FaceColor', obj.color, 'LineWidth', 2);
            title(['Rectangle: ' obj.name]);
            xlabel(['Width: ' num2str(obj.width)]);
            ylabel(['Length: ' num2str(obj.length)]);
            zlabel(['Area: ' num2str(obj.area)]);
        end
    end
end
