// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:uran_test/data/models/exhibits_model.dart';
import 'package:uran_test/presentation/widgets/exhibit_item.dart';

class ExhibitsList extends StatelessWidget {

  final List<Exhibits> items;
  const ExhibitsList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ExhibitItem(modelData: items[index]);
      },
      // padding: const EdgeInsets.only(top: 15.0),
    );
  }

}