#include "writer.h"

int main(int argc, char* argv[]) 
{
  /*1st and 2nd variable */
    const char* writefile = argv[1];
    const char* writestr  = argv[2];
    FILE* file = fopen(writefile, "w");
          
   /*Exit with value 1 error and print statements if any of the arguments above were not specified */
    if (argc < 3) 
    {
        openlog(NULL, 0, LOG_ERR);
        syslog(LOG_ERR, "Error: Missing argument %d  \n", argc);
        printf("Error: Missing argument %d  \n", argc);
        
        return 1;
    }
    /*If the file exists, write to the file*/   
    if (file != NULL) 
    {
    	fwrite(writestr, 1, strlen(writestr), file);
    	openlog(NULL, 0, LOG_USER);
    	syslog(LOG_USER, "'%s' was written to output file %s\n", writestr, writefile);
    	printf("'%s' was written to output file %s\n", writestr, writefile);
    	fclose(file);
    }
    else   /*log the error to syslog, display to screen, and exit with value 1 error*/
    {      
        openlog(NULL, 0, LOG_ERR);
        syslog(LOG_ERR, "File '%s' not created. Error: %s\n", writefile, strerror(errno));
        printf("File '%s' not created. Error: %s\n", writefile, strerror(errno));
        return 1;
    }   
    
    return 0; /*success*/
}
