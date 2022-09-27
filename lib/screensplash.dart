
import 'package:flutter/material.dart';
import 'screencaptcha.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({ Key? key }) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    screensp();
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:Image.network('https://st.depositphotos.com/1875497/3781/i/950/depositphotos_37810929-stock-photo-books-on-white.jpg'))
        
      
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<void> screensp() async{
    await Future.delayed(Duration(seconds:5));
    Navigator.of(context).push(
    MaterialPageRoute(builder: (ctx) => ScreenCaptcha(),)
    );
  }
}