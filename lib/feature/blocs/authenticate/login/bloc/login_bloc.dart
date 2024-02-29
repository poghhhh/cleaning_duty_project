import 'package:cleaning_duty_project/feature/data/entities/request/authentication/login/login_request.dart';
import 'package:cleaning_duty_project/feature/data/remote/authenticate/authenticate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.authenticationRepository) : super(LoginInitial()) {
    on<LoginStarted>(_onLoginStarted);
  }

  final AuthenticationRepositoryImpl authenticationRepository;

  void _onLoginStarted(LoginStarted event, Emitter<LoginState> emit) async {
    emit(LoginProgress());
    final response = await authenticationRepository.login(event.loginRequest);
    if (response.accessToken != null) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure());
    }
  }
}
