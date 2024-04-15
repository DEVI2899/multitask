class Userdetails {
 int userId;
 int id;
 String title;
 String body;

 Userdetails({
  required this.userId,
  required this.id,
  required this.title,
  required this.body,
 });

 factory Userdetails.fromJson(Map<String, dynamic> json) => Userdetails(
  userId: json["userId"],
  id: json["id"],
  title: json["title"],
  body: json["body"],
 );

 Map<String, dynamic> toJson() => {
  "userId": userId,
  "id": id,
  "title": title,
  "body": body,
 };
}