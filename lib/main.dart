
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(A());
}

class A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: B(),
    );
  }
}

class B extends StatefulWidget{
  @override
  _BState createState() => _BState();
}

class _BState extends State<B> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    nextPage();
    super.initState();
  }

  void nextPage() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>C()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white70,body: Center(child: Column(
      children: [
        Image(image: AssetImage('images/i.jpg'),height: MediaQuery.of(context).size.height*0.5,),
        CircularProgressIndicator(strokeWidth: 1.0,backgroundColor: Colors.red,),
        Container(margin:EdgeInsets.all(MediaQuery.of(context).size.height*0.1),child: Text('Created by:',style: TextStyle(fontSize: MediaQuery.of(context).size.width/13),)),
        Text('Normurodov Nazar',style: TextStyle(fontSize: MediaQuery.of(context).size.width/10))
      ],
    )),);
  }
}

class C extends StatefulWidget {
  @override
  _CState createState() => _CState();
}

class _CState extends State<C> {
  String a = '1', b = '', oper = '';
  double x=1, y=1, r=0;
  Characters c;
  List<Widget> list=[Text('')];
  bool isLoading=false;
  int eh;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(x.isInfinite||x.isNaN) x=1;
    if(y.isInfinite||y.isNaN) y=1;
    if(r.isInfinite||r.isNaN) r=1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            color: Colors.black,
            child: Text(
              a + oper + b
              ,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.05),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height*0.4,
              color: Colors.green,
              child: ListView.builder(itemExtent:MediaQuery.of(context).size.height * 0.4/6,itemBuilder: (BuildContext c,int i){if(oper=='') return info(i);else{return oper=='/' ? listItems(i):listItemsOther(i);}},itemCount: 6,),
          ),
          Builder(
            builder:(ctx)=> Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              OtherButton(icon: Icon(Icons.backspace_outlined,size: MediaQuery.of(context).size.width * 0.1,),onPressed: (){setState(() {
                backButtonPressed(ctx);
              });},),
              OtherButton(icon: Icon(Icons.clear,size: MediaQuery.of(context).size.width * 0.1,),onPressed: (){setState(() {
                clearButtonPressed();
              });},),
            ],),
          ),
          Builder(
            builder:(ctx)=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  text: '1',
                  onPressed: () {
                    setState(() {
                      switch (oper) {
                        case '+':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          b += '1';
                          y = double.parse(b);
                          r = x + y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '-':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          b += '1';
                          y = double.parse(b);
                          r = x - y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '*':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          b += '1';
                          y = double.parse(b);
                          r = x * y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '/':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          b += '1';
                          y = double.parse(b);
                          r = x / y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '':
                          if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          a += '1';
                          x = double.parse(a);
                          break;
                      }
                    });
                  },
                ),
                NumberButton(
                  text: '2',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '2';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '2';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '2';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '2';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '2';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                NumberButton(
                  text: '3',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '3';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '3';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '3';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '3';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '3';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                BinaryOperatorButton(
                  text: '+',
                  onPressed: () {
                    setState(() {
                      oper = '+';
                    });
                  },
                ),
              ],
            ),
          ),
          Builder(
            builder:(ctx)=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  text: '4',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '4';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '4';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '4';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '4';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '4';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                NumberButton(
                  text: '5',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '5';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '5';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '5';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '5';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '5';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                NumberButton(
                  text: '6',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '6';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '6';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '6';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '6';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '6';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                BinaryOperatorButton(
                  text: '-',
                  onPressed: () {
                    setState(() {
                      oper = '-';
                    });
                  },
                ),
              ],
            ),
          ),
          Builder(
            builder:(ctx)=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  text: '7',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '7';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '7';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '7';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '7';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '7';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                NumberButton(
                  text: '8',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '8';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '8';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '8';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '8';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '8';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                NumberButton(
                  text: '9',
                  onPressed: () {setState(() {
                    switch (oper) {
                      case '+':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '9';
                        y = double.parse(b);
                        r = x + y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '-':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '9';
                        y = double.parse(b);
                        r = x - y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '*':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '9';
                        y = double.parse(b);
                        r = x * y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '/':
                        x=double.parse(a);
                        if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        b += '9';
                        y = double.parse(b);
                        r = x / y;
                        list.clear();
                        for(int i=0;i<6;++i)
                        {
                          list.add(listItems(i));
                        }
                        break;
                      case '':
                        if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Maksimal uzunlik 8 belgi'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                        a += '9';
                        x = double.parse(a);
                        break;
                    }
                  });},
                ),
                BinaryOperatorButton(
                  text: '*',
                  onPressed: () {
                    setState(() {
                      oper = '*';
                    });
                  },
                ),
              ],
            ),
          ),
          Builder(
            builder:(ctx)=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZeroButton(
                  onPressed: () {
                    setState(() {
                      switch (oper) {
                        case '+':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          setState(() {
                            b += '0';
                          });
                          y = double.parse(b);
                          r = x + y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '-':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          setState(() {
                            b += '0';
                          });
                          y = double.parse(b);
                          r = x - y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '*':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          setState(() {
                            b += '0';
                          });
                          y = double.parse(b);
                          r = x * y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '/':
                          x=double.parse(a);
                          if(b.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          setState(() {
                            b += '0';
                          });
                          y = double.parse(b);
                          if(y==0){
                            Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text('0 ga bo\'lish mumkin emas'),
                            )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));y=1;break;
                          }
                          r = x / y;
                          list.clear();
                          for(int i=0;i<6;++i)
                          {
                            list.add(listItems(i));
                          }
                          break;
                        case '':
                          if(a.length>=8){Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Maksimal uzunlik 8 belgi'),
                          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));break;}
                          setState(() {
                            a += '0';
                          });
                          x = double.parse(a);
                          break;
                      }
                    });
                  },
                ),
                NumberButton(
                  text: '.',
                  onPressed: () {
                    setState(() {
                      if(oper==''){
                        if(x.toInt()==x&&!a.contains('.')) a+='.';else
                        Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Xato'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));
                      }else{
                        if(y.toInt()==y&&!b.contains('.')) b+='.';else Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('Xato'),
                        )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));
                      }
                    });
                  },
                ),
                BinaryOperatorButton(
                  text: '/',
                  onPressed: () {
                    setState(() {
                      oper = '/';
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  k()async{
    eh=await ekub(x.toInt(), y.toInt());
  }

  Widget listItems(int i){
    k();
    switch(i)
    {
      case 0: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text(a+oper+b+'='+r.toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedDouble(r);
        });},),
      );break;
      case 1: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Butun Qismi='+(x~/y).toString(),style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedInt(x~/y);
        });},),
      );break;
      case 2: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Qoldiq qismi='+(x%y).toInt().toString(),style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedInt((x%y).toInt());
        });},),
      );break;
      case 3: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('EKUB('+((x.toInt()<=0) ? 1.toString():x.toInt().toString())+','+((y.toInt()<=0) ? 1.toString(): y.toInt().toString())+')='+eh.toString(),style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap:  (){setState(() {
          onPressedFutureInt(ekub(x.toInt(), y.toInt()));
        });}),
      );break;
      case 4: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('EKUK('+(x.toInt()<=0 ? 1.toString():x.toInt().toString())+','+(y.toInt()<=0? 1.toString():y.toInt().toString())+')='+ekuk(x.toInt(), y.toInt()).toString(),style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedFutureInt(ekuk(x.toInt(), y.toInt()));
        });},),
      );break;
      case 5: return Container(color: Colors.black,alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Kvadratlari Yig\'indisi='+(x*x+y*y).toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedDouble(x*x+y*y);
        });},),
      );break;
      default: return Text('');
    }
  }

  Widget listItemsOther(int i){
    k();
    switch(i)
    {
      case 0: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text(a+oper+b+'='+r.toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedDouble(r);
        });},),
      );break;
      case 1: return isLoading ? Text('calculating...',style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)) : Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('EKUB('+((x.toInt()<=0) ? 1.toString():x.toInt().toString())+','+((y.toInt()<=0) ? 1.toString(): y.toInt().toString())+')='+eh.toString(),style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap:  (){setState(() {
          onPressedFutureInt(ekub(x.toInt(), y.toInt()));
        });}),
      );break;
      case 2: return isLoading ? CircularProgressIndicator() : Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('EKUK('+(x.toInt()<=0 ? 1.toString():x.toInt().toString())+','+(y.toInt()<=0? 1.toString():y.toInt().toString())+')='+ekuk(x.toInt(), y.toInt()).toString(),style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedFutureInt(ekuk(x.toInt(), y.toInt()));
        });},),
      );break;
      case 3: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Kvadratlari Yig\'indisi='+(x*x+y*y).toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedDouble(x*x+y*y);
        });},),
      );break;
      case 4: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('O\'rta Arifmetigi='+((x+y)/2).toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedDouble((x+y)/2);
        });},),
      );break;
      case 5: return Container(color: Colors.black,alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('O\'rta Geometrigi='+sqrt(x*y).toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedDouble(sqrt(x*y));
        });},),
      );
      default: return Text('');
    }
  }

  Widget info(int i){
    switch(i)
    {
      case 0: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Kvadrati='+(x*x).toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedDouble(x*x);
        });},),
      );break;
      case 1: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Kubi='+(x*x*x).toString(),style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap:  (){setState(() {
          onPressedDouble(x*x*x);
        });}),
      );break;
      case 2: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Kvadrat Ildidzi='+sqrt(x).toString(),style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedDouble(sqrt(x));
        });},),
      );break;
      case 3: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('Kubik Ildizi='+pow(x, 1/3).toString(),style: TextStyle(color: Colors.red,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25),),onTap: (){setState(() {
          onPressedDouble(pow(x,1/3));
        });},),
      );break;
      case 4: return Container(color: Colors.black,margin: EdgeInsets.only(bottom: 1.1),alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('NBS='+nbs(x.toInt()).toString(),style: TextStyle(color: Colors.lightBlueAccent,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedInt(nbs(x.toInt()));
        });},),
      );break;
      case 5: return Container(color: Colors.black,alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 1.0),
        child: GestureDetector(child: Text('NBY='+nby(x.toInt()).toString(),style: TextStyle(color: Colors.lightBlueAccent,fontSize: MediaQuery.of(context).size.height * 0.4/6/3*1.25)),onTap: (){setState(() {
          onPressedInt(nby(x.toInt()));
        });},),
      );
      default: return Text('');
    }
  }

  void backButtonPressed(BuildContext ctx){
    if(oper==''){
      List<String> list=a.split('');
      list.removeLast();
      setState(() {
        a=list.join();
      });
      x=double.parse(a);
    }
    switch(oper){
      case '+':
        if(b=='')
        {
          oper='';
          list.clear();
          for(int i=0;i<6;++i)
          {
            list.add(listItems(i));
          }
          break;
        }
        List<String> l=b.split('');
        l.removeLast();
        setState(() {
          b=l.join();
        });
        y = double.parse(b);
        r = x + y;
        list.clear();
        for(int i=0;i<6;++i)
        {
          list.add(listItems(i));
        }
        break;
      case '-':
        if(b=='')
        {
          oper='';
          list.clear();
          for(int i=0;i<6;++i)
          {
            list.add(listItems(i));
          }
          break;
        }
        List<String> l=b.split('');
        l.removeLast();
        setState(() {
          b=l.join();
        });
        y = double.parse(b);
        r = x - y;
        list.clear();
        for(int i=0;i<6;++i)
        {
          list.add(listItems(i));
        }
        break;
      case '*':
        if(b=='')
        {
          oper='';
          list.clear();
          for(int i=0;i<6;++i)
          {
            list.add(listItems(i));
          }
          break;
        }
        List<String> l=b.split('');
        l.removeLast();
        setState(() {
          b=l.join();
        });
        y = double.parse(b);
        r = x * y;
        list.clear();
        for(int i=0;i<6;++i)
        {
          list.add(listItems(i));
        }
        break;
      case '/':
        if(b=='')
        {
          oper='';
          list.clear();
          for(int i=0;i<6;++i)
          {
            list.add(listItems(i));
          }
          break;
        }
        List<String> l=b.split('');
        l.removeLast();
        setState(() {
          b=l.join();
        });
        y = double.parse(b);
        if(y==0){
          Scaffold.of(ctx).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.error_outline),Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('0 ga bo\'lish mumkin emas'),
          )],),duration: Duration(milliseconds: 900),backgroundColor: Colors.redAccent,));y=1;break;
        }
        r = x / y;
        list.clear();
        for(int i=0;i<6;++i)
        {
          list.add(listItems(i));
        }
        break;
    }
  }

  void clearButtonPressed(){
    a='';
    oper='';
    b='';
  }

  void onPressedInt(int i){
    oper='';
    b='';
    a=i.toString();
    x=i.toDouble();
  }

  onPressedFutureInt(Future<int> i)async{
    oper='';
    b='';
    a=(await i).toString();
    x=(await i).toDouble();
  }

  void onPressedDouble(double d){
    oper='';
    b='';
    a=d.toString();
    x=d;
  }

  Future<int> ekub(int x, int y) async{
      isLoading=true;
    int e;
    if(x==0) x=1;
    if(x<0) x=-x;
    if(y==0) y=1;
    if(y<0) y=-y;
    if (x > y) {
      for (int i = y; i >= 1; i--) {
        if (y % i == 0 && x % i == 0) {
          e = i;
          break;
        }
      }
    } else {
      for (int i = x; i >= 1; i--) {
        if (y % i == 0 && x % i == 0) {
          e = i;
          break;
        }
      }
    }
    isLoading=false;
    return e;
  }

  ekuk(int x, int y)async{
    if(x<=0) x=1;
    if(x<0) x=-x;
    if(y<=0) y=1;
    if(y<0) y=-y;
    return x * y ~/await ekub(x, y);
  }
}

class NumberButton extends StatelessWidget {
  NumberButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
      child: RawMaterialButton(
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.height * 0.1)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.06),
        ),
        fillColor: Color.fromRGBO(56, 54, 56, 1.0),
      ),
    );
  }
}

class ZeroButton extends StatelessWidget {
  ZeroButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.height * 0.21,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
            color: Color.fromRGBO(56, 54, 56, 1.0)),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            "0",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.06),
          ),
        ),
      ),
    );
  }
}

class BinaryOperatorButton extends StatelessWidget {
  BinaryOperatorButton({this.onPressed, this.text});

  final text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          constraints: BoxConstraints.tight(Size(
              MediaQuery.of(context).size.height * 0.1,
              MediaQuery.of(context).size.height * 0.1)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.06),
          ),
          fillColor: Colors.orange,
        ));
  }
}

class UnaryOperatorButton extends StatelessWidget {
  UnaryOperatorButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          constraints: BoxConstraints.tight(Size(
              MediaQuery.of(context).size.height * 0.1,
              MediaQuery.of(context).size.height * 0.1)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.06),
          ),
          fillColor: Colors.grey,
        ));
  }
}

class OtherButton extends StatelessWidget {
  OtherButton({this.icon,this.onPressed});

  final Function onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.height * 0.21,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.08),
            color: Colors.deepOrangeAccent),
        child: MaterialButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: icon),
            ],
          ),
        ),
      ),
    );
  }
}



int nbs(int x){
  if(x==0) return 1;
  if(x<0) x=-x;
  int a=0;
  for(int i=1;i<=x;i++){
    if(x%i==0){
      a+=1;
    }
  }
  return a;
}

int nby(int x){
  if(x==0) return 1;
  if(x<0) x=-x;
  int a=0;
  for(int i=1;i<=x;i++){
    if(x%i==0){
      a+=i;
    }
  }
  return a;
}