import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'Hello World';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Comp1(),
        ),
      ),
    );
  }
}

class Comp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Comp2());
  }
}

class Comp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Comp3(),
        MyTextField(),
      ],
    );
  }
}

class Comp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).data,
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        Provider.of<Data>(context, listen: false).changeData(newValue);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Hello';

  void changeData(String newValue) {
    data = newValue;
    notifyListeners();
  }
}
