; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114656 () Bool)

(assert start!114656)

(declare-fun b!1360068 () Bool)

(declare-fun res!904435 () Bool)

(declare-fun e!771712 () Bool)

(assert (=> b!1360068 (=> (not res!904435) (not e!771712))))

(declare-datatypes ((array!92544 0))(
  ( (array!92545 (arr!44711 (Array (_ BitVec 32) (_ BitVec 64))) (size!45261 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92544)

(declare-datatypes ((List!31752 0))(
  ( (Nil!31749) (Cons!31748 (h!32957 (_ BitVec 64)) (t!46428 List!31752)) )
))
(declare-fun arrayNoDuplicates!0 (array!92544 (_ BitVec 32) List!31752) Bool)

(assert (=> b!1360068 (= res!904435 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31749))))

(declare-fun b!1360069 () Bool)

(declare-fun res!904430 () Bool)

(assert (=> b!1360069 (=> (not res!904430) (not e!771712))))

(declare-fun acc!759 () List!31752)

(declare-fun noDuplicate!2318 (List!31752) Bool)

(assert (=> b!1360069 (= res!904430 (noDuplicate!2318 acc!759))))

(declare-fun b!1360070 () Bool)

(declare-fun res!904438 () Bool)

(assert (=> b!1360070 (=> (not res!904438) (not e!771712))))

(declare-fun contains!9461 (List!31752 (_ BitVec 64)) Bool)

(assert (=> b!1360070 (= res!904438 (not (contains!9461 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360071 () Bool)

(declare-fun res!904436 () Bool)

(assert (=> b!1360071 (=> (not res!904436) (not e!771712))))

(assert (=> b!1360071 (= res!904436 (not (contains!9461 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360072 () Bool)

(declare-fun res!904431 () Bool)

(assert (=> b!1360072 (=> (not res!904431) (not e!771712))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1360072 (= res!904431 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360073 () Bool)

(declare-datatypes ((Unit!44793 0))(
  ( (Unit!44794) )
))
(declare-fun e!771711 () Unit!44793)

(declare-fun Unit!44795 () Unit!44793)

(assert (=> b!1360073 (= e!771711 Unit!44795)))

(declare-fun b!1360074 () Bool)

(declare-fun lt!599780 () Unit!44793)

(assert (=> b!1360074 (= e!771711 lt!599780)))

(declare-fun lt!599782 () Unit!44793)

(declare-fun lemmaListSubSeqRefl!0 (List!31752) Unit!44793)

(assert (=> b!1360074 (= lt!599782 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!863 (List!31752 List!31752) Bool)

(assert (=> b!1360074 (subseq!863 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92544 List!31752 List!31752 (_ BitVec 32)) Unit!44793)

(declare-fun $colon$colon!866 (List!31752 (_ BitVec 64)) List!31752)

(assert (=> b!1360074 (= lt!599780 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!866 acc!759 (select (arr!44711 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360074 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360076 () Bool)

(declare-fun res!904434 () Bool)

(assert (=> b!1360076 (=> (not res!904434) (not e!771712))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360076 (= res!904434 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360077 () Bool)

(declare-fun res!904433 () Bool)

(assert (=> b!1360077 (=> (not res!904433) (not e!771712))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360077 (= res!904433 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45261 a!3742))))))

(declare-fun b!1360078 () Bool)

(declare-fun res!904437 () Bool)

(assert (=> b!1360078 (=> (not res!904437) (not e!771712))))

(assert (=> b!1360078 (= res!904437 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45261 a!3742)))))

(declare-fun res!904432 () Bool)

(assert (=> start!114656 (=> (not res!904432) (not e!771712))))

(assert (=> start!114656 (= res!904432 (and (bvslt (size!45261 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45261 a!3742))))))

(assert (=> start!114656 e!771712))

(assert (=> start!114656 true))

(declare-fun array_inv!33739 (array!92544) Bool)

(assert (=> start!114656 (array_inv!33739 a!3742)))

(declare-fun b!1360075 () Bool)

(assert (=> b!1360075 (= e!771712 false)))

(declare-fun lt!599781 () Unit!44793)

(assert (=> b!1360075 (= lt!599781 e!771711)))

(declare-fun c!127259 () Bool)

(assert (=> b!1360075 (= c!127259 (validKeyInArray!0 (select (arr!44711 a!3742) from!3120)))))

(assert (= (and start!114656 res!904432) b!1360069))

(assert (= (and b!1360069 res!904430) b!1360070))

(assert (= (and b!1360070 res!904438) b!1360071))

(assert (= (and b!1360071 res!904436) b!1360068))

(assert (= (and b!1360068 res!904435) b!1360072))

(assert (= (and b!1360072 res!904431) b!1360077))

(assert (= (and b!1360077 res!904433) b!1360076))

(assert (= (and b!1360076 res!904434) b!1360078))

(assert (= (and b!1360078 res!904437) b!1360075))

(assert (= (and b!1360075 c!127259) b!1360074))

(assert (= (and b!1360075 (not c!127259)) b!1360073))

(declare-fun m!1245397 () Bool)

(assert (=> b!1360071 m!1245397))

(declare-fun m!1245399 () Bool)

(assert (=> b!1360069 m!1245399))

(declare-fun m!1245401 () Bool)

(assert (=> b!1360070 m!1245401))

(declare-fun m!1245403 () Bool)

(assert (=> b!1360068 m!1245403))

(declare-fun m!1245405 () Bool)

(assert (=> start!114656 m!1245405))

(declare-fun m!1245407 () Bool)

(assert (=> b!1360072 m!1245407))

(declare-fun m!1245409 () Bool)

(assert (=> b!1360075 m!1245409))

(assert (=> b!1360075 m!1245409))

(declare-fun m!1245411 () Bool)

(assert (=> b!1360075 m!1245411))

(declare-fun m!1245413 () Bool)

(assert (=> b!1360074 m!1245413))

(assert (=> b!1360074 m!1245409))

(declare-fun m!1245415 () Bool)

(assert (=> b!1360074 m!1245415))

(declare-fun m!1245417 () Bool)

(assert (=> b!1360074 m!1245417))

(declare-fun m!1245419 () Bool)

(assert (=> b!1360074 m!1245419))

(assert (=> b!1360074 m!1245409))

(assert (=> b!1360074 m!1245415))

(declare-fun m!1245421 () Bool)

(assert (=> b!1360074 m!1245421))

(declare-fun m!1245423 () Bool)

(assert (=> b!1360076 m!1245423))

(push 1)

(assert (not start!114656))

(assert (not b!1360075))

(assert (not b!1360072))

(assert (not b!1360076))

(assert (not b!1360070))

(assert (not b!1360071))

(assert (not b!1360069))

(assert (not b!1360068))

(assert (not b!1360074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

