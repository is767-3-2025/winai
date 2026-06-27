import 'package:first_app/components/choicecard.dart';
import 'package:first_app/models/userpref_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTwoPage extends StatefulWidget {
  const FormTwoPage({super.key});

  @override
  State<FormTwoPage> createState() => _FormTwoPageState();
}

class _FormTwoPageState extends State<FormTwoPage> {
  bool isMember = false;
  bool isAllYouCanEat = false;
  int noodleType = 0;

  @override
  void initState() {
    super.initState();
    var userPref = context.read<UserPreferenceModel>();
    isMember = userPref.isMember;
    isAllYouCanEat = userPref.isAllYouCanEat;
    noodleType = userPref.noodleType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Form Two Page'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            activeThumbColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('Membership'),
            controlAffinity: ListTileControlAffinity.platform,
            value: isMember,
            onChanged: (bool? value) {
              setState(() {
                isMember = value!;
                context.read<UserPreferenceModel>().isMember = isMember;
              });
            },
          ),
          CheckboxListTile(
            activeColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('All you can eat'),
            controlAffinity: ListTileControlAffinity.trailing,
            value: isAllYouCanEat,
            onChanged: (bool? value) {
              setState(() {
                isAllYouCanEat = value!;
                context.read<UserPreferenceModel>().isAllYouCanEat = isAllYouCanEat;
              });
            },
          ),
          ChoiceCard(
            choiceData: ChoiceData(
              title: 'Which type of noodles do you prefer?',
              choices: ['Senyai', 'Senlek', 'Senmee', 'Bamee', 'Woonsen', 'Kaolao'],
              groupValue: noodleType,
              onChanged:(int value) {
                setState(() {
                  noodleType = value;
                  context.read<UserPreferenceModel>().noodleType = noodleType;
                });
              },
            ),
          ),
          Text('Membership=$isMember'),
          Text('All you can eat=$isAllYouCanEat'),
          Text('Noodle Type=$noodleType'),
        ],
      ),
    );
  }
}