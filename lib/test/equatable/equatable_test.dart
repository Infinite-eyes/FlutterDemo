//https://pub.dev/packages/equatable
import 'package:equatable/equatable.dart';

//v1
//class Person {
//  final String name;
//
//  const Person(this.name);
//
//  bool operator ==(Object other) =>
//      identical(this, other) ||
//      other is Person && runtimeType == other.runtimeType && name == other.name;
//
//  int get hashCode => name.hashCode;
//}
//
//void main() {
//  final Person bob = Person("Bob");
//
//  print(bob == Person("Bob"));
//}

//v2

//class Person extends Equatable {
//  final String name;
//
//  Person(this.name);
//
////  Equatable also supports const constructors:
////  const  Person(this.name);
//  @override
//  // TODO: implement props
//  List<Object> get props => [name];
//
////  When working with json:
//  factory Person.fromJson(Map<String, dynamic> json){
//    return Person(json['name']);
//  }
//
//  @override
//  bool get stringify => true;
//
//}
//
//void main() {
//
//  EquatableConfig.stringify = true;
//
//  final Person bob = Person("Bob");
//
//  print(bob);
//}

//v3

class EquatableDateTime extends DateTime with EquatableMixin {
  EquatableDateTime(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) : super(year, month, day, hour, minute, second, millisecond, microsecond);

  @override
  // TODO: implement props
  List<Object> get props =>
      [year, month, day, hour, minute, second, millisecond];
}

class EquatableDateTimeSubclass extends EquatableDateTime {
  final int century;

  EquatableDateTimeSubclass(
    this.century,
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) : super(year, month, day, hour, minute, second, millisecond, microsecond);

  @override
  List<Object> get props => super.props..addAll([century]);
}
