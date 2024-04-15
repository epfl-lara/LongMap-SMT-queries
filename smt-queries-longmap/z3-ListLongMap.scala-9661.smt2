; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114104 () Bool)

(assert start!114104)

(declare-fun b!1355009 () Bool)

(declare-fun res!900036 () Bool)

(declare-fun e!769594 () Bool)

(assert (=> b!1355009 (=> (not res!900036) (not e!769594))))

(declare-datatypes ((List!31685 0))(
  ( (Nil!31682) (Cons!31681 (h!32890 (_ BitVec 64)) (t!46335 List!31685)) )
))
(declare-fun acc!759 () List!31685)

(declare-datatypes ((array!92235 0))(
  ( (array!92236 (arr!44566 (Array (_ BitVec 32) (_ BitVec 64))) (size!45118 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92235)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92235 (_ BitVec 32) List!31685) Bool)

(assert (=> b!1355009 (= res!900036 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355010 () Bool)

(declare-fun res!900044 () Bool)

(assert (=> b!1355010 (=> (not res!900044) (not e!769594))))

(declare-fun noDuplicate!2220 (List!31685) Bool)

(assert (=> b!1355010 (= res!900044 (noDuplicate!2220 acc!759))))

(declare-fun b!1355011 () Bool)

(declare-fun res!900035 () Bool)

(assert (=> b!1355011 (=> (not res!900035) (not e!769594))))

(declare-fun contains!9305 (List!31685 (_ BitVec 64)) Bool)

(assert (=> b!1355011 (= res!900035 (not (contains!9305 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355012 () Bool)

(declare-fun res!900043 () Bool)

(assert (=> b!1355012 (=> (not res!900043) (not e!769594))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355012 (= res!900043 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45118 a!3742))))))

(declare-fun b!1355013 () Bool)

(declare-fun res!900037 () Bool)

(assert (=> b!1355013 (=> (not res!900037) (not e!769594))))

(assert (=> b!1355013 (= res!900037 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45118 a!3742)))))

(declare-fun b!1355008 () Bool)

(declare-datatypes ((Unit!44355 0))(
  ( (Unit!44356) )
))
(declare-fun e!769593 () Unit!44355)

(declare-fun Unit!44357 () Unit!44355)

(assert (=> b!1355008 (= e!769593 Unit!44357)))

(declare-fun res!900042 () Bool)

(assert (=> start!114104 (=> (not res!900042) (not e!769594))))

(assert (=> start!114104 (= res!900042 (and (bvslt (size!45118 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45118 a!3742))))))

(assert (=> start!114104 e!769594))

(assert (=> start!114104 true))

(declare-fun array_inv!33799 (array!92235) Bool)

(assert (=> start!114104 (array_inv!33799 a!3742)))

(declare-fun b!1355014 () Bool)

(declare-fun e!769591 () Bool)

(assert (=> b!1355014 (= e!769591 false)))

(declare-fun lt!598295 () Bool)

(assert (=> b!1355014 (= lt!598295 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355015 () Bool)

(declare-fun res!900039 () Bool)

(assert (=> b!1355015 (=> (not res!900039) (not e!769594))))

(assert (=> b!1355015 (= res!900039 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31682))))

(declare-fun b!1355016 () Bool)

(declare-fun res!900038 () Bool)

(assert (=> b!1355016 (=> (not res!900038) (not e!769594))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355016 (= res!900038 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355017 () Bool)

(declare-fun lt!598293 () Unit!44355)

(assert (=> b!1355017 (= e!769593 lt!598293)))

(declare-fun lt!598297 () Unit!44355)

(declare-fun lemmaListSubSeqRefl!0 (List!31685) Unit!44355)

(assert (=> b!1355017 (= lt!598297 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!761 (List!31685 List!31685) Bool)

(assert (=> b!1355017 (subseq!761 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92235 List!31685 List!31685 (_ BitVec 32)) Unit!44355)

(declare-fun $colon$colon!778 (List!31685 (_ BitVec 64)) List!31685)

(assert (=> b!1355017 (= lt!598293 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!778 acc!759 (select (arr!44566 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355017 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355018 () Bool)

(assert (=> b!1355018 (= e!769594 e!769591)))

(declare-fun res!900040 () Bool)

(assert (=> b!1355018 (=> (not res!900040) (not e!769591))))

(declare-fun lt!598294 () Bool)

(assert (=> b!1355018 (= res!900040 (and (not (= from!3120 i!1404)) (not lt!598294) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598296 () Unit!44355)

(assert (=> b!1355018 (= lt!598296 e!769593)))

(declare-fun c!126929 () Bool)

(assert (=> b!1355018 (= c!126929 lt!598294)))

(assert (=> b!1355018 (= lt!598294 (validKeyInArray!0 (select (arr!44566 a!3742) from!3120)))))

(declare-fun b!1355019 () Bool)

(declare-fun res!900041 () Bool)

(assert (=> b!1355019 (=> (not res!900041) (not e!769594))))

(assert (=> b!1355019 (= res!900041 (not (contains!9305 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114104 res!900042) b!1355010))

(assert (= (and b!1355010 res!900044) b!1355019))

(assert (= (and b!1355019 res!900041) b!1355011))

(assert (= (and b!1355011 res!900035) b!1355015))

(assert (= (and b!1355015 res!900039) b!1355009))

(assert (= (and b!1355009 res!900036) b!1355012))

(assert (= (and b!1355012 res!900043) b!1355016))

(assert (= (and b!1355016 res!900038) b!1355013))

(assert (= (and b!1355013 res!900037) b!1355018))

(assert (= (and b!1355018 c!126929) b!1355017))

(assert (= (and b!1355018 (not c!126929)) b!1355008))

(assert (= (and b!1355018 res!900040) b!1355014))

(declare-fun m!1240825 () Bool)

(assert (=> b!1355010 m!1240825))

(declare-fun m!1240827 () Bool)

(assert (=> b!1355018 m!1240827))

(assert (=> b!1355018 m!1240827))

(declare-fun m!1240829 () Bool)

(assert (=> b!1355018 m!1240829))

(declare-fun m!1240831 () Bool)

(assert (=> b!1355015 m!1240831))

(declare-fun m!1240833 () Bool)

(assert (=> b!1355011 m!1240833))

(declare-fun m!1240835 () Bool)

(assert (=> b!1355016 m!1240835))

(declare-fun m!1240837 () Bool)

(assert (=> b!1355019 m!1240837))

(declare-fun m!1240839 () Bool)

(assert (=> b!1355009 m!1240839))

(declare-fun m!1240841 () Bool)

(assert (=> b!1355017 m!1240841))

(assert (=> b!1355017 m!1240827))

(declare-fun m!1240843 () Bool)

(assert (=> b!1355017 m!1240843))

(declare-fun m!1240845 () Bool)

(assert (=> b!1355017 m!1240845))

(declare-fun m!1240847 () Bool)

(assert (=> b!1355017 m!1240847))

(assert (=> b!1355017 m!1240827))

(assert (=> b!1355017 m!1240843))

(declare-fun m!1240849 () Bool)

(assert (=> b!1355017 m!1240849))

(declare-fun m!1240851 () Bool)

(assert (=> start!114104 m!1240851))

(assert (=> b!1355014 m!1240847))

(check-sat (not b!1355016) (not b!1355014) (not b!1355019) (not start!114104) (not b!1355010) (not b!1355011) (not b!1355015) (not b!1355017) (not b!1355018) (not b!1355009))
(check-sat)
