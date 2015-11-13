import numpy as np
import matplotlib.pyplot as plt
import collections

sendOn = []
subjects = []

def keysAndValues(d):
	return d.keys()[::-1], d.values()[::-1] 

with open(r"TAD.txt",'r') as fin:
	line = fin.readline()
	while line:
		sendOn.append(line[0:8])
		line = fin.readline()
		subjects+=line.strip().split(" ")
		line = fin.readline()
# print sendOn
# print subjects

times = collections.OrderedDict(
	sorted(collections.Counter(sendOn).items(),
	 key=lambda t:t[1]))
print len(times)
print times

freq = collections.OrderedDict(
	s