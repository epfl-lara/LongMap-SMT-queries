; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114164 () Bool)

(assert start!114164)

(declare-fun b!1356099 () Bool)

(declare-fun res!900952 () Bool)

(declare-fun e!769953 () Bool)

(assert (=> b!1356099 (=> (not res!900952) (not e!769953))))

(declare-datatypes ((List!31715 0))(
  ( (Nil!31712) (Cons!31711 (h!32920 (_ BitVec 64)) (t!46365 List!31715)) )
))
(declare-fun acc!759 () List!31715)

(declare-fun contains!9335 (List!31715 (_ BitVec 64)) Bool)

(assert (=> b!1356099 (= res!900952 (not (contains!9335 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356100 () Bool)

(declare-fun res!900956 () Bool)

(assert (=> b!1356100 (=> (not res!900956) (not e!769953))))

(declare-datatypes ((array!92295 0))(
  ( (array!92296 (arr!44596 (Array (_ BitVec 32) (_ BitVec 64))) (size!45148 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92295)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92295 (_ BitVec 32) List!31715) Bool)

(assert (=> b!1356100 (= res!900956 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356101 () Bool)

(declare-datatypes ((Unit!44445 0))(
  ( (Unit!44446) )
))
(declare-fun e!769952 () Unit!44445)

(declare-fun lt!598747 () Unit!44445)

(assert (=> b!1356101 (= e!769952 lt!598747)))

(declare-fun lt!598744 () Unit!44445)

(declare-fun lemmaListSubSeqRefl!0 (List!31715) Unit!44445)

(assert (=> b!1356101 (= lt!598744 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!791 (List!31715 List!31715) Bool)

(assert (=> b!1356101 (subseq!791 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92295 List!31715 List!31715 (_ BitVec 32)) Unit!44445)

(declare-fun $colon$colon!808 (List!31715 (_ BitVec 64)) List!31715)

(assert (=> b!1356101 (= lt!598747 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!808 acc!759 (select (arr!44596 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356101 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356102 () Bool)

(declare-fun e!769954 () Bool)

(assert (=> b!1356102 (= e!769954 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356102 (arrayNoDuplicates!0 (array!92296 (store (arr!44596 a!3742) i!1404 l!3587) (size!45148 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598745 () Unit!44445)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31715) Unit!44445)

(assert (=> b!1356102 (= lt!598745 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356103 () Bool)

(declare-fun Unit!44447 () Unit!44445)

(assert (=> b!1356103 (= e!769952 Unit!44447)))

(declare-fun b!1356104 () Bool)

(assert (=> b!1356104 (= e!769953 e!769954)))

(declare-fun res!900950 () Bool)

(assert (=> b!1356104 (=> (not res!900950) (not e!769954))))

(declare-fun lt!598743 () Bool)

(assert (=> b!1356104 (= res!900950 (and (not (= from!3120 i!1404)) (not lt!598743) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598746 () Unit!44445)

(assert (=> b!1356104 (= lt!598746 e!769952)))

(declare-fun c!127019 () Bool)

(assert (=> b!1356104 (= c!127019 lt!598743)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356104 (= lt!598743 (validKeyInArray!0 (select (arr!44596 a!3742) from!3120)))))

(declare-fun b!1356105 () Bool)

(declare-fun res!900949 () Bool)

(assert (=> b!1356105 (=> (not res!900949) (not e!769953))))

(declare-fun noDuplicate!2250 (List!31715) Bool)

(assert (=> b!1356105 (= res!900949 (noDuplicate!2250 acc!759))))

(declare-fun b!1356107 () Bool)

(declare-fun res!900954 () Bool)

(assert (=> b!1356107 (=> (not res!900954) (not e!769953))))

(assert (=> b!1356107 (= res!900954 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45148 a!3742))))))

(declare-fun b!1356108 () Bool)

(declare-fun res!900955 () Bool)

(assert (=> b!1356108 (=> (not res!900955) (not e!769953))))

(assert (=> b!1356108 (= res!900955 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45148 a!3742)))))

(declare-fun b!1356109 () Bool)

(declare-fun res!900948 () Bool)

(assert (=> b!1356109 (=> (not res!900948) (not e!769953))))

(assert (=> b!1356109 (= res!900948 (not (contains!9335 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356110 () Bool)

(declare-fun res!900951 () Bool)

(assert (=> b!1356110 (=> (not res!900951) (not e!769953))))

(assert (=> b!1356110 (= res!900951 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356111 () Bool)

(declare-fun res!900947 () Bool)

(assert (=> b!1356111 (=> (not res!900947) (not e!769953))))

(assert (=> b!1356111 (= res!900947 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31712))))

(declare-fun b!1356106 () Bool)

(declare-fun res!900946 () Bool)

(assert (=> b!1356106 (=> (not res!900946) (not e!769954))))

(assert (=> b!1356106 (= res!900946 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!900953 () Bool)

(assert (=> start!114164 (=> (not res!900953) (not e!769953))))

(assert (=> start!114164 (= res!900953 (and (bvslt (size!45148 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45148 a!3742))))))

(assert (=> start!114164 e!769953))

(assert (=> start!114164 true))

(declare-fun array_inv!33829 (array!92295) Bool)

(assert (=> start!114164 (array_inv!33829 a!3742)))

(assert (= (and start!114164 res!900953) b!1356105))

(assert (= (and b!1356105 res!900949) b!1356109))

(assert (= (and b!1356109 res!900948) b!1356099))

(assert (= (and b!1356099 res!900952) b!1356111))

(assert (= (and b!1356111 res!900947) b!1356100))

(assert (= (and b!1356100 res!900956) b!1356107))

(assert (= (and b!1356107 res!900954) b!1356110))

(assert (= (and b!1356110 res!900951) b!1356108))

(assert (= (and b!1356108 res!900955) b!1356104))

(assert (= (and b!1356104 c!127019) b!1356101))

(assert (= (and b!1356104 (not c!127019)) b!1356103))

(assert (= (and b!1356104 res!900950) b!1356106))

(assert (= (and b!1356106 res!900946) b!1356102))

(declare-fun m!1241683 () Bool)

(assert (=> b!1356106 m!1241683))

(declare-fun m!1241685 () Bool)

(assert (=> b!1356109 m!1241685))

(declare-fun m!1241687 () Bool)

(assert (=> b!1356111 m!1241687))

(declare-fun m!1241689 () Bool)

(assert (=> b!1356099 m!1241689))

(declare-fun m!1241691 () Bool)

(assert (=> start!114164 m!1241691))

(declare-fun m!1241693 () Bool)

(assert (=> b!1356102 m!1241693))

(declare-fun m!1241695 () Bool)

(assert (=> b!1356102 m!1241695))

(declare-fun m!1241697 () Bool)

(assert (=> b!1356102 m!1241697))

(declare-fun m!1241699 () Bool)

(assert (=> b!1356105 m!1241699))

(declare-fun m!1241701 () Bool)

(assert (=> b!1356110 m!1241701))

(declare-fun m!1241703 () Bool)

(assert (=> b!1356104 m!1241703))

(assert (=> b!1356104 m!1241703))

(declare-fun m!1241705 () Bool)

(assert (=> b!1356104 m!1241705))

(declare-fun m!1241707 () Bool)

(assert (=> b!1356100 m!1241707))

(declare-fun m!1241709 () Bool)

(assert (=> b!1356101 m!1241709))

(assert (=> b!1356101 m!1241703))

(declare-fun m!1241711 () Bool)

(assert (=> b!1356101 m!1241711))

(declare-fun m!1241713 () Bool)

(assert (=> b!1356101 m!1241713))

(assert (=> b!1356101 m!1241683))

(assert (=> b!1356101 m!1241703))

(assert (=> b!1356101 m!1241711))

(declare-fun m!1241715 () Bool)

(assert (=> b!1356101 m!1241715))

(check-sat (not b!1356104) (not b!1356106) (not b!1356109) (not b!1356111) (not b!1356100) (not b!1356099) (not b!1356102) (not b!1356110) (not start!114164) (not b!1356101) (not b!1356105))
(check-sat)
