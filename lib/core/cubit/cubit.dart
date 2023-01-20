
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cubit/states.dart';

import '../network/local/cache_helper.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit(super.CubitInitialAppState);

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark=false;

  void changeAppMode({
    bool? isTrue
  }){
    if(isTrue!=null)
    {
      isDark=isTrue;
    }
    else
      isDark=!isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      emit(NewsAppChangeMode());
    });

  }

}