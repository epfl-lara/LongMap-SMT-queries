; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124278 () Bool)

(assert start!124278)

(declare-fun res!969959 () Bool)

(declare-fun e!811481 () Bool)

(assert (=> start!124278 (=> (not res!969959) (not e!811481))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124278 (= res!969959 (validMask!0 mask!2687))))

(assert (=> start!124278 e!811481))

(assert (=> start!124278 true))

(declare-datatypes ((array!97810 0))(
  ( (array!97811 (arr!47197 (Array (_ BitVec 32) (_ BitVec 64))) (size!47748 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97810)

(declare-fun array_inv!36478 (array!97810) Bool)

(assert (=> start!124278 (array_inv!36478 a!2862)))

(declare-fun b!1437862 () Bool)

(declare-fun res!969956 () Bool)

(assert (=> b!1437862 (=> (not res!969956) (not e!811481))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437862 (= res!969956 (validKeyInArray!0 (select (arr!47197 a!2862) j!93)))))

(declare-fun b!1437863 () Bool)

(declare-fun res!969958 () Bool)

(assert (=> b!1437863 (=> (not res!969958) (not e!811481))))

(declare-datatypes ((List!33685 0))(
  ( (Nil!33682) (Cons!33681 (h!35027 (_ BitVec 64)) (t!48371 List!33685)) )
))
(declare-fun arrayNoDuplicates!0 (array!97810 (_ BitVec 32) List!33685) Bool)

(assert (=> b!1437863 (= res!969958 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33682))))

(declare-fun b!1437864 () Bool)

(declare-fun lt!632620 () (_ BitVec 32))

(assert (=> b!1437864 (= e!811481 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632620 #b00000000000000000000000000000000) (bvsge lt!632620 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437864 (= lt!632620 (toIndex!0 (select (arr!47197 a!2862) j!93) mask!2687))))

(declare-fun b!1437865 () Bool)

(declare-fun res!969954 () Bool)

(assert (=> b!1437865 (=> (not res!969954) (not e!811481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97810 (_ BitVec 32)) Bool)

(assert (=> b!1437865 (= res!969954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437866 () Bool)

(declare-fun res!969957 () Bool)

(assert (=> b!1437866 (=> (not res!969957) (not e!811481))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437866 (= res!969957 (validKeyInArray!0 (select (arr!47197 a!2862) i!1006)))))

(declare-fun b!1437867 () Bool)

(declare-fun res!969955 () Bool)

(assert (=> b!1437867 (=> (not res!969955) (not e!811481))))

(assert (=> b!1437867 (= res!969955 (and (= (size!47748 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47748 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47748 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437868 () Bool)

(declare-fun res!969953 () Bool)

(assert (=> b!1437868 (=> (not res!969953) (not e!811481))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437868 (= res!969953 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47748 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47748 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47748 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124278 res!969959) b!1437867))

(assert (= (and b!1437867 res!969955) b!1437866))

(assert (= (and b!1437866 res!969957) b!1437862))

(assert (= (and b!1437862 res!969956) b!1437865))

(assert (= (and b!1437865 res!969954) b!1437863))

(assert (= (and b!1437863 res!969958) b!1437868))

(assert (= (and b!1437868 res!969953) b!1437864))

(declare-fun m!1327291 () Bool)

(assert (=> b!1437866 m!1327291))

(assert (=> b!1437866 m!1327291))

(declare-fun m!1327293 () Bool)

(assert (=> b!1437866 m!1327293))

(declare-fun m!1327295 () Bool)

(assert (=> b!1437863 m!1327295))

(declare-fun m!1327297 () Bool)

(assert (=> b!1437868 m!1327297))

(declare-fun m!1327299 () Bool)

(assert (=> b!1437868 m!1327299))

(declare-fun m!1327301 () Bool)

(assert (=> b!1437864 m!1327301))

(assert (=> b!1437864 m!1327301))

(declare-fun m!1327303 () Bool)

(assert (=> b!1437864 m!1327303))

(declare-fun m!1327305 () Bool)

(assert (=> b!1437865 m!1327305))

(declare-fun m!1327307 () Bool)

(assert (=> start!124278 m!1327307))

(declare-fun m!1327309 () Bool)

(assert (=> start!124278 m!1327309))

(assert (=> b!1437862 m!1327301))

(assert (=> b!1437862 m!1327301))

(declare-fun m!1327311 () Bool)

(assert (=> b!1437862 m!1327311))

(check-sat (not b!1437865) (not b!1437862) (not b!1437866) (not b!1437863) (not start!124278) (not b!1437864))
(check-sat)
(get-model)

(declare-fun d!154957 () Bool)

(declare-fun lt!632632 () (_ BitVec 32))

(declare-fun lt!632631 () (_ BitVec 32))

(assert (=> d!154957 (= lt!632632 (bvmul (bvxor lt!632631 (bvlshr lt!632631 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154957 (= lt!632631 ((_ extract 31 0) (bvand (bvxor (select (arr!47197 a!2862) j!93) (bvlshr (select (arr!47197 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154957 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970002 (let ((h!35030 ((_ extract 31 0) (bvand (bvxor (select (arr!47197 a!2862) j!93) (bvlshr (select (arr!47197 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129695 (bvmul (bvxor h!35030 (bvlshr h!35030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129695 (bvlshr x!129695 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970002 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970002 #b00000000000000000000000000000000))))))

(assert (=> d!154957 (= (toIndex!0 (select (arr!47197 a!2862) j!93) mask!2687) (bvand (bvxor lt!632632 (bvlshr lt!632632 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437864 d!154957))

(declare-fun b!1437922 () Bool)

(declare-fun e!811503 () Bool)

(declare-fun e!811504 () Bool)

(assert (=> b!1437922 (= e!811503 e!811504)))

(declare-fun res!970009 () Bool)

(assert (=> b!1437922 (=> (not res!970009) (not e!811504))))

(declare-fun e!811505 () Bool)

(assert (=> b!1437922 (= res!970009 (not e!811505))))

(declare-fun res!970010 () Bool)

(assert (=> b!1437922 (=> (not res!970010) (not e!811505))))

(assert (=> b!1437922 (= res!970010 (validKeyInArray!0 (select (arr!47197 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67677 () Bool)

(declare-fun call!67680 () Bool)

(declare-fun c!133468 () Bool)

(assert (=> bm!67677 (= call!67680 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133468 (Cons!33681 (select (arr!47197 a!2862) #b00000000000000000000000000000000) Nil!33682) Nil!33682)))))

(declare-fun b!1437923 () Bool)

(declare-fun e!811506 () Bool)

(assert (=> b!1437923 (= e!811506 call!67680)))

(declare-fun d!154959 () Bool)

(declare-fun res!970011 () Bool)

(assert (=> d!154959 (=> res!970011 e!811503)))

(assert (=> d!154959 (= res!970011 (bvsge #b00000000000000000000000000000000 (size!47748 a!2862)))))

(assert (=> d!154959 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33682) e!811503)))

(declare-fun b!1437921 () Bool)

(assert (=> b!1437921 (= e!811504 e!811506)))

(assert (=> b!1437921 (= c!133468 (validKeyInArray!0 (select (arr!47197 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437924 () Bool)

(assert (=> b!1437924 (= e!811506 call!67680)))

(declare-fun b!1437925 () Bool)

(declare-fun contains!9929 (List!33685 (_ BitVec 64)) Bool)

(assert (=> b!1437925 (= e!811505 (contains!9929 Nil!33682 (select (arr!47197 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154959 (not res!970011)) b!1437922))

(assert (= (and b!1437922 res!970010) b!1437925))

(assert (= (and b!1437922 res!970009) b!1437921))

(assert (= (and b!1437921 c!133468) b!1437923))

(assert (= (and b!1437921 (not c!133468)) b!1437924))

(assert (= (or b!1437923 b!1437924) bm!67677))

(declare-fun m!1327357 () Bool)

(assert (=> b!1437922 m!1327357))

(assert (=> b!1437922 m!1327357))

(declare-fun m!1327359 () Bool)

(assert (=> b!1437922 m!1327359))

(assert (=> bm!67677 m!1327357))

(declare-fun m!1327361 () Bool)

(assert (=> bm!67677 m!1327361))

(assert (=> b!1437921 m!1327357))

(assert (=> b!1437921 m!1327357))

(assert (=> b!1437921 m!1327359))

(assert (=> b!1437925 m!1327357))

(assert (=> b!1437925 m!1327357))

(declare-fun m!1327363 () Bool)

(assert (=> b!1437925 m!1327363))

(assert (=> b!1437863 d!154959))

(declare-fun d!154961 () Bool)

(assert (=> d!154961 (= (validKeyInArray!0 (select (arr!47197 a!2862) j!93)) (and (not (= (select (arr!47197 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47197 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437862 d!154961))

(declare-fun d!154963 () Bool)

(assert (=> d!154963 (= (validKeyInArray!0 (select (arr!47197 a!2862) i!1006)) (and (not (= (select (arr!47197 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47197 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437866 d!154963))

(declare-fun d!154965 () Bool)

(declare-fun res!970016 () Bool)

(declare-fun e!811515 () Bool)

(assert (=> d!154965 (=> res!970016 e!811515)))

(assert (=> d!154965 (= res!970016 (bvsge #b00000000000000000000000000000000 (size!47748 a!2862)))))

(assert (=> d!154965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811515)))

(declare-fun b!1437934 () Bool)

(declare-fun e!811513 () Bool)

(assert (=> b!1437934 (= e!811515 e!811513)))

(declare-fun c!133471 () Bool)

(assert (=> b!1437934 (= c!133471 (validKeyInArray!0 (select (arr!47197 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437935 () Bool)

(declare-fun e!811514 () Bool)

(declare-fun call!67683 () Bool)

(assert (=> b!1437935 (= e!811514 call!67683)))

(declare-fun b!1437936 () Bool)

(assert (=> b!1437936 (= e!811513 e!811514)))

(declare-fun lt!632640 () (_ BitVec 64))

(assert (=> b!1437936 (= lt!632640 (select (arr!47197 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48485 0))(
  ( (Unit!48486) )
))
(declare-fun lt!632641 () Unit!48485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97810 (_ BitVec 64) (_ BitVec 32)) Unit!48485)

(assert (=> b!1437936 (= lt!632641 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632640 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437936 (arrayContainsKey!0 a!2862 lt!632640 #b00000000000000000000000000000000)))

(declare-fun lt!632639 () Unit!48485)

(assert (=> b!1437936 (= lt!632639 lt!632641)))

(declare-fun res!970017 () Bool)

(declare-datatypes ((SeekEntryResult!11353 0))(
  ( (MissingZero!11353 (index!47804 (_ BitVec 32))) (Found!11353 (index!47805 (_ BitVec 32))) (Intermediate!11353 (undefined!12165 Bool) (index!47806 (_ BitVec 32)) (x!129697 (_ BitVec 32))) (Undefined!11353) (MissingVacant!11353 (index!47807 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97810 (_ BitVec 32)) SeekEntryResult!11353)

(assert (=> b!1437936 (= res!970017 (= (seekEntryOrOpen!0 (select (arr!47197 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11353 #b00000000000000000000000000000000)))))

(assert (=> b!1437936 (=> (not res!970017) (not e!811514))))

(declare-fun b!1437937 () Bool)

(assert (=> b!1437937 (= e!811513 call!67683)))

(declare-fun bm!67680 () Bool)

(assert (=> bm!67680 (= call!67683 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!154965 (not res!970016)) b!1437934))

(assert (= (and b!1437934 c!133471) b!1437936))

(assert (= (and b!1437934 (not c!133471)) b!1437937))

(assert (= (and b!1437936 res!970017) b!1437935))

(assert (= (or b!1437935 b!1437937) bm!67680))

(assert (=> b!1437934 m!1327357))

(assert (=> b!1437934 m!1327357))

(assert (=> b!1437934 m!1327359))

(assert (=> b!1437936 m!1327357))

(declare-fun m!1327365 () Bool)

(assert (=> b!1437936 m!1327365))

(declare-fun m!1327367 () Bool)

(assert (=> b!1437936 m!1327367))

(assert (=> b!1437936 m!1327357))

(declare-fun m!1327369 () Bool)

(assert (=> b!1437936 m!1327369))

(declare-fun m!1327371 () Bool)

(assert (=> bm!67680 m!1327371))

(assert (=> b!1437865 d!154965))

(declare-fun d!154969 () Bool)

(assert (=> d!154969 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124278 d!154969))

(declare-fun d!154975 () Bool)

(assert (=> d!154975 (= (array_inv!36478 a!2862) (bvsge (size!47748 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124278 d!154975))

(check-sat (not b!1437921) (not bm!67680) (not b!1437925) (not b!1437922) (not b!1437936) (not bm!67677) (not b!1437934))
(check-sat)
