#!/usr/bin/python
import sys
import operator
import getopt
import codecs
import os
from gensim.summarization import summarize



def summ_it(results_file, input_directory, output_directory):
	total = 0
	
	##############
	# make all resulting cards into one document for summary
	result_file = codecs.open(results_file, encoding='utf-8')
	result_list = result_file.read().splitlines()
	result_file.close()

	file_list = []
	topic_list = []
	print result_list
	for i in range(len(result_list)):
		items = result_list[i].split("\t")
		if items[0] not in topic_list:
			topic_list.append(items[0])
			file_list.append([str(items[2] + ".txt")])
		else:
			file_list[len(topic_list)-1].append(str(items[2] + ".txt"))
	print file_list

	# for i in range(len(result_list)):
	# 	items = result_list[i].split("\t")
		
	# 	file_list.append(str(items[2] + ".txt"))
	# print file_list

	if not os.path.exists(output_directory):
		os.makedirs(output_directory)

	for i in range(len(topic_list)):
		aggregate = os.path.join(output_directory, topic_list[i]+".agg")
		with open(aggregate, 'w') as fw:
			for file in file_list[i]:
				file_path = os.path.join(input_directory,file)
				print file_path
				f = open(file_path, 'r').readlines()
				for line in f:
					fw.write(line[:-1])
				fw.write("\n")
	################
	
		with open(aggregate, 'r') as f1:
			summ = summarize(unicode(f1.read().replace('\n',' '), errors='ignore'), word_count=300)
			result_path = os.path.join(output_directory, topic_list[i])
			if not os.path.exists(result_path):
				os.makedirs(result_path)
			with open(os.path.join(result_path,"gensim.summ"), 'w') as fw1:
				fw1.writelines(summ)
				fw1.writelines("\n")
				total += len(summ)

	   



		# with open(file_path, 'r') as f:
		#     summ = summarize(unicode(f.read().replace('\n',' '), errors='ignore'), word_count=75)
		#     with open(os.path.join(output_directory, file), 'w') as fw:
		#         fw.writelines(summ)
		#         total += len(summ)
	########################



def print_usage():
	print ("usage: " + sys.argv[0] + "-r results_file -i input_directory" + "-o output_directory")



results_file = None
input_directory = None
output_directory = None

#opts, args = getopt.getopt(sys.argv[1:], 'r:i:o:')
try:
	opts, args = getopt.getopt(sys.argv[1:], 'r:i:o:')
except (getopt.GetoptError, err):
	usage()
	sys.exit(2)
for o, a in opts:
	if o == '-i':
		input_directory = a
	elif o == '-r':
		results_file = a
	elif o == '-o':
		output_directory = a
	else:
		assert False, "unhandled option"
if (results_file == None or input_directory== None or output_directory== None):
	print_usage()
	sys.exit(2)

summ_it(results_file, input_directory, output_directory)
