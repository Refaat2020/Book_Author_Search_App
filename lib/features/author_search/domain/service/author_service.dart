import 'package:book_author_search_app/common/model/failure_model.dart';
import 'package:book_author_search_app/features/author_search/data/repository/author_repository.dart';
import 'package:book_author_search_app/features/author_search/domain/entities/author.dart';

class AuthorService {
  final AuthorRepository _authorRepository;

  AuthorService(this._authorRepository);

  Future<List<Author>> searchForAuthor(String authorName) async {

    try {
      return await _authorRepository.searchAuthors(authorName);
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }
}
