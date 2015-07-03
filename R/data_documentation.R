#' An experiment on ant recruitment
#'
#' Number of \emph{Azteca} ants recruited by leaf extracts of
#' their host plant , \emph{Cecropia} trees. 
#'
#' @format A data frame with 21 rows and 3 variables:
#' \describe{
#' \item{plant}{plant id, integer}
#' \item{extract.new}{number of recruited ants in the leaf that received drops of smashed new leaves extract}
#' \item{extract.old}{number of recruited ants in the leaf that received drops of smashed old leaves extract}
#' }
#' @section Details:
#' The ant colonies live in the hollow
#' trunk of \emph{Cecropia} and can detect and expel leaf-chewing insects.
#' To test if this response is more intense in young leaves, drops of extract of smashed young and old leaves
#' were poured in two neighbor leaves of the same plant. After 7 minutes the number of recruited ants in each leaf was recorded.
#' @source
#' Kondrat, H. 2012. Estímulos químicos de folhas novas promovem recrutamento eficiente de formigas associadas à embaúba
#' \emph{Cecropia glaziovi} (Urticaceae). Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.M.Z. Martini, eds.). Universidade de São Paulo, São Paulo.
#' \url{http://ecologia.ib.usp.br/curso/2012/PDF/PI-Hebert.pdf}
#' @encoding utf-8
"azteca"


#' Vine infestation on Cecropia trees
#'
#' Presence/absence data of vines on Cecropia trees of two morphotypes.
#'
#' @format A data frame with 152 rows (plants) and 2 variables:
#' \describe{
#' \item{morphotype}{the tree morphotype, factor with two levels}
#' \item{with.vines}{does the tree harbor vines? Logical. }
#' }
#' @section Details:
#' Two morphotypes of Cecropia trees differ in the occupancy by ant colonies.
#' Ants attack and drive out other insects that get to the trees.
#' To test if this protection also affect infestation by vines, trees of similar size of both morphs
#' were sampled and inspected for the presence of vines.
#' @source
#' Mello, T.J. 2012. Infestação por lianas e comportamento de poda por formigas em \emph{Cecropia}
#' (Urticaceae). Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.M.Z. Martini, eds.). Universidade de São Paulo, São Paulo.
#' \url{http://ecologia.ib.usp.br/curso/2012/PDF/PI-Thayna.pdf}
#' @encoding utf-8
"embauba"

#' Preference of hunting spiders by hairy leaves
#'
#' Occupancy of \emph{Peucetia} spiders on parts of an experimental arena covered by
#' leaves with or without trichomes.
#'
#' @format A data frame with 27 rows (trials) and 6 variables:
#' \describe{
#' \item{t1,t2,t3,t4,t5,t6}{Is the spider on the part covered by hairy leaves? Logical,
#' for each of 6 successive inspections (time 1, 2, ...}
#' }
#' @section Details:
#' Spiders of the genus \emph{Peucetia} do not make webs and hunt actively on the vegetation.
#' The data is from an experiment to test if spiders prefer to stay in hairy leaves, that can stick their prey.
#' The spiders were kept in Petri dishes that had half of lower plate covered with hairy leaves.
#' The other half was covered by leaves without trichomes.
#' The placement of each spider was recorded 6 times at each 30 min. 
#' @source
#' Werneck, R.T. 2010. Lar, viscoso lar. Experimento de seleção de habitat e forrageio de aranhas
#' em plantas com tricomas glandulares. Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.A. Oliveira, eds.). Universidade de São Paulo, São Paulo.
#' \url{http://ecologia.ib.usp.br/curso/2010/pages/pdf/PI/relatorios/rachel.pdf}
#' @encoding utf-8
"peucetia"


#' Allometry in mangrove trees
#'
#' Canopy to height ratio and variables of root area in mangrove trees sampled in two soil types.
#'
#' @format A data frame with 24 rows (trees) and 4 variables:
#' \describe{
#' \item{soil.instability}{soil type according to instability; factor with two levels (high / medium)}
#' \item{canopy.trunk}{ratio between canopy and trunk area, both in m2, numeric}
#' \item{root}{area covered by aerial roots, numeric (m2)}
#' \item{n.roots}{number of aerial roots, integer}
#' }
#' @section Details:
#' Data from a field practical exercise to test if mangrove trees in more unstable soil
#' allocates more biomass in supporting roots.
#' @source
#' Prado, A. \emph{et al}. 2013. Variações na morfologia de sustentação em \emph{Rhizophora mangle} (Rizophoraceae) em diferentes
#' condições de inundação do solo. Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado, P.I. Prado & A.M.Z. Martini eds.). Universidade de São Paulo, São Paulo.
#' \url{http://ecologia.ib.usp.br/curso/2013/pdf/PO4-2.pdf}
#' @encoding utf-8
"rhyzophora"
