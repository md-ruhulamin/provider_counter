import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/counter_handler.dart';
import 'package:provider_counter/slider_handler.dart';
import 'package:provider_counter/theme_handler.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CounterHandler(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeHandler(),
      ),
      ChangeNotifierProvider(
        create: (_) => SliderHandler(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeSwitcher = Provider.of<ThemeHandler>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeSwitcher.thememode,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("Clicked Homepage");
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_2_sharp),
            onPressed: () =>
                Provider.of<ThemeHandler>(context, listen: false).changeTheme(),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value",
              style: TextStyle(fontSize: 20),
            ),
            Consumer<CounterHandler>(
                builder: (context, countHandler, child) => Text(
                      "${countHandler.counter}",
                      style: TextStyle(fontSize: 30),
                    )),
            ElevatedButton(
                onPressed: () =>
                    Provider.of<CounterHandler>(context, listen: false)
                        .setcounter(10),
                child: Text("Set Value 10")),
            ElevatedButton(
                onPressed: () =>
                    Provider.of<CounterHandler>(context, listen: false)
                        .incremnet(),
                child: Text("Increment")),
            ElevatedButton(
                onPressed: () =>
                    Provider.of<CounterHandler>(context, listen: false).reset(),
                child: Text("Reset")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text("Go to Second Page"))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double slidervalue = 0;
  @override
  Widget build(BuildContext context) {
    print("Clicked Second Page");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_2_sharp),
            onPressed: () =>
                Provider.of<ThemeHandler>(context, listen: false).changeTheme(),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderHandler>(
              builder: (context, sliderHandler, child) => Container(
                decoration: BoxDecoration(
                    color: Colors.amber.withAlpha(sliderHandler.slider.ceil())),
                width: 370,
                height: 200,
              ),
            ),
            Consumer<SliderHandler>(
              builder: (context, sliderHander, child) => Slider(
                  min: 0,
                  max: 100,
                  value: sliderHander.slider,
                  onChanged: (value) {
                    sliderHander.changeSlider(value);
                  }),
            ),
            Text(
              "Counter Value",
              style: TextStyle(fontSize: 20),
            ),
            Consumer<CounterHandler>(
                builder: (context, countHandler, child) => Text(
                      "${countHandler.counter}",
                      style: TextStyle(fontSize: 30),
                    )),
            ElevatedButton(
                onPressed: (){ Provider.of<CounterHandler>(context, listen: false)
                        .setcounter(10);},
                   
                child: Text("Set Value 10")),
            ElevatedButton(
                onPressed: () =>context.read<CounterHandler>().incremnet(),
                    // Provider.of<CounterHandler>(context, listen: false)
                    //     .incremnet(),
                child: Text("Increment")),
            ElevatedButton(
                onPressed: () =>
                    Provider.of<CounterHandler>(context, listen: false).reset(),
                child: Text("Reset")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text("Go to Second Page"))
          ],
        ),
      ),
    );
  }
}
