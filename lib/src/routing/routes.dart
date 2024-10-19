import 'package:flutter/material.dart';
import 'package:wtfeua/src/features/address/presentation/address.dart';
import 'package:wtfeua/src/features/ai_diet/presentation/diet_plan.dart';
import 'package:wtfeua/src/features/auth/presentation/sign_out.dart';
import 'package:wtfeua/src/features/cart/presentation/foodcart.dart';
import 'package:wtfeua/src/features/health/presentation/health_report.dart';
import 'package:wtfeua/src/features/health/presentation/health_tracker.dart';
import 'package:wtfeua/src/features/help/presentation/help.dart';
import 'package:wtfeua/src/features/home/presentation/home_page.dart';
import 'package:wtfeua/src/features/orders/presentation/orders.dart';
import 'package:wtfeua/src/features/payment/presentation/payment.dart';
import 'package:wtfeua/src/features/profile/presentation/profile.dart';
import 'package:wtfeua/src/features/tiffin/presentation/breakfast_screen.dart';
import 'package:wtfeua/src/features/tiffin/presentation/dinner_screen.dart';
import 'package:wtfeua/src/features/tiffin/presentation/tiffin_home.dart';

Map<String, Widget Function(BuildContext)> routeList = <String, WidgetBuilder>{
  '/healthTracker': (context) => HealthTracker(),
  '/userProfile': (context) => userProfile(),
  '/healthReport': (context) => HealthReport(),
  '/address': (context) => AddressPage(),
  '/orders': (context) => ordersPage(),
  '/help': (context) => HelpPage(),
  '/payment': (context) => paymentPage(),
  '/signOut': (context) => SignOut(),
  'aiDietPlan': (context) => aiDietPlan(),
  'tiffinService': (context) => TiffinServicePage(),
  '/dinner': (context) => DinnerPage(),
  '/breakfast': (context) => BreakfastScreen(),
  '/cart': (context) => FoodCart(),
  '/home': (context) => HomePage(),
};
