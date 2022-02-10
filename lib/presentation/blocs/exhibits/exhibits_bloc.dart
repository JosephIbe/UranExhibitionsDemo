import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:uran_test/domain/repositories/exhibits_repository.dart';

import 'exhibits_event.dart';
import 'exhibits_state.dart';

import 'package:bloc/bloc.dart';

class ExhibitsBloc extends Bloc<ExhibitsEvent, ExhibitsState> {

  final ExhibitsLoader _repository;

  ExhibitsBloc({required ExhibitsLoader repository})
      : _repository = repository,
        super(ExhibitsStateInitial());

  @override
  Stream<ExhibitsState> mapEventToState(ExhibitsEvent event) async* {
    if(event is GetAllExhibitsEvent) {
      yield ExhibitsStateLoading();
      try {
        var exhibits = await _repository.getExhibitsList();
        // ignore: unnecessary_null_comparison
        if(exhibits != null) {
          yield ExhibitsStateFetchSuccess(exhibits: exhibits);
        } else {
          yield ExhibitsStateFetchFailure(reasonOrErrorMessage: 'Unable to process your request at this time');
        }
      } on SocketException {
        yield ExhibitsStateFetchFailure(reasonOrErrorMessage: 'Check Your Internet Connection');
      } catch (err) {
        debugPrint('err \n $err');
      }
    }
  }

}