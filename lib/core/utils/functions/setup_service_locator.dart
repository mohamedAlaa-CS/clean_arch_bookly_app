import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

setupServiceLocator() {
  getit.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      homeRemoteDataSources: HomeRemoteDataSourcesImpel(),
      homeLocalDataSource: HomeLocalDataSourceImple(),
    ),
  );
}
