library(nycflights13)

##In this assignment, I will try to find the relationship betwen carriers and arrival delays.

# carrier

flights %>% ggplot(aes(carrier))+geom_bar()
glimpse(flights)

## I am going to use geom_bar and geom_col() in order to see the number of flights per carrier

#geom_bar() counts the items in the dataset for frequency table
#geom_col()  plots the values without doing summary

total_flights <- flights %>% group_by(carrier) %>% summarise(total=n())

total_flights %>% ggplot(aes(x=carrier,y=total))+geom_col()

#Re-order the bars

library(forcats)
total_flights %>% ggplot(aes(x=fct_reorder(carrier,desc(total)),y=total))+geom_col()+labs(y="total flights",x="carrier",title="nyc flights in 2013 by carrier")

## The other Variable that I will use is arrival delay ######


flights %>% ggplot(aes(arr_delay))+geom_histogram()

flights %>% filter(arr_delay>0) %>% ggplot(aes(arr_delay))+geom_boxplot()+coord_cartesian(xlim=c(0,500))
## Zoom in
## Filter out the dataset
## scale_y_sqrt()

#### The bi-variate distribution visualization

flights %>% ggplot(aes(arr_delay))+geom_histogram()+facet_wrap(vars(carrier),scales="free")

## what do you like/not about this chart
## How easy is it to explain

flights %>% ggplot(aes(x=carrier,y=arr_delay))+geom_boxplot()
gg_base <- flights %>% ggplot(aes(x=carrier,y=arr_delay))
gg_base

### Let's try a violin plot

gg_base + geom_violin()+coord_cartesian(ylim=c(-50,500))+coord_flip()

### beeswarm plot

#install.packages(ggbeeswarm)
library(ggbeeswarm)
gg_base + geom_quasirandom(alpha=0.6,size=.75)

### Letter Value Boxplot
### install.packages("lvplot")

library(lvplot)
gg_base + geom_lv(aes(fill=..LV..))+scale_fill_lv()
gg_base + geom_lv(color="blue")
ggsave("Task 6.png")
geom_hex()