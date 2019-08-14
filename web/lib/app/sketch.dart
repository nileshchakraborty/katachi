import 'p5.dart';

class MySketch extends PPainter {
  List<List<PVector>> strokes = <List<PVector>>[];

  @override
  void setup() {
//    size(300, 300);
    fullScreen();
  }

  @override
  void draw() {
    background(color(255, 255, 255));

    noFill();
    strokeWeight(10);
    stroke(color(10, 40, 200, 60));
    for (List<PVector> stroke in strokes) {
      beginShape();
      for (PVector p in stroke) {
        vertex(p.x, p.y);
      }
      endShape();
    }
  }

  @override
  void mousePressed() {
    strokes.add(<PVector>[PVector(x: mouseX, y: mouseY)]);
  }

  @override
  void mouseDragged() {
    final List<PVector> stroke = strokes.last;
    stroke.add(PVector(x: mouseX, y: mouseY));
  }
}
