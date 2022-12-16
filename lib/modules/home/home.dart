// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job4all/constants/app_constants.dart';
import 'package:job4all/data/model/banners.dart';
import 'package:job4all/data/model/job.dart';
import 'package:job4all/data/model/job_match.dart';
import 'package:job4all/extensions/color_extension.dart';
import 'package:job4all/modules/home/home_controller.dart';
import 'package:job4all/styles/app_colors.dart';
import 'package:job4all/styles/app_images.dart';

class Home extends GetView<HomeController> {
  final String role;
  const Home({required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                  onTap: () {}, child: AppImages.notificationIcon)),
          Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(onTap: () {}, child: AppImages.menuIcon))
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BannerWidget(
                          banners: controller.banners.value,
                        ),
                        16.verticalSpace,
                        Text(
                          'All Categories',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        8.verticalSpace,
                        CategoriesWidget(controller: controller),
                        16.verticalSpace,
                        Text(
                          'Popular Bidder',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        8.verticalSpace,
                        BiddersWidget(controller: controller),
                        if (role == AppConstants.POSTER)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.verticalSpace,
                              Text(
                                'Recent Jobs',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              8.verticalSpace,
                              JobsWidget(controller: controller),
                            ],
                          ),
                        if (role == AppConstants.BIDDER)
                          Column(
                            children: [
                              16.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    'Job Matches',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.sp, vertical: 6.sp),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: AppColors.primaryColor),
                                    child: Text('View all Jobs',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                              8.verticalSpace,
                              JobsWidget(
                                controller: controller,
                                isJobMatch: true,
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

class JobsWidget extends StatelessWidget {
  final HomeController controller;
  final bool isJobMatch;
  const JobsWidget(
      {super.key, required this.controller, this.isJobMatch = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: isJobMatch
          ? controller.jobMatches.length
          : controller.recentJobs.length,
      itemExtent: 0.14.sh,
      itemBuilder: (context, index) {
        final job = isJobMatch
            ? controller.jobMatches[index]
            : controller.recentJobs[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    isJobMatch ? (job as JobMatch).image : (job as Job).image,
                    height: 60.h,
                    width: 60.w,
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                isJobMatch
                                    ? (job as JobMatch).title
                                    : (job as Job).title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600)),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp, vertical: 5.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: isJobMatch
                                      ? AppColors.red
                                      : AppColors.primaryColor),
                              child: Text(
                                  isJobMatch
                                      ? 'Place Bid'
                                      : ((job as Job).isCompleted
                                          ? 'Completed'
                                          : 'Pending'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        Text(
                          isJobMatch
                              ? (job as JobMatch).description
                              : (job as Job).description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _jobDetailsWidget(
                                AppImages.toolsIcon,
                                isJobMatch
                                    ? (job as JobMatch).tools.toString()
                                    : (job as Job).tools.toString()),
                            _jobDetailsWidget(
                                isJobMatch
                                    ? AppImages.watchersIcon
                                    : AppImages.durationIcon,
                                isJobMatch
                                    ? (job as JobMatch).watchers.toString()
                                    : (job as Job).duration.toString()),
                            _jobDetailsWidget(
                                isJobMatch
                                    ? AppImages.likesIcon
                                    : AppImages.priceIcon,
                                isJobMatch
                                    ? (job as JobMatch).likes.toString()
                                    : (job as Job).price.toString())
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row _jobDetailsWidget(SvgPicture icon, String value) {
    return Row(
      children: [icon, 6.horizontalSpace, Text(value)],
    );
  }
}

class BiddersWidget extends StatelessWidget {
  const BiddersWidget({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.2.sh,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemExtent: 0.35.sw,
        itemCount: controller.bidders.length,
        itemBuilder: (context, index) {
          final bidder = controller.bidders[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            margin: EdgeInsets.only(
                right: (index != controller.bidders.length - 1) ? 14.w : 0),
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: constraints.maxHeight / 1.75,
                      decoration: BoxDecoration(
                          color: bidder.color.toColor(),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            bidder.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                          ),
                          4.verticalSpace,
                          Text(
                            bidder.role,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                          ),
                          (constraints.maxHeight * 0.06).verticalSpace
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    right: 8.w,
                    child: Row(
                      children: [
                        AppImages.starIcon,
                        4.horizontalSpace,
                        Text(
                          bidder.rating,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: AssetImage(bidder.image),
                        ),
                        (constraints.maxHeight * 0.075).verticalSpace
                      ],
                    ),
                  )
                ],
              );
            }),
          );
        },
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.25.sh,
      child: LayoutBuilder(builder: (context, gridViewConstraints) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: gridViewConstraints.maxHeight / 2,
              crossAxisCount: 4,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 4.h),
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  Image.asset(
                    category.image,
                    height: constraints.maxHeight * 0.70,
                    fit: BoxFit.fill,
                  ),
                  (constraints.maxHeight * 0.05).verticalSpace,
                  FittedBox(
                    child: Text(
                      category.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 11.sp, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              );
            });
          },
        );
      }),
    );
  }
}

class BannerWidget extends StatefulWidget {
  BannerWidget({
    Key? key,
    required this.banners,
  }) : super(key: key);
  final List<Banners> banners;
  final _pageContoller = PageController();

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  double currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return widget.banners.isNotEmpty
        ? Stack(
            children: [
              SizedBox(
                  height: 0.25.sh,
                  child: PageView.builder(
                    itemCount: widget.banners.length,
                    controller: widget._pageContoller,
                    onPageChanged: (value) => setState(() {
                      currentIndex = value.toDouble();
                    }),
                    itemBuilder: (context, index) {
                      final banner = widget.banners[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CachedNetworkImage(
                            imageUrl: banner.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 12.sp,
                child: DotsIndicator(
                  dotsCount: widget.banners.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    size: Size.square(8.sp),
                    activeSize: Size(16.sp, 8.sp),
                    activeColor: Colors.white,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
