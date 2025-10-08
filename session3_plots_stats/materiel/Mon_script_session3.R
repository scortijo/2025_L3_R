# Charger les librairies
library(tidyverse)

# Definir l'environnement de travail
setwd("/Users/sandra/Desktop/BPMP/Teaching/2024-2025/L3_bioinfo_2024/2024_L3_R/session3_plots_stats/materiel/")

# Charger les donnees (burghardt_et_al_2015_expt1.txt)
my_data <- read_tsv("../data/burghardt_et_al_2015_expt1.txt")

# Graphique exercice 3 avec facet
ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=genotype)) +
  geom_point() +
  facet_grid(genotype~temperature)

ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=fluctuation)) +
  geom_point() +
  facet_grid(genotype~temperature)


ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=fluctuation)) +
  geom_point() +
  facet_grid(~genotype)

ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=fluctuation)) +
  geom_point() +
  facet_grid(genotype~.)

# facet_wrap
ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=fluctuation)) +
  geom_point() +
  facet_wrap(~genotype)

# Exercice 5: Modifier le graphique pour separer
# en fonction de fluctuation en ligne 
# et day.length en colonne. Colorez les points en 
# fonction du genotype

ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    col=genotype)) +
  geom_point() +
  facet_grid(fluctuation~day.length)

ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    col=genotype)) +
  geom_point() +
  facet_wrap(fluctuation~day.length, scales ="free")

# Exercice 6
ggplot(my_data, aes(x=genotype, y=days.to.bolt,
                    fill=fluctuation)) +
  geom_boxplot() +
  facet_grid(day.length~temperature) +
  scale_fill_manual(values=c("orange", "brown"))

## Tests stat
library(ggpubr)

ggplot(my_data, aes(x=genotype, y=days.to.flower,
                    colour=fluctuation)) +
  geom_boxplot() +
  stat_compare_means(label="p.format", method="t.test")


ggplot(my_data, aes(x=genotype, y=days.to.flower,
                    colour=fluctuation)) +
  geom_boxplot() +
  stat_compare_means(label="p.signif", method="t.test")


ggplot(my_data, aes(x=genotype, y=days.to.flower)) +
  geom_boxplot() +
  stat_compare_means()

# test de correlation
#  scatterplot de rosette.leaf.num
# en fonction de blade.length.mm

ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num)) +
  geom_point() +
  stat_cor(method = "spearman")

ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=fluctuation)) +
  geom_point() +
  stat_cor(method = "spearman")

## ajouter une ligne de regression
ggplot(my_data, aes(x=blade.length.mm, y=rosette.leaf.num,
                    colour=fluctuation)) +
  geom_point() +
  stat_cor(method = "spearman") +
  geom_smooth()

# Exercice 1

ggplot(my_data, aes(fluctuation, rosette.leaf.num)) +
  geom_violin() +
  stat_compare_means(label.x.npc="middle")

ggplot(my_data, aes(fluctuation, rosette.leaf.num)) +
  geom_violin() +
  stat_compare_means(label.x=1.3, label.y=100)


ggplot(my_data, aes(days.to.bolt, days.to.flower)) +
  geom_point() +
  stat_cor() +
  geom_smooth()






