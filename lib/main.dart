

import 'package:flutter/material.dart';
import 'package:islam100/home/hadeth/hadeth_details_screen.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'home/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) =>AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context)=> HomeScreen(),
        SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName : (context) => HadethDetailsScreen(),

      },
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
    );
  }
}
