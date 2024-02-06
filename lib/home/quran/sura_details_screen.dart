import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam100/home/quran/item_sura_details.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty){
      loadFile(args.index);
    }

    return Stack(
        children: [
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
          title: Text(
            '${args.name}',
            style:provider.isDarkMode()?
            Theme.of(context).textTheme.titleLarge?.copyWith(
              color: MyTheme.whiteColor
            )
                :
            Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: verses.isEmpty?
            Center(
              child: CircularProgressIndicator(
                color:provider.isDarkMode()?
                MyTheme.primaryDarkColorBottom
                    :
                MyTheme.primaryLightColorBottom,
              ),
            )
            :
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.06,
            horizontal: MediaQuery.of(context).size.width*0.07,
          ),
          decoration: BoxDecoration(

            color:provider.isDarkMode()?
            MyTheme.primaryDarkColorBottom
                :
            MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.builder(
              itemBuilder:(context , index) {
                return ItemSuraDetailsScreen(
                  name: verses[index],
                  index: index,
                );
              },
            itemCount: verses.length,
          ),
        ),
      ),
    ]);
  }

  void loadFile(int index)async{
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {

    });
  }
}
class SuraDetailsArgs{
  String name ;
  int index;
  SuraDetailsArgs({required this.name , required this.index});
}