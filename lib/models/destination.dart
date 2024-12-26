class Destination {
  final int id;
  final String image;
  final String name;

  Destination({
    required this.id,
    required this.image,
    required this.name,
  });
}

final destinations = [
  Destination(
    id: 1,
    image: 'assets/destinations/pexels-asad-photo-maldives-1483054.jpg',
    name: 'Maldives',
  ),
  Destination(
    id: 2,
    image: 'assets/destinations/pexels-asad-photo-maldives-3601421.jpg',
    name: 'Divmals',
  ),
  Destination(
    id: 3,
    image: 'assets/destinations/pexels-josh-sorenson-127513.jpg',
    name: 'Sorenson',
  ),
  Destination(
    id: 4,
    image: 'assets/destinations/pexels-miro-alt-176400.jpg',
    name: 'Miro Beach',
  ),
  Destination(
    id: 5,
    image: 'assets/destinations/pexels-pixabay-164041.jpg',
    name: 'Duobe',
  ),
  Destination(
    id: 6,
    image: 'assets/destinations/pexels-tirachard-kumtanom-584302.jpg',
    name: 'Kumtanom',
  ),
];
