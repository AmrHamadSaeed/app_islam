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
     margin: EdgeInsetsDirectional.only(
       top: MediaQuery.of(context).size.height*0.06
     ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),

              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:provider.isDarkMode()?
                  MyTheme.whiteColor
                      :
                  Colors.black,
                  spreadRadius: 5,
                  blurRadius: 15,
                ),
              ],
              color: provider.isDarkMode()?
              MyTheme.primaryDarkColorBottom
                  :
              MyTheme.primaryLightColorBottom,
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.language,
                style: provider.isDarkMode() ? Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: provider.isDarkMode()
                    ? <BoxShadow>[
                        BoxShadow(color: MyTheme.yellowColor, blurRadius: 20),
                      ]
                    : <BoxShadow>[
                        BoxShadow(color: Colors.black, blurRadius: 20),
                      ],
             ),
            child: GestureDetector(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? MyTheme.primaryDarkColorBottom
                        : MyTheme.primaryLightColorBottom,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: provider.isDarkMode() ?
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyTheme.yellowColor,
                        fontWeight: FontWeight.bold
                      )
                          : Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height*0.12
            ),
            width: MediaQuery.of(context).size.width * 0.40,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),

              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: provider.isDarkMode()?
                  MyTheme.whiteColor
                      :
                  Colors.black,
                  spreadRadius: 5,
                  blurRadius: 15,
                ),
              ],
              color: provider.isDarkMode()?
              MyTheme.primaryDarkColorBottom
                  :
              MyTheme.primaryLightColorBottom,
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.theme,
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              boxShadow: provider.isDarkMode()
                  ? <BoxShadow>[
                BoxShadow(color: MyTheme.yellowColor, blurRadius: 20),
              ]
                  : <BoxShadow>[
                BoxShadow(color: Colors.black, blurRadius: 20),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? MyTheme.primaryDarkColorBottom
                        : MyTheme.primaryLightColorBottom,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: provider.isDarkMode()
                          ? Theme.of(context)
                              .textTheme
                              .titleSmall
                          ?.copyWith(
                          color: MyTheme.yellowColor,
                          fontWeight: FontWeight.bold
                      )
                          : Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.blackColor,
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
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        context: context,
        builder: (context) => ThemeBottomSheet());
  }
}
