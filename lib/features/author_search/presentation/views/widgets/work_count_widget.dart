import 'package:book_author_search_app/file_export.dart';

class WorkCountWidget extends StatelessWidget {
  const WorkCountWidget(this.workCount, {super.key});
  final int workCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.book_rounded, size: 16.sp, color: AppColors.primary),
          SizedBox(width: 6.w),
          Text(
            '$workCount ${workCount == 1 ? 'work' : 'works'}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
