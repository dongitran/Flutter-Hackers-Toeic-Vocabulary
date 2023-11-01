class LessionModel {
  final String title;
  final String location;
  final int tag;
  final String image;

  LessionModel({
    required this.title,
    required this.location,
    required this.tag,
    required this.image,
  });
}

List<LessionModel> listOfLessons = [
  LessionModel(
    title: "Thoát cảnh thất nghiệp",
    location: "Day 1",
    image: "assets/images/day1.jpg",
    tag: 1,
  ),
  LessionModel(
    title: "Quy định về trang phục",
    location: "Day 2",
    image: "assets/images/day2.jpg",
    tag: 2,
  ),
  LessionModel(
    title: "Cao thủ chốn văn phòng",
    location: "Day 3",
    image: "assets/images/day3.jpg",
    tag: 3,
  ),
  LessionModel(
    title: "Bí quyết kinh doanh",
    location: "Day 4",
    image:
        "assets/images/day4.jpg",
    tag: 4,
  ),
  LessionModel(
    title: "Vũ khí bí mật",
    location: "Day 5",
    image:
        "assets/images/day5.jpg",
    tag: 5,
  ),
  LessionModel(
    title: "Ngày nghỉ",
    location: "Day 6",
    image:
        "assets/images/day6.jpg",
    tag: 6,
  ),
  LessionModel(
    title: "Chiến lược marketing (1)",
    location: "Day 7",
    image:
        "assets/images/day7.jpg",
    tag: 7,
  ),
  LessionModel(
    title: "Chiến lược marketing (2)",
    location: "Day 8",
    image:
        "assets/images/day8.jpg",
    tag: 8,
  ),
];
