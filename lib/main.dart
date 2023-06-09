import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/app/app.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client_customer.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
  ].request();

  ///Allow getit reassignments for smoother debuging
  GetIt.I.allowReassignment = true;

  ///Register the rest client to be accessible throughout the app {DI}
  GetIt.I.registerSingleton<RestClient>(RestClient());

  GetIt.I.registerSingleton<RestClientCustomer>(RestClientCustomer());

  // HydratedBloc.storage.runZoned(() => runApp(KwikBasketKibandaApp()),
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(KwikBasketKibandaApp());
}
