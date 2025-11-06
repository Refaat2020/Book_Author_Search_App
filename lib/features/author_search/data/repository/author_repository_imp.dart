import 'package:book_author_search_app/features/author_search/data/data_source/author_data_source.dart';
import 'package:book_author_search_app/features/author_search/data/models/author_model.dart';

import '../../../../common/model/failure_model.dart';
import 'author_repository.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final AuthorSearchDataSource _authorSearchDataSource;

  AuthorRepositoryImpl(this._authorSearchDataSource);

  @override
  Future<List<AuthorModel>> searchAuthors(String authorName) async {

    try {
      final response = await _authorSearchDataSource.searchForAuthor(
        authorName,
      );
      List<AuthorModel> authors = List<AuthorModel>.from(
        (response).map((x) => AuthorModel.fromJson(x)),
      );
      return authors;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }
}
