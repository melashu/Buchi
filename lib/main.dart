// ignore_for_file: avoid_unnecessary_containers

// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:buchi/services/LocalCatch.dart';
import 'package:buchi/style/textstyle.dart';
import 'package:buchi/view/Home.dart';
import 'package:buchi/viewModel/PetNotifier.dart';
import 'package:buchi/viewModel/SearchNotiffier.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  /**
   * the two aync calling returns the opened hive 
   * box which is used to catch data locally. 
   *  await Boxes.getBuchi();
      await Boxes.getAdopted();

   */
  await Hive.initFlutter();
  await Boxes.getBuchi();
  await Boxes.getAdopted();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var buchiBox = Hive.box("buchi");

    /// Here we are intializing the catching status to false
    buchiBox.get('isCatched') == null
        ? buchiBox.put("isCatched", false)
        : buchiBox.put("isCatched", true);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PetNotiffier()),
          ChangeNotifierProvider(create: (_) => SearchNotifier())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pet Finder',
            theme: ThemeData(
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.accent,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                primarySwatch: Colors.grey,
                bottomAppBarColor: Colors.amber[50]),
            home: SplashScreenView(
              text: "Welcome to Buchi",
              duration: 5000,
              textType: TextType.ColorizeAnimationText,
              textStyle: Style().getWelcomeStyle,
              pageRouteTransition: PageRouteTransition.SlideTransition,
              navigateRoute: SplashScreenView(
                navigateRoute: const HomePage(),
                imageSrc: 'assets/images/start.png',
                duration: 5000,
                imageSize: 400,
                text: "Designed by Melashu A.",
                textType: TextType.TyperAnimatedText,
                textStyle: const TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                pageRouteTransition: PageRouteTransition.SlideTransition,
              ),
            )));
    // return ;
  }
}
