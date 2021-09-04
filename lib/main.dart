import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('تطابق الصور'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  //لعمل تفاعل في البرنامج
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1; //هذا المتغير يظهر في اول مره يعمل بها البرنامج
  int rightImageNumber = 1;
  void changeImage() {
    leftImageNumber = Random().nextInt(8) + 1; //لاختصار الكود ومنع التكرار
    //Random().nextInt(8)+1لتوليد رقم عشوئي من الصفر الي تسعه
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Text(
            leftImageNumber ==
                    rightImageNumber //جمله شرطيه لتغير النص عند التساوي
                ? 'مبروووك نجحت'
                : 'حاول مره اخري',
            style: TextStyle(
              fontSize: 42.0,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              //لجعل اصوره لاتخرج عن حواف البرنامج
              //  flex: 1,   لوضع نسب بين الصور
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeImage();
                  });
                },
                child: Image.asset('images/image-$leftImageNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeImage();
                  });
                },
                child: Image.asset('images/image-$rightImageNumber.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
