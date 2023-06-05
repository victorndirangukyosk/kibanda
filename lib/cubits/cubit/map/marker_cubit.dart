import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerCubit extends Cubit<Set<Marker>> {
  MarkerCubit(Set<Marker> initialState) : super(initialState);

  addUserMarker(LatLng position) async {
    BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 100)), 'assets/images/flag.png');

    emit({
      Marker(
          markerId: MarkerId('user_location_point'),
          icon: icon,
          position: position)
    });
  }
}
