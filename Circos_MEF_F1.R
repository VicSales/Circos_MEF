sessionInfo()



#loading circos library

library(GenomicRanges)

options(stringsAsFactors = FALSE)

#intall the package if necessary
#source("https://bioconductor.org/biocLite.R")
#biocLite("OmicCircos")

library(OmicCircos)



#input mm10 cytogenetic band data

data("UCSC.mm10.chr")

head(UCSC.mm10.chr)



#import CSV data

mrna_TE_normMRNAp0_05<-read.csv("file:///C:/Users/Vicencia/Documents/Circos/mrna_te_transcript_stats_p0_05.csv", head = TRUE, sep = ',')



#the function data() seem in the vignette is only to pull the package examples, not yours!

seg_f_mm10<-UCSC.mm10.chr

seg_v_map_mrnaTE<-mrna_TE_normMRNAp0_05

seg_num_mm10<-(unique(seg_f_mm10[ ,1]))



#select segments

seg_name_mm10<-paste(seg_num_mm10, sep = '')

db_mm10<-segAnglePo(seg_f_mm10, seg = seg_name_mm10)



#set colors

colors<-rainbow(length(unique(seg_f_mm10[,1])), alpha = 0.5)



#output file

pdffile  <- "OmicCircosmrnaTEp0_05.pdf";

pdf(pdffile, 8, 8);

par(mar=c(2, 2, 2, 2));

plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="")

circos(R=400, type="chr", cir=db_mm10, col=colors, print.chr.lab=TRUE, W=4, scale = TRUE)

circos(R=300, cir=db_mm10, W=100, mapping = seg_v_map_mrnaTE, col.v = 3, type = "s", B=FALSE, col="navy", lwd=0.5, scale=TRUE)



dev.off()