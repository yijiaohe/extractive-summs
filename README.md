# extractive-summs-eval

This is supporting code for an experiment I ran for my senior thesis. 

## Title
### Evaluation of Extractive Summarization Techniques on Powerpoint Presentations and HTML Pages from the AAN TutorialBank Corpus

## Abstract

This paper compares the performance of four extractive summarization techniques on Powerpoint presentations and HTML webpages. This is part of an exploration in making a tool that can be used to summarize key points of knowledge areas at a higher level, such that beginners in academic fields are able to quickly grasp the basics without getting mired in the details of too specific a subfield or problems tackled in published scientific papers. This project differs from previous work in that it focuses specifically on Powerpoint slides and HTML webpages as the summary candidates, as they are generally less structured and more varied in use of language. The output are a set of sentences that should be factoids relating to the topic at hand. The summary candidates are passed through a ranked information retrieval algorithm first, and then summarized using the extractive summarization techniques TextRank, LexRank, Luhn?s Algorithm, and LSA for comparison. The algorithms are run on seven different topics, and are evaluated using BLEU scores and a topic extraction algorithm. The gold standard for the summaries are taken from the manual summaries performed on the same dataset for a different project. The results indicate that there is promise in using extractive summarization techniques on these media, given that the slides and the webpages are adequately parsed and irrelevant information is trimmed. Performance varies according to the type of media that is parsed, as well as the topic that the algorithms are extracting from. LSA seems to be the algorithm that has consistently above average performance, whereas LexRank performed better for longer text sources but worse for shorter individual slides. The paper will highlight the difficulties of creating a summary for media such as presentations and web tutorials, as well as suggest directions for future explorations in this area.

## Sources

Barrios, Federico, et al. "Variations of the similarity function of textrank for automated summarization." arXiv preprint arXiv:1602.03606 (2016).

Erkan, Günes, and Dragomir R. Radev. "LexRank: Graph-based lexical centrality as salience in text summarization." Journal of Artificial Intelligence Research 22 (2004): 457-479.

Gong, Yihong, and Xin Liu. "Generic text summari-zation using relevance measure and latent semantic analysis." Proceedings of the 24th annual interna-tional ACM SIGIR conference on Research and de-velopment in information retrieval. ACM, 2001.

Jagadeesh, J., Prasad Pingali, and Vasudeva Var-ma. "Sentence extraction based single document summarization." International Institute of Infor-mation Technology, Hyderabad, India 5 (2005)

Jha, Rahul, Amjad Abu-Jbara, and Dragomir Radev. "A system for summarizing scientific topics starting from keywords." Proceedings of the 51st Annual Meeting of the Association for Computa-tional Linguistics (Volume 2: Short Papers). Vol. 2. 2013

Luhn, Hans Peter. "The automatic creation of litera-ture abstracts." IBM Journal of research and de-velopment 2.2 (1958): 159-165

Mei, Qiaozhu, Xuehua Shen, and ChengXiang Zhai. "Automatic labeling of multinomial topic mod-els." Proceedings of the 13th ACM SIGKDD in-ternational conference on Knowledge discovery and data mining. ACM, 2007.

Mihalcea, Rada, and Paul Tarau. "Textrank: Bringing order into text." Proceedings of the 2004 confer-ence on empirical methods in natural language processing. 2004.

Nanba, Hidetsugu, and Manabu Okumura. "To-wards multi-paper summarization using reference information." IJCAI. Vol. 99. 1999

Pranay, Aman, Aayush, ?Text Summarization in Py-thon: Extractive vs Abstractive Techniques Revisit-ed?, Rare Technologies, April 2017

Teufel, Simone, and Marc Moens. "Summarizing sci-entific articles: experiments with relevance and rhe-torical status." Computational linguistics 28.4 (2002): 409-44






