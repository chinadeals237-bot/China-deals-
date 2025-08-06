class Task {
  final String id;
  final String jour;
  final String produit;
  final String description;
  final int prix;
  final String assignedTo;
  final bool vendu;

  Task({
    required this.id,
    required this.jour,
    required this.produit,
    required this.description,
    required this.prix,
    required this.assignedTo,
    required this.vendu,
  });

  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id,
      jour: data['jour'] ?? '',
      produit: data['produit'] ?? '',
      description: data['description'] ?? '',
      prix: data['prix'] ?? 0,
      assignedTo: data['assignedTo'] ?? '',
      vendu: data['vendu'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jour': jour,
      'produit': produit,
      'description': description,
      'prix': prix,
      'assignedTo': assignedTo,
      'vendu': vendu,
    };
  }
}