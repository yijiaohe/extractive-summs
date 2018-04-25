#!/usr/bin/python

import MySQLdb
import codecs
import sys
import io
import timeit
import operator
import getopt
import os

RECORD_TIME = False
SCORE_SET = 2 

def GSresults(queries_file, output_file, check_directory):
    # Open database connection

    db = MySQLdb.connect("localhost","clair","cfhoCPkr","aan" )

    # prepare a cursor object using cursor() method
    cursor = db.cursor()

    # open the file of queries
    query_file = codecs.open(queries_file, encoding='utf-8')
    out_file = open(output_file, 'w')

    # create list of topics and topic ids
    queries_list = query_file.read().splitlines()
    tid_list = [];
    for i in range(len(queries_list)):
        query = queries_list[i]
        sql = "SELECT id from topics_to_annotate where topic = '%s'" % (query)
        cursor.execute(sql)
        tid = cursor.fetchone()
        tid_list.append(int(tid[0]))
    print tid_list

    # retrieve all cards that are relevant to topics
    for i in range(len(tid_list)):
        # print "tid_list[i]:" + str(tid_list[i])
        sql = "SELECT resource_id, card_id, score from resources_annotations where topic_id = '%d' and score >= %d" % (tid_list[i], SCORE_SET)
        cursor.execute(sql)
        results_list = cursor.fetchall()
        for j in range(len(results_list)):
            r = str(int(results_list[j][0]))
            c = str(int(results_list[j][1]))
            file_path = os.path.join(check_directory, r + "-" + c +".txt")
            # print file_path
            if (os.path.isfile(file_path)):
                out_file.write(str(i+1).zfill(2)+"\t0"+'\t'+r+'-'+c+'\t1')

                if (j != len(results_list) - 1):                
                    out_file.write('\n')
                print "written"
            else:
                print "file not in directory: " + file_path

        print "topic " + str(i + 1) + "done"
        if (i != len(tid_list) - 1 and os.path.isfile(file_path)):
            out_file.write('\n')


    query_file.close()
    out_file.close()
    # disconnect from server
    db.close()




def print_usage():
    print ("usage: " + sys.argv[0] + "-q file-of-queries -o output_file -i input-directory")



queries_file = None
output_file = None
check_directory = None
try:
    opts, args = getopt.getopt(sys.argv[1:], 'q:o:i:')
except (getopt.GetoptError, err):
    usage()
    sys.exit(2)
for o, a in opts:
    if o == '-q':
        queries_file = a
    elif o == '-o':
        output_file = a
    elif o == '-i':
        check_directory = a
    else:
        assert False, "unhandled option"
if (queries_file == None or output_file == None or check_directory == None):
    print_usage()
    sys.exit(2)

if (RECORD_TIME): start = timeit.default_timer()                    # start time
GSresults(queries_file, output_file, check_directory)   # call the search engine on queries
if (RECORD_TIME): stop = timeit.default_timer()                     # stop time
if (RECORD_TIME): print ('Querying time:' + str(stop - start)) # print time taken