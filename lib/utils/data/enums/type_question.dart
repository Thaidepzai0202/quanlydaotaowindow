import 'package:quanlydaotao/common/models/selectable_Item.dart';

class QuestionType {
  static final Map<String, String> _values = {
    '0': 'Trắc nghiệm 1 đáp án',
    '1': 'Trắc nghiệm nhiều đáp án',
    '2': 'Trắn nghiệm điền',
    '3': 'Tự luận',
  };

  static int idOf(String value) {
    return int.parse(_values.entries.firstWhere((e) => e.value == value).key);
  }

  static String valueOf(String id) {
    if (id.isEmpty || id == '0') return 'Chưa cập nhật';

    String value = _values[id]!;
    return value;
  }

  static List<SelectableItem> get selectableItemList => _values.entries
      .map(
        (e) => SelectableItem(
          id: e.key,
          name: e.value,
        ),
      )
      .toList();

  static List<String> get values =>
      _values.entries.map((e) => e.value).toList();
}