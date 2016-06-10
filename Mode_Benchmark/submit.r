library(dplyr)
options(scipen=999)

Mode <- function(x){
	ux <- unique(x)
	return(ux[which.max(tabulate(match(x, ux)))])
}

parse <- function(str){
	return(as.numeric(strsplit(str, split=",")[[1]]))
}

test = read.csv("test.csv", stringsAsFactors=FALSE)
# print(head(test))
# for(i in 1:nrow(test)){
# 	print(test$Sequence[i])
# 	print(Mode(parse(test$Sequence[i])))
# 	break
# }

# x = c(1,2,2,2)
# print(Mode(x))

test %>%
rowwise() %>%
print(Sequence) %>%
mutate(Last = Mode(parse(Sequence))) %>%
select(Id, Last) %>%
arrange(Id) %>%
write.csv(., "mode_benchmark.csv", row.names=FALSE)