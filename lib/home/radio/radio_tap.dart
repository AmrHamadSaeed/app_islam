import 'package:flutter/material.dart';

class RadioTap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.10,
              ),
              Image.asset('assets/images/playe.png'),
            ],
      ),
    );
  }
}
