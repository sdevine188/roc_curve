library(ggplot2)

# manual roc curve

df <- data.frame(cum_false_positive_rate = c(.01, .011, .04, .08, .15, .19, .24, 1), cum_true_positive_rate = c(.38, .39, .57, .76, .9, .95, 1, 1))
df

line1 <- data.frame(x1 = 0, x2 = 1, y1 = 0, y2 = 1)
train_roc_curve <- ggplot(treatment_post_interview_train_node_stats_roc, aes(x = cum_false_positive_rate_weighted, y = cum_true_positive_rate_weighted)) +
        geom_line() + geom_point() + geom_text(aes(label = terminal_node), position = position_nudge(x = .03, y = -.03)) + 
        ggtitle(str_c("ROC curve for training dataset")) + geom_segment(data = line1, aes(x = x1, y = y1, xend = x2, yend = y2), alpha = .2, lty = 2)
train_roc_curve
