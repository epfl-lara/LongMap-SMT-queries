; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123992 () Bool)

(assert start!123992)

(declare-fun b!1436042 () Bool)

(declare-fun res!969102 () Bool)

(declare-fun e!810414 () Bool)

(assert (=> b!1436042 (=> (not res!969102) (not e!810414))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97620 0))(
  ( (array!97621 (arr!47107 (Array (_ BitVec 32) (_ BitVec 64))) (size!47659 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97620)

(assert (=> b!1436042 (= res!969102 (and (= (size!47659 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47659 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47659 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436043 () Bool)

(declare-fun res!969098 () Bool)

(assert (=> b!1436043 (=> (not res!969098) (not e!810414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97620 (_ BitVec 32)) Bool)

(assert (=> b!1436043 (= res!969098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436044 () Bool)

(declare-fun res!969101 () Bool)

(assert (=> b!1436044 (=> (not res!969101) (not e!810414))))

(declare-datatypes ((List!33686 0))(
  ( (Nil!33683) (Cons!33682 (h!35017 (_ BitVec 64)) (t!48372 List!33686)) )
))
(declare-fun arrayNoDuplicates!0 (array!97620 (_ BitVec 32) List!33686) Bool)

(assert (=> b!1436044 (= res!969101 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33683))))

(declare-fun b!1436045 () Bool)

(declare-fun res!969103 () Bool)

(assert (=> b!1436045 (=> (not res!969103) (not e!810414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436045 (= res!969103 (validKeyInArray!0 (select (arr!47107 a!2862) j!93)))))

(declare-fun b!1436046 () Bool)

(declare-fun res!969099 () Bool)

(assert (=> b!1436046 (=> (not res!969099) (not e!810414))))

(assert (=> b!1436046 (= res!969099 (validKeyInArray!0 (select (arr!47107 a!2862) i!1006)))))

(declare-fun res!969100 () Bool)

(assert (=> start!123992 (=> (not res!969100) (not e!810414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123992 (= res!969100 (validMask!0 mask!2687))))

(assert (=> start!123992 e!810414))

(assert (=> start!123992 true))

(declare-fun array_inv!36340 (array!97620) Bool)

(assert (=> start!123992 (array_inv!36340 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1436041 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436041 (= e!810414 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47659 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47659 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47659 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47107 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(assert (= (and start!123992 res!969100) b!1436042))

(assert (= (and b!1436042 res!969102) b!1436046))

(assert (= (and b!1436046 res!969099) b!1436045))

(assert (= (and b!1436045 res!969103) b!1436043))

(assert (= (and b!1436043 res!969098) b!1436044))

(assert (= (and b!1436044 res!969101) b!1436041))

(declare-fun m!1324901 () Bool)

(assert (=> b!1436045 m!1324901))

(assert (=> b!1436045 m!1324901))

(declare-fun m!1324903 () Bool)

(assert (=> b!1436045 m!1324903))

(declare-fun m!1324905 () Bool)

(assert (=> b!1436041 m!1324905))

(declare-fun m!1324907 () Bool)

(assert (=> b!1436041 m!1324907))

(declare-fun m!1324909 () Bool)

(assert (=> b!1436044 m!1324909))

(declare-fun m!1324911 () Bool)

(assert (=> start!123992 m!1324911))

(declare-fun m!1324913 () Bool)

(assert (=> start!123992 m!1324913))

(declare-fun m!1324915 () Bool)

(assert (=> b!1436046 m!1324915))

(assert (=> b!1436046 m!1324915))

(declare-fun m!1324917 () Bool)

(assert (=> b!1436046 m!1324917))

(declare-fun m!1324919 () Bool)

(assert (=> b!1436043 m!1324919))

(check-sat (not b!1436043) (not start!123992) (not b!1436045) (not b!1436044) (not b!1436046))
(check-sat)
(get-model)

(declare-fun b!1436091 () Bool)

(declare-fun e!810433 () Bool)

(declare-fun call!67568 () Bool)

(assert (=> b!1436091 (= e!810433 call!67568)))

(declare-fun bm!67565 () Bool)

(assert (=> bm!67565 (= call!67568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436092 () Bool)

(declare-fun e!810435 () Bool)

(assert (=> b!1436092 (= e!810435 e!810433)))

(declare-fun lt!631868 () (_ BitVec 64))

(assert (=> b!1436092 (= lt!631868 (select (arr!47107 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48389 0))(
  ( (Unit!48390) )
))
(declare-fun lt!631867 () Unit!48389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97620 (_ BitVec 64) (_ BitVec 32)) Unit!48389)

(assert (=> b!1436092 (= lt!631867 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!631868 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436092 (arrayContainsKey!0 a!2862 lt!631868 #b00000000000000000000000000000000)))

(declare-fun lt!631869 () Unit!48389)

(assert (=> b!1436092 (= lt!631869 lt!631867)))

(declare-fun res!969144 () Bool)

(declare-datatypes ((SeekEntryResult!11401 0))(
  ( (MissingZero!11401 (index!47996 (_ BitVec 32))) (Found!11401 (index!47997 (_ BitVec 32))) (Intermediate!11401 (undefined!12213 Bool) (index!47998 (_ BitVec 32)) (x!129682 (_ BitVec 32))) (Undefined!11401) (MissingVacant!11401 (index!47999 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97620 (_ BitVec 32)) SeekEntryResult!11401)

(assert (=> b!1436092 (= res!969144 (= (seekEntryOrOpen!0 (select (arr!47107 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11401 #b00000000000000000000000000000000)))))

(assert (=> b!1436092 (=> (not res!969144) (not e!810433))))

(declare-fun d!154369 () Bool)

(declare-fun res!969145 () Bool)

(declare-fun e!810434 () Bool)

(assert (=> d!154369 (=> res!969145 e!810434)))

(assert (=> d!154369 (= res!969145 (bvsge #b00000000000000000000000000000000 (size!47659 a!2862)))))

(assert (=> d!154369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810434)))

(declare-fun b!1436093 () Bool)

(assert (=> b!1436093 (= e!810434 e!810435)))

(declare-fun c!132979 () Bool)

(assert (=> b!1436093 (= c!132979 (validKeyInArray!0 (select (arr!47107 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436094 () Bool)

(assert (=> b!1436094 (= e!810435 call!67568)))

(assert (= (and d!154369 (not res!969145)) b!1436093))

(assert (= (and b!1436093 c!132979) b!1436092))

(assert (= (and b!1436093 (not c!132979)) b!1436094))

(assert (= (and b!1436092 res!969144) b!1436091))

(assert (= (or b!1436091 b!1436094) bm!67565))

(declare-fun m!1324961 () Bool)

(assert (=> bm!67565 m!1324961))

(declare-fun m!1324963 () Bool)

(assert (=> b!1436092 m!1324963))

(declare-fun m!1324965 () Bool)

(assert (=> b!1436092 m!1324965))

(declare-fun m!1324967 () Bool)

(assert (=> b!1436092 m!1324967))

(assert (=> b!1436092 m!1324963))

(declare-fun m!1324969 () Bool)

(assert (=> b!1436092 m!1324969))

(assert (=> b!1436093 m!1324963))

(assert (=> b!1436093 m!1324963))

(declare-fun m!1324971 () Bool)

(assert (=> b!1436093 m!1324971))

(assert (=> b!1436043 d!154369))

(declare-fun b!1436105 () Bool)

(declare-fun e!810445 () Bool)

(declare-fun call!67571 () Bool)

(assert (=> b!1436105 (= e!810445 call!67571)))

(declare-fun b!1436106 () Bool)

(assert (=> b!1436106 (= e!810445 call!67571)))

(declare-fun d!154371 () Bool)

(declare-fun res!969152 () Bool)

(declare-fun e!810447 () Bool)

(assert (=> d!154371 (=> res!969152 e!810447)))

(assert (=> d!154371 (= res!969152 (bvsge #b00000000000000000000000000000000 (size!47659 a!2862)))))

(assert (=> d!154371 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33683) e!810447)))

(declare-fun bm!67568 () Bool)

(declare-fun c!132982 () Bool)

(assert (=> bm!67568 (= call!67571 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132982 (Cons!33682 (select (arr!47107 a!2862) #b00000000000000000000000000000000) Nil!33683) Nil!33683)))))

(declare-fun b!1436107 () Bool)

(declare-fun e!810444 () Bool)

(assert (=> b!1436107 (= e!810447 e!810444)))

(declare-fun res!969154 () Bool)

(assert (=> b!1436107 (=> (not res!969154) (not e!810444))))

(declare-fun e!810446 () Bool)

(assert (=> b!1436107 (= res!969154 (not e!810446))))

(declare-fun res!969153 () Bool)

(assert (=> b!1436107 (=> (not res!969153) (not e!810446))))

(assert (=> b!1436107 (= res!969153 (validKeyInArray!0 (select (arr!47107 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436108 () Bool)

(declare-fun contains!9844 (List!33686 (_ BitVec 64)) Bool)

(assert (=> b!1436108 (= e!810446 (contains!9844 Nil!33683 (select (arr!47107 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436109 () Bool)

(assert (=> b!1436109 (= e!810444 e!810445)))

(assert (=> b!1436109 (= c!132982 (validKeyInArray!0 (select (arr!47107 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154371 (not res!969152)) b!1436107))

(assert (= (and b!1436107 res!969153) b!1436108))

(assert (= (and b!1436107 res!969154) b!1436109))

(assert (= (and b!1436109 c!132982) b!1436105))

(assert (= (and b!1436109 (not c!132982)) b!1436106))

(assert (= (or b!1436105 b!1436106) bm!67568))

(assert (=> bm!67568 m!1324963))

(declare-fun m!1324973 () Bool)

(assert (=> bm!67568 m!1324973))

(assert (=> b!1436107 m!1324963))

(assert (=> b!1436107 m!1324963))

(assert (=> b!1436107 m!1324971))

(assert (=> b!1436108 m!1324963))

(assert (=> b!1436108 m!1324963))

(declare-fun m!1324975 () Bool)

(assert (=> b!1436108 m!1324975))

(assert (=> b!1436109 m!1324963))

(assert (=> b!1436109 m!1324963))

(assert (=> b!1436109 m!1324971))

(assert (=> b!1436044 d!154371))

(declare-fun d!154373 () Bool)

(assert (=> d!154373 (= (validKeyInArray!0 (select (arr!47107 a!2862) j!93)) (and (not (= (select (arr!47107 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47107 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436045 d!154373))

(declare-fun d!154375 () Bool)

(assert (=> d!154375 (= (validKeyInArray!0 (select (arr!47107 a!2862) i!1006)) (and (not (= (select (arr!47107 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47107 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436046 d!154375))

(declare-fun d!154377 () Bool)

(assert (=> d!154377 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123992 d!154377))

(declare-fun d!154379 () Bool)

(assert (=> d!154379 (= (array_inv!36340 a!2862) (bvsge (size!47659 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123992 d!154379))

(check-sat (not b!1436109) (not bm!67565) (not b!1436108) (not b!1436093) (not b!1436092) (not bm!67568) (not b!1436107))
(check-sat)
