
import 'package:flutter/material.dart';
import 'package:islam100/home/hadeth/hadeth_tap.dart';
import 'package:islam100/home/quran/quran_tap.dart';
import 'package:islam100/home/radio/radio_tap.dart';
import 'package:islam100/Settings/settings_tap.dart';
import 'package:islam100/home/sebha/sebha_tap.dart';
import 'package:islam100/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyTheme.primaryLightColorBottom
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index){
                  selectedIndex = index;
                  setState(() {

                  });
                },
                items: [
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/quran.png')),
                  label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/hadeth.png')),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/sebha.png')),
                      label: 'Sebha'),
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/radio.png')),
                      label: 'Radio',),
                  BottomNavigationBarItem(icon:Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings,),

                ],
              ),
            ),
          ),
          body: taps[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> taps = [
    QuranTap(), HadethTap(),SebhaTap(), RadioTap(),SettingsTap(),
  ];
}
