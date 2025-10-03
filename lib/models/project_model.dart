class Project {
  final int id;
  final String nome;
  final String descricao;
  final String dataInicio;
  final String dataFim;
  final String status;
  final String? imagem;

  Project({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.dataInicio,
    required this.dataFim,
    required this.status,
    this.imagem,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    print('Processando projeto: $json');
    return Project(
      id: json['id'] ?? 0,
      nome: json['nome'] ?? json['name'] ?? '',
      descricao: json['descricao'] ?? json['description'] ?? '',
      dataInicio: json['dataInicio'] ?? json['data_inicio'] ?? json['startDate'] ?? '',
      dataFim: json['dataFim'] ?? json['data_fim'] ?? json['endDate'] ?? '',
      status: json['status'] ?? '',
      imagem: json['imagem'] ?? json['image'],
    );
  }
}