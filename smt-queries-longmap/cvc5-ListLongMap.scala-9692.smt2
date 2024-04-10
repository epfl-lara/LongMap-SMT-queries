; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114488 () Bool)

(assert start!114488)

(declare-fun b!1358751 () Bool)

(declare-fun res!903353 () Bool)

(declare-fun e!771104 () Bool)

(assert (=> b!1358751 (=> (not res!903353) (not e!771104))))

(declare-datatypes ((List!31725 0))(
  ( (Nil!31722) (Cons!31721 (h!32930 (_ BitVec 64)) (t!46395 List!31725)) )
))
(declare-fun acc!759 () List!31725)

(declare-fun contains!9434 (List!31725 (_ BitVec 64)) Bool)

(assert (=> b!1358751 (= res!903353 (not (contains!9434 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358752 () Bool)

(declare-fun res!903355 () Bool)

(assert (=> b!1358752 (=> (not res!903355) (not e!771104))))

(declare-datatypes ((array!92484 0))(
  ( (array!92485 (arr!44684 (Array (_ BitVec 32) (_ BitVec 64))) (size!45234 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92484)

(declare-fun arrayNoDuplicates!0 (array!92484 (_ BitVec 32) List!31725) Bool)

(assert (=> b!1358752 (= res!903355 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31722))))

(declare-fun b!1358753 () Bool)

(declare-fun res!903351 () Bool)

(assert (=> b!1358753 (=> (not res!903351) (not e!771104))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358753 (= res!903351 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45234 a!3742))))))

(declare-fun b!1358754 () Bool)

(declare-fun res!903349 () Bool)

(assert (=> b!1358754 (=> (not res!903349) (not e!771104))))

(assert (=> b!1358754 (= res!903349 (not (contains!9434 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358755 () Bool)

(declare-datatypes ((Unit!44712 0))(
  ( (Unit!44713) )
))
(declare-fun e!771105 () Unit!44712)

(declare-fun lt!599424 () Unit!44712)

(assert (=> b!1358755 (= e!771105 lt!599424)))

(declare-fun lt!599425 () Unit!44712)

(declare-fun lemmaListSubSeqRefl!0 (List!31725) Unit!44712)

(assert (=> b!1358755 (= lt!599425 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!836 (List!31725 List!31725) Bool)

(assert (=> b!1358755 (subseq!836 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92484 List!31725 List!31725 (_ BitVec 32)) Unit!44712)

(declare-fun $colon$colon!839 (List!31725 (_ BitVec 64)) List!31725)

(assert (=> b!1358755 (= lt!599424 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!839 acc!759 (select (arr!44684 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358755 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358756 () Bool)

(declare-fun res!903352 () Bool)

(assert (=> b!1358756 (=> (not res!903352) (not e!771104))))

(assert (=> b!1358756 (= res!903352 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45234 a!3742)))))

(declare-fun b!1358757 () Bool)

(assert (=> b!1358757 (= e!771104 false)))

(declare-fun lt!599423 () Unit!44712)

(assert (=> b!1358757 (= lt!599423 e!771105)))

(declare-fun c!127142 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358757 (= c!127142 (validKeyInArray!0 (select (arr!44684 a!3742) from!3120)))))

(declare-fun res!903354 () Bool)

(assert (=> start!114488 (=> (not res!903354) (not e!771104))))

(assert (=> start!114488 (= res!903354 (and (bvslt (size!45234 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45234 a!3742))))))

(assert (=> start!114488 e!771104))

(assert (=> start!114488 true))

(declare-fun array_inv!33712 (array!92484) Bool)

(assert (=> start!114488 (array_inv!33712 a!3742)))

(declare-fun b!1358758 () Bool)

(declare-fun Unit!44714 () Unit!44712)

(assert (=> b!1358758 (= e!771105 Unit!44714)))

(declare-fun b!1358759 () Bool)

(declare-fun res!903347 () Bool)

(assert (=> b!1358759 (=> (not res!903347) (not e!771104))))

(assert (=> b!1358759 (= res!903347 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358760 () Bool)

(declare-fun res!903350 () Bool)

(assert (=> b!1358760 (=> (not res!903350) (not e!771104))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358760 (= res!903350 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358761 () Bool)

(declare-fun res!903348 () Bool)

(assert (=> b!1358761 (=> (not res!903348) (not e!771104))))

(declare-fun noDuplicate!2291 (List!31725) Bool)

(assert (=> b!1358761 (= res!903348 (noDuplicate!2291 acc!759))))

(assert (= (and start!114488 res!903354) b!1358761))

(assert (= (and b!1358761 res!903348) b!1358751))

(assert (= (and b!1358751 res!903353) b!1358754))

(assert (= (and b!1358754 res!903349) b!1358752))

(assert (= (and b!1358752 res!903355) b!1358759))

(assert (= (and b!1358759 res!903347) b!1358753))

(assert (= (and b!1358753 res!903351) b!1358760))

(assert (= (and b!1358760 res!903350) b!1358756))

(assert (= (and b!1358756 res!903352) b!1358757))

(assert (= (and b!1358757 c!127142) b!1358755))

(assert (= (and b!1358757 (not c!127142)) b!1358758))

(declare-fun m!1244287 () Bool)

(assert (=> b!1358755 m!1244287))

(declare-fun m!1244289 () Bool)

(assert (=> b!1358755 m!1244289))

(declare-fun m!1244291 () Bool)

(assert (=> b!1358755 m!1244291))

(declare-fun m!1244293 () Bool)

(assert (=> b!1358755 m!1244293))

(declare-fun m!1244295 () Bool)

(assert (=> b!1358755 m!1244295))

(assert (=> b!1358755 m!1244289))

(assert (=> b!1358755 m!1244291))

(declare-fun m!1244297 () Bool)

(assert (=> b!1358755 m!1244297))

(declare-fun m!1244299 () Bool)

(assert (=> b!1358751 m!1244299))

(declare-fun m!1244301 () Bool)

(assert (=> b!1358752 m!1244301))

(assert (=> b!1358757 m!1244289))

(assert (=> b!1358757 m!1244289))

(declare-fun m!1244303 () Bool)

(assert (=> b!1358757 m!1244303))

(declare-fun m!1244305 () Bool)

(assert (=> b!1358760 m!1244305))

(declare-fun m!1244307 () Bool)

(assert (=> b!1358761 m!1244307))

(declare-fun m!1244309 () Bool)

(assert (=> b!1358754 m!1244309))

(declare-fun m!1244311 () Bool)

(assert (=> start!114488 m!1244311))

(declare-fun m!1244313 () Bool)

(assert (=> b!1358759 m!1244313))

(push 1)

(assert (not b!1358757))

(assert (not b!1358754))

(assert (not start!114488))

(assert (not b!1358751))

(assert (not b!1358752))

(assert (not b!1358759))

(assert (not b!1358760))

(assert (not b!1358761))

(assert (not b!1358755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

