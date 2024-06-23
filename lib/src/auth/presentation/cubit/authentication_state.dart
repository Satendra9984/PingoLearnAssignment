part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStates authenticationStates;
  const AuthenticationState({
    required this.authenticationStates,
  });

  AuthenticationState copyWith({
    AuthenticationStates? authenticationStates,
  }) {
    return AuthenticationState(
      authenticationStates: authenticationStates ?? this.authenticationStates,
    );
  }

  @override
  List<Object> get props => [authenticationStates];
}
