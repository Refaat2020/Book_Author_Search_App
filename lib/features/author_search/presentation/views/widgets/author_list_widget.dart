import 'package:book_author_search_app/file_export.dart';

import '../../../domain/entities/author.dart';
import 'author_card_widget.dart';

class AuthorListWidget extends StatelessWidget {
  final List<Author> authors;

  const AuthorListWidget({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ResponsiveUtils.getCrossAxisCount(context);

    if (crossAxisCount == 1) {
      return ListView.builder(
        padding: EdgeInsets.only(top: 16.h),
        itemCount: authors.length,
        itemBuilder: (context, index) {
          return AuthorCardWidget(author: authors[index]);
        },
      );
    }

    return GridView.builder(
      padding: EdgeInsets.only(top: 16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 3.5,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: authors.length,
      itemBuilder: (context, index) {
        return AuthorCardWidget(author: authors[index]);
      },
    );
  }
}
