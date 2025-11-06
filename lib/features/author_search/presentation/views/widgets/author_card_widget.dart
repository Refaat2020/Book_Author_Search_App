import 'package:book_author_search_app/core/constants/app_urls.dart';
import 'package:book_author_search_app/features/author_search/presentation/views/widgets/work_count_widget.dart';
import 'package:book_author_search_app/file_export.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../domain/entities/author.dart';

class AuthorCardWidget extends StatelessWidget {
  final Author author;

  const AuthorCardWidget({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.surface, AppColors.surface],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Future: Navigate to author details page
            },
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Author Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAuthorName(context),
                        if (author.birthDate != null) ...[
                          SizedBox(height: 4.h),
                          _buildBirthDate(context),
                        ],
                        if (author.topWork != null) ...[
                          SizedBox(height: 8.h),
                          _buildTopWork(context),
                        ],
                        SizedBox(height: 12.h),
                        WorkCountWidget(author.workCount),
                        if (author.alternateNames.isNotEmpty) ...[
                          SizedBox(height: 8.h),
                          _buildAlternateNames(context),
                        ],
                      ],
                    ),
                  ),

                  // Arrow Icon
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18.sp,
                    color: AppColors.textLight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildAuthorName(BuildContext context) {
    return Text(
      author.name,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildBirthDate(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.cake_rounded, size: 14.sp, color: AppColors.textSecondary),
        SizedBox(width: 4.w),
        Text(
          author.birthDate!,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildTopWork(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        gradient: AppColors.accentGradient.scale(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 14.sp, color: AppColors.warning),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              author.topWork!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlternateNames(BuildContext context) {
    final displayNames = author.alternateNames.take(2).join(', ');
    final hasMore = author.alternateNames.length > 2;

    return Row(
      children: [
        Icon(
          Icons.info_outline_rounded,
          size: 14.sp,
          color: AppColors.textLight,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            'Also known as: $displayNames${hasMore ? '...' : ''}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textLight,
              fontStyle: FontStyle.italic,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
