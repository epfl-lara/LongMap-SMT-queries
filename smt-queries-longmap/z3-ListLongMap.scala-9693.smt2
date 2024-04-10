; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114496 () Bool)

(assert start!114496)

(declare-fun b!1358883 () Bool)

(declare-fun res!903459 () Bool)

(declare-fun e!771140 () Bool)

(assert (=> b!1358883 (=> (not res!903459) (not e!771140))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92492 0))(
  ( (array!92493 (arr!44688 (Array (_ BitVec 32) (_ BitVec 64))) (size!45238 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92492)

(assert (=> b!1358883 (= res!903459 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45238 a!3742))))))

(declare-fun b!1358884 () Bool)

(declare-fun res!903461 () Bool)

(assert (=> b!1358884 (=> (not res!903461) (not e!771140))))

(declare-datatypes ((List!31729 0))(
  ( (Nil!31726) (Cons!31725 (h!32934 (_ BitVec 64)) (t!46399 List!31729)) )
))
(declare-fun acc!759 () List!31729)

(declare-fun contains!9438 (List!31729 (_ BitVec 64)) Bool)

(assert (=> b!1358884 (= res!903461 (not (contains!9438 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358885 () Bool)

(declare-datatypes ((Unit!44724 0))(
  ( (Unit!44725) )
))
(declare-fun e!771141 () Unit!44724)

(declare-fun lt!599461 () Unit!44724)

(assert (=> b!1358885 (= e!771141 lt!599461)))

(declare-fun lt!599460 () Unit!44724)

(declare-fun lemmaListSubSeqRefl!0 (List!31729) Unit!44724)

(assert (=> b!1358885 (= lt!599460 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!840 (List!31729 List!31729) Bool)

(assert (=> b!1358885 (subseq!840 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92492 List!31729 List!31729 (_ BitVec 32)) Unit!44724)

(declare-fun $colon$colon!843 (List!31729 (_ BitVec 64)) List!31729)

(assert (=> b!1358885 (= lt!599461 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!843 acc!759 (select (arr!44688 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92492 (_ BitVec 32) List!31729) Bool)

(assert (=> b!1358885 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!903457 () Bool)

(assert (=> start!114496 (=> (not res!903457) (not e!771140))))

(assert (=> start!114496 (= res!903457 (and (bvslt (size!45238 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45238 a!3742))))))

(assert (=> start!114496 e!771140))

(assert (=> start!114496 true))

(declare-fun array_inv!33716 (array!92492) Bool)

(assert (=> start!114496 (array_inv!33716 a!3742)))

(declare-fun b!1358886 () Bool)

(declare-fun res!903458 () Bool)

(assert (=> b!1358886 (=> (not res!903458) (not e!771140))))

(declare-fun noDuplicate!2295 (List!31729) Bool)

(assert (=> b!1358886 (= res!903458 (noDuplicate!2295 acc!759))))

(declare-fun b!1358887 () Bool)

(assert (=> b!1358887 (= e!771140 false)))

(declare-fun lt!599459 () Unit!44724)

(assert (=> b!1358887 (= lt!599459 e!771141)))

(declare-fun c!127154 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358887 (= c!127154 (validKeyInArray!0 (select (arr!44688 a!3742) from!3120)))))

(declare-fun b!1358888 () Bool)

(declare-fun res!903463 () Bool)

(assert (=> b!1358888 (=> (not res!903463) (not e!771140))))

(assert (=> b!1358888 (= res!903463 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31726))))

(declare-fun b!1358889 () Bool)

(declare-fun Unit!44726 () Unit!44724)

(assert (=> b!1358889 (= e!771141 Unit!44726)))

(declare-fun b!1358890 () Bool)

(declare-fun res!903462 () Bool)

(assert (=> b!1358890 (=> (not res!903462) (not e!771140))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358890 (= res!903462 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358891 () Bool)

(declare-fun res!903460 () Bool)

(assert (=> b!1358891 (=> (not res!903460) (not e!771140))))

(assert (=> b!1358891 (= res!903460 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358892 () Bool)

(declare-fun res!903455 () Bool)

(assert (=> b!1358892 (=> (not res!903455) (not e!771140))))

(assert (=> b!1358892 (= res!903455 (not (contains!9438 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358893 () Bool)

(declare-fun res!903456 () Bool)

(assert (=> b!1358893 (=> (not res!903456) (not e!771140))))

(assert (=> b!1358893 (= res!903456 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45238 a!3742)))))

(assert (= (and start!114496 res!903457) b!1358886))

(assert (= (and b!1358886 res!903458) b!1358884))

(assert (= (and b!1358884 res!903461) b!1358892))

(assert (= (and b!1358892 res!903455) b!1358888))

(assert (= (and b!1358888 res!903463) b!1358891))

(assert (= (and b!1358891 res!903460) b!1358883))

(assert (= (and b!1358883 res!903459) b!1358890))

(assert (= (and b!1358890 res!903462) b!1358893))

(assert (= (and b!1358893 res!903456) b!1358887))

(assert (= (and b!1358887 c!127154) b!1358885))

(assert (= (and b!1358887 (not c!127154)) b!1358889))

(declare-fun m!1244399 () Bool)

(assert (=> b!1358892 m!1244399))

(declare-fun m!1244401 () Bool)

(assert (=> start!114496 m!1244401))

(declare-fun m!1244403 () Bool)

(assert (=> b!1358888 m!1244403))

(declare-fun m!1244405 () Bool)

(assert (=> b!1358886 m!1244405))

(declare-fun m!1244407 () Bool)

(assert (=> b!1358891 m!1244407))

(declare-fun m!1244409 () Bool)

(assert (=> b!1358884 m!1244409))

(declare-fun m!1244411 () Bool)

(assert (=> b!1358885 m!1244411))

(declare-fun m!1244413 () Bool)

(assert (=> b!1358885 m!1244413))

(declare-fun m!1244415 () Bool)

(assert (=> b!1358885 m!1244415))

(declare-fun m!1244417 () Bool)

(assert (=> b!1358885 m!1244417))

(declare-fun m!1244419 () Bool)

(assert (=> b!1358885 m!1244419))

(assert (=> b!1358885 m!1244413))

(assert (=> b!1358885 m!1244415))

(declare-fun m!1244421 () Bool)

(assert (=> b!1358885 m!1244421))

(assert (=> b!1358887 m!1244413))

(assert (=> b!1358887 m!1244413))

(declare-fun m!1244423 () Bool)

(assert (=> b!1358887 m!1244423))

(declare-fun m!1244425 () Bool)

(assert (=> b!1358890 m!1244425))

(check-sat (not b!1358888) (not b!1358891) (not start!114496) (not b!1358885) (not b!1358887) (not b!1358884) (not b!1358890) (not b!1358892) (not b!1358886))
