; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113920 () Bool)

(assert start!113920)

(declare-fun b!1351106 () Bool)

(declare-fun res!896569 () Bool)

(declare-fun e!768443 () Bool)

(assert (=> b!1351106 (=> (not res!896569) (not e!768443))))

(declare-datatypes ((List!31540 0))(
  ( (Nil!31537) (Cons!31536 (h!32745 (_ BitVec 64)) (t!46198 List!31540)) )
))
(declare-fun acc!759 () List!31540)

(declare-fun contains!9249 (List!31540 (_ BitVec 64)) Bool)

(assert (=> b!1351106 (= res!896569 (not (contains!9249 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351107 () Bool)

(declare-fun e!768445 () Bool)

(assert (=> b!1351107 (= e!768445 true)))

(declare-fun lt!597141 () List!31540)

(declare-fun lt!597140 () Bool)

(declare-datatypes ((array!92102 0))(
  ( (array!92103 (arr!44499 (Array (_ BitVec 32) (_ BitVec 64))) (size!45049 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92102)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92102 (_ BitVec 32) List!31540) Bool)

(assert (=> b!1351107 (= lt!597140 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597141))))

(declare-datatypes ((Unit!44252 0))(
  ( (Unit!44253) )
))
(declare-fun lt!597142 () Unit!44252)

(declare-fun noDuplicateSubseq!120 (List!31540 List!31540) Unit!44252)

(assert (=> b!1351107 (= lt!597142 (noDuplicateSubseq!120 acc!759 lt!597141))))

(declare-fun b!1351108 () Bool)

(declare-fun res!896568 () Bool)

(assert (=> b!1351108 (=> (not res!896568) (not e!768443))))

(assert (=> b!1351108 (= res!896568 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31537))))

(declare-fun b!1351109 () Bool)

(declare-fun res!896570 () Bool)

(assert (=> b!1351109 (=> (not res!896570) (not e!768443))))

(assert (=> b!1351109 (= res!896570 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351110 () Bool)

(assert (=> b!1351110 (= e!768443 (not e!768445))))

(declare-fun res!896564 () Bool)

(assert (=> b!1351110 (=> res!896564 e!768445)))

(assert (=> b!1351110 (= res!896564 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!684 (List!31540 (_ BitVec 64)) List!31540)

(assert (=> b!1351110 (= lt!597141 ($colon$colon!684 acc!759 (select (arr!44499 a!3742) from!3120)))))

(declare-fun subseq!669 (List!31540 List!31540) Bool)

(assert (=> b!1351110 (subseq!669 acc!759 acc!759)))

(declare-fun lt!597139 () Unit!44252)

(declare-fun lemmaListSubSeqRefl!0 (List!31540) Unit!44252)

(assert (=> b!1351110 (= lt!597139 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351111 () Bool)

(declare-fun res!896566 () Bool)

(assert (=> b!1351111 (=> (not res!896566) (not e!768443))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351111 (= res!896566 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351112 () Bool)

(declare-fun res!896571 () Bool)

(assert (=> b!1351112 (=> res!896571 e!768445)))

(declare-fun noDuplicate!2106 (List!31540) Bool)

(assert (=> b!1351112 (= res!896571 (not (noDuplicate!2106 lt!597141)))))

(declare-fun b!1351113 () Bool)

(declare-fun res!896578 () Bool)

(assert (=> b!1351113 (=> (not res!896578) (not e!768443))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351113 (= res!896578 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45049 a!3742))))))

(declare-fun b!1351114 () Bool)

(declare-fun res!896575 () Bool)

(assert (=> b!1351114 (=> res!896575 e!768445)))

(assert (=> b!1351114 (= res!896575 (contains!9249 lt!597141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351115 () Bool)

(declare-fun res!896576 () Bool)

(assert (=> b!1351115 (=> (not res!896576) (not e!768443))))

(assert (=> b!1351115 (= res!896576 (not (contains!9249 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896572 () Bool)

(assert (=> start!113920 (=> (not res!896572) (not e!768443))))

(assert (=> start!113920 (= res!896572 (and (bvslt (size!45049 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45049 a!3742))))))

(assert (=> start!113920 e!768443))

(assert (=> start!113920 true))

(declare-fun array_inv!33527 (array!92102) Bool)

(assert (=> start!113920 (array_inv!33527 a!3742)))

(declare-fun b!1351116 () Bool)

(declare-fun res!896573 () Bool)

(assert (=> b!1351116 (=> res!896573 e!768445)))

(assert (=> b!1351116 (= res!896573 (contains!9249 lt!597141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351117 () Bool)

(declare-fun res!896567 () Bool)

(assert (=> b!1351117 (=> (not res!896567) (not e!768443))))

(assert (=> b!1351117 (= res!896567 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45049 a!3742)))))

(declare-fun b!1351118 () Bool)

(declare-fun res!896577 () Bool)

(assert (=> b!1351118 (=> res!896577 e!768445)))

(assert (=> b!1351118 (= res!896577 (not (subseq!669 acc!759 lt!597141)))))

(declare-fun b!1351119 () Bool)

(declare-fun res!896574 () Bool)

(assert (=> b!1351119 (=> (not res!896574) (not e!768443))))

(assert (=> b!1351119 (= res!896574 (validKeyInArray!0 (select (arr!44499 a!3742) from!3120)))))

(declare-fun b!1351120 () Bool)

(declare-fun res!896565 () Bool)

(assert (=> b!1351120 (=> (not res!896565) (not e!768443))))

(assert (=> b!1351120 (= res!896565 (noDuplicate!2106 acc!759))))

(assert (= (and start!113920 res!896572) b!1351120))

(assert (= (and b!1351120 res!896565) b!1351115))

(assert (= (and b!1351115 res!896576) b!1351106))

(assert (= (and b!1351106 res!896569) b!1351108))

(assert (= (and b!1351108 res!896568) b!1351109))

(assert (= (and b!1351109 res!896570) b!1351113))

(assert (= (and b!1351113 res!896578) b!1351111))

(assert (= (and b!1351111 res!896566) b!1351117))

(assert (= (and b!1351117 res!896567) b!1351119))

(assert (= (and b!1351119 res!896574) b!1351110))

(assert (= (and b!1351110 (not res!896564)) b!1351112))

(assert (= (and b!1351112 (not res!896571)) b!1351114))

(assert (= (and b!1351114 (not res!896575)) b!1351116))

(assert (= (and b!1351116 (not res!896573)) b!1351118))

(assert (= (and b!1351118 (not res!896577)) b!1351107))

(declare-fun m!1238197 () Bool)

(assert (=> start!113920 m!1238197))

(declare-fun m!1238199 () Bool)

(assert (=> b!1351107 m!1238199))

(declare-fun m!1238201 () Bool)

(assert (=> b!1351107 m!1238201))

(declare-fun m!1238203 () Bool)

(assert (=> b!1351119 m!1238203))

(assert (=> b!1351119 m!1238203))

(declare-fun m!1238205 () Bool)

(assert (=> b!1351119 m!1238205))

(declare-fun m!1238207 () Bool)

(assert (=> b!1351114 m!1238207))

(declare-fun m!1238209 () Bool)

(assert (=> b!1351106 m!1238209))

(declare-fun m!1238211 () Bool)

(assert (=> b!1351108 m!1238211))

(assert (=> b!1351110 m!1238203))

(assert (=> b!1351110 m!1238203))

(declare-fun m!1238213 () Bool)

(assert (=> b!1351110 m!1238213))

(declare-fun m!1238215 () Bool)

(assert (=> b!1351110 m!1238215))

(declare-fun m!1238217 () Bool)

(assert (=> b!1351110 m!1238217))

(declare-fun m!1238219 () Bool)

(assert (=> b!1351118 m!1238219))

(declare-fun m!1238221 () Bool)

(assert (=> b!1351115 m!1238221))

(declare-fun m!1238223 () Bool)

(assert (=> b!1351111 m!1238223))

(declare-fun m!1238225 () Bool)

(assert (=> b!1351120 m!1238225))

(declare-fun m!1238227 () Bool)

(assert (=> b!1351109 m!1238227))

(declare-fun m!1238229 () Bool)

(assert (=> b!1351112 m!1238229))

(declare-fun m!1238231 () Bool)

(assert (=> b!1351116 m!1238231))

(check-sat (not b!1351110) (not b!1351119) (not b!1351115) (not b!1351108) (not b!1351112) (not b!1351106) (not b!1351107) (not b!1351120) (not b!1351118) (not start!113920) (not b!1351109) (not b!1351114) (not b!1351116) (not b!1351111))
(check-sat)
