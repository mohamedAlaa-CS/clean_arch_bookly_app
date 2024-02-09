import 'package:bookly/Features/home/domain/entities/book_entity.dart';
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
  bool isLoading = false;
  List<BookEntity> booksList = [];
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_controllerLister);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _controllerLister() async {
    var currentPostion = _scrollController.position.pixels;
    var scrollLenght = _scrollController.position.maxScrollExtent;
    if (currentPostion >= 0.7 * scrollLenght) {
      if (!isLoading) {
        isLoading = true;
        await FeaturedBooksCubit.get(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          booksList.addAll(state.books);
        } else if (state is FeaturedBooksPaginationfailuer) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationfailuer) {
          return FeaturedBooksListView(
            controller: _scrollController,
            booksList: booksList,
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
