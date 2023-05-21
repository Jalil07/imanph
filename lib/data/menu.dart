class Menu {
  final String title;
  final String imagePath;
  final String categoryNumber;

  const Menu({
    required this.title,
    required this.imagePath,
    required this.categoryNumber,
  });
}

List<Menu> getMenuItems() {
  return [
    const Menu(
        title: 'About IMAN',
        imagePath: 'assets/images/iman.jpg',
        categoryNumber: '1'),
    const Menu(
        title: 'Members',
        imagePath: 'assets/images/members.JPG',
        categoryNumber: '2'),
    const Menu(
        title: 'Clinic',
        imagePath: 'assets/images/clinic.jpg',
        categoryNumber: '3'),
    const Menu(
        title: 'Rx Pad',
        imagePath: 'assets/images/rxpad.jpg',
        categoryNumber: '4'),
    const Menu(
        title: 'Links',
        imagePath: 'assets/images/related.jpg',
        categoryNumber: '5'),
  ];
}
