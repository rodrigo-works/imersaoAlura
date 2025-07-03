# Use a imagem oficial do Python na versão 3.13.5 com base no Alpine Linux 3.22, que é uma distribuição leve.
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requisitos para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências do projeto, sem usar cache para garantir as versões mais recentes.
RUN pip install --no-cache-dir -r requirements.txt

# Copia restante do código
COPY . .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]