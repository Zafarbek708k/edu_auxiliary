
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

@immutable
final class RTDBService{


  static final db = FirebaseDatabase.instance.ref();

  /// create

  static Future<Stream<DatabaseEvent>>create({required String path, required Post post})async{
    String? key = db.child(path).push().key;
    post.postKey = key!;
    await db.child(path).child(post.postKey!).set(post.toJson());
    return db.onChildAdded;
  }

  /// read
  static Future<List<Post>>read({required String path})async{
    List<Post> postList = [];
    Query query = db.child(path);
    DatabaseEvent databaseEvent = await query.once();
    Iterable<DataSnapshot> result = databaseEvent.snapshot.children;
    for (DataSnapshot item in result) {
      if(item.value != null){
        postList.add(Post.fromJson(Map<String, dynamic>.from(item.value as Map)));
      }
    }
    return postList;
  }

  /// update
  static Future<Stream<DatabaseEvent>>update({required String path, required Post post})async{
    await db.child(path).child(post.postKey!).set(post.toJson());
    return db.onChildAdded;
  }


  /// delete
  static Future<void>delete({required String path, required String key})async{
    await db.child(path).child(key).remove();
  }


}


class Post {
  String? postKey;
  late String userId;
  late String firstname;
  late String lastname;
  late String date;
  late String content;
  String? image;

  Post({
    this.postKey,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.date,
    required this.content,
    this.image});

  Post.fromJson(Map<String, dynamic> json) {
    postKey = json['postKey'];
    userId = json['userId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    date = json['date'];
    content = json['content'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() => {
    'postKey': postKey,
    'userId': userId,
    'firstname': firstname,
    'lastname': lastname,
    'date': date,
    'content': content,
    'image': image,
  };
}
