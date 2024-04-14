import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/constant/end_points/end_points.dart';
import 'package:promina_task/core/helper/network/dio_helper.dart';
import 'package:promina_task/core/helper/secure_storage/secure_storage.dart';
import 'package:promina_task/core/util/secure_keys/secure_key.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

    Future login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final response = await DioHelper.postData(url: EndPoints.login, data: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      SecureStorage.saveData(
          key: SecureKey.token, value: response.data["token"]);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(error: response.data["error_message"]));
    }
  }

}
