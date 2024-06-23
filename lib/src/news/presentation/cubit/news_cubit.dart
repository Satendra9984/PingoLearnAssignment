import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pingolearn/src/news/data/models/news_model.dart';
import 'package:pingolearn/src/news/data/repos/news_repo_impl.dart';
import 'package:pingolearn/src/news/presentation/models/loading_state.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepoImpl _newsRepoImpl;

  NewsCubit({
    required NewsRepoImpl newsRepoImpl,
  })  : _newsRepoImpl = newsRepoImpl,
        super(
          const NewsState(
            newsList: [],
            loadingStates: LoadingStates.initial,
          ),
        );

  Future<void> getNewsList() async {
    emit(state.copyWith(loadingStates: LoadingStates.loading));

    var result = await _newsRepoImpl.getNewsList();

    result.fold(
      (failed) {
        emit(state.copyWith(loadingStates: LoadingStates.erroLoading));
      },
      (list) {
        emit(
          state.copyWith(
            loadingStates: LoadingStates.loaded,
            newsList: list,
          ),
        );
      },
    );
  }
}
