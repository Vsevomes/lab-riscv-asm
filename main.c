#include <stdio.h>

#define N 4   
#define M 5   

void process(int n, int m, int matrix[M][N], int *pos_count, int *neg_count)
{
    *pos_count = 0;
    *neg_count = 0;

    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (matrix[i][j] > 0) {
                (*pos_count)++;
            } else if (matrix[i][j] < 0) {
                (*neg_count)++;
            }
        }
    }
}

int main()
{
    int matrix[M][N];
    int positive = 0;
    int negative = 0;

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &positive, &negative);

    printf("Positive count: %d\n", positive);
    printf("Negative count: %d\n", negative);

    return 0;
}
