// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:job4all/constants/app_constants.dart';
import 'package:job4all/data/model/banners.dart';
import 'package:job4all/data/model/job.dart';
import 'package:job4all/data/model/job_match.dart';
import 'package:job4all/extensions/color_extension.dart';
import 'package:job4all/extensions/dimen_extension.dart';
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
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {},
                  child:
                      AppImages.notificationIcon(height: 22.0, width: 19.25))),
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {},
                  child: AppImages.menuIcon(height: 21.88, width: 21.88)))
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BannerWidget(
                          banners: controller.banners.value,
                        ),
                        if (role != AppConstants.BIDDER)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18.0),
                              const Text(
                                'All Categories',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 15.0),
                              CategoriesWidget(controller: controller),
                              const SizedBox(height: 23.0),
                              const Text(
                                'Popular Bidder',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 19.0),
                              BiddersWidget(controller: controller),
                            ],
                          ),
                        if (role == AppConstants.POSTER)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 26.0),
                              const Text(
                                'Recent Jobs',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 13.0),
                              JobsWidget(controller: controller),
                            ],
                          ),
                        if (role == AppConstants.BIDDER)
                          Column(
                            children: [
                              const SizedBox(height: 30.0),
                              Row(
                                children: [
                                  const Text(
                                    'Jobs match with you',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 6.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: AppColors.primaryColor),
                                    child: Text('View all Jobs',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 22.0),
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
      itemBuilder: (context, index) {
        final job = isJobMatch
            ? controller.jobMatches[index]
            : controller.recentJobs[index];
        return Container(
          height: 100.0,
          width: 390.0,
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 14.12, right: 16.16, top: 15.0, bottom: 11.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    isJobMatch ? (job as JobMatch).image : (job as Job).image,
                    height: 65.53,
                    width: 65.38,
                  ),
                  const SizedBox(width: 8.08),
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
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600)),
                            const Spacer(),
                            Container(
                              height: 21.0,
                              width: 73.76,
                              alignment: Alignment.center,
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
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
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
                                  fontSize: 10.0, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _jobDetailsWidget(
                                AppImages.toolsIcon(height: 15.0, width: 15.16),
                                isJobMatch
                                    ? (job as JobMatch).tools.toString()
                                    : (job as Job).tools.toString()),
                            _jobDetailsWidget(
                                isJobMatch
                                    ? AppImages.watchersIcon(
                                        height: 12.0, width: 18.0)
                                    : AppImages.durationIcon(
                                        height: 13.0, width: 13.13),
                                isJobMatch
                                    ? (job as JobMatch).watchers.toString()
                                    : (job as Job).duration.toString()),
                            _jobDetailsWidget(
                                isJobMatch
                                    ? AppImages.likesIcon(
                                        height: 13.0, width: 14.86)
                                    : AppImages.priceIcon(
                                        height: 12.0, width: 15.16),
                                isJobMatch
                                    ? (job as JobMatch).likes.toString()
                                    : (job as Job).price.toString()),
                            const SizedBox(width: 57.59)
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
      children: [
        icon,
        const SizedBox(
          width: 6.06,
        ),
        Text(value)
      ],
    );
  }
}

class BiddersWidget extends StatelessWidget {
  const BiddersWidget({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.bidders.length,
        itemBuilder: (context, index) {
          final bidder = controller.bidders[index];
          return Container(
            width: 100.0,
            height: 125.0,
            margin: EdgeInsets.only(left: index == 0 ? 0.0 : 15.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 75.0,
                        decoration: BoxDecoration(
                            color: bidder.color.toColor(),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              bidder.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                            ),
                            const SizedBox(height: 3.0),
                            Text(
                              bidder.role,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 10.0, color: Colors.white),
                            ),
                            const SizedBox(height: 11.0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6.0,
                      right: 6.0,
                      child: Row(
                        children: [
                          AppImages.starIcon(height: 9.0, width: 9.4),
                          const SizedBox(width: 3.6),
                          Text(
                            bidder.rating,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(height: 23.0),
                          Container(
                            height: 53.0,
                            width: 53.0,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(bidder.image),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
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
      child: LayoutBuilder(builder: (context, gridViewConstraints) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 8.0, mainAxisSpacing: 25.0),
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  Image.asset(
                    category.image,
                    width: 90.0,
                    height: 70.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 4.0),
                  FittedBox(
                    child: Text(
                      category.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
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
              Center(
                child: SizedBox(
                    width: 391.0,
                    height: 187.0,
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
                              borderRadius: BorderRadius.circular(6.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: CachedNetworkImage(
                              imageUrl: banner.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    )),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 10.0,
                child: DotsIndicator(
                  dotsCount: widget.banners.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    size: const Size.square(8.0),
                    activeSize: const Size(16.0, 8.0),
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
