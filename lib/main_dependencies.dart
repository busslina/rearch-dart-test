import 'package:rearch/rearch.dart';

final capsuleContainer = CapsuleContainer();

void main(List<String> arguments) {
  // print(capsuleContainer.read(todayCapsule));
  // print(capsuleContainer.read(todayCapsule));
  // print(capsuleContainer.read(todayCapsule));
  // print(capsuleContainer.read(todayCapsule));
  // print(capsuleContainer.read(todayCapsule));
  // print(capsuleContainer.read(todayCapsule));
  // print(capsuleContainer.read(todayCapsule));

  // print(today());
  // print(today());

  var (today, dayIncrementer) = capsuleContainer.read(todayCapsule);
  print(today);
  dayIncrementer();

  (today, dayIncrementer) = capsuleContainer.read(todayCapsule);
  print(today);
  dayIncrementer();

  (today, dayIncrementer) = capsuleContainer.read(todayCapsule);
  print(today);
  dayIncrementer();
}

(int, void Function()) yearCapsule(CapsuleHandle use) {
  final (state, setter) = use.state(2023);
  return (
    state,

    // Year incrementer
    () => setter(state + 1),
  );
}

(int, void Function()) monthCapsule(CapsuleHandle use) {
  final (state, setter) = use.state(12);
  final (_, yearIncrement) = use(yearCapsule);
  return (
    state,

    // Month incrementer
    () {
      if (state == 12) {
        setter(1);
        yearIncrement();
      } else {
        setter(state + 1);
      }
    }
  );
}

(int, void Function()) dayCapsule(CapsuleHandle use) {
  final (state, setter) = use.state(20);
  final (_, monthIncrement) = use(monthCapsule);
  return (
    state,

    // Day incrementer
    () {
      if (state == 30) {
        setter(1);
        monthIncrement();
      } else {
        setter(state + 1);
      }
    }
  );
}

(String, void Function()) todayCapsule(CapsuleHandle use) {
  final (day, dayIncrementer) = use(dayCapsule);
  final (month, _) = use(monthCapsule);
  final (year, _) = use(yearCapsule);

  final today = use.memo(() => '$day/$month/$year', [day, month, year]);

  return (today, dayIncrementer);
}
