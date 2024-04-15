; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125578 () Bool)

(assert start!125578)

(declare-fun b!1469827 () Bool)

(declare-fun res!998354 () Bool)

(declare-fun e!825092 () Bool)

(assert (=> b!1469827 (=> (not res!998354) (not e!825092))))

(declare-datatypes ((array!99004 0))(
  ( (array!99005 (arr!47791 (Array (_ BitVec 32) (_ BitVec 64))) (size!48343 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99004)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469827 (= res!998354 (validKeyInArray!0 (select (arr!47791 a!2862) i!1006)))))

(declare-fun b!1469828 () Bool)

(declare-fun e!825091 () Bool)

(assert (=> b!1469828 (= e!825092 e!825091)))

(declare-fun res!998361 () Bool)

(assert (=> b!1469828 (=> (not res!998361) (not e!825091))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469828 (= res!998361 (= (select (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642518 () array!99004)

(assert (=> b!1469828 (= lt!642518 (array!99005 (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48343 a!2862)))))

(declare-fun b!1469829 () Bool)

(declare-fun e!825088 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12056 0))(
  ( (MissingZero!12056 (index!50616 (_ BitVec 32))) (Found!12056 (index!50617 (_ BitVec 32))) (Intermediate!12056 (undefined!12868 Bool) (index!50618 (_ BitVec 32)) (x!132188 (_ BitVec 32))) (Undefined!12056) (MissingVacant!12056 (index!50619 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99004 (_ BitVec 32)) SeekEntryResult!12056)

(assert (=> b!1469829 (= e!825088 (not (= (seekEntryOrOpen!0 (select (arr!47791 a!2862) j!93) a!2862 mask!2687) (Found!12056 j!93))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99004 (_ BitVec 32)) Bool)

(assert (=> b!1469829 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49293 0))(
  ( (Unit!49294) )
))
(declare-fun lt!642522 () Unit!49293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49293)

(assert (=> b!1469829 (= lt!642522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1469830 () Bool)

(declare-fun res!998364 () Bool)

(assert (=> b!1469830 (=> (not res!998364) (not e!825092))))

(assert (=> b!1469830 (= res!998364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469831 () Bool)

(declare-fun res!998365 () Bool)

(assert (=> b!1469831 (=> (not res!998365) (not e!825092))))

(assert (=> b!1469831 (= res!998365 (and (= (size!48343 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48343 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48343 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469832 () Bool)

(declare-fun res!998353 () Bool)

(assert (=> b!1469832 (=> (not res!998353) (not e!825092))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469832 (= res!998353 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48343 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48343 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48343 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469833 () Bool)

(declare-fun e!825089 () Bool)

(assert (=> b!1469833 (= e!825091 e!825089)))

(declare-fun res!998355 () Bool)

(assert (=> b!1469833 (=> (not res!998355) (not e!825089))))

(declare-fun lt!642519 () SeekEntryResult!12056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99004 (_ BitVec 32)) SeekEntryResult!12056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469833 (= res!998355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642519))))

(assert (=> b!1469833 (= lt!642519 (Intermediate!12056 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!642521 () (_ BitVec 64))

(declare-fun lt!642520 () SeekEntryResult!12056)

(declare-fun e!825093 () Bool)

(declare-fun b!1469834 () Bool)

(assert (=> b!1469834 (= e!825093 (= lt!642520 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642521 lt!642518 mask!2687)))))

(declare-fun b!1469835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99004 (_ BitVec 32)) SeekEntryResult!12056)

(assert (=> b!1469835 (= e!825093 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642521 lt!642518 mask!2687) (seekEntryOrOpen!0 lt!642521 lt!642518 mask!2687)))))

(declare-fun b!1469836 () Bool)

(declare-fun res!998362 () Bool)

(assert (=> b!1469836 (=> (not res!998362) (not e!825089))))

(assert (=> b!1469836 (= res!998362 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642519))))

(declare-fun b!1469837 () Bool)

(declare-fun res!998356 () Bool)

(assert (=> b!1469837 (=> (not res!998356) (not e!825092))))

(declare-datatypes ((List!34370 0))(
  ( (Nil!34367) (Cons!34366 (h!35716 (_ BitVec 64)) (t!49056 List!34370)) )
))
(declare-fun arrayNoDuplicates!0 (array!99004 (_ BitVec 32) List!34370) Bool)

(assert (=> b!1469837 (= res!998356 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34367))))

(declare-fun b!1469838 () Bool)

(declare-fun res!998357 () Bool)

(assert (=> b!1469838 (=> (not res!998357) (not e!825088))))

(assert (=> b!1469838 (= res!998357 e!825093)))

(declare-fun c!135250 () Bool)

(assert (=> b!1469838 (= c!135250 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469840 () Bool)

(declare-fun res!998363 () Bool)

(assert (=> b!1469840 (=> (not res!998363) (not e!825088))))

(assert (=> b!1469840 (= res!998363 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1469841 () Bool)

(declare-fun res!998358 () Bool)

(assert (=> b!1469841 (=> (not res!998358) (not e!825092))))

(assert (=> b!1469841 (= res!998358 (validKeyInArray!0 (select (arr!47791 a!2862) j!93)))))

(declare-fun b!1469839 () Bool)

(assert (=> b!1469839 (= e!825089 e!825088)))

(declare-fun res!998360 () Bool)

(assert (=> b!1469839 (=> (not res!998360) (not e!825088))))

(assert (=> b!1469839 (= res!998360 (= lt!642520 (Intermediate!12056 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469839 (= lt!642520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642521 mask!2687) lt!642521 lt!642518 mask!2687))))

(assert (=> b!1469839 (= lt!642521 (select (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!998359 () Bool)

(assert (=> start!125578 (=> (not res!998359) (not e!825092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125578 (= res!998359 (validMask!0 mask!2687))))

(assert (=> start!125578 e!825092))

(assert (=> start!125578 true))

(declare-fun array_inv!37024 (array!99004) Bool)

(assert (=> start!125578 (array_inv!37024 a!2862)))

(assert (= (and start!125578 res!998359) b!1469831))

(assert (= (and b!1469831 res!998365) b!1469827))

(assert (= (and b!1469827 res!998354) b!1469841))

(assert (= (and b!1469841 res!998358) b!1469830))

(assert (= (and b!1469830 res!998364) b!1469837))

(assert (= (and b!1469837 res!998356) b!1469832))

(assert (= (and b!1469832 res!998353) b!1469828))

(assert (= (and b!1469828 res!998361) b!1469833))

(assert (= (and b!1469833 res!998355) b!1469836))

(assert (= (and b!1469836 res!998362) b!1469839))

(assert (= (and b!1469839 res!998360) b!1469838))

(assert (= (and b!1469838 c!135250) b!1469834))

(assert (= (and b!1469838 (not c!135250)) b!1469835))

(assert (= (and b!1469838 res!998357) b!1469840))

(assert (= (and b!1469840 res!998363) b!1469829))

(declare-fun m!1356483 () Bool)

(assert (=> start!125578 m!1356483))

(declare-fun m!1356485 () Bool)

(assert (=> start!125578 m!1356485))

(declare-fun m!1356487 () Bool)

(assert (=> b!1469833 m!1356487))

(assert (=> b!1469833 m!1356487))

(declare-fun m!1356489 () Bool)

(assert (=> b!1469833 m!1356489))

(assert (=> b!1469833 m!1356489))

(assert (=> b!1469833 m!1356487))

(declare-fun m!1356491 () Bool)

(assert (=> b!1469833 m!1356491))

(declare-fun m!1356493 () Bool)

(assert (=> b!1469827 m!1356493))

(assert (=> b!1469827 m!1356493))

(declare-fun m!1356495 () Bool)

(assert (=> b!1469827 m!1356495))

(declare-fun m!1356497 () Bool)

(assert (=> b!1469835 m!1356497))

(declare-fun m!1356499 () Bool)

(assert (=> b!1469835 m!1356499))

(assert (=> b!1469836 m!1356487))

(assert (=> b!1469836 m!1356487))

(declare-fun m!1356501 () Bool)

(assert (=> b!1469836 m!1356501))

(assert (=> b!1469841 m!1356487))

(assert (=> b!1469841 m!1356487))

(declare-fun m!1356503 () Bool)

(assert (=> b!1469841 m!1356503))

(declare-fun m!1356505 () Bool)

(assert (=> b!1469837 m!1356505))

(declare-fun m!1356507 () Bool)

(assert (=> b!1469834 m!1356507))

(declare-fun m!1356509 () Bool)

(assert (=> b!1469839 m!1356509))

(assert (=> b!1469839 m!1356509))

(declare-fun m!1356511 () Bool)

(assert (=> b!1469839 m!1356511))

(declare-fun m!1356513 () Bool)

(assert (=> b!1469839 m!1356513))

(declare-fun m!1356515 () Bool)

(assert (=> b!1469839 m!1356515))

(declare-fun m!1356517 () Bool)

(assert (=> b!1469830 m!1356517))

(assert (=> b!1469829 m!1356487))

(assert (=> b!1469829 m!1356487))

(declare-fun m!1356519 () Bool)

(assert (=> b!1469829 m!1356519))

(declare-fun m!1356521 () Bool)

(assert (=> b!1469829 m!1356521))

(declare-fun m!1356523 () Bool)

(assert (=> b!1469829 m!1356523))

(assert (=> b!1469828 m!1356513))

(declare-fun m!1356525 () Bool)

(assert (=> b!1469828 m!1356525))

(check-sat (not b!1469837) (not start!125578) (not b!1469839) (not b!1469841) (not b!1469835) (not b!1469834) (not b!1469827) (not b!1469830) (not b!1469829) (not b!1469836) (not b!1469833))
(check-sat)
(get-model)

(declare-fun d!155129 () Bool)

(assert (=> d!155129 (= (validKeyInArray!0 (select (arr!47791 a!2862) j!93)) (and (not (= (select (arr!47791 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47791 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1469841 d!155129))

(declare-fun b!1469940 () Bool)

(declare-fun e!825137 () Bool)

(declare-fun e!825136 () Bool)

(assert (=> b!1469940 (= e!825137 e!825136)))

(declare-fun lt!642559 () (_ BitVec 64))

(assert (=> b!1469940 (= lt!642559 (select (arr!47791 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!642560 () Unit!49293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99004 (_ BitVec 64) (_ BitVec 32)) Unit!49293)

(assert (=> b!1469940 (= lt!642560 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642559 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1469940 (arrayContainsKey!0 a!2862 lt!642559 #b00000000000000000000000000000000)))

(declare-fun lt!642561 () Unit!49293)

(assert (=> b!1469940 (= lt!642561 lt!642560)))

(declare-fun res!998449 () Bool)

(assert (=> b!1469940 (= res!998449 (= (seekEntryOrOpen!0 (select (arr!47791 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12056 #b00000000000000000000000000000000)))))

(assert (=> b!1469940 (=> (not res!998449) (not e!825136))))

(declare-fun d!155131 () Bool)

(declare-fun res!998448 () Bool)

(declare-fun e!825138 () Bool)

(assert (=> d!155131 (=> res!998448 e!825138)))

(assert (=> d!155131 (= res!998448 (bvsge #b00000000000000000000000000000000 (size!48343 a!2862)))))

(assert (=> d!155131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825138)))

(declare-fun bm!67667 () Bool)

(declare-fun call!67670 () Bool)

(assert (=> bm!67667 (= call!67670 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1469941 () Bool)

(assert (=> b!1469941 (= e!825138 e!825137)))

(declare-fun c!135259 () Bool)

(assert (=> b!1469941 (= c!135259 (validKeyInArray!0 (select (arr!47791 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1469942 () Bool)

(assert (=> b!1469942 (= e!825137 call!67670)))

(declare-fun b!1469943 () Bool)

(assert (=> b!1469943 (= e!825136 call!67670)))

(assert (= (and d!155131 (not res!998448)) b!1469941))

(assert (= (and b!1469941 c!135259) b!1469940))

(assert (= (and b!1469941 (not c!135259)) b!1469942))

(assert (= (and b!1469940 res!998449) b!1469943))

(assert (= (or b!1469943 b!1469942) bm!67667))

(declare-fun m!1356615 () Bool)

(assert (=> b!1469940 m!1356615))

(declare-fun m!1356617 () Bool)

(assert (=> b!1469940 m!1356617))

(declare-fun m!1356619 () Bool)

(assert (=> b!1469940 m!1356619))

(assert (=> b!1469940 m!1356615))

(declare-fun m!1356621 () Bool)

(assert (=> b!1469940 m!1356621))

(declare-fun m!1356623 () Bool)

(assert (=> bm!67667 m!1356623))

(assert (=> b!1469941 m!1356615))

(assert (=> b!1469941 m!1356615))

(declare-fun m!1356625 () Bool)

(assert (=> b!1469941 m!1356625))

(assert (=> b!1469830 d!155131))

(declare-fun b!1469956 () Bool)

(declare-fun c!135266 () Bool)

(declare-fun lt!642569 () (_ BitVec 64))

(assert (=> b!1469956 (= c!135266 (= lt!642569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825146 () SeekEntryResult!12056)

(declare-fun e!825145 () SeekEntryResult!12056)

(assert (=> b!1469956 (= e!825146 e!825145)))

(declare-fun b!1469957 () Bool)

(declare-fun lt!642570 () SeekEntryResult!12056)

(assert (=> b!1469957 (= e!825146 (Found!12056 (index!50618 lt!642570)))))

(declare-fun b!1469958 () Bool)

(declare-fun e!825147 () SeekEntryResult!12056)

(assert (=> b!1469958 (= e!825147 Undefined!12056)))

(declare-fun b!1469959 () Bool)

(assert (=> b!1469959 (= e!825145 (seekKeyOrZeroReturnVacant!0 (x!132188 lt!642570) (index!50618 lt!642570) (index!50618 lt!642570) (select (arr!47791 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155133 () Bool)

(declare-fun lt!642568 () SeekEntryResult!12056)

(get-info :version)

(assert (=> d!155133 (and (or ((_ is Undefined!12056) lt!642568) (not ((_ is Found!12056) lt!642568)) (and (bvsge (index!50617 lt!642568) #b00000000000000000000000000000000) (bvslt (index!50617 lt!642568) (size!48343 a!2862)))) (or ((_ is Undefined!12056) lt!642568) ((_ is Found!12056) lt!642568) (not ((_ is MissingZero!12056) lt!642568)) (and (bvsge (index!50616 lt!642568) #b00000000000000000000000000000000) (bvslt (index!50616 lt!642568) (size!48343 a!2862)))) (or ((_ is Undefined!12056) lt!642568) ((_ is Found!12056) lt!642568) ((_ is MissingZero!12056) lt!642568) (not ((_ is MissingVacant!12056) lt!642568)) (and (bvsge (index!50619 lt!642568) #b00000000000000000000000000000000) (bvslt (index!50619 lt!642568) (size!48343 a!2862)))) (or ((_ is Undefined!12056) lt!642568) (ite ((_ is Found!12056) lt!642568) (= (select (arr!47791 a!2862) (index!50617 lt!642568)) (select (arr!47791 a!2862) j!93)) (ite ((_ is MissingZero!12056) lt!642568) (= (select (arr!47791 a!2862) (index!50616 lt!642568)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12056) lt!642568) (= (select (arr!47791 a!2862) (index!50619 lt!642568)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155133 (= lt!642568 e!825147)))

(declare-fun c!135268 () Bool)

(assert (=> d!155133 (= c!135268 (and ((_ is Intermediate!12056) lt!642570) (undefined!12868 lt!642570)))))

(assert (=> d!155133 (= lt!642570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) (select (arr!47791 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155133 (validMask!0 mask!2687)))

(assert (=> d!155133 (= (seekEntryOrOpen!0 (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642568)))

(declare-fun b!1469960 () Bool)

(assert (=> b!1469960 (= e!825145 (MissingZero!12056 (index!50618 lt!642570)))))

(declare-fun b!1469961 () Bool)

(assert (=> b!1469961 (= e!825147 e!825146)))

(assert (=> b!1469961 (= lt!642569 (select (arr!47791 a!2862) (index!50618 lt!642570)))))

(declare-fun c!135267 () Bool)

(assert (=> b!1469961 (= c!135267 (= lt!642569 (select (arr!47791 a!2862) j!93)))))

(assert (= (and d!155133 c!135268) b!1469958))

(assert (= (and d!155133 (not c!135268)) b!1469961))

(assert (= (and b!1469961 c!135267) b!1469957))

(assert (= (and b!1469961 (not c!135267)) b!1469956))

(assert (= (and b!1469956 c!135266) b!1469960))

(assert (= (and b!1469956 (not c!135266)) b!1469959))

(assert (=> b!1469959 m!1356487))

(declare-fun m!1356627 () Bool)

(assert (=> b!1469959 m!1356627))

(declare-fun m!1356629 () Bool)

(assert (=> d!155133 m!1356629))

(assert (=> d!155133 m!1356487))

(assert (=> d!155133 m!1356489))

(declare-fun m!1356631 () Bool)

(assert (=> d!155133 m!1356631))

(assert (=> d!155133 m!1356489))

(assert (=> d!155133 m!1356487))

(assert (=> d!155133 m!1356491))

(declare-fun m!1356633 () Bool)

(assert (=> d!155133 m!1356633))

(assert (=> d!155133 m!1356483))

(declare-fun m!1356635 () Bool)

(assert (=> b!1469961 m!1356635))

(assert (=> b!1469829 d!155133))

(declare-fun b!1469962 () Bool)

(declare-fun e!825149 () Bool)

(declare-fun e!825148 () Bool)

(assert (=> b!1469962 (= e!825149 e!825148)))

(declare-fun lt!642571 () (_ BitVec 64))

(assert (=> b!1469962 (= lt!642571 (select (arr!47791 a!2862) j!93))))

(declare-fun lt!642572 () Unit!49293)

(assert (=> b!1469962 (= lt!642572 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642571 j!93))))

(assert (=> b!1469962 (arrayContainsKey!0 a!2862 lt!642571 #b00000000000000000000000000000000)))

(declare-fun lt!642573 () Unit!49293)

(assert (=> b!1469962 (= lt!642573 lt!642572)))

(declare-fun res!998451 () Bool)

(assert (=> b!1469962 (= res!998451 (= (seekEntryOrOpen!0 (select (arr!47791 a!2862) j!93) a!2862 mask!2687) (Found!12056 j!93)))))

(assert (=> b!1469962 (=> (not res!998451) (not e!825148))))

(declare-fun d!155135 () Bool)

(declare-fun res!998450 () Bool)

(declare-fun e!825150 () Bool)

(assert (=> d!155135 (=> res!998450 e!825150)))

(assert (=> d!155135 (= res!998450 (bvsge j!93 (size!48343 a!2862)))))

(assert (=> d!155135 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825150)))

(declare-fun bm!67668 () Bool)

(declare-fun call!67671 () Bool)

(assert (=> bm!67668 (= call!67671 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1469963 () Bool)

(assert (=> b!1469963 (= e!825150 e!825149)))

(declare-fun c!135269 () Bool)

(assert (=> b!1469963 (= c!135269 (validKeyInArray!0 (select (arr!47791 a!2862) j!93)))))

(declare-fun b!1469964 () Bool)

(assert (=> b!1469964 (= e!825149 call!67671)))

(declare-fun b!1469965 () Bool)

(assert (=> b!1469965 (= e!825148 call!67671)))

(assert (= (and d!155135 (not res!998450)) b!1469963))

(assert (= (and b!1469963 c!135269) b!1469962))

(assert (= (and b!1469963 (not c!135269)) b!1469964))

(assert (= (and b!1469962 res!998451) b!1469965))

(assert (= (or b!1469965 b!1469964) bm!67668))

(assert (=> b!1469962 m!1356487))

(declare-fun m!1356637 () Bool)

(assert (=> b!1469962 m!1356637))

(declare-fun m!1356639 () Bool)

(assert (=> b!1469962 m!1356639))

(assert (=> b!1469962 m!1356487))

(assert (=> b!1469962 m!1356519))

(declare-fun m!1356641 () Bool)

(assert (=> bm!67668 m!1356641))

(assert (=> b!1469963 m!1356487))

(assert (=> b!1469963 m!1356487))

(assert (=> b!1469963 m!1356503))

(assert (=> b!1469829 d!155135))

(declare-fun d!155137 () Bool)

(assert (=> d!155137 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642576 () Unit!49293)

(declare-fun choose!38 (array!99004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49293)

(assert (=> d!155137 (= lt!642576 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155137 (validMask!0 mask!2687)))

(assert (=> d!155137 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!642576)))

(declare-fun bs!42457 () Bool)

(assert (= bs!42457 d!155137))

(assert (=> bs!42457 m!1356521))

(declare-fun m!1356643 () Bool)

(assert (=> bs!42457 m!1356643))

(assert (=> bs!42457 m!1356483))

(assert (=> b!1469829 d!155137))

(declare-fun b!1469996 () Bool)

(declare-fun lt!642587 () SeekEntryResult!12056)

(assert (=> b!1469996 (and (bvsge (index!50618 lt!642587) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642587) (size!48343 lt!642518)))))

(declare-fun e!825169 () Bool)

(assert (=> b!1469996 (= e!825169 (= (select (arr!47791 lt!642518) (index!50618 lt!642587)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1469997 () Bool)

(declare-fun e!825171 () Bool)

(assert (=> b!1469997 (= e!825171 (bvsge (x!132188 lt!642587) #b01111111111111111111111111111110))))

(declare-fun b!1469998 () Bool)

(assert (=> b!1469998 (and (bvsge (index!50618 lt!642587) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642587) (size!48343 lt!642518)))))

(declare-fun res!998458 () Bool)

(assert (=> b!1469998 (= res!998458 (= (select (arr!47791 lt!642518) (index!50618 lt!642587)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469998 (=> res!998458 e!825169)))

(declare-fun b!1469999 () Bool)

(declare-fun e!825170 () Bool)

(assert (=> b!1469999 (= e!825171 e!825170)))

(declare-fun res!998460 () Bool)

(assert (=> b!1469999 (= res!998460 (and ((_ is Intermediate!12056) lt!642587) (not (undefined!12868 lt!642587)) (bvslt (x!132188 lt!642587) #b01111111111111111111111111111110) (bvsge (x!132188 lt!642587) #b00000000000000000000000000000000) (bvsge (x!132188 lt!642587) #b00000000000000000000000000000000)))))

(assert (=> b!1469999 (=> (not res!998460) (not e!825170))))

(declare-fun e!825168 () SeekEntryResult!12056)

(declare-fun b!1470000 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470000 (= e!825168 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!642521 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!642521 lt!642518 mask!2687))))

(declare-fun d!155139 () Bool)

(assert (=> d!155139 e!825171))

(declare-fun c!135283 () Bool)

(assert (=> d!155139 (= c!135283 (and ((_ is Intermediate!12056) lt!642587) (undefined!12868 lt!642587)))))

(declare-fun e!825167 () SeekEntryResult!12056)

(assert (=> d!155139 (= lt!642587 e!825167)))

(declare-fun c!135282 () Bool)

(assert (=> d!155139 (= c!135282 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!642588 () (_ BitVec 64))

(assert (=> d!155139 (= lt!642588 (select (arr!47791 lt!642518) (toIndex!0 lt!642521 mask!2687)))))

(assert (=> d!155139 (validMask!0 mask!2687)))

(assert (=> d!155139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642521 mask!2687) lt!642521 lt!642518 mask!2687) lt!642587)))

(declare-fun b!1470001 () Bool)

(assert (=> b!1470001 (= e!825168 (Intermediate!12056 false (toIndex!0 lt!642521 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470002 () Bool)

(assert (=> b!1470002 (and (bvsge (index!50618 lt!642587) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642587) (size!48343 lt!642518)))))

(declare-fun res!998459 () Bool)

(assert (=> b!1470002 (= res!998459 (= (select (arr!47791 lt!642518) (index!50618 lt!642587)) lt!642521))))

(assert (=> b!1470002 (=> res!998459 e!825169)))

(assert (=> b!1470002 (= e!825170 e!825169)))

(declare-fun b!1470003 () Bool)

(assert (=> b!1470003 (= e!825167 e!825168)))

(declare-fun c!135284 () Bool)

(assert (=> b!1470003 (= c!135284 (or (= lt!642588 lt!642521) (= (bvadd lt!642588 lt!642588) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470004 () Bool)

(assert (=> b!1470004 (= e!825167 (Intermediate!12056 true (toIndex!0 lt!642521 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155139 c!135282) b!1470004))

(assert (= (and d!155139 (not c!135282)) b!1470003))

(assert (= (and b!1470003 c!135284) b!1470001))

(assert (= (and b!1470003 (not c!135284)) b!1470000))

(assert (= (and d!155139 c!135283) b!1469997))

(assert (= (and d!155139 (not c!135283)) b!1469999))

(assert (= (and b!1469999 res!998460) b!1470002))

(assert (= (and b!1470002 (not res!998459)) b!1469998))

(assert (= (and b!1469998 (not res!998458)) b!1469996))

(assert (=> d!155139 m!1356509))

(declare-fun m!1356645 () Bool)

(assert (=> d!155139 m!1356645))

(assert (=> d!155139 m!1356483))

(declare-fun m!1356647 () Bool)

(assert (=> b!1469996 m!1356647))

(assert (=> b!1470000 m!1356509))

(declare-fun m!1356649 () Bool)

(assert (=> b!1470000 m!1356649))

(assert (=> b!1470000 m!1356649))

(declare-fun m!1356651 () Bool)

(assert (=> b!1470000 m!1356651))

(assert (=> b!1469998 m!1356647))

(assert (=> b!1470002 m!1356647))

(assert (=> b!1469839 d!155139))

(declare-fun d!155145 () Bool)

(declare-fun lt!642601 () (_ BitVec 32))

(declare-fun lt!642600 () (_ BitVec 32))

(assert (=> d!155145 (= lt!642601 (bvmul (bvxor lt!642600 (bvlshr lt!642600 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155145 (= lt!642600 ((_ extract 31 0) (bvand (bvxor lt!642521 (bvlshr lt!642521 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155145 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!998461 (let ((h!35719 ((_ extract 31 0) (bvand (bvxor lt!642521 (bvlshr lt!642521 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132193 (bvmul (bvxor h!35719 (bvlshr h!35719 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132193 (bvlshr x!132193 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!998461 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!998461 #b00000000000000000000000000000000))))))

(assert (=> d!155145 (= (toIndex!0 lt!642521 mask!2687) (bvand (bvxor lt!642601 (bvlshr lt!642601 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1469839 d!155145))

(declare-fun b!1470029 () Bool)

(declare-fun lt!642602 () SeekEntryResult!12056)

(assert (=> b!1470029 (and (bvsge (index!50618 lt!642602) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642602) (size!48343 a!2862)))))

(declare-fun e!825187 () Bool)

(assert (=> b!1470029 (= e!825187 (= (select (arr!47791 a!2862) (index!50618 lt!642602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470030 () Bool)

(declare-fun e!825189 () Bool)

(assert (=> b!1470030 (= e!825189 (bvsge (x!132188 lt!642602) #b01111111111111111111111111111110))))

(declare-fun b!1470031 () Bool)

(assert (=> b!1470031 (and (bvsge (index!50618 lt!642602) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642602) (size!48343 a!2862)))))

(declare-fun res!998468 () Bool)

(assert (=> b!1470031 (= res!998468 (= (select (arr!47791 a!2862) (index!50618 lt!642602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470031 (=> res!998468 e!825187)))

(declare-fun b!1470032 () Bool)

(declare-fun e!825188 () Bool)

(assert (=> b!1470032 (= e!825189 e!825188)))

(declare-fun res!998470 () Bool)

(assert (=> b!1470032 (= res!998470 (and ((_ is Intermediate!12056) lt!642602) (not (undefined!12868 lt!642602)) (bvslt (x!132188 lt!642602) #b01111111111111111111111111111110) (bvsge (x!132188 lt!642602) #b00000000000000000000000000000000) (bvsge (x!132188 lt!642602) #b00000000000000000000000000000000)))))

(assert (=> b!1470032 (=> (not res!998470) (not e!825188))))

(declare-fun e!825186 () SeekEntryResult!12056)

(declare-fun b!1470033 () Bool)

(assert (=> b!1470033 (= e!825186 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47791 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155149 () Bool)

(assert (=> d!155149 e!825189))

(declare-fun c!135295 () Bool)

(assert (=> d!155149 (= c!135295 (and ((_ is Intermediate!12056) lt!642602) (undefined!12868 lt!642602)))))

(declare-fun e!825185 () SeekEntryResult!12056)

(assert (=> d!155149 (= lt!642602 e!825185)))

(declare-fun c!135294 () Bool)

(assert (=> d!155149 (= c!135294 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!642603 () (_ BitVec 64))

(assert (=> d!155149 (= lt!642603 (select (arr!47791 a!2862) (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687)))))

(assert (=> d!155149 (validMask!0 mask!2687)))

(assert (=> d!155149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642602)))

(declare-fun b!1470034 () Bool)

(assert (=> b!1470034 (= e!825186 (Intermediate!12056 false (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470035 () Bool)

(assert (=> b!1470035 (and (bvsge (index!50618 lt!642602) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642602) (size!48343 a!2862)))))

(declare-fun res!998469 () Bool)

(assert (=> b!1470035 (= res!998469 (= (select (arr!47791 a!2862) (index!50618 lt!642602)) (select (arr!47791 a!2862) j!93)))))

(assert (=> b!1470035 (=> res!998469 e!825187)))

(assert (=> b!1470035 (= e!825188 e!825187)))

(declare-fun b!1470036 () Bool)

(assert (=> b!1470036 (= e!825185 e!825186)))

(declare-fun c!135296 () Bool)

(assert (=> b!1470036 (= c!135296 (or (= lt!642603 (select (arr!47791 a!2862) j!93)) (= (bvadd lt!642603 lt!642603) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470037 () Bool)

(assert (=> b!1470037 (= e!825185 (Intermediate!12056 true (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155149 c!135294) b!1470037))

(assert (= (and d!155149 (not c!135294)) b!1470036))

(assert (= (and b!1470036 c!135296) b!1470034))

(assert (= (and b!1470036 (not c!135296)) b!1470033))

(assert (= (and d!155149 c!135295) b!1470030))

(assert (= (and d!155149 (not c!135295)) b!1470032))

(assert (= (and b!1470032 res!998470) b!1470035))

(assert (= (and b!1470035 (not res!998469)) b!1470031))

(assert (= (and b!1470031 (not res!998468)) b!1470029))

(assert (=> d!155149 m!1356489))

(declare-fun m!1356663 () Bool)

(assert (=> d!155149 m!1356663))

(assert (=> d!155149 m!1356483))

(declare-fun m!1356665 () Bool)

(assert (=> b!1470029 m!1356665))

(assert (=> b!1470033 m!1356489))

(declare-fun m!1356667 () Bool)

(assert (=> b!1470033 m!1356667))

(assert (=> b!1470033 m!1356667))

(assert (=> b!1470033 m!1356487))

(declare-fun m!1356669 () Bool)

(assert (=> b!1470033 m!1356669))

(assert (=> b!1470031 m!1356665))

(assert (=> b!1470035 m!1356665))

(assert (=> b!1469833 d!155149))

(declare-fun d!155151 () Bool)

(declare-fun lt!642607 () (_ BitVec 32))

(declare-fun lt!642606 () (_ BitVec 32))

(assert (=> d!155151 (= lt!642607 (bvmul (bvxor lt!642606 (bvlshr lt!642606 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155151 (= lt!642606 ((_ extract 31 0) (bvand (bvxor (select (arr!47791 a!2862) j!93) (bvlshr (select (arr!47791 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155151 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!998461 (let ((h!35719 ((_ extract 31 0) (bvand (bvxor (select (arr!47791 a!2862) j!93) (bvlshr (select (arr!47791 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132193 (bvmul (bvxor h!35719 (bvlshr h!35719 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132193 (bvlshr x!132193 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!998461 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!998461 #b00000000000000000000000000000000))))))

(assert (=> d!155151 (= (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) (bvand (bvxor lt!642607 (bvlshr lt!642607 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1469833 d!155151))

(declare-fun b!1470051 () Bool)

(declare-fun lt!642608 () SeekEntryResult!12056)

(assert (=> b!1470051 (and (bvsge (index!50618 lt!642608) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642608) (size!48343 a!2862)))))

(declare-fun e!825199 () Bool)

(assert (=> b!1470051 (= e!825199 (= (select (arr!47791 a!2862) (index!50618 lt!642608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470052 () Bool)

(declare-fun e!825201 () Bool)

(assert (=> b!1470052 (= e!825201 (bvsge (x!132188 lt!642608) #b01111111111111111111111111111110))))

(declare-fun b!1470053 () Bool)

(assert (=> b!1470053 (and (bvsge (index!50618 lt!642608) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642608) (size!48343 a!2862)))))

(declare-fun res!998476 () Bool)

(assert (=> b!1470053 (= res!998476 (= (select (arr!47791 a!2862) (index!50618 lt!642608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470053 (=> res!998476 e!825199)))

(declare-fun b!1470054 () Bool)

(declare-fun e!825200 () Bool)

(assert (=> b!1470054 (= e!825201 e!825200)))

(declare-fun res!998478 () Bool)

(assert (=> b!1470054 (= res!998478 (and ((_ is Intermediate!12056) lt!642608) (not (undefined!12868 lt!642608)) (bvslt (x!132188 lt!642608) #b01111111111111111111111111111110) (bvsge (x!132188 lt!642608) #b00000000000000000000000000000000) (bvsge (x!132188 lt!642608) x!665)))))

(assert (=> b!1470054 (=> (not res!998478) (not e!825200))))

(declare-fun b!1470055 () Bool)

(declare-fun e!825198 () SeekEntryResult!12056)

(assert (=> b!1470055 (= e!825198 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47791 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155153 () Bool)

(assert (=> d!155153 e!825201))

(declare-fun c!135301 () Bool)

(assert (=> d!155153 (= c!135301 (and ((_ is Intermediate!12056) lt!642608) (undefined!12868 lt!642608)))))

(declare-fun e!825197 () SeekEntryResult!12056)

(assert (=> d!155153 (= lt!642608 e!825197)))

(declare-fun c!135300 () Bool)

(assert (=> d!155153 (= c!135300 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!642609 () (_ BitVec 64))

(assert (=> d!155153 (= lt!642609 (select (arr!47791 a!2862) index!646))))

(assert (=> d!155153 (validMask!0 mask!2687)))

(assert (=> d!155153 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642608)))

(declare-fun b!1470056 () Bool)

(assert (=> b!1470056 (= e!825198 (Intermediate!12056 false index!646 x!665))))

(declare-fun b!1470057 () Bool)

(assert (=> b!1470057 (and (bvsge (index!50618 lt!642608) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642608) (size!48343 a!2862)))))

(declare-fun res!998477 () Bool)

(assert (=> b!1470057 (= res!998477 (= (select (arr!47791 a!2862) (index!50618 lt!642608)) (select (arr!47791 a!2862) j!93)))))

(assert (=> b!1470057 (=> res!998477 e!825199)))

(assert (=> b!1470057 (= e!825200 e!825199)))

(declare-fun b!1470058 () Bool)

(assert (=> b!1470058 (= e!825197 e!825198)))

(declare-fun c!135302 () Bool)

(assert (=> b!1470058 (= c!135302 (or (= lt!642609 (select (arr!47791 a!2862) j!93)) (= (bvadd lt!642609 lt!642609) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470059 () Bool)

(assert (=> b!1470059 (= e!825197 (Intermediate!12056 true index!646 x!665))))

(assert (= (and d!155153 c!135300) b!1470059))

(assert (= (and d!155153 (not c!135300)) b!1470058))

(assert (= (and b!1470058 c!135302) b!1470056))

(assert (= (and b!1470058 (not c!135302)) b!1470055))

(assert (= (and d!155153 c!135301) b!1470052))

(assert (= (and d!155153 (not c!135301)) b!1470054))

(assert (= (and b!1470054 res!998478) b!1470057))

(assert (= (and b!1470057 (not res!998477)) b!1470053))

(assert (= (and b!1470053 (not res!998476)) b!1470051))

(declare-fun m!1356679 () Bool)

(assert (=> d!155153 m!1356679))

(assert (=> d!155153 m!1356483))

(declare-fun m!1356681 () Bool)

(assert (=> b!1470051 m!1356681))

(declare-fun m!1356683 () Bool)

(assert (=> b!1470055 m!1356683))

(assert (=> b!1470055 m!1356683))

(assert (=> b!1470055 m!1356487))

(declare-fun m!1356685 () Bool)

(assert (=> b!1470055 m!1356685))

(assert (=> b!1470053 m!1356681))

(assert (=> b!1470057 m!1356681))

(assert (=> b!1469836 d!155153))

(declare-fun b!1470105 () Bool)

(declare-fun e!825234 () SeekEntryResult!12056)

(assert (=> b!1470105 (= e!825234 (MissingVacant!12056 intermediateAfterIndex!19))))

(declare-fun b!1470107 () Bool)

(assert (=> b!1470107 (= e!825234 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!642521 lt!642518 mask!2687))))

(declare-fun b!1470108 () Bool)

(declare-fun e!825232 () SeekEntryResult!12056)

(assert (=> b!1470108 (= e!825232 (Found!12056 index!646))))

(declare-fun b!1470109 () Bool)

(declare-fun e!825233 () SeekEntryResult!12056)

(assert (=> b!1470109 (= e!825233 Undefined!12056)))

(declare-fun b!1470110 () Bool)

(assert (=> b!1470110 (= e!825233 e!825232)))

(declare-fun c!135319 () Bool)

(declare-fun lt!642647 () (_ BitVec 64))

(assert (=> b!1470110 (= c!135319 (= lt!642647 lt!642521))))

(declare-fun lt!642649 () SeekEntryResult!12056)

(declare-fun d!155157 () Bool)

(assert (=> d!155157 (and (or ((_ is Undefined!12056) lt!642649) (not ((_ is Found!12056) lt!642649)) (and (bvsge (index!50617 lt!642649) #b00000000000000000000000000000000) (bvslt (index!50617 lt!642649) (size!48343 lt!642518)))) (or ((_ is Undefined!12056) lt!642649) ((_ is Found!12056) lt!642649) (not ((_ is MissingVacant!12056) lt!642649)) (not (= (index!50619 lt!642649) intermediateAfterIndex!19)) (and (bvsge (index!50619 lt!642649) #b00000000000000000000000000000000) (bvslt (index!50619 lt!642649) (size!48343 lt!642518)))) (or ((_ is Undefined!12056) lt!642649) (ite ((_ is Found!12056) lt!642649) (= (select (arr!47791 lt!642518) (index!50617 lt!642649)) lt!642521) (and ((_ is MissingVacant!12056) lt!642649) (= (index!50619 lt!642649) intermediateAfterIndex!19) (= (select (arr!47791 lt!642518) (index!50619 lt!642649)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155157 (= lt!642649 e!825233)))

(declare-fun c!135321 () Bool)

(assert (=> d!155157 (= c!135321 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155157 (= lt!642647 (select (arr!47791 lt!642518) index!646))))

(assert (=> d!155157 (validMask!0 mask!2687)))

(assert (=> d!155157 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642521 lt!642518 mask!2687) lt!642649)))

(declare-fun b!1470106 () Bool)

(declare-fun c!135320 () Bool)

(assert (=> b!1470106 (= c!135320 (= lt!642647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470106 (= e!825232 e!825234)))

(assert (= (and d!155157 c!135321) b!1470109))

(assert (= (and d!155157 (not c!135321)) b!1470110))

(assert (= (and b!1470110 c!135319) b!1470108))

(assert (= (and b!1470110 (not c!135319)) b!1470106))

(assert (= (and b!1470106 c!135320) b!1470105))

(assert (= (and b!1470106 (not c!135320)) b!1470107))

(assert (=> b!1470107 m!1356683))

(assert (=> b!1470107 m!1356683))

(declare-fun m!1356727 () Bool)

(assert (=> b!1470107 m!1356727))

(declare-fun m!1356729 () Bool)

(assert (=> d!155157 m!1356729))

(declare-fun m!1356731 () Bool)

(assert (=> d!155157 m!1356731))

(declare-fun m!1356733 () Bool)

(assert (=> d!155157 m!1356733))

(assert (=> d!155157 m!1356483))

(assert (=> b!1469835 d!155157))

(declare-fun b!1470120 () Bool)

(declare-fun c!135325 () Bool)

(declare-fun lt!642653 () (_ BitVec 64))

(assert (=> b!1470120 (= c!135325 (= lt!642653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825241 () SeekEntryResult!12056)

(declare-fun e!825240 () SeekEntryResult!12056)

(assert (=> b!1470120 (= e!825241 e!825240)))

(declare-fun b!1470121 () Bool)

(declare-fun lt!642654 () SeekEntryResult!12056)

(assert (=> b!1470121 (= e!825241 (Found!12056 (index!50618 lt!642654)))))

(declare-fun b!1470122 () Bool)

(declare-fun e!825242 () SeekEntryResult!12056)

(assert (=> b!1470122 (= e!825242 Undefined!12056)))

(declare-fun b!1470123 () Bool)

(assert (=> b!1470123 (= e!825240 (seekKeyOrZeroReturnVacant!0 (x!132188 lt!642654) (index!50618 lt!642654) (index!50618 lt!642654) lt!642521 lt!642518 mask!2687))))

(declare-fun d!155175 () Bool)

(declare-fun lt!642652 () SeekEntryResult!12056)

(assert (=> d!155175 (and (or ((_ is Undefined!12056) lt!642652) (not ((_ is Found!12056) lt!642652)) (and (bvsge (index!50617 lt!642652) #b00000000000000000000000000000000) (bvslt (index!50617 lt!642652) (size!48343 lt!642518)))) (or ((_ is Undefined!12056) lt!642652) ((_ is Found!12056) lt!642652) (not ((_ is MissingZero!12056) lt!642652)) (and (bvsge (index!50616 lt!642652) #b00000000000000000000000000000000) (bvslt (index!50616 lt!642652) (size!48343 lt!642518)))) (or ((_ is Undefined!12056) lt!642652) ((_ is Found!12056) lt!642652) ((_ is MissingZero!12056) lt!642652) (not ((_ is MissingVacant!12056) lt!642652)) (and (bvsge (index!50619 lt!642652) #b00000000000000000000000000000000) (bvslt (index!50619 lt!642652) (size!48343 lt!642518)))) (or ((_ is Undefined!12056) lt!642652) (ite ((_ is Found!12056) lt!642652) (= (select (arr!47791 lt!642518) (index!50617 lt!642652)) lt!642521) (ite ((_ is MissingZero!12056) lt!642652) (= (select (arr!47791 lt!642518) (index!50616 lt!642652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12056) lt!642652) (= (select (arr!47791 lt!642518) (index!50619 lt!642652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155175 (= lt!642652 e!825242)))

(declare-fun c!135327 () Bool)

(assert (=> d!155175 (= c!135327 (and ((_ is Intermediate!12056) lt!642654) (undefined!12868 lt!642654)))))

(assert (=> d!155175 (= lt!642654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642521 mask!2687) lt!642521 lt!642518 mask!2687))))

(assert (=> d!155175 (validMask!0 mask!2687)))

(assert (=> d!155175 (= (seekEntryOrOpen!0 lt!642521 lt!642518 mask!2687) lt!642652)))

(declare-fun b!1470124 () Bool)

(assert (=> b!1470124 (= e!825240 (MissingZero!12056 (index!50618 lt!642654)))))

(declare-fun b!1470125 () Bool)

(assert (=> b!1470125 (= e!825242 e!825241)))

(assert (=> b!1470125 (= lt!642653 (select (arr!47791 lt!642518) (index!50618 lt!642654)))))

(declare-fun c!135326 () Bool)

(assert (=> b!1470125 (= c!135326 (= lt!642653 lt!642521))))

(assert (= (and d!155175 c!135327) b!1470122))

(assert (= (and d!155175 (not c!135327)) b!1470125))

(assert (= (and b!1470125 c!135326) b!1470121))

(assert (= (and b!1470125 (not c!135326)) b!1470120))

(assert (= (and b!1470120 c!135325) b!1470124))

(assert (= (and b!1470120 (not c!135325)) b!1470123))

(declare-fun m!1356743 () Bool)

(assert (=> b!1470123 m!1356743))

(declare-fun m!1356745 () Bool)

(assert (=> d!155175 m!1356745))

(assert (=> d!155175 m!1356509))

(declare-fun m!1356747 () Bool)

(assert (=> d!155175 m!1356747))

(assert (=> d!155175 m!1356509))

(assert (=> d!155175 m!1356511))

(declare-fun m!1356749 () Bool)

(assert (=> d!155175 m!1356749))

(assert (=> d!155175 m!1356483))

(declare-fun m!1356751 () Bool)

(assert (=> b!1470125 m!1356751))

(assert (=> b!1469835 d!155175))

(declare-fun b!1470126 () Bool)

(declare-fun lt!642655 () SeekEntryResult!12056)

(assert (=> b!1470126 (and (bvsge (index!50618 lt!642655) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642655) (size!48343 lt!642518)))))

(declare-fun e!825245 () Bool)

(assert (=> b!1470126 (= e!825245 (= (select (arr!47791 lt!642518) (index!50618 lt!642655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470127 () Bool)

(declare-fun e!825247 () Bool)

(assert (=> b!1470127 (= e!825247 (bvsge (x!132188 lt!642655) #b01111111111111111111111111111110))))

(declare-fun b!1470128 () Bool)

(assert (=> b!1470128 (and (bvsge (index!50618 lt!642655) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642655) (size!48343 lt!642518)))))

(declare-fun res!998498 () Bool)

(assert (=> b!1470128 (= res!998498 (= (select (arr!47791 lt!642518) (index!50618 lt!642655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470128 (=> res!998498 e!825245)))

(declare-fun b!1470129 () Bool)

(declare-fun e!825246 () Bool)

(assert (=> b!1470129 (= e!825247 e!825246)))

(declare-fun res!998500 () Bool)

(assert (=> b!1470129 (= res!998500 (and ((_ is Intermediate!12056) lt!642655) (not (undefined!12868 lt!642655)) (bvslt (x!132188 lt!642655) #b01111111111111111111111111111110) (bvsge (x!132188 lt!642655) #b00000000000000000000000000000000) (bvsge (x!132188 lt!642655) x!665)))))

(assert (=> b!1470129 (=> (not res!998500) (not e!825246))))

(declare-fun b!1470130 () Bool)

(declare-fun e!825244 () SeekEntryResult!12056)

(assert (=> b!1470130 (= e!825244 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!642521 lt!642518 mask!2687))))

(declare-fun d!155179 () Bool)

(assert (=> d!155179 e!825247))

(declare-fun c!135329 () Bool)

(assert (=> d!155179 (= c!135329 (and ((_ is Intermediate!12056) lt!642655) (undefined!12868 lt!642655)))))

(declare-fun e!825243 () SeekEntryResult!12056)

(assert (=> d!155179 (= lt!642655 e!825243)))

(declare-fun c!135328 () Bool)

(assert (=> d!155179 (= c!135328 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!642656 () (_ BitVec 64))

(assert (=> d!155179 (= lt!642656 (select (arr!47791 lt!642518) index!646))))

(assert (=> d!155179 (validMask!0 mask!2687)))

(assert (=> d!155179 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642521 lt!642518 mask!2687) lt!642655)))

(declare-fun b!1470131 () Bool)

(assert (=> b!1470131 (= e!825244 (Intermediate!12056 false index!646 x!665))))

(declare-fun b!1470132 () Bool)

(assert (=> b!1470132 (and (bvsge (index!50618 lt!642655) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642655) (size!48343 lt!642518)))))

(declare-fun res!998499 () Bool)

(assert (=> b!1470132 (= res!998499 (= (select (arr!47791 lt!642518) (index!50618 lt!642655)) lt!642521))))

(assert (=> b!1470132 (=> res!998499 e!825245)))

(assert (=> b!1470132 (= e!825246 e!825245)))

(declare-fun b!1470133 () Bool)

(assert (=> b!1470133 (= e!825243 e!825244)))

(declare-fun c!135330 () Bool)

(assert (=> b!1470133 (= c!135330 (or (= lt!642656 lt!642521) (= (bvadd lt!642656 lt!642656) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470134 () Bool)

(assert (=> b!1470134 (= e!825243 (Intermediate!12056 true index!646 x!665))))

(assert (= (and d!155179 c!135328) b!1470134))

(assert (= (and d!155179 (not c!135328)) b!1470133))

(assert (= (and b!1470133 c!135330) b!1470131))

(assert (= (and b!1470133 (not c!135330)) b!1470130))

(assert (= (and d!155179 c!135329) b!1470127))

(assert (= (and d!155179 (not c!135329)) b!1470129))

(assert (= (and b!1470129 res!998500) b!1470132))

(assert (= (and b!1470132 (not res!998499)) b!1470128))

(assert (= (and b!1470128 (not res!998498)) b!1470126))

(assert (=> d!155179 m!1356733))

(assert (=> d!155179 m!1356483))

(declare-fun m!1356753 () Bool)

(assert (=> b!1470126 m!1356753))

(assert (=> b!1470130 m!1356683))

(assert (=> b!1470130 m!1356683))

(declare-fun m!1356755 () Bool)

(assert (=> b!1470130 m!1356755))

(assert (=> b!1470128 m!1356753))

(assert (=> b!1470132 m!1356753))

(assert (=> b!1469834 d!155179))

(declare-fun d!155181 () Bool)

(assert (=> d!155181 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125578 d!155181))

(declare-fun d!155187 () Bool)

(assert (=> d!155187 (= (array_inv!37024 a!2862) (bvsge (size!48343 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125578 d!155187))

(declare-fun d!155189 () Bool)

(assert (=> d!155189 (= (validKeyInArray!0 (select (arr!47791 a!2862) i!1006)) (and (not (= (select (arr!47791 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47791 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1469827 d!155189))

(declare-fun b!1470172 () Bool)

(declare-fun e!825274 () Bool)

(declare-fun e!825273 () Bool)

(assert (=> b!1470172 (= e!825274 e!825273)))

(declare-fun c!135342 () Bool)

(assert (=> b!1470172 (= c!135342 (validKeyInArray!0 (select (arr!47791 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470173 () Bool)

(declare-fun call!67681 () Bool)

(assert (=> b!1470173 (= e!825273 call!67681)))

(declare-fun d!155191 () Bool)

(declare-fun res!998519 () Bool)

(declare-fun e!825272 () Bool)

(assert (=> d!155191 (=> res!998519 e!825272)))

(assert (=> d!155191 (= res!998519 (bvsge #b00000000000000000000000000000000 (size!48343 a!2862)))))

(assert (=> d!155191 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34367) e!825272)))

(declare-fun bm!67678 () Bool)

(assert (=> bm!67678 (= call!67681 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135342 (Cons!34366 (select (arr!47791 a!2862) #b00000000000000000000000000000000) Nil!34367) Nil!34367)))))

(declare-fun b!1470174 () Bool)

(declare-fun e!825271 () Bool)

(declare-fun contains!9861 (List!34370 (_ BitVec 64)) Bool)

(assert (=> b!1470174 (= e!825271 (contains!9861 Nil!34367 (select (arr!47791 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470175 () Bool)

(assert (=> b!1470175 (= e!825272 e!825274)))

(declare-fun res!998518 () Bool)

(assert (=> b!1470175 (=> (not res!998518) (not e!825274))))

(assert (=> b!1470175 (= res!998518 (not e!825271))))

(declare-fun res!998517 () Bool)

(assert (=> b!1470175 (=> (not res!998517) (not e!825271))))

(assert (=> b!1470175 (= res!998517 (validKeyInArray!0 (select (arr!47791 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470176 () Bool)

(assert (=> b!1470176 (= e!825273 call!67681)))

(assert (= (and d!155191 (not res!998519)) b!1470175))

(assert (= (and b!1470175 res!998517) b!1470174))

(assert (= (and b!1470175 res!998518) b!1470172))

(assert (= (and b!1470172 c!135342) b!1470173))

(assert (= (and b!1470172 (not c!135342)) b!1470176))

(assert (= (or b!1470173 b!1470176) bm!67678))

(assert (=> b!1470172 m!1356615))

(assert (=> b!1470172 m!1356615))

(assert (=> b!1470172 m!1356625))

(assert (=> bm!67678 m!1356615))

(declare-fun m!1356765 () Bool)

(assert (=> bm!67678 m!1356765))

(assert (=> b!1470174 m!1356615))

(assert (=> b!1470174 m!1356615))

(declare-fun m!1356767 () Bool)

(assert (=> b!1470174 m!1356767))

(assert (=> b!1470175 m!1356615))

(assert (=> b!1470175 m!1356615))

(assert (=> b!1470175 m!1356625))

(assert (=> b!1469837 d!155191))

(check-sat (not d!155149) (not d!155179) (not b!1469941) (not b!1470033) (not b!1470175) (not b!1470107) (not d!155175) (not b!1469963) (not b!1470172) (not d!155153) (not d!155157) (not b!1469959) (not bm!67678) (not b!1470055) (not d!155133) (not b!1470123) (not d!155139) (not bm!67667) (not b!1470130) (not b!1470000) (not b!1469962) (not b!1469940) (not d!155137) (not b!1470174) (not bm!67668))
(check-sat)
