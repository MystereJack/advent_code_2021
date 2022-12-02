import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  int increasedTimes = 0;
  int? lastValue;
  File('day_1/input.txt')
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .map((element) => int.parse(element))
      .forEach((element) {
    if (lastValue != null && element > lastValue!) {
      increasedTimes++;
    }
    lastValue = element;
  }).then((value) => print('FIRST : $increasedTimes'));

  List<int> basicList = await File('day_1/input.txt')
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .map((element) => int.parse(element))
      .toList();
  int? lastSum;
  int increasedTimes2 = 0;

  for (int count = 0; count < basicList.length; count++) {
    if (count + 3 > basicList.length) {
      continue;
    }
    int sum = basicList.sublist(count, count + 3).fold(0, (p, e) => p + e);
    if (lastSum != null && sum > lastSum) {
      increasedTimes2++;
    }
    lastSum = sum;
  }

  print('SECOND : $increasedTimes2');
}
