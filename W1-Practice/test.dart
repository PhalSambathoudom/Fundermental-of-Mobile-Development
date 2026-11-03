class Point {
    int x;
    int y;
    //Point(this.x, this.y) {} // Positional Argument
    Point({required this.x, required this.y}) {}

    void translate (int deltax, int deltay) {
        this.x += deltax;
        this.y += deltay;
    }
    
    @override
    String toString() {
        return "My point is : x = $x - y = $y";
    }
}

void main() {
    Point p1 = Point(x:40, y:50);
    p1.translate(50, 100);
    print(p1);
}