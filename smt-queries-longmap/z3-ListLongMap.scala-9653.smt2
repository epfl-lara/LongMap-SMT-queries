; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114280 () Bool)

(assert start!114280)

(declare-fun b!1355197 () Bool)

(declare-fun res!899553 () Bool)

(declare-fun e!770110 () Bool)

(assert (=> b!1355197 (=> (not res!899553) (not e!770110))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355197 (= res!899553 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355198 () Bool)

(declare-fun res!899558 () Bool)

(assert (=> b!1355198 (=> (not res!899558) (not e!770110))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92353 0))(
  ( (array!92354 (arr!44620 (Array (_ BitVec 32) (_ BitVec 64))) (size!45171 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92353)

(assert (=> b!1355198 (= res!899558 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45171 a!3742))))))

(declare-fun b!1355199 () Bool)

(declare-fun res!899555 () Bool)

(assert (=> b!1355199 (=> (not res!899555) (not e!770110))))

(declare-datatypes ((List!31648 0))(
  ( (Nil!31645) (Cons!31644 (h!32862 (_ BitVec 64)) (t!46298 List!31648)) )
))
(declare-fun acc!759 () List!31648)

(declare-fun contains!9360 (List!31648 (_ BitVec 64)) Bool)

(assert (=> b!1355199 (= res!899555 (not (contains!9360 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355200 () Bool)

(declare-fun res!899552 () Bool)

(assert (=> b!1355200 (=> (not res!899552) (not e!770110))))

(declare-fun arrayNoDuplicates!0 (array!92353 (_ BitVec 32) List!31648) Bool)

(assert (=> b!1355200 (= res!899552 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31645))))

(declare-fun b!1355201 () Bool)

(declare-fun res!899546 () Bool)

(declare-fun e!770111 () Bool)

(assert (=> b!1355201 (=> (not res!899546) (not e!770111))))

(declare-fun lt!598530 () List!31648)

(assert (=> b!1355201 (= res!899546 (not (contains!9360 lt!598530 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355202 () Bool)

(declare-fun e!770109 () Bool)

(assert (=> b!1355202 (= e!770110 e!770109)))

(declare-fun res!899547 () Bool)

(assert (=> b!1355202 (=> (not res!899547) (not e!770109))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!598529 () Bool)

(assert (=> b!1355202 (= res!899547 (and (not (= from!3120 i!1404)) lt!598529))))

(declare-datatypes ((Unit!44381 0))(
  ( (Unit!44382) )
))
(declare-fun lt!598527 () Unit!44381)

(declare-fun e!770112 () Unit!44381)

(assert (=> b!1355202 (= lt!598527 e!770112)))

(declare-fun c!127273 () Bool)

(assert (=> b!1355202 (= c!127273 lt!598529)))

(assert (=> b!1355202 (= lt!598529 (validKeyInArray!0 (select (arr!44620 a!3742) from!3120)))))

(declare-fun b!1355203 () Bool)

(declare-fun res!899551 () Bool)

(assert (=> b!1355203 (=> (not res!899551) (not e!770111))))

(declare-fun noDuplicate!2191 (List!31648) Bool)

(assert (=> b!1355203 (= res!899551 (noDuplicate!2191 lt!598530))))

(declare-fun b!1355204 () Bool)

(declare-fun res!899548 () Bool)

(assert (=> b!1355204 (=> (not res!899548) (not e!770111))))

(assert (=> b!1355204 (= res!899548 (not (contains!9360 lt!598530 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355205 () Bool)

(declare-fun Unit!44383 () Unit!44381)

(assert (=> b!1355205 (= e!770112 Unit!44383)))

(declare-fun b!1355206 () Bool)

(assert (=> b!1355206 (= e!770109 e!770111)))

(declare-fun res!899549 () Bool)

(assert (=> b!1355206 (=> (not res!899549) (not e!770111))))

(assert (=> b!1355206 (= res!899549 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!751 (List!31648 (_ BitVec 64)) List!31648)

(assert (=> b!1355206 (= lt!598530 ($colon$colon!751 acc!759 (select (arr!44620 a!3742) from!3120)))))

(declare-fun res!899559 () Bool)

(assert (=> start!114280 (=> (not res!899559) (not e!770110))))

(assert (=> start!114280 (= res!899559 (and (bvslt (size!45171 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45171 a!3742))))))

(assert (=> start!114280 e!770110))

(assert (=> start!114280 true))

(declare-fun array_inv!33901 (array!92353) Bool)

(assert (=> start!114280 (array_inv!33901 a!3742)))

(declare-fun b!1355207 () Bool)

(declare-fun res!899557 () Bool)

(assert (=> b!1355207 (=> (not res!899557) (not e!770110))))

(assert (=> b!1355207 (= res!899557 (not (contains!9360 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355208 () Bool)

(declare-fun lt!598525 () Unit!44381)

(assert (=> b!1355208 (= e!770112 lt!598525)))

(declare-fun lt!598526 () Unit!44381)

(declare-fun lemmaListSubSeqRefl!0 (List!31648) Unit!44381)

(assert (=> b!1355208 (= lt!598526 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!737 (List!31648 List!31648) Bool)

(assert (=> b!1355208 (subseq!737 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92353 List!31648 List!31648 (_ BitVec 32)) Unit!44381)

(assert (=> b!1355208 (= lt!598525 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!751 acc!759 (select (arr!44620 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355208 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355209 () Bool)

(declare-fun res!899550 () Bool)

(assert (=> b!1355209 (=> (not res!899550) (not e!770110))))

(assert (=> b!1355209 (= res!899550 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45171 a!3742)))))

(declare-fun b!1355210 () Bool)

(declare-fun res!899554 () Bool)

(assert (=> b!1355210 (=> (not res!899554) (not e!770110))))

(assert (=> b!1355210 (= res!899554 (noDuplicate!2191 acc!759))))

(declare-fun b!1355211 () Bool)

(assert (=> b!1355211 (= e!770111 false)))

(declare-fun lt!598528 () Bool)

(assert (=> b!1355211 (= lt!598528 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598530))))

(declare-fun b!1355212 () Bool)

(declare-fun res!899556 () Bool)

(assert (=> b!1355212 (=> (not res!899556) (not e!770110))))

(assert (=> b!1355212 (= res!899556 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114280 res!899559) b!1355210))

(assert (= (and b!1355210 res!899554) b!1355207))

(assert (= (and b!1355207 res!899557) b!1355199))

(assert (= (and b!1355199 res!899555) b!1355200))

(assert (= (and b!1355200 res!899552) b!1355212))

(assert (= (and b!1355212 res!899556) b!1355198))

(assert (= (and b!1355198 res!899558) b!1355197))

(assert (= (and b!1355197 res!899553) b!1355209))

(assert (= (and b!1355209 res!899550) b!1355202))

(assert (= (and b!1355202 c!127273) b!1355208))

(assert (= (and b!1355202 (not c!127273)) b!1355205))

(assert (= (and b!1355202 res!899547) b!1355206))

(assert (= (and b!1355206 res!899549) b!1355203))

(assert (= (and b!1355203 res!899551) b!1355204))

(assert (= (and b!1355204 res!899548) b!1355201))

(assert (= (and b!1355201 res!899546) b!1355211))

(declare-fun m!1242001 () Bool)

(assert (=> b!1355212 m!1242001))

(declare-fun m!1242003 () Bool)

(assert (=> b!1355208 m!1242003))

(declare-fun m!1242005 () Bool)

(assert (=> b!1355208 m!1242005))

(declare-fun m!1242007 () Bool)

(assert (=> b!1355208 m!1242007))

(declare-fun m!1242009 () Bool)

(assert (=> b!1355208 m!1242009))

(declare-fun m!1242011 () Bool)

(assert (=> b!1355208 m!1242011))

(assert (=> b!1355208 m!1242005))

(assert (=> b!1355208 m!1242007))

(declare-fun m!1242013 () Bool)

(assert (=> b!1355208 m!1242013))

(assert (=> b!1355206 m!1242005))

(assert (=> b!1355206 m!1242005))

(assert (=> b!1355206 m!1242007))

(declare-fun m!1242015 () Bool)

(assert (=> b!1355201 m!1242015))

(declare-fun m!1242017 () Bool)

(assert (=> b!1355200 m!1242017))

(declare-fun m!1242019 () Bool)

(assert (=> b!1355211 m!1242019))

(declare-fun m!1242021 () Bool)

(assert (=> b!1355210 m!1242021))

(assert (=> b!1355202 m!1242005))

(assert (=> b!1355202 m!1242005))

(declare-fun m!1242023 () Bool)

(assert (=> b!1355202 m!1242023))

(declare-fun m!1242025 () Bool)

(assert (=> b!1355204 m!1242025))

(declare-fun m!1242027 () Bool)

(assert (=> start!114280 m!1242027))

(declare-fun m!1242029 () Bool)

(assert (=> b!1355203 m!1242029))

(declare-fun m!1242031 () Bool)

(assert (=> b!1355197 m!1242031))

(declare-fun m!1242033 () Bool)

(assert (=> b!1355207 m!1242033))

(declare-fun m!1242035 () Bool)

(assert (=> b!1355199 m!1242035))

(check-sat (not b!1355203) (not b!1355207) (not b!1355201) (not b!1355211) (not b!1355197) (not b!1355204) (not b!1355208) (not b!1355202) (not b!1355212) (not b!1355206) (not start!114280) (not b!1355210) (not b!1355200) (not b!1355199))
(check-sat)
