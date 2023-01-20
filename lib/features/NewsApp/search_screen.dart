import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import 'Cupit/NewsAppCupit.dart';
import 'Cupit/NewsAppState.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textSearch=TextEditingController();
    var list=[];
    return BlocConsumer<NewsAppCubit,NewsAppState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  controller: textSearch,
                  validate: (value){},
                  lable: 'Search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                  onChange: (value){
                    print(value);
                    NewsAppCubit.get(context).getSearch(value);
                    list=NewsAppCubit.get(context).search;
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index)=>bulidArticalItem(list[index],context),
                    separatorBuilder:(context,index)=> myDivider(),
                    itemCount: list.length
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
