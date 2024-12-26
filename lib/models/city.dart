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

final cities = [
  Destination(id: 1, image: 'assets/cities/bandung.jpg', name: 'Bandung'),
  Destination(id: 2, image: 'assets/cities/bogor.jpg', name: 'Bogor'),
  Destination(id: 3, image: 'assets/cities/denpasar.jpg', name: 'Denpasar'),
  Destination(id: 4, image: 'assets/cities/jakarta.jpg', name: 'Jakarta'),
  Destination(id: 5, image: 'assets/cities/sukabumi.jpg', name: 'Sukabumi'),
  Destination(id: 6, image: 'assets/cities/surabaya.jpg', name: 'Surabaya'),
];
