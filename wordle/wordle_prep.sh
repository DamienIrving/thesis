#### How to prepare a PDF for wordle creation
#### Ref: http://skipperkongen.dk/2011/09/07/creating-a-word-cloud-from-pdf-documents/


## Step 1: Get the PDF to txt program from the app store

## Step 2: Remove non printable characters

#perl -lpe s/[^[:print:]]+//g manuscript.txt >> clean_manuscript.txt

## Step 3: Manually check (PDF converter struggles with f)

## Step 4: download stopwords file

#curl -o stopwords.txt http://skipperkongen.dk/files/english-stopwords-short.txt

## Step 5: Keep only characters, make them lower case, put each word on a line, remove stopwords and some garbage. Sort them for good measure:

cat clean_manuscript.txt | \
sed 's/[^a-zA-Z]/ /g' | \
tr '[:upper:]' '[:lower:]' | \
tr ' ' '
' | \
sed '/^$/d' | \
sed '/^[a-z]$/d' | \
grep -v -w -f stopwords.txt | \
sort > words.txt

## Step 6: Feed to wordle

