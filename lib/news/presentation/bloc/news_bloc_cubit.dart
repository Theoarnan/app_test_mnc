import 'package:app_test_mnc/news/models/news_model.dart';
import 'package:app_test_mnc/news/models/news_response.dart';
import 'package:app_test_mnc/news/repository/news_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_bloc_state.dart';

class NewsBlocCubit extends Cubit<NewsBlocState> {
  NewsBlocCubit() : super(NewsBlocInitialState()) {
    fetchingData();
  }

  final NewsRepository apiServices = NewsRepository();
  int indexDetailImage = 0;

  void fetchingData() async {
    emit(NewsBlocLoadingState());
    NewsResponse? dataResponse = await apiServices.getNews();
    if (dataResponse == null) {
      emit(const NewsBlocErrorState("Error Unknown"));
    } else {
      emit(NewsBlocLoadedState(dataResponse.newsData));
    }
  }
}
