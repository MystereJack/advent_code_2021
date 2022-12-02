import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  int h = 0;
  int d = 0;
  File('day_2/input.txt')
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .forEach((element) {
    int v = int.parse(element.split(" ")[1]);
    if (element.contains('forward')) {
      h += v;
    } else if (element.contains('down')) {
      d += v;
    } else if (element.contains('up')) {
      d -= v;
    }
  }).then((value) => print('FIRST : ${h * d}'));

  int h2 = 0;
  int d2 = 0;
  int a2 = 0;
  File('day_2/input.txt')
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .forEach((element) {
    int v = int.parse(element.split(" ")[1]);
    if (element.contains('forward')) {
      h2 += v;
      d2 += v * a2;
    } else if (element.contains('down')) {
      a2 += v;
    } else if (element.contains('up')) {
      a2 -= v;
    }
  }).then((value) => print('SECOND : ${h2 * d2}'));
}
