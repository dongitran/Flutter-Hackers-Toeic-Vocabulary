class WelcomeModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;

  WelcomeModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
}

List<WelcomeModel> welcomeComponents = [
  WelcomeModel(
      title: "Flashcards",
      subTitle: "",
      description:
          "Xem nhanh qua các từ vựng qua từng bài, giúp ôn tập và ghi nhớ dễ dàng từ vựng",
      imageUrl: "assets/images/1.jpg"),
  WelcomeModel(
      title: "Enjoy",
      subTitle: "Seas",
      description:
          "Updating...",
      imageUrl: "assets/images/2.jpg"),
];
