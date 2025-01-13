class TrendingRepoResponseModel {
  String? repo;
  String? desc;
  String? lang;
  int? stars;
  int? forks;
  List<BuildBy>? buildBy;
  int? change;

  TrendingRepoResponseModel(
      {this.repo,
        this.desc,
        this.lang,
        this.stars,
        this.forks,
        this.buildBy,
        this.change});

  TrendingRepoResponseModel.fromJson(Map<String, dynamic> json) {
    repo = json['repo'];
    desc = json['desc'];
    lang = json['lang'];
    stars = json['stars'];
    forks = json['forks'];
    if (json['build_by'] != null) {
      buildBy = <BuildBy>[];
      json['build_by'].forEach((v) {
        buildBy!.add(new BuildBy.fromJson(v));
      });
    }
    change = json['change'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repo'] = this.repo;
    data['desc'] = this.desc;
    data['lang'] = this.lang;
    data['stars'] = this.stars;
    data['forks'] = this.forks;
    if (this.buildBy != null) {
      data['build_by'] = this.buildBy!.map((v) => v.toJson()).toList();
    }
    data['change'] = this.change;
    return data;
  }
}

class BuildBy {
  String? avatar;
  String? by;

  BuildBy({this.avatar, this.by});

  BuildBy.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    by = json['by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['by'] = this.by;
    return data;
  }
}