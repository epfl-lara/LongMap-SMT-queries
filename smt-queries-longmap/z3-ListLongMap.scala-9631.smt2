; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114148 () Bool)

(assert start!114148)

(declare-fun b!1352495 () Bool)

(declare-fun res!897176 () Bool)

(declare-fun e!769305 () Bool)

(assert (=> b!1352495 (=> res!897176 e!769305)))

(declare-datatypes ((List!31582 0))(
  ( (Nil!31579) (Cons!31578 (h!32796 (_ BitVec 64)) (t!46232 List!31582)) )
))
(declare-fun acc!759 () List!31582)

(declare-fun lt!597641 () List!31582)

(declare-fun subseq!671 (List!31582 List!31582) Bool)

(assert (=> b!1352495 (= res!897176 (not (subseq!671 acc!759 lt!597641)))))

(declare-fun b!1352496 () Bool)

(declare-fun res!897178 () Bool)

(assert (=> b!1352496 (=> res!897178 e!769305)))

(declare-fun noDuplicate!2125 (List!31582) Bool)

(assert (=> b!1352496 (= res!897178 (not (noDuplicate!2125 lt!597641)))))

(declare-fun b!1352497 () Bool)

(declare-fun res!897175 () Bool)

(declare-fun e!769306 () Bool)

(assert (=> b!1352497 (=> (not res!897175) (not e!769306))))

(declare-fun contains!9294 (List!31582 (_ BitVec 64)) Bool)

(assert (=> b!1352497 (= res!897175 (not (contains!9294 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352498 () Bool)

(declare-fun res!897173 () Bool)

(assert (=> b!1352498 (=> (not res!897173) (not e!769306))))

(assert (=> b!1352498 (= res!897173 (noDuplicate!2125 acc!759))))

(declare-fun b!1352499 () Bool)

(declare-fun res!897180 () Bool)

(assert (=> b!1352499 (=> (not res!897180) (not e!769306))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92221 0))(
  ( (array!92222 (arr!44554 (Array (_ BitVec 32) (_ BitVec 64))) (size!45105 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92221)

(assert (=> b!1352499 (= res!897180 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45105 a!3742)))))

(declare-fun b!1352500 () Bool)

(declare-fun res!897182 () Bool)

(assert (=> b!1352500 (=> res!897182 e!769305)))

(assert (=> b!1352500 (= res!897182 (contains!9294 lt!597641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352501 () Bool)

(assert (=> b!1352501 (= e!769305 true)))

(declare-fun lt!597640 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92221 (_ BitVec 32) List!31582) Bool)

(assert (=> b!1352501 (= lt!597640 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597641))))

(declare-datatypes ((Unit!44195 0))(
  ( (Unit!44196) )
))
(declare-fun lt!597642 () Unit!44195)

(declare-fun noDuplicateSubseq!122 (List!31582 List!31582) Unit!44195)

(assert (=> b!1352501 (= lt!597642 (noDuplicateSubseq!122 acc!759 lt!597641))))

(declare-fun b!1352502 () Bool)

(declare-fun res!897174 () Bool)

(assert (=> b!1352502 (=> (not res!897174) (not e!769306))))

(assert (=> b!1352502 (= res!897174 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31579))))

(declare-fun res!897172 () Bool)

(assert (=> start!114148 (=> (not res!897172) (not e!769306))))

(assert (=> start!114148 (= res!897172 (and (bvslt (size!45105 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45105 a!3742))))))

(assert (=> start!114148 e!769306))

(assert (=> start!114148 true))

(declare-fun array_inv!33835 (array!92221) Bool)

(assert (=> start!114148 (array_inv!33835 a!3742)))

(declare-fun b!1352503 () Bool)

(declare-fun res!897177 () Bool)

(assert (=> b!1352503 (=> res!897177 e!769305)))

(assert (=> b!1352503 (= res!897177 (contains!9294 lt!597641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352504 () Bool)

(declare-fun res!897186 () Bool)

(assert (=> b!1352504 (=> (not res!897186) (not e!769306))))

(assert (=> b!1352504 (= res!897186 (not (contains!9294 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352505 () Bool)

(declare-fun res!897185 () Bool)

(assert (=> b!1352505 (=> (not res!897185) (not e!769306))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352505 (= res!897185 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45105 a!3742))))))

(declare-fun b!1352506 () Bool)

(declare-fun res!897181 () Bool)

(assert (=> b!1352506 (=> (not res!897181) (not e!769306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352506 (= res!897181 (validKeyInArray!0 (select (arr!44554 a!3742) from!3120)))))

(declare-fun b!1352507 () Bool)

(declare-fun res!897184 () Bool)

(assert (=> b!1352507 (=> (not res!897184) (not e!769306))))

(assert (=> b!1352507 (= res!897184 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352508 () Bool)

(declare-fun res!897179 () Bool)

(assert (=> b!1352508 (=> (not res!897179) (not e!769306))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352508 (= res!897179 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352509 () Bool)

(assert (=> b!1352509 (= e!769306 (not e!769305))))

(declare-fun res!897183 () Bool)

(assert (=> b!1352509 (=> res!897183 e!769305)))

(assert (=> b!1352509 (= res!897183 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!685 (List!31582 (_ BitVec 64)) List!31582)

(assert (=> b!1352509 (= lt!597641 ($colon$colon!685 acc!759 (select (arr!44554 a!3742) from!3120)))))

(assert (=> b!1352509 (subseq!671 acc!759 acc!759)))

(declare-fun lt!597639 () Unit!44195)

(declare-fun lemmaListSubSeqRefl!0 (List!31582) Unit!44195)

(assert (=> b!1352509 (= lt!597639 (lemmaListSubSeqRefl!0 acc!759))))

(assert (= (and start!114148 res!897172) b!1352498))

(assert (= (and b!1352498 res!897173) b!1352504))

(assert (= (and b!1352504 res!897186) b!1352497))

(assert (= (and b!1352497 res!897175) b!1352502))

(assert (= (and b!1352502 res!897174) b!1352507))

(assert (= (and b!1352507 res!897184) b!1352505))

(assert (= (and b!1352505 res!897185) b!1352508))

(assert (= (and b!1352508 res!897179) b!1352499))

(assert (= (and b!1352499 res!897180) b!1352506))

(assert (= (and b!1352506 res!897181) b!1352509))

(assert (= (and b!1352509 (not res!897183)) b!1352496))

(assert (= (and b!1352496 (not res!897178)) b!1352503))

(assert (= (and b!1352503 (not res!897177)) b!1352500))

(assert (= (and b!1352500 (not res!897182)) b!1352495))

(assert (= (and b!1352495 (not res!897176)) b!1352501))

(declare-fun m!1239865 () Bool)

(assert (=> b!1352501 m!1239865))

(declare-fun m!1239867 () Bool)

(assert (=> b!1352501 m!1239867))

(declare-fun m!1239869 () Bool)

(assert (=> b!1352503 m!1239869))

(declare-fun m!1239871 () Bool)

(assert (=> b!1352507 m!1239871))

(declare-fun m!1239873 () Bool)

(assert (=> b!1352506 m!1239873))

(assert (=> b!1352506 m!1239873))

(declare-fun m!1239875 () Bool)

(assert (=> b!1352506 m!1239875))

(declare-fun m!1239877 () Bool)

(assert (=> b!1352504 m!1239877))

(declare-fun m!1239879 () Bool)

(assert (=> b!1352500 m!1239879))

(declare-fun m!1239881 () Bool)

(assert (=> b!1352502 m!1239881))

(declare-fun m!1239883 () Bool)

(assert (=> b!1352498 m!1239883))

(declare-fun m!1239885 () Bool)

(assert (=> b!1352496 m!1239885))

(declare-fun m!1239887 () Bool)

(assert (=> b!1352508 m!1239887))

(declare-fun m!1239889 () Bool)

(assert (=> b!1352495 m!1239889))

(declare-fun m!1239891 () Bool)

(assert (=> b!1352497 m!1239891))

(declare-fun m!1239893 () Bool)

(assert (=> start!114148 m!1239893))

(assert (=> b!1352509 m!1239873))

(assert (=> b!1352509 m!1239873))

(declare-fun m!1239895 () Bool)

(assert (=> b!1352509 m!1239895))

(declare-fun m!1239897 () Bool)

(assert (=> b!1352509 m!1239897))

(declare-fun m!1239899 () Bool)

(assert (=> b!1352509 m!1239899))

(check-sat (not b!1352496) (not b!1352498) (not b!1352504) (not b!1352495) (not b!1352501) (not start!114148) (not b!1352497) (not b!1352509) (not b!1352503) (not b!1352508) (not b!1352500) (not b!1352507) (not b!1352502) (not b!1352506))
(check-sat)
