import 'package:flutter/material.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return   Container(
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
                        MyTheme.blackColor,
                        blurStyle: BlurStyle.inner,

                        blurRadius: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/imag_radio.png',alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*.70,
                    height: MediaQuery.of(context).size.height*0.40,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: provider.isDarkMode()?
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
                  'إذاعة القرآن الكريم',
                  style: provider.isDarkMode()?
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.primaryDarkColorBottom
                  )
                      :
                  Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.10,
              ),
              provider.isDarkMode()?
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: MyTheme.yellowColor,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 5,
                        blurRadius: MediaQuery.of(context).size.height * 0.10,
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/playe_yellow.png',))
                  :
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width*0.06,
                ),
                  decoration: BoxDecoration(
                    color: MyTheme.primaryLightColorBottom,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0,
                        blurRadius: MediaQuery.of(context).size.height * 0.10,
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/playe.png',color: Colors.black,)),
            ],
      ),
    );
  }
}
