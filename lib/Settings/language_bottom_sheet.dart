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
      margin: EdgeInsetsDirectional.all(15),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style:Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.blue,fontWeight: FontWeight.bold,
          ) ,
        ),
        Icon(Icons.check,size: 30,color: MyTheme.primaryLightColorBottom,),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,
      style:Theme.of(context).textTheme.titleSmall ,
    );
  }
}
