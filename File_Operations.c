#include <stdio.h>   // Include standard input/output library
#include <stdlib.h>  // Include standard library functions
#include <fcntl.h>   // Include file control options
#include <unistd.h>  // Include POSIX operating system API

int main() {
    int fd;  // File descriptor

    // Open a file named "example.txt" for writing only. If the file does not exist, it will be created.
    // O_CREAT flag creates the file if it does not exist.
    // O_WRONLY flag opens the file for writing only.
    // O_TRUNC flag truncates the file to zero length if it already exists.
    fd = open("Aura.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);
    
    // Check if file opened successfully
    if (fd == -1) {
        perror("open");  // Print error message if open fails
        exit();  // Exit the program with failure status
    }

    // Write "Hello World" to the file
    // write() system call writes data from a buffer to a file descriptor
    // It returns the number of bytes written on success, or -1 on error
    if (write(fd, "Hello World", 11) == -1) {
        perror("write");  // Print error message if write fails
        close(fd);  // Close the file before exiting
        exit();  // Exit the program with failure status
    }

    // Close the file after writing
    close(fd);

    // Open the file for reading only
    fd = open("Aura.txt", O_RDONLY);

    // Check if file opened successfully
    if (fd == -1) {
        perror("open");  // Print error message if open fails
        exit();  // Exit the program with failure status
    }

    char buffer[12];  // Buffer to store read data
    
    // Read data from the file into the buffer
    // read() system call reads data from a file descriptor into a buffer
    // It returns the number of bytes read on success, or -1 on error
    if (read(fd, buffer, 11) == -1) {
        perror("read");  // Print error message if read fails
        close(fd);  // Close the file before exiting
        exit();  // Exit the program with failure status
    }
    
    // Null-terminate the buffer to treat it as a string
    buffer[11] = '\0';

    // Close the file after reading
    close(fd);

    // Print the read content
    printf("Read content: %s\n", buffer);

    return 0;  // Exit the program with success status
}
