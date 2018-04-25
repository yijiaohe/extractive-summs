for f in *.pdf
do
    echo pdfsplit `basename "$f"`
    mkdir `basename "$f" .pdf`
    cp "$f" `basename "$f" .pdf`
    cd `basename "$f" .pdf`
    java -jar /data0/projects/aan/scripts/pdfbox-app-1.6.0.jar PDFSplit -split 1 "$f"
    rm "$f"
    cd ..
done