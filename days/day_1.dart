import 'dart:io';

void main(List<String> arguments) {
  final lines = File('inputs/day_1.txt')
      .readAsStringSync()
      .split('\n')
      .map((e) => int.parse(e))
      .toList();

  var temp = lines[0];
  int solution1 = lines.fold(0, (p, e) {
    if (e > temp) ++p;
    temp = e;
    return p;
  });

  int? lastSum;
  int solution2 = 0;

  for (int count = 0; count < lines.length; count++) {
    if (count + 3 > lines.length) {
      continue;
    }
    int sum = lines.sublist(count, count + 3).fold(0, (p, e) => p + e);
    if (lastSum != null && sum > lastSum) {
      solution2++;
    }
    lastSum = sum;
  }

  print('1 : $solution1');
  print('2 : $solution2');
  /**

  List<int> basicList = await File('day_1/input.txt')
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .map((element) => int.parse(element))
      .toList();

   */
}
