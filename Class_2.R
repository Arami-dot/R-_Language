getwd()

setwd('C:/Users/USER/AI_Omics_Internship_2025/Ass_Raw_Data')

input_dir <- 'C:/Users/USER/AI_Omics_Internship_2025/Ass_Raw_Data'

output_dir <- 'C:/Users/USER/AI_Omics_Internship_2025/Ass_Result_Data'

if(!dir.exists(output_dir)){
  dir.create(output_dir)
}

result_list <- list()
View(result_list)

files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")
View(files_to_process)

classify_gene <- function(logFC, padj) {
  ifelse(logFC > 1 & padj < 0.05, 'Upregulated',
         ifelse(logFC < -1 & padj < 0.05, 'Downregulated',
                'Not_Significant'))
}


for (data_files in files_to_process) {
  cat('\nProcessing:', data_files, "\n")
  
  input_file_path <- file.path(input_dir, data_files)
  
  data <- read.csv(input_file_path, header = TRUE)
  cat('files imported, checking for missing values.....\n')
  
  if('padj' %in% names(data)) {
    missing_count <- sum(is.na(data$padj))
    
    cat("missing values in 'padj':", missing_count, '\n')
    data$padj[is.na(data$padj)] <- 1
  }
  
  data$status <- classify_gene(data$logFC, data$padj)
  cat('column STATUS was created successfully....\n')
  
  print(table(data$status))
  cat('status count:/n')
  
  result_list[[data_files]] <- data
  
  output_file_path <- file.path(output_dir, paste0('Gene_Results', data_files))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("results is saved to:", output_file_path, "\n")
}


result_1 <- result_list[[1]]
result_2 <- result_list[[2]]

View (result_1)
View(result_2)












