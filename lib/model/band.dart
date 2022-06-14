class Band {
  String id;
  String name;
  int votes;

  Band({
    required this.id,
    required this.name,
    required this.votes,
  });

  factory Band.fromMap(Map<String, dynamic> object) => Band(
        id: object['id'],
        name: object['name'],
        votes: object['votes'],
      );
}
