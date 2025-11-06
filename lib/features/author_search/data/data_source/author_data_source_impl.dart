import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/rest_api/dio_client.dart';
import 'author_data_source.dart';

class AuthorSearchDataSourceImpl implements AuthorSearchDataSource {
  final DioClient _dioClient;

  AuthorSearchDataSourceImpl(this._dioClient);

  @override
  Future<List> searchForAuthor(String authorName) async {

    try {
      final response = await _dioClient.getRequest(AppUrl.searchAuthors,prams: {'q':authorName});
      return response['docs'];
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }
}
