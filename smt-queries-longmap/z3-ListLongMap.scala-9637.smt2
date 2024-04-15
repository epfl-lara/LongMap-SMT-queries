; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113960 () Bool)

(assert start!113960)

(declare-fun b!1351876 () Bool)

(declare-fun res!897339 () Bool)

(declare-fun e!768612 () Bool)

(assert (=> b!1351876 (=> (not res!897339) (not e!768612))))

(declare-datatypes ((List!31613 0))(
  ( (Nil!31610) (Cons!31609 (h!32818 (_ BitVec 64)) (t!46263 List!31613)) )
))
(declare-fun acc!759 () List!31613)

(declare-fun contains!9233 (List!31613 (_ BitVec 64)) Bool)

(assert (=> b!1351876 (= res!897339 (not (contains!9233 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351877 () Bool)

(declare-datatypes ((Unit!44139 0))(
  ( (Unit!44140) )
))
(declare-fun e!768610 () Unit!44139)

(declare-fun lt!597195 () Unit!44139)

(assert (=> b!1351877 (= e!768610 lt!597195)))

(declare-fun lt!597193 () Unit!44139)

(declare-fun lemmaListSubSeqRefl!0 (List!31613) Unit!44139)

(assert (=> b!1351877 (= lt!597193 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!689 (List!31613 List!31613) Bool)

(assert (=> b!1351877 (subseq!689 acc!759 acc!759)))

(declare-datatypes ((array!92091 0))(
  ( (array!92092 (arr!44494 (Array (_ BitVec 32) (_ BitVec 64))) (size!45046 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92091)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92091 List!31613 List!31613 (_ BitVec 32)) Unit!44139)

(declare-fun $colon$colon!706 (List!31613 (_ BitVec 64)) List!31613)

(assert (=> b!1351877 (= lt!597195 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!706 acc!759 (select (arr!44494 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92091 (_ BitVec 32) List!31613) Bool)

(assert (=> b!1351877 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351878 () Bool)

(declare-fun e!768613 () Bool)

(assert (=> b!1351878 (= e!768612 e!768613)))

(declare-fun res!897344 () Bool)

(assert (=> b!1351878 (=> (not res!897344) (not e!768613))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351878 (= res!897344 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597196 () Unit!44139)

(assert (=> b!1351878 (= lt!597196 e!768610)))

(declare-fun c!126713 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351878 (= c!126713 (validKeyInArray!0 (select (arr!44494 a!3742) from!3120)))))

(declare-fun b!1351879 () Bool)

(declare-fun Unit!44141 () Unit!44139)

(assert (=> b!1351879 (= e!768610 Unit!44141)))

(declare-fun b!1351880 () Bool)

(declare-fun res!897340 () Bool)

(assert (=> b!1351880 (=> (not res!897340) (not e!768612))))

(assert (=> b!1351880 (= res!897340 (not (contains!9233 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351881 () Bool)

(declare-fun res!897341 () Bool)

(assert (=> b!1351881 (=> (not res!897341) (not e!768612))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351881 (= res!897341 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!897335 () Bool)

(assert (=> start!113960 (=> (not res!897335) (not e!768612))))

(assert (=> start!113960 (= res!897335 (and (bvslt (size!45046 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45046 a!3742))))))

(assert (=> start!113960 e!768612))

(assert (=> start!113960 true))

(declare-fun array_inv!33727 (array!92091) Bool)

(assert (=> start!113960 (array_inv!33727 a!3742)))

(declare-fun b!1351882 () Bool)

(declare-fun res!897336 () Bool)

(assert (=> b!1351882 (=> (not res!897336) (not e!768612))))

(assert (=> b!1351882 (= res!897336 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45046 a!3742)))))

(declare-fun b!1351883 () Bool)

(assert (=> b!1351883 (= e!768613 false)))

(declare-fun lt!597194 () Bool)

(assert (=> b!1351883 (= lt!597194 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351884 () Bool)

(declare-fun res!897343 () Bool)

(assert (=> b!1351884 (=> (not res!897343) (not e!768612))))

(assert (=> b!1351884 (= res!897343 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31610))))

(declare-fun b!1351885 () Bool)

(declare-fun res!897338 () Bool)

(assert (=> b!1351885 (=> (not res!897338) (not e!768612))))

(assert (=> b!1351885 (= res!897338 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351886 () Bool)

(declare-fun res!897337 () Bool)

(assert (=> b!1351886 (=> (not res!897337) (not e!768612))))

(assert (=> b!1351886 (= res!897337 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45046 a!3742))))))

(declare-fun b!1351887 () Bool)

(declare-fun res!897342 () Bool)

(assert (=> b!1351887 (=> (not res!897342) (not e!768612))))

(declare-fun noDuplicate!2148 (List!31613) Bool)

(assert (=> b!1351887 (= res!897342 (noDuplicate!2148 acc!759))))

(assert (= (and start!113960 res!897335) b!1351887))

(assert (= (and b!1351887 res!897342) b!1351880))

(assert (= (and b!1351880 res!897340) b!1351876))

(assert (= (and b!1351876 res!897339) b!1351884))

(assert (= (and b!1351884 res!897343) b!1351885))

(assert (= (and b!1351885 res!897338) b!1351886))

(assert (= (and b!1351886 res!897337) b!1351881))

(assert (= (and b!1351881 res!897341) b!1351882))

(assert (= (and b!1351882 res!897336) b!1351878))

(assert (= (and b!1351878 c!126713) b!1351877))

(assert (= (and b!1351878 (not c!126713)) b!1351879))

(assert (= (and b!1351878 res!897344) b!1351883))

(declare-fun m!1238353 () Bool)

(assert (=> b!1351887 m!1238353))

(declare-fun m!1238355 () Bool)

(assert (=> b!1351881 m!1238355))

(declare-fun m!1238357 () Bool)

(assert (=> b!1351878 m!1238357))

(assert (=> b!1351878 m!1238357))

(declare-fun m!1238359 () Bool)

(assert (=> b!1351878 m!1238359))

(declare-fun m!1238361 () Bool)

(assert (=> b!1351883 m!1238361))

(declare-fun m!1238363 () Bool)

(assert (=> b!1351884 m!1238363))

(declare-fun m!1238365 () Bool)

(assert (=> b!1351880 m!1238365))

(declare-fun m!1238367 () Bool)

(assert (=> b!1351876 m!1238367))

(declare-fun m!1238369 () Bool)

(assert (=> start!113960 m!1238369))

(declare-fun m!1238371 () Bool)

(assert (=> b!1351885 m!1238371))

(declare-fun m!1238373 () Bool)

(assert (=> b!1351877 m!1238373))

(assert (=> b!1351877 m!1238357))

(declare-fun m!1238375 () Bool)

(assert (=> b!1351877 m!1238375))

(declare-fun m!1238377 () Bool)

(assert (=> b!1351877 m!1238377))

(assert (=> b!1351877 m!1238361))

(assert (=> b!1351877 m!1238357))

(assert (=> b!1351877 m!1238375))

(declare-fun m!1238379 () Bool)

(assert (=> b!1351877 m!1238379))

(check-sat (not b!1351878) (not b!1351880) (not start!113960) (not b!1351877) (not b!1351881) (not b!1351883) (not b!1351887) (not b!1351876) (not b!1351885) (not b!1351884))
(check-sat)
