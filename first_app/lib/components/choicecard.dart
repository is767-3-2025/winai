import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    super.key,
    required this.choiceData,
  });

  final ChoiceData choiceData;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Text(choiceData.title),
          ...List.generate(choiceData.choices.length, (index) {
            return ChoiceRadio(
              label: choiceData.choices[index],
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: index,
              groupValue: choiceData.groupValue,
              onChanged:(int value) {
                choiceData.onChanged(value);
              },
            );
          }),
        ],
      ),
    );
  }
}

class ChoiceRadio extends StatelessWidget {
  const ChoiceRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });
  
  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Radio<int>(
            groupValue: groupValue,
            value: value,
            onChanged: (int? value) {
              onChanged(value!);
            },
          ),
          Text(label),
        ],
      ),
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
    );
  }
}

class ChoiceData {
  const ChoiceData({
    required this.title,
    required this.choices,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final List<String> choices;
  final int groupValue;
  final ValueChanged<int> onChanged;
}