#include <stdio.h>
#include <stdlib.h>

#define MEM_DEPTH 4096 
#define NUM_CORE 4

int main(int argc, char **argv) {
	if(argc != 2){
		printf("Usage : <executable> <srand_val>\n");
		return -1;
	}
	srand(atoi(argv[1]));
	FILE *fp_in_node, *fp_in_wegt, *fp_ot_rslt;
	fp_in_node = fopen("ref_c_rand_input_node.txt","w");
	fp_in_wegt = fopen("ref_c_rand_input_wegt.txt","w");
	fp_ot_rslt = fopen("ref_c_result.txt","w");
	
	unsigned char IN_NODE[NUM_CORE]; // 8b 
	unsigned char IN_WEGT[NUM_CORE]; // 8b
	unsigned 	  OT_RSLT[NUM_CORE] = {0,}; // 32b  // init 0

	for (int i = 0; i<MEM_DEPTH; i++){
		for (int core = 0; core < NUM_CORE; core++) {
			IN_NODE[core] = rand()%256; // 0~255 8b
			IN_WEGT[core] = rand()%256; // 0~255 8b
			
			OT_RSLT[core] += IN_NODE[core] * IN_WEGT[core];
			fprintf (fp_in_node, "%d ", IN_NODE[core]);  // order 0 1
			fprintf (fp_in_wegt, "%d ", IN_WEGT[core]);  // order 0 1
		}
		fprintf (fp_in_node, "\n");  
		fprintf (fp_in_wegt, "\n");  
	}
	for (int core = 0; core < NUM_CORE; core++) {
		fprintf (fp_ot_rslt, "%d ", OT_RSLT[core]);
	}
	fclose(fp_in_node);
	fclose(fp_in_wegt);
	fclose(fp_ot_rslt);
	return 0;
}
