import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(title: 'Ben Elyhu'));
}

class MyApp extends StatelessWidget {
  MyApp({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var person = Person(name: 'dan', color: Colors.amber);
    var person2 = Person(name: 'moses', color: Colors.pink);
    var person3 = Person(name: 'Ruth', color: Colors.deepPurple);
    var ahva = Person(name: 'Ahava', color: Colors.lightBlue);
    List<Person> persons = <Person>[person, person2, person3, ahva];

    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Sample Code'),
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: persons.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: MyCard(
                      text: '${persons[index].name}',
                      color: persons[index].color),
                );
              }),
        ));
  }
}

class MyCard extends StatelessWidget {
  MyCard({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16.0)),
      ),
      onPressed: () {
        print(text);
      },
      child: Text(text),
    );
  }
}

class Person {
  final String name;
  final Color color;

  const Person({required this.name, required this.color});
}
