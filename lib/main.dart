import 'dart:io';
import 'core/cubit/bloc_observer.dart';
import 'core/cubit/cubit.dart';
import 'core/cubit/states.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/NewsApp/Cupit/NewsAppCupit.dart';
import 'features/NewsApp/Cupit/NewsAppState.dart';
import 'features/NewsApp/NewsApp.dart';
import 'features/styels/styels.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark =CacheHelper.getData(
      key: 'isDark'
  );


  HttpOverrides.global =  MyHttpOverrides();
  runApp(MemoApp(
    isDark: isDark,
  ));



}
class MemoApp extends StatelessWidget{
  final bool? isDark;
  MemoApp({
    this.isDark,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NewsAppCubit(NewsAppInitialState())..getBusiness()..getsciences()..getsports()),
          BlocProvider(create: (context)=>AppCubit(CubitInitialAppState())..changeAppMode(isTrue: isDark),),
        ],
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightmode,
              darkTheme:darkmode ,
              themeMode:(AppCubit.get(context).isDark)?ThemeMode.light:ThemeMode.dark,
              home:  NewsApp(),
            );
          },
        )
    );

  }
}
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
