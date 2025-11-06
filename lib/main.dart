import 'package:book_author_search_app/core/config/theme/app_theme.dart';
import 'package:book_author_search_app/core/services/service_locator/injection_container.dart';
import 'package:book_author_search_app/features/author_search/presentation/cubit/author_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/author_search/presentation/views/pages/author_search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Book Author Search',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: BlocProvider(
            create: (context) => locator<AuthorSearchCubit>(),
            child: const AuthorSearchPage(),
          ),
        );
      },
    );
  }
}
