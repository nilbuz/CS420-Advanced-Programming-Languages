shapdisp("Available Shapes:");
disp("1. Rectangle");
disp("2. Circle");
disp("3. Triangle");
disp("4. Equilateral Triangle");
choice = input("Choose a shape: ");

switch choice
    case 1 % Rectangle
        name = input("Enter the shape name: ", "s");
        width = input("Enter the rectangle's width: ");
        height = input("Enter the rectangle's height: ");
        color = input("Enter the color: ", "s");
        shape = Rectangle(name, width, height, color);
    case 2 % Circle
        name = input("Enter the shape's name: ", "s");
        radius = input("Enter the circle radius: ");
        color = input("Enter the color: ", "s");
        shape = Circle(name, radius, color);
    case 3 % Triangle
        name = input("Enter the shape's name: ", "s");
        base = input("Enter the triangle's base length: ");
        height = input("Enter the triangle's height: ");
        color = input("Enter the color: ", "s");
        shape = Triangle(name, base, height, color);
    case 4 % Equilateral Triangle
        name = input("Enter the shape's name: ", "s");
        length = input("Enter the triangle's side length: ");
        color = input("Enter the color: ", "s");
        shape = EquilateralTriangle(name, length, color);
    otherwise
        disp("Invalid choice!");
        return;
end

shape = shape.CalculateArea();
shape.Draw();
