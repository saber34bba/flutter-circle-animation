import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutte'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;


@override
void initState()
{
  _animationController = AnimationController( vsync: this, duration: Duration(seconds: 1), );
super.initState();
}
double left=0;
double right=0;
double top=0;
bool taped=false;

  @override
  Widget build(BuildContext context) {
     _animationController.repeat();

 _animationController.forward();
    return Container(child: SafeArea(

      child: Scaffold(
       

body:Stack(children: [

  Container(
  alignment: Alignment.center,
child: Text("hello"),

            
  
),
CustomPaint(painter: AnimatedCustomPainter(
            _animationController.view,MediaQuery.of(context).size.height,MediaQuery.of(context).size.width
          ),),

],)
      ),
    ),);
  }
}  
class Ball extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = new Paint()
      ..color =  Colors.green
      ..strokeWidth = 3;

    canvas.drawCircle(Offset(80, size.height-40 ), 30, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class AnimatedCustomPainter extends CustomPainter {
  final _paint = Paint();
  final Animation<double> _size;
  final Animation<double> _offset;
  final Animation<Color> _color;
Size height;
  AnimatedCustomPainter(Animation<double> animation,height,width)
      : _size = Tween<double>(begin: 80, end: 300).animate(animation),
        _offset = Tween<double>(begin: height, end: height-100).animate(animation),
        _color =
            ColorTween(begin: Colors.white, end: Colors.blue).animate(animation),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = _color.value;
    canvas.drawCircle(
      Offset(
       0, //size.width / 2,
        size.height  + _offset.value,
      ),
      _size.value,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}