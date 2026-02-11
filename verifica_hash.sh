%%bash

# 1. Validar se os 3 parâmetros foram passados
if [ "$#" -ne 3 ]; then
    echo "Erro: Parâmetros insuficientes."
    echo "Uso: ./verifica_hash.sh <arquivo> <algoritmo> <hash_oficial>"
    exit 1
fi

FILE=$1       # Caminho do arquivo
ALGO=$2       # Algoritmo (sha256 ou sha512)
OFFICIAL=$3   # Hash oficial para comparação

# 2. Verificar se o arquivo existe
if [ ! -f "$FILE" ]; then
    echo "Erro: Arquivo '$FILE' não encontrado."
    exit 1
fi

# 3. Calcular o hash local baseado no algoritmo escolhido
case $ALGO in
    sha256)
        LOCAL_HASH=$(sha256sum "$FILE" | cut -d ' ' -f 1)
        ;;
    sha512)
        LOCAL_HASH=$(sha512sum "$FILE" | cut -d ' ' -f 1)
        ;;
    *)
        echo "Erro: Algoritmo inválido. Use sha256 ou sha512."
        exit 1
        ;;
esac

# 4. Comparar com o hash oficial e imprimir resultado
if [ "$LOCAL_HASH" == "$OFFICIAL" ]; then
    echo "MATCH"
    exit 0
else
    echo "MISMATCH"
    exit 1
fi