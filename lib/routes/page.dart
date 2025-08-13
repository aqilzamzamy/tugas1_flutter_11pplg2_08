import 'package:get/route_manager.dart';
import 'package:latihan_11pplg2/pages/calculator_page.dart';
import 'package:latihan_11pplg2/pages/football_page.dart';
import 'package:latihan_11pplg2/pages/editplayer_page.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator_page, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.football_page, page: () => FootballPage()),
    GetPage(name: AppRoutes.editplayer_page, page: () => EditPlayerPage()),
  ];
}
