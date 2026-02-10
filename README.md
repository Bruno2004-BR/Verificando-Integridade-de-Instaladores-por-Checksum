# Verificando-Integridade-de-Instaladores-por-Checksum
Passo a passo de como validar a integridade de um arquivo comparando o "hash local" com o "hash oficial" (publicado pelo fabricante).

## Sprint 1 - Atividade prática: Verificação de integridade de instaladores por checksum

Disciplina: Criptografia Aplicada à Segurança Cibernética

Professor: Hebert de Oliveira Silva

Aluno: Bruno Martiliano Ferreira da Silva

Data: 09/02/2026 à 10/02/2026

## 1.0. Preparando a pasta de trabalho para a Atividade.

### 1.1. Criando a Pasta:
<img width="592" height="162" alt="image" src="https://github.com/user-attachments/assets/cede9605-d73a-4e3d-be6b-9622644e7f69" />

### 1.2. Entrando na Pasta Criada:
<img width="425" height="176" alt="image" src="https://github.com/user-attachments/assets/edbedb77-fdb3-46e4-b11b-937cfe8c4eb0" />

### 1.3. Verificando Pasta Criada:
<img width="494" height="130" alt="image" src="https://github.com/user-attachments/assets/a08d74e3-9b92-4521-96e5-49fe84116943" />

## 2.0. Baixando o Instalador.
### Instalando o Firefox, com sua url oficial:
<img width="730" height="266" alt="image" src="https://github.com/user-attachments/assets/21df0e9c-e520-456b-ad85-e87dc9bb9137" />

## 2.1. Verificando Instalador Instalado:
### ls -lh
<img width="640" height="104" alt="image" src="https://github.com/user-attachments/assets/16c220e2-0458-4697-9cee-64c011ef4af8" />

### file instalador.bin
<img width="750" height="66" alt="image" src="https://github.com/user-attachments/assets/dc2f5ba2-756c-4f05-b2c1-238a5476cf66" />

## 3.0. Gerando checksum local (SHA-256 e SHA-512).
### Gerando SHA-256:
<img width="752" height="69" alt="image" src="https://github.com/user-attachments/assets/dded31c1-94aa-4384-a4fa-9fc3f147acce" />

### Gerando SHA-512:
<img width="766" height="80" alt="image" src="https://github.com/user-attachments/assets/8d813fd2-4b4c-4f48-9db7-c9efa33fc7bf" />

## 3.1. Salvando os hashes em um arquivo:
<img width="772" height="49" alt="image" src="https://github.com/user-attachments/assets/a7df1adb-b393-433a-82e4-5f1e1aaff762" />

## 3.2. Verificando se os hashes foram salvos:
### sha256sum
<img width="751" height="82" alt="image" src="https://github.com/user-attachments/assets/c75a739f-0f6a-4711-80c2-e625c192f3ee" />

### sha512sum
<img width="751" height="90" alt="image" src="https://github.com/user-attachments/assets/b595f68d-af41-4a2c-8a46-3acdcf6fbecd" />

## 4.0. Capturando o checksum oficial no navegador Firefox.
### 4.1. Encontrando a Hash Oficial no Site:
<img width="852" height="223" alt="image" src="https://github.com/user-attachments/assets/fd720fa4-8ab4-4b08-a13b-6d9c486caec5" />

## 4.2. Colando dentro do arquivo “hash.oficial.sha512”:
<img width="786" height="303" alt="image" src="https://github.com/user-attachments/assets/3fdc12e8-e637-4c98-9b7c-faebc18435ca" />

## 4.3. Acessando o Arquivo:
<img width="394" height="65" alt="image" src="https://github.com/user-attachments/assets/a480b220-75df-4dc6-b034-fe7abbaea854" />

### Colando no Formato “bin”:
<img width="862" height="89" alt="image" src="https://github.com/user-attachments/assets/b86aa879-f258-4c66-836e-3c1e009f347e" />

## 5.0. Comparando as Hashes Automaticamente:
### Na comparação automática deu “MISMATCH”, as hashes não estão iguais:
<img width="844" height="106" alt="image" src="https://github.com/user-attachments/assets/c19f72cb-c1e9-49e8-8751-ecc2336b3a16" />

## 5.1. Usando Validação Padrão para Comparação:
<img width="614" height="103" alt="image" src="https://github.com/user-attachments/assets/6e010ed0-605e-4eb9-8ef4-2003fe16754b" />

## 6.0. Testando Integridade - Simulando Falha.
### Fazendo uma alteração mínima no arquivo para ver como o hash muda:
<img width="863" height="182" alt="image" src="https://github.com/user-attachments/assets/b6abb4da-2fda-4048-91c0-f6f2c203e2f1" />

## 7.0. Checksum Protege Contra Adulteração.
O “checksum” protege contra adulteração pelos seguintes motivos:

* Detecção de Alterações Mínimas: O sistema consegue reconhecer alterações mínimas no arquivo. Nesta atividade, uma pequena modificação gerou um hash totalmente distinto do original.

* Verificação de Integridade: A comparação do hash gerado localmente com o hash oficial disponibilizado pelo navegador , por exemplo o da atividade, o "Firefox", permitiu verificar se o arquivo foi alterado durante o download ou por terceiros.

* Identificação de Falhas "MISMATCH": Caso o arquivo esteja corrompido ou modificado, a validação padrão "sha512sum -c" retornará um erro, sinalizando que o "checksum" calculado difere do esperado.

Portanto pude concluir que, o "checksum" atua como uma "impressão digital" exclusiva. Qualquer modificação no conteúdo do arquivo altera essa impressão, notificando o usuário de que o instalador não é mais autêntico.

## 8.0. Perguntas para Reflexão, após Passo a Passo Concluído.

### Por que SHA-256 é preferido a MD5?
Apesar deste relatório enfatizar o uso de SHA-256 e SHA-512, esses algoritmos são preferidos em relação a versões mais antigas, como o MD5, por oferecerem maior resistência a colisões e ataques de força bruta, gerando uma "impressão digital" muito mais sólida e difícil de falsificar.

### O checksum garante que o arquivo é “seguro”? O que ele garante exatamente?
O que ele assegura: Ele assegura exclusivamente a integridade e a autenticidade em relação à origem. Em outras palavras, assegura que o arquivo que possui é idêntico ao que o fabricante do instalador forneceu, sem modificações acidentais ou mal-intencionadas ao longo do percurso.

O que ele "NÃO" assegura: Ele não assegura que o arquivo seja profundamente "seguro" ou "livre de vírus". Caso um desenvolvedor mal-intencionado crie um vírus e produza um "checksum" para ele, esse "checksum" apenas confirmará que o vírus não foi modificado, sem garantir que ele seja inofensivo.

### Qual é a limitação de confiar no checksum “do site”, se o site for comprometido?
A principal limitação é que, frequentemente, o "checksum" e o instalador utilizam o mesmo canal de segurança. Caso um invasor consiga acessar o servidor da Mozilla (mencionado no passo a passo), ele tem a capacidade de alterar tanto o arquivo "instalador.bin" quanto o valor do "hash" apresentado no site. Nesse cenário, a comparação automática resultaria em "MATCH", apesar de o arquivo estar adulterado.

### Qual melhoria você adotaria para aumentar a confiança (ex.: assinatura PGP)?
A adoção de assinaturas digitais, como "PGP/GPG", seria a solução ideal para mitigar a falha identificada durante o passo a passo. Em comparação com o "checksum" padrão:

* Uma chave privada vincula a assinatura à identidade do desenvolvedor.

* Ainda que o site seja comprometido, o invasor não seria capaz de criar uma assinatura válida sem a chave privada do autor.

* Isso acrescenta uma camada de "não-repúdio", comprovando que o arquivo realmente se originou de quem afirma ser e não apenas que ele está "idêntico ao do site".


# Obrigado por acompanhar esse Passo a Passo de Verificação de "Hashes"
<img width="226" height="52" alt="image" src="https://github.com/user-attachments/assets/341f15d5-4c15-4912-8b98-b7dea87fcaee" />

























