import 'package:equatable/equatable.dart';
import 'package:uran_test/data/models/exhibits_model.dart';

class ExhibitsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExhibitsStateInitial extends ExhibitsState {}

class ExhibitsStateLoading extends ExhibitsState {}

// ignore: must_be_immutable
class ExhibitsStateFetchSuccess extends ExhibitsState {
  List<Exhibits> exhibits;
  ExhibitsStateFetchSuccess({required this.exhibits});
}

// ignore: must_be_immutable
class ExhibitsStateFetchFailure extends ExhibitsState {

  String reasonOrErrorMessage;
  ExhibitsStateFetchFailure({required this.reasonOrErrorMessage, });

  @override
  List<Object?> get props => [reasonOrErrorMessage];
}