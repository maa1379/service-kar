import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'Models/CarModel.dart';
import 'Models/OilChangeModel.dart';
import 'Screens/CarDetailScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/OilListScreen.dart';
import 'Screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );


  try {
    await CarModel().createDb();
  } catch (e) {
    print(e);
  }
  try {
    await OilChangeModel().createDb();
  } catch (e) {
    print(e);
  }
  // try {
  //   await CheckBoxModel().createDb();
  // } catch (e) {
  //   print(e);
  // }
  runApp(
    MediaQuery(
      data: const MediaQueryData(),
      child: GetMaterialApp(
        getPages: [
          GetPage(name: "/", page: () => SplashScreen()),
          GetPage(name: "/home", page: () => HomeScreen()),
          GetPage(name: "/carDetail", page: () => CarDetailScreen()),
          GetPage(name: "/oilList", page: () => OilListScreen()),
        ],
        defaultTransition: Transition.zoom,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: SplashScreen(),
      ),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 60
    ..textColor = Colors.black
    ..radius = 20
    ..backgroundColor = Colors.transparent
    ..maskColor = Colors.white
    ..indicatorColor = Colors.black54
    ..userInteractions = false
    ..dismissOnTap = false
    ..boxShadow = <BoxShadow>[]
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
}
