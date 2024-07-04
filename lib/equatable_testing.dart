import 'package:card_swiper/card_swiper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*  Person person = Person(name: 'Aman', age: 23);
          Person person1 = Person(name: 'Aman', age:   q 23);
          debugPrint('${person == person1}');*/
          Person person1 = Person(name: 'Aman', age: 23);
          Person person2 = Person(name: 'Aman', age: 23);
          debugPrint('${person1 == person2}');
          // debugPrint('${identical(person1, person2)}');
          debugPrint('${person1.hashCode}');
          debugPrint('${person2.hashCode}');
        },
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({

    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];

  /* @override
  bool operator ==(Object other) {
    if (other is Person) {
      debugPrint('${other.runtimeType}');
    }
    return identical(this, other) || other is Person && runtimeType == other.runtimeType && name == other.name && age == other.age;
  }

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode;
  }*/
}
