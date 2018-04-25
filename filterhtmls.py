#!/usr/bin/env python3

import MySQLdb
import sys
import io
import operator
import getopt
import shutil
import os



def filter(input_directory, output_directory):
	db = MySQLdb.connect("localhost","clair","cfhoCPkr","aan" )

	# prepare a cursor object using cursor() method
	cursor = db.cursor()

	# only use cards that have not been dropped
	sql = "SELECT id, txtpath, url from resources0"
	cursor.execute(sql)
	html_list = cursor.fetchall()

	db.close()

	if not os.path.exists(output_directory):
		os.makedirs(output_directory)

	files_copied = 0
	for html in html_list:
		textpath = str(html[1])
		if textpath == '':
			continue
		if (textpath[0] != 'u'):
			continue
		r = str(int(html[0]))
		url = str(html[2])

		# copy original parsed version
		file_path = os.path.join(input_directory, r +".txt")
		# only copy file if it exists in parsed cards directory
		if (os.path.isfile(file_path)):
			shutil.copy(file_path, output_directory)
			files_copied += 1

		else:
			print "resource does not exist: " + file_path

	# Note: the number of files in the resulting directory is less than the files_copied indicator,
	# due to same card used for different topics.
	print(len(html_list), files_copied)



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