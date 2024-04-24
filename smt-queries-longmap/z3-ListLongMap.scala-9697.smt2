; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114796 () Bool)

(assert start!114796)

(declare-fun b!1360718 () Bool)

(declare-fun res!904422 () Bool)

(declare-fun e!772241 () Bool)

(assert (=> b!1360718 (=> (not res!904422) (not e!772241))))

(declare-datatypes ((List!31780 0))(
  ( (Nil!31777) (Cons!31776 (h!32994 (_ BitVec 64)) (t!46445 List!31780)) )
))
(declare-fun acc!759 () List!31780)

(declare-fun contains!9492 (List!31780 (_ BitVec 64)) Bool)

(assert (=> b!1360718 (= res!904422 (not (contains!9492 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360720 () Bool)

(declare-fun res!904416 () Bool)

(assert (=> b!1360720 (=> (not res!904416) (not e!772241))))

(assert (=> b!1360720 (= res!904416 (not (contains!9492 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360721 () Bool)

(declare-fun e!772242 () Bool)

(assert (=> b!1360721 (= e!772241 e!772242)))

(declare-fun res!904417 () Bool)

(assert (=> b!1360721 (=> (not res!904417) (not e!772242))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360721 (= res!904417 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44696 0))(
  ( (Unit!44697) )
))
(declare-fun lt!600076 () Unit!44696)

(declare-fun e!772240 () Unit!44696)

(assert (=> b!1360721 (= lt!600076 e!772240)))

(declare-fun c!127600 () Bool)

(declare-datatypes ((array!92632 0))(
  ( (array!92633 (arr!44752 (Array (_ BitVec 32) (_ BitVec 64))) (size!45303 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92632)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360721 (= c!127600 (validKeyInArray!0 (select (arr!44752 a!3742) from!3120)))))

(declare-fun b!1360722 () Bool)

(declare-fun lt!600075 () Unit!44696)

(assert (=> b!1360722 (= e!772240 lt!600075)))

(declare-fun lt!600077 () Unit!44696)

(declare-fun lemmaListSubSeqRefl!0 (List!31780) Unit!44696)

(assert (=> b!1360722 (= lt!600077 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!851 (List!31780 List!31780) Bool)

(assert (=> b!1360722 (subseq!851 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92632 List!31780 List!31780 (_ BitVec 32)) Unit!44696)

(declare-fun $colon$colon!853 (List!31780 (_ BitVec 64)) List!31780)

(assert (=> b!1360722 (= lt!600075 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!853 acc!759 (select (arr!44752 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92632 (_ BitVec 32) List!31780) Bool)

(assert (=> b!1360722 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360723 () Bool)

(declare-fun res!904420 () Bool)

(assert (=> b!1360723 (=> (not res!904420) (not e!772241))))

(assert (=> b!1360723 (= res!904420 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31777))))

(declare-fun res!904421 () Bool)

(assert (=> start!114796 (=> (not res!904421) (not e!772241))))

(assert (=> start!114796 (= res!904421 (and (bvslt (size!45303 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45303 a!3742))))))

(assert (=> start!114796 e!772241))

(assert (=> start!114796 true))

(declare-fun array_inv!34033 (array!92632) Bool)

(assert (=> start!114796 (array_inv!34033 a!3742)))

(declare-fun b!1360719 () Bool)

(declare-fun res!904415 () Bool)

(assert (=> b!1360719 (=> (not res!904415) (not e!772241))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360719 (= res!904415 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360724 () Bool)

(declare-fun res!904419 () Bool)

(assert (=> b!1360724 (=> (not res!904419) (not e!772241))))

(assert (=> b!1360724 (= res!904419 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45303 a!3742))))))

(declare-fun b!1360725 () Bool)

(declare-fun res!904414 () Bool)

(assert (=> b!1360725 (=> (not res!904414) (not e!772241))))

(declare-fun noDuplicate!2323 (List!31780) Bool)

(assert (=> b!1360725 (= res!904414 (noDuplicate!2323 acc!759))))

(declare-fun b!1360726 () Bool)

(declare-fun res!904418 () Bool)

(assert (=> b!1360726 (=> (not res!904418) (not e!772241))))

(assert (=> b!1360726 (= res!904418 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360727 () Bool)

(assert (=> b!1360727 (= e!772242 false)))

(declare-fun lt!600078 () Bool)

(assert (=> b!1360727 (= lt!600078 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1360728 () Bool)

(declare-fun Unit!44698 () Unit!44696)

(assert (=> b!1360728 (= e!772240 Unit!44698)))

(declare-fun b!1360729 () Bool)

(declare-fun res!904413 () Bool)

(assert (=> b!1360729 (=> (not res!904413) (not e!772241))))

(assert (=> b!1360729 (= res!904413 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45303 a!3742)))))

(assert (= (and start!114796 res!904421) b!1360725))

(assert (= (and b!1360725 res!904414) b!1360720))

(assert (= (and b!1360720 res!904416) b!1360718))

(assert (= (and b!1360718 res!904422) b!1360723))

(assert (= (and b!1360723 res!904420) b!1360726))

(assert (= (and b!1360726 res!904418) b!1360724))

(assert (= (and b!1360724 res!904419) b!1360719))

(assert (= (and b!1360719 res!904415) b!1360729))

(assert (= (and b!1360729 res!904413) b!1360721))

(assert (= (and b!1360721 c!127600) b!1360722))

(assert (= (and b!1360721 (not c!127600)) b!1360728))

(assert (= (and b!1360721 res!904417) b!1360727))

(declare-fun m!1246429 () Bool)

(assert (=> b!1360723 m!1246429))

(declare-fun m!1246431 () Bool)

(assert (=> b!1360727 m!1246431))

(declare-fun m!1246433 () Bool)

(assert (=> b!1360720 m!1246433))

(declare-fun m!1246435 () Bool)

(assert (=> b!1360721 m!1246435))

(assert (=> b!1360721 m!1246435))

(declare-fun m!1246437 () Bool)

(assert (=> b!1360721 m!1246437))

(declare-fun m!1246439 () Bool)

(assert (=> b!1360725 m!1246439))

(declare-fun m!1246441 () Bool)

(assert (=> b!1360718 m!1246441))

(declare-fun m!1246443 () Bool)

(assert (=> b!1360726 m!1246443))

(declare-fun m!1246445 () Bool)

(assert (=> start!114796 m!1246445))

(declare-fun m!1246447 () Bool)

(assert (=> b!1360719 m!1246447))

(declare-fun m!1246449 () Bool)

(assert (=> b!1360722 m!1246449))

(assert (=> b!1360722 m!1246435))

(declare-fun m!1246451 () Bool)

(assert (=> b!1360722 m!1246451))

(declare-fun m!1246453 () Bool)

(assert (=> b!1360722 m!1246453))

(assert (=> b!1360722 m!1246431))

(assert (=> b!1360722 m!1246435))

(assert (=> b!1360722 m!1246451))

(declare-fun m!1246455 () Bool)

(assert (=> b!1360722 m!1246455))

(check-sat (not b!1360725) (not b!1360720) (not b!1360723) (not b!1360721) (not b!1360719) (not start!114796) (not b!1360726) (not b!1360718) (not b!1360722) (not b!1360727))
(check-sat)
