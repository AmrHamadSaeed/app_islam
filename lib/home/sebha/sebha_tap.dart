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
    return  Container(
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
          Container(
            margin: EdgeInsetsDirectional.only(
          bottom: 10,
          ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:provider.isDarkMode()?
                  MyTheme.whiteColor
                      :
                  MyTheme.primaryLightColorBottom,
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 3,
                  blurRadius: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
            child: Text(
              'عدد التسبيحات',
              style:provider.isDarkMode()?
              Theme.of(context).textTheme.titleMedium?.copyWith(
                color: MyTheme.primaryDarkColorBottom
              )
                  :
              Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.07,
           width:  MediaQuery.of(context).size.width*0.10,
            margin: EdgeInsets.only(
              bottom: 10
            ),
            decoration: BoxDecoration(
              color:provider.isDarkMode()?
              MyTheme.primaryDarkColorBottom
                  :
              MyTheme.primaryLightColorBottom,
              borderRadius: BorderRadius.all(Radius.circular(17)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: provider.isDarkMode()?
                  MyTheme.yellowColor
                      :
                  Colors.black,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 0,
                  blurRadius: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
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
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: provider.isDarkMode()?
                          MyTheme.whiteColor
                              :
                          Colors.black,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 5,
                          blurRadius: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.replay,
                    ),
                  ),),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.07,
                width:  MediaQuery.of(context).size.width*0.50,
                decoration: BoxDecoration(
                  color:provider.isDarkMode()?
                  MyTheme.yellowColor
                      :
                  MyTheme.primaryLightColorBottom,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: provider.isDarkMode()?
                      MyTheme.whiteColor
                          :
                      Colors.black,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 0,
                      blurRadius: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
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

