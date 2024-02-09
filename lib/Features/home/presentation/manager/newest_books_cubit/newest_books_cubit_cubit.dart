import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewsBooksUseCase) : super(NewestBooksInitial());

  final FetchNewsBooksUseCase fetchNewsBooksUseCase;
//test git hub to vs
  static NewestBooksCubit get(context) => BlocProvider.of(context);

  List<BookEntity> newestBooksList = [];
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    emit(NewestBooksLoading());
    var result = await fetchNewsBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(NewestBooksFailure(errorMessage: failure.message));
    }, (success) {
      emit(NewestBooksSuccess());
      newestBooksList.addAll(success);
    });
  }
}
