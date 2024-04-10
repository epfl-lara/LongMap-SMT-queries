; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123896 () Bool)

(assert start!123896)

(declare-fun b!1435829 () Bool)

(declare-fun res!968839 () Bool)

(declare-fun e!810292 () Bool)

(assert (=> b!1435829 (=> (not res!968839) (not e!810292))))

(declare-datatypes ((array!97640 0))(
  ( (array!97641 (arr!47121 (Array (_ BitVec 32) (_ BitVec 64))) (size!47671 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97640)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97640 (_ BitVec 32)) Bool)

(assert (=> b!1435829 (= res!968839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435830 () Bool)

(declare-fun res!968836 () Bool)

(assert (=> b!1435830 (=> (not res!968836) (not e!810292))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435830 (= res!968836 (validKeyInArray!0 (select (arr!47121 a!2862) j!93)))))

(declare-fun b!1435831 () Bool)

(declare-fun res!968837 () Bool)

(assert (=> b!1435831 (=> (not res!968837) (not e!810292))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435831 (= res!968837 (and (= (size!47671 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47671 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47671 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435832 () Bool)

(declare-fun res!968838 () Bool)

(assert (=> b!1435832 (=> (not res!968838) (not e!810292))))

(assert (=> b!1435832 (= res!968838 (validKeyInArray!0 (select (arr!47121 a!2862) i!1006)))))

(declare-fun res!968835 () Bool)

(assert (=> start!123896 (=> (not res!968835) (not e!810292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123896 (= res!968835 (validMask!0 mask!2687))))

(assert (=> start!123896 e!810292))

(assert (=> start!123896 true))

(declare-fun array_inv!36149 (array!97640) Bool)

(assert (=> start!123896 (array_inv!36149 a!2862)))

(declare-fun b!1435833 () Bool)

(assert (=> b!1435833 (= e!810292 (and (bvsle #b00000000000000000000000000000000 (size!47671 a!2862)) (bvsge (size!47671 a!2862) #b01111111111111111111111111111111)))))

(assert (= (and start!123896 res!968835) b!1435831))

(assert (= (and b!1435831 res!968837) b!1435832))

(assert (= (and b!1435832 res!968838) b!1435830))

(assert (= (and b!1435830 res!968836) b!1435829))

(assert (= (and b!1435829 res!968839) b!1435833))

(declare-fun m!1325195 () Bool)

(assert (=> b!1435829 m!1325195))

(declare-fun m!1325197 () Bool)

(assert (=> b!1435830 m!1325197))

(assert (=> b!1435830 m!1325197))

(declare-fun m!1325199 () Bool)

(assert (=> b!1435830 m!1325199))

(declare-fun m!1325201 () Bool)

(assert (=> b!1435832 m!1325201))

(assert (=> b!1435832 m!1325201))

(declare-fun m!1325203 () Bool)

(assert (=> b!1435832 m!1325203))

(declare-fun m!1325205 () Bool)

(assert (=> start!123896 m!1325205))

(declare-fun m!1325207 () Bool)

(assert (=> start!123896 m!1325207))

(check-sat (not start!123896) (not b!1435829) (not b!1435830) (not b!1435832))
(check-sat)
(get-model)

(declare-fun d!154413 () Bool)

(assert (=> d!154413 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123896 d!154413))

(declare-fun d!154419 () Bool)

(assert (=> d!154419 (= (array_inv!36149 a!2862) (bvsge (size!47671 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123896 d!154419))

(declare-fun b!1435882 () Bool)

(declare-fun e!810324 () Bool)

(declare-fun call!67570 () Bool)

(assert (=> b!1435882 (= e!810324 call!67570)))

(declare-fun b!1435883 () Bool)

(declare-fun e!810326 () Bool)

(assert (=> b!1435883 (= e!810326 e!810324)))

(declare-fun c!133008 () Bool)

(assert (=> b!1435883 (= c!133008 (validKeyInArray!0 (select (arr!47121 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67567 () Bool)

(assert (=> bm!67567 (= call!67570 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1435884 () Bool)

(declare-fun e!810325 () Bool)

(assert (=> b!1435884 (= e!810325 call!67570)))

(declare-fun b!1435881 () Bool)

(assert (=> b!1435881 (= e!810324 e!810325)))

(declare-fun lt!632018 () (_ BitVec 64))

(assert (=> b!1435881 (= lt!632018 (select (arr!47121 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48532 0))(
  ( (Unit!48533) )
))
(declare-fun lt!632017 () Unit!48532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97640 (_ BitVec 64) (_ BitVec 32)) Unit!48532)

(assert (=> b!1435881 (= lt!632017 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632018 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435881 (arrayContainsKey!0 a!2862 lt!632018 #b00000000000000000000000000000000)))

(declare-fun lt!632019 () Unit!48532)

(assert (=> b!1435881 (= lt!632019 lt!632017)))

(declare-fun res!968872 () Bool)

(declare-datatypes ((SeekEntryResult!11393 0))(
  ( (MissingZero!11393 (index!47964 (_ BitVec 32))) (Found!11393 (index!47965 (_ BitVec 32))) (Intermediate!11393 (undefined!12205 Bool) (index!47966 (_ BitVec 32)) (x!129647 (_ BitVec 32))) (Undefined!11393) (MissingVacant!11393 (index!47967 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97640 (_ BitVec 32)) SeekEntryResult!11393)

(assert (=> b!1435881 (= res!968872 (= (seekEntryOrOpen!0 (select (arr!47121 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11393 #b00000000000000000000000000000000)))))

(assert (=> b!1435881 (=> (not res!968872) (not e!810325))))

(declare-fun d!154421 () Bool)

(declare-fun res!968871 () Bool)

(assert (=> d!154421 (=> res!968871 e!810326)))

(assert (=> d!154421 (= res!968871 (bvsge #b00000000000000000000000000000000 (size!47671 a!2862)))))

(assert (=> d!154421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810326)))

(assert (= (and d!154421 (not res!968871)) b!1435883))

(assert (= (and b!1435883 c!133008) b!1435881))

(assert (= (and b!1435883 (not c!133008)) b!1435882))

(assert (= (and b!1435881 res!968872) b!1435884))

(assert (= (or b!1435884 b!1435882) bm!67567))

(declare-fun m!1325247 () Bool)

(assert (=> b!1435883 m!1325247))

(assert (=> b!1435883 m!1325247))

(declare-fun m!1325249 () Bool)

(assert (=> b!1435883 m!1325249))

(declare-fun m!1325251 () Bool)

(assert (=> bm!67567 m!1325251))

(assert (=> b!1435881 m!1325247))

(declare-fun m!1325253 () Bool)

(assert (=> b!1435881 m!1325253))

(declare-fun m!1325255 () Bool)

(assert (=> b!1435881 m!1325255))

(assert (=> b!1435881 m!1325247))

(declare-fun m!1325257 () Bool)

(assert (=> b!1435881 m!1325257))

(assert (=> b!1435829 d!154421))

(declare-fun d!154429 () Bool)

(assert (=> d!154429 (= (validKeyInArray!0 (select (arr!47121 a!2862) j!93)) (and (not (= (select (arr!47121 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47121 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435830 d!154429))

(declare-fun d!154431 () Bool)

(assert (=> d!154431 (= (validKeyInArray!0 (select (arr!47121 a!2862) i!1006)) (and (not (= (select (arr!47121 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47121 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435832 d!154431))

(check-sat (not b!1435883) (not bm!67567) (not b!1435881))
(check-sat)
