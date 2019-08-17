import 'code.dart';
import 'p5.dart';

class MySketch extends PPainter {
  MySketch({this.codes});

  final List<PCode> codes;

  @override
  void setup() {
    fullScreen();
  }

  @override
  void draw() {
    try {
      parse();
    } catch (e) {
      print('error caught: $e');
    }
  }

  void parse() {
    for (PCode code in codes) {
      switch (code.name) {
        case 'background':
          background(
            color(
              int.parse(code.args[0].args[0].name),
              int.parse(code.args[0].args[1].name),
              int.parse(code.args[0].args[2].name),
            ),
          );
          break;
        case 'stroke':
          stroke(
            color(
              int.parse(code.args[0].args[0].name),
              int.parse(code.args[0].args[1].name),
              int.parse(code.args[0].args[2].name),
            ),
          );
          break;
        case 'fill':
          fill(
            color(
              int.parse(code.args[0].args[0].name),
              int.parse(code.args[0].args[1].name),
              int.parse(code.args[0].args[2].name),
            ),
          );
          break;
        case 'strokeWeight':
          strokeWeight(int.parse(code.args[0].name));
          break;
        case 'ellipse':
          ellipse(
            double.parse(code.args[0].name),
            double.parse(code.args[1].name),
            double.parse(code.args[2].name),
            double.parse(code.args[3].name),
          );
          break;
        case 'noStroke':
          noStroke();
          break;
        case 'noFill':
          noFill();
          break;
        case 'rect':
          rect(
            double.parse(code.args[0].name),
            double.parse(code.args[1].name),
            double.parse(code.args[2].name),
            double.parse(code.args[3].name),
          );
          break;
//strokeCap(int cap)
//strokeJoin(int join)
//line(num x1, num y1, num x2, num y2)
//point(num x, num y)
//quad(num x1, num y1, num x2, num y2, num x3, num y3, num x4, num y4)
//triangle(num x1, num y1, num x2, num y2, num x3, num y3)
//beginShape([int mode = 3])
//vertex(num x, num y)
//endShape([int mode = 0])
//translate(num tx, num ty)
//rotate(num angle)
//scale(num sx, num sy)
//push()
//pop()
//radians(num angle)
//degrees(num angle)
        case '':
          break;
      }
    }
  }
}
