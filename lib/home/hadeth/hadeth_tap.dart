import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam100/home/hadeth/item_hadeth_name.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(ahadethList.isEmpty){
      loadFile();
    }

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:provider.isDarkMode()?
            MyTheme.whiteColor
                :
            Colors.black,
            blurStyle: BlurStyle.outer,
            spreadRadius: 4,
            blurRadius: MediaQuery.of(context).size.height * 0.20,
          ),
        ],
      ),
      child: Column(
        children: [
          Center(
              child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color:provider.isDarkMode()?
                        MyTheme.yellowColor
                            :
                        MyTheme.primaryLightColorBottom,
                        blurStyle: BlurStyle.inner,

                        blurRadius: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/hadeth_image.png'))),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:provider.isDarkMode()?
                  MyTheme.yellowColor
                      :
                  MyTheme.primaryLightColorBottom,
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 3,
                  blurRadius: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
            child: Text(
              AppLocalizations.of(context)!.hadeth_name,
              style: provider.isDarkMode()?
              Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyTheme.primaryDarkColorBottom,
                  fontWeight: FontWeight.bold
              )
                  :
              Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ahadethList.isEmpty?
              Center(child: CircularProgressIndicator(
                color:provider.isDarkMode()?
                MyTheme.yellowColor
                    :
                Theme.of(context).primaryColor,
              ),)
              :

          Expanded(
            child: Container(
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
                    spreadRadius: 5,
                    blurRadius: MediaQuery.of(context).size.height * 0.10,
                  ),
                ],
              ),
              child: ListView.builder(
                itemBuilder: (context , index) {
                  return ItemHadethName(hadeth: ahadethList[index],);
                },
                itemCount: ahadethList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadFile() async{
   String hadethContent = await rootBundle.loadString('assets/files/ahadeth.txt');
   List<String> hadethList =hadethContent.split('#\r\n');
   for (int i = 0 ; i<hadethList.length ; i++){
     List<String> hadethLines =hadethList[i].split('\n');
     String title = hadethLines[0];
     hadethLines.removeAt(0);
     Hadeth hadeth = Hadeth(content: hadethLines, title: title);
     ahadethList.add(hadeth);
     setState(() {

     });
   }
  }
}
class Hadeth{
  String title;
  List<String> content;
  Hadeth({required this.content , required this.title});
}