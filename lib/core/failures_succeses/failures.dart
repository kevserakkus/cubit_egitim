import 'package:dartz/dartz.dart';

abstract class Failure {
  final String? message;
  const Failure({this.message});
}

class FetchFailure extends Failure {
  const FetchFailure({String? messsage}) : super(message: messsage);
}
