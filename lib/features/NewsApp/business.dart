

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import 'Cupit/NewsAppCupit.dart';
import 'Cupit/NewsAppState.dart';

class business extends StatelessWidget {
  const business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list=NewsAppCubit.get(context).Business;
    return BlocConsumer<NewsAppCubit,NewsAppState>(
      listener:(context,state){} ,
      builder: (context,state){
        return ConditionalBuilder(
            condition: state is !NewsAppBusinessLoding,
            builder:(context)=>ListView.separated(
              itemBuilder: (context,index)=>bulidArticalItem(list[index],context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: list.length,
              physics: BouncingScrollPhysics(),
            ) ,
            fallback:(context)=> Center(
              child: CircularProgressIndicator(
                //color: Colors.deepOrange,
              ),
            )
        );
      },
    );
  }
}

