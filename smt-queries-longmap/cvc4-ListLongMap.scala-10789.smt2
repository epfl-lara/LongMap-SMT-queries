; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126236 () Bool)

(assert start!126236)

(declare-fun b!1479360 () Bool)

(declare-fun res!1005289 () Bool)

(declare-fun e!829808 () Bool)

(assert (=> b!1479360 (=> (not res!1005289) (not e!829808))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479360 (= res!1005289 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479361 () Bool)

(declare-fun e!829813 () Bool)

(declare-datatypes ((SeekEntryResult!12190 0))(
  ( (MissingZero!12190 (index!51152 (_ BitVec 32))) (Found!12190 (index!51153 (_ BitVec 32))) (Intermediate!12190 (undefined!13002 Bool) (index!51154 (_ BitVec 32)) (x!132733 (_ BitVec 32))) (Undefined!12190) (MissingVacant!12190 (index!51155 (_ BitVec 32))) )
))
(declare-fun lt!645995 () SeekEntryResult!12190)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!645998 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99342 0))(
  ( (array!99343 (arr!47950 (Array (_ BitVec 32) (_ BitVec 64))) (size!48500 (_ BitVec 32))) )
))
(declare-fun lt!645997 () array!99342)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99342 (_ BitVec 32)) SeekEntryResult!12190)

(assert (=> b!1479361 (= e!829813 (= lt!645995 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645998 lt!645997 mask!2687)))))

(declare-fun b!1479362 () Bool)

(declare-fun res!1005284 () Bool)

(assert (=> b!1479362 (=> (not res!1005284) (not e!829808))))

(assert (=> b!1479362 (= res!1005284 e!829813)))

(declare-fun c!136563 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479362 (= c!136563 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479363 () Bool)

(declare-fun res!1005279 () Bool)

(declare-fun e!829810 () Bool)

(assert (=> b!1479363 (=> (not res!1005279) (not e!829810))))

(declare-fun a!2862 () array!99342)

(declare-datatypes ((List!34451 0))(
  ( (Nil!34448) (Cons!34447 (h!35815 (_ BitVec 64)) (t!49145 List!34451)) )
))
(declare-fun arrayNoDuplicates!0 (array!99342 (_ BitVec 32) List!34451) Bool)

(assert (=> b!1479363 (= res!1005279 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34448))))

(declare-fun e!829814 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1479365 () Bool)

(assert (=> b!1479365 (= e!829814 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479366 () Bool)

(declare-fun e!829811 () Bool)

(declare-fun lt!645994 () SeekEntryResult!12190)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99342 (_ BitVec 32)) SeekEntryResult!12190)

(assert (=> b!1479366 (= e!829811 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!645994))))

(declare-fun b!1479367 () Bool)

(declare-fun res!1005283 () Bool)

(assert (=> b!1479367 (=> (not res!1005283) (not e!829810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479367 (= res!1005283 (validKeyInArray!0 (select (arr!47950 a!2862) j!93)))))

(declare-fun b!1479368 () Bool)

(declare-fun res!1005277 () Bool)

(assert (=> b!1479368 (=> (not res!1005277) (not e!829810))))

(assert (=> b!1479368 (= res!1005277 (validKeyInArray!0 (select (arr!47950 a!2862) i!1006)))))

(declare-fun b!1479369 () Bool)

(declare-fun res!1005288 () Bool)

(declare-fun e!829815 () Bool)

(assert (=> b!1479369 (=> (not res!1005288) (not e!829815))))

(declare-fun lt!645999 () SeekEntryResult!12190)

(assert (=> b!1479369 (= res!1005288 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!645999))))

(declare-fun b!1479370 () Bool)

(declare-fun res!1005273 () Bool)

(assert (=> b!1479370 (=> (not res!1005273) (not e!829810))))

(assert (=> b!1479370 (= res!1005273 (and (= (size!48500 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48500 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48500 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479371 () Bool)

(declare-fun e!829812 () Bool)

(assert (=> b!1479371 (= e!829810 e!829812)))

(declare-fun res!1005286 () Bool)

(assert (=> b!1479371 (=> (not res!1005286) (not e!829812))))

(assert (=> b!1479371 (= res!1005286 (= (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479371 (= lt!645997 (array!99343 (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48500 a!2862)))))

(declare-fun b!1479372 () Bool)

(declare-fun res!1005274 () Bool)

(assert (=> b!1479372 (=> (not res!1005274) (not e!829810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99342 (_ BitVec 32)) Bool)

(assert (=> b!1479372 (= res!1005274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479373 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99342 (_ BitVec 32)) SeekEntryResult!12190)

(assert (=> b!1479373 (= e!829813 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645998 lt!645997 mask!2687) (seekEntryOrOpen!0 lt!645998 lt!645997 mask!2687)))))

(declare-fun b!1479374 () Bool)

(declare-fun e!829809 () Bool)

(declare-fun e!829817 () Bool)

(assert (=> b!1479374 (= e!829809 e!829817)))

(declare-fun res!1005275 () Bool)

(assert (=> b!1479374 (=> res!1005275 e!829817)))

(assert (=> b!1479374 (= res!1005275 (or (and (= (select (arr!47950 a!2862) index!646) (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47950 a!2862) index!646) (select (arr!47950 a!2862) j!93))) (not (= (select (arr!47950 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479375 () Bool)

(assert (=> b!1479375 (= e!829812 e!829815)))

(declare-fun res!1005287 () Bool)

(assert (=> b!1479375 (=> (not res!1005287) (not e!829815))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479375 (= res!1005287 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47950 a!2862) j!93) mask!2687) (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!645999))))

(assert (=> b!1479375 (= lt!645999 (Intermediate!12190 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479376 () Bool)

(assert (=> b!1479376 (= e!829817 e!829814)))

(declare-fun res!1005276 () Bool)

(assert (=> b!1479376 (=> (not res!1005276) (not e!829814))))

(declare-fun lt!645996 () SeekEntryResult!12190)

(assert (=> b!1479376 (= res!1005276 (= lt!645996 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47950 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!1005278 () Bool)

(assert (=> start!126236 (=> (not res!1005278) (not e!829810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126236 (= res!1005278 (validMask!0 mask!2687))))

(assert (=> start!126236 e!829810))

(assert (=> start!126236 true))

(declare-fun array_inv!36978 (array!99342) Bool)

(assert (=> start!126236 (array_inv!36978 a!2862)))

(declare-fun b!1479364 () Bool)

(declare-fun res!1005280 () Bool)

(assert (=> b!1479364 (=> (not res!1005280) (not e!829810))))

(assert (=> b!1479364 (= res!1005280 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48500 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48500 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48500 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479377 () Bool)

(assert (=> b!1479377 (= e!829808 (not e!829811))))

(declare-fun res!1005282 () Bool)

(assert (=> b!1479377 (=> res!1005282 e!829811)))

(assert (=> b!1479377 (= res!1005282 (or (and (= (select (arr!47950 a!2862) index!646) (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47950 a!2862) index!646) (select (arr!47950 a!2862) j!93))) (not (= (select (arr!47950 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479377 e!829809))

(declare-fun res!1005281 () Bool)

(assert (=> b!1479377 (=> (not res!1005281) (not e!829809))))

(assert (=> b!1479377 (= res!1005281 (and (= lt!645996 lt!645994) (or (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) (select (arr!47950 a!2862) j!93)))))))

(assert (=> b!1479377 (= lt!645994 (Found!12190 j!93))))

(assert (=> b!1479377 (= lt!645996 (seekEntryOrOpen!0 (select (arr!47950 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479377 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49720 0))(
  ( (Unit!49721) )
))
(declare-fun lt!645993 () Unit!49720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49720)

(assert (=> b!1479377 (= lt!645993 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479378 () Bool)

(assert (=> b!1479378 (= e!829815 e!829808)))

(declare-fun res!1005285 () Bool)

(assert (=> b!1479378 (=> (not res!1005285) (not e!829808))))

(assert (=> b!1479378 (= res!1005285 (= lt!645995 (Intermediate!12190 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479378 (= lt!645995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645998 mask!2687) lt!645998 lt!645997 mask!2687))))

(assert (=> b!1479378 (= lt!645998 (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126236 res!1005278) b!1479370))

(assert (= (and b!1479370 res!1005273) b!1479368))

(assert (= (and b!1479368 res!1005277) b!1479367))

(assert (= (and b!1479367 res!1005283) b!1479372))

(assert (= (and b!1479372 res!1005274) b!1479363))

(assert (= (and b!1479363 res!1005279) b!1479364))

(assert (= (and b!1479364 res!1005280) b!1479371))

(assert (= (and b!1479371 res!1005286) b!1479375))

(assert (= (and b!1479375 res!1005287) b!1479369))

(assert (= (and b!1479369 res!1005288) b!1479378))

(assert (= (and b!1479378 res!1005285) b!1479362))

(assert (= (and b!1479362 c!136563) b!1479361))

(assert (= (and b!1479362 (not c!136563)) b!1479373))

(assert (= (and b!1479362 res!1005284) b!1479360))

(assert (= (and b!1479360 res!1005289) b!1479377))

(assert (= (and b!1479377 res!1005281) b!1479374))

(assert (= (and b!1479374 (not res!1005275)) b!1479376))

(assert (= (and b!1479376 res!1005276) b!1479365))

(assert (= (and b!1479377 (not res!1005282)) b!1479366))

(declare-fun m!1365235 () Bool)

(assert (=> b!1479366 m!1365235))

(assert (=> b!1479366 m!1365235))

(declare-fun m!1365237 () Bool)

(assert (=> b!1479366 m!1365237))

(assert (=> b!1479376 m!1365235))

(assert (=> b!1479376 m!1365235))

(declare-fun m!1365239 () Bool)

(assert (=> b!1479376 m!1365239))

(declare-fun m!1365241 () Bool)

(assert (=> b!1479374 m!1365241))

(declare-fun m!1365243 () Bool)

(assert (=> b!1479374 m!1365243))

(declare-fun m!1365245 () Bool)

(assert (=> b!1479374 m!1365245))

(assert (=> b!1479374 m!1365235))

(declare-fun m!1365247 () Bool)

(assert (=> b!1479368 m!1365247))

(assert (=> b!1479368 m!1365247))

(declare-fun m!1365249 () Bool)

(assert (=> b!1479368 m!1365249))

(assert (=> b!1479375 m!1365235))

(assert (=> b!1479375 m!1365235))

(declare-fun m!1365251 () Bool)

(assert (=> b!1479375 m!1365251))

(assert (=> b!1479375 m!1365251))

(assert (=> b!1479375 m!1365235))

(declare-fun m!1365253 () Bool)

(assert (=> b!1479375 m!1365253))

(declare-fun m!1365255 () Bool)

(assert (=> b!1479361 m!1365255))

(declare-fun m!1365257 () Bool)

(assert (=> b!1479372 m!1365257))

(assert (=> b!1479369 m!1365235))

(assert (=> b!1479369 m!1365235))

(declare-fun m!1365259 () Bool)

(assert (=> b!1479369 m!1365259))

(declare-fun m!1365261 () Bool)

(assert (=> b!1479363 m!1365261))

(declare-fun m!1365263 () Bool)

(assert (=> b!1479373 m!1365263))

(declare-fun m!1365265 () Bool)

(assert (=> b!1479373 m!1365265))

(assert (=> b!1479371 m!1365243))

(declare-fun m!1365267 () Bool)

(assert (=> b!1479371 m!1365267))

(declare-fun m!1365269 () Bool)

(assert (=> b!1479377 m!1365269))

(assert (=> b!1479377 m!1365243))

(declare-fun m!1365271 () Bool)

(assert (=> b!1479377 m!1365271))

(assert (=> b!1479377 m!1365245))

(assert (=> b!1479377 m!1365241))

(assert (=> b!1479377 m!1365235))

(declare-fun m!1365273 () Bool)

(assert (=> b!1479377 m!1365273))

(declare-fun m!1365275 () Bool)

(assert (=> b!1479377 m!1365275))

(assert (=> b!1479377 m!1365235))

(declare-fun m!1365277 () Bool)

(assert (=> b!1479378 m!1365277))

(assert (=> b!1479378 m!1365277))

(declare-fun m!1365279 () Bool)

(assert (=> b!1479378 m!1365279))

(assert (=> b!1479378 m!1365243))

(declare-fun m!1365281 () Bool)

(assert (=> b!1479378 m!1365281))

(assert (=> b!1479367 m!1365235))

(assert (=> b!1479367 m!1365235))

(declare-fun m!1365283 () Bool)

(assert (=> b!1479367 m!1365283))

(declare-fun m!1365285 () Bool)

(assert (=> start!126236 m!1365285))

(declare-fun m!1365287 () Bool)

(assert (=> start!126236 m!1365287))

(push 1)

