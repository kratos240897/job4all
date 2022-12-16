import 'package:get/get.dart';
import 'package:job4all/data/model/job.dart';
import 'package:job4all/data/model/job_match.dart';
import '../../data/model/banners.dart';
import '../../data/model/bidder.dart';
import '../../data/model/category.dart';
import '../../data/repo/app_repo.dart';

class HomeController extends GetxController {
  final _repo = Get.find<AppRepo>();
  final Rx<bool> isLoading = false.obs;
  final RxList<Banners> banners = RxList.empty();
  final RxList<Category> categories = RxList.empty();
  final RxList<Bidder> bidders = RxList.empty();
  final RxList<Job> recentJobs = RxList.empty();
  final RxList<JobMatch> jobMatches = RxList.empty();

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  fetchData() async {
    isLoading.value = true;
    await getBanners();
    await getCategories();
    await getBidders();
    await getRecentJobs();
    await getJobMatches();
    isLoading.value = false;
  }

  getCategories() {
    _repo.getCategories().then((value) => categories.value = value);
  }

  getBanners() {
    _repo.getBanners().then((value) => banners.value = value);
  }

  getBidders() {
    _repo.getBidders().then((value) => bidders.value = value);
  }

  getRecentJobs() {
    _repo.getRecentJobs().then((value) => recentJobs.value = value);
  }

  getJobMatches() {
    _repo.getJobMatches().then((value) => jobMatches.value = value);
  }
}
