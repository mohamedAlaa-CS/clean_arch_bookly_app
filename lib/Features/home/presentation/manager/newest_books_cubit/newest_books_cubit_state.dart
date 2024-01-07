abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}

class NewestBooksSuccess extends NewestBooksState {}
