// SCCS  %W% - %G% - %U% 

// Copyright (c) 2003 University of Southern California Brain Project 
// email nsl@java.usc.edu 

// Salvador Marmol
// NSLM code of Marmol's model

nslModel MarmolModel() {

    // Model constants

    nslConstant int MEMORY=25;
    
    // Local variables   

    public NslDouble1 memory(MEMORY);

    public NslDouble1 preSma(MEMORY);
    public NslDouble1 smaPropPrep(MEMORY);
    public NslDouble1 smaPropMvt(MEMORY);
    public NslDouble1 motorCortex(MEMORY);
    public NslDouble1 putamenNext(MEMORY);
    public NslDouble1 putamenMvt(MEMORY);
    public NslDouble1 gpe(MEMORY);
    public NslDouble1 gpe2(MEMORY);
    public NslDouble1 gpi(MEMORY);
    public NslDouble1 stn(MEMORY);
    public NslDouble1 snc(MEMORY);
    public NslDouble1 th(MEMORY);

    public NslDouble1 preSmaMP(MEMORY);
    public NslDouble1 smaPropPrepMP(MEMORY);
    public NslDouble1 smaPropMvtMP(MEMORY);
    public NslDouble1 motorCortexMP(MEMORY);
    public NslDouble1 putamenNextMP(MEMORY);
    public NslDouble1 putamenMvtMP(MEMORY);
    public NslDouble1 gpeMP(MEMORY);
    public NslDouble1 gpiMP(MEMORY);
    public NslDouble1 stnMP(MEMORY);
    public NslDouble1 sncMP(MEMORY);
    public NslDouble1 thMP(MEMORY);

    private NslDouble0 preSma_kx1();
    private NslDouble0 preSma_kx2();
    private NslDouble0 preSma_ky1();
    private NslDouble0 preSma_ky2();
    private NslDouble0 preSma_tm();

    private NslDouble0 gpe_kx1();
    private NslDouble0 gpe_kx2();
    private NslDouble0 gpe_ky1();
    private NslDouble0 gpe_ky2();
    private NslDouble0 gpe_tm();

    private NslDouble0 gpi_kx1();
    private NslDouble0 gpi_kx2();
    private NslDouble0 gpi_ky1();
    private NslDouble0 gpi_ky2();
    private NslDouble0 gpi_tm();

    private NslDouble0 th_kx1();
    private NslDouble0 th_kx2();
    private NslDouble0 th_ky1();
    private NslDouble0 th_ky2();
    private NslDouble0 th_tm();

    private NslDouble0 stn_kx1();
    private NslDouble0 stn_kx2();
    private NslDouble0 stn_ky1();
    private NslDouble0 stn_ky2();
    private NslDouble0 stn_tm();

    private NslDouble0 smaPropPrep_kx1();
    private NslDouble0 smaPropPrep_kx2();
    private NslDouble0 smaPropPrep_ky1();
    private NslDouble0 smaPropPrep_ky2();
    private NslDouble0 smaPropPrep_tm();

    private NslDouble0 smaPropMvt_kx1();
    private NslDouble0 smaPropMvt_kx2();
    private NslDouble0 smaPropMvt_ky1();
    private NslDouble0 smaPropMvt_ky2();
    private NslDouble0 smaPropMvt_tm();

    private NslDouble0 putamen_kx1();  
    private NslDouble0 putamen_kx2();  
    private NslDouble0 putamen_ky1();  
    private NslDouble0 putamen_ky2();  
    private NslDouble1 putamen_tm(MEMORY);
    private NslDouble0 putamen_sigma1();  
    private NslDouble0 putamen_sigma2();  
    private NslDouble0 putamen_sigma3();  
    private NslDouble0 putamen_sigma4();

    private NslDouble0 gpeTonic();
    private NslDouble0 gpiTonic();
    private NslDouble0 stnTonic();
    private NslDouble0 thTonic();

    private NslDouble0 dopamine();

    private NslDouble0 preSma_smaPropPrep_wts();
    private NslDouble0 smaPropPrep_preSma_wts();
    private NslDouble0 smaPropPrep_smaPropMvt_wts();
    private NslDouble0 smaPropMvt_motorCortex_wts();
    private NslDouble0 smaPropMvt_putamenMvt_wts();
    private NslDouble2 smaPropPrep_putamenNext_wts(MEMORY, MEMORY);
    private NslDouble0 putamenNext_gpe_wts();
    private NslDouble0 putamenMvt_gpe_wts();
    private NslDouble0 putamenMvt_gpi_wts();
    private NslDouble0 gpe_stn_wts();
    private NslDouble0 gpe_gpi_wts();
    private NslDouble0 stn_gpe_wts();
    private NslDouble0 stn_gpi_wts();
    private NslDouble0 stn_putamenNext_wts();
    private NslDouble0 gpi_th_wts();
    private NslDouble0 th_smaPropPrep_wts();
    private NslDouble0 th_smaPropMvt_wts();

    private NslDouble0 gpe_threshold();
    private NslDouble0 smaPropPrep_threshold();

    private NslDouble0 maxStack();

    // Children modules
    
    private SequenceOut sequenceOut(MEMORY);

    // Nsl methods

    public void initSys() {
    	system.nslSetBuffering(false);    
	system.setRunEndTime(5.0);	
    }
    
    public void initModule() {
	nslPrintln("Marmol's Model");
	system.nslSetRunDelta(.001);

	preSma_kx1 = 0;
	preSma_kx2 = 40;
	preSma_ky1 = 0;
	preSma_ky2 = 50;
	preSma_tm  = 0.01;

	gpe_kx1 = 0;
	gpe_kx2 = 40;
	gpe_ky1 = 20;
	gpe_ky2 = 68;
	gpe_tm  = 0.1;

	gpi_kx1 = 20;
	gpi_kx2 = 58;
	gpi_ky1 = 60;
	gpi_ky2 = 100;
	gpi_tm  = 0.01;

	th_kx1 = 0;
	th_kx2 = 30;
	th_ky1 = 0;
	th_ky2 = 90;
	th_tm  = 0.01;

	stn_kx1 = 20;
	stn_kx2 = 40;
	stn_ky1 = 18;
	stn_ky2 = 34;
	stn_tm  = 0.01;

	smaPropPrep_kx1 = 0;
	smaPropPrep_kx2 = 40;
	smaPropPrep_ky1 = 0;
	smaPropPrep_ky2 = 60;
	smaPropPrep_tm  = 0.1;

	smaPropMvt_kx1 = 0;
	smaPropMvt_kx2 = 40;
	smaPropMvt_ky1 = 0;
	smaPropMvt_ky2 = 60;
	smaPropMvt_tm  = 0.1;

	putamen_kx1 = 0;
	putamen_kx2 = 90;
	putamen_ky1 = 0;
	putamen_ky2 = 60;
	putamen_sigma1 = 0;
	putamen_sigma2 = 60;
	putamen_sigma3 = 0.04;
	putamen_sigma4 = 0.006;

	preSma_smaPropPrep_wts = 10;
	smaPropPrep_preSma_wts = 1;
	smaPropPrep_smaPropMvt_wts = 1;
	fillPutamenNextWeights();
	smaPropMvt_motorCortex_wts = 1;
	smaPropMvt_putamenMvt_wts = 1;
	putamenNext_gpe_wts = .9; 
	putamenMvt_gpe_wts = 3; // .5; //1;
	putamenMvt_gpi_wts = 1;
	gpe_stn_wts = .45; //.5  //1
	gpe_gpi_wts = 5; // 10
	stn_gpe_wts = .15; //.15; // .00001
	stn_gpi_wts = 2;
	stn_putamenNext_wts = .005;// .05; //0.1; //0
	gpi_th_wts = .45;
	th_smaPropPrep_wts = 1;
	th_smaPropMvt_wts = 1;

	fillMemory();

	gpeTonic = 30;
	gpiTonic = 40;
	stnTonic = 40;
	thTonic = 20;

	gpe_threshold = 29.7;
    }

    public void initRun() {
	preSmaMP[3] = 40;
	smaPropPrepMP = 0;
	smaPropMvtMP = 0;
	motorCortexMP = 0;
	putamenNextMP = 0;
	putamenMvtMP = 0;
	gpeMP = 30;
	gpiMP = 40;
	stnMP = 20;
	thMP = 0;

	preSma =  nslSigma(preSmaMP, preSma_kx1, preSma_kx2, preSma_ky1, preSma_ky2);
	smaPropPrep = 0;
	smaPropMvt = 0;
	motorCortex = 0;
	putamenNext = 0;
	putamenMvt = 0;
	gpe = wta(gpeMP, gpe_threshold,gpe_kx1, gpe_kx2, gpe_ky1, gpe_ky2);
	gpe2 = nslSigma(gpeMP, gpe_kx1, gpe_kx2, gpe_ky1, gpe_ky2);;
	gpi = nslSigma(gpiMP, gpi_kx1, gpi_kx2, gpi_ky1, gpi_ky2);
	stn = nslSigma(stnMP, stn_kx1, stn_kx2, stn_ky1, stn_ky2);
	th = 0;
    }

    public void simRun() {


	preSmaMP = nslDiff(preSmaMP, preSma_tm, -preSmaMP 
		);
	preSma = nslSigma(preSmaMP, preSma_kx1, preSma_kx2, preSma_ky1, preSma_ky2);


	// SMA

	smaPropPrepMP = nslDiff(smaPropPrepMP, smaPropPrep_tm, -smaPropPrepMP 
		+ preSma * preSma_smaPropPrep_wts
		+ th * th_smaPropPrep_wts
		);
//	smaPropPrep = wta(smaPropPrepMP, smaPropPrep_threshold, smaPropPrep_kx1, smaPropPrep_kx2, smaPropPrep_ky1, smaPropPrep_ky2);
	smaPropPrep = nslSigma(smaPropPrepMP, smaPropPrep_kx1, smaPropPrep_kx2, smaPropPrep_ky1, smaPropPrep_ky2);

	smaPropMvtMP = nslDiff(smaPropMvtMP, smaPropMvt_tm, -smaPropMvtMP 
		+ th * th_smaPropMvt_wts
		);
	smaPropMvt = nslSigma(smaPropMvtMP, smaPropMvt_kx1, smaPropMvt_kx2, smaPropMvt_ky1, smaPropMvt_ky2);

	// Putamen

        putamen_tm = upDownSigmoid(putamenNextMP, putamen_sigma1, putamen_sigma2, putamen_sigma3, putamen_sigma4);
	putamenNextMP = diffTC(nslGetDelta(), putamenNextMP, putamen_tm, -putamenNextMP 
		+ smaPropPrep * smaPropPrep_putamenNext_wts
		+ stn * stn_putamenNext_wts
		);
//	putamenNextMP = nslDiff(putamenNextMP, gpe_tm, -putamenNextMP 
//		+ smaPropPrep * smaPropPrep_putamenNext_wts
//		);
	putamenNext = nslSigma(putamenNextMP, putamen_kx1, putamen_kx2, putamen_ky1, putamen_ky2);

	putamenMvtMP = diffTC(nslGetDelta(), putamenMvtMP, putamen_tm, -putamenMvtMP 
		+ smaPropMvt * smaPropMvt_putamenMvt_wts
		);
//	putamenMvtMP = nslDiff(putamenMvtMP, putamen_tm, -putamenMvtMP
//		+ smaPropMvt * smaPropMvt_putamenMvt_wts
//		);
	putamenMvt = nslSigma(putamenMvtMP, putamen_kx1, putamen_kx2, putamen_ky1, putamen_ky2);

	// Gpe

	gpeMP = nslDiff(gpeMP, gpe_tm, -gpeMP 
		- putamenNext * putamenNext_gpe_wts
		- putamenMvt * putamenMvt_gpe_wts
		+ stn * stn_gpe_wts
		+ gpeTonic
		);
//	gpe2 = nslSigma(gpeMP, gpe_kx1, gpe_kx2, gpe_ky1, gpe_ky2);
	gpe = wta(gpeMP, gpe_threshold,gpe_kx1, gpe_kx2, gpe_ky1, gpe_ky2);

	// Gpi

	gpiMP = nslDiff(gpiMP, gpi_tm, -gpiMP
		- putamenMvt * putamenMvt_gpi_wts
		- gpe * gpe_gpi_wts
		+ stn * stn_gpi_wts
		+ gpiTonic
		);
	gpi = nslSigma(gpiMP, gpi_kx1, gpi_kx2, gpi_ky1, gpi_ky2);

	// STN

	stnMP = nslDiff(stnMP, stn_tm, -stnMP
		- gpe * gpe_stn_wts
		+ stnTonic
		);
	stn = nslSigma(stnMP, stn_kx1, stn_kx2, stn_ky1, stn_ky2);

	// Thalamus

	thMP = nslDiff(thMP, th_tm, -thMP
		- gpi * gpi_th_wts
		+ stnTonic
		);
	th = nslSigma(thMP, th_kx1, th_kx2, th_ky1, th_ky2);
	
    }

    public void fillPutamenNextWeights() {
	maxStack = 0; // 1;
	double second = .2; //.3; //.9;
	double third  = .4; //.7;
	smaPropPrep_putamenNext_wts = .7; // .9
	for (int i=0; i<21; i++) {
/*	    smaPropPrep_putamenNext_wts[i][i]=2.0;
	    smaPropPrep_putamenNext_wts[0][i]=0.0;
	    smaPropPrep_putamenNext_wts[1][i]=0.0;
	    smaPropPrep_putamenNext_wts[2][i]=0.0;
	    smaPropPrep_putamenNext_wts[15][i]=0.0;
	    smaPropPrep_putamenNext_wts[16][i]=0.0;
	    smaPropPrep_putamenNext_wts[17][i]=0.0;
	    smaPropPrep_putamenNext_wts[18][i]=0.0;
	    smaPropPrep_putamenNext_wts[19][i]=0.0;
	    smaPropPrep_putamenNext_wts[20][i]=0.0;*/
	}
	smaPropPrep_putamenNext_wts[3][0] = maxStack;
	smaPropPrep_putamenNext_wts[3][15] = maxStack;
	smaPropPrep_putamenNext_wts[3][1] = third;
	smaPropPrep_putamenNext_wts[4][3] = maxStack;
	smaPropPrep_putamenNext_wts[4][16] = second;
	smaPropPrep_putamenNext_wts[4][0] = third;
	smaPropPrep_putamenNext_wts[5][0] = maxStack;
	smaPropPrep_putamenNext_wts[5][17] = second;
	smaPropPrep_putamenNext_wts[5][2] = third;
	smaPropPrep_putamenNext_wts[6][2] = maxStack;
	smaPropPrep_putamenNext_wts[6][18] = second;
	smaPropPrep_putamenNext_wts[6][1] = third;
	smaPropPrep_putamenNext_wts[7][1] = maxStack;
	smaPropPrep_putamenNext_wts[7][19] = second;
	smaPropPrep_putamenNext_wts[7][2] = third;
	smaPropPrep_putamenNext_wts[8][2] = maxStack;
	smaPropPrep_putamenNext_wts[8][20] = second;
	smaPropPrep_putamenNext_wts[8][1] = third;
	smaPropPrep_putamenNext_wts[9][0] = maxStack;
	smaPropPrep_putamenNext_wts[9][15] = second;
	smaPropPrep_putamenNext_wts[9][7] = third;
	smaPropPrep_putamenNext_wts[10][0] = maxStack;
	smaPropPrep_putamenNext_wts[10][17] = second;
	smaPropPrep_putamenNext_wts[10][8] = third;
	smaPropPrep_putamenNext_wts[11][1] = maxStack;
	smaPropPrep_putamenNext_wts[11][16] = second;
	smaPropPrep_putamenNext_wts[11][5] = third;
	smaPropPrep_putamenNext_wts[12][1] = maxStack;
	smaPropPrep_putamenNext_wts[12][19] = second;
	smaPropPrep_putamenNext_wts[12][6] = third;
	smaPropPrep_putamenNext_wts[13][2] = maxStack;
	smaPropPrep_putamenNext_wts[13][18] = second;
	smaPropPrep_putamenNext_wts[13][3] = third;
	smaPropPrep_putamenNext_wts[14][2] = maxStack;
	smaPropPrep_putamenNext_wts[14][20] = second;
	smaPropPrep_putamenNext_wts[14][4] = third;
	smaPropPrep_putamenNext_wts[21][9] = maxStack;
//	smaPropPrep_putamenNext_wts[21][18] = second;
	smaPropPrep_putamenNext_wts[21][22] = second;
	smaPropPrep_putamenNext_wts[22][21] = maxStack;
	smaPropPrep_putamenNext_wts[23][3] = maxStack;
	smaPropPrep_putamenNext_wts[23][16] = second;
	smaPropPrep_putamenNext_wts[23][24] = second;
	smaPropPrep_putamenNext_wts[24][23] = maxStack;
    }

    public void fillMemory() {
	memory[0]=1;
	memory[1]=2;
	memory[2]=3;
	memory[3]=12;
	memory[4]=21;
	memory[5]=13;
	memory[6]=31;
	memory[7]=23;
	memory[8]=32;
	memory[9]=123;
	memory[10]=132;
	memory[11]=213;
	memory[12]=231;
	memory[13]=312;
	memory[14]=321;
	memory[15]=4; // 1->2
	memory[16]=5; // 2->1
	memory[17]=6; // 1->3
	memory[18]=7; // 3->1
	memory[19]=8; // 2->3
	memory[20]=9; // 3->2
	memory[21]=123123;
	memory[22]=0; // loop
    }
   
    // code from Peter Dominey's model for a WTA.  Basically, we look for a
    // neuron which has the highest firing rate, *and* is above threshold.
    // mem_potential: the membrane potential of the layer
    // firing_rate: the firing rate output by the layer
    // threshold: the minimum threshold to achieve in order that a neuron may fire
    // kx1, kx2, ky1, ky2: parameters for the nslSigma function (see NSL manual)

    private NslDouble1 lta(NslDouble1 membranePotential,  
    	NslDouble0 threshold, NslDouble0 kx1, NslDouble0 kx2, 
    	NslDouble0 ky1, NslDouble0 ky2) {
	
	int size = membranePotential.getSize1();

	NslDouble1 firingRate(size);

	int index = nslMinElem(membranePotential);

	firingRate = 0;	 
	if (membranePotential[index] < threshold) {
       	    firingRate[index]=nslSigma(membranePotential[index], kx1, kx2, ky1, ky2);
	}

	return firingRate;
    }

    private NslDouble1 wta(NslDouble1 membranePotential,  
    	NslDouble0 threshold, NslDouble0 kx1, NslDouble0 kx2, 
    	NslDouble0 ky1, NslDouble0 ky2) {
	
	int size = membranePotential.getSize1();

	NslDouble1 firingRate(size);

	int index = nslMaxElem(membranePotential);

	firingRate = 0;	 

	boolean unique=true;
	for (int i=0; i<size; i++) {
//	    if (i!=index && nslFloor(membranePotential[i]*100000)/10000==nslFloor(membranePotential[index]*100000)/10000) {
	    if (i!=index && membranePotential[i]==membranePotential[index]) {
		unique = false;
	    }
	}

	if (unique) {
       	    firingRate[index]=nslSigma(membranePotential[index], kx1, kx2, ky1, ky2);
	}

	return firingRate;
    }

    // Since time constants are now themselves a matrix, need a new NSL sigmoid
    // to handle this

    public NslDouble1 diffTC(double delta, NslDouble1 mp, NslDouble1 tc, NslDouble1 newMp) {
        mp = mp + ((delta/tc)^newMp);
    	return mp;
    }

    // Based on Wilson's material, which shows that MSPs have a time constant
    // of 50 ms when there is little cortical input, but a time constant of
    // about 8 ms when there is more cortical input.  
    // Mike Crowley originally wrote this for his MSPs in his thesis.

    public NslDouble1 upDownSigmoid(NslDouble1 mp, NslDouble0 sig1, NslDouble0 sig2, 
    	    NslDouble0 sig3, NslDouble0 sig4) {
    	
    	NslDouble0 tLow();    	
    	NslDouble0 tHigh();
    	 
    	int i = mp.getSize1();
    	
    	NslDouble1 temp(i); 	
    	
    	tLow  = 0;
    	tHigh = 1;
    	
    	temp = (nslSigma(mp, sig1, sig2, tLow, tHigh) ^ (sig4 - sig3)) + sig3;
    		
    	return temp;    	
    }
}


