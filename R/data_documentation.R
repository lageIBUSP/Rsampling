#' An experiment on ant recruitment
#'
#' Number of \emph{Azteca} ants recruited by leaf extracts of
#' their host plant , \emph{Cecropia} trees. 
#'
#' @format A data frame with 21 rows and 3 variables:
#' \describe{
#' \item{plant}{plant id, integer}
#' \item{extract.new}{number of recruited ants in the leave droped with extract of smashed new leaves}
#' \item{extract.new}{number of recruited ants in the leave droped with extract of smashed old leaves}
#' }
#' @section Details:
#' The ant colonies live in the hollow
#' trunk of \emph{Cecropia} and can detect and expel leaf-chewing insects.
#' To test if this response is more intense in young leaves, drops of extract of smashed young and old leaves
#' were poured in two neighbour leaves of the same plant. After 7 minutes the number of recruited ants in each leaf was recorded.
#' @source
#' Kondrat, H. 2012. Estímulos químicos de folhas novas promovem recrutamento eficiente de formigas associadas à embaúba
#' \emph{Cecropia glaziovi} (Urticaceae). Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.M.Z. Martini, eds.). Universidade de São Paulo, São Paulo.
"azteca"


#' Vine infestation on Cecropia trees
#'
#' Presence/absence data of vines on Ceropia trees of two morphotypes.
#'
#' @format A data frame with 152 rows (plants) and 2 variables:
#' \describe{
#' \item{morphotype}{the tree morphotype, factor with two levels}
#' \item{with.vines}{does the tree harbor vines? Logical. }
#' }
#' @section Details:
#' Two morphotypes of Cecropia trees differ in the occupancy by ant colonies.
#' Ants attacks and drive out other insects that get to the trees.
#' To test if this protection also affect infestation by vines, trees of similar size of both morphs
#' were sampled and inspected for the presence of vines.
#' @source
#' Mello, T.J. 2012. Infestação por lianas e comportamento de poda por formigas em \emph{Cecropia}
#' (Urticaceae). Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.M.Z. Martini, eds.). Universidade de São Paulo, São Paulo.
"embauba"

#' Preference of hunting spiders by hairy leaves
#'
#' Occupancy of \emph{Peucetia} spiders on parts of an experimental arena covered by
#' leaves with or without tricomes.
#'
#' @format A data frame with 27 rows (trials) and 6 variables:
#' \describe{
#' \item{t1 ... t6}{Is the spider on the part covered by hairy leaves? Logical,
#' for each of 6 sucessive inspections (time 1, 2, ...}
#' }
#' @section Details:
#' Spiders of the genus \emph{Peucetia} do not make webs and hunt actively on the vegetation.
#' The data is from ax experiment to test if their preference for hairy leaves that can stick their prey.
#' The spiders were kept in Petri dishes that had half of lower plate covered with hairy leaves.
#' The other half was covered by leaves without trichomes.
#' The placement of each spider was recorded 6 times at each 30 min. 
#' @source
#' Werneck, R.T. 2010. Lar, viscoso lar. Experimento de seleção de habitat e forrageio de aranhas
#' em plantas com tricomas glandulares. Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.A. Oliveira, eds.). Universidade de São Paulo, São Paulo.
"peucetia"


#' Distance traveled by winged fruits
#'
#' Distance traveled in a wind tunnel by samaras with different area to mass ratios.
#'
#' @format A data frame with 30 rows (fruits) and 2 variables:
#' \describe{
#' \item{load}{wing load, the mass/area ratio (g/cm2)}
#' \item{with.vines}{distance traveled in a improvised wind tunnel (cm)}
#' }
#' @source
#' Cunha, T.J. 2011. Alometria de frutos alados e influência da frugivoria na capacidade de dispersão
#' de frutos de \emph{Stigmaphyllon} sp. (Malpighiaceae). Curso de campo "Ecologia da Mata Atlântica"
#' (G. Machado; P.I. Prado & A.M.Z. Martini, eds.). Universidade de São Paulo, São Paulo.
"samaras"
