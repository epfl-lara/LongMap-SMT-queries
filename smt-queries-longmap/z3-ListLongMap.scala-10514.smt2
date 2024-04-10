; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123926 () Bool)

(assert start!123926)

(declare-fun b!1435915 () Bool)

(declare-fun res!968907 () Bool)

(declare-fun e!810338 () Bool)

(assert (=> b!1435915 (=> (not res!968907) (not e!810338))))

(declare-datatypes ((array!97649 0))(
  ( (array!97650 (arr!47124 (Array (_ BitVec 32) (_ BitVec 64))) (size!47674 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97649)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435915 (= res!968907 (validKeyInArray!0 (select (arr!47124 a!2862) j!93)))))

(declare-fun b!1435916 () Bool)

(declare-fun res!968904 () Bool)

(assert (=> b!1435916 (=> (not res!968904) (not e!810338))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435916 (= res!968904 (validKeyInArray!0 (select (arr!47124 a!2862) i!1006)))))

(declare-fun b!1435917 () Bool)

(declare-fun res!968905 () Bool)

(assert (=> b!1435917 (=> (not res!968905) (not e!810338))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1435917 (= res!968905 (and (= (size!47674 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47674 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47674 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435919 () Bool)

(declare-fun res!968903 () Bool)

(assert (=> b!1435919 (=> (not res!968903) (not e!810338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97649 (_ BitVec 32)) Bool)

(assert (=> b!1435919 (= res!968903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435920 () Bool)

(declare-datatypes ((List!33625 0))(
  ( (Nil!33622) (Cons!33621 (h!34956 (_ BitVec 64)) (t!48319 List!33625)) )
))
(declare-fun noDuplicate!2613 (List!33625) Bool)

(assert (=> b!1435920 (= e!810338 (not (noDuplicate!2613 Nil!33622)))))

(declare-fun res!968906 () Bool)

(assert (=> start!123926 (=> (not res!968906) (not e!810338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123926 (= res!968906 (validMask!0 mask!2687))))

(assert (=> start!123926 e!810338))

(assert (=> start!123926 true))

(declare-fun array_inv!36152 (array!97649) Bool)

(assert (=> start!123926 (array_inv!36152 a!2862)))

(declare-fun b!1435918 () Bool)

(declare-fun res!968908 () Bool)

(assert (=> b!1435918 (=> (not res!968908) (not e!810338))))

(assert (=> b!1435918 (= res!968908 (and (bvsle #b00000000000000000000000000000000 (size!47674 a!2862)) (bvslt (size!47674 a!2862) #b01111111111111111111111111111111)))))

(assert (= (and start!123926 res!968906) b!1435917))

(assert (= (and b!1435917 res!968905) b!1435916))

(assert (= (and b!1435916 res!968904) b!1435915))

(assert (= (and b!1435915 res!968907) b!1435919))

(assert (= (and b!1435919 res!968903) b!1435918))

(assert (= (and b!1435918 res!968908) b!1435920))

(declare-fun m!1325275 () Bool)

(assert (=> b!1435916 m!1325275))

(assert (=> b!1435916 m!1325275))

(declare-fun m!1325277 () Bool)

(assert (=> b!1435916 m!1325277))

(declare-fun m!1325279 () Bool)

(assert (=> b!1435919 m!1325279))

(declare-fun m!1325281 () Bool)

(assert (=> b!1435915 m!1325281))

(assert (=> b!1435915 m!1325281))

(declare-fun m!1325283 () Bool)

(assert (=> b!1435915 m!1325283))

(declare-fun m!1325285 () Bool)

(assert (=> start!123926 m!1325285))

(declare-fun m!1325287 () Bool)

(assert (=> start!123926 m!1325287))

(declare-fun m!1325289 () Bool)

(assert (=> b!1435920 m!1325289))

(check-sat (not b!1435915) (not b!1435919) (not b!1435916) (not b!1435920) (not start!123926))
(check-sat)
(get-model)

(declare-fun b!1435953 () Bool)

(declare-fun e!810358 () Bool)

(declare-fun call!67573 () Bool)

(assert (=> b!1435953 (= e!810358 call!67573)))

(declare-fun b!1435955 () Bool)

(declare-fun e!810357 () Bool)

(assert (=> b!1435955 (= e!810357 e!810358)))

(declare-fun c!133011 () Bool)

(assert (=> b!1435955 (= c!133011 (validKeyInArray!0 (select (arr!47124 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1435956 () Bool)

(declare-fun e!810359 () Bool)

(assert (=> b!1435956 (= e!810358 e!810359)))

(declare-fun lt!632026 () (_ BitVec 64))

(assert (=> b!1435956 (= lt!632026 (select (arr!47124 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48538 0))(
  ( (Unit!48539) )
))
(declare-fun lt!632028 () Unit!48538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97649 (_ BitVec 64) (_ BitVec 32)) Unit!48538)

(assert (=> b!1435956 (= lt!632028 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632026 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435956 (arrayContainsKey!0 a!2862 lt!632026 #b00000000000000000000000000000000)))

(declare-fun lt!632027 () Unit!48538)

(assert (=> b!1435956 (= lt!632027 lt!632028)))

(declare-fun res!968937 () Bool)

(declare-datatypes ((SeekEntryResult!11396 0))(
  ( (MissingZero!11396 (index!47976 (_ BitVec 32))) (Found!11396 (index!47977 (_ BitVec 32))) (Intermediate!11396 (undefined!12208 Bool) (index!47978 (_ BitVec 32)) (x!129658 (_ BitVec 32))) (Undefined!11396) (MissingVacant!11396 (index!47979 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97649 (_ BitVec 32)) SeekEntryResult!11396)

(assert (=> b!1435956 (= res!968937 (= (seekEntryOrOpen!0 (select (arr!47124 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11396 #b00000000000000000000000000000000)))))

(assert (=> b!1435956 (=> (not res!968937) (not e!810359))))

(declare-fun bm!67570 () Bool)

(assert (=> bm!67570 (= call!67573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154445 () Bool)

(declare-fun res!968938 () Bool)

(assert (=> d!154445 (=> res!968938 e!810357)))

(assert (=> d!154445 (= res!968938 (bvsge #b00000000000000000000000000000000 (size!47674 a!2862)))))

(assert (=> d!154445 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810357)))

(declare-fun b!1435954 () Bool)

(assert (=> b!1435954 (= e!810359 call!67573)))

(assert (= (and d!154445 (not res!968938)) b!1435955))

(assert (= (and b!1435955 c!133011) b!1435956))

(assert (= (and b!1435955 (not c!133011)) b!1435953))

(assert (= (and b!1435956 res!968937) b!1435954))

(assert (= (or b!1435954 b!1435953) bm!67570))

(declare-fun m!1325311 () Bool)

(assert (=> b!1435955 m!1325311))

(assert (=> b!1435955 m!1325311))

(declare-fun m!1325313 () Bool)

(assert (=> b!1435955 m!1325313))

(assert (=> b!1435956 m!1325311))

(declare-fun m!1325315 () Bool)

(assert (=> b!1435956 m!1325315))

(declare-fun m!1325317 () Bool)

(assert (=> b!1435956 m!1325317))

(assert (=> b!1435956 m!1325311))

(declare-fun m!1325319 () Bool)

(assert (=> b!1435956 m!1325319))

(declare-fun m!1325321 () Bool)

(assert (=> bm!67570 m!1325321))

(assert (=> b!1435919 d!154445))

(declare-fun d!154455 () Bool)

(declare-fun res!968949 () Bool)

(declare-fun e!810370 () Bool)

(assert (=> d!154455 (=> res!968949 e!810370)))

(get-info :version)

(assert (=> d!154455 (= res!968949 ((_ is Nil!33622) Nil!33622))))

(assert (=> d!154455 (= (noDuplicate!2613 Nil!33622) e!810370)))

(declare-fun b!1435967 () Bool)

(declare-fun e!810371 () Bool)

(assert (=> b!1435967 (= e!810370 e!810371)))

(declare-fun res!968950 () Bool)

(assert (=> b!1435967 (=> (not res!968950) (not e!810371))))

(declare-fun contains!9878 (List!33625 (_ BitVec 64)) Bool)

(assert (=> b!1435967 (= res!968950 (not (contains!9878 (t!48319 Nil!33622) (h!34956 Nil!33622))))))

(declare-fun b!1435968 () Bool)

(assert (=> b!1435968 (= e!810371 (noDuplicate!2613 (t!48319 Nil!33622)))))

(assert (= (and d!154455 (not res!968949)) b!1435967))

(assert (= (and b!1435967 res!968950) b!1435968))

(declare-fun m!1325327 () Bool)

(assert (=> b!1435967 m!1325327))

(declare-fun m!1325329 () Bool)

(assert (=> b!1435968 m!1325329))

(assert (=> b!1435920 d!154455))

(declare-fun d!154459 () Bool)

(assert (=> d!154459 (= (validKeyInArray!0 (select (arr!47124 a!2862) j!93)) (and (not (= (select (arr!47124 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47124 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435915 d!154459))

(declare-fun d!154461 () Bool)

(assert (=> d!154461 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123926 d!154461))

(declare-fun d!154473 () Bool)

(assert (=> d!154473 (= (array_inv!36152 a!2862) (bvsge (size!47674 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123926 d!154473))

(declare-fun d!154475 () Bool)

(assert (=> d!154475 (= (validKeyInArray!0 (select (arr!47124 a!2862) i!1006)) (and (not (= (select (arr!47124 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47124 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435916 d!154475))

(check-sat (not b!1435967) (not bm!67570) (not b!1435955) (not b!1435968) (not b!1435956))
(check-sat)
