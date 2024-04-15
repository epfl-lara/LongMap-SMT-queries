; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114092 () Bool)

(assert start!114092)

(declare-fun b!1354712 () Bool)

(declare-fun res!899779 () Bool)

(declare-fun e!769507 () Bool)

(assert (=> b!1354712 (=> (not res!899779) (not e!769507))))

(declare-datatypes ((List!31679 0))(
  ( (Nil!31676) (Cons!31675 (h!32884 (_ BitVec 64)) (t!46329 List!31679)) )
))
(declare-fun acc!759 () List!31679)

(declare-fun contains!9299 (List!31679 (_ BitVec 64)) Bool)

(assert (=> b!1354712 (= res!899779 (not (contains!9299 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354713 () Bool)

(declare-fun res!899787 () Bool)

(declare-fun e!769505 () Bool)

(assert (=> b!1354713 (=> (not res!899787) (not e!769505))))

(declare-fun lt!598191 () List!31679)

(assert (=> b!1354713 (= res!899787 (not (contains!9299 lt!598191 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354714 () Bool)

(declare-fun res!899782 () Bool)

(assert (=> b!1354714 (=> (not res!899782) (not e!769507))))

(assert (=> b!1354714 (= res!899782 (not (contains!9299 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354715 () Bool)

(declare-fun res!899778 () Bool)

(assert (=> b!1354715 (=> (not res!899778) (not e!769507))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354715 (= res!899778 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!899786 () Bool)

(assert (=> start!114092 (=> (not res!899786) (not e!769507))))

(declare-datatypes ((array!92223 0))(
  ( (array!92224 (arr!44560 (Array (_ BitVec 32) (_ BitVec 64))) (size!45112 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92223)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114092 (= res!899786 (and (bvslt (size!45112 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45112 a!3742))))))

(assert (=> start!114092 e!769507))

(assert (=> start!114092 true))

(declare-fun array_inv!33793 (array!92223) Bool)

(assert (=> start!114092 (array_inv!33793 a!3742)))

(declare-fun b!1354716 () Bool)

(declare-datatypes ((Unit!44337 0))(
  ( (Unit!44338) )
))
(declare-fun e!769503 () Unit!44337)

(declare-fun Unit!44339 () Unit!44337)

(assert (=> b!1354716 (= e!769503 Unit!44339)))

(declare-fun b!1354717 () Bool)

(declare-fun res!899784 () Bool)

(assert (=> b!1354717 (=> (not res!899784) (not e!769507))))

(declare-fun arrayNoDuplicates!0 (array!92223 (_ BitVec 32) List!31679) Bool)

(assert (=> b!1354717 (= res!899784 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31676))))

(declare-fun b!1354718 () Bool)

(declare-fun res!899781 () Bool)

(assert (=> b!1354718 (=> (not res!899781) (not e!769505))))

(assert (=> b!1354718 (= res!899781 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598191))))

(declare-fun b!1354719 () Bool)

(declare-fun res!899776 () Bool)

(assert (=> b!1354719 (=> (not res!899776) (not e!769507))))

(assert (=> b!1354719 (= res!899776 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354720 () Bool)

(declare-fun e!769506 () Bool)

(assert (=> b!1354720 (= e!769507 e!769506)))

(declare-fun res!899789 () Bool)

(assert (=> b!1354720 (=> (not res!899789) (not e!769506))))

(declare-fun lt!598190 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354720 (= res!899789 (and (not (= from!3120 i!1404)) lt!598190))))

(declare-fun lt!598187 () Unit!44337)

(assert (=> b!1354720 (= lt!598187 e!769503)))

(declare-fun c!126911 () Bool)

(assert (=> b!1354720 (= c!126911 lt!598190)))

(assert (=> b!1354720 (= lt!598190 (validKeyInArray!0 (select (arr!44560 a!3742) from!3120)))))

(declare-fun b!1354721 () Bool)

(declare-fun res!899788 () Bool)

(assert (=> b!1354721 (=> (not res!899788) (not e!769507))))

(assert (=> b!1354721 (= res!899788 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45112 a!3742))))))

(declare-fun b!1354722 () Bool)

(assert (=> b!1354722 (= e!769506 e!769505)))

(declare-fun res!899785 () Bool)

(assert (=> b!1354722 (=> (not res!899785) (not e!769505))))

(assert (=> b!1354722 (= res!899785 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!772 (List!31679 (_ BitVec 64)) List!31679)

(assert (=> b!1354722 (= lt!598191 ($colon$colon!772 acc!759 (select (arr!44560 a!3742) from!3120)))))

(declare-fun b!1354723 () Bool)

(declare-fun res!899780 () Bool)

(assert (=> b!1354723 (=> (not res!899780) (not e!769505))))

(declare-fun noDuplicate!2214 (List!31679) Bool)

(assert (=> b!1354723 (= res!899780 (noDuplicate!2214 lt!598191))))

(declare-fun b!1354724 () Bool)

(declare-fun res!899783 () Bool)

(assert (=> b!1354724 (=> (not res!899783) (not e!769507))))

(assert (=> b!1354724 (= res!899783 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45112 a!3742)))))

(declare-fun b!1354725 () Bool)

(declare-fun res!899777 () Bool)

(assert (=> b!1354725 (=> (not res!899777) (not e!769507))))

(assert (=> b!1354725 (= res!899777 (noDuplicate!2214 acc!759))))

(declare-fun b!1354726 () Bool)

(declare-fun res!899775 () Bool)

(assert (=> b!1354726 (=> (not res!899775) (not e!769505))))

(assert (=> b!1354726 (= res!899775 (not (contains!9299 lt!598191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354727 () Bool)

(assert (=> b!1354727 (= e!769505 (not true))))

(assert (=> b!1354727 (arrayNoDuplicates!0 (array!92224 (store (arr!44560 a!3742) i!1404 l!3587) (size!45112 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598191)))

(declare-fun lt!598189 () Unit!44337)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31679) Unit!44337)

(assert (=> b!1354727 (= lt!598189 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598191))))

(declare-fun b!1354728 () Bool)

(declare-fun lt!598188 () Unit!44337)

(assert (=> b!1354728 (= e!769503 lt!598188)))

(declare-fun lt!598192 () Unit!44337)

(declare-fun lemmaListSubSeqRefl!0 (List!31679) Unit!44337)

(assert (=> b!1354728 (= lt!598192 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!755 (List!31679 List!31679) Bool)

(assert (=> b!1354728 (subseq!755 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92223 List!31679 List!31679 (_ BitVec 32)) Unit!44337)

(assert (=> b!1354728 (= lt!598188 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!772 acc!759 (select (arr!44560 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354728 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114092 res!899786) b!1354725))

(assert (= (and b!1354725 res!899777) b!1354712))

(assert (= (and b!1354712 res!899779) b!1354714))

(assert (= (and b!1354714 res!899782) b!1354717))

(assert (= (and b!1354717 res!899784) b!1354719))

(assert (= (and b!1354719 res!899776) b!1354721))

(assert (= (and b!1354721 res!899788) b!1354715))

(assert (= (and b!1354715 res!899778) b!1354724))

(assert (= (and b!1354724 res!899783) b!1354720))

(assert (= (and b!1354720 c!126911) b!1354728))

(assert (= (and b!1354720 (not c!126911)) b!1354716))

(assert (= (and b!1354720 res!899789) b!1354722))

(assert (= (and b!1354722 res!899785) b!1354723))

(assert (= (and b!1354723 res!899780) b!1354726))

(assert (= (and b!1354726 res!899775) b!1354713))

(assert (= (and b!1354713 res!899787) b!1354718))

(assert (= (and b!1354718 res!899781) b!1354727))

(declare-fun m!1240573 () Bool)

(assert (=> b!1354725 m!1240573))

(declare-fun m!1240575 () Bool)

(assert (=> b!1354728 m!1240575))

(declare-fun m!1240577 () Bool)

(assert (=> b!1354728 m!1240577))

(declare-fun m!1240579 () Bool)

(assert (=> b!1354728 m!1240579))

(declare-fun m!1240581 () Bool)

(assert (=> b!1354728 m!1240581))

(declare-fun m!1240583 () Bool)

(assert (=> b!1354728 m!1240583))

(assert (=> b!1354728 m!1240577))

(assert (=> b!1354728 m!1240579))

(declare-fun m!1240585 () Bool)

(assert (=> b!1354728 m!1240585))

(declare-fun m!1240587 () Bool)

(assert (=> b!1354718 m!1240587))

(declare-fun m!1240589 () Bool)

(assert (=> b!1354715 m!1240589))

(assert (=> b!1354720 m!1240577))

(assert (=> b!1354720 m!1240577))

(declare-fun m!1240591 () Bool)

(assert (=> b!1354720 m!1240591))

(assert (=> b!1354722 m!1240577))

(assert (=> b!1354722 m!1240577))

(assert (=> b!1354722 m!1240579))

(declare-fun m!1240593 () Bool)

(assert (=> b!1354713 m!1240593))

(declare-fun m!1240595 () Bool)

(assert (=> b!1354717 m!1240595))

(declare-fun m!1240597 () Bool)

(assert (=> b!1354726 m!1240597))

(declare-fun m!1240599 () Bool)

(assert (=> b!1354719 m!1240599))

(declare-fun m!1240601 () Bool)

(assert (=> start!114092 m!1240601))

(declare-fun m!1240603 () Bool)

(assert (=> b!1354723 m!1240603))

(declare-fun m!1240605 () Bool)

(assert (=> b!1354712 m!1240605))

(declare-fun m!1240607 () Bool)

(assert (=> b!1354714 m!1240607))

(declare-fun m!1240609 () Bool)

(assert (=> b!1354727 m!1240609))

(declare-fun m!1240611 () Bool)

(assert (=> b!1354727 m!1240611))

(declare-fun m!1240613 () Bool)

(assert (=> b!1354727 m!1240613))

(check-sat (not b!1354728) (not b!1354719) (not b!1354714) (not b!1354726) (not b!1354715) (not b!1354725) (not b!1354722) (not b!1354712) (not b!1354713) (not start!114092) (not b!1354727) (not b!1354720) (not b!1354718) (not b!1354717) (not b!1354723))
(check-sat)
