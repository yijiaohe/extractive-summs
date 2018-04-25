#!/usr/bin/python3

import MySQLdb
import sys
import io
import operator
import getopt
import shutil
import os

def filter(input_directory, output_directory):
	db = MySQLdb.connect("")

	# prepare a cursor object using cursor() method
	cursor = db.cursor()

	# only use cards that have not been dropped
	sql = "SELECT resource_id, card_id from resources_annotations where score >= 0"
	cursor.execute(sql)
	card_list = cursor.fetchall()

	db.close()

	files_copied = 0
	for card in card_list:
		r = str(int(card[0]))
		c = str(int(card[1]))
		file_path = os.path.join(input_directory, r + "-" + c +".txt")
		# only copy file if it exists in parsed cards directory
		if (os.path.isfile(file_path)):
			shutil.copy(file_path, output_directory)
			files_copied += 1

		# else:
		# 	print "card does not exist: " + file_path

	# Note: the number of files in the resulting directory is less than the files_copied indicator,
	# due to same card used for different topics.
	print len(card_list), files_copied




def print_usage():
    print ("usage: " + sys.argv[0] + "-i input_directory" + "-o output_directory")


input_directory = None
output_directory = None
try:
    opts, args = getopt.getopt(sys.argv[1:], 'i:o:')
except (getopt.GetoptError, err):
    usage()
    sys.exit(2)
for o, a in opts:
    if o == '-i':
        input_directory = a
    elif o == '-o':
        output_directory = a
    else:
        assert False, "unhandled option"
if (input_directory== None or output_directory== None):
    print_usage()
    sys.exit(2)



filter(input_directory, output_directory)

