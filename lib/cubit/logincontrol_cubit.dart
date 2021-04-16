import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logincontrol_state.dart';

class LogincontrolCubit extends Cubit<LogincontrolState> {
  LogincontrolCubit() : super(LogincontrolState(isLogin: true));

  void changetype(bool type) => emit(LogincontrolState(isLogin: type));
}
