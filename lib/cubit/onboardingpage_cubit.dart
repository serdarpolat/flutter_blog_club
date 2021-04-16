import 'package:bloc/bloc.dart';

part 'onboardingpage_state.dart';

class OnboardingpageCubit extends Cubit<OnboardingpageState> {
  OnboardingpageCubit() : super(OnboardingpageState(page: 0));

  void incrementPage() => emit(
      OnboardingpageState(page: state.page < 3 ? state.page + 1 : state.page));
}
