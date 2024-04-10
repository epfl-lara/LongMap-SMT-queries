; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113968 () Bool)

(assert start!113968)

(declare-fun b!1352090 () Bool)

(declare-fun res!897489 () Bool)

(declare-fun e!768694 () Bool)

(assert (=> b!1352090 (=> (not res!897489) (not e!768694))))

(declare-datatypes ((List!31564 0))(
  ( (Nil!31561) (Cons!31560 (h!32769 (_ BitVec 64)) (t!46222 List!31564)) )
))
(declare-fun acc!759 () List!31564)

(declare-datatypes ((array!92150 0))(
  ( (array!92151 (arr!44523 (Array (_ BitVec 32) (_ BitVec 64))) (size!45073 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92150)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92150 (_ BitVec 32) List!31564) Bool)

(assert (=> b!1352090 (= res!897489 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352091 () Bool)

(declare-fun res!897490 () Bool)

(assert (=> b!1352091 (=> (not res!897490) (not e!768694))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352091 (= res!897490 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45073 a!3742))))))

(declare-fun b!1352092 () Bool)

(declare-fun res!897485 () Bool)

(assert (=> b!1352092 (=> (not res!897485) (not e!768694))))

(assert (=> b!1352092 (= res!897485 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45073 a!3742)))))

(declare-fun b!1352093 () Bool)

(declare-fun res!897486 () Bool)

(assert (=> b!1352093 (=> (not res!897486) (not e!768694))))

(declare-fun noDuplicate!2130 (List!31564) Bool)

(assert (=> b!1352093 (= res!897486 (noDuplicate!2130 acc!759))))

(declare-fun b!1352094 () Bool)

(declare-fun res!897487 () Bool)

(assert (=> b!1352094 (=> (not res!897487) (not e!768694))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352094 (= res!897487 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352095 () Bool)

(declare-fun e!768693 () Bool)

(assert (=> b!1352095 (= e!768693 false)))

(declare-fun lt!597430 () Bool)

(assert (=> b!1352095 (= lt!597430 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352097 () Bool)

(declare-fun res!897492 () Bool)

(assert (=> b!1352097 (=> (not res!897492) (not e!768694))))

(declare-fun contains!9273 (List!31564 (_ BitVec 64)) Bool)

(assert (=> b!1352097 (= res!897492 (not (contains!9273 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352098 () Bool)

(assert (=> b!1352098 (= e!768694 e!768693)))

(declare-fun res!897484 () Bool)

(assert (=> b!1352098 (=> (not res!897484) (not e!768693))))

(assert (=> b!1352098 (= res!897484 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44310 0))(
  ( (Unit!44311) )
))
(declare-fun lt!597428 () Unit!44310)

(declare-fun e!768691 () Unit!44310)

(assert (=> b!1352098 (= lt!597428 e!768691)))

(declare-fun c!126743 () Bool)

(assert (=> b!1352098 (= c!126743 (validKeyInArray!0 (select (arr!44523 a!3742) from!3120)))))

(declare-fun b!1352099 () Bool)

(declare-fun Unit!44312 () Unit!44310)

(assert (=> b!1352099 (= e!768691 Unit!44312)))

(declare-fun b!1352100 () Bool)

(declare-fun res!897488 () Bool)

(assert (=> b!1352100 (=> (not res!897488) (not e!768694))))

(assert (=> b!1352100 (= res!897488 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31561))))

(declare-fun b!1352101 () Bool)

(declare-fun res!897493 () Bool)

(assert (=> b!1352101 (=> (not res!897493) (not e!768694))))

(assert (=> b!1352101 (= res!897493 (not (contains!9273 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!897491 () Bool)

(assert (=> start!113968 (=> (not res!897491) (not e!768694))))

(assert (=> start!113968 (= res!897491 (and (bvslt (size!45073 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45073 a!3742))))))

(assert (=> start!113968 e!768694))

(assert (=> start!113968 true))

(declare-fun array_inv!33551 (array!92150) Bool)

(assert (=> start!113968 (array_inv!33551 a!3742)))

(declare-fun b!1352096 () Bool)

(declare-fun lt!597427 () Unit!44310)

(assert (=> b!1352096 (= e!768691 lt!597427)))

(declare-fun lt!597429 () Unit!44310)

(declare-fun lemmaListSubSeqRefl!0 (List!31564) Unit!44310)

(assert (=> b!1352096 (= lt!597429 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!693 (List!31564 List!31564) Bool)

(assert (=> b!1352096 (subseq!693 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92150 List!31564 List!31564 (_ BitVec 32)) Unit!44310)

(declare-fun $colon$colon!708 (List!31564 (_ BitVec 64)) List!31564)

(assert (=> b!1352096 (= lt!597427 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!708 acc!759 (select (arr!44523 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352096 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!113968 res!897491) b!1352093))

(assert (= (and b!1352093 res!897486) b!1352101))

(assert (= (and b!1352101 res!897493) b!1352097))

(assert (= (and b!1352097 res!897492) b!1352100))

(assert (= (and b!1352100 res!897488) b!1352090))

(assert (= (and b!1352090 res!897489) b!1352091))

(assert (= (and b!1352091 res!897490) b!1352094))

(assert (= (and b!1352094 res!897487) b!1352092))

(assert (= (and b!1352092 res!897485) b!1352098))

(assert (= (and b!1352098 c!126743) b!1352096))

(assert (= (and b!1352098 (not c!126743)) b!1352099))

(assert (= (and b!1352098 res!897484) b!1352095))

(declare-fun m!1238981 () Bool)

(assert (=> b!1352100 m!1238981))

(declare-fun m!1238983 () Bool)

(assert (=> b!1352097 m!1238983))

(declare-fun m!1238985 () Bool)

(assert (=> b!1352090 m!1238985))

(declare-fun m!1238987 () Bool)

(assert (=> b!1352096 m!1238987))

(declare-fun m!1238989 () Bool)

(assert (=> b!1352096 m!1238989))

(declare-fun m!1238991 () Bool)

(assert (=> b!1352096 m!1238991))

(declare-fun m!1238993 () Bool)

(assert (=> b!1352096 m!1238993))

(declare-fun m!1238995 () Bool)

(assert (=> b!1352096 m!1238995))

(assert (=> b!1352096 m!1238989))

(assert (=> b!1352096 m!1238991))

(declare-fun m!1238997 () Bool)

(assert (=> b!1352096 m!1238997))

(declare-fun m!1238999 () Bool)

(assert (=> b!1352101 m!1238999))

(assert (=> b!1352098 m!1238989))

(assert (=> b!1352098 m!1238989))

(declare-fun m!1239001 () Bool)

(assert (=> b!1352098 m!1239001))

(declare-fun m!1239003 () Bool)

(assert (=> b!1352093 m!1239003))

(declare-fun m!1239005 () Bool)

(assert (=> start!113968 m!1239005))

(declare-fun m!1239007 () Bool)

(assert (=> b!1352094 m!1239007))

(assert (=> b!1352095 m!1238995))

(check-sat (not b!1352097) (not b!1352098) (not start!113968) (not b!1352094) (not b!1352100) (not b!1352101) (not b!1352090) (not b!1352096) (not b!1352093) (not b!1352095))
(check-sat)
