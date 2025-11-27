import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_star_app/features/splash/presentation/views/splash_view.dart';

class HouseStarApp extends StatelessWidget {
  const HouseStarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return const MaterialApp(
          title: 'HouseStar',
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        );
      },
    );
  }
}
