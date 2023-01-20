import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import 'Cupit/NewsAppCupit.dart';
import 'Cupit/NewsAppState.dart';

class sports extends StatelessWidget {
  const sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list=NewsAppCubit.get(context).sport;
    return BlocConsumer<NewsAppCubit,NewsAppState>(
      listener:(context,state){} ,
      builder: (context,state){
        return ConditionalBuilder(
            condition: state is !NewsAppsportLoding,
            builder:(context)=>ListView.separated(
              itemBuilder: (context,index)=>bulidArticalItem(list[index],context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: list.length,
              physics: const BouncingScrollPhysics(),
            ) ,
            fallback:(context)=> const Center(
              child: CircularProgressIndicator(
               // color: Colors.deepOrange,
              ),
            )
        );
      },
    );
  }
}
