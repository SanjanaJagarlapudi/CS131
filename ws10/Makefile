#put clean in all because it will trigger trimmed to be created as well, because it is a dependancy.
all: clean.csv

#trimmed depends on raw
trimmed.csv: raw.csv
	cut -d',' -f1,3,5 raw.csv > trimmed.csv

#clean depends on trimmed
clean.csv: trimmed.csv #only want to include header and lines with no missing vals in clean
	awk -F',' '($$2 != "" && $$3 != "") || NR==1' trimmed.csv > clean.csv

cleaning_func: #delete both files we made
	rm -f trimmed.csv clean.csv

