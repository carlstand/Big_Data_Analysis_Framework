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
	sorted(collections.Counter(subjects).items(),
	 key=lambda t:t[1]))
print freq


plt.figure(1)
plt.figure(2)

bar_width = 0.35
plt.figure(1)
numberOfDay = 10
keys, values = keysAndValues(times)
index = np.arange(len(keys[:numberOfDay]))
plt.bar(index, values[:numberOfDay], bar_width, alpha=0.4, color='b',
	label='Date')

plt.xticks(index+bar_width, keys[:numberOfDay])
plt.legend()

plt.figure(2)
numberOfWord = 10
keys, values = keysAndValues(freq)
index = np.arange(len(keys[:numberOfWord]))
plt.bar(index, values[:numberOfWord], bar_width, alpha=0.4, color='r',
	label='Word Frequency')

plt.xticks(index+bar_width, keys[:numberOfWord])
plt.legend()

plt.show()