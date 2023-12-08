import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Model/api_manager.dart';
import 'package:newsapp/News/cubit/states.dart';

import '../../Model/NewsResponse.dart';

class NewsContainerViewModel extends Cubit<NewsState> {
  NewsContainerViewModel() : super(NewsLoadingState());
  List<News>? newsList;

  String? errorMessage;

  void getNewsBySourceId([String? sourceId, String? query]) async {
    try {
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message));
      } else {
        emit(NewsSuccessState(newsList: response?.articles));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: 'Error Loading News List'));
    }
  }
}
