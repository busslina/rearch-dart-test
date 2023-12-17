import 'package:rearch/rearch.dart';

void main(List<String> arguments) {
  final capsuleContainer = CapsuleContainer();

  print('Username: ${capsuleContainer.read(username)}');

  var counter = capsuleContainer.read(_counter);

  print('Counter: ${counter.$1}');

  counter.$2(counter.$1 + 1);

  counter = capsuleContainer.read(_counter);

  print('Counter: ${counter.$1}');
}

String username(CapsuleHandle use) => 'Joaquín';

(int, void Function(int)) _counter(CapsuleHandle use) => use.state(0);
