
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/NewsApp/search_screen.dart';

import '../../core/cubit/cubit.dart';
import '../components/components.dart';
import 'Cupit/NewsAppCupit.dart';
import 'Cupit/NewsAppState.dart';

class NewsApp extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppState>(
      listener: (context,state){},
      builder: (context,state){
        NewsAppCubit cubit=NewsAppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title:const  Text(
              "NEWS_APP",
              style:
              TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    NavigatorTo(context, const searchScreen());
                  },
                  icon: const Icon(Icons.search,)
              ),
              IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined,)
              ),
            ],
          ),
          body: cubit.Screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value){
              cubit.ChangeScreen(val: value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business"),
              BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
              BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
            ],
            iconSize: 30.0,
            currentIndex: cubit.index,
          ),

        );
      },
    );

  }
}


