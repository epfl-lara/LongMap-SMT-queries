; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126810 () Bool)

(assert start!126810)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99610 0))(
  ( (array!99611 (arr!48076 (Array (_ BitVec 32) (_ BitVec 64))) (size!48627 (_ BitVec 32))) )
))
(declare-fun lt!648433 () array!99610)

(declare-fun b!1486256 () Bool)

(declare-fun lt!648434 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!833400 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12213 0))(
  ( (MissingZero!12213 (index!51244 (_ BitVec 32))) (Found!12213 (index!51245 (_ BitVec 32))) (Intermediate!12213 (undefined!13025 Bool) (index!51246 (_ BitVec 32)) (x!133010 (_ BitVec 32))) (Undefined!12213) (MissingVacant!12213 (index!51247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99610 (_ BitVec 32)) SeekEntryResult!12213)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99610 (_ BitVec 32)) SeekEntryResult!12213)

(assert (=> b!1486256 (= e!833400 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648434 lt!648433 mask!2687) (seekEntryOrOpen!0 lt!648434 lt!648433 mask!2687)))))

(declare-fun b!1486257 () Bool)

(declare-fun res!1009929 () Bool)

(declare-fun e!833397 () Bool)

(assert (=> b!1486257 (=> (not res!1009929) (not e!833397))))

(declare-fun a!2862 () array!99610)

(declare-datatypes ((List!34564 0))(
  ( (Nil!34561) (Cons!34560 (h!35948 (_ BitVec 64)) (t!49250 List!34564)) )
))
(declare-fun arrayNoDuplicates!0 (array!99610 (_ BitVec 32) List!34564) Bool)

(assert (=> b!1486257 (= res!1009929 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34561))))

(declare-fun b!1486258 () Bool)

(declare-fun res!1009943 () Bool)

(declare-fun e!833391 () Bool)

(assert (=> b!1486258 (=> (not res!1009943) (not e!833391))))

(assert (=> b!1486258 (= res!1009943 e!833400)))

(declare-fun c!137698 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486258 (= c!137698 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486259 () Bool)

(declare-fun res!1009930 () Bool)

(assert (=> b!1486259 (=> (not res!1009930) (not e!833397))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486259 (= res!1009930 (validKeyInArray!0 (select (arr!48076 a!2862) j!93)))))

(declare-fun b!1486260 () Bool)

(declare-fun e!833393 () Bool)

(assert (=> b!1486260 (= e!833393 (= (seekEntryOrOpen!0 lt!648434 lt!648433 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648434 lt!648433 mask!2687)))))

(declare-fun b!1486261 () Bool)

(declare-fun res!1009935 () Bool)

(assert (=> b!1486261 (=> (not res!1009935) (not e!833397))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486261 (= res!1009935 (validKeyInArray!0 (select (arr!48076 a!2862) i!1006)))))

(declare-fun b!1486262 () Bool)

(declare-fun res!1009931 () Bool)

(declare-fun e!833392 () Bool)

(assert (=> b!1486262 (=> (not res!1009931) (not e!833392))))

(assert (=> b!1486262 (= res!1009931 (= (seekEntryOrOpen!0 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) (Found!12213 j!93)))))

(declare-fun b!1486263 () Bool)

(declare-fun e!833394 () Bool)

(assert (=> b!1486263 (= e!833397 e!833394)))

(declare-fun res!1009942 () Bool)

(assert (=> b!1486263 (=> (not res!1009942) (not e!833394))))

(assert (=> b!1486263 (= res!1009942 (= (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486263 (= lt!648433 (array!99611 (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48627 a!2862)))))

(declare-fun b!1486264 () Bool)

(declare-fun res!1009941 () Bool)

(assert (=> b!1486264 (=> (not res!1009941) (not e!833397))))

(assert (=> b!1486264 (= res!1009941 (and (= (size!48627 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48627 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48627 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486265 () Bool)

(declare-fun e!833396 () Bool)

(assert (=> b!1486265 (= e!833396 e!833391)))

(declare-fun res!1009933 () Bool)

(assert (=> b!1486265 (=> (not res!1009933) (not e!833391))))

(declare-fun lt!648439 () SeekEntryResult!12213)

(assert (=> b!1486265 (= res!1009933 (= lt!648439 (Intermediate!12213 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99610 (_ BitVec 32)) SeekEntryResult!12213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486265 (= lt!648439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648434 mask!2687) lt!648434 lt!648433 mask!2687))))

(assert (=> b!1486265 (= lt!648434 (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486266 () Bool)

(declare-fun res!1009940 () Bool)

(assert (=> b!1486266 (=> (not res!1009940) (not e!833397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99610 (_ BitVec 32)) Bool)

(assert (=> b!1486266 (= res!1009940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1009927 () Bool)

(assert (=> start!126810 (=> (not res!1009927) (not e!833397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126810 (= res!1009927 (validMask!0 mask!2687))))

(assert (=> start!126810 e!833397))

(assert (=> start!126810 true))

(declare-fun array_inv!37357 (array!99610) Bool)

(assert (=> start!126810 (array_inv!37357 a!2862)))

(declare-fun b!1486267 () Bool)

(declare-fun e!833395 () Bool)

(assert (=> b!1486267 (= e!833395 e!833393)))

(declare-fun res!1009934 () Bool)

(assert (=> b!1486267 (=> (not res!1009934) (not e!833393))))

(declare-fun lt!648435 () (_ BitVec 64))

(assert (=> b!1486267 (= res!1009934 (and (= index!646 intermediateAfterIndex!19) (= lt!648435 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486268 () Bool)

(declare-fun res!1009926 () Bool)

(assert (=> b!1486268 (=> (not res!1009926) (not e!833396))))

(declare-fun lt!648437 () SeekEntryResult!12213)

(assert (=> b!1486268 (= res!1009926 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!648437))))

(declare-fun b!1486269 () Bool)

(declare-fun res!1009932 () Bool)

(assert (=> b!1486269 (=> (not res!1009932) (not e!833391))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486269 (= res!1009932 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486270 () Bool)

(declare-fun e!833398 () Bool)

(assert (=> b!1486270 (= e!833391 (not e!833398))))

(declare-fun res!1009936 () Bool)

(assert (=> b!1486270 (=> res!1009936 e!833398)))

(assert (=> b!1486270 (= res!1009936 (or (and (= (select (arr!48076 a!2862) index!646) (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48076 a!2862) index!646) (select (arr!48076 a!2862) j!93))) (= (select (arr!48076 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486270 e!833392))

(declare-fun res!1009928 () Bool)

(assert (=> b!1486270 (=> (not res!1009928) (not e!833392))))

(assert (=> b!1486270 (= res!1009928 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49799 0))(
  ( (Unit!49800) )
))
(declare-fun lt!648436 () Unit!49799)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49799)

(assert (=> b!1486270 (= lt!648436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486271 () Bool)

(assert (=> b!1486271 (= e!833392 e!833395)))

(declare-fun res!1009938 () Bool)

(assert (=> b!1486271 (=> res!1009938 e!833395)))

(assert (=> b!1486271 (= res!1009938 (or (and (= (select (arr!48076 a!2862) index!646) lt!648435) (= (select (arr!48076 a!2862) index!646) (select (arr!48076 a!2862) j!93))) (= (select (arr!48076 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486271 (= lt!648435 (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486272 () Bool)

(assert (=> b!1486272 (= e!833398 true)))

(declare-fun lt!648438 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486272 (= lt!648438 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1486273 () Bool)

(declare-fun res!1009925 () Bool)

(assert (=> b!1486273 (=> (not res!1009925) (not e!833392))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486273 (= res!1009925 (or (= (select (arr!48076 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48076 a!2862) intermediateBeforeIndex!19) (select (arr!48076 a!2862) j!93))))))

(declare-fun b!1486274 () Bool)

(assert (=> b!1486274 (= e!833400 (= lt!648439 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648434 lt!648433 mask!2687)))))

(declare-fun b!1486275 () Bool)

(declare-fun res!1009939 () Bool)

(assert (=> b!1486275 (=> (not res!1009939) (not e!833397))))

(assert (=> b!1486275 (= res!1009939 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48627 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48627 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48627 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486276 () Bool)

(assert (=> b!1486276 (= e!833394 e!833396)))

(declare-fun res!1009937 () Bool)

(assert (=> b!1486276 (=> (not res!1009937) (not e!833396))))

(assert (=> b!1486276 (= res!1009937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48076 a!2862) j!93) mask!2687) (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!648437))))

(assert (=> b!1486276 (= lt!648437 (Intermediate!12213 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126810 res!1009927) b!1486264))

(assert (= (and b!1486264 res!1009941) b!1486261))

(assert (= (and b!1486261 res!1009935) b!1486259))

(assert (= (and b!1486259 res!1009930) b!1486266))

(assert (= (and b!1486266 res!1009940) b!1486257))

(assert (= (and b!1486257 res!1009929) b!1486275))

(assert (= (and b!1486275 res!1009939) b!1486263))

(assert (= (and b!1486263 res!1009942) b!1486276))

(assert (= (and b!1486276 res!1009937) b!1486268))

(assert (= (and b!1486268 res!1009926) b!1486265))

(assert (= (and b!1486265 res!1009933) b!1486258))

(assert (= (and b!1486258 c!137698) b!1486274))

(assert (= (and b!1486258 (not c!137698)) b!1486256))

(assert (= (and b!1486258 res!1009943) b!1486269))

(assert (= (and b!1486269 res!1009932) b!1486270))

(assert (= (and b!1486270 res!1009928) b!1486262))

(assert (= (and b!1486262 res!1009931) b!1486273))

(assert (= (and b!1486273 res!1009925) b!1486271))

(assert (= (and b!1486271 (not res!1009938)) b!1486267))

(assert (= (and b!1486267 res!1009934) b!1486260))

(assert (= (and b!1486270 (not res!1009936)) b!1486272))

(declare-fun m!1371523 () Bool)

(assert (=> b!1486272 m!1371523))

(declare-fun m!1371525 () Bool)

(assert (=> b!1486266 m!1371525))

(declare-fun m!1371527 () Bool)

(assert (=> b!1486261 m!1371527))

(assert (=> b!1486261 m!1371527))

(declare-fun m!1371529 () Bool)

(assert (=> b!1486261 m!1371529))

(declare-fun m!1371531 () Bool)

(assert (=> start!126810 m!1371531))

(declare-fun m!1371533 () Bool)

(assert (=> start!126810 m!1371533))

(declare-fun m!1371535 () Bool)

(assert (=> b!1486270 m!1371535))

(declare-fun m!1371537 () Bool)

(assert (=> b!1486270 m!1371537))

(declare-fun m!1371539 () Bool)

(assert (=> b!1486270 m!1371539))

(declare-fun m!1371541 () Bool)

(assert (=> b!1486270 m!1371541))

(declare-fun m!1371543 () Bool)

(assert (=> b!1486270 m!1371543))

(declare-fun m!1371545 () Bool)

(assert (=> b!1486270 m!1371545))

(declare-fun m!1371547 () Bool)

(assert (=> b!1486257 m!1371547))

(assert (=> b!1486259 m!1371545))

(assert (=> b!1486259 m!1371545))

(declare-fun m!1371549 () Bool)

(assert (=> b!1486259 m!1371549))

(assert (=> b!1486276 m!1371545))

(assert (=> b!1486276 m!1371545))

(declare-fun m!1371551 () Bool)

(assert (=> b!1486276 m!1371551))

(assert (=> b!1486276 m!1371551))

(assert (=> b!1486276 m!1371545))

(declare-fun m!1371553 () Bool)

(assert (=> b!1486276 m!1371553))

(declare-fun m!1371555 () Bool)

(assert (=> b!1486260 m!1371555))

(declare-fun m!1371557 () Bool)

(assert (=> b!1486260 m!1371557))

(declare-fun m!1371559 () Bool)

(assert (=> b!1486273 m!1371559))

(assert (=> b!1486273 m!1371545))

(assert (=> b!1486271 m!1371541))

(assert (=> b!1486271 m!1371545))

(assert (=> b!1486271 m!1371537))

(assert (=> b!1486271 m!1371539))

(assert (=> b!1486262 m!1371545))

(assert (=> b!1486262 m!1371545))

(declare-fun m!1371561 () Bool)

(assert (=> b!1486262 m!1371561))

(assert (=> b!1486263 m!1371537))

(declare-fun m!1371563 () Bool)

(assert (=> b!1486263 m!1371563))

(declare-fun m!1371565 () Bool)

(assert (=> b!1486274 m!1371565))

(assert (=> b!1486268 m!1371545))

(assert (=> b!1486268 m!1371545))

(declare-fun m!1371567 () Bool)

(assert (=> b!1486268 m!1371567))

(assert (=> b!1486256 m!1371557))

(assert (=> b!1486256 m!1371555))

(declare-fun m!1371569 () Bool)

(assert (=> b!1486265 m!1371569))

(assert (=> b!1486265 m!1371569))

(declare-fun m!1371571 () Bool)

(assert (=> b!1486265 m!1371571))

(assert (=> b!1486265 m!1371537))

(declare-fun m!1371573 () Bool)

(assert (=> b!1486265 m!1371573))

(check-sat (not b!1486272) (not b!1486265) (not b!1486259) (not b!1486276) (not b!1486270) (not b!1486274) (not start!126810) (not b!1486256) (not b!1486257) (not b!1486260) (not b!1486262) (not b!1486261) (not b!1486268) (not b!1486266))
(check-sat)
