import 'package:celebi_project/models/place.dart';
import 'package:celebi_project/pages/main/detail/detail_view.dart';

import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import '../../../../extensions/context_extension.dart';
import 'head_title.dart';
import 'nearby_locations.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Column(
        children: [
          Expanded(flex: 4, child: HeadTitle()),
          buildSearchField(),
          Spacer(),
          buildNearbyLocationsText(context),
          Expanded(flex: 3, child: NearbyLocations()),
          Spacer(),
          buildPopularPlaceText(context),
          Expanded(
              flex: 17, child: SingleChildScrollView(child: PopularPlaces()))
        ],
      ),
    );
  }

  Align buildNearbyLocationsText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Nearby Locations',
        style: context.textTheme.headline6!
            .copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row buildPopularPlaceText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Places',
          style: context.textTheme.headline6!
              .copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: () {}, child: Text('See All')),
      ],
    );
  }

  Container buildSearchField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.text,
          validator: (value) {},
          controller: searchController,
          maxLength: 30,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: IconButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: 20,
                  icon: Icon(
                    Icons.tune,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
            ),
            border: InputBorder.none,
            hintText: 'Search for Place, Hotel, Food, Flight ...',
          ),
          cursorHeight: 20,
        ),
      ),
    );
  }
}

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGrid(
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      column: 2,
      children: List.generate(
        6,
        (index) => Column(
          children: [
            InkWell(
              splashColor: Colors.grey,
              highlightColor: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Stack(
                    children: [
                      Image.asset(popularPlaces[index].imageUrl!),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.center,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black.withOpacity(0.4),
                              ],
                              stops: [
                                0.0,
                                1.0,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Peri Bacalar??,\n',
                                    children: [TextSpan(text: 'Nev??ehir')],
                                  ),
                                ),
                                CircleAvatar(
                                  minRadius: 13,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
