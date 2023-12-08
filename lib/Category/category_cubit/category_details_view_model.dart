import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Category/category_cubit/states.dart';
import 'package:newsapp/Model/api_manager.dart';

class CategoryDetailsViewModel extends Cubit<CategorySourceState> {
  CategoryDetailsViewModel() : super(SourceLoadingState());

  void getSource(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSource(categoryId);
      if (response?.status == 'error') {
        // errorMessage = response?.message;
        emit(SourceErrorState(errorMessage: response!.message));
      } else {
        emit(SourceSuccessState(sourcesList: response?.sources));
      }
    } catch (e) {
      ///el error mn 3nd el user
      emit(SourceErrorState(errorMessage: 'Error'));
    }
  }
}
