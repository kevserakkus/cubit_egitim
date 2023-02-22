import 'package:cubbit_egitim/core/failures_succeses/exceptions.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/data/data_sources/remote_datasource.dart';
import 'package:cubbit_egitim/features/data/models/register_model.dart';
import 'package:cubbit_egitim/features/domain/entities/register.dart';
import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/features/domain/repositories/registerRepository.dart';
import 'package:dartz/dartz.dart';

class RegisterRepoImpl implements RegisterRepository {
  final RemoteDataSource remoteDataSource = instance<RemoteDataSource>();

  @override
  Future<Either<Failure, RegisterModelData>> register(
      String? sign, String? password, int? languageId) async {
    try {
      return Right(await remoteDataSource.register(sign, password, languageId));
    } on LoginException catch (e) {
      return Left(FetchFailure(messsage: e.message));
    }
  }
}
