; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126178 () Bool)

(assert start!126178)

(declare-fun b!1478401 () Bool)

(declare-fun e!829311 () Bool)

(declare-fun e!829306 () Bool)

(assert (=> b!1478401 (= e!829311 e!829306)))

(declare-fun res!1004522 () Bool)

(assert (=> b!1478401 (=> (not res!1004522) (not e!829306))))

(declare-datatypes ((SeekEntryResult!12176 0))(
  ( (MissingZero!12176 (index!51096 (_ BitVec 32))) (Found!12176 (index!51097 (_ BitVec 32))) (Intermediate!12176 (undefined!12988 Bool) (index!51098 (_ BitVec 32)) (x!132682 (_ BitVec 32))) (Undefined!12176) (MissingVacant!12176 (index!51099 (_ BitVec 32))) )
))
(declare-fun lt!645504 () SeekEntryResult!12176)

(declare-datatypes ((array!99262 0))(
  ( (array!99263 (arr!47911 (Array (_ BitVec 32) (_ BitVec 64))) (size!48463 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99262)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478401 (= res!1004522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!645504))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478401 (= lt!645504 (Intermediate!12176 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478402 () Bool)

(declare-fun res!1004517 () Bool)

(declare-fun e!829309 () Bool)

(assert (=> b!1478402 (=> (not res!1004517) (not e!829309))))

(declare-fun e!829308 () Bool)

(assert (=> b!1478402 (= res!1004517 e!829308)))

(declare-fun c!136465 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478402 (= c!136465 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478403 () Bool)

(declare-fun res!1004520 () Bool)

(assert (=> b!1478403 (=> (not res!1004520) (not e!829309))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478403 (= res!1004520 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1004518 () Bool)

(declare-fun e!829307 () Bool)

(assert (=> start!126178 (=> (not res!1004518) (not e!829307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126178 (= res!1004518 (validMask!0 mask!2687))))

(assert (=> start!126178 e!829307))

(assert (=> start!126178 true))

(declare-fun array_inv!37144 (array!99262) Bool)

(assert (=> start!126178 (array_inv!37144 a!2862)))

(declare-fun b!1478404 () Bool)

(declare-fun res!1004524 () Bool)

(assert (=> b!1478404 (=> (not res!1004524) (not e!829307))))

(declare-datatypes ((List!34490 0))(
  ( (Nil!34487) (Cons!34486 (h!35854 (_ BitVec 64)) (t!49176 List!34490)) )
))
(declare-fun arrayNoDuplicates!0 (array!99262 (_ BitVec 32) List!34490) Bool)

(assert (=> b!1478404 (= res!1004524 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34487))))

(declare-fun b!1478405 () Bool)

(assert (=> b!1478405 (= e!829307 e!829311)))

(declare-fun res!1004527 () Bool)

(assert (=> b!1478405 (=> (not res!1004527) (not e!829311))))

(assert (=> b!1478405 (= res!1004527 (= (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645503 () array!99262)

(assert (=> b!1478405 (= lt!645503 (array!99263 (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48463 a!2862)))))

(declare-fun b!1478406 () Bool)

(declare-fun res!1004516 () Bool)

(assert (=> b!1478406 (=> (not res!1004516) (not e!829307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478406 (= res!1004516 (validKeyInArray!0 (select (arr!47911 a!2862) i!1006)))))

(declare-fun lt!645502 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1478407 () Bool)

(declare-fun lt!645500 () SeekEntryResult!12176)

(assert (=> b!1478407 (= e!829308 (= lt!645500 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645502 lt!645503 mask!2687)))))

(declare-fun b!1478408 () Bool)

(declare-fun res!1004526 () Bool)

(assert (=> b!1478408 (=> (not res!1004526) (not e!829306))))

(assert (=> b!1478408 (= res!1004526 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!645504))))

(declare-fun b!1478409 () Bool)

(declare-fun e!829314 () Bool)

(assert (=> b!1478409 (= e!829314 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478410 () Bool)

(declare-fun e!829312 () Bool)

(declare-fun e!829310 () Bool)

(assert (=> b!1478410 (= e!829312 e!829310)))

(declare-fun res!1004529 () Bool)

(assert (=> b!1478410 (=> res!1004529 e!829310)))

(assert (=> b!1478410 (= res!1004529 (or (and (= (select (arr!47911 a!2862) index!646) (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47911 a!2862) index!646) (select (arr!47911 a!2862) j!93))) (not (= (select (arr!47911 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478411 () Bool)

(declare-fun res!1004521 () Bool)

(assert (=> b!1478411 (=> (not res!1004521) (not e!829307))))

(assert (=> b!1478411 (= res!1004521 (and (= (size!48463 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48463 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48463 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478412 () Bool)

(assert (=> b!1478412 (= e!829309 (not (or (and (= (select (arr!47911 a!2862) index!646) (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47911 a!2862) index!646) (select (arr!47911 a!2862) j!93))) (not (= (select (arr!47911 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1478412 e!829312))

(declare-fun res!1004515 () Bool)

(assert (=> b!1478412 (=> (not res!1004515) (not e!829312))))

(declare-fun lt!645499 () SeekEntryResult!12176)

(assert (=> b!1478412 (= res!1004515 (and (= lt!645499 (Found!12176 j!93)) (or (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) (select (arr!47911 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12176)

(assert (=> b!1478412 (= lt!645499 (seekEntryOrOpen!0 (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99262 (_ BitVec 32)) Bool)

(assert (=> b!1478412 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49533 0))(
  ( (Unit!49534) )
))
(declare-fun lt!645501 () Unit!49533)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49533)

(assert (=> b!1478412 (= lt!645501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478413 () Bool)

(declare-fun res!1004528 () Bool)

(assert (=> b!1478413 (=> (not res!1004528) (not e!829307))))

(assert (=> b!1478413 (= res!1004528 (validKeyInArray!0 (select (arr!47911 a!2862) j!93)))))

(declare-fun b!1478414 () Bool)

(assert (=> b!1478414 (= e!829310 e!829314)))

(declare-fun res!1004525 () Bool)

(assert (=> b!1478414 (=> (not res!1004525) (not e!829314))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12176)

(assert (=> b!1478414 (= res!1004525 (= lt!645499 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47911 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478415 () Bool)

(declare-fun res!1004519 () Bool)

(assert (=> b!1478415 (=> (not res!1004519) (not e!829307))))

(assert (=> b!1478415 (= res!1004519 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48463 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48463 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48463 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478416 () Bool)

(declare-fun res!1004530 () Bool)

(assert (=> b!1478416 (=> (not res!1004530) (not e!829307))))

(assert (=> b!1478416 (= res!1004530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478417 () Bool)

(assert (=> b!1478417 (= e!829308 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645502 lt!645503 mask!2687) (seekEntryOrOpen!0 lt!645502 lt!645503 mask!2687)))))

(declare-fun b!1478418 () Bool)

(assert (=> b!1478418 (= e!829306 e!829309)))

(declare-fun res!1004523 () Bool)

(assert (=> b!1478418 (=> (not res!1004523) (not e!829309))))

(assert (=> b!1478418 (= res!1004523 (= lt!645500 (Intermediate!12176 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478418 (= lt!645500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645502 mask!2687) lt!645502 lt!645503 mask!2687))))

(assert (=> b!1478418 (= lt!645502 (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126178 res!1004518) b!1478411))

(assert (= (and b!1478411 res!1004521) b!1478406))

(assert (= (and b!1478406 res!1004516) b!1478413))

(assert (= (and b!1478413 res!1004528) b!1478416))

(assert (= (and b!1478416 res!1004530) b!1478404))

(assert (= (and b!1478404 res!1004524) b!1478415))

(assert (= (and b!1478415 res!1004519) b!1478405))

(assert (= (and b!1478405 res!1004527) b!1478401))

(assert (= (and b!1478401 res!1004522) b!1478408))

(assert (= (and b!1478408 res!1004526) b!1478418))

(assert (= (and b!1478418 res!1004523) b!1478402))

(assert (= (and b!1478402 c!136465) b!1478407))

(assert (= (and b!1478402 (not c!136465)) b!1478417))

(assert (= (and b!1478402 res!1004517) b!1478403))

(assert (= (and b!1478403 res!1004520) b!1478412))

(assert (= (and b!1478412 res!1004515) b!1478410))

(assert (= (and b!1478410 (not res!1004529)) b!1478414))

(assert (= (and b!1478414 res!1004525) b!1478409))

(declare-fun m!1363827 () Bool)

(assert (=> b!1478406 m!1363827))

(assert (=> b!1478406 m!1363827))

(declare-fun m!1363829 () Bool)

(assert (=> b!1478406 m!1363829))

(declare-fun m!1363831 () Bool)

(assert (=> b!1478417 m!1363831))

(declare-fun m!1363833 () Bool)

(assert (=> b!1478417 m!1363833))

(declare-fun m!1363835 () Bool)

(assert (=> b!1478414 m!1363835))

(assert (=> b!1478414 m!1363835))

(declare-fun m!1363837 () Bool)

(assert (=> b!1478414 m!1363837))

(declare-fun m!1363839 () Bool)

(assert (=> b!1478410 m!1363839))

(declare-fun m!1363841 () Bool)

(assert (=> b!1478410 m!1363841))

(declare-fun m!1363843 () Bool)

(assert (=> b!1478410 m!1363843))

(assert (=> b!1478410 m!1363835))

(declare-fun m!1363845 () Bool)

(assert (=> b!1478404 m!1363845))

(assert (=> b!1478405 m!1363841))

(declare-fun m!1363847 () Bool)

(assert (=> b!1478405 m!1363847))

(assert (=> b!1478401 m!1363835))

(assert (=> b!1478401 m!1363835))

(declare-fun m!1363849 () Bool)

(assert (=> b!1478401 m!1363849))

(assert (=> b!1478401 m!1363849))

(assert (=> b!1478401 m!1363835))

(declare-fun m!1363851 () Bool)

(assert (=> b!1478401 m!1363851))

(assert (=> b!1478413 m!1363835))

(assert (=> b!1478413 m!1363835))

(declare-fun m!1363853 () Bool)

(assert (=> b!1478413 m!1363853))

(declare-fun m!1363855 () Bool)

(assert (=> b!1478412 m!1363855))

(assert (=> b!1478412 m!1363841))

(declare-fun m!1363857 () Bool)

(assert (=> b!1478412 m!1363857))

(assert (=> b!1478412 m!1363843))

(assert (=> b!1478412 m!1363839))

(assert (=> b!1478412 m!1363835))

(declare-fun m!1363859 () Bool)

(assert (=> b!1478412 m!1363859))

(declare-fun m!1363861 () Bool)

(assert (=> b!1478412 m!1363861))

(assert (=> b!1478412 m!1363835))

(declare-fun m!1363863 () Bool)

(assert (=> start!126178 m!1363863))

(declare-fun m!1363865 () Bool)

(assert (=> start!126178 m!1363865))

(declare-fun m!1363867 () Bool)

(assert (=> b!1478407 m!1363867))

(assert (=> b!1478408 m!1363835))

(assert (=> b!1478408 m!1363835))

(declare-fun m!1363869 () Bool)

(assert (=> b!1478408 m!1363869))

(declare-fun m!1363871 () Bool)

(assert (=> b!1478416 m!1363871))

(declare-fun m!1363873 () Bool)

(assert (=> b!1478418 m!1363873))

(assert (=> b!1478418 m!1363873))

(declare-fun m!1363875 () Bool)

(assert (=> b!1478418 m!1363875))

(assert (=> b!1478418 m!1363841))

(declare-fun m!1363877 () Bool)

(assert (=> b!1478418 m!1363877))

(check-sat (not b!1478416) (not b!1478407) (not b!1478413) (not b!1478401) (not b!1478417) (not b!1478404) (not start!126178) (not b!1478406) (not b!1478418) (not b!1478414) (not b!1478412) (not b!1478408))
(check-sat)
