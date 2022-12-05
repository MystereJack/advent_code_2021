import 'dart:io';

void main(List<String> arguments) async {
  final lines = File('inputs/day_3.txt').readAsStringSync().split('\n').toList();

  List<int> sum = lines.fold([], (p, e) {
    List<int> ei = e.split('').map((e) => int.parse(e)).toList();

    if (p.isEmpty) {
      return ei;
    }

    for (int i = 0; i < p.length; i++) {
      p[i] = p[i] + ei[i];
    }

    return p;
  });

  String gamma = _calculateGamma(sum, lines.length);
  String epsilon = _calculateEpsilon(sum, lines.length);

  int solution1 = int.parse(gamma, radix: 2) * int.parse(epsilon, radix: 2);

  String oxygen = _searchOxygenC02(lines, true);
  String co2 = _searchOxygenC02(lines, false);

  int solution2 = int.parse(oxygen, radix: 2) * int.parse(co2, radix: 2);

  print('1 : $solution1');
  print('2 : $solution2');
}

String _searchOxygenC02(List<String> lines, bool reversed) {
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

_calculateGamma(List<int> sum, int length) {
  String result = '';

  for (int value in sum) {
    if (value == length / 2) {
      result += '1';
    } else if (value > length / 2) {
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
    if (value == length / 2) {
      result += '0';
    } else if (value > length / 2) {
      result += '0';
    } else {
      result += '1';
    }
  }
  return result;
}
