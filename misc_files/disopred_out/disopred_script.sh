
FASTA_DIR=$1
DISOPRED_CMD=$2

for f in $FASTA_DIR/*.fasta; do
    echo "Running DISOPRED for $f"
    ./$DISOPRED_CMD $f
done
