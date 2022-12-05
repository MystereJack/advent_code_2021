import 'dart:io';

void main(List<String> arguments) {
  final lines = File('inputs/day_3.txt').readAsStringSync().split('\n').toList();

  String gamma = _calculateGammaEpsilon(lines, false);
  String epsilon = _calculateGammaEpsilon(lines, true);

  int solution1 = int.parse(gamma, radix: 2) * int.parse(epsilon, radix: 2);

  String oxygen = _calculateOxygenCO2(lines, false);
  String co2 = _calculateOxygenCO2(lines, true);

  int solution2 = int.parse(oxygen, radix: 2) * int.parse(co2, radix: 2);

  print('1 : $solution1');
  print('2 : $solution2');
}

String _calculateGammaEpsilon(List<String> lines, bool reversed) {
  String s = '';

  for (int i = 0; i < lines[0].length; i++) {
    s += _mostCommonDigit(lines, i, reversed);
  }

  return s;
}

String _calculateOxygenCO2(List<String> lines, bool reversed) {
  List<String> candidates = lines;
  String s = '';
  for (int i = 0; i < lines[0].length; i++) {
    s += _mostCommonDigit(candidates, i, reversed);
    candidates = lines.where((element) => element.startsWith(s)).toList();

    if (candidates.length == 1) {
      s = candidates.first;
      break;
    }
  }

  return s;
}

_mostCommonDigit(List<String> lines, int position, bool reversed) {
  int count0 = lines.fold(0, (p, e) => e.split('')[position] == '0' ? p + 1 : p + 0);
  int count1 = lines.fold(0, (p, e) => e.split('')[position] == '1' ? p + 1 : p + 0);

  if (count0 == count1) {
    return reversed ? '0' : '1';
  } else if (count0 > count1) {
    return reversed ? '1' : '0';
  } else {
    return reversed ? '0' : '1';
  }
}
