library(pacman)
p_load(dplyr)
p_load(ggplot2)

mtcars

mtcars |> mutate(model = rownames())
mtcars <- mtcars |> tibble::rownames_to_column()
mtcars <- tibble(mtcars)
mtcars <- mtcars |> rename(model = rowname)

mtcars |> group_by(model) |> 
  summarize(avg_mpg = mean(mpg)) |> 
  ggplot(mapping = aes(x = model, y = avg_mpg)) +
  geom_col(fill = "red")

mtcars |> group_by(model) |> 
  summarize(avg_mpg = mean(mpg)) |> 
  arrange(desc(avg_mpg)) |> 
  slice(1:10) |> 
  ggplot(mapping = aes(y = model, x = avg_mpg)) +
  geom_col(fill = "red", orientation = "y")


mtcars |> ggplot(mapping = aes(x = wt, y = mpg, color = cyl)) +
  geom_point()
