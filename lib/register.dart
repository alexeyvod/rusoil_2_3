import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {

    const BorderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: Color(0xFFECEFF1), width: 2)
    );

    return
      Scaffold(
        appBar: AppBar(
          title: const Text('Регистрация'),
        ),
        body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.supervised_user_circle_outlined, size: 18, color: Color(0xff5C5C5C)),
                  SizedBox(width: 10,),
                  Text("Регистрация", style: new TextStyle(fontSize: 20.0, color: Color(0xff5C5C5C), fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 22,),
              Text("Чтобы зарегистрироваться введите свой номер телефона и почту",
                style: new TextStyle(fontSize: 16.0, color: Color(0xffC4C4C4), fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14,),
              Text("Телефон",
                style: new TextStyle(fontSize: 16.0, color: Color(0xff000000), fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14,),
              SizedBox(
                height: 34,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    prefixIcon: Padding(padding: EdgeInsets.only(top: 9, bottom: 9, left: 15, right: 0), child: Text('+7')),
                    filled: true,
                    fillColor: Color(0xFFECEFF1),
                    enabledBorder: BorderStyle,
                    focusedBorder: BorderStyle,
                  ),
                ),
              ),
              SizedBox(height: 22,),
              Text("Почта",
                style: new TextStyle(fontSize: 16.0, color: Color(0xff000000), fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14,),
              SizedBox(
                height: 34,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    filled: true,
                    fillColor: Color(0xFFECEFF1),
                    enabledBorder: BorderStyle,
                    focusedBorder: BorderStyle,
                  ),
                ),
              ),
              SizedBox(height: 22,),
              Text("Вам придет четырехзначный код, который будет вашим паролем",
                style: new TextStyle(fontSize: 16.0, color: Color(0xffC4C4C4), fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 22,),
              Text("Изменить пароль можно будет в личном кабинете после регистрации",
                style: new TextStyle(fontSize: 16.0, color: Color(0xffC4C4C4), fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36)
                      )
                  ),
                  child: Text("Отправить код"),
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
    ),
      );
  }
}
