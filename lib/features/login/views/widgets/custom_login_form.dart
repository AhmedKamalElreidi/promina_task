import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helper/secure_storage/secure_storage.dart';
import 'package:promina_task/core/util/app_colors/app_colors.dart';
import 'package:promina_task/core/util/app_colors/app_styles.dart';
import 'package:promina_task/core/util/app_functions/app_functions.dart';
import 'package:promina_task/core/util/app_validator/app_validator.dart';
import 'package:promina_task/core/util/secure_keys/secure_key.dart';
import 'package:promina_task/core/util/secure_keys/secure_variable.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';
import 'package:promina_task/core/util/widgets/text_form_field_widget.dart';
import 'package:promina_task/features/gallery/views/gallery_view.dart';
import 'package:promina_task/features/login/view_model/login_cubit.dart';

import 'custom_submit_button.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
   
        if (state is LoginSuccessState) {
          SecureVariables.token =
              await SecureStorage.getData(key: SecureKey.token);
          AppFunctions.showToast(text: "Login Success");
          AppFunctions.navigateTo(
                  context: context, navigatedScreen: const GalleryView());
            
        }
             if (state is LoginErrorState) {
          AppFunctions.showToast(text: state.error);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          margin: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.whiteColor.withOpacity(0.7),
          ),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Text(
                  "Log in",
                  style: AppStyles.textStyle30,
                ),
                heightSpace(25.h),
                CustomTextFormField(
                    hintText: "Email",
                    controller: cubit.emailCtrl,
                    validator: emailValidator(),
                    keyboardType: TextInputType.text),
                heightSpace(25.h),
                CustomTextFormField(
                    hintText: "Password",
                    controller: cubit.passCtrl,
                    validator: passwordValidator(),
                    keyboardType: TextInputType.visiblePassword),
                heightSpace(25.h),
                state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomSubmitButton(
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login(
                                email: cubit.emailCtrl.text,
                                password: cubit.passCtrl.text);
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
