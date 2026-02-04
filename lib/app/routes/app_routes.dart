part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const PENCARIAN = _Paths.PENCARIAN;
  static const DETAIL_ARTICLE = _Paths.DETAIL_ARTICLE; // Tambahkan ini
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DASHBOARD = '/dashboard';
  static const PENCARIAN = '/pencarian';
  static const DETAIL_ARTICLE = '/detail-article'; // Tambahkan ini
}