import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      initialRoute: '/0',
      routes: {
        '/0': (context) => GridPage(),
        '/1': (context) => MyHomePage(title: 'Home - Winai'),
        '/2': (context) => ListPage(),
        '/3': (context) => FormPage(),
        '/4': (context) => BlankPage(),
      },
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
  int _counter = 200;

  @override
  void initState() {
    super.initState();
    _counter = 100;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Do you understand?'),
                  action: SnackBarAction(
                    label: 'Yes',
                    onPressed: () {
                      print('Winai log Yes');
                    },
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(100),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo-1024.png',
                    height: 200,
                  ),
                  Icon(Icons.home),
                ],
              ),
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                MyButton(),
                MyButton(),
                ElevatedButton(
                  child: Text('Okay'),
                  onPressed: () {
                    print("Winai log $_counter");
                    setState(() {
                      _counter += 3;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.access_alarm),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Click'),
      onPressed: () {
        
      },
    );
  }
}

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<String> entries = <String>['A', 'B', 'C','D','E','F','G','H','I','J'];
  final List<int> colorCodes = <int>[600, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('List Page'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.blue[colorCodes[index % 2]],
            child: Center(child: Text('Product ${entries[index]}')),
          );
        },
      ),
    );
  }
}

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Grid Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/${index+1}');
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.home),
                  Text('Page ${index+1}'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Form Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'What is your name?',
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  hintText: 'What is your password?',
                  labelText: 'Password',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Blank Page'),
      ),
      body: Center(
        child: Text('This is a blank page.'),
      ),
    );
  }
}