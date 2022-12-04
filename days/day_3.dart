import 'dart:io';

void main(List<String> arguments) async {
  final lines =
      File('inputs/day_3.txt').readAsStringSync().split('\n').toList();

  List<int> sum = lines.fold([], (p, e) {
    List<int> el = e.split('').map((e1) => int.parse(e1)).toList();
    if (p.isEmpty) {
      return el;
    }

    for (int i = 0; i < p.length; i++) {
      p[i] = p[i] + el[i];
    }

    return p;
  });

  String gamma = _calculateGamma(sum, lines.length);
  String epsilon = _calculateEpsilon(sum, lines.length);

  int solution1 = int.parse(gamma, radix: 2) * int.parse(epsilon, radix: 2);

  print('1 : $solution1');
}

_calculateGamma(List<int> sum, int length) {
  String result = '';

  for (int value in sum) {
    if (value > length / 2) {
      result += '1';
    } else {
      result += '0';
    }
  }
  return result;
}

_calculateEpsilon(List<int> sum, int length) {
  String result = '';
  for (int value in sum) {
    if (value > length / 2) {
      result += '0';
    } else {
      result += '1';
    }
  }
  return result;
}
