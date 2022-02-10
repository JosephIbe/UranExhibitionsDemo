import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:uran_test/data/repositories/exhibits_loader_impl.dart';
import 'package:uran_test/domain/repositories/exhibits_repository.dart';

import 'package:uran_test/presentation/blocs/exhibits/exhibits_bloc.dart';
import 'package:uran_test/presentation/blocs/exhibits/exhibits_event.dart';

import 'presentation/journeys/exhibits_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
// ignore: library_prefixes
import 'di/get_it.dart' as getIt;

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());

  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((value) => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ExhibitsLoader>(
            create: (_) => ExhibitsLoaderImpl(dataSource: getIt.getItInstance()),
          ),
        ],
        child: BlocProvider<ExhibitsBloc>(
          create: (context) {
            final repo = context.read<ExhibitsLoader>();
            return ExhibitsBloc(repository: repo)..add(GetAllExhibitsEvent());
          },
          child: const UranTestApp(),
        )
      ),
  ));
}

class UranTestApp extends StatelessWidget {

  const UranTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UranTest',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: const ExhibitsScreen(),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // ignore: avoid_print
    print(transition);
  }
  
}