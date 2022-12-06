class TrendingModel {
  final List? movies;
  TrendingModel({this.movies});

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      movies: json['results'],
    );
  }
}
