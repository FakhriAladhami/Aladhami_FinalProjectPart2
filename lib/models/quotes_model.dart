import 'dart:convert';

class QuotesModel {
  final String id;
  final String content;
  final String author;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final DateTime dateAdded;
  final DateTime dateModified;

  QuotesModel({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory QuotesModel.fromRawJson(String str) =>
      QuotesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  /// To get data from API (Internet) to our local Flutter Application
  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        id: json['_id'],
        content: json['content'],
        author: json['author'],
        tags: List<String>.from(json['tags'].map((x) => x)),
        authorSlug: json['authorSlug'],
        length: json['length'],
        dateAdded: DateTime.parse(json['dateAdded']),
        dateModified: DateTime.parse(json['dateModified']),
      );

  /// To pass data from our application to the Internet
  Map<String, dynamic> toJson() => {
        '_id': id,
        'content': content,
        'author': author,
        'tags': List<dynamic>.from(tags.map((x) => x)),
        'authorSlug': authorSlug,
        'length': length,
        'dateAdded':
            '${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}',
        'dateModified':
            '${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}',
      };
}
