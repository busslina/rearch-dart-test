import 'package:rearch/rearch.dart';

void main(List<String> arguments) {
  final capsuleContainer = CapsuleContainer();

  print(capsuleContainer.read(resourceFactoryCapsule)(Resources.datetime));
  print(
      capsuleContainer.read(resourceFactoryCapsule)(Resources.currentUsername));

  Future.delayed(const Duration(seconds: 3)).then((value) {
    print(capsuleContainer.read(resourceFactoryCapsule)(Resources.datetime));
  });
}

Object Function(String) resourceFactoryCapsule(CapsuleHandle use) {
  return (resourceId) => switch (resourceId) {
        Resources.datetime => DateTime.now(),
        Resources.currentUsername => use(currentUsername),
        _ => throw ('Resouce not implemented'),
      };
}

class Resources {
  static const datetime = 'datetime';
  static const currentUsername = 'current-username';
}

String currentUsername(CapsuleHandle use) => 'Joaquín';
