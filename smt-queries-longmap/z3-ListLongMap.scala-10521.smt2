; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124030 () Bool)

(assert start!124030)

(declare-fun b!1436340 () Bool)

(declare-fun res!969378 () Bool)

(declare-fun e!810528 () Bool)

(assert (=> b!1436340 (=> (not res!969378) (not e!810528))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97645 0))(
  ( (array!97646 (arr!47119 (Array (_ BitVec 32) (_ BitVec 64))) (size!47671 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97645)

(assert (=> b!1436340 (= res!969378 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47671 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47671 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47671 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47119 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436341 () Bool)

(declare-fun res!969374 () Bool)

(assert (=> b!1436341 (=> (not res!969374) (not e!810528))))

(declare-datatypes ((List!33698 0))(
  ( (Nil!33695) (Cons!33694 (h!35029 (_ BitVec 64)) (t!48384 List!33698)) )
))
(declare-fun arrayNoDuplicates!0 (array!97645 (_ BitVec 32) List!33698) Bool)

(assert (=> b!1436341 (= res!969374 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33695))))

(declare-fun b!1436342 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!631908 () (_ BitVec 32))

(assert (=> b!1436342 (= e!810528 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!631908 #b00000000000000000000000000000000) (bvsge lt!631908 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436342 (= lt!631908 (toIndex!0 (select (arr!47119 a!2862) j!93) mask!2687))))

(declare-fun b!1436343 () Bool)

(declare-fun res!969376 () Bool)

(assert (=> b!1436343 (=> (not res!969376) (not e!810528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436343 (= res!969376 (validKeyInArray!0 (select (arr!47119 a!2862) i!1006)))))

(declare-fun res!969373 () Bool)

(assert (=> start!124030 (=> (not res!969373) (not e!810528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124030 (= res!969373 (validMask!0 mask!2687))))

(assert (=> start!124030 e!810528))

(assert (=> start!124030 true))

(declare-fun array_inv!36352 (array!97645) Bool)

(assert (=> start!124030 (array_inv!36352 a!2862)))

(declare-fun b!1436344 () Bool)

(declare-fun res!969375 () Bool)

(assert (=> b!1436344 (=> (not res!969375) (not e!810528))))

(assert (=> b!1436344 (= res!969375 (validKeyInArray!0 (select (arr!47119 a!2862) j!93)))))

(declare-fun b!1436345 () Bool)

(declare-fun res!969377 () Bool)

(assert (=> b!1436345 (=> (not res!969377) (not e!810528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97645 (_ BitVec 32)) Bool)

(assert (=> b!1436345 (= res!969377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436346 () Bool)

(declare-fun res!969379 () Bool)

(assert (=> b!1436346 (=> (not res!969379) (not e!810528))))

(assert (=> b!1436346 (= res!969379 (and (= (size!47671 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47671 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47671 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124030 res!969373) b!1436346))

(assert (= (and b!1436346 res!969379) b!1436343))

(assert (= (and b!1436343 res!969376) b!1436344))

(assert (= (and b!1436344 res!969375) b!1436345))

(assert (= (and b!1436345 res!969377) b!1436341))

(assert (= (and b!1436341 res!969374) b!1436340))

(assert (= (and b!1436340 res!969378) b!1436342))

(declare-fun m!1325175 () Bool)

(assert (=> b!1436341 m!1325175))

(declare-fun m!1325177 () Bool)

(assert (=> b!1436340 m!1325177))

(declare-fun m!1325179 () Bool)

(assert (=> b!1436340 m!1325179))

(declare-fun m!1325181 () Bool)

(assert (=> start!124030 m!1325181))

(declare-fun m!1325183 () Bool)

(assert (=> start!124030 m!1325183))

(declare-fun m!1325185 () Bool)

(assert (=> b!1436345 m!1325185))

(declare-fun m!1325187 () Bool)

(assert (=> b!1436343 m!1325187))

(assert (=> b!1436343 m!1325187))

(declare-fun m!1325189 () Bool)

(assert (=> b!1436343 m!1325189))

(declare-fun m!1325191 () Bool)

(assert (=> b!1436342 m!1325191))

(assert (=> b!1436342 m!1325191))

(declare-fun m!1325193 () Bool)

(assert (=> b!1436342 m!1325193))

(assert (=> b!1436344 m!1325191))

(assert (=> b!1436344 m!1325191))

(declare-fun m!1325195 () Bool)

(assert (=> b!1436344 m!1325195))

(check-sat (not start!124030) (not b!1436341) (not b!1436342) (not b!1436344) (not b!1436343) (not b!1436345))
(check-sat)
(get-model)

(declare-fun d!154393 () Bool)

(declare-fun lt!631920 () (_ BitVec 32))

(declare-fun lt!631919 () (_ BitVec 32))

(assert (=> d!154393 (= lt!631920 (bvmul (bvxor lt!631919 (bvlshr lt!631919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154393 (= lt!631919 ((_ extract 31 0) (bvand (bvxor (select (arr!47119 a!2862) j!93) (bvlshr (select (arr!47119 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154393 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!969422 (let ((h!35032 ((_ extract 31 0) (bvand (bvxor (select (arr!47119 a!2862) j!93) (bvlshr (select (arr!47119 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129715 (bvmul (bvxor h!35032 (bvlshr h!35032 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129715 (bvlshr x!129715 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!969422 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!969422 #b00000000000000000000000000000000))))))

(assert (=> d!154393 (= (toIndex!0 (select (arr!47119 a!2862) j!93) mask!2687) (bvand (bvxor lt!631920 (bvlshr lt!631920 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1436342 d!154393))

(declare-fun b!1436399 () Bool)

(declare-fun e!810549 () Bool)

(declare-fun e!810550 () Bool)

(assert (=> b!1436399 (= e!810549 e!810550)))

(declare-fun c!132991 () Bool)

(assert (=> b!1436399 (= c!132991 (validKeyInArray!0 (select (arr!47119 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154395 () Bool)

(declare-fun res!969430 () Bool)

(declare-fun e!810551 () Bool)

(assert (=> d!154395 (=> res!969430 e!810551)))

(assert (=> d!154395 (= res!969430 (bvsge #b00000000000000000000000000000000 (size!47671 a!2862)))))

(assert (=> d!154395 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33695) e!810551)))

(declare-fun b!1436400 () Bool)

(declare-fun call!67580 () Bool)

(assert (=> b!1436400 (= e!810550 call!67580)))

(declare-fun bm!67577 () Bool)

(assert (=> bm!67577 (= call!67580 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132991 (Cons!33694 (select (arr!47119 a!2862) #b00000000000000000000000000000000) Nil!33695) Nil!33695)))))

(declare-fun b!1436401 () Bool)

(declare-fun e!810552 () Bool)

(declare-fun contains!9845 (List!33698 (_ BitVec 64)) Bool)

(assert (=> b!1436401 (= e!810552 (contains!9845 Nil!33695 (select (arr!47119 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436402 () Bool)

(assert (=> b!1436402 (= e!810551 e!810549)))

(declare-fun res!969431 () Bool)

(assert (=> b!1436402 (=> (not res!969431) (not e!810549))))

(assert (=> b!1436402 (= res!969431 (not e!810552))))

(declare-fun res!969429 () Bool)

(assert (=> b!1436402 (=> (not res!969429) (not e!810552))))

(assert (=> b!1436402 (= res!969429 (validKeyInArray!0 (select (arr!47119 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436403 () Bool)

(assert (=> b!1436403 (= e!810550 call!67580)))

(assert (= (and d!154395 (not res!969430)) b!1436402))

(assert (= (and b!1436402 res!969429) b!1436401))

(assert (= (and b!1436402 res!969431) b!1436399))

(assert (= (and b!1436399 c!132991) b!1436403))

(assert (= (and b!1436399 (not c!132991)) b!1436400))

(assert (= (or b!1436403 b!1436400) bm!67577))

(declare-fun m!1325241 () Bool)

(assert (=> b!1436399 m!1325241))

(assert (=> b!1436399 m!1325241))

(declare-fun m!1325243 () Bool)

(assert (=> b!1436399 m!1325243))

(assert (=> bm!67577 m!1325241))

(declare-fun m!1325245 () Bool)

(assert (=> bm!67577 m!1325245))

(assert (=> b!1436401 m!1325241))

(assert (=> b!1436401 m!1325241))

(declare-fun m!1325247 () Bool)

(assert (=> b!1436401 m!1325247))

(assert (=> b!1436402 m!1325241))

(assert (=> b!1436402 m!1325241))

(assert (=> b!1436402 m!1325243))

(assert (=> b!1436341 d!154395))

(declare-fun b!1436412 () Bool)

(declare-fun e!810560 () Bool)

(declare-fun call!67583 () Bool)

(assert (=> b!1436412 (= e!810560 call!67583)))

(declare-fun b!1436413 () Bool)

(declare-fun e!810561 () Bool)

(declare-fun e!810559 () Bool)

(assert (=> b!1436413 (= e!810561 e!810559)))

(declare-fun c!132994 () Bool)

(assert (=> b!1436413 (= c!132994 (validKeyInArray!0 (select (arr!47119 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436414 () Bool)

(assert (=> b!1436414 (= e!810559 call!67583)))

(declare-fun b!1436415 () Bool)

(assert (=> b!1436415 (= e!810559 e!810560)))

(declare-fun lt!631927 () (_ BitVec 64))

(assert (=> b!1436415 (= lt!631927 (select (arr!47119 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48391 0))(
  ( (Unit!48392) )
))
(declare-fun lt!631929 () Unit!48391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97645 (_ BitVec 64) (_ BitVec 32)) Unit!48391)

(assert (=> b!1436415 (= lt!631929 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!631927 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436415 (arrayContainsKey!0 a!2862 lt!631927 #b00000000000000000000000000000000)))

(declare-fun lt!631928 () Unit!48391)

(assert (=> b!1436415 (= lt!631928 lt!631929)))

(declare-fun res!969437 () Bool)

(declare-datatypes ((SeekEntryResult!11402 0))(
  ( (MissingZero!11402 (index!48000 (_ BitVec 32))) (Found!11402 (index!48001 (_ BitVec 32))) (Intermediate!11402 (undefined!12214 Bool) (index!48002 (_ BitVec 32)) (x!129718 (_ BitVec 32))) (Undefined!11402) (MissingVacant!11402 (index!48003 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97645 (_ BitVec 32)) SeekEntryResult!11402)

(assert (=> b!1436415 (= res!969437 (= (seekEntryOrOpen!0 (select (arr!47119 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11402 #b00000000000000000000000000000000)))))

(assert (=> b!1436415 (=> (not res!969437) (not e!810560))))

(declare-fun d!154397 () Bool)

(declare-fun res!969436 () Bool)

(assert (=> d!154397 (=> res!969436 e!810561)))

(assert (=> d!154397 (= res!969436 (bvsge #b00000000000000000000000000000000 (size!47671 a!2862)))))

(assert (=> d!154397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810561)))

(declare-fun bm!67580 () Bool)

(assert (=> bm!67580 (= call!67583 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!154397 (not res!969436)) b!1436413))

(assert (= (and b!1436413 c!132994) b!1436415))

(assert (= (and b!1436413 (not c!132994)) b!1436414))

(assert (= (and b!1436415 res!969437) b!1436412))

(assert (= (or b!1436412 b!1436414) bm!67580))

(assert (=> b!1436413 m!1325241))

(assert (=> b!1436413 m!1325241))

(assert (=> b!1436413 m!1325243))

(assert (=> b!1436415 m!1325241))

(declare-fun m!1325249 () Bool)

(assert (=> b!1436415 m!1325249))

(declare-fun m!1325251 () Bool)

(assert (=> b!1436415 m!1325251))

(assert (=> b!1436415 m!1325241))

(declare-fun m!1325253 () Bool)

(assert (=> b!1436415 m!1325253))

(declare-fun m!1325255 () Bool)

(assert (=> bm!67580 m!1325255))

(assert (=> b!1436345 d!154397))

(declare-fun d!154403 () Bool)

(assert (=> d!154403 (= (validKeyInArray!0 (select (arr!47119 a!2862) j!93)) (and (not (= (select (arr!47119 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47119 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436344 d!154403))

(declare-fun d!154405 () Bool)

(assert (=> d!154405 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124030 d!154405))

(declare-fun d!154413 () Bool)

(assert (=> d!154413 (= (array_inv!36352 a!2862) (bvsge (size!47671 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124030 d!154413))

(declare-fun d!154415 () Bool)

(assert (=> d!154415 (= (validKeyInArray!0 (select (arr!47119 a!2862) i!1006)) (and (not (= (select (arr!47119 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47119 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436343 d!154415))

(check-sat (not b!1436415) (not bm!67580) (not b!1436402) (not b!1436401) (not b!1436413) (not bm!67577) (not b!1436399))
(check-sat)
