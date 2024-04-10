; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113940 () Bool)

(assert start!113940)

(declare-fun b!1351556 () Bool)

(declare-fun res!897028 () Bool)

(declare-fun e!768534 () Bool)

(assert (=> b!1351556 (=> res!897028 e!768534)))

(declare-datatypes ((List!31550 0))(
  ( (Nil!31547) (Cons!31546 (h!32755 (_ BitVec 64)) (t!46208 List!31550)) )
))
(declare-fun lt!597261 () List!31550)

(declare-fun noDuplicate!2116 (List!31550) Bool)

(assert (=> b!1351556 (= res!897028 (not (noDuplicate!2116 lt!597261)))))

(declare-fun b!1351557 () Bool)

(declare-fun res!897022 () Bool)

(assert (=> b!1351557 (=> res!897022 e!768534)))

(declare-fun contains!9259 (List!31550 (_ BitVec 64)) Bool)

(assert (=> b!1351557 (= res!897022 (contains!9259 lt!597261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351558 () Bool)

(declare-fun res!897017 () Bool)

(declare-fun e!768533 () Bool)

(assert (=> b!1351558 (=> (not res!897017) (not e!768533))))

(declare-fun acc!759 () List!31550)

(assert (=> b!1351558 (= res!897017 (noDuplicate!2116 acc!759))))

(declare-fun b!1351559 () Bool)

(declare-fun res!897023 () Bool)

(assert (=> b!1351559 (=> (not res!897023) (not e!768533))))

(declare-datatypes ((array!92122 0))(
  ( (array!92123 (arr!44509 (Array (_ BitVec 32) (_ BitVec 64))) (size!45059 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92122)

(declare-fun arrayNoDuplicates!0 (array!92122 (_ BitVec 32) List!31550) Bool)

(assert (=> b!1351559 (= res!897023 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31547))))

(declare-fun res!897021 () Bool)

(assert (=> start!113940 (=> (not res!897021) (not e!768533))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113940 (= res!897021 (and (bvslt (size!45059 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45059 a!3742))))))

(assert (=> start!113940 e!768533))

(assert (=> start!113940 true))

(declare-fun array_inv!33537 (array!92122) Bool)

(assert (=> start!113940 (array_inv!33537 a!3742)))

(declare-fun b!1351560 () Bool)

(assert (=> b!1351560 (= e!768533 (not e!768534))))

(declare-fun res!897024 () Bool)

(assert (=> b!1351560 (=> res!897024 e!768534)))

(assert (=> b!1351560 (= res!897024 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!694 (List!31550 (_ BitVec 64)) List!31550)

(assert (=> b!1351560 (= lt!597261 ($colon$colon!694 acc!759 (select (arr!44509 a!3742) from!3120)))))

(declare-fun subseq!679 (List!31550 List!31550) Bool)

(assert (=> b!1351560 (subseq!679 acc!759 acc!759)))

(declare-datatypes ((Unit!44272 0))(
  ( (Unit!44273) )
))
(declare-fun lt!597262 () Unit!44272)

(declare-fun lemmaListSubSeqRefl!0 (List!31550) Unit!44272)

(assert (=> b!1351560 (= lt!597262 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351561 () Bool)

(declare-fun res!897015 () Bool)

(assert (=> b!1351561 (=> res!897015 e!768534)))

(assert (=> b!1351561 (= res!897015 (contains!9259 lt!597261 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351562 () Bool)

(declare-fun res!897016 () Bool)

(assert (=> b!1351562 (=> (not res!897016) (not e!768533))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351562 (= res!897016 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351563 () Bool)

(declare-fun res!897020 () Bool)

(assert (=> b!1351563 (=> (not res!897020) (not e!768533))))

(assert (=> b!1351563 (= res!897020 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45059 a!3742)))))

(declare-fun b!1351564 () Bool)

(declare-fun res!897026 () Bool)

(assert (=> b!1351564 (=> (not res!897026) (not e!768533))))

(assert (=> b!1351564 (= res!897026 (not (contains!9259 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351565 () Bool)

(assert (=> b!1351565 (= e!768534 true)))

(declare-fun lt!597259 () Bool)

(assert (=> b!1351565 (= lt!597259 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597261))))

(declare-fun lt!597260 () Unit!44272)

(declare-fun noDuplicateSubseq!130 (List!31550 List!31550) Unit!44272)

(assert (=> b!1351565 (= lt!597260 (noDuplicateSubseq!130 acc!759 lt!597261))))

(declare-fun b!1351566 () Bool)

(declare-fun res!897014 () Bool)

(assert (=> b!1351566 (=> (not res!897014) (not e!768533))))

(assert (=> b!1351566 (= res!897014 (not (contains!9259 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351567 () Bool)

(declare-fun res!897025 () Bool)

(assert (=> b!1351567 (=> (not res!897025) (not e!768533))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351567 (= res!897025 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45059 a!3742))))))

(declare-fun b!1351568 () Bool)

(declare-fun res!897019 () Bool)

(assert (=> b!1351568 (=> res!897019 e!768534)))

(assert (=> b!1351568 (= res!897019 (not (subseq!679 acc!759 lt!597261)))))

(declare-fun b!1351569 () Bool)

(declare-fun res!897027 () Bool)

(assert (=> b!1351569 (=> (not res!897027) (not e!768533))))

(assert (=> b!1351569 (= res!897027 (validKeyInArray!0 (select (arr!44509 a!3742) from!3120)))))

(declare-fun b!1351570 () Bool)

(declare-fun res!897018 () Bool)

(assert (=> b!1351570 (=> (not res!897018) (not e!768533))))

(assert (=> b!1351570 (= res!897018 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!113940 res!897021) b!1351558))

(assert (= (and b!1351558 res!897017) b!1351566))

(assert (= (and b!1351566 res!897014) b!1351564))

(assert (= (and b!1351564 res!897026) b!1351559))

(assert (= (and b!1351559 res!897023) b!1351570))

(assert (= (and b!1351570 res!897018) b!1351567))

(assert (= (and b!1351567 res!897025) b!1351562))

(assert (= (and b!1351562 res!897016) b!1351563))

(assert (= (and b!1351563 res!897020) b!1351569))

(assert (= (and b!1351569 res!897027) b!1351560))

(assert (= (and b!1351560 (not res!897024)) b!1351556))

(assert (= (and b!1351556 (not res!897028)) b!1351557))

(assert (= (and b!1351557 (not res!897022)) b!1351561))

(assert (= (and b!1351561 (not res!897015)) b!1351568))

(assert (= (and b!1351568 (not res!897019)) b!1351565))

(declare-fun m!1238557 () Bool)

(assert (=> b!1351570 m!1238557))

(declare-fun m!1238559 () Bool)

(assert (=> b!1351564 m!1238559))

(declare-fun m!1238561 () Bool)

(assert (=> b!1351560 m!1238561))

(assert (=> b!1351560 m!1238561))

(declare-fun m!1238563 () Bool)

(assert (=> b!1351560 m!1238563))

(declare-fun m!1238565 () Bool)

(assert (=> b!1351560 m!1238565))

(declare-fun m!1238567 () Bool)

(assert (=> b!1351560 m!1238567))

(declare-fun m!1238569 () Bool)

(assert (=> b!1351559 m!1238569))

(declare-fun m!1238571 () Bool)

(assert (=> b!1351562 m!1238571))

(declare-fun m!1238573 () Bool)

(assert (=> b!1351561 m!1238573))

(declare-fun m!1238575 () Bool)

(assert (=> b!1351568 m!1238575))

(declare-fun m!1238577 () Bool)

(assert (=> start!113940 m!1238577))

(assert (=> b!1351569 m!1238561))

(assert (=> b!1351569 m!1238561))

(declare-fun m!1238579 () Bool)

(assert (=> b!1351569 m!1238579))

(declare-fun m!1238581 () Bool)

(assert (=> b!1351556 m!1238581))

(declare-fun m!1238583 () Bool)

(assert (=> b!1351566 m!1238583))

(declare-fun m!1238585 () Bool)

(assert (=> b!1351557 m!1238585))

(declare-fun m!1238587 () Bool)

(assert (=> b!1351565 m!1238587))

(declare-fun m!1238589 () Bool)

(assert (=> b!1351565 m!1238589))

(declare-fun m!1238591 () Bool)

(assert (=> b!1351558 m!1238591))

(push 1)

(assert (not b!1351568))

(assert (not b!1351557))

(assert (not b!1351561))

(assert (not b!1351565))

(assert (not b!1351560))

(assert (not b!1351558))

(assert (not b!1351564))

(assert (not b!1351562))

(assert (not b!1351569))

(assert (not b!1351556))

(assert (not start!113940))

(assert (not b!1351570))

(assert (not b!1351559))

(assert (not b!1351566))

(check-sat)

(pop 1)

(push 1)

