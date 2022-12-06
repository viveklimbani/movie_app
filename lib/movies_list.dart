import 'package:flutter/material.dart';
import 'package:movie_list_app/common/utils/dimen.dart';

import 'common/resources/colors.dart';
import 'common/resources/images.dart';
import 'common/resources/styles.dart';
import 'common/widget/custom_textfield.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  TextEditingController searchEditingController = TextEditingController();

  var items = <MovieData>[];

  @override
  void initState() {
    items.addAll(movieSearchList);
    super.initState();
  }

  void filterSearchResults(String query) {
    var searchQuery = query.toString().toLowerCase();
    List<MovieData> dummySearchList = <MovieData>[];
    dummySearchList.addAll(movieSearchList);
    if (searchQuery.isNotEmpty) {
      List<MovieData> dummyListData = <MovieData>[];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(searchQuery)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(movieSearchList);
      });
    }
  }

  List<MovieData> movieSearchList = [
    MovieData("R Rajkumar", Images.ic1),
    MovieData("Kick", Images.ic2),
    MovieData("War", Images.ic3),
    MovieData("Gabbar is back", Images.ic4),
    MovieData("Ek Tha Tiger", Images.ic5),
    MovieData("Raanjhana", Images.ic6),
    MovieData("Dhoom 3", Images.ic7),
    MovieData("Thappad", Images.ic8),
  ];

  List moviePoster = [
    Images.ic1,
    Images.ic2,
    Images.ic3,
    Images.ic4,
    Images.ic5,
    Images.ic6,
    Images.ic7,
    Images.ic8,
  ];

  var movieName = <String>[
    "R Rajkumar",
    "Kick",
    "Mission Impossible",
    "Gabbar is back",
    "Ek Tha Tiger",
    "Raanjhana",
    "Dhoom 3",
    "Thappad",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getMainLayout,
    );
  }

  get getMainLayout => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "HDMoviesHub",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: TextSize.JUMBO56,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: Spacing.large),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.large),
                child: Text(
                  "Trending Movies",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: TextSize.xlarge,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: Spacing.large),
              getTrendingMovieList,
              const SizedBox(height: Spacing.large),
              getSearchBox,
              const SizedBox(height: Spacing.large),
              getMoviesGrid,
            ],
          ),
        ),
      );

  get getTrendingMovieList => Container(
        height: Spacing.JUMBO100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: moviePoster.length,
            itemBuilder: (context, index) {
              return getSingleMovieCard(context, index);
            }),
      );

  Widget getSingleMovieCard(BuildContext context, int index) {
    var item = moviePoster[index];
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Spacing.defaultFieldsSpacing),
      child: Image.asset(item),
    );
  }

  get getSearchBox => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.space10),
        child: TextFieldSearchCustom(
          hintText: "Search Movie by name",
          onChangeField: (value) {
            filterSearchResults(value);
          },
          controller: searchEditingController,
        ),
      );
  get getMoviesGrid => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return getSingleMovieGrid(context, index);
        },
      );

  Widget getSingleMovieGrid(BuildContext context, int index) {
    var item = items[index];
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: MAColors.whiteColor,
                // width: Spacing.defaultFieldsSpacing
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: Spacing.JUMBO150,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(item.poster),
                  ),
                ),
                const SizedBox(
                  height: Spacing.xSmall,
                ),
                Center(
                  child: Text(
                    item.name,
                    style: TextStyles.heading4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieData {
  String name;
  String poster;

  MovieData(this.name, this.poster);
}
