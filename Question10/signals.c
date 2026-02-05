#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void handle_sigint(int sig) {
    printf("\nSIGINT received. Press Ctrl+C again to exit.\n");
}

int main() {
    signal(SIGINT, handle_sigint);

    while (1) {
        printf("Running... Press Ctrl+C\n");
        sleep(2);
    }
    return 0;
}
