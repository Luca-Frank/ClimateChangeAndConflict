library(tidyverse)
libary(sf)


## ACLED

#import ACLED Data
acled <- read_csv("data/acled/1997-01-01-2022-03-08-Eastern_Africa-Middle_Africa-Northern_Africa-Southern_Africa-Western_Africa.csv")

#demonstrations in africa conflict
acled_pol <- acled %>% filter(event_type == "Riots" | event_type == "Protests")


acled1 <- acled_pol %>% slice(1:45000)
acled2 <- acled_pol %>% slice(45001:nrow(acled_pol))


write.csv(acled1,"data/acled/acled1.csv")
write.csv(acled2,"data/acled/acled2.csv")
