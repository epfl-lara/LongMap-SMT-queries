; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114160 () Bool)

(assert start!114160)

(declare-fun b!1356091 () Bool)

(declare-datatypes ((Unit!44598 0))(
  ( (Unit!44599) )
))
(declare-fun e!769963 () Unit!44598)

(declare-fun lt!598903 () Unit!44598)

(assert (=> b!1356091 (= e!769963 lt!598903)))

(declare-fun lt!598899 () Unit!44598)

(declare-datatypes ((List!31660 0))(
  ( (Nil!31657) (Cons!31656 (h!32865 (_ BitVec 64)) (t!46318 List!31660)) )
))
(declare-fun acc!759 () List!31660)

(declare-fun lemmaListSubSeqRefl!0 (List!31660) Unit!44598)

(assert (=> b!1356091 (= lt!598899 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!789 (List!31660 List!31660) Bool)

(assert (=> b!1356091 (subseq!789 acc!759 acc!759)))

(declare-datatypes ((array!92342 0))(
  ( (array!92343 (arr!44619 (Array (_ BitVec 32) (_ BitVec 64))) (size!45169 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92342)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92342 List!31660 List!31660 (_ BitVec 32)) Unit!44598)

(declare-fun $colon$colon!804 (List!31660 (_ BitVec 64)) List!31660)

(assert (=> b!1356091 (= lt!598903 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!804 acc!759 (select (arr!44619 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92342 (_ BitVec 32) List!31660) Bool)

(assert (=> b!1356091 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356092 () Bool)

(declare-fun res!900914 () Bool)

(declare-fun e!769960 () Bool)

(assert (=> b!1356092 (=> (not res!900914) (not e!769960))))

(assert (=> b!1356092 (= res!900914 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356093 () Bool)

(declare-fun e!769961 () Bool)

(assert (=> b!1356093 (= e!769961 (not (bvsle from!3120 (size!45169 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356093 (arrayNoDuplicates!0 (array!92343 (store (arr!44619 a!3742) i!1404 l!3587) (size!45169 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598901 () Unit!44598)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92342 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31660) Unit!44598)

(assert (=> b!1356093 (= lt!598901 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356094 () Bool)

(declare-fun res!900919 () Bool)

(assert (=> b!1356094 (=> (not res!900919) (not e!769960))))

(assert (=> b!1356094 (= res!900919 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31657))))

(declare-fun b!1356095 () Bool)

(declare-fun res!900911 () Bool)

(assert (=> b!1356095 (=> (not res!900911) (not e!769960))))

(declare-fun contains!9369 (List!31660 (_ BitVec 64)) Bool)

(assert (=> b!1356095 (= res!900911 (not (contains!9369 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356096 () Bool)

(declare-fun res!900909 () Bool)

(assert (=> b!1356096 (=> (not res!900909) (not e!769960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356096 (= res!900909 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!900910 () Bool)

(assert (=> start!114160 (=> (not res!900910) (not e!769960))))

(assert (=> start!114160 (= res!900910 (and (bvslt (size!45169 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45169 a!3742))))))

(assert (=> start!114160 e!769960))

(assert (=> start!114160 true))

(declare-fun array_inv!33647 (array!92342) Bool)

(assert (=> start!114160 (array_inv!33647 a!3742)))

(declare-fun b!1356097 () Bool)

(declare-fun res!900916 () Bool)

(assert (=> b!1356097 (=> (not res!900916) (not e!769960))))

(assert (=> b!1356097 (= res!900916 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45169 a!3742))))))

(declare-fun b!1356098 () Bool)

(declare-fun res!900915 () Bool)

(assert (=> b!1356098 (=> (not res!900915) (not e!769960))))

(assert (=> b!1356098 (= res!900915 (not (contains!9369 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356099 () Bool)

(declare-fun Unit!44600 () Unit!44598)

(assert (=> b!1356099 (= e!769963 Unit!44600)))

(declare-fun b!1356100 () Bool)

(declare-fun res!900918 () Bool)

(assert (=> b!1356100 (=> (not res!900918) (not e!769960))))

(assert (=> b!1356100 (= res!900918 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45169 a!3742)))))

(declare-fun b!1356101 () Bool)

(assert (=> b!1356101 (= e!769960 e!769961)))

(declare-fun res!900917 () Bool)

(assert (=> b!1356101 (=> (not res!900917) (not e!769961))))

(declare-fun lt!598900 () Bool)

(assert (=> b!1356101 (= res!900917 (and (not (= from!3120 i!1404)) (not lt!598900) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598902 () Unit!44598)

(assert (=> b!1356101 (= lt!598902 e!769963)))

(declare-fun c!127031 () Bool)

(assert (=> b!1356101 (= c!127031 lt!598900)))

(assert (=> b!1356101 (= lt!598900 (validKeyInArray!0 (select (arr!44619 a!3742) from!3120)))))

(declare-fun b!1356102 () Bool)

(declare-fun res!900912 () Bool)

(assert (=> b!1356102 (=> (not res!900912) (not e!769960))))

(declare-fun noDuplicate!2226 (List!31660) Bool)

(assert (=> b!1356102 (= res!900912 (noDuplicate!2226 acc!759))))

(declare-fun b!1356103 () Bool)

(declare-fun res!900913 () Bool)

(assert (=> b!1356103 (=> (not res!900913) (not e!769961))))

(assert (=> b!1356103 (= res!900913 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114160 res!900910) b!1356102))

(assert (= (and b!1356102 res!900912) b!1356095))

(assert (= (and b!1356095 res!900911) b!1356098))

(assert (= (and b!1356098 res!900915) b!1356094))

(assert (= (and b!1356094 res!900919) b!1356092))

(assert (= (and b!1356092 res!900914) b!1356097))

(assert (= (and b!1356097 res!900916) b!1356096))

(assert (= (and b!1356096 res!900909) b!1356100))

(assert (= (and b!1356100 res!900918) b!1356101))

(assert (= (and b!1356101 c!127031) b!1356091))

(assert (= (and b!1356101 (not c!127031)) b!1356099))

(assert (= (and b!1356101 res!900917) b!1356103))

(assert (= (and b!1356103 res!900913) b!1356093))

(declare-fun m!1242131 () Bool)

(assert (=> b!1356091 m!1242131))

(declare-fun m!1242133 () Bool)

(assert (=> b!1356091 m!1242133))

(declare-fun m!1242135 () Bool)

(assert (=> b!1356091 m!1242135))

(declare-fun m!1242137 () Bool)

(assert (=> b!1356091 m!1242137))

(declare-fun m!1242139 () Bool)

(assert (=> b!1356091 m!1242139))

(assert (=> b!1356091 m!1242133))

(assert (=> b!1356091 m!1242135))

(declare-fun m!1242141 () Bool)

(assert (=> b!1356091 m!1242141))

(declare-fun m!1242143 () Bool)

(assert (=> b!1356093 m!1242143))

(declare-fun m!1242145 () Bool)

(assert (=> b!1356093 m!1242145))

(declare-fun m!1242147 () Bool)

(assert (=> b!1356093 m!1242147))

(declare-fun m!1242149 () Bool)

(assert (=> b!1356098 m!1242149))

(declare-fun m!1242151 () Bool)

(assert (=> b!1356095 m!1242151))

(declare-fun m!1242153 () Bool)

(assert (=> b!1356102 m!1242153))

(declare-fun m!1242155 () Bool)

(assert (=> b!1356096 m!1242155))

(declare-fun m!1242157 () Bool)

(assert (=> start!114160 m!1242157))

(declare-fun m!1242159 () Bool)

(assert (=> b!1356094 m!1242159))

(assert (=> b!1356101 m!1242133))

(assert (=> b!1356101 m!1242133))

(declare-fun m!1242161 () Bool)

(assert (=> b!1356101 m!1242161))

(assert (=> b!1356103 m!1242139))

(declare-fun m!1242163 () Bool)

(assert (=> b!1356092 m!1242163))

(check-sat (not b!1356092) (not start!114160) (not b!1356101) (not b!1356103) (not b!1356096) (not b!1356091) (not b!1356095) (not b!1356094) (not b!1356102) (not b!1356098) (not b!1356093))
(check-sat)
