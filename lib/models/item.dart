import 'package:flutter/cupertino.dart';

class Item {
  late Key id;
  String? title;
  bool? done;

  Item({this.title, this.done}) : id = UniqueKey();

  Item.fromJson(Map<String, dynamic> json) {
    id = Key(json['id']);
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id.toString();
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}
