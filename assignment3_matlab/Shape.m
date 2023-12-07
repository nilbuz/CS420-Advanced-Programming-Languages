classdef Shape
    
    properties
        name
        area
    end
    
    methods
        function obj = Shape(name)
            obj.name = name;
        end
        
        function obj = Display(obj)
            fprintf('Name: %s\n', obj.name);
            fprintf('Area: %f\n', obj.area);
        end
    end

    methods (Static)
        function CalculateStatistics(shapes)

            areas = zeros(1, numel(shapes));

            for i = 1:numel(shapes)
                areas(i) = shapes{i}.area;
            end

            meanArea = mean(areas);
            medianArea = median(areas);
            stdDevArea = std(areas);

            fprintf(['Mean area: %.2f\nMedian area: %.2f\n' ...
                'Standard deviation of areas: %.2f\n'] ...
                , meanArea, medianArea, stdDevArea);
        end
    end
end