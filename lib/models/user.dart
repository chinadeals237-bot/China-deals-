class AppUser {
  final String uid;
  final String nom;
  final String prenom;
  final String email;
  final String statut;
  final String role;

  AppUser({
    required this.uid,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.statut,
    required this.role,
  });

  factory AppUser.fromMap(String uid, Map<String, dynamic> data) {
    return AppUser(
      uid: uid,
      nom: data['nom'] ?? '',
      prenom: data['prenom'] ?? '',
      email: data['email'] ?? '',
      statut: data['statut'] ?? 'Standard',
      role: data['role'] ?? 'standard',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'statut': statut,
      'role': role,
    };
  }
}