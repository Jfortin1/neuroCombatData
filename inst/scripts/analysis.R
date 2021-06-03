seAdniFs <- se
save(seAdniFs, file="../../data/seAdniFs.rda")


age <- colData(seAdniFs)$age
col <- as.character(colData(seAdniFs)$site)
tab=table(col)
tab <- tab[tab>100]
sites <- names(tab)
good <- col %in% sites
Y <- assays(seAdniFs)[[1]]
cors <- sapply(1:nrow(Y), function(i){
    cor(age, Y[i,], use="p")
})
wh=which.min(cors)
wh=order(cors)[1:10][8]
plot(age, Y[wh,],col=col)
col_good <- col[good]
col_good <- as.numeric(as.factor(col_good))
plot(age[good], Y[wh,good],col=col_good)

ys <- split(Y[wh,good], f=col[good])
boxplot(ys)
