import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam100/home/hadeth/item_hadeth_name.dart';
import 'package:islam100/my_theme.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethList.isEmpty){
      loadFile();
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_image.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          'Hadeth Name',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        ahadethList.isEmpty?
            Center(child: CircularProgressIndicator(
              color: MyTheme.primaryLightColorBottom,
            ),)
            :

        Expanded(
          child: ListView.separated(
            separatorBuilder: (context , index){
              return  Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              );
            },
            itemBuilder: (context , index) {
              return ItemHadethName(hadeth: ahadethList[index],);
            },
            itemCount: ahadethList.length,
          ),
        ),
      ],
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