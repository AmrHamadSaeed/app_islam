import 'package:flutter/material.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return   Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/imag_radio.png',alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*.70,
                  height: MediaQuery.of(context).size.height*0.40,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Text(
                'إذاعة القرآن الكريم',
                style: provider.isDarkMode()?
                Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: MyTheme.whiteColor
                )
                    :
                Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.10,
              ),
              provider.isDarkMode()?
              Image.asset('assets/images/playe_yellow.png',)
                  :
              Image.asset('assets/images/playe.png'),
            ],
      ),
    );
  }
}
