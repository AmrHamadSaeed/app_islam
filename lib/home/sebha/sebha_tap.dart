import 'package:flutter/material.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double turns = 0.0;
  int counter = 0;
  int index = 0;
  List<String> name2 = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر ',
    'أستغفر الله',
    'لا اله ألا الله',
  ];

  // String addText(int index) {
  //   return name2[index];
  // }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return  Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height*0.12,
                  horizontal: MediaQuery.of(context).size.width*0.20,
                ),
                child: GestureDetector(
                    onTap: () {
                     logicCounterIndex();
                    },
                    child: Transform.rotate(
                      angle: turns,
                        child:provider.isDarkMode()?
                        Image.asset(
                          'assets/images/dark_body_of_seb7a.png',
                        )
                            :
                        Image.asset(
                          'assets/images/body_sebha_logo.png',
                        ))),
              ),
              provider.isDarkMode()?
              Image.asset('assets/images/dark_head_of_seb7a.png',)
                  :
              Image.asset('assets/images/head_sebha_logo.png',),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'عدد التسبيحات',
              style:provider.isDarkMode()?
              Theme.of(context).textTheme.titleMedium?.copyWith(
                color: MyTheme.whiteColor
              )
                  :
              Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.07,
             width:  MediaQuery.of(context).size.width*0.10,
              decoration: BoxDecoration(
                color:provider.isDarkMode()?
                MyTheme.primaryDarkColorBottom
                    :
                MyTheme.primaryLightColorBottom,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Center(
                child: Text(
                  '$counter',
                  style:provider.isDarkMode()?
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.whiteColor
                  )
                      :
                  Theme.of(context).textTheme.titleMedium,
                ),

              ),
            ),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: provider.isDarkMode()?
                    MyTheme.yellowColor
                        :
                    MyTheme.primaryLightColorBottom,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(onPressed: (){
                    index = 0;
                    counter =0;
                    setState(() {

                    });
                  },
                    icon: Icon(
                      Icons.replay,
                    ),),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width:  MediaQuery.of(context).size.width*0.50,
                  decoration: BoxDecoration(
                    color: provider.isDarkMode()?
                    MyTheme.yellowColor
                        :
                    MyTheme.primaryLightColorBottom,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Center(
                    child: Text(
                      name2[index],
                      style: provider.isDarkMode()?
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyTheme.blackColor
                      )
                          :
                      Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  void logicCounterIndex(){
    if (counter < 33) {
      counter++;
      turns += 0.15;
    } else if (index == name2.length-1) {
      turns = 0;
      counter = 0;
      index = 0;
      index++;
    } else {
      counter = 0;
      if (counter == 0) {
        index++;
      }
    }
    setState(() {

    });
  }
}

