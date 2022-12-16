import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:job4all/data/model/banners.dart';
import 'package:job4all/data/model/bidder.dart';
import 'package:job4all/data/model/category.dart';
import 'package:job4all/data/model/job.dart';
import 'package:job4all/data/model/job_match.dart';

class AppRepo {
  Future<List<Category>> getCategories() async {
    final data = await rootBundle.loadString('lib/data/local/categories.json');
    final res = jsonDecode(data);
    final List<Category> categories = [];
    for (var element in res) {
      categories.add(Category.fromJson(element));
    }
    return categories;
  }

  Future<List<Bidder>> getBidders() async {
    final data = await rootBundle.loadString('lib/data/local/bidders.json');
    final res = jsonDecode(data);
    final List<Bidder> bidders = [];
    for (var element in res) {
      bidders.add(Bidder.fromJson(element));
    }
    return bidders;
  }

  Future<List<Job>> getRecentJobs() async {
    final data = await rootBundle.loadString('lib/data/local/recent_jobs.json');
    final res = jsonDecode(data);
    final List<Job> jobs = [];
    for (var element in res) {
      jobs.add(Job.fromJson(element));
    }
    return jobs;
  }

  Future<List<JobMatch>> getJobMatches() async {
    final data = await rootBundle.loadString('lib/data/local/job_matches.json');
    final res = jsonDecode(data);
    final List<JobMatch> jobMatches = [];
    for (var element in res) {
      jobMatches.add(JobMatch.fromJson(element));
    }
    return jobMatches;
  }

  Future<List<Banners>> getBanners() async {
    final data = await rootBundle.loadString('lib/data/local/banners.json');
    final res = jsonDecode(data);
    final List<Banners> banners = [];
    for (var element in res) {
      banners.add(Banners.fromJson(element));
    }
    return banners;
  }
}
