classdef Circle < Shape & ColorMixin
    %CIRCLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        radius
    end
    
    methods
        function obj = Circle(name, radius, color)
            %CIRCLE Construct an instance of this class
            %   Detailed explanation goes here
            obj@Shape(name);
            obj@ColorMixin(color);
            obj.radius = radius;
        end
        
        function obj = CalculateArea(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.area = pi * obj.radius^2;
        end

        function obj = Display(obj)
            fprintf(['The area of the %s circle with name: %s,\n' ...
                'and radius: %d units, is approximately %.2f\n' ...
                'square units.'], obj.color, obj.name, obj.radius, obj.area);
        end
        
        function Draw(obj)
            figure;
            axis equal;
            rectangle('Position', [-obj.radius, -obj.radius, ...
                2*obj.radius, 2*obj.radius], 'Curvature', ...
                [1, 1], 'EdgeColor', obj.color, 'FaceColor', ...
                obj.color, 'LineWidth', 2);
            title(['Circle: ' obj.name]);
            xlabel(['Radius: ' num2str(obj.radius)]);
            ylabel(['Area: ' sprintf('%.2f', obj.area)]);
        end
    end
end
