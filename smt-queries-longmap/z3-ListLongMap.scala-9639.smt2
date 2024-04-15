; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113972 () Bool)

(assert start!113972)

(declare-fun b!1352092 () Bool)

(declare-fun res!897521 () Bool)

(declare-fun e!768685 () Bool)

(assert (=> b!1352092 (=> (not res!897521) (not e!768685))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352092 (= res!897521 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!897516 () Bool)

(assert (=> start!113972 (=> (not res!897516) (not e!768685))))

(declare-datatypes ((array!92103 0))(
  ( (array!92104 (arr!44500 (Array (_ BitVec 32) (_ BitVec 64))) (size!45052 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92103)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113972 (= res!897516 (and (bvslt (size!45052 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45052 a!3742))))))

(assert (=> start!113972 e!768685))

(assert (=> start!113972 true))

(declare-fun array_inv!33733 (array!92103) Bool)

(assert (=> start!113972 (array_inv!33733 a!3742)))

(declare-fun b!1352093 () Bool)

(declare-fun res!897524 () Bool)

(assert (=> b!1352093 (=> (not res!897524) (not e!768685))))

(declare-datatypes ((List!31619 0))(
  ( (Nil!31616) (Cons!31615 (h!32824 (_ BitVec 64)) (t!46269 List!31619)) )
))
(declare-fun acc!759 () List!31619)

(declare-fun contains!9239 (List!31619 (_ BitVec 64)) Bool)

(assert (=> b!1352093 (= res!897524 (not (contains!9239 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352094 () Bool)

(declare-fun e!768684 () Bool)

(assert (=> b!1352094 (= e!768685 e!768684)))

(declare-fun res!897518 () Bool)

(assert (=> b!1352094 (=> (not res!897518) (not e!768684))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352094 (= res!897518 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44157 0))(
  ( (Unit!44158) )
))
(declare-fun lt!597266 () Unit!44157)

(declare-fun e!768683 () Unit!44157)

(assert (=> b!1352094 (= lt!597266 e!768683)))

(declare-fun c!126731 () Bool)

(assert (=> b!1352094 (= c!126731 (validKeyInArray!0 (select (arr!44500 a!3742) from!3120)))))

(declare-fun b!1352095 () Bool)

(declare-fun res!897517 () Bool)

(assert (=> b!1352095 (=> (not res!897517) (not e!768685))))

(assert (=> b!1352095 (= res!897517 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45052 a!3742))))))

(declare-fun b!1352096 () Bool)

(declare-fun res!897523 () Bool)

(assert (=> b!1352096 (=> (not res!897523) (not e!768685))))

(declare-fun arrayNoDuplicates!0 (array!92103 (_ BitVec 32) List!31619) Bool)

(assert (=> b!1352096 (= res!897523 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31616))))

(declare-fun b!1352097 () Bool)

(declare-fun res!897515 () Bool)

(assert (=> b!1352097 (=> (not res!897515) (not e!768685))))

(assert (=> b!1352097 (= res!897515 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45052 a!3742)))))

(declare-fun b!1352098 () Bool)

(declare-fun res!897522 () Bool)

(assert (=> b!1352098 (=> (not res!897522) (not e!768685))))

(declare-fun noDuplicate!2154 (List!31619) Bool)

(assert (=> b!1352098 (= res!897522 (noDuplicate!2154 acc!759))))

(declare-fun b!1352099 () Bool)

(declare-fun Unit!44159 () Unit!44157)

(assert (=> b!1352099 (= e!768683 Unit!44159)))

(declare-fun b!1352100 () Bool)

(declare-fun lt!597265 () Unit!44157)

(assert (=> b!1352100 (= e!768683 lt!597265)))

(declare-fun lt!597268 () Unit!44157)

(declare-fun lemmaListSubSeqRefl!0 (List!31619) Unit!44157)

(assert (=> b!1352100 (= lt!597268 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!695 (List!31619 List!31619) Bool)

(assert (=> b!1352100 (subseq!695 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92103 List!31619 List!31619 (_ BitVec 32)) Unit!44157)

(declare-fun $colon$colon!712 (List!31619 (_ BitVec 64)) List!31619)

(assert (=> b!1352100 (= lt!597265 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!712 acc!759 (select (arr!44500 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352100 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352101 () Bool)

(declare-fun res!897519 () Bool)

(assert (=> b!1352101 (=> (not res!897519) (not e!768685))))

(assert (=> b!1352101 (= res!897519 (not (contains!9239 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352102 () Bool)

(declare-fun res!897520 () Bool)

(assert (=> b!1352102 (=> (not res!897520) (not e!768685))))

(assert (=> b!1352102 (= res!897520 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352103 () Bool)

(assert (=> b!1352103 (= e!768684 false)))

(declare-fun lt!597267 () Bool)

(assert (=> b!1352103 (= lt!597267 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!113972 res!897516) b!1352098))

(assert (= (and b!1352098 res!897522) b!1352101))

(assert (= (and b!1352101 res!897519) b!1352093))

(assert (= (and b!1352093 res!897524) b!1352096))

(assert (= (and b!1352096 res!897523) b!1352102))

(assert (= (and b!1352102 res!897520) b!1352095))

(assert (= (and b!1352095 res!897517) b!1352092))

(assert (= (and b!1352092 res!897521) b!1352097))

(assert (= (and b!1352097 res!897515) b!1352094))

(assert (= (and b!1352094 c!126731) b!1352100))

(assert (= (and b!1352094 (not c!126731)) b!1352099))

(assert (= (and b!1352094 res!897518) b!1352103))

(declare-fun m!1238521 () Bool)

(assert (=> b!1352092 m!1238521))

(declare-fun m!1238523 () Bool)

(assert (=> b!1352100 m!1238523))

(declare-fun m!1238525 () Bool)

(assert (=> b!1352100 m!1238525))

(declare-fun m!1238527 () Bool)

(assert (=> b!1352100 m!1238527))

(declare-fun m!1238529 () Bool)

(assert (=> b!1352100 m!1238529))

(declare-fun m!1238531 () Bool)

(assert (=> b!1352100 m!1238531))

(assert (=> b!1352100 m!1238525))

(assert (=> b!1352100 m!1238527))

(declare-fun m!1238533 () Bool)

(assert (=> b!1352100 m!1238533))

(declare-fun m!1238535 () Bool)

(assert (=> b!1352098 m!1238535))

(declare-fun m!1238537 () Bool)

(assert (=> b!1352102 m!1238537))

(declare-fun m!1238539 () Bool)

(assert (=> b!1352096 m!1238539))

(declare-fun m!1238541 () Bool)

(assert (=> b!1352093 m!1238541))

(declare-fun m!1238543 () Bool)

(assert (=> start!113972 m!1238543))

(assert (=> b!1352103 m!1238531))

(assert (=> b!1352094 m!1238525))

(assert (=> b!1352094 m!1238525))

(declare-fun m!1238545 () Bool)

(assert (=> b!1352094 m!1238545))

(declare-fun m!1238547 () Bool)

(assert (=> b!1352101 m!1238547))

(check-sat (not b!1352098) (not b!1352102) (not b!1352094) (not b!1352093) (not start!113972) (not b!1352101) (not b!1352096) (not b!1352100) (not b!1352092) (not b!1352103))
(check-sat)
