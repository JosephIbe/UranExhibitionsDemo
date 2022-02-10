import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatelessWidget {

  final String text;
  const LoaderWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpinKitCubeGrid(
            color: Colors.deepOrange,
            size: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              )
            ),
          ),
        ],
      ),
    );
  }

}