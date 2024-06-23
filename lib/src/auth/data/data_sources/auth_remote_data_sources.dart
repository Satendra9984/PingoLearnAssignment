import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingolearn/core/errors/exceptions.dart';

class AuthRemoteDataSourcesImpl {
  AuthRemoteDataSourcesImpl({required FirebaseAuth auth}) : _auth = auth;

  final FirebaseAuth _auth;

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw LocalAuthException(
          message: 'No user found for that email.',
          statusCode: 402,
        );
      } else if (e.code == 'wrong-password') {
        throw LocalAuthException(
          message: 'Wrong password provided for that user.',
          statusCode: 402,
        );
      }
    } catch (e) {
      throw LocalAuthException(
        message: 'Could Not Authenticate',
        statusCode: 400,
      );
    }
    return null;
  }

  Future<User?> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw LocalAuthException(
          message: 'The password provided is too weak.',
          statusCode: 402,
        );
      } else if (e.code == 'email-already-in-use') {
        throw LocalAuthException(
          message: 'The account already exists for that email.',
          statusCode: 402,
        );
      }
    } catch (e) {
      throw LocalAuthException(
        message: 'Cannot Authenticate.Something Went Wrong.',
        statusCode: 402,
      );
    }
    return null;
  }
}
