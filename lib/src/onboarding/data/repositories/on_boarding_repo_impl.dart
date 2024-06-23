import 'package:fpdart/fpdart.dart';
import 'package:pingolearn/core/errors/failure.dart';
import 'package:pingolearn/src/onboarding/data/data_sources/local_data_source_imple.dart';

class OnBoardingRepoImpl {
  final LocalDataSourceImpl _localDataSourceImpl;

  OnBoardingRepoImpl({
    required LocalDataSourceImpl localDataSourceImpl,
  }) : _localDataSourceImpl = localDataSourceImpl;

  // Future<Either<Failure, bool>> checkIfFirstTimer() {}

  // Future<Either<Failure, bool>> cacheFirstTimer() {}

  Either<Failure, bool> isLoggedIn() {
    try {
      var result = _localDataSourceImpl.isLoggedIn() != null;

      return Right(result);
    } catch (e) {
      return Left(
        CacheFailure(
          message: 'Something Went Wrong.',
          statusCode: 402,
        ),
      );
    }
  }
}
