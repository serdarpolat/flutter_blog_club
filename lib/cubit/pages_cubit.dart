import 'package:bloc/bloc.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  PagesCubit() : super(PagesState(page: 0));

  void changePage(int pg) => emit(PagesState(page: pg));
}
