import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam100/home/quran/item_sura_details.dart';
import 'package:islam100/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty){
      loadFile(args.index);
    }

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
            '${args.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: verses.isEmpty?
            Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryLightColorBottom,
              ),
            )
            :
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.06,
            horizontal: MediaQuery.of(context).size.width*0.07,
          ),
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
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