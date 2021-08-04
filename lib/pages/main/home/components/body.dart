import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../extensions/context_extension.dart';
import 'head_title.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          children: [
            HeadTitle(),
            buildSearchField(),
          ],
        ),
      ),
    );
  }

  Container buildSearchField() {
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
}
