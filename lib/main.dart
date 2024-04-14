import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/bloc_observer.dart';
import 'package:promina_task/core/helper/network/dio_helper.dart';
import 'package:promina_task/core/helper/secure_storage/secure_storage.dart';
import 'package:promina_task/core/util/secure_keys/secure_key.dart';
import 'package:promina_task/core/util/secure_keys/secure_variable.dart';
import 'package:promina_task/features/login/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SecureStorage.init();

  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await SecureStorage.deleteData(key: SecureKey.token);
  SecureVariables.token = await SecureStorage.getData(key: SecureKey.token);
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (_) => const MyApp(),
      // ),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => const MaterialApp(
        title: 'Promina task',
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
