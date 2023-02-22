part of 'register_cubit.dart';

@immutable
abstract class RegiterState {}

class RegisterInit extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {}

class RegisterComplete extends RegisterState {
  final RegisterResponseData registerResponseData;

  RegisterComplete({required this.registerResponseData});
}
