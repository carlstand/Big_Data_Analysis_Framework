require "rinruby"

R.eval <<EOF
	inbox_data <- read.table("../data/inbox_ol.csv", header=TRUE, sep=",")
	sent_data <- read.table("../data/sent_ol.csv", header=TRUE, sep=",")

	from <- inbox_data['from']
	colnames(from)[1] <- 'mail'
	to <- sent_data['to']
	colnames(to)[1] <- 'mail'
	all <- rbind(from,to)
	counted <- data.frame(table(all))
	sorted <- counted[order(counted['Freq'],decreasing=TRUE),]
	print(sorted[0:20,])
EOF

puts "Enter any key to quit...."

i = gets.to_i
