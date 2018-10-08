# Inspired by bomeara/hexapods/R/functions.R get_funding function

get_funded_taxa <- function(taxon.dataframe, stem_name=TRUE) {
  data(grants) #from rnsf
  good.grant.indices <- which(grepl("systematics|phylo|bioinfor|taxonom|revision|peet", grants$fundProgramName, ignore.case=TRUE))
  good.grant.indices <- c(good.grant.indices,which(grepl("systematics|phylo|bioinfor|taxonom|revision|peet", grants$abstractText, ignore.case=TRUE)))
  good.grant.indices <- c(good.grant.indices,which(grepl("systematics|phylo|bioinfor|taxonom|revision|peet", grants$title, ignore.case=TRUE)))


  relevant.grants <- grants[unique(good.grant.indices),]
#   get_funding_for_taxon <- function(taxon, r.grants, stem_name=TRUE) {
#     funding <- 0
#     if(stem_name) {
#       taxon <- gsub("dae", "d", taxon)
#     }
#     matching.grant.indices <- unique(c(which(grepl(taxon, r.grants$abstractText, ignore.case=TRUE)), which(grepl(taxon, r.grants$title, ignore.case=TRUE))))
#     if(length(matching.grant.indices)>0) {
#       funding <- sum(as.numeric(r.grants$fundsObligatedAmt[matching.grant.indices]), na.rm=TRUE)
#     }
#     return(funding)
#   }
#   taxon.dataframe$nsf.funding <- sapply(taxon.dataframe$taxon, get_funding_for_taxon, r.grants=relevant.grants)
#   return(taxon.dataframe)
  return(relevant.grants)
}
