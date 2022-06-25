import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/auth/login_page.dart';
import 'package:shopping_app/modules/auth/onboarding_page.dart';

import 'firebase_options.dart';
import 'modules/home_page/home_app_page.dart';
import 'modules/my_app.dart';
import 'services/local_storage_services/sembast_database.dart';
import 'theme/theme_controller.dart';
import 'theme/theme_providers.dart';
import 'theme/theme_sembast.dart';
import 'theme/theme_service.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   ///Init local storage database
//   final sembastLocalStore =
//       await SembastDataStore.initWithDefaultDatabasename();
//   final ThemeService themeService = ThemeServiceSembast(sembastLocalStore);

//   final themeModeController = ThemeModeController(themeService);
//   await themeModeController.getThemeMode();

//   final themeController = SchemeController(themeService);
//   await themeController.getTheme();

//   // turn off the # in the URLs on the web
//   GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => ProviderScope(overrides: [
//         themeModeControllerProvider.overrideWithValue(themeModeController),
//         schemeControllerProvider.overrideWithValue(themeController),
//       ], child: MyApp()),
//     ),
//   );
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'shopping_app',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MainPage(),
            debugShowCheckedModeBanner: false));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeApp(
            title: 'hahaha',
          );
        }
        return const LoginPage();
      },
    ));
  }
}
