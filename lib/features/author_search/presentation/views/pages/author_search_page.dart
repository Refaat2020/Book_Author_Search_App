import 'package:book_author_search_app/common/widgets/empty_state.dart';
import 'package:book_author_search_app/common/widgets/error_state.dart';
import 'package:book_author_search_app/common/widgets/loading_state.dart';
import 'package:book_author_search_app/features/author_search/presentation/cubit/author_search_cubit.dart';
import 'package:book_author_search_app/file_export.dart';

import '../../../../../core/services/debouncer_services.dart';
import '../widgets/page_header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/author_list_widget.dart';

class AuthorSearchPage extends StatefulWidget {
  const AuthorSearchPage({super.key});

  @override
  State<AuthorSearchPage> createState() => _AuthorSearchPageState();
}

class _AuthorSearchPageState extends State<AuthorSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  late final  DebounceServices debounceService;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    debounceService = DebounceServices(milliseconds: 300);
  }

  void _onSearchChanged(String query) {
    debounceService.run(() => context.read<AuthorSearchCubit>().searchForAuthors(query),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Column(
            children: [
              PageHeaderWidget(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildSearchSection(),
                      Expanded(child: _buildContent()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: ResponsiveUtils.getPagePadding(
        context,
      ).copyWith(top: 24.h, bottom: 16.h),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: ResponsiveUtils.getMaxWidth(context),
          ),
          child: SearchBarWidget(
            controller: _searchController,
            onSearchChanged: _onSearchChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<AuthorSearchCubit, AuthorSearchState>(
      builder: (context, state) {
        if (state is AuthorSearchInitial) {
          return _buildInitialState();
        } else if (state is AuthorSearchLoading) {
          return const LoadingState(message: 'Searching for authors...');
        } else if (state is AuthorSearchLoaded) {
          return _buildLoadedState(state);
        } else if (state is AuthorSearchEmpty) {
          return const EmptyState(
            title: 'No Authors Found',
            message: 'Try searching with different keywords',
            icon: Icons.search_off_rounded,
          );
        } else if (state is AuthorSearchError) {
          return ErrorState(
            message: state.errorMessage ?? '',
            onRetry: () {
              if (_searchController.text.isNotEmpty) {
                _onSearchChanged(_searchController.text);
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildInitialState() {
    return EmptyState(
      title: 'Start Searching',
      message: 'Enter an author name to begin your search',
      icon: Icons.search_rounded,
    );
  }

  Widget _buildLoadedState(AuthorSearchLoaded state) {
    return Padding(
      padding: ResponsiveUtils.getPagePadding(context).copyWith(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildResultsHeader(state),
          SizedBox(height: 8.h),
          Expanded(
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveUtils.getMaxWidth(context),
                ),
                child: AuthorListWidget(authors: state.authors),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsHeader(AuthorSearchLoaded state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: AppColors.primary,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            'Found ${state.authors.length} ${state.authors.length == 1 ? 'author' : 'authors'}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
