library(tidyverse)
conidia<- read_csv("data/conidia.csv") %>%
  rename_all(. %>% tolower) %>%
  mutate(lw_ratio=length/width)
foot_cell<- read_csv("data/foot_cell.csv")%>%
  mutate(lw_ratio=length/width)

ggplot(conidia, aes(lw_ratio))+
  geom_density(size=2) +
  geom_vline(xintercept = mean(conidia$lw_ratio))+
  theme_minimal()

ggplot(conidia, aes(length))+
  geom_density(size=2) +
  geom_vline(xintercept = mean(conidia$length))+
  theme_minimal()

ggplot(conidia, aes(length, width))+
  geom_point(size=2) +
  geom_smooth(method="lm")+
  theme_minimal()

ggplot(foot_cell, aes(lw_ratio))+
  geom_density(size=2) +
  geom_vline(xintercept = mean(foot_cell$lw_ratio, na.rm = T))+
  theme_minimal()
