import 'dart:io';

import 'package:tuple/tuple.dart';

typedef Order = Tuple2<String, int>;
typedef Position = Tuple2<int, int>;
typedef PositionAim = Tuple3<int, int, int>;

void main(List<String> arguments) {
  final lines = File('inputs/day_2.txt').readAsStringSync().split('\n').toList();

  Position finalPosition = lines.map(_createOrder).fold(Position(0, 0), (p, e) {
    int h = p.item1;
    int d = p.item2;
    if (e.item1 == 'forward') {
      h += e.item2;
    } else if (e.item1 == 'down') {
      d += e.item2;
    } else if (e.item1 == 'up') {
      d -= e.item2;
    }

    return Position(h, d);
  });

  int solution1 = finalPosition.item1 * finalPosition.item2;

  PositionAim finalPositionAim = lines.map(_createOrder).fold(PositionAim(0, 0, 0), (p, e) {
    int h = p.item1;
    int d = p.item2;
    int a = p.item3;
    if (e.item1 == 'forward') {
      h += e.item2;
      d += e.item2 * a;
    } else if (e.item1 == 'down') {
      a += e.item2;
    } else if (e.item1 == 'up') {
      a -= e.item2;
    }

    return PositionAim(h, d, a);
  });

  int solution2 = finalPositionAim.item1 * finalPositionAim.item2;

  print('1 : $solution1');
  print('2 : $solution2');
}

Order _createOrder(String line) {
  List<String> split = line.split(" ");
  return Order(split[0], int.parse(split[1]));
}
