#!/usr/bin/python

import getopt
import operator
import sys
import io
import codecs
import nltk
import os
import numpy as np


def evaluate(results_directory,gs_directory):

	path2model = results_directory
	path2gold = gs_directory

	files = os.listdir(path2model)

	bleu_scores = []
	for i in files:
		reference = []
		gold_summ = os.listdir(path2gold)
		with open(path2model + '/' + i,'r') as fmodel:
			textmodel = fmodel.read()
			fmodel.close()
		for j in gold_summ:
			with open(path2gold +"/"+ j,'r') as fgold:    
				textgold = fgold.read()
				fgold.close()
			reference.append(textgold)
		   
		
		bleu_scores.append(nltk.translate.bleu_score.sentence_bleu(reference, textmodel, weights=[0.4,0.3,0.2]))

	# print np.mean(bleu_scores)
	# print np.std(bleu_scores)
	# print bleu_scores

	with open("/data/corpora/newaan0/Yijiao/evaluations/bleuresults.GS",'a') as fw:
		result_type = os.path.abspath(os.path.join(results_directory, os.pardir))
		fw.write(result_type + "\n")
		fw.write(gold_summ[0][:-1] + "\n")
		fw.write("mean: " + str(np.mean(bleu_scores)) + "\n")
		fw.write("std: " + str(np.std(bleu_scores)) + "\n")
		fw.write(str(bleu_scores) + "\n\n")







def print_usage():
	print ("usage: " + sys.argv[0] + "-r results_files_directory -g gold_standards_directory")


results_directory = None
gs_directory = None




opts, args = getopt.getopt(sys.argv[1:], 'r:g:')

for o, a in opts:
	if o == '-r':
		results_directory = a
	elif o == '-g':
		gs_directory = a
	else:
		assert False, "unhandled option"
if (results_directory == None or gs_directory== None):
	print_usage()
	sys.exit(2)

evaluate(results_directory, gs_directory)






