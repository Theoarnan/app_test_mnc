part of 'news_bloc_cubit.dart';

abstract class NewsBlocState extends Equatable {
  const NewsBlocState();
  @override
  List<Object?> get props => [];
}

class NewsBlocInitialState extends NewsBlocState {}

class NewsBlocLoadingState extends NewsBlocState {}

class NewsBlocLoadedState extends NewsBlocState {
  final List<NewsModel>? dataNews;
  const NewsBlocLoadedState(this.dataNews);
  @override
  List<Object?> get props => [dataNews];
}

class NewsBlocErrorState extends NewsBlocState {
  final String error;
  const NewsBlocErrorState(this.error);
  @override
  List<Object> get props => [error];
}
