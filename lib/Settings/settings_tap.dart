import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam100/Settings/language_bottom_sheet.dart';
import 'package:islam100/Settings/theme_bottom_sheet.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';
class SettingsTap extends StatefulWidget {

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsetsDirectional.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style:provider.isDarkMode()?
          Theme.of(context).textTheme.titleLarge?.copyWith(
            color: MyTheme.whiteColor
          )
              :
          Theme.of(context).textTheme.titleLarge,),

          SizedBox(
            height: 10,),
          Container(
            color: Colors.black,
            child: GestureDetector(
              onTap: ()
              {
                showLanguageBottomSheet();
              },
              child: Container(

                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color:provider.isDarkMode()?
                  MyTheme.primaryDarkColorBottom
                      :
                  MyTheme.primaryLightColorBottom,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appLanguage == 'en'?
                      AppLocalizations.of(context)!.english :
                      AppLocalizations.of(context)!.arabic ,
                    style:provider.isDarkMode()?
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: MyTheme.yellowColor
                    )
                        :
                    Theme.of(context).textTheme.titleSmall,),
                    Icon(Icons.arrow_drop_down,size: 35,
                        color:provider.isDarkMode()?
                        MyTheme.yellowColor
                            :
                        MyTheme.blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,),
          Text(AppLocalizations.of(context)!.theme,
            style:provider.isDarkMode()?
            Theme.of(context).textTheme.titleLarge?.copyWith(
              color: MyTheme.whiteColor
            )
                :
            Theme.of(context).textTheme.titleLarge,),
          SizedBox(
            height: 10,),
          Container(
            color: Colors.black,
            child: GestureDetector(
              onTap: ()
              {
                showThemeBottomSheet();
              },
              child: Container(

                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    color:provider.isDarkMode()?
                    MyTheme.primaryDarkColorBottom
                        :
                    MyTheme.primaryLightColorBottom,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.isDarkMode()?
                    AppLocalizations.of(context)!.dark :
                    AppLocalizations.of(context)!.light ,
                      style:provider.isDarkMode()?
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: MyTheme.yellowColor
                      )
                          :
                      Theme.of(context).textTheme.titleSmall,),
                    Icon(Icons.arrow_drop_down,size: 35,
                      color:provider.isDarkMode()?
                      MyTheme.yellowColor
                          :
                      MyTheme.blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context)=> ThemeBottomSheet());
  }
}
