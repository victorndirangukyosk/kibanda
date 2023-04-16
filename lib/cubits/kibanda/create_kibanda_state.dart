part of 'create_kibanda_cubit.dart';

@freezed
class CreateKibandaState with _$CreateKibandaState {
  const factory CreateKibandaState.initial() = _Initial;
  const factory CreateKibandaState.loading() = _Loading;
  const factory CreateKibandaState.success() = _Success;
  const factory CreateKibandaState.failed() = _Failed;
}
