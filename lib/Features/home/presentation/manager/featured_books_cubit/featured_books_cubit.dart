import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featuered_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeatueredBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeatueredBooksUseCase fetchFeatueredBooksUseCase;

  static FeaturedBooksCubit get(context) => BlocProvider.of(context);

  List<BookEntity> booksList = [];
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeatueredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(FeaturedBooksFailuer(errorMessage: failure.message));
    }, (success) {
      emit(FeaturedBooksSuccess());
      booksList.addAll(success);
    });
  }
}
