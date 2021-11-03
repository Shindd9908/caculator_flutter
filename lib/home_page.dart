import 'package:caculator_flutter/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
      return Container(
        child: MaterialButton(
          onPressed: (){
            //TODO
          },
          child: Text(btntxt,
            style: TextStyle(
              fontSize: 30,
              color: txtcolor,
            ),
          ),
          shape: const CircleBorder(),
          color: btncolor,
          padding: const EdgeInsets.all(18),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStyles.appName,
            style: AppStyles.h1.copyWith(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Caculator display
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '0',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.red, fontSize: 100),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //buttons functions
                    calcbutton('AC', Colors.grey, Colors.black),
                    calcbutton('AC', Colors.grey, Colors.black),
                    calcbutton('AC', Colors.grey, Colors.black),
                    calcbutton('AC', Colors.grey, Colors.black),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
