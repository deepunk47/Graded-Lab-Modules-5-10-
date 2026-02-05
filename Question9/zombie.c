#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t pid = fork();

    if (pid > 0) {
        sleep(20);
    } else if (pid == 0) {
        printf("Child process exiting\n");
    }
    return 0;
}
