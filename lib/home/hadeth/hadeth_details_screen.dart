import 'package:flutter/material.dart';
import 'package:islam100/home/hadeth/hadeth_tap.dart';
import 'package:islam100/home/hadeth/item_hadeth_details.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      provider.isDarkMode()?
      Image.asset(
        'assets/images/back_ground_night.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )
          :
      Image.asset(
        'assets/images/background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),

              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:  provider.isDarkMode()?
                  MyTheme.whiteColor
                      :
                  MyTheme.blackColor,
                  blurRadius: MediaQuery.of(context).size.height*0.01,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${args.title}',
                style:provider.isDarkMode()?
                Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyTheme.primaryDarkColorBottom
                )
                    :
                Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: MyTheme.whiteColor
                )
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: provider.isDarkMode()?
                MyTheme.whiteColor
                    :
                MyTheme.blackColor,
                blurStyle: BlurStyle.outer,

                blurRadius: MediaQuery.of(context).size.width * 0.30,
              ),
            ],
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetailsScreen(content: args.content[index]
              );
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
