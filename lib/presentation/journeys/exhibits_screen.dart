import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:uran_test/presentation/blocs/exhibits/exhibits_bloc.dart';
import 'package:uran_test/presentation/blocs/exhibits/exhibits_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uran_test/presentation/widgets/exhibits_list.dart';
import 'package:uran_test/presentation/widgets/failure_widget.dart';
import 'package:uran_test/presentation/widgets/loader_widget.dart';

class ExhibitsScreen extends StatelessWidget {

  const ExhibitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Exhibits Demo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0.0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ExhibitsBloc, ExhibitsState>(
            builder: (context, state){
              if(state is ExhibitsStateLoading) {
                return const LoaderWidget(text: 'Fetching Exhibits',);
              }
              if(state is ExhibitsStateFetchFailure) {
                return FailureWidget(reason: state.reasonOrErrorMessage);
              }
              if(state is ExhibitsStateFetchSuccess) {
                return ExhibitsList(items: state.exhibits);
              }
              return const LoaderWidget(text: 'Fetching Exhibits',);
            },
          ),
        ),
      ),
    );
  }

}