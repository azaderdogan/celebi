import 'package:celebi_project/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              buildTextAndProfile(context),
              buildSearchTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSearchTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
      height: 120.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(60.h)),
      child: SizedBox(
        height: 120.h,
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {},
            controller: searchController,
            maxLength: 30,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.symmetric(
                vertical: 26.h,
                horizontal: 50.w,
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
                padding: EdgeInsets.only(left: 40.w, right: 30.w),
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none,
              hintText: 'Search for Place, Hotel, Food, Flight ...',
            ),
            cursorHeight: 40.h,
          ),
        ),
      ),
    );
  }

  SizedBox buildTextAndProfile(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello Azad',
                      style: context.textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.w400)),
                  Text(
                    'Create Your Next\nRoute',
                    style: context.textTheme.headline5!
                        .copyWith(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://pbs.twimg.com/profile_images/1347941491889549318/uvn8isXg_400x400.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
