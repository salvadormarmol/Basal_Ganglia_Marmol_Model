// SCCS  %W% - %G% - %U% 

// Copyright (c) 2003 University of Southern California Brain Project 
// email nsl@java.usc.edu 

// Salvador Marmol
// NSLM code of Marmol model

nslOutModule SequenceOut(int memory) {

    public NslDouble1 preSma(memory);
    public NslDouble1 smaPropPrep(memory);
    public NslDouble1 smaPropMvt(memory);
    public NslDouble1 motorCortex(memory);
    public NslDouble1 putamenNext(memory);
    public NslDouble1 putamenMvt(memory);
    public NslDouble1 gpe(memory);
    public NslDouble1 gpeMP(memory);
    public NslDouble1 gpi(memory);
    public NslDouble1 stn(memory);
    public NslDouble1 snc(memory);
    public NslDouble1 th(memory);
    
    private boolean canvasCreated = false;

    public void initModule() {
	if (!canvasCreated) {
    	    nslAddAreaCanvas(preSma,0,50);
    	    nslAddAreaCanvas(smaPropPrep,0,50);
    	    nslAddAreaCanvas(smaPropMvt,0,50);
    	    nslAddAreaCanvas(putamenNext,0,50);
    	    nslAddAreaCanvas(putamenMvt,0,50);
    	    nslAddAreaCanvas(gpe,20,68);
    	    nslAddAreaCanvas(gpeMP,0,40);
    	    nslAddAreaCanvas(gpi,60,100);
    	    nslAddAreaCanvas(stn,0,50);
    	    nslAddAreaCanvas(th,0,30);

	    //nslSetColumns(1);
	    canvasCreated=true;
	}
    }
	
    public void simRun() {
	preSma = (NslDouble1)nslGetValue("marmolModel.preSma");
	smaPropPrep = (NslDouble1)nslGetValue("marmolModel.smaPropPrep");
	smaPropMvt = (NslDouble1)nslGetValue("marmolModel.smaPropMvt");
	putamenNext = (NslDouble1)nslGetValue("marmolModel.putamenNext");
	putamenMvt = (NslDouble1)nslGetValue("marmolModel.putamenMvt");
	gpe = (NslDouble1)nslGetValue("marmolModel.gpe");
	gpeMP = (NslDouble1)nslGetValue("marmolModel.gpeMP");
	gpi = (NslDouble1)nslGetValue("marmolModel.gpi");
	gpi = gpi-60.0;
	stn = (NslDouble1)nslGetValue("marmolModel.stn");
	th = (NslDouble1)nslGetValue("marmolModel.th");

    }
} 