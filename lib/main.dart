import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresume_app/apis/auth.dart';
import 'package:fresume_app/global/constants/constants.dart';
import 'package:fresume_app/global/routes/routes.dart';
import 'package:fresume_app/global/theme/theme.dart';
import 'package:fresume_app/global/widgets/loading.dart';
import 'package:fresume_app/pages/home/view/home_view.dart';
import 'package:fresume_app/pages/unknown/unknown_route.dart';
import 'package:fresume_app/src/shared/shared.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

final localeProvider = StateProvider<Locale?>((_) => null);

//Test commit
Future<void> main() async {
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: firebaseConfig,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return GetMaterialApp(
      title: 'Fresume',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: locale,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        background: Container(
          color: Colors.grey.shade50,
        ),
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
      theme: lightThemeDta,
      initialRoute: '/',
      unknownRoute:
          GetPage<void>(name: '/error', page: () => const UnknownRoute()),
      getPages: getPages,
    );
  }
}

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangeProvider).when(
      data: (snapshot) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          if (snapshot != null) {
            Get.offAndToNamed<void>('/home');
          }
        });

        if (snapshot == null) {
          return const HomeAuthView();
        }

        // Render your application if authenticated
        return progressWidget(context);
      },
      loading: () {
        return Container();
      },
      error: (e, s) {
        throw UnimplementedError();
      },
    );
  }
}
