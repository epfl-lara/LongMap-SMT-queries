; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114060 () Bool)

(assert start!114060)

(declare-fun b!1353994 () Bool)

(declare-fun res!899119 () Bool)

(declare-fun e!769296 () Bool)

(assert (=> b!1353994 (=> (not res!899119) (not e!769296))))

(declare-datatypes ((List!31610 0))(
  ( (Nil!31607) (Cons!31606 (h!32815 (_ BitVec 64)) (t!46268 List!31610)) )
))
(declare-fun acc!759 () List!31610)

(declare-fun contains!9319 (List!31610 (_ BitVec 64)) Bool)

(assert (=> b!1353994 (= res!899119 (not (contains!9319 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353995 () Bool)

(declare-fun res!899118 () Bool)

(declare-fun e!769299 () Bool)

(assert (=> b!1353995 (=> (not res!899118) (not e!769299))))

(declare-fun lt!598089 () List!31610)

(assert (=> b!1353995 (= res!899118 (not (contains!9319 lt!598089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353996 () Bool)

(declare-fun res!899113 () Bool)

(assert (=> b!1353996 (=> (not res!899113) (not e!769296))))

(declare-datatypes ((array!92242 0))(
  ( (array!92243 (arr!44569 (Array (_ BitVec 32) (_ BitVec 64))) (size!45119 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92242)

(declare-fun arrayNoDuplicates!0 (array!92242 (_ BitVec 32) List!31610) Bool)

(assert (=> b!1353996 (= res!899113 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31607))))

(declare-fun b!1353997 () Bool)

(declare-fun res!899123 () Bool)

(assert (=> b!1353997 (=> (not res!899123) (not e!769296))))

(assert (=> b!1353997 (= res!899123 (not (contains!9319 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353998 () Bool)

(declare-datatypes ((Unit!44448 0))(
  ( (Unit!44449) )
))
(declare-fun e!769300 () Unit!44448)

(declare-fun lt!598085 () Unit!44448)

(assert (=> b!1353998 (= e!769300 lt!598085)))

(declare-fun lt!598088 () Unit!44448)

(declare-fun lemmaListSubSeqRefl!0 (List!31610) Unit!44448)

(assert (=> b!1353998 (= lt!598088 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!739 (List!31610 List!31610) Bool)

(assert (=> b!1353998 (subseq!739 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92242 List!31610 List!31610 (_ BitVec 32)) Unit!44448)

(declare-fun $colon$colon!754 (List!31610 (_ BitVec 64)) List!31610)

(assert (=> b!1353998 (= lt!598085 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!754 acc!759 (select (arr!44569 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353998 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353999 () Bool)

(declare-fun res!899115 () Bool)

(assert (=> b!1353999 (=> (not res!899115) (not e!769296))))

(assert (=> b!1353999 (= res!899115 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45119 a!3742)))))

(declare-fun b!1354000 () Bool)

(declare-fun res!899112 () Bool)

(assert (=> b!1354000 (=> (not res!899112) (not e!769296))))

(declare-fun noDuplicate!2176 (List!31610) Bool)

(assert (=> b!1354000 (= res!899112 (noDuplicate!2176 acc!759))))

(declare-fun res!899117 () Bool)

(assert (=> start!114060 (=> (not res!899117) (not e!769296))))

(assert (=> start!114060 (= res!899117 (and (bvslt (size!45119 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45119 a!3742))))))

(assert (=> start!114060 e!769296))

(assert (=> start!114060 true))

(declare-fun array_inv!33597 (array!92242) Bool)

(assert (=> start!114060 (array_inv!33597 a!3742)))

(declare-fun b!1354001 () Bool)

(declare-fun res!899114 () Bool)

(assert (=> b!1354001 (=> (not res!899114) (not e!769296))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354001 (= res!899114 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354002 () Bool)

(declare-fun res!899124 () Bool)

(assert (=> b!1354002 (=> (not res!899124) (not e!769299))))

(assert (=> b!1354002 (= res!899124 (noDuplicate!2176 lt!598089))))

(declare-fun b!1354003 () Bool)

(declare-fun e!769297 () Bool)

(assert (=> b!1354003 (= e!769297 e!769299)))

(declare-fun res!899120 () Bool)

(assert (=> b!1354003 (=> (not res!899120) (not e!769299))))

(assert (=> b!1354003 (= res!899120 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354003 (= lt!598089 ($colon$colon!754 acc!759 (select (arr!44569 a!3742) from!3120)))))

(declare-fun b!1354004 () Bool)

(declare-fun Unit!44450 () Unit!44448)

(assert (=> b!1354004 (= e!769300 Unit!44450)))

(declare-fun b!1354005 () Bool)

(declare-fun res!899121 () Bool)

(assert (=> b!1354005 (=> (not res!899121) (not e!769296))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354005 (= res!899121 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45119 a!3742))))))

(declare-fun b!1354006 () Bool)

(declare-fun res!899125 () Bool)

(assert (=> b!1354006 (=> (not res!899125) (not e!769299))))

(assert (=> b!1354006 (= res!899125 (not (contains!9319 lt!598089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354007 () Bool)

(declare-fun res!899122 () Bool)

(assert (=> b!1354007 (=> (not res!899122) (not e!769296))))

(assert (=> b!1354007 (= res!899122 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354008 () Bool)

(assert (=> b!1354008 (= e!769299 false)))

(declare-fun lt!598087 () Bool)

(assert (=> b!1354008 (= lt!598087 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598089))))

(declare-fun b!1354009 () Bool)

(assert (=> b!1354009 (= e!769296 e!769297)))

(declare-fun res!899116 () Bool)

(assert (=> b!1354009 (=> (not res!899116) (not e!769297))))

(declare-fun lt!598086 () Bool)

(assert (=> b!1354009 (= res!899116 (and (not (= from!3120 i!1404)) lt!598086))))

(declare-fun lt!598090 () Unit!44448)

(assert (=> b!1354009 (= lt!598090 e!769300)))

(declare-fun c!126881 () Bool)

(assert (=> b!1354009 (= c!126881 lt!598086)))

(assert (=> b!1354009 (= lt!598086 (validKeyInArray!0 (select (arr!44569 a!3742) from!3120)))))

(assert (= (and start!114060 res!899117) b!1354000))

(assert (= (and b!1354000 res!899112) b!1353997))

(assert (= (and b!1353997 res!899123) b!1353994))

(assert (= (and b!1353994 res!899119) b!1353996))

(assert (= (and b!1353996 res!899113) b!1354007))

(assert (= (and b!1354007 res!899122) b!1354005))

(assert (= (and b!1354005 res!899121) b!1354001))

(assert (= (and b!1354001 res!899114) b!1353999))

(assert (= (and b!1353999 res!899115) b!1354009))

(assert (= (and b!1354009 c!126881) b!1353998))

(assert (= (and b!1354009 (not c!126881)) b!1354004))

(assert (= (and b!1354009 res!899116) b!1354003))

(assert (= (and b!1354003 res!899120) b!1354002))

(assert (= (and b!1354002 res!899124) b!1354006))

(assert (= (and b!1354006 res!899125) b!1353995))

(assert (= (and b!1353995 res!899118) b!1354008))

(declare-fun m!1240477 () Bool)

(assert (=> b!1353997 m!1240477))

(declare-fun m!1240479 () Bool)

(assert (=> b!1353995 m!1240479))

(declare-fun m!1240481 () Bool)

(assert (=> b!1354000 m!1240481))

(declare-fun m!1240483 () Bool)

(assert (=> b!1354002 m!1240483))

(declare-fun m!1240485 () Bool)

(assert (=> b!1353994 m!1240485))

(declare-fun m!1240487 () Bool)

(assert (=> b!1354008 m!1240487))

(declare-fun m!1240489 () Bool)

(assert (=> b!1354009 m!1240489))

(assert (=> b!1354009 m!1240489))

(declare-fun m!1240491 () Bool)

(assert (=> b!1354009 m!1240491))

(declare-fun m!1240493 () Bool)

(assert (=> start!114060 m!1240493))

(declare-fun m!1240495 () Bool)

(assert (=> b!1353996 m!1240495))

(declare-fun m!1240497 () Bool)

(assert (=> b!1354006 m!1240497))

(assert (=> b!1354003 m!1240489))

(assert (=> b!1354003 m!1240489))

(declare-fun m!1240499 () Bool)

(assert (=> b!1354003 m!1240499))

(declare-fun m!1240501 () Bool)

(assert (=> b!1354007 m!1240501))

(declare-fun m!1240503 () Bool)

(assert (=> b!1354001 m!1240503))

(declare-fun m!1240505 () Bool)

(assert (=> b!1353998 m!1240505))

(assert (=> b!1353998 m!1240489))

(assert (=> b!1353998 m!1240499))

(declare-fun m!1240507 () Bool)

(assert (=> b!1353998 m!1240507))

(declare-fun m!1240509 () Bool)

(assert (=> b!1353998 m!1240509))

(assert (=> b!1353998 m!1240489))

(assert (=> b!1353998 m!1240499))

(declare-fun m!1240511 () Bool)

(assert (=> b!1353998 m!1240511))

(push 1)

