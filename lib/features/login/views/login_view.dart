import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/features/login/view_model/login_cubit.dart';
import 'package:promina_task/features/login/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
