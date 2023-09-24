import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:single_test/cubit/InternetCubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocConsumer<InternetCubit , InternetState>(
                listener: (context, state)  {
                  if(state == InternetState.connect){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connected"),backgroundColor: Colors.blue));
                  }
                  if(state == InternetState.disconnect){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Disconnected"), backgroundColor: Colors.red,));
                  }
                },
                builder: (context, state)  {
                  if(state == InternetState.connect){
                    return Text("Connected");
                  }
                   if(state == InternetState.disconnect){
                    return Text("Disconnected");
                  }
                  return Text("Connecting...");
                },

              ),

              // SpinKitFoldingCube(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),
              // SizedBox(height: 7,),
              // SpinKitRotatingPlain(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitDoubleBounce(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitWave(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitWanderingCubes(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitCircle(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitThreeBounce(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitChasingDots(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitPumpingHeart(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitHourGlass(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitSpinningCircle(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitRipple(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitRing(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitFadingGrid(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitDualRing(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitPianoWave(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitDancingSquare(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitThreeInOut(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitSpinningLines(
              //   color: Colors.black54,
              //   size: 50.0,
              // ),SizedBox(height: 7,),
              // SpinKitPouringHourGlassRefined(
              //   color: Colors.blue,
              //   size: 50.0,
              // ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
