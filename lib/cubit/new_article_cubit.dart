import 'package:bloc/bloc.dart';

part 'new_article_state.dart';

class NewArticleCubit extends Cubit<NewArticleState> {
  NewArticleCubit() : super(NewArticleState(newArticle: false));
  void changeNewArticleState() =>
      emit(NewArticleState(newArticle: !state.newArticle));
}
