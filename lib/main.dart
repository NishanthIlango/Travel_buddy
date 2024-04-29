import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/post_screen_provider.dart';
import 'package:travel_app/screen/post_listing_screen.dart';
import 'package:travel_app/screen/post_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/screen/splash_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostScreenProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can bess
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          PostScreen.routeName:(context) => PostScreen(),
          PostListingScreen.routeName:(context) => PostListingScreen(),
          SplashScreen.routeName:(context)=>SplashScreen()
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

