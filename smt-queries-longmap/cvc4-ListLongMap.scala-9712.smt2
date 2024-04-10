; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114888 () Bool)

(assert start!114888)

(declare-fun b!1362003 () Bool)

(declare-datatypes ((Unit!44898 0))(
  ( (Unit!44899) )
))
(declare-fun e!772621 () Unit!44898)

(declare-fun lt!600351 () Unit!44898)

(assert (=> b!1362003 (= e!772621 lt!600351)))

(declare-fun lt!600349 () Unit!44898)

(declare-datatypes ((List!31787 0))(
  ( (Nil!31784) (Cons!31783 (h!32992 (_ BitVec 64)) (t!46472 List!31787)) )
))
(declare-fun acc!759 () List!31787)

(declare-fun lemmaListSubSeqRefl!0 (List!31787) Unit!44898)

(assert (=> b!1362003 (= lt!600349 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!898 (List!31787 List!31787) Bool)

(assert (=> b!1362003 (subseq!898 acc!759 acc!759)))

(declare-datatypes ((array!92623 0))(
  ( (array!92624 (arr!44746 (Array (_ BitVec 32) (_ BitVec 64))) (size!45296 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92623)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92623 List!31787 List!31787 (_ BitVec 32)) Unit!44898)

(declare-fun $colon$colon!901 (List!31787 (_ BitVec 64)) List!31787)

(assert (=> b!1362003 (= lt!600351 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!901 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92623 (_ BitVec 32) List!31787) Bool)

(assert (=> b!1362003 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362004 () Bool)

(declare-fun res!906064 () Bool)

(declare-fun e!772618 () Bool)

(assert (=> b!1362004 (=> (not res!906064) (not e!772618))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362004 (= res!906064 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362005 () Bool)

(declare-fun e!772617 () Bool)

(assert (=> b!1362005 (= e!772618 e!772617)))

(declare-fun res!906073 () Bool)

(assert (=> b!1362005 (=> (not res!906073) (not e!772617))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600352 () Bool)

(assert (=> b!1362005 (= res!906073 (and (not (= from!3120 i!1404)) lt!600352))))

(declare-fun lt!600348 () Unit!44898)

(assert (=> b!1362005 (= lt!600348 e!772621)))

(declare-fun c!127412 () Bool)

(assert (=> b!1362005 (= c!127412 lt!600352)))

(assert (=> b!1362005 (= lt!600352 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1362006 () Bool)

(declare-fun res!906071 () Bool)

(declare-fun e!772619 () Bool)

(assert (=> b!1362006 (=> (not res!906071) (not e!772619))))

(declare-fun lt!600350 () List!31787)

(assert (=> b!1362006 (= res!906071 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600350))))

(declare-fun b!1362007 () Bool)

(declare-fun res!906060 () Bool)

(assert (=> b!1362007 (=> (not res!906060) (not e!772618))))

(declare-fun contains!9496 (List!31787 (_ BitVec 64)) Bool)

(assert (=> b!1362007 (= res!906060 (not (contains!9496 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362008 () Bool)

(declare-fun res!906068 () Bool)

(assert (=> b!1362008 (=> (not res!906068) (not e!772618))))

(assert (=> b!1362008 (= res!906068 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362009 () Bool)

(assert (=> b!1362009 (= e!772617 e!772619)))

(declare-fun res!906059 () Bool)

(assert (=> b!1362009 (=> (not res!906059) (not e!772619))))

(assert (=> b!1362009 (= res!906059 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362009 (= lt!600350 ($colon$colon!901 acc!759 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1362010 () Bool)

(declare-fun res!906063 () Bool)

(assert (=> b!1362010 (=> (not res!906063) (not e!772618))))

(assert (=> b!1362010 (= res!906063 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45296 a!3742))))))

(declare-fun b!1362011 () Bool)

(declare-fun res!906062 () Bool)

(assert (=> b!1362011 (=> (not res!906062) (not e!772618))))

(declare-fun noDuplicate!2353 (List!31787) Bool)

(assert (=> b!1362011 (= res!906062 (noDuplicate!2353 acc!759))))

(declare-fun b!1362012 () Bool)

(assert (=> b!1362012 (= e!772619 (bvsge (bvsub (size!45296 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45296 a!3742) from!3120)))))

(declare-fun b!1362013 () Bool)

(declare-fun res!906061 () Bool)

(assert (=> b!1362013 (=> (not res!906061) (not e!772618))))

(assert (=> b!1362013 (= res!906061 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31784))))

(declare-fun b!1362014 () Bool)

(declare-fun res!906069 () Bool)

(assert (=> b!1362014 (=> (not res!906069) (not e!772619))))

(assert (=> b!1362014 (= res!906069 (not (contains!9496 lt!600350 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362015 () Bool)

(declare-fun res!906067 () Bool)

(assert (=> b!1362015 (=> (not res!906067) (not e!772618))))

(assert (=> b!1362015 (= res!906067 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45296 a!3742)))))

(declare-fun res!906070 () Bool)

(assert (=> start!114888 (=> (not res!906070) (not e!772618))))

(assert (=> start!114888 (= res!906070 (and (bvslt (size!45296 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45296 a!3742))))))

(assert (=> start!114888 e!772618))

(assert (=> start!114888 true))

(declare-fun array_inv!33774 (array!92623) Bool)

(assert (=> start!114888 (array_inv!33774 a!3742)))

(declare-fun b!1362016 () Bool)

(declare-fun res!906065 () Bool)

(assert (=> b!1362016 (=> (not res!906065) (not e!772619))))

(assert (=> b!1362016 (= res!906065 (noDuplicate!2353 lt!600350))))

(declare-fun b!1362017 () Bool)

(declare-fun res!906072 () Bool)

(assert (=> b!1362017 (=> (not res!906072) (not e!772619))))

(assert (=> b!1362017 (= res!906072 (not (contains!9496 lt!600350 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362018 () Bool)

(declare-fun Unit!44900 () Unit!44898)

(assert (=> b!1362018 (= e!772621 Unit!44900)))

(declare-fun b!1362019 () Bool)

(declare-fun res!906066 () Bool)

(assert (=> b!1362019 (=> (not res!906066) (not e!772618))))

(assert (=> b!1362019 (= res!906066 (not (contains!9496 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114888 res!906070) b!1362011))

(assert (= (and b!1362011 res!906062) b!1362019))

(assert (= (and b!1362019 res!906066) b!1362007))

(assert (= (and b!1362007 res!906060) b!1362013))

(assert (= (and b!1362013 res!906061) b!1362008))

(assert (= (and b!1362008 res!906068) b!1362010))

(assert (= (and b!1362010 res!906063) b!1362004))

(assert (= (and b!1362004 res!906064) b!1362015))

(assert (= (and b!1362015 res!906067) b!1362005))

(assert (= (and b!1362005 c!127412) b!1362003))

(assert (= (and b!1362005 (not c!127412)) b!1362018))

(assert (= (and b!1362005 res!906073) b!1362009))

(assert (= (and b!1362009 res!906059) b!1362016))

(assert (= (and b!1362016 res!906065) b!1362017))

(assert (= (and b!1362017 res!906072) b!1362014))

(assert (= (and b!1362014 res!906069) b!1362006))

(assert (= (and b!1362006 res!906071) b!1362012))

(declare-fun m!1246993 () Bool)

(assert (=> b!1362014 m!1246993))

(declare-fun m!1246995 () Bool)

(assert (=> b!1362008 m!1246995))

(declare-fun m!1246997 () Bool)

(assert (=> b!1362013 m!1246997))

(declare-fun m!1246999 () Bool)

(assert (=> b!1362007 m!1246999))

(declare-fun m!1247001 () Bool)

(assert (=> b!1362016 m!1247001))

(declare-fun m!1247003 () Bool)

(assert (=> start!114888 m!1247003))

(declare-fun m!1247005 () Bool)

(assert (=> b!1362019 m!1247005))

(declare-fun m!1247007 () Bool)

(assert (=> b!1362006 m!1247007))

(declare-fun m!1247009 () Bool)

(assert (=> b!1362003 m!1247009))

(declare-fun m!1247011 () Bool)

(assert (=> b!1362003 m!1247011))

(declare-fun m!1247013 () Bool)

(assert (=> b!1362003 m!1247013))

(declare-fun m!1247015 () Bool)

(assert (=> b!1362003 m!1247015))

(declare-fun m!1247017 () Bool)

(assert (=> b!1362003 m!1247017))

(assert (=> b!1362003 m!1247011))

(assert (=> b!1362003 m!1247013))

(declare-fun m!1247019 () Bool)

(assert (=> b!1362003 m!1247019))

(assert (=> b!1362005 m!1247011))

(assert (=> b!1362005 m!1247011))

(declare-fun m!1247021 () Bool)

(assert (=> b!1362005 m!1247021))

(assert (=> b!1362009 m!1247011))

(assert (=> b!1362009 m!1247011))

(assert (=> b!1362009 m!1247013))

(declare-fun m!1247023 () Bool)

(assert (=> b!1362017 m!1247023))

(declare-fun m!1247025 () Bool)

(assert (=> b!1362004 m!1247025))

(declare-fun m!1247027 () Bool)

(assert (=> b!1362011 m!1247027))

(push 1)

(assert (not b!1362004))

(assert (not b!1362013))

(assert (not b!1362016))

(assert (not b!1362006))

(assert (not b!1362003))

(assert (not b!1362005))

(assert (not b!1362014))

(assert (not b!1362017))

(assert (not b!1362008))

(assert (not start!114888))

(assert (not b!1362011))

(assert (not b!1362019))

(assert (not b!1362009))

(assert (not b!1362007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

