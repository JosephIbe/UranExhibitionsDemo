import 'package:uran_test/data/models/exhibits_model.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibits>> getExhibitsList();
}