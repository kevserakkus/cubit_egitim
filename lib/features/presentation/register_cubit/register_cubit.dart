import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/domain/entities/register.dart';
import 'package:cubbit_egitim/features/domain/usecases/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInit());

  final RegisterUseCase _registerUseCase = instance<RegisterUseCase>();

  void register(String? sign, String? password, int? languageId) async {
    emit(RegisterLoading());

    final Either<Failure, RegisterResponseData> registerResponse =
        await _registerUseCase.register(sign, password, languageId);

    registerResponse.fold((error) {
      emit(RegisterError());
      print(error.message);
    }, (data) {
      emit(RegisterComplete(registerResponseData: data));
    });
  }
}

class RegisterState {}
