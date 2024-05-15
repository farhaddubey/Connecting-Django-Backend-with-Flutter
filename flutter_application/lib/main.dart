import 'package:flutter/material.dart';
import 'package:flutter_application/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Django',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Connect Flutter on Django'),
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
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: studentService.getAllStudent(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data![i]['stuname'],
                        style: TextStyle(fontSize: 30),
                      ),
                      subtitle: Text(
                        snapshot.data![i]['email'],
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data found'),
              );
            }
          },
        ),
      ),
    );
  }
}
