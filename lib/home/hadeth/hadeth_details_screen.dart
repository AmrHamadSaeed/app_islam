import 'package:flutter/material.dart';
import 'package:islam100/home/hadeth/hadeth_tap.dart';
import 'package:islam100/home/hadeth/item_hadeth_details.dart';
import 'package:islam100/my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        'assets/images/background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.title}',
            style: Theme
                .of(context)
                .textTheme
                .titleLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery
                .of(context)
                .size
                .height * 0.06,
            horizontal: MediaQuery
                .of(context)
                .size
                .width * 0.07,
          ),
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(25),
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
