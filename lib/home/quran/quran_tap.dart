import 'package:flutter/material.dart';
import 'package:islam100/home/quran/item_sura_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';
class QuranTap extends StatelessWidget {
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
                        blurStyle: BlurStyle.outer,

                        blurRadius: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/quran_image.png'))),

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
              AppLocalizations.of(context)!.sura_name,
              style:provider.isDarkMode()?
             Theme.of(context).textTheme.titleMedium?.copyWith(
               color: MyTheme.primaryDarkColorBottom,
               fontWeight: FontWeight.bold,
             )
                  :
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              )
            ),
          ),

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
                  itemBuilder: (context , index) => ItemSuraName(name: suraName[index] , index: index),
                itemCount: suraName.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
