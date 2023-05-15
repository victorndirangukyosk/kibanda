import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class UserLocationCubit extends Cubit<LocationData> {
  UserLocationCubit()
      : super(LocationData.fromMap({
          "latitude": 0.0,
          "longitude": 0.0,
          "accuracy": 0.0,
          "altitude": 0.0,
          "heading": 0.0,
          "speed": 0.0,
          "speedAccuracy": 0.0,
        })) {
    Location _location = Location();
    _location.onLocationChanged.listen((LocationData locationData) {
      emit(locationData);
    });
  }
}
