import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgnerator/bloc/savePassword/cubit/save_password_cubit.dart';
import 'package:passwordgnerator/bloc/viewPassword/view_password_cubit.dart';
import 'package:passwordgnerator/page/gnerat_password.dart';
import 'package:passwordgnerator/page/splash_screan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/genratePassword/generat_random_password_cubit.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return 
   MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GeneratRandomPasswordCubit(),
      ),
      BlocProvider(
        create: (context) => SavePasswordCubit(),
      ),
      BlocProvider(
        create: (context) => ViewPasswordCubit(),
      ),
     
    ],
    child:  MaterialApp(home: GneratPassword(),),
   );
    });
}
}