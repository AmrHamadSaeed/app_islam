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
          title: Container(
            width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),

              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: provider.isDarkMode()?
                  MyTheme.yellowColor
                      :
                  MyTheme.blackColor,
                  blurRadius: MediaQuery.of(context).size.height*0.01,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${args.name}',
                style:provider.isDarkMode()?
                Theme.of(context).textTheme.titleLarge?.copyWith(
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
                MyTheme.yellowColor
                    :
                MyTheme.blackColor,
                blurStyle: BlurStyle.outer,

                blurRadius: MediaQuery.of(context).size.width * 0.30,
              ),
            ],
          ),
          child: verses.isEmpty?
              Center(
                child: CircularProgressIndicator(
                  color:provider.isDarkMode()?
                  MyTheme.yellowColor
                      :
                  Colors.black,
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
              MyTheme.blackColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  // width: MediaQuery.of(context).size.width * 0.50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),

                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: provider.isDarkMode()?
                        MyTheme.whiteColor
                            :
                        MyTheme.whiteColor,
                        blurRadius: MediaQuery.of(context).size.height*0.01,
                      ),
                    ],
                  ),
                  child: Center(
                      child:
                      Text(' بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ'
                  ,style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                    )
                    ,
                    maxLines: 1,
                  )),
                ),
                Expanded(
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
              ],
            ),
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