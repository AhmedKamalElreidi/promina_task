import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_colors/app_styles.dart';
import 'package:promina_task/core/util/app_images/app_images.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';

import 'custom_login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppAssets.loginBg2,
            ),
            fit: BoxFit.fill),
      ),
      child: ListView(
        children: [
          heightSpace(MediaQuery.of(context).size.height * 0.17),
          Text(
            "My\nGellary ",
            textAlign: TextAlign.center,
            style: AppStyles.textStyle50,
          ),
          heightSpace(10.h),
          const CustomLoginForm()
        ],
      ),
    );
  }
}
