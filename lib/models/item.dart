import 'package:flutter/cupertino.dart';

class Item {
  Key? id;
  String? title;
  bool? done;

  Item({this.id, this.title, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}
