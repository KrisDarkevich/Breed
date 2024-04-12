import 'package:cat_breeds/logic/api_call.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:mobx/mobx.dart';

part 'api_list.g.dart';

// ignore: library_private_types_in_public_api
class ApiList = _ApiList with _$ApiList;

abstract class _ApiList with Store {
  final ApiClient apiClient;
  _ApiList(this.apiClient);

  @observable
  ObservableList list = ObservableList<BreedsInfo>.of([]);

  @action
  Future<void> getList() async {
    list.addAll(await apiClient.getUrl());
  }
}
