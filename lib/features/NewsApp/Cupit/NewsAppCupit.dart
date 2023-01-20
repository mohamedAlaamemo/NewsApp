
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/network/remote/dio_helper.dart';
import '../business.dart';
import '../science.dart';
import '../sitings.dart';
import '../sports.dart';
import 'NewsAppState.dart';

class NewsAppCubit extends Cubit<NewsAppState>{
  NewsAppCubit(super.NewsAppInitialState);
  static NewsAppCubit get(context)=>BlocProvider.of(context);
  int index=1;
  List<Widget> Screens = [
    business(),
    sports(),
    science(),
    sitings(),
  ];
  void ChangeScreen({required int val}){
    index=val;
    emit(NewsAppChangeScreen());
  }
  List<dynamic>Business=[];
  void getBusiness(){
    emit(NewsAppBussinessLoding());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'c8f13c7e98fb4c38b16ac0dbcccc5c4f'
      },
    ).then((value){
      int x=value.data['articles'].length;
      for(int i=0;i<x;i++)
      {
        if(value.data['articles'][i]['urlToImage']!=null)
          Business.add(value.data['articles'][i]);
      }
      emit(NewsAppBussinessSucsess());
    }).catchError((error){
      print(error);
      emit(NewsAppBussinessError());
    });
  }

  List<dynamic>sport=[];
  void getsports(){
    emit(NewsAppsportLoding());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'c8f13c7e98fb4c38b16ac0dbcccc5c4f'
      },
    ).then((value){
      int x=value.data['articles'].length;
      for(int i=0;i<x;i++)
      {
        if(value.data['articles'][i]['urlToImage']!=null)
          sport.add(value.data['articles'][i]);
      }
      emit(NewsAppsportSucsess());
    }).catchError((error){
      print(error);
      emit(NewsAppsportError());
    });
  }

  List<dynamic>sciences=[];
  void getsciences(){
    emit(NewsAppsciencesLoding());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'c8f13c7e98fb4c38b16ac0dbcccc5c4f'
      },
    ).then((value){
      int x=value.data['articles'].length;
      for(int i=0;i<x;i++)
      {
        if(value.data['articles'][i]['urlToImage']!=null)
          sciences.add(value.data['articles'][i]);
      }
      emit(NewsAppsciencesSucsess());
    }).catchError((error){
      print(error);
      emit(NewsAppsciencesError());
    });
  }

  List<dynamic>search=[];
  void getSearch(String value){
    //1e784110c635f9848a40aedc77325afe
    emit(NewsAppSearchLoding());
    DioHelper.getData(
      url: '/v2/everything',
      query: {
        'q':value,
        'apikey':'3da618c7fc784228a5b842f95fa06a2c'
      },

    ).then((value) {
      search=value.data['articles'];
      emit(NewsAppSearchSucsess());

    }).catchError((error){
      print(error);
      print('gggggggggggggggggggg');
      emit(NewsAppSearchError());
    });
  }

}