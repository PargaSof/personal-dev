import csv
import re

# Open csv file and store it in a variable
file = open('OCUSMA.csv')
csv_file = csv.reader(file)
# if csv has header, skip
next(csv_file)

# create the list for storing column names
colnames = []

# For each row of the CSV file , grab the 2nd column
for row in csv_file:
	# replace special chars with space
	clean_row = re.sub(r"[-,(,),/,&]+"," ",row[1])
	colnames.append(clean_row)

# follows the block of code that creates friendly names
for col in colnames:
	new = col.split()
	newlist = []

	for word in new:
		# remove spaces
		nospaces = word.replace(' ','')
		# capitalize
		nospchcap = nospaces.capitalize()
		newlist.append(nospchcap)
		
	friendlyname = ''.join(newlist)
	print(friendlyname)