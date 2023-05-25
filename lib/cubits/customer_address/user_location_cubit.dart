import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationCubit extends Cubit<Position> {
  UserLocationCubit()
      : super(Position(
            longitude: 0,
            latitude: 0,
            timestamp: DateTime.now(),
            accuracy: 1.0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0)) {
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    )).listen((Position? position) {
      if (position != null) {
        emit(position);
      }
    });
  }
}
