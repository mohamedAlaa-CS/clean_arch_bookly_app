import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  late ScrollController _scrollController;
  int nextPage = 1;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_controllerLister);
    super.initState();
  }

  void _controllerLister() async {
    var currentPostion = _scrollController.position.pixels;
    var scrollLenght = _scrollController.position.maxScrollExtent;
    if (currentPostion >= 0.7 * scrollLenght) {
      await FeaturedBooksCubit.get(context)
          .fetchFeaturedBooks(pageNumber: nextPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListView(
            controller: _scrollController,
            booksList: state.books,
          );
        } else if (state is FeaturedBooksFailuer) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
