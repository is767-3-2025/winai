import 'package:first_app/models/userpref_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseCardPage extends StatefulWidget {
  ChooseCardPage({super.key});

  @override
  State<ChooseCardPage> createState() => _ChooseCardPageState();
}

class _ChooseCardPageState extends State<ChooseCardPage> {
  final List<dynamic> nameList = [
    ['Winai Nadee', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Winai Nadee 2', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Winai Nadee 3', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Winai Nadee 4', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
  ];

  String _chooseCard = '';
  String _chooseCard2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Choose Card Page'),
      ),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          Consumer<UserPreferenceModel>(
            builder: (context, value, child) {
              return Text('Is member : ${value.isMember}');
            },
          ),
          ElevatedButton(
            child: Text('Choose name - $_chooseCard'),
            onPressed: () async {
              String result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    nameList: nameList,
                  ),
                ),
              ); 

              setState(() {
                _chooseCard = result;
              }); 
            },
          ),
          ElevatedButton(
            child: Text('Choose name - $_chooseCard2'),
            onPressed: () async {
              String result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    nameList: nameList,
                  ),
                ),
              ); 

              setState(() {
                _chooseCard2 = result;
              }); 
            },
          ),
        ],
      ),
    );
  }
}

class CardListPage extends StatelessWidget {
  const CardListPage({
    super.key,
    required this.nameList,
  });

  final List<dynamic> nameList;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Choose Name Card Page'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: nameList.length,
        itemBuilder: (context, index) {
          return NameCard(
            data: NameCardData(
              name: nameList[index][0],
              dob: nameList[index][1],
              imageUrl: nameList[index][2],
            ),
          );
        },
      ),
    );
  }
}

class NameCard extends StatelessWidget {
  const NameCard({
    super.key,
    required this.data,
  });

  final NameCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Image.network(
            data.imageUrl,
            height: 150.0,
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Name: ${data.name}'),
              Text('DOB: ${data.dob}'),
              ElevatedButton(
                child: Text('Choose'),
                onPressed: () {
                  Navigator.pop(context, data.name);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class NameCardData {
  const NameCardData({
    required this.name,
    required this.dob,
    required this.imageUrl,
  });

  final String name;
  final String dob;
  final String imageUrl;
}