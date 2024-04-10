; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113966 () Bool)

(assert start!113966)

(declare-fun b!1352054 () Bool)

(declare-fun res!897458 () Bool)

(declare-fun e!768679 () Bool)

(assert (=> b!1352054 (=> (not res!897458) (not e!768679))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92148 0))(
  ( (array!92149 (arr!44522 (Array (_ BitVec 32) (_ BitVec 64))) (size!45072 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92148)

(assert (=> b!1352054 (= res!897458 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45072 a!3742)))))

(declare-fun b!1352055 () Bool)

(declare-fun e!768680 () Bool)

(assert (=> b!1352055 (= e!768679 e!768680)))

(declare-fun res!897461 () Bool)

(assert (=> b!1352055 (=> (not res!897461) (not e!768680))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352055 (= res!897461 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44307 0))(
  ( (Unit!44308) )
))
(declare-fun lt!597415 () Unit!44307)

(declare-fun e!768682 () Unit!44307)

(assert (=> b!1352055 (= lt!597415 e!768682)))

(declare-fun c!126740 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352055 (= c!126740 (validKeyInArray!0 (select (arr!44522 a!3742) from!3120)))))

(declare-fun b!1352056 () Bool)

(declare-fun res!897457 () Bool)

(assert (=> b!1352056 (=> (not res!897457) (not e!768679))))

(declare-datatypes ((List!31563 0))(
  ( (Nil!31560) (Cons!31559 (h!32768 (_ BitVec 64)) (t!46221 List!31563)) )
))
(declare-fun acc!759 () List!31563)

(declare-fun contains!9272 (List!31563 (_ BitVec 64)) Bool)

(assert (=> b!1352056 (= res!897457 (not (contains!9272 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352057 () Bool)

(declare-fun res!897460 () Bool)

(assert (=> b!1352057 (=> (not res!897460) (not e!768679))))

(declare-fun arrayNoDuplicates!0 (array!92148 (_ BitVec 32) List!31563) Bool)

(assert (=> b!1352057 (= res!897460 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31560))))

(declare-fun b!1352058 () Bool)

(declare-fun res!897454 () Bool)

(assert (=> b!1352058 (=> (not res!897454) (not e!768679))))

(declare-fun noDuplicate!2129 (List!31563) Bool)

(assert (=> b!1352058 (= res!897454 (noDuplicate!2129 acc!759))))

(declare-fun b!1352059 () Bool)

(declare-fun res!897455 () Bool)

(assert (=> b!1352059 (=> (not res!897455) (not e!768679))))

(assert (=> b!1352059 (= res!897455 (not (contains!9272 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352060 () Bool)

(assert (=> b!1352060 (= e!768680 false)))

(declare-fun lt!597418 () Bool)

(assert (=> b!1352060 (= lt!597418 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!897459 () Bool)

(assert (=> start!113966 (=> (not res!897459) (not e!768679))))

(assert (=> start!113966 (= res!897459 (and (bvslt (size!45072 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45072 a!3742))))))

(assert (=> start!113966 e!768679))

(assert (=> start!113966 true))

(declare-fun array_inv!33550 (array!92148) Bool)

(assert (=> start!113966 (array_inv!33550 a!3742)))

(declare-fun b!1352061 () Bool)

(declare-fun res!897462 () Bool)

(assert (=> b!1352061 (=> (not res!897462) (not e!768679))))

(assert (=> b!1352061 (= res!897462 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352062 () Bool)

(declare-fun lt!597416 () Unit!44307)

(assert (=> b!1352062 (= e!768682 lt!597416)))

(declare-fun lt!597417 () Unit!44307)

(declare-fun lemmaListSubSeqRefl!0 (List!31563) Unit!44307)

(assert (=> b!1352062 (= lt!597417 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!692 (List!31563 List!31563) Bool)

(assert (=> b!1352062 (subseq!692 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92148 List!31563 List!31563 (_ BitVec 32)) Unit!44307)

(declare-fun $colon$colon!707 (List!31563 (_ BitVec 64)) List!31563)

(assert (=> b!1352062 (= lt!597416 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!707 acc!759 (select (arr!44522 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352062 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352063 () Bool)

(declare-fun res!897456 () Bool)

(assert (=> b!1352063 (=> (not res!897456) (not e!768679))))

(assert (=> b!1352063 (= res!897456 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45072 a!3742))))))

(declare-fun b!1352064 () Bool)

(declare-fun Unit!44309 () Unit!44307)

(assert (=> b!1352064 (= e!768682 Unit!44309)))

(declare-fun b!1352065 () Bool)

(declare-fun res!897463 () Bool)

(assert (=> b!1352065 (=> (not res!897463) (not e!768679))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352065 (= res!897463 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113966 res!897459) b!1352058))

(assert (= (and b!1352058 res!897454) b!1352056))

(assert (= (and b!1352056 res!897457) b!1352059))

(assert (= (and b!1352059 res!897455) b!1352057))

(assert (= (and b!1352057 res!897460) b!1352061))

(assert (= (and b!1352061 res!897462) b!1352063))

(assert (= (and b!1352063 res!897456) b!1352065))

(assert (= (and b!1352065 res!897463) b!1352054))

(assert (= (and b!1352054 res!897458) b!1352055))

(assert (= (and b!1352055 c!126740) b!1352062))

(assert (= (and b!1352055 (not c!126740)) b!1352064))

(assert (= (and b!1352055 res!897461) b!1352060))

(declare-fun m!1238953 () Bool)

(assert (=> b!1352060 m!1238953))

(declare-fun m!1238955 () Bool)

(assert (=> b!1352065 m!1238955))

(declare-fun m!1238957 () Bool)

(assert (=> b!1352062 m!1238957))

(declare-fun m!1238959 () Bool)

(assert (=> b!1352062 m!1238959))

(declare-fun m!1238961 () Bool)

(assert (=> b!1352062 m!1238961))

(declare-fun m!1238963 () Bool)

(assert (=> b!1352062 m!1238963))

(assert (=> b!1352062 m!1238953))

(assert (=> b!1352062 m!1238959))

(assert (=> b!1352062 m!1238961))

(declare-fun m!1238965 () Bool)

(assert (=> b!1352062 m!1238965))

(declare-fun m!1238967 () Bool)

(assert (=> b!1352057 m!1238967))

(declare-fun m!1238969 () Bool)

(assert (=> b!1352061 m!1238969))

(assert (=> b!1352055 m!1238959))

(assert (=> b!1352055 m!1238959))

(declare-fun m!1238971 () Bool)

(assert (=> b!1352055 m!1238971))

(declare-fun m!1238973 () Bool)

(assert (=> start!113966 m!1238973))

(declare-fun m!1238975 () Bool)

(assert (=> b!1352056 m!1238975))

(declare-fun m!1238977 () Bool)

(assert (=> b!1352058 m!1238977))

(declare-fun m!1238979 () Bool)

(assert (=> b!1352059 m!1238979))

(push 1)

