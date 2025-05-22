# Spotifei 🎵

Projeto desenvolvido em Java com interface gráfica (Swing) e PostgreSQL.

---

## ✅ Funcionalidades

- **Login e Cadastro de Usuários**
- **Buscar músicas** por nome (com LIKE)
- **Curtir e Descurtir músicas**
- **Gerenciar Playlists**
  - Criar, editar, excluir playlists
  - Adicionar e remover músicas
- **Visualizar Histórico**
  - Últimas 10 músicas buscadas
  - Músicas curtidas
  - Músicas descurtidas

---

## 🛠️ Tecnologias Utilizadas

- Java (JDK 8)
- PostgreSQL
- JDBC (Java Database Connectivity)
- Interface gráfica com Swing (NetBeans GUI Builder)
- MVC (Model-View-Controller)

---

## 🚀 Como Executar

1. **Clone o repositório**

   ```bash
   git clone https://github.com/seu-usuario/spotifei.git
2. Importe o projeto no Netbeans
3. Configure a conexão com o banco
   - O banco é local
   - Execute o script sqlSpotifei.sql na pasta src no pgAdmin para criar as tabelas e registros.
     ```bash
            Connection conexao = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/spotifei", 
                    "seu_usuario", "sua_senha");
4. Execute pelo Netbeans ou:
   ```bash
   cd dist
    java -jar Spotifei2.jar

---

## 🎥 Link do video:
https://www.youtube.com/watch?v=khtiy49VkeI

---

### Autor
- José Reginaldo de Lima Junior
- RA: 24.124.017-5
