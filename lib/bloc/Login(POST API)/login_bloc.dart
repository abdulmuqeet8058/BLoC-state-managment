import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }
  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    print("action called");
    emit(state.copyWith(
        loginStatus: LoginStatus.loading, message: 'loading...'));
    print(
        "credentials are : \nEmail : ${state.email}\nPassword : ${state.password}");
    Map data = {'email': state.email, 'password': state.password};
    try {
      print("hitting the api....");
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: data);
      print("Status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        print("success");
        emit(state.copyWith(
            loginStatus: LoginStatus.success, message: 'Successful Login'));
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.error,
            message: 'something went wrong. try again'));
      }
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error, message: e.toString()));
    }
  }
}
