; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114158 () Bool)

(assert start!114158)

(declare-fun b!1352720 () Bool)

(declare-fun res!897409 () Bool)

(declare-fun e!769349 () Bool)

(assert (=> b!1352720 (=> res!897409 e!769349)))

(declare-datatypes ((List!31587 0))(
  ( (Nil!31584) (Cons!31583 (h!32801 (_ BitVec 64)) (t!46237 List!31587)) )
))
(declare-fun acc!759 () List!31587)

(declare-fun lt!597700 () List!31587)

(declare-fun subseq!676 (List!31587 List!31587) Bool)

(assert (=> b!1352720 (= res!897409 (not (subseq!676 acc!759 lt!597700)))))

(declare-fun b!1352721 () Bool)

(declare-fun res!897398 () Bool)

(declare-fun e!769351 () Bool)

(assert (=> b!1352721 (=> (not res!897398) (not e!769351))))

(declare-datatypes ((array!92231 0))(
  ( (array!92232 (arr!44559 (Array (_ BitVec 32) (_ BitVec 64))) (size!45110 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92231)

(declare-fun arrayNoDuplicates!0 (array!92231 (_ BitVec 32) List!31587) Bool)

(assert (=> b!1352721 (= res!897398 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31584))))

(declare-fun b!1352722 () Bool)

(declare-fun res!897400 () Bool)

(assert (=> b!1352722 (=> (not res!897400) (not e!769351))))

(declare-fun noDuplicate!2130 (List!31587) Bool)

(assert (=> b!1352722 (= res!897400 (noDuplicate!2130 acc!759))))

(declare-fun res!897404 () Bool)

(assert (=> start!114158 (=> (not res!897404) (not e!769351))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114158 (= res!897404 (and (bvslt (size!45110 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45110 a!3742))))))

(assert (=> start!114158 e!769351))

(assert (=> start!114158 true))

(declare-fun array_inv!33840 (array!92231) Bool)

(assert (=> start!114158 (array_inv!33840 a!3742)))

(declare-fun b!1352723 () Bool)

(declare-fun res!897399 () Bool)

(assert (=> b!1352723 (=> (not res!897399) (not e!769351))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352723 (= res!897399 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352724 () Bool)

(declare-fun res!897397 () Bool)

(assert (=> b!1352724 (=> res!897397 e!769349)))

(declare-fun contains!9299 (List!31587 (_ BitVec 64)) Bool)

(assert (=> b!1352724 (= res!897397 (contains!9299 lt!597700 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352725 () Bool)

(declare-fun res!897401 () Bool)

(assert (=> b!1352725 (=> (not res!897401) (not e!769351))))

(assert (=> b!1352725 (= res!897401 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352726 () Bool)

(assert (=> b!1352726 (= e!769349 true)))

(declare-fun lt!597699 () Bool)

(assert (=> b!1352726 (= lt!597699 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597700))))

(declare-datatypes ((Unit!44205 0))(
  ( (Unit!44206) )
))
(declare-fun lt!597701 () Unit!44205)

(declare-fun noDuplicateSubseq!127 (List!31587 List!31587) Unit!44205)

(assert (=> b!1352726 (= lt!597701 (noDuplicateSubseq!127 acc!759 lt!597700))))

(declare-fun b!1352727 () Bool)

(declare-fun res!897406 () Bool)

(assert (=> b!1352727 (=> (not res!897406) (not e!769351))))

(assert (=> b!1352727 (= res!897406 (not (contains!9299 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352728 () Bool)

(declare-fun res!897408 () Bool)

(assert (=> b!1352728 (=> (not res!897408) (not e!769351))))

(assert (=> b!1352728 (= res!897408 (validKeyInArray!0 (select (arr!44559 a!3742) from!3120)))))

(declare-fun b!1352729 () Bool)

(declare-fun res!897402 () Bool)

(assert (=> b!1352729 (=> (not res!897402) (not e!769351))))

(assert (=> b!1352729 (= res!897402 (not (contains!9299 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352730 () Bool)

(assert (=> b!1352730 (= e!769351 (not e!769349))))

(declare-fun res!897403 () Bool)

(assert (=> b!1352730 (=> res!897403 e!769349)))

(assert (=> b!1352730 (= res!897403 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!690 (List!31587 (_ BitVec 64)) List!31587)

(assert (=> b!1352730 (= lt!597700 ($colon$colon!690 acc!759 (select (arr!44559 a!3742) from!3120)))))

(assert (=> b!1352730 (subseq!676 acc!759 acc!759)))

(declare-fun lt!597702 () Unit!44205)

(declare-fun lemmaListSubSeqRefl!0 (List!31587) Unit!44205)

(assert (=> b!1352730 (= lt!597702 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1352731 () Bool)

(declare-fun res!897410 () Bool)

(assert (=> b!1352731 (=> res!897410 e!769349)))

(assert (=> b!1352731 (= res!897410 (contains!9299 lt!597700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352732 () Bool)

(declare-fun res!897407 () Bool)

(assert (=> b!1352732 (=> (not res!897407) (not e!769351))))

(assert (=> b!1352732 (= res!897407 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45110 a!3742)))))

(declare-fun b!1352733 () Bool)

(declare-fun res!897405 () Bool)

(assert (=> b!1352733 (=> res!897405 e!769349)))

(assert (=> b!1352733 (= res!897405 (not (noDuplicate!2130 lt!597700)))))

(declare-fun b!1352734 () Bool)

(declare-fun res!897411 () Bool)

(assert (=> b!1352734 (=> (not res!897411) (not e!769351))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352734 (= res!897411 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45110 a!3742))))))

(assert (= (and start!114158 res!897404) b!1352722))

(assert (= (and b!1352722 res!897400) b!1352729))

(assert (= (and b!1352729 res!897402) b!1352727))

(assert (= (and b!1352727 res!897406) b!1352721))

(assert (= (and b!1352721 res!897398) b!1352725))

(assert (= (and b!1352725 res!897401) b!1352734))

(assert (= (and b!1352734 res!897411) b!1352723))

(assert (= (and b!1352723 res!897399) b!1352732))

(assert (= (and b!1352732 res!897407) b!1352728))

(assert (= (and b!1352728 res!897408) b!1352730))

(assert (= (and b!1352730 (not res!897403)) b!1352733))

(assert (= (and b!1352733 (not res!897405)) b!1352731))

(assert (= (and b!1352731 (not res!897410)) b!1352724))

(assert (= (and b!1352724 (not res!897397)) b!1352720))

(assert (= (and b!1352720 (not res!897409)) b!1352726))

(declare-fun m!1240045 () Bool)

(assert (=> b!1352723 m!1240045))

(declare-fun m!1240047 () Bool)

(assert (=> b!1352730 m!1240047))

(assert (=> b!1352730 m!1240047))

(declare-fun m!1240049 () Bool)

(assert (=> b!1352730 m!1240049))

(declare-fun m!1240051 () Bool)

(assert (=> b!1352730 m!1240051))

(declare-fun m!1240053 () Bool)

(assert (=> b!1352730 m!1240053))

(declare-fun m!1240055 () Bool)

(assert (=> b!1352722 m!1240055))

(declare-fun m!1240057 () Bool)

(assert (=> b!1352729 m!1240057))

(declare-fun m!1240059 () Bool)

(assert (=> b!1352733 m!1240059))

(declare-fun m!1240061 () Bool)

(assert (=> b!1352731 m!1240061))

(declare-fun m!1240063 () Bool)

(assert (=> b!1352720 m!1240063))

(declare-fun m!1240065 () Bool)

(assert (=> b!1352726 m!1240065))

(declare-fun m!1240067 () Bool)

(assert (=> b!1352726 m!1240067))

(declare-fun m!1240069 () Bool)

(assert (=> b!1352725 m!1240069))

(declare-fun m!1240071 () Bool)

(assert (=> b!1352724 m!1240071))

(declare-fun m!1240073 () Bool)

(assert (=> b!1352727 m!1240073))

(assert (=> b!1352728 m!1240047))

(assert (=> b!1352728 m!1240047))

(declare-fun m!1240075 () Bool)

(assert (=> b!1352728 m!1240075))

(declare-fun m!1240077 () Bool)

(assert (=> b!1352721 m!1240077))

(declare-fun m!1240079 () Bool)

(assert (=> start!114158 m!1240079))

(push 1)

(assert (not b!1352733))

(assert (not start!114158))

(assert (not b!1352727))

(assert (not b!1352730))

(assert (not b!1352729))

(assert (not b!1352728))

(assert (not b!1352725))

(assert (not b!1352731))

(assert (not b!1352721))

(assert (not b!1352720))

(assert (not b!1352726))

(assert (not b!1352723))

(assert (not b!1352724))

(assert (not b!1352722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

