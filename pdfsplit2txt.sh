for f in *.pdf
do
    echo pdfsplit `basename "$f"`
    mkdir `basename "$f" .pdf`
    cp "$f" `basename "$f" .pdf`
    cd `basename "$f" .pdf`
    java -jar /data0/projects/aan/scripts/pdfbox-app-1.6.0.jar PDFSplit -split 1 "$f"
    rm "$f"
    for f1 in *.pdf
    do
    	echo pdf2txt `basename "$f"`
    	java -jar /data0/projects/aan/scripts/pdfbox-app-1.6.0.jar ExtractText -encoding ASCII -force "$f1" "`basename "$f1" .pdf`.txt"
    done
    cd ..
done