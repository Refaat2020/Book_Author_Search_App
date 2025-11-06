import 'package:book_author_search_app/features/author_search/data/data_source/author_data_source.dart';
import 'package:book_author_search_app/features/author_search/data/repository/author_repository.dart';
import 'package:book_author_search_app/features/author_search/data/repository/author_repository_imp.dart';
import 'package:book_author_search_app/features/author_search/domain/service/author_service.dart';
import 'package:book_author_search_app/features/author_search/presentation/cubit/author_search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/author_search/data/data_source/author_data_source_impl.dart';
import '../../config/dio_options.dart';
import '../rest_api/dio_client.dart';
import '../rest_api/dio_client_impl.dart';

final locator = GetIt.instance;

///how to take object from class in service locator
/// Repo repo = locator<Repo>();
void setupLocator() {
  // App Services
  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<DioConfigOptions>(() => DioConfigOptions());

  locator.registerLazySingleton<DioClient>(
    () => DioClientImpl(
      dio: locator<Dio>(),
      dioConfigOptions: locator<DioConfigOptions>(),
    ),
  );

  //  Feature Data source

  locator.registerLazySingleton<AuthorSearchDataSource>(
    () => AuthorSearchDataSourceImpl(locator<DioClient>()),
  );

  // Feature Repository
  locator.registerLazySingleton<AuthorRepository>(
    () => AuthorRepositoryImpl(locator<AuthorSearchDataSource>()),
  );
  // Feature Services
  locator.registerLazySingleton(
    () => AuthorService(locator<AuthorRepository>()),
  );

  locator.registerFactory(() => AuthorSearchCubit(locator<AuthorService>()));
}
