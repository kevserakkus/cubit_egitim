import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/domain/entities/register.dart';
import 'package:cubbit_egitim/features/domain/repositories/registerRepository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository = instance<RegisterRepository>();

  Future<Either<Failure, RegisterResponseData>> register(
      String? sign, String? password, int? languageId) {
    return registerRepository.register(sign, password, languageId);
  }
}
