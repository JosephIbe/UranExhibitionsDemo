import 'package:uran_test/data/models/exhibits_model.dart';

import 'package:uran_test/data/data_sources/exhibits_remote_data_source.dart';

import 'package:uran_test/domain/repositories/exhibits_repository.dart';

class ExhibitsLoaderImpl extends ExhibitsLoader {

  final ExhibitsRemoteDataSource dataSource;
  ExhibitsLoaderImpl({required this.dataSource});

  @override
  Future<List<Exhibits>> getExhibitsList() async {
    return await dataSource.getExhibitsList();
  }

}