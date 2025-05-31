class User {
  final String name;
  final String phone;
  final String email;
  final String? crmv;
  final String cpf;
  final String store;
  final String registrationNumber;
  final String password;
  final String type;

  User({
    required this.name,
    required this.phone,
    required this.email,
    this.crmv,
    required this.cpf,
    required this.store,
    this.registrationNumber = '',
    required this.password,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      crmv: json['crmv'] as String?,
      cpf: json['cpf'] as String,
      store: json['store'] as String,
      registrationNumber: json['registration_number'] as String? ?? '',
      password: json['password'] as String,
      type:
          (() {
            if (json['type'] is int) {
              switch (json['type']) {
                case 0:
                  return 'admin';
                case 1:
                  return 'vet';
                default:
                  return 'user';
              }
            } else {
              return 'Não definido';
            }
          })(),
    );
  }
}
