import 'package:get_it/get_it.dart';

import 'package:uran_test/data/core/api_client.dart';
import 'package:uran_test/data/data_sources/exhibits_remote_data_source.dart';
import 'package:uran_test/data/repositories/exhibits_loader_impl.dart';
import 'package:uran_test/domain/repositories/exhibits_repository.dart';

final getItInstance = GetIt.I;

Future<void> init() async {

  getItInstance.registerLazySingleton<APIClient>(() => APIClient());

  getItInstance.registerLazySingleton<ExhibitsRemoteDataSource>(
          () => ExhibitsRemoteDataSourceImpl(client: getItInstance()));

  getItInstance.registerLazySingleton<ExhibitsLoader>(
          () => ExhibitsLoaderImpl(dataSource: getItInstance()));

}