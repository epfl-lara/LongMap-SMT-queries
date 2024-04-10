; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113928 () Bool)

(assert start!113928)

(declare-fun b!1351286 () Bool)

(declare-fun res!896748 () Bool)

(declare-fun e!768481 () Bool)

(assert (=> b!1351286 (=> (not res!896748) (not e!768481))))

(declare-datatypes ((array!92110 0))(
  ( (array!92111 (arr!44503 (Array (_ BitVec 32) (_ BitVec 64))) (size!45053 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92110)

(declare-datatypes ((List!31544 0))(
  ( (Nil!31541) (Cons!31540 (h!32749 (_ BitVec 64)) (t!46202 List!31544)) )
))
(declare-fun arrayNoDuplicates!0 (array!92110 (_ BitVec 32) List!31544) Bool)

(assert (=> b!1351286 (= res!896748 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31541))))

(declare-fun b!1351287 () Bool)

(declare-fun res!896745 () Bool)

(assert (=> b!1351287 (=> (not res!896745) (not e!768481))))

(declare-fun acc!759 () List!31544)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351287 (= res!896745 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351288 () Bool)

(declare-fun res!896747 () Bool)

(assert (=> b!1351288 (=> (not res!896747) (not e!768481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351288 (= res!896747 (validKeyInArray!0 (select (arr!44503 a!3742) from!3120)))))

(declare-fun b!1351289 () Bool)

(declare-fun res!896749 () Bool)

(declare-fun e!768479 () Bool)

(assert (=> b!1351289 (=> res!896749 e!768479)))

(declare-fun lt!597188 () List!31544)

(declare-fun contains!9253 (List!31544 (_ BitVec 64)) Bool)

(assert (=> b!1351289 (= res!896749 (contains!9253 lt!597188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!896744 () Bool)

(assert (=> start!113928 (=> (not res!896744) (not e!768481))))

(assert (=> start!113928 (= res!896744 (and (bvslt (size!45053 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45053 a!3742))))))

(assert (=> start!113928 e!768481))

(assert (=> start!113928 true))

(declare-fun array_inv!33531 (array!92110) Bool)

(assert (=> start!113928 (array_inv!33531 a!3742)))

(declare-fun b!1351290 () Bool)

(declare-fun res!896746 () Bool)

(assert (=> b!1351290 (=> (not res!896746) (not e!768481))))

(declare-fun noDuplicate!2110 (List!31544) Bool)

(assert (=> b!1351290 (= res!896746 (noDuplicate!2110 acc!759))))

(declare-fun b!1351291 () Bool)

(assert (=> b!1351291 (= e!768481 (not e!768479))))

(declare-fun res!896754 () Bool)

(assert (=> b!1351291 (=> res!896754 e!768479)))

(assert (=> b!1351291 (= res!896754 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!688 (List!31544 (_ BitVec 64)) List!31544)

(assert (=> b!1351291 (= lt!597188 ($colon$colon!688 acc!759 (select (arr!44503 a!3742) from!3120)))))

(declare-fun subseq!673 (List!31544 List!31544) Bool)

(assert (=> b!1351291 (subseq!673 acc!759 acc!759)))

(declare-datatypes ((Unit!44260 0))(
  ( (Unit!44261) )
))
(declare-fun lt!597190 () Unit!44260)

(declare-fun lemmaListSubSeqRefl!0 (List!31544) Unit!44260)

(assert (=> b!1351291 (= lt!597190 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351292 () Bool)

(declare-fun res!896751 () Bool)

(assert (=> b!1351292 (=> res!896751 e!768479)))

(assert (=> b!1351292 (= res!896751 (contains!9253 lt!597188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351293 () Bool)

(declare-fun res!896752 () Bool)

(assert (=> b!1351293 (=> res!896752 e!768479)))

(assert (=> b!1351293 (= res!896752 (not (noDuplicate!2110 lt!597188)))))

(declare-fun b!1351294 () Bool)

(assert (=> b!1351294 (= e!768479 true)))

(declare-fun lt!597187 () Bool)

(assert (=> b!1351294 (= lt!597187 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597188))))

(declare-fun lt!597189 () Unit!44260)

(declare-fun noDuplicateSubseq!124 (List!31544 List!31544) Unit!44260)

(assert (=> b!1351294 (= lt!597189 (noDuplicateSubseq!124 acc!759 lt!597188))))

(declare-fun b!1351295 () Bool)

(declare-fun res!896755 () Bool)

(assert (=> b!1351295 (=> (not res!896755) (not e!768481))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351295 (= res!896755 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45053 a!3742))))))

(declare-fun b!1351296 () Bool)

(declare-fun res!896757 () Bool)

(assert (=> b!1351296 (=> (not res!896757) (not e!768481))))

(assert (=> b!1351296 (= res!896757 (not (contains!9253 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351297 () Bool)

(declare-fun res!896750 () Bool)

(assert (=> b!1351297 (=> (not res!896750) (not e!768481))))

(assert (=> b!1351297 (= res!896750 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45053 a!3742)))))

(declare-fun b!1351298 () Bool)

(declare-fun res!896758 () Bool)

(assert (=> b!1351298 (=> (not res!896758) (not e!768481))))

(assert (=> b!1351298 (= res!896758 (not (contains!9253 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351299 () Bool)

(declare-fun res!896756 () Bool)

(assert (=> b!1351299 (=> (not res!896756) (not e!768481))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351299 (= res!896756 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351300 () Bool)

(declare-fun res!896753 () Bool)

(assert (=> b!1351300 (=> res!896753 e!768479)))

(assert (=> b!1351300 (= res!896753 (not (subseq!673 acc!759 lt!597188)))))

(assert (= (and start!113928 res!896744) b!1351290))

(assert (= (and b!1351290 res!896746) b!1351296))

(assert (= (and b!1351296 res!896757) b!1351298))

(assert (= (and b!1351298 res!896758) b!1351286))

(assert (= (and b!1351286 res!896748) b!1351287))

(assert (= (and b!1351287 res!896745) b!1351295))

(assert (= (and b!1351295 res!896755) b!1351299))

(assert (= (and b!1351299 res!896756) b!1351297))

(assert (= (and b!1351297 res!896750) b!1351288))

(assert (= (and b!1351288 res!896747) b!1351291))

(assert (= (and b!1351291 (not res!896754)) b!1351293))

(assert (= (and b!1351293 (not res!896752)) b!1351289))

(assert (= (and b!1351289 (not res!896749)) b!1351292))

(assert (= (and b!1351292 (not res!896751)) b!1351300))

(assert (= (and b!1351300 (not res!896753)) b!1351294))

(declare-fun m!1238341 () Bool)

(assert (=> b!1351290 m!1238341))

(declare-fun m!1238343 () Bool)

(assert (=> b!1351289 m!1238343))

(declare-fun m!1238345 () Bool)

(assert (=> start!113928 m!1238345))

(declare-fun m!1238347 () Bool)

(assert (=> b!1351291 m!1238347))

(assert (=> b!1351291 m!1238347))

(declare-fun m!1238349 () Bool)

(assert (=> b!1351291 m!1238349))

(declare-fun m!1238351 () Bool)

(assert (=> b!1351291 m!1238351))

(declare-fun m!1238353 () Bool)

(assert (=> b!1351291 m!1238353))

(declare-fun m!1238355 () Bool)

(assert (=> b!1351293 m!1238355))

(declare-fun m!1238357 () Bool)

(assert (=> b!1351298 m!1238357))

(declare-fun m!1238359 () Bool)

(assert (=> b!1351300 m!1238359))

(declare-fun m!1238361 () Bool)

(assert (=> b!1351294 m!1238361))

(declare-fun m!1238363 () Bool)

(assert (=> b!1351294 m!1238363))

(assert (=> b!1351288 m!1238347))

(assert (=> b!1351288 m!1238347))

(declare-fun m!1238365 () Bool)

(assert (=> b!1351288 m!1238365))

(declare-fun m!1238367 () Bool)

(assert (=> b!1351286 m!1238367))

(declare-fun m!1238369 () Bool)

(assert (=> b!1351292 m!1238369))

(declare-fun m!1238371 () Bool)

(assert (=> b!1351299 m!1238371))

(declare-fun m!1238373 () Bool)

(assert (=> b!1351287 m!1238373))

(declare-fun m!1238375 () Bool)

(assert (=> b!1351296 m!1238375))

(push 1)

(assert (not b!1351293))

(assert (not b!1351296))

(assert (not b!1351290))

(assert (not b!1351287))

(assert (not b!1351298))

(assert (not b!1351294))

(assert (not b!1351289))

(assert (not b!1351299))

(assert (not b!1351300))

(assert (not b!1351286))

(assert (not start!113928))

(assert (not b!1351291))

(assert (not b!1351292))

(assert (not b!1351288))

(check-sat)

(pop 1)

(push 1)

