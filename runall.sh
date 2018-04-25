#!/bin/bash

while getopts ":iteahk" opt; do
    case $opt in
	    i)  
	        python /rrsearch/search.py -d /rrsearch/dictfile -p /rrsearch/postingsfile -q /rrsearch/queries -o /rrsearch/cardsoutput -i /filteredcards
		    echo "information retrieval cardsoutput generated"
	 	    python /rrsearch/GSresults.py -q /rrsearch/queries -o /rrsearch/cardsGSresults.qrels -i /filteredcards
	 	    echo "cardsresults.qrels generated"
	        python /rrsearch/wholesearch.py -d /rrsearch/newhtmldict -p /rrsearch/newhtmlpostings -q /rrsearch/queries -o /rrsearch/newhtmlsoutput -i /reparsedhtmls2
		    echo "information retrieval htmlsoutput generated"
	 	    python /rrsearch/wholeGSresults.py -q /rrsearch/queries -o /rrsearch/newhtmlsGSresults.qrels -i /reparsedhtmls2
	 	    echo "htmlsGSresults.qrels generated"
	        python /rrsearch/wholesearch.py -d /rrsearch/newcombineddict -p /rrsearch/newcombinedpostings -q /rrsearch/queries -o /rrsearch/newcombinedoutput -i /combinedresources2
		    echo "information retrieval combinedoutput generated"
	 	    python /rrsearch/wholeGSresults.py -q /rrsearch/queries -o /rrsearch/combinedGSresults.qrels -i /combinedresources2
	 	    echo "combinedGSresults.qrels generated"
	  	;;
		t)
			trec_eval /rrsearch/cardsGSresults.qrels /rrsearch/cardsoutput # > /evaluations/trecresults.cards
			echo "trec_eval cards performed"
			# trec_eval /rrsearch/htmlsGSresults.qrels /rrsearch/newhtmlsoutput # > /evaluations/trecresults.htmls
			# echo "trec_eval htmls performed"
			trec_eval /rrsearch/combinedGSresults.qrels /rrsearch/newcombinedoutput # > /evaluations/trecresults.combined
			echo "trec_eval combined performed"
			;;
		e)
			echo "combined"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/01 -g /manual_summaries_reorg/dependency_parsing/
			echo "evaluation performed using bleu 01"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/02 -g /manual_summaries_reorg/named_entity_recognition/
			echo "evaluation performed using bleu 02"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/03 -g /manual_summaries_reorg/summarization/
			echo "evaluation performed using bleu 03"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/04 -g /manual_summaries_reorg/sentiment_analysis/
			echo "evaluation performed using bleu 04"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/05 -g /manual_summaries_reorg/coreference_resolution/
			echo "evaluation performed using bleu 05"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/06 -g /manual_summaries_reorg/topic_models/
			echo "evaluation performed using bleu 06"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newcombined/07 -g /manual_summaries_reorg/word_sense_disambiguation/
			echo "evaluation performed using bleu 07"
			########
			echo "htmls"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/01 -g /manual_summaries_reorg/dependency_parsing/
			echo "evaluation performed using bleu 01"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/02 -g /manual_summaries_reorg/named_entity_recognition/
			echo "evaluation performed using bleu 02"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/03 -g /manual_summaries_reorg/summarization/
			echo "evaluation performed using bleu 03"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/04 -g /manual_summaries_reorg/sentiment_analysis/
			echo "evaluation performed using bleu 04"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/05 -g /manual_summaries_reorg/coreference_resolution/
			echo "evaluation performed using bleu 05"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/06 -g /manual_summaries_reorg/topic_models/
			echo "evaluation performed using bleu 06"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/newhtmls/07 -g /manual_summaries_reorg/word_sense_disambiguation/
			echo "evaluation performed using bleu 07"
			#######
			echo "cards"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/01 -g /manual_summaries_reorg/dependency_parsing/
			echo "evaluation performed using bleu 01"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/02 -g /manual_summaries_reorg/named_entity_recognition/
			echo "evaluation performed using bleu 02"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/03 -g /manual_summaries_reorg/summarization/
			echo "evaluation performed using bleu 03"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/04 -g /manual_summaries_reorg/sentiment_analysis/
			echo "evaluation performed using bleu 04"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/05 -g /manual_summaries_reorg/coreference_resolution/
			echo "evaluation performed using bleu 05"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/06 -g /manual_summaries_reorg/topic_models/
			echo "evaluation performed using bleu 06"
			python /evaluations/bleu.py -r /extractivesumm/outputs/rr/cards/07 -g /manual_summaries_reorg/word_sense_disambiguation/
			echo "evaluation performed using bleu 07"
			
			##################
			echo "combined"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/01 -g /manual_summaries_reorg/dependency_parsing/
			echo "evaluation performed using bleu 01"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/02 -g /manual_summaries_reorg/named_entity_recognition/
			echo "evaluation performed using bleu 02"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/03 -g /manual_summaries_reorg/summarization/
			echo "evaluation performed using bleu 03"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/04 -g /manual_summaries_reorg/sentiment_analysis/
			echo "evaluation performed using bleu 04"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/05 -g /manual_summaries_reorg/coreference_resolution/
			echo "evaluation performed using bleu 05"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/06 -g /manual_summaries_reorg/topic_models/
			echo "evaluation performed using bleu 06"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newcombined/07 -g /manual_summaries_reorg/word_sense_disambiguation/
			echo "evaluation performed using bleu 07"
			########
			echo "htmls"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/01 -g /manual_summaries_reorg/dependency_parsing/
			echo "evaluation performed using bleu 01"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/02 -g /manual_summaries_reorg/named_entity_recognition/
			echo "evaluation performed using bleu 02"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/03 -g /manual_summaries_reorg/summarization/
			echo "evaluation performed using bleu 03"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/04 -g /manual_summaries_reorg/sentiment_analysis/
			echo "evaluation performed using bleu 04"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/05 -g /manual_summaries_reorg/coreference_resolution/
			echo "evaluation performed using bleu 05"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/06 -g /manual_summaries_reorg/topic_models/
			echo "evaluation performed using bleu 06"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/newhtmls/07 -g /manual_summaries_reorg/word_sense_disambiguation/
			echo "evaluation performed using bleu 07"
			#######
			echo "cards"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/01 -g /manual_summaries_reorg/dependency_parsing/
			echo "evaluation performed using bleu 01"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/02 -g /manual_summaries_reorg/named_entity_recognition/
			echo "evaluation performed using bleu 02"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/03 -g /manual_summaries_reorg/summarization/
			echo "evaluation performed using bleu 03"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/04 -g /manual_summaries_reorg/sentiment_analysis/
			echo "evaluation performed using bleu 04"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/05 -g /manual_summaries_reorg/coreference_resolution/
			echo "evaluation performed using bleu 05"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/06 -g /manual_summaries_reorg/topic_models/
			echo "evaluation performed using bleu 06"
			python /evaluations/bleu.py -r /extractivesumm/outputs/GS/cards/07 -g /manual_summaries_reorg/word_sense_disambiguation/
			echo "evaluation performed using bleu 07"
			;;
		a)
			echo "all extractive summarization methods to run"
			echo "filteredcards"
			python /extractivesumm/gensim/summ_gensim.py -r /rrsearch/cardsGSresults.qrels -i /filteredcards/ -o /extractivesumm/outputs/GS/cards
			python /extractivesumm/gensim/summ_gensim.py -r /rrsearch/cardsoutput -i /filteredcards/ -o /extractivesumm/outputs/rr/cards
			echo "gensim done"

			python /extractivesumm/lexrank/summ_lexrank.py -r /rrsearch/cardsGSresults.qrels -i /filteredcards/ -o /extractivesumm/outputs/GS/cards
			python /extractivesumm/lexrank/summ_lexrank.py -r /rrsearch/cardsoutput -i /filteredcards/ -o /extractivesumm/outputs/rr/cards
			echo "lexrank done"

			python /extractivesumm/lsa/summ_lsa.py -r /rrsearch/cardsGSresults.qrels -i /filteredcards/ -o /extractivesumm/outputs/GS/cards
			python /extractivesumm/lsa/summ_lsa.py -r /rrsearch/cardsoutput -i /filteredcards/ -o /extractivesumm/outputs/rr/cards
			echo "lsa done"

			python /extractivesumm/luhn/summ_luhn.py -r /rrsearch/cardsGSresults.qrels -i /filteredcards/ -o /extractivesumm/outputs/GS/cards
			python /extractivesumm/luhn/summ_luhn.py -r /rrsearch/cardsoutput -i /filteredcards/ -o /extractivesumm/outputs/rr/cards
			echo "luhn done"

			python /extractivesumm/pytease/summ_pytease.py -r /rrsearch/cardsGSresults.qrels -i /filteredcards/ -o /extractivesumm/outputs/GS/cards
			python /extractivesumm/pytease/summ_pytease.py -r /rrsearch/cardsoutput -i /filteredcards/ -o /extractivesumm/outputs/rr/cards
			echo "pytease done"
			################
			echo "htmls"
			python /extractivesumm/gensim/summ_gensim.py -r /rrsearch/htmlsGSresults.qrels -i /reparsedhtmls2/ -o /extractivesumm/outputs/GS/newhtmls
			#python /extractivesumm/gensim/summ_gensim.py -r /rrsearch/newhtmlsoutput -i /reparsedhtmls2/ -o /extractivesumm/outputs/rr/newhtmls
			echo "gensim done"

			python /extractivesumm/lexrank/summ_lexrank.py -r /rrsearch/htmlsGSresults.qrels -i /reparsedhtmls2/ -o /extractivesumm/outputs/GS/newhtmls
			#python /extractivesumm/lexrank/summ_lexrank.py -r /rrsearch/newhtmlsoutput -i /reparsedhtmls2/ -o /extractivesumm/outputs/rr/newhtmls
			echo "lexrank done"

			python /extractivesumm/lsa/summ_lsa.py -r /rrsearch/htmlsGSresults.qrels -i /reparsedhtmls2/ -o /extractivesumm/outputs/GS/newhtmls
			#python /extractivesumm/lsa/summ_lsa.py -r /rrsearch/newhtmlsoutput -i /reparsedhtmls2/ -o /extractivesumm/outputs/rr/newhtmls
			echo "lsa done"

			python /extractivesumm/luhn/summ_luhn.py -r /rrsearch/htmlsGSresults.qrels -i /reparsedhtmls2/ -o /extractivesumm/outputs/GS/newhtmls
			#python /extractivesumm/luhn/summ_luhn.py -r /rrsearch/newhtmlsoutput -i /reparsedhtmls2/ -o /extractivesumm/outputs/rr/newhtmls
			echo "luhn done"

			python /extractivesumm/pytease/summ_pytease.py -r /rrsearch/htmlsGSresults.qrels -i /reparsedhtmls2/ -o /extractivesumm/outputs/GS/newhtmls
			#python /extractivesumm/pytease/summ_pytease.py -r /rrsearch/newhtmlsoutput -i /reparsedhtmls2/ -o /extractivesumm/outputs/rr/newhtmls
			echo "pytease done"
			###############
			echo "combined resources"
			python /extractivesumm/gensim/summ_gensim.py -r /rrsearch/combinedGSresults.qrels -i /combinedresources2/ -o /extractivesumm/outputs/GS/newcombined
			#python /extractivesumm/gensim/summ_gensim.py -r /rrsearch/newcombinedoutput -i /combinedresources2/ -o /extractivesumm/outputs/rr/newcombined
			echo "gensim done"

			python /extractivesumm/lexrank/summ_lexrank.py -r /rrsearch/combinedGSresults.qrels -i /combinedresources2/ -o /extractivesumm/outputs/GS/newcombined
			#python /extractivesumm/lexrank/summ_lexrank.py -r /rrsearch/newcombinedoutput -i /combinedresources2/ -o /extractivesumm/outputs/rr/newcombined
			echo "lexrank done"

			python /extractivesumm/lsa/summ_lsa.py -r /rrsearch/combinedGSresults.qrels -i /combinedresources2/ -o /extractivesumm/outputs/GS/newcombined
			#python /extractivesumm/lsa/summ_lsa.py -r /rrsearch/newcombinedoutput -i /combinedresources2/ -o /extractivesumm/outputs/rr/newcombined
			echo "lsa done"

			python /extractivesumm/luhn/summ_luhn.py -r /rrsearch/combinedGSresults.qrels -i /combinedresources2/ -o /extractivesumm/outputs/GS/newcombined
			#python /extractivesumm/luhn/summ_luhn.py -r /rrsearch/newcombinedoutput -i /combinedresources2/ -o /extractivesumm/outputs/rr/newcombined
			echo "luhn done"

			python /extractivesumm/pytease/summ_pytease.py -r /rrsearch/combinedGSresults.qrels -i /combinedresources2/ -o /extractivesumm/outputs/GS/newcombined
			#python /extractivesumm/pytease/summ_pytease.py -r /rrsearch/newcombinedoutput -i /combinedresources2/ -o /extractivesumm/outputs/rr/newcombined
			echo "pytease done"
			;;
		k)
			echo "*****************AFTER SUMMARY*******************"
			echo "-----------on html summaries-----------"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/01/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_01_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/01/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_01_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/01/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_01_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/01/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_01_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/01/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_01_newhtml.keys
			echo "topic 01 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/02/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_02_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/02/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_02_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/02/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_02_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/02/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_02_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/02/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_02_newhtml.keys
			echo "topic 02 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/03/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_03_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/03/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_03_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/03/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_03_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/03/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_03_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/03/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_03_newhtml.keys
			echo "topic 03 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/04/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_04_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/04/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_04_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/04/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_04_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/04/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_04_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/04/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_04_newhtml.keys
			echo "topic 04 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/05/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_05_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/05/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_05_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/05/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_05_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/05/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_05_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/05/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_05_newhtml.keys
			echo "topic 05 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/06/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_06_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/06/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_06_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/06/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_06_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/06/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_06_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/06/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_06_newhtml.keys
			echo "topic 06 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/07/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_07_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/07/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_07_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/07/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_07_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/07/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_07_newhtml.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/07/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_07_newhtml.keys
			echo "topic 07 completed"
			####################################
			echo "-----------on card summaries-----------"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/01/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/01/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/01/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/01/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/01/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_01_card.keys
			echo "topic 01 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/02/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/02/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/02/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/02/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/02/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_02_card.keys
			echo "topic 02 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/03/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/03/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/03/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/03/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/03/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_03_card.keys
			echo "topic 03 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/04/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/04/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/04/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/04/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/04/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_04_card.keys
			echo "topic 04 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/05/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/05/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/05/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/05/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/05/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_05_card.keys
			echo "topic 05 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/06/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/06/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/06/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/06/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/06/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_06_card.keys
			echo "topic 06 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/07/lexrank.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lexrank_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/07/gensim.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/gensim_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/07/lsa.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/lsa_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/07/luhn.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/luhn_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/07/pytease.summ --preprocessing wordlen tag > /evaluations/chowmeinresults/aftersumm/pytease_07_card.keys
			echo "topic 07 completed"
			############################
			echo "-----------on GS card summaries-----------"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/01/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/01/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/01/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/01/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/01/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_01_card.keys
			echo "topic 01 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/02/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/02/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/02/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/02/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/02/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_02_card.keys
			echo "topic 02 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/03/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/03/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/03/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/03/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/03/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_03_card.keys
			echo "topic 03 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/04/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/04/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/04/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/04/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/04/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_04_card.keys
			echo "topic 04 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/05/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/05/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/05/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/05/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/05/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_05_card.keys
			echo "topic 05 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/06/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/06/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/06/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/06/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/06/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_06_card.keys
			echo "topic 06 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/07/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/07/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/07/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/07/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/07/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_07_card.keys
			echo "topic 07 completed"
			##############################
				echo "-----------on GS newcombined summaries-----------"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/01/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/01/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/01/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/01/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_01_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/01/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_01_card.keys
			echo "topic 01 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/02/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/02/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/02/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/02/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_02_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/02/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_02_card.keys
			echo "topic 02 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/03/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/03/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/03/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/03/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_03_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/03/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_03_card.keys
			echo "topic 03 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/04/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/04/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/04/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/04/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_04_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/04/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_04_card.keys
			echo "topic 04 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/05/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/05/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/05/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/05/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_05_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/05/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_05_card.keys
			echo "topic 05 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/06/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/06/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/06/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/06/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_06_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/06/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_06_card.keys
			echo "topic 06 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/07/lexrank.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lexrank_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/07/gensim.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/gensim_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/07/lsa.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/lsa_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/07/luhn.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/luhn_07_card.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/07/pytease.summ --preprocessing wordlen tag #> /evaluations/chowmeinresults/aftersumm/pytease_07_card.keys
			echo "topic 07 completed"
			#############################
			echo "-----------on newcombined summaries-----------"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/01/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_01_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/01/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_01_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/01/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_01_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/01/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_01_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/01/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_01_newcombined.keys
			echo "topic 01 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/02/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_02_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/02/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_02_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/02/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_02_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/02/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_02_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/02/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_02_newcombined.keys
			echo "topic 02 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/03/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_03_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/03/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_03_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/03/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_03_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/03/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_03_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/03/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_03_newcombined.keys
			echo "topic 03 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/04/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_04_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/04/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_04_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/04/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_04_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/04/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_04_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/04/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_04_newcombined.keys
			echo "topic 04 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/05/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_05_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/05/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_05_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/05/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_05_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/05/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_05_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/05/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_05_newcombined.keys
			echo "topic 05 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/06/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_06_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/06/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_06_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/06/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_06_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/06/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_06_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/06/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_06_newcombined.keys
			echo "topic 06 completed"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/07/gensim.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/gensim_07_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/07/lexrank.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lexrank_07_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/07/lsa.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/lsa_07_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/07/luhn.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/luhn_07_newcombined.keys
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/07/pytease.summ --preprocessing wordlen tag # > /evaluations/chowmeinresults/aftersumm/pytease_07_newcombined.keys

		  	echo "**********************BEFORE SUMMARY***********************"
		    echo "-----------on cards-----------"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/01.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/01_cards.keys
		  	echo "completed topic 01"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/02.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/02_cards.keys
		  	echo "completed topic 02"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/03.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/03_cards.keys
		  	echo "completed topic 03"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/04.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/04_cards.keys
		  	echo "completed topic 04"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/05.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/05_cards.keys
		  	echo "completed topic 05"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/06.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/06_cards.keys
		  	echo "completed topic 06"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/cards/07.agg --preprocessing wordlen tag > /evaluations/chowmeinresults/beforesumm/07_cards.keys
		  	echo "completed topic 07"
		  	echo "-----------on newhtmls-----------"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/01.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/01_newhtmls.keys
		  	echo "completed topic 01"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/02.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/02_newhtmls.keys
		  	echo "completed topic 02"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/03.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/03_newhtmls.keys
		  	echo "completed topic 03"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/04.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/04_newhtmls.keys
		  	echo "completed topic 04"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/05.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/05_newhtmls.keys
		  	echo "completed topic 05"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/06.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/06_newhtmls.keys
		  	echo "completed topic 06"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newhtmls/07.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/07_newhtmls.keys
		  	echo "completed topic 07"
		  	echo "-----------on newcombined-----------"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/01.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/01_newcombined.keys
		  	echo "completed topic 01"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/02.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/02_newcombined.keys
		  	echo "completed topic 02"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/03.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/03_newcombined.keys
		  	echo "completed topic 03"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/04.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/04_newcombined.keys
		  	echo "completed topic 04"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/05.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/05_newcombined.keys
		  	echo "completed topic 05"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/06.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/06_newcombined.keys
		  	echo "completed topic 06"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/rr/newcombined/07.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/07_newcombined.keys
		  	echo "completed topic 07"
			echo "topic 07 completed"
			######################################################
			echo "**********************MANUAL SUMMARY***********************"
			python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/dependency_parsing/dependency_parsing.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/01_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/dependency_parsing/dependency_parsing.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/01_v2.keys
		  	echo "completed topic 01"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/named_entity_recognition/named_entity_recognition.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/02_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/named_entity_recognition/named_entity_recognition.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/02_v2.keys
		  	echo "completed topic 02"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/summarization/summarization.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/03_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/summarization/summarization.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/03_v2.keys
		  	echo "completed topic 03"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/sentiment_analysis/sentiment_analysis.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/04_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/sentiment_analysis/sentiment_analysis.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/04_v2.keys		  	
		  	echo "completed topic 04"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/coreference_resolution/coreference_resolution.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/05_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/coreference_resolution/coreference_resolution.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/05_v2.keys
		  	echo "completed topic 05"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/topic_models/topic_models.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/06_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/topic_models/topic_models.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/06_v2.keys
		  	echo "completed topic 06"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/word_sense_disambiguation/word_sense_disambiguation.txt1 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/07_v1.keys
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /manual_summaries_reorg/word_sense_disambiguation/word_sense_disambiguation.txt2 --preprocessing wordlen tag > /evaluations/chowmeinresults/gold/07_v2.keys
		  	echo "completed topic 07"
		 ########################################################
		 	echo " ***********ON GS**************"
		 	echo "-----------on cards-----------"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/01.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/01_newhtmls.keys
		  	echo "completed topic 01"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/02.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/02_newhtmls.keys
		  	echo "completed topic 02"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/03.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/03_newhtmls.keys
		  	echo "completed topic 03"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/04.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/04_newhtmls.keys
		  	echo "completed topic 04"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/05.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/05_newhtmls.keys
		  	echo "completed topic 05"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/06.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/06_newhtmls.keys
		  	echo "completed topic 06"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/cards/07.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/07_newhtmls.keys
		  	echo "completed topic 07"
		  	echo "-----------on newcombined-----------"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/01.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/01_newcombined.keys
		  	echo "completed topic 01"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/02.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/02_newcombined.keys
		  	echo "completed topic 02"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/03.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/03_newcombined.keys
		  	echo "completed topic 03"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/04.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/04_newcombined.keys
		  	echo "completed topic 04"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/05.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/05_newcombined.keys
		  	echo "completed topic 05"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/06.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/06_newcombined.keys
		  	echo "completed topic 06"
		  	python /data/corpora/newaan0/shared/chowmein/chowmein/label_topic.py --line_corpus_path /extractivesumm/outputs/GS/newcombined/07.agg --preprocessing wordlen tag # > /evaluations/chowmeinresults/beforesumm/07_newcombined.keys
		  	echo "completed topic 07"
		  	;;
		\?)
		  	echo "Invalid option: -$OPTARG"
		  	exit 1
		  	;;
		:)
		  	echo "Option -$OPTARG requires an argument."
		  	exit 1
		  	;;
		h)
			echo "-i <queryfile>: perform information retrieval on given query file"
			echo "-t: run trec_eval. Assumes gold standard in rrsearch/wholeGSresults.qrels and output in rrsearch/output"
			echo "-e <summ_algorithm>: specifies which extractive summarization algorithm to run. call -e multiple times to run multiple algs"
			echo "-a: run all extractive summarization algorithms"
  	esac
done



