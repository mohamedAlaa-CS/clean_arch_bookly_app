import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit() : super(NewestBooksCubitInitial());
}
