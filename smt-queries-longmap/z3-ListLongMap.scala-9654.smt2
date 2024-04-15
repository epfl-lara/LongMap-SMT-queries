; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114062 () Bool)

(assert start!114062)

(declare-fun b!1353972 () Bool)

(declare-datatypes ((Unit!44292 0))(
  ( (Unit!44293) )
))
(declare-fun e!769281 () Unit!44292)

(declare-fun Unit!44294 () Unit!44292)

(assert (=> b!1353972 (= e!769281 Unit!44294)))

(declare-fun b!1353973 () Bool)

(declare-fun e!769279 () Bool)

(assert (=> b!1353973 (= e!769279 false)))

(declare-fun lt!597917 () Bool)

(declare-datatypes ((List!31664 0))(
  ( (Nil!31661) (Cons!31660 (h!32869 (_ BitVec 64)) (t!46314 List!31664)) )
))
(declare-fun lt!597918 () List!31664)

(declare-datatypes ((array!92193 0))(
  ( (array!92194 (arr!44545 (Array (_ BitVec 32) (_ BitVec 64))) (size!45097 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92193)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92193 (_ BitVec 32) List!31664) Bool)

(assert (=> b!1353973 (= lt!597917 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597918))))

(declare-fun b!1353974 () Bool)

(declare-fun res!899125 () Bool)

(assert (=> b!1353974 (=> (not res!899125) (not e!769279))))

(declare-fun noDuplicate!2199 (List!31664) Bool)

(assert (=> b!1353974 (= res!899125 (noDuplicate!2199 lt!597918))))

(declare-fun b!1353975 () Bool)

(declare-fun res!899132 () Bool)

(declare-fun e!769280 () Bool)

(assert (=> b!1353975 (=> (not res!899132) (not e!769280))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353975 (= res!899132 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45097 a!3742))))))

(declare-fun res!899136 () Bool)

(assert (=> start!114062 (=> (not res!899136) (not e!769280))))

(assert (=> start!114062 (= res!899136 (and (bvslt (size!45097 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45097 a!3742))))))

(assert (=> start!114062 e!769280))

(assert (=> start!114062 true))

(declare-fun array_inv!33778 (array!92193) Bool)

(assert (=> start!114062 (array_inv!33778 a!3742)))

(declare-fun b!1353976 () Bool)

(declare-fun res!899134 () Bool)

(assert (=> b!1353976 (=> (not res!899134) (not e!769280))))

(assert (=> b!1353976 (= res!899134 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31661))))

(declare-fun b!1353977 () Bool)

(declare-fun e!769278 () Bool)

(assert (=> b!1353977 (= e!769280 e!769278)))

(declare-fun res!899135 () Bool)

(assert (=> b!1353977 (=> (not res!899135) (not e!769278))))

(declare-fun lt!597922 () Bool)

(assert (=> b!1353977 (= res!899135 (and (not (= from!3120 i!1404)) lt!597922))))

(declare-fun lt!597920 () Unit!44292)

(assert (=> b!1353977 (= lt!597920 e!769281)))

(declare-fun c!126866 () Bool)

(assert (=> b!1353977 (= c!126866 lt!597922)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353977 (= lt!597922 (validKeyInArray!0 (select (arr!44545 a!3742) from!3120)))))

(declare-fun b!1353978 () Bool)

(declare-fun res!899128 () Bool)

(assert (=> b!1353978 (=> (not res!899128) (not e!769280))))

(declare-fun acc!759 () List!31664)

(declare-fun contains!9284 (List!31664 (_ BitVec 64)) Bool)

(assert (=> b!1353978 (= res!899128 (not (contains!9284 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353979 () Bool)

(declare-fun res!899133 () Bool)

(assert (=> b!1353979 (=> (not res!899133) (not e!769280))))

(assert (=> b!1353979 (= res!899133 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45097 a!3742)))))

(declare-fun b!1353980 () Bool)

(declare-fun res!899126 () Bool)

(assert (=> b!1353980 (=> (not res!899126) (not e!769279))))

(assert (=> b!1353980 (= res!899126 (not (contains!9284 lt!597918 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353981 () Bool)

(declare-fun res!899127 () Bool)

(assert (=> b!1353981 (=> (not res!899127) (not e!769280))))

(assert (=> b!1353981 (= res!899127 (not (contains!9284 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353982 () Bool)

(declare-fun res!899130 () Bool)

(assert (=> b!1353982 (=> (not res!899130) (not e!769279))))

(assert (=> b!1353982 (= res!899130 (not (contains!9284 lt!597918 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353983 () Bool)

(declare-fun res!899131 () Bool)

(assert (=> b!1353983 (=> (not res!899131) (not e!769280))))

(assert (=> b!1353983 (= res!899131 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353984 () Bool)

(declare-fun res!899129 () Bool)

(assert (=> b!1353984 (=> (not res!899129) (not e!769280))))

(assert (=> b!1353984 (= res!899129 (noDuplicate!2199 acc!759))))

(declare-fun b!1353985 () Bool)

(declare-fun lt!597921 () Unit!44292)

(assert (=> b!1353985 (= e!769281 lt!597921)))

(declare-fun lt!597919 () Unit!44292)

(declare-fun lemmaListSubSeqRefl!0 (List!31664) Unit!44292)

(assert (=> b!1353985 (= lt!597919 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!740 (List!31664 List!31664) Bool)

(assert (=> b!1353985 (subseq!740 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92193 List!31664 List!31664 (_ BitVec 32)) Unit!44292)

(declare-fun $colon$colon!757 (List!31664 (_ BitVec 64)) List!31664)

(assert (=> b!1353985 (= lt!597921 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!757 acc!759 (select (arr!44545 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353985 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353986 () Bool)

(assert (=> b!1353986 (= e!769278 e!769279)))

(declare-fun res!899138 () Bool)

(assert (=> b!1353986 (=> (not res!899138) (not e!769279))))

(assert (=> b!1353986 (= res!899138 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353986 (= lt!597918 ($colon$colon!757 acc!759 (select (arr!44545 a!3742) from!3120)))))

(declare-fun b!1353987 () Bool)

(declare-fun res!899137 () Bool)

(assert (=> b!1353987 (=> (not res!899137) (not e!769280))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353987 (= res!899137 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114062 res!899136) b!1353984))

(assert (= (and b!1353984 res!899129) b!1353978))

(assert (= (and b!1353978 res!899128) b!1353981))

(assert (= (and b!1353981 res!899127) b!1353976))

(assert (= (and b!1353976 res!899134) b!1353983))

(assert (= (and b!1353983 res!899131) b!1353975))

(assert (= (and b!1353975 res!899132) b!1353987))

(assert (= (and b!1353987 res!899137) b!1353979))

(assert (= (and b!1353979 res!899133) b!1353977))

(assert (= (and b!1353977 c!126866) b!1353985))

(assert (= (and b!1353977 (not c!126866)) b!1353972))

(assert (= (and b!1353977 res!899135) b!1353986))

(assert (= (and b!1353986 res!899138) b!1353974))

(assert (= (and b!1353974 res!899125) b!1353980))

(assert (= (and b!1353980 res!899126) b!1353982))

(assert (= (and b!1353982 res!899130) b!1353973))

(declare-fun m!1239997 () Bool)

(assert (=> b!1353987 m!1239997))

(declare-fun m!1239999 () Bool)

(assert (=> b!1353985 m!1239999))

(declare-fun m!1240001 () Bool)

(assert (=> b!1353985 m!1240001))

(declare-fun m!1240003 () Bool)

(assert (=> b!1353985 m!1240003))

(declare-fun m!1240005 () Bool)

(assert (=> b!1353985 m!1240005))

(declare-fun m!1240007 () Bool)

(assert (=> b!1353985 m!1240007))

(assert (=> b!1353985 m!1240001))

(assert (=> b!1353985 m!1240003))

(declare-fun m!1240009 () Bool)

(assert (=> b!1353985 m!1240009))

(declare-fun m!1240011 () Bool)

(assert (=> b!1353982 m!1240011))

(declare-fun m!1240013 () Bool)

(assert (=> b!1353983 m!1240013))

(declare-fun m!1240015 () Bool)

(assert (=> b!1353981 m!1240015))

(declare-fun m!1240017 () Bool)

(assert (=> b!1353973 m!1240017))

(declare-fun m!1240019 () Bool)

(assert (=> start!114062 m!1240019))

(declare-fun m!1240021 () Bool)

(assert (=> b!1353980 m!1240021))

(assert (=> b!1353986 m!1240001))

(assert (=> b!1353986 m!1240001))

(assert (=> b!1353986 m!1240003))

(declare-fun m!1240023 () Bool)

(assert (=> b!1353976 m!1240023))

(declare-fun m!1240025 () Bool)

(assert (=> b!1353984 m!1240025))

(declare-fun m!1240027 () Bool)

(assert (=> b!1353978 m!1240027))

(assert (=> b!1353977 m!1240001))

(assert (=> b!1353977 m!1240001))

(declare-fun m!1240029 () Bool)

(assert (=> b!1353977 m!1240029))

(declare-fun m!1240031 () Bool)

(assert (=> b!1353974 m!1240031))

(check-sat (not b!1353974) (not start!114062) (not b!1353973) (not b!1353983) (not b!1353980) (not b!1353985) (not b!1353984) (not b!1353978) (not b!1353976) (not b!1353982) (not b!1353987) (not b!1353981) (not b!1353986) (not b!1353977))
(check-sat)
