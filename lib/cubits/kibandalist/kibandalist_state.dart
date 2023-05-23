part of 'kibandalist_cubit.dart';

@freezed
class KibandalistState with _$KibandalistState {
  const factory KibandalistState.initial() = _Initial;
  const factory KibandalistState.loading() = _Loading;
  const factory KibandalistState.success(
      {List<Kibanda>? kibandaskistores, required int currentPage}) = _Success;
  const factory KibandalistState.loadMore(
      {required List<Kibanda> kibandaskistores,
      required int currentPage}) = _LoadMore;

  const factory KibandalistState.failed() = _Failed;
}
