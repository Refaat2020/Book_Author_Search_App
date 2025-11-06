import 'package:book_author_search_app/file_export.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static int getCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  static double getMaxWidth(BuildContext context) {
    if (isDesktop(context)) return 1200.w;
    return double.infinity;
  }

  static EdgeInsets getPagePadding(BuildContext context) {
    if (isDesktop(context)) {
      return EdgeInsets.symmetric(horizontal: 48.w, vertical: 24.h);
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h);
    } else {
      return EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h);
    }
  }
}
