; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114572 () Bool)

(assert start!114572)

(declare-fun b!1359349 () Bool)

(declare-fun res!903875 () Bool)

(declare-fun e!771366 () Bool)

(assert (=> b!1359349 (=> (not res!903875) (not e!771366))))

(declare-datatypes ((List!31793 0))(
  ( (Nil!31790) (Cons!31789 (h!32998 (_ BitVec 64)) (t!46458 List!31793)) )
))
(declare-fun acc!759 () List!31793)

(declare-fun noDuplicate!2328 (List!31793) Bool)

(assert (=> b!1359349 (= res!903875 (noDuplicate!2328 acc!759))))

(declare-fun res!903869 () Bool)

(assert (=> start!114572 (=> (not res!903869) (not e!771366))))

(declare-datatypes ((array!92466 0))(
  ( (array!92467 (arr!44674 (Array (_ BitVec 32) (_ BitVec 64))) (size!45226 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92466)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114572 (= res!903869 (and (bvslt (size!45226 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45226 a!3742))))))

(assert (=> start!114572 e!771366))

(assert (=> start!114572 true))

(declare-fun array_inv!33907 (array!92466) Bool)

(assert (=> start!114572 (array_inv!33907 a!3742)))

(declare-fun b!1359350 () Bool)

(declare-fun res!903874 () Bool)

(assert (=> b!1359350 (=> (not res!903874) (not e!771366))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359350 (= res!903874 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359351 () Bool)

(declare-fun e!771365 () Bool)

(assert (=> b!1359351 (= e!771366 e!771365)))

(declare-fun res!903873 () Bool)

(assert (=> b!1359351 (=> (not res!903873) (not e!771365))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359351 (= res!903873 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44598 0))(
  ( (Unit!44599) )
))
(declare-fun lt!599413 () Unit!44598)

(declare-fun e!771364 () Unit!44598)

(assert (=> b!1359351 (= lt!599413 e!771364)))

(declare-fun c!127184 () Bool)

(assert (=> b!1359351 (= c!127184 (validKeyInArray!0 (select (arr!44674 a!3742) from!3120)))))

(declare-fun b!1359352 () Bool)

(declare-fun res!903867 () Bool)

(assert (=> b!1359352 (=> (not res!903867) (not e!771366))))

(declare-fun arrayNoDuplicates!0 (array!92466 (_ BitVec 32) List!31793) Bool)

(assert (=> b!1359352 (= res!903867 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31790))))

(declare-fun b!1359353 () Bool)

(declare-fun res!903871 () Bool)

(assert (=> b!1359353 (=> (not res!903871) (not e!771366))))

(assert (=> b!1359353 (= res!903871 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45226 a!3742))))))

(declare-fun b!1359354 () Bool)

(assert (=> b!1359354 (= e!771365 false)))

(declare-fun lt!599414 () Bool)

(assert (=> b!1359354 (= lt!599414 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359355 () Bool)

(declare-fun Unit!44600 () Unit!44598)

(assert (=> b!1359355 (= e!771364 Unit!44600)))

(declare-fun b!1359356 () Bool)

(declare-fun lt!599416 () Unit!44598)

(assert (=> b!1359356 (= e!771364 lt!599416)))

(declare-fun lt!599415 () Unit!44598)

(declare-fun lemmaListSubSeqRefl!0 (List!31793) Unit!44598)

(assert (=> b!1359356 (= lt!599415 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!851 (List!31793 List!31793) Bool)

(assert (=> b!1359356 (subseq!851 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92466 List!31793 List!31793 (_ BitVec 32)) Unit!44598)

(declare-fun $colon$colon!856 (List!31793 (_ BitVec 64)) List!31793)

(assert (=> b!1359356 (= lt!599416 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!856 acc!759 (select (arr!44674 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359356 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359357 () Bool)

(declare-fun res!903872 () Bool)

(assert (=> b!1359357 (=> (not res!903872) (not e!771366))))

(declare-fun contains!9413 (List!31793 (_ BitVec 64)) Bool)

(assert (=> b!1359357 (= res!903872 (not (contains!9413 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359358 () Bool)

(declare-fun res!903868 () Bool)

(assert (=> b!1359358 (=> (not res!903868) (not e!771366))))

(assert (=> b!1359358 (= res!903868 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45226 a!3742)))))

(declare-fun b!1359359 () Bool)

(declare-fun res!903866 () Bool)

(assert (=> b!1359359 (=> (not res!903866) (not e!771366))))

(assert (=> b!1359359 (= res!903866 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359360 () Bool)

(declare-fun res!903870 () Bool)

(assert (=> b!1359360 (=> (not res!903870) (not e!771366))))

(assert (=> b!1359360 (= res!903870 (not (contains!9413 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114572 res!903869) b!1359349))

(assert (= (and b!1359349 res!903875) b!1359357))

(assert (= (and b!1359357 res!903872) b!1359360))

(assert (= (and b!1359360 res!903870) b!1359352))

(assert (= (and b!1359352 res!903867) b!1359359))

(assert (= (and b!1359359 res!903866) b!1359353))

(assert (= (and b!1359353 res!903871) b!1359350))

(assert (= (and b!1359350 res!903874) b!1359358))

(assert (= (and b!1359358 res!903868) b!1359351))

(assert (= (and b!1359351 c!127184) b!1359356))

(assert (= (and b!1359351 (not c!127184)) b!1359355))

(assert (= (and b!1359351 res!903873) b!1359354))

(declare-fun m!1244317 () Bool)

(assert (=> b!1359356 m!1244317))

(declare-fun m!1244319 () Bool)

(assert (=> b!1359356 m!1244319))

(declare-fun m!1244321 () Bool)

(assert (=> b!1359356 m!1244321))

(declare-fun m!1244323 () Bool)

(assert (=> b!1359356 m!1244323))

(declare-fun m!1244325 () Bool)

(assert (=> b!1359356 m!1244325))

(assert (=> b!1359356 m!1244319))

(assert (=> b!1359356 m!1244321))

(declare-fun m!1244327 () Bool)

(assert (=> b!1359356 m!1244327))

(declare-fun m!1244329 () Bool)

(assert (=> b!1359357 m!1244329))

(assert (=> b!1359354 m!1244325))

(declare-fun m!1244331 () Bool)

(assert (=> b!1359359 m!1244331))

(assert (=> b!1359351 m!1244319))

(assert (=> b!1359351 m!1244319))

(declare-fun m!1244333 () Bool)

(assert (=> b!1359351 m!1244333))

(declare-fun m!1244335 () Bool)

(assert (=> b!1359349 m!1244335))

(declare-fun m!1244337 () Bool)

(assert (=> b!1359352 m!1244337))

(declare-fun m!1244339 () Bool)

(assert (=> b!1359360 m!1244339))

(declare-fun m!1244341 () Bool)

(assert (=> start!114572 m!1244341))

(declare-fun m!1244343 () Bool)

(assert (=> b!1359350 m!1244343))

(check-sat (not b!1359360) (not b!1359356) (not b!1359359) (not start!114572) (not b!1359357) (not b!1359354) (not b!1359350) (not b!1359349) (not b!1359351) (not b!1359352))
(check-sat)
