class ToDo {
  String? id;
  String? title;
  bool isDone;

  ToDo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  static List<ToDo> toDos = [
    ToDo(
      id: '1',
      title: 'Einkaufen',
      isDone: true,
    ),
    ToDo(
      id: '2',
      title: 'Sport machen',
      isDone: false,
    ),
    ToDo(
      id: '3',
      title: 'Lernen',
    ),
  ];
}