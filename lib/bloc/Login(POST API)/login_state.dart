part of 'login_bloc.dart';

enum LoginStatus { inital, loading, success, error }

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.loginstatus = LoginStatus.inital,
    this.message = '',
  });
  final String email;
  final String password;
  final String message;
  final LoginStatus loginstatus;
  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      LoginStatus? loginStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginstatus: loginStatus ?? this.loginstatus,
    );
  }

  @override
  List<Object> get props => [email, password, message, loginstatus];
}
