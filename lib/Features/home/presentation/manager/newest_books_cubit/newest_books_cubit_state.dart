abstract class NewestBooksCubitState {}

class NewestBooksCubitInitial extends NewestBooksCubitState {}

class NewestBooksCubitLoading extends NewestBooksCubitState {}

class NewestBooksCubitFailure extends NewestBooksCubitState {
  final String errorMessage;

  NewestBooksCubitFailure({required this.errorMessage});
}

class NewestBooksCubitSuccess extends NewestBooksCubitState {}
