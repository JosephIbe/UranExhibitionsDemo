import 'package:uran_test/data/core/api_client.dart';
import 'package:uran_test/data/core/api_constants.dart';

import 'package:uran_test/data/models/exhibits_model.dart';

abstract class ExhibitsRemoteDataSource {
  Future<List<Exhibits>> getExhibitsList();
}

class ExhibitsRemoteDataSourceImpl extends ExhibitsRemoteDataSource {

  final APIClient client;
  ExhibitsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Exhibits>> getExhibitsList() async {
    final response = await client.getResource(path: APIConstants.EXHIBITS_PATH);
    // print('response from datasource:\n $response');

    List<Exhibits> exhibitsList = [];
    for (var r in response) {
      exhibitsList.add(Exhibits.fromJson(r));
    }

    return exhibitsList;
  }

}