import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myflyn/modules/home/splash_screen.dart';
import 'package:myflyn/modules/profile/info_view.dart';
import 'package:myflyn/modules/profile/interest_category_view';
import 'package:myflyn/modules/profile/profile_basic_view.dart';
import 'core/app_routes.dart';
import 'core/app_bindings.dart';
import 'modules/home/home_view.dart';
import 'modules/campaign/campaign_matching_view.dart';
import 'modules/profile/profile_password_view.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashView()),
        GetPage(name: AppRoutes.home, page: () => const HomeView()),
        GetPage(
          name: AppRoutes.campaignMatching,
          page: () => const CampaignMatchingView(),
        ),
        GetPage(
          name: AppRoutes.profilePassword,
          page: () => const ProfilePasswordView(),
        ),
        GetPage(name: AppRoutes.info, page: () => const InfoView()),
        GetPage(
          name: AppRoutes.profileBasic,
          page: () => const ProfileBasicView(),
        ),
        GetPage(
          name: AppRoutes.interestCategory,
          page: () => const InterestCategoryView(),
        ),
      ],
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    ),
  );
}

class SecondchapterFigmaApp extends StatelessWidget {
  const SecondchapterFigmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashView()),
        GetPage(name: AppRoutes.home, page: () => const HomeView()),
        GetPage(
          name: AppRoutes.campaignMatching,
          page: () => const CampaignMatchingView(),
        ),
        GetPage(
          name: AppRoutes.profilePassword,
          page: () => const ProfilePasswordView(),
        ),
        GetPage(
          name: AppRoutes.interestCategory,
          page: () => const InterestCategoryView(),
        ),
      ],
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.5,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
