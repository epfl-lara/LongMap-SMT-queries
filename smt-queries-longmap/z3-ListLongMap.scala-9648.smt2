; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114026 () Bool)

(assert start!114026)

(declare-fun b!1353108 () Bool)

(declare-fun res!898377 () Bool)

(declare-fun e!769008 () Bool)

(assert (=> b!1353108 (=> (not res!898377) (not e!769008))))

(declare-datatypes ((List!31646 0))(
  ( (Nil!31643) (Cons!31642 (h!32851 (_ BitVec 64)) (t!46296 List!31646)) )
))
(declare-fun acc!759 () List!31646)

(declare-datatypes ((array!92157 0))(
  ( (array!92158 (arr!44527 (Array (_ BitVec 32) (_ BitVec 64))) (size!45079 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92157)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92157 (_ BitVec 32) List!31646) Bool)

(assert (=> b!1353108 (= res!898377 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353109 () Bool)

(declare-fun e!769012 () Bool)

(declare-fun e!769009 () Bool)

(assert (=> b!1353109 (= e!769012 e!769009)))

(declare-fun res!898371 () Bool)

(assert (=> b!1353109 (=> (not res!898371) (not e!769009))))

(assert (=> b!1353109 (= res!898371 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!597598 () List!31646)

(declare-fun $colon$colon!739 (List!31646 (_ BitVec 64)) List!31646)

(assert (=> b!1353109 (= lt!597598 ($colon$colon!739 acc!759 (select (arr!44527 a!3742) from!3120)))))

(declare-fun b!1353110 () Bool)

(declare-fun res!898376 () Bool)

(assert (=> b!1353110 (=> (not res!898376) (not e!769008))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353110 (= res!898376 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45079 a!3742))))))

(declare-fun b!1353112 () Bool)

(declare-fun res!898378 () Bool)

(assert (=> b!1353112 (=> (not res!898378) (not e!769008))))

(declare-fun noDuplicate!2181 (List!31646) Bool)

(assert (=> b!1353112 (= res!898378 (noDuplicate!2181 acc!759))))

(declare-fun b!1353113 () Bool)

(declare-fun res!898370 () Bool)

(assert (=> b!1353113 (=> (not res!898370) (not e!769008))))

(declare-fun contains!9266 (List!31646 (_ BitVec 64)) Bool)

(assert (=> b!1353113 (= res!898370 (not (contains!9266 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353114 () Bool)

(assert (=> b!1353114 (= e!769009 false)))

(declare-fun lt!597597 () Bool)

(assert (=> b!1353114 (= lt!597597 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597598))))

(declare-fun b!1353115 () Bool)

(declare-fun res!898381 () Bool)

(assert (=> b!1353115 (=> (not res!898381) (not e!769009))))

(assert (=> b!1353115 (= res!898381 (noDuplicate!2181 lt!597598))))

(declare-fun b!1353116 () Bool)

(assert (=> b!1353116 (= e!769008 e!769012)))

(declare-fun res!898369 () Bool)

(assert (=> b!1353116 (=> (not res!898369) (not e!769012))))

(declare-fun lt!597596 () Bool)

(assert (=> b!1353116 (= res!898369 (and (not (= from!3120 i!1404)) lt!597596))))

(declare-datatypes ((Unit!44238 0))(
  ( (Unit!44239) )
))
(declare-fun lt!597593 () Unit!44238)

(declare-fun e!769011 () Unit!44238)

(assert (=> b!1353116 (= lt!597593 e!769011)))

(declare-fun c!126812 () Bool)

(assert (=> b!1353116 (= c!126812 lt!597596)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353116 (= lt!597596 (validKeyInArray!0 (select (arr!44527 a!3742) from!3120)))))

(declare-fun b!1353117 () Bool)

(declare-fun res!898374 () Bool)

(assert (=> b!1353117 (=> (not res!898374) (not e!769009))))

(assert (=> b!1353117 (= res!898374 (not (contains!9266 lt!597598 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898380 () Bool)

(assert (=> start!114026 (=> (not res!898380) (not e!769008))))

(assert (=> start!114026 (= res!898380 (and (bvslt (size!45079 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45079 a!3742))))))

(assert (=> start!114026 e!769008))

(assert (=> start!114026 true))

(declare-fun array_inv!33760 (array!92157) Bool)

(assert (=> start!114026 (array_inv!33760 a!3742)))

(declare-fun b!1353111 () Bool)

(declare-fun res!898382 () Bool)

(assert (=> b!1353111 (=> (not res!898382) (not e!769008))))

(assert (=> b!1353111 (= res!898382 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45079 a!3742)))))

(declare-fun b!1353118 () Bool)

(declare-fun lt!597595 () Unit!44238)

(assert (=> b!1353118 (= e!769011 lt!597595)))

(declare-fun lt!597594 () Unit!44238)

(declare-fun lemmaListSubSeqRefl!0 (List!31646) Unit!44238)

(assert (=> b!1353118 (= lt!597594 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!722 (List!31646 List!31646) Bool)

(assert (=> b!1353118 (subseq!722 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92157 List!31646 List!31646 (_ BitVec 32)) Unit!44238)

(assert (=> b!1353118 (= lt!597595 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!739 acc!759 (select (arr!44527 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353118 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353119 () Bool)

(declare-fun res!898373 () Bool)

(assert (=> b!1353119 (=> (not res!898373) (not e!769008))))

(assert (=> b!1353119 (= res!898373 (not (contains!9266 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353120 () Bool)

(declare-fun res!898375 () Bool)

(assert (=> b!1353120 (=> (not res!898375) (not e!769008))))

(assert (=> b!1353120 (= res!898375 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31643))))

(declare-fun b!1353121 () Bool)

(declare-fun res!898372 () Bool)

(assert (=> b!1353121 (=> (not res!898372) (not e!769008))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353121 (= res!898372 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353122 () Bool)

(declare-fun Unit!44240 () Unit!44238)

(assert (=> b!1353122 (= e!769011 Unit!44240)))

(declare-fun b!1353123 () Bool)

(declare-fun res!898379 () Bool)

(assert (=> b!1353123 (=> (not res!898379) (not e!769009))))

(assert (=> b!1353123 (= res!898379 (not (contains!9266 lt!597598 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114026 res!898380) b!1353112))

(assert (= (and b!1353112 res!898378) b!1353119))

(assert (= (and b!1353119 res!898373) b!1353113))

(assert (= (and b!1353113 res!898370) b!1353120))

(assert (= (and b!1353120 res!898375) b!1353108))

(assert (= (and b!1353108 res!898377) b!1353110))

(assert (= (and b!1353110 res!898376) b!1353121))

(assert (= (and b!1353121 res!898372) b!1353111))

(assert (= (and b!1353111 res!898382) b!1353116))

(assert (= (and b!1353116 c!126812) b!1353118))

(assert (= (and b!1353116 (not c!126812)) b!1353122))

(assert (= (and b!1353116 res!898369) b!1353109))

(assert (= (and b!1353109 res!898371) b!1353115))

(assert (= (and b!1353115 res!898381) b!1353123))

(assert (= (and b!1353123 res!898379) b!1353117))

(assert (= (and b!1353117 res!898374) b!1353114))

(declare-fun m!1239349 () Bool)

(assert (=> b!1353109 m!1239349))

(assert (=> b!1353109 m!1239349))

(declare-fun m!1239351 () Bool)

(assert (=> b!1353109 m!1239351))

(declare-fun m!1239353 () Bool)

(assert (=> b!1353120 m!1239353))

(declare-fun m!1239355 () Bool)

(assert (=> start!114026 m!1239355))

(declare-fun m!1239357 () Bool)

(assert (=> b!1353115 m!1239357))

(declare-fun m!1239359 () Bool)

(assert (=> b!1353113 m!1239359))

(declare-fun m!1239361 () Bool)

(assert (=> b!1353112 m!1239361))

(declare-fun m!1239363 () Bool)

(assert (=> b!1353117 m!1239363))

(declare-fun m!1239365 () Bool)

(assert (=> b!1353114 m!1239365))

(declare-fun m!1239367 () Bool)

(assert (=> b!1353121 m!1239367))

(assert (=> b!1353116 m!1239349))

(assert (=> b!1353116 m!1239349))

(declare-fun m!1239369 () Bool)

(assert (=> b!1353116 m!1239369))

(declare-fun m!1239371 () Bool)

(assert (=> b!1353123 m!1239371))

(declare-fun m!1239373 () Bool)

(assert (=> b!1353108 m!1239373))

(declare-fun m!1239375 () Bool)

(assert (=> b!1353119 m!1239375))

(declare-fun m!1239377 () Bool)

(assert (=> b!1353118 m!1239377))

(assert (=> b!1353118 m!1239349))

(assert (=> b!1353118 m!1239351))

(declare-fun m!1239379 () Bool)

(assert (=> b!1353118 m!1239379))

(declare-fun m!1239381 () Bool)

(assert (=> b!1353118 m!1239381))

(assert (=> b!1353118 m!1239349))

(assert (=> b!1353118 m!1239351))

(declare-fun m!1239383 () Bool)

(assert (=> b!1353118 m!1239383))

(check-sat (not b!1353117) (not start!114026) (not b!1353123) (not b!1353119) (not b!1353118) (not b!1353114) (not b!1353113) (not b!1353121) (not b!1353116) (not b!1353108) (not b!1353112) (not b!1353120) (not b!1353115) (not b!1353109))
(check-sat)
