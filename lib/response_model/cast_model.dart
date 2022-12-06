class CastModel {
  final List? cast;
  CastModel({this.cast});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      cast: json['cast'],
    );
  }
}
