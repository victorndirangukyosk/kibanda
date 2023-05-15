import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_geocoder/geocoder.dart';

class PlacesAutoCompleteCubit extends Cubit<List<Address>> {
  PlacesAutoCompleteCubit(List<Address> initialState) : super(initialState);
  save(List<Address> places) {
    emit(places);
  }
}
