part of 'news_cubit.dart';

class NewsState extends Equatable {
  final LoadingStates loadingStates;
  final List<NewsModel> newsList;

  const NewsState({
    required this.loadingStates,
    required this.newsList,
  });

  NewsState copyWith({
    LoadingStates? loadingStates,
    List<NewsModel>? newsList,
  }) {
    return NewsState(
      loadingStates: loadingStates ?? this.loadingStates,
      newsList: newsList ?? this.newsList,
    );
  }

  @override
  List<Object> get props => [loadingStates, newsList];
}
