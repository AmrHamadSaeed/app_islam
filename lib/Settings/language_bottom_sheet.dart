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
        height: MediaQuery.of(context).size.width*0.40,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
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
    return Row(
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
        Icon(Icons.check,size: 30,
          color: provider.isDarkMode()?
          MyTheme.yellowColor
              :
        MyTheme.blackColor,
        ),
      ],
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
