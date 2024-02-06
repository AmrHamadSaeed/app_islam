import 'package:flutter/material.dart';
import 'package:islam100/home/quran/sura_details_screen.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class ItemHadethDetailsScreen extends StatelessWidget {
String content;
ItemHadethDetailsScreen({required this.content});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return  Text(
      '$content',
        textAlign: TextAlign.center,
        style:provider.isDarkMode()?
            Theme.of(context).textTheme.titleSmall?.copyWith(
              color: MyTheme.yellowColor
            )
            :
        Theme.of(context).textTheme.titleSmall,

    );
  }
}
