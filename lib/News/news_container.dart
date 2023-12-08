import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Model/SourceResponse.dart';
import 'package:newsapp/News/cubit/news_container_view_model.dart';
import 'package:newsapp/News/cubit/states.dart';
import 'package:newsapp/News/news_item.dart';
import 'package:newsapp/dialogUtils.dart';
import 'package:newsapp/my-theme.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
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
                    viewModel.getNewsBySourceId(widget.source.id ?? "");
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
          // DialogUtils.showMessage(context,'News Successful');
        }
      },
    );
    //   ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<NewsContainerViewModel>(
    //     builder: (context,viewModel,child){
    //       if(viewModel.errorMessage!= null){
    //         return Column(
    //           children: [
    //             Text(viewModel.errorMessage!),
    //             ElevatedButton(onPressed: (){
    //               viewModel.getNewsBySourceId(widget.source.id??"");
    //             }, child: Text('Try Again'))
    //           ],
    //         );
    //       }else if(viewModel.newsList == null){
    //         return Center(
    //           child: CircularProgressIndicator(color: MyTheme.primaryColor,),
    //         );
    //       }else{
    //         return ListView.builder(itemBuilder: (context,index){
    //           return NewsItem(news: viewModel.newsList![index]);
    //         },
    //         itemCount: viewModel.newsList?.length?? 0,
    //         );
    //       }
    //     },
    //   ),
    // );
    // FutureBuilder<NewsResponse?>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id??""),
    //     builder: (context,snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: MyTheme.primaryColor,
    //           ),
    //         );
    //       }else if(snapshot.hasError){
    //         return Column(
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //           ],
    //         );
    //       } if(snapshot.data?.status != 'ok'){
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message??""),
    //             ElevatedButton(onPressed: (){}, child: Text('Try again'))
    //           ],
    //         );
    //       }
    //       var newsList = snapshot.data?.articles ??[];
    //       return ListView.builder(itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //       },
    //         itemCount: newsList.length,
    //       );
    //     }
    // );
  }
}
