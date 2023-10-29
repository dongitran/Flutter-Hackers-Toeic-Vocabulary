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
    image: "assets/images/paris.jpg",
    tag: 1,
  ),
  LessionModel(
    title: "Quy định về trang phục",
    location: "Day 2",
    image: "assets/images/images.jpeg",
    tag: 2,
  ),
  LessionModel(
    title: "Cao thủ chốn văn phòng",
    location: "Day 3",
    image: "assets/images/Sossusvlei.jpg",
    tag: 3,
  ),
  LessionModel(
    title: "Bí quyết kinh doanh",
    location: "Day 4",
    image:
        "assets/images/22bab5ad4b9aa1027ad00a84ea7493d2c0c5e666d43d3b9413e332bdbd3f1780.jpg",
    tag: 4,
  ),
  LessionModel(
    title: "Vũ khí bí mật",
    location: "Day 5",
    image:
        "assets/images/607d0368488549e7b9179724b0db4940.jpg",
    tag: 5,
  ),
];
