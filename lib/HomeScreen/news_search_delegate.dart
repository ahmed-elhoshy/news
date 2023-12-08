import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Model/api_manager.dart';

import '../News/cubit/news_container_view_model.dart';
import '../News/cubit/states.dart';
import '../News/news_item.dart';
import '../dialogUtils.dart';
import '../my-theme.dart';

class NewsSearchDelegate extends SearchDelegate {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context), icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('Suggestions'));
    }
    return BlocConsumer<NewsContainerViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ),
          );
        } else if (state is NewsErrorState) {
          return Column(
            children: [
              Text(state.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(query);
                  },
                  child: Text('Try Again'))
            ],
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList![index]);
            },
            itemCount: state.newsList!.length,
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is NewsLoadingState) {
          DialogUtils.showLoading(context, 'Loading..');
        } else if (state is NewsSuccessState) {
          ApiManager.searchNews(query);
        }
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: MyTheme.primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          activeIndicatorBorder: BorderSide.none,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ));
  }
}
