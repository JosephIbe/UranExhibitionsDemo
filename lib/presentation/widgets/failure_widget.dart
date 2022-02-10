import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {

  final String reason;
  // ignore: use_key_in_widget_constructors
  const FailureWidget({required this.reason});

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
          // Image.asset('assets/no-philosophers.gif', height: 350.0, width: 350.0, ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              reason,
              textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.redAccent,
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