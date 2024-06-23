import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pingolearn/core/errors/failure.dart';
import 'package:pingolearn/src/auth/data/data_sources/auth_remote_data_sources.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSourcesImpl _authRemoteDataSourcesImpl;

  AuthRepositoryImpl({required AuthRemoteDataSourcesImpl authRemoteDataSourcesImpl})
      : _authRemoteDataSourcesImpl = authRemoteDataSourcesImpl;

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var result = await _authRemoteDataSourcesImpl.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result == null) {
        return Left(AuthFailure(
            message: 'Could Not Authenticate. Something Went Wrong',
            statusCode: 402));
      }

      return Right(result);
    } catch (e) {
      return Left(
        AuthFailure(
          message: 'Could Not Login. Something Went Wrong',
          statusCode: 402,
        ),
      );
    }
  }

  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var result = await _authRemoteDataSourcesImpl.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );

      if (result == null) {
        return Left(
          AuthFailure(
            message: 'Could Not Sign Up. Something Went Wrong',
            statusCode: 402,
          ),
        );
      }

      return Right(result);
    } catch (e) {
      debugPrint()
      return Left(
        AuthFailure(
          message: 'Could Not Authenticate. Something Went Wrong',
          statusCode: 402,
        ),
      );
    }
  }
}
