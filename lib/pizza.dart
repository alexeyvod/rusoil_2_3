import 'package:flutter/material.dart';

class pizza extends StatefulWidget {
  const pizza({Key? key}) : super(key: key);

  @override
  State<pizza> createState() => _pizza();
}

enum SousesTypes{ostro, kislo, cheese}

class _pizza extends State<pizza>{

  //List<bool> isTesto = [true, false];
  bool isThinkTesto = true;
  double size = 20;
  SousesTypes? souse = SousesTypes.ostro;
  bool addChesse = false;
  double price = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal:12),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 232,
                    height: 123,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage('assets/pizza 1.png'),
                          ),
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: 33),
              Text("Калькулятор пиццы",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)
              ),
              SizedBox(height: 10),
              Text("Выберите параметры:",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)
              ),
              SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 154,
                    height: 32,
                    child: OutlinedButton(
                      onPressed: (){
                        isThinkTesto = !isThinkTesto;
                        calculate();
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: !isThinkTesto ? Color(0xFF0079D0) : Color(0xFFECEFF1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36)
                          )
                      ),
                      child: Text("Обычное тесто", style: TextStyle(color: isThinkTesto ? Colors.black45 : Colors.white)),
                    ),
                  ),
                  SizedBox(width: 12,),
                  SizedBox(
                    width: 154,
                    height: 32,
                    child: OutlinedButton(
                      onPressed: (){
                        isThinkTesto = !isThinkTesto;
                        calculate();
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: isThinkTesto ? Color(0xFF0079D0) : Color(0xFFECEFF1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36)
                          )
                      ),
                      child: Text("Тонкое тесто", style: TextStyle(color: !isThinkTesto ? Colors.black45 : Colors.white)),
                    ),
                  )
                ],
              ),

              /*
              ToggleButtons(
                borderColor: Color(0xFFECEFF1),
                selectedBorderColor: Color(0xFF0079D0),
                borderWidth: 1,
                borderRadius: BorderRadius.circular(36),
                children: <Widget>[
                  Text("Обычное тесто",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.indigo,
                          fontSize: 14)
                  ),
                  Text("Тонкое тесто",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.indigo,
                          fontSize: 14)
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < isTesto.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isTesto[buttonIndex] = !isTesto[buttonIndex];
                      } else {
                        isTesto[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isTesto,
              ),
              */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Text("Размер: ${size.round()}x${size.round()*2}",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18)
                  ),
                  SizedBox(height: 0,),
                  Slider(
                    value: size,
                    onChanged: (value) {
                      setState(() {
                        size = value;
                        calculate();
                      });
                    },
                    min: 20,
                    max: 80,
                    divisions: 3,
                    label: size.round().toString(),
                  ),
                  SizedBox(height: 10,),
                  Text("Соус:",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18)
                  ),
                  RadioListTile<SousesTypes>(
                    title: const Text('Острый'),
                    value: SousesTypes.ostro,
                    groupValue: souse,
                    activeColor: Colors.green,
                    visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (SousesTypes? value) { souse = value; calculate(); },
                  ),
                  Divider(height: 0, color: Colors.black45),
                  RadioListTile<SousesTypes>(
                    title: const Text('Кислый'),
                    value: SousesTypes.kislo,
                    groupValue: souse,
                    activeColor: Colors.green,
                    visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (SousesTypes? value) { souse = value; calculate(); },
                  ),
                  Divider(height: 0, color: Colors.black45),
                  RadioListTile<SousesTypes>(
                    title: const Text('Сырный'),
                    value: SousesTypes.cheese,
                    groupValue: souse,
                    activeColor: Colors.green,
                    visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (SousesTypes? value) { souse = value; calculate(); },
                  ),
                  Divider(height: 0, color: Colors.black45),

                  SizedBox(height: 20,),
                  SwitchListTile(
                    title: const Text('Дополнительный сыр'),
                    value: addChesse,
                    tileColor: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                    onChanged: (bool value) { addChesse = value; calculate(); },
                    secondary: Image.asset(
                      'assets/cheese.png',
                      width: 36,
                      height: 34,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Стоимость: ${price.round()}",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18)
                  ),
                ],
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
                  child: Text("Заказать",
                    style: TextStyle(fontSize: 16)
                  ),
                ),
              ),
              SizedBox(height: 30,)

            ],
          ),
        ),
      )
    );
  }


  void calculate(){
    price = 100;
    if(isThinkTesto) price += 70;
    price += size * 3;
    switch(souse){
      case SousesTypes.ostro:
        price += 30;
        break;
      case SousesTypes.kislo:
        price += 40;
        break;
      case SousesTypes.cheese:
        price += 50;
        break;
    }
    if(addChesse) price += 110;
    setState(() {

    });
  }

}