#include <stdio.h>
#include <stdlib.h>

#define MEM_DEPTH 4096 
#define NUM_CORE 2

int main(int argc, char **argv) {
	if(argc != 2){
		printf("Usage : <executable> <srand_val>\n");
		return -1;
	}
	srand(atoi(argv[1]));
	FILE *fp_in, *fp_ot;
	fp_in = fopen("ref_c_rand_input.txt","w");
	fp_ot = fopen("ref_c_result.txt","w");
	
	unsigned char A[NUM_CORE]; // 8b
	unsigned char B[NUM_CORE]; // 8b
	unsigned short R[NUM_CORE]; // 16b

	for (int i = 0; i<MEM_DEPTH; i++){ 
		//Data order MSB to LSB  {[0],[1]}
		for (int core = 0; core < NUM_CORE; core++) {
			A[core] = rand()%256; // 0~255 8b
			B[core] = rand()%256; // 0~255 8b
			R[core] = A[core] * B[core];
			fprintf (fp_in, "%d %d ", A[core], B[core]);  // order 0 1
			fprintf (fp_ot, "%d ", R[core]);

		}
		fprintf (fp_in, "\n");  
		fprintf (fp_ot, "\n");
	}
	fclose(fp_in);
	fclose(fp_ot);
	return 0;
}
