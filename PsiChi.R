install.packages("haven")

library(haven)

data <- data.frame(M3_P3_BTACT_N3291_20210922)

head(data)
names(data)

clean_data <- data[, c("C3TCOMP", "C3TEF", "C1PRAGE", "C3TBKTOT")]
clean_data <- na.omit(clean_data)
summary(clean_data)

model <- lm(C3TCOMP ~ C3TEF + C1PRAGE, data = clean_data)
summary(model)

plot(clean_data$C3TEF, clean_data$C3TCOMP,
     xlab = "Executive Function (Standardized Score)",
     ylab = "Cognitive Performance (Composite Score)",
     main = "Executive Function as a Predictor of Cognitive Performance",
     pch = 16, cex = 0.5, col = rgb(0,0,0,0.6))

abline(model, col="blue", lwd=3)

n <- nrow(clean_data)
text(-1.5, 1.9, labels = "R² = .82, p < .001\nN = 3043")
