import 'package:dairyongo/controllers/recommended_product_controller.dart';
import 'package:dairyongo/pages/cart/cart_page.dart';
import 'package:dairyongo/pages/home/main_dashboard.dart';
import 'package:dairyongo/pages/products/recommended_product.dart';
import 'package:dairyongo/views/login_view.dart';
import 'package:dairyongo/views/register_view.dart';
import 'package:dairyongo/views/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:dairyongo/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),

      //routes to go from login view to register view and vice versa
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return RecommendedProductDetails();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

          default: // TODO: Handle this case.
            return const CircularProgressIndicator(); //if there is any prblem or a delay in loading the screen then loading... will appear
        }
      },
    );
  }
}
