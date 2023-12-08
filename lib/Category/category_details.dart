import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Category/category_cubit/category_details_view_model.dart';
import 'package:newsapp/Category/category_cubit/states.dart';
import 'package:newsapp/HomeScreen/tab_container.dart';
import 'package:newsapp/Model/category_data.dart';
import 'package:newsapp/my-theme.dart';

class CategoryDetails extends StatefulWidget {
  static const String routename = 'CategoryDetails';
  CategoryData categoryData;

  CategoryDetails({required this.categoryData});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSource(widget.categoryData.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategorySourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            /// check 3ala no3 msh value
            return Center(
                child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ));
          } else if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSource(widget.categoryData.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          } else if (state is SourceSuccessState) {
            return TabContainer(sourcesList: state.sourcesList!);
          }
          return Container();

          /// in case en kol el conditions fakast bas ana mota2kd eno est7ala fa hrg3lo cont. 3shan my3ytsh
        });

    //   ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<CategoryDetailsViewModel>(
    //     builder: (context, viewModel, child) {
    //       if (viewModel.errorMessage != null) {
    //         return Column(
    //           children: [
    //             Text(viewModel.errorMessage!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   viewModel.getSource(widget.categoryData.id);
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         );
    //       } else if (viewModel.sourcesList == null) {
    //         return Center(
    //             child: CircularProgressIndicator(
    //           color: MyTheme.primaryColor,
    //         ));
    //       } else {
    //         return TabContainer(sourcesList: viewModel.sourcesList!);
    //       }
    //     },
    //   ),
    // );
  }
}
