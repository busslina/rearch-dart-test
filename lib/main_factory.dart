import 'package:rearch/rearch.dart';

void main(List<String> arguments) {
  final capsuleContainer = CapsuleContainer();

  print(capsuleContainer.read(_monthAsStringFactory).$1(11));
  print(' ');

  print(capsuleContainer.read(_monthAsStringFactory).$1(10));
  print(' ');

  print(capsuleContainer.read(_monthAsStringFactory).$1(11));
  print(' ');
}

String _getMonthAsString(int month) {
  print('getMonthAsString() -- $month');

  return switch (month) {
    1 => 'Enero',
    2 => 'Febrero',
    3 => 'Marzo',
    4 => 'Abril',
    5 => 'Mayo',
    6 => 'Junio',
    7 => 'Julio',
    8 => 'Agosto',
    9 => 'Septiembre',
    10 => 'Octubre',
    11 => 'Noviembre',
    12 => 'Diciembre',
    _ => throw ('Bad usage'),
  };
}

(String Function(int), void Function()) _monthAsStringFactory(
    CapsuleHandle use) {
  final cache = use.value(<int, String>{});
  final rebuild = use.rebuilder();

  return (
    (month) => cache.putIfAbsent(month, () => _getMonthAsString(month)),
    () {
      cache.clear();
      rebuild();
    }
  );
}
