#' @name closeGenes
#' @description Get genes (or other features) close to some other features (.bed). TSS used.
#' @param a: a .bed position of all genes of interest. Must have $Chr, $Start, $End $ID $Strand column names! TSS of the transcrips will be used
#' @param b: a .bed position of all features of interest. Must have $Chr, $Start, $End $ID $Strand column names! TSS of the features will be used
#' @param dist: how many basepairs from features B should a feature A be to be included? Default = 10000bps
#' @title closeGenes : Get close features (genes )
#' @export closeGenes
#' @examples
#' closeGenes <- enesClose(a = gencode.transcripts, b = L1s.up, distance = 50000 )

closeGenes <- function(a,b,dist=10000) {

  if('Chr' %in% colnames(a) & 'Strand' %in% colnames(a) & 'Start' %in% colnames(a) & 'End' %in% colnames(a) & 'ID' %in% colnames(a)){
    if('Chr' %in% colnames(b) & 'Strand' %in% colnames(b) & 'Start' %in% colnames(b) & 'End' %in% colnames(b) & 'ID' %in% colnames(b)){

      ## data frame to build
      allclose <- data.frame()
      # iterate through each feature -> get genes with TSS <50kb away)
      cat(">> Getting genes with TSS within",dist,"bps from each given feature. This might take a couple of minutes. Patience..\n")

      for (i in 1:nrow(b)){

        # get position of current L1
        feat.chr <- as.character(b$Chr[i])
        feat.tss <- ifelse(as.character(b$Strand[i])=="+",as.numeric(as.character(b$Start[i])),as.numeric(as.character(b$End[i])))
        feat.end <- ifelse(as.character(b$Strand[i])=="+",as.numeric(as.character(b$End[i])),as.numeric(as.character(b$Start[i])))
        feat.str <- as.character(b$Strand[i])
        feat.name <- as.character(b$ID[i])
        # get genes on same chromosome
        genes.chr <- a[a$Chr == feat.chr,]
        # get genes with TSS < dist from L1 features
        closeGenes <-genes.chr[abs(as.numeric(as.character(genes.chr$tss))-feat.tss)<dist,]
        ## add L1 data
        closeGenes[,5] <- rep(as.character(b$ID[i]),nrow(closeGenes))
        closeGenes[,6] <- rep(feat.str,nrow(closeGenes))
        closeGenes[,7] <- rep(feat.tss,nrow(closeGenes))
        allclose <- rbind(allclose,closeGenes)

      }

      colnames(allclose) <- c('A_Close','A_chr','A_strand','A_tss','B','B_strand','B_tss')
      allclose[,'distance'] <- as.numeric(as.character(allclose$gene_tss))-as.numeric(as.character(allclose$feature_tss))
      cat("- ..complete! Genes A with TSS within",dist,"bps from each features B TSS is computed.\n")
      return(allclose)
    }else{
      print("> ERROR: Colnames of your 'b' table/data.frame must be with Chr, Start, End, Strand, ID colnames")
      print("> ERROR: Please change your column names.")
    }
  }else{
    print("> ERROR: Colnames of your 'a' table/data.frame must be with Chr, Start, End, Strand, ID colnames")
    print("> ERROR: Please change your column names.")
  }
}