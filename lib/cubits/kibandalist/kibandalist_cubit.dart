import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/kibanda_model/kibanda.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';
import 'package:kibanda_kb/utilities/utilities.dart';

part 'kibandalist_state.dart';
part 'kibandalist_cubit.freezed.dart';

class KibandalistCubit extends Cubit<KibandalistState> {
  KibandalistCubit() : super(const KibandalistState.initial());

  getVibandas() async {
    emit(const KibandalistState.loading());
    try {
 
      var response = await RestClient().dio!.get(
          'http://3.145.212.139:5005/api/kibandalist',
          queryParameters: {

            'limit': '100',
          });
      List kibandasinJson = response.data['data'];
      List<Kibanda> kibandaskis = kibandasinJson.map((e) {
        return Kibanda.fromJson(e);
      }).toList();
      emit(KibandalistState.success(
          kibandaskistores: kibandaskis,
          currentPage: 1,
          isLastPage: kibandaskis.length < 25 ? true : false));
    } catch (e) {
      emit(const KibandalistState.failed());
    }
  }

  getMoreVibandas({
    required List<Kibanda> kibandaskis,
    required int page,
  }) async {
    // emit(KibandalistState.loadMore(
    //     kibandaskistores: kibandaskis, currentPage: page));
    try {
      var response = await RestClient().dio!.get(
          'http://3.145.212.139:5005/api/kibandalist',
          queryParameters: {
            'limit': 25,
            'page': page + 1,
          });
      List kibandasinJson = response.data['data'];
      List<Kibanda> kibandaskis2 = kibandasinJson.map((e) {
        return Kibanda.fromJson(e);
      }).toList();
      if (kibandaskis2.length < 25) {
        emit(KibandalistState.success(
          kibandaskistores: [...kibandaskis, ...kibandaskis2],
          currentPage: page + 1,
          isLastPage: true,
        ));
      } else {
        emit(KibandalistState.success(
          kibandaskistores: [...kibandaskis, ...kibandaskis2],
          currentPage: page + 1,
          isLastPage: true,
        ));
      }
    } catch (e) {
      emit(const KibandalistState.failed());
    }
  }
}

class LoadingMoreCubit extends Cubit<bool> {
  LoadingMoreCubit() : super(false);

  setLoadingMore(bool value) {
    emit(value);
  }
}
