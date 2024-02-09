import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';
class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width*0.50,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:provider.isDarkMode()?
            MyTheme.whiteColor
                :
            Colors.black,
            spreadRadius: 0,
            blurRadius: 20,
          ),
        ],
        color: provider.isDarkMode()?
        MyTheme.primaryDarkColorBottom
            :
        MyTheme.primaryLightColorBottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child:provider.appLanguage == 'en'?
            getSelectedItemWidget(AppLocalizations.of(context)!.english)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
            ,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child:provider.appLanguage == 'ar'?
              getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
            :
              getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
            ,
          ),
        ],
      ),
    );
  }
  Widget getSelectedItemWidget(String text){
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:provider.isDarkMode()?
            MyTheme.yellowColor
                :
            Colors.black,
            blurStyle: BlurStyle.outer,
            spreadRadius: 5,
            blurRadius: MediaQuery.of(context).size.height*0.03,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
            style:provider.isDarkMode()?
            Theme.of(context).textTheme.titleSmall?.copyWith(
              color: MyTheme.yellowColor,fontWeight: FontWeight.bold,
            )
                :
            Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            ) ,
          ),
          Container(
            margin: EdgeInsets.only(
                left: 10,
              right: 10
            ),
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: provider.isDarkMode()?
                  MyTheme.yellowColor
                      :
                  MyTheme.blackColor,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 2,
                  blurRadius: MediaQuery.of(context).size.height*0.01,
                ),
              ],
            ),
            child: Icon(Icons.check,size: 30,
              color: provider.isDarkMode()?
              MyTheme.yellowColor
                  :
            MyTheme.blackColor,
            ),
          ),
        ],
      ),
    );
  }
  Widget getUnSelectedItemWidget(String text){
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(text,
      style:provider.isDarkMode()?
      Theme.of(context).textTheme.titleSmall?.copyWith(
        color: MyTheme.yellowColor
      )
          :
      Theme.of(context).textTheme.titleSmall ,
    );
  }
}
