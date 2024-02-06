import 'package:flutter/material.dart';
import 'package:islam100/home/hadeth/hadeth_details_screen.dart';
import 'package:islam100/home/quran/sura_details_screen.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

import 'hadeth_tap.dart';

class ItemHadethName extends StatelessWidget {
Hadeth hadeth;
ItemHadethName({required this.hadeth });
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
         arguments:hadeth
        );
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,

        style:provider.isDarkMode()?
        Theme.of(context).textTheme.titleSmall?.copyWith(
          color: MyTheme.yellowColor
        )
            :
        Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
