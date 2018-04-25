#!/usr/bin/env python3

import MySQLdb
import sys
import io
import operator
import getopt
import shutil
import os
from html.parser import HTMLParser


stop_tags = ['h1', 'h2', 'h3', 'p', 'dt', 'dd', 'blockquote']
empty_tags = ['area','base','br','col','embed','hr','img','input',
			  'link','meta','param','source','track','wbr']

class MyHTMLParser(HTMLParser):
	'''
	def __init__(self):
		self.tag_stack = []
		super(HTMLParser,self).__init__()
	'''
	def handle_starttag(self, tag, attrs):
			if tag not in empty_tags:
				self.tag_stack.append(tag)
			pass

	def handle_endtag(self, tag):
		if tag in empty_tags:
			return
		ended_tag = self.tag_stack[-1]
		if ended_tag != tag:
			print("TAG MISMATCH: %s != %s"%(ended_tag,tag))
		else:
			self.tag_stack.pop()        
		if ended_tag in stop_tags:
			self.content.append({'tag':ended_tag,'content':self.current.strip('\n')})
			self.current = ""
			# print()
		# print("Encountered an end tag :", tag)
		pass

	def handle_data(self, data):
		ts = self.tag_stack
		current_tag = ts[-1] if len(ts) > 0 else ''
		if ('body' in ts and
			('p' in ts or 'dl' in ts or
			 #'h1' in ts or 'h2' in ts or 'h3' in ts or
			 'blockquote' in ts)):
			self.current += data
		# print("%s"%(data), end='')

class Node:
	def __init__ (self,tag,content):
		self.tag = tag
		self.content = content
		self.children = []

	def add_child(self,child):
		self.children.append(child)

	def add_child_verbose(self,child):
		print("Add %s to %s"%(child,self.content))
		self.add_child(child)

	def print_node(self):
		print(self.tag)
		print(self.content)



def filter(output_directory):
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

		# in_file_path = os.path.join(input_directory, r +".txt")
		out_file_path = os.path.join(output_directory, r +".txt")
		if not (os.path.isfile(out_file_path)):
		# copy original parsed version
		# file_path = os.path.join(input_directory, r +".txt")
		# # only copy file if it exists in parsed cards directory
		# if (os.path.isfile(file_path)):
		# 	shutil.copy(file_path, output_directory)
		# 	files_copied += 1
			print(out_file_path)
		# reparse link
			try:
				dir1 = "/data/corpora/newaan0/raw_html2/" + r + "/" + os.listdir("/data/corpora/newaan0/raw_html2/" + r)[0]
				myfile = dir1 + "/" + os.listdir(dir1)[0]
				# f = urllib.urlopen(url)
				f = open(myfile, "r")
				h = f.read().decode('utf-8')
			
				parser = MyHTMLParser()
				parser.tag_stack = []
				parser.content = []
				parser.current = ""
				parser.feed(h)

				tree = []
				node_stack = []    
				# print tags
				for block in parser.content:
					# make node
					node = Node(block['tag'],block['content'])

					# empty node stack => add to top level tree
					if len(node_stack) == 0:
						node_stack.append(node)
						tree.append(node)
						continue
					
					# compare to previous tag in stack
					tag = stop_tags.index(block['tag'])
					while True:
						prev = node_stack.pop()    
						prev_tag = stop_tags.index(prev.tag)
						if tag > prev_tag or len(node_stack) == 0:
							node_stack.append(prev)
							break
					if len(node_stack) > 0:
						node_stack[-1].add_child(node)
					else:
					#    print("appended to tree!")
						tree.append(node)
					node_stack.append(node)

				f = open(out_file_path,'w+')
				for n in tree:
					print_tree(n,0, f)
				f.close()
			except Exception:
			 	pass
		# elif not (os.path.isfile(in_file_path)): 
		# 	print in_file_path + "not in directory"
		# else:
		# 	print "file exists"




		# else:
		# 	print "card does not exist: " + file_path

	# Note: the number of files in the resulting directory is less than the files_copied indicator,
	# due to same card used for different topics.
	print(len(html_list), files_copied)


def print_tree(tree,indentation,filename):		
	content = tree.content
	filename.write("\n")
	# if len(tree.content) > 50:
	#     content = content[:50] + "..."
	filename.write(content.encode('utf-8'))
	for c in tree.children:
		print_tree(c,indentation + 2, filename)

def print_usage():
	print ("usage: " + sys.argv[0] + "-o output_directory")


# input_directory = None
output_directory = None
try:
	opts, args = getopt.getopt(sys.argv[1:], 'o:')
except (getopt.GetoptError, err):
	usage()
	sys.exit(2)
for o, a in opts:
	# if o == '-i':
	# 	input_directory = a
	if o == '-o':
		output_directory = a
	else:
		assert False, "unhandled option"
if (output_directory== None):
	print_usage()
	sys.exit(2)



filter(output_directory)

