import 'package:book_author_search_app/file_export.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearchChanged;
  final TextEditingController controller;

  const SearchBarWidget({
    super.key,
    required this.onSearchChanged,
    required this.controller,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search for authors...',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.primary,
            size: 24.sp,
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear_rounded, size: 20.sp),
                  onPressed: () {
                    widget.controller.clear();
                    widget.onSearchChanged('');
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 18.h,
          ),
        ),
      ),
    );
  }
}
