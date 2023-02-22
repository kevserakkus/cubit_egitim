import 'package:cubbit_egitim/core/failures_succeses/exceptions.dart';
import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/data/data_sources/remote_datasource.dart';
import 'package:cubbit_egitim/features/data/models/register_model.dart';
import 'package:cubbit_egitim/features/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponseData>> register(
      String? sign, String? password, int? languageId);
}
