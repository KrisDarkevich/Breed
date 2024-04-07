import 'package:mobx/mobx.dart';

part 'mob.g.dart';

// ignore: library_private_types_in_public_api
class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  //перенести сюда apiClient , чтобы он прокидывался через параметр ,
  // создать здесь так же observable list
  //написать action , который заполняет observable list данными с апи
  //на экране отображать данные из созданного здесь observable листа
  //запрос action -а, в котором получаются данные с апи, сделать через future builder
  //другой лист удалить, все данные должны лежвть в observable листе
  //удалить добавление избранного с экрана и перенести в этот же Store

  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
