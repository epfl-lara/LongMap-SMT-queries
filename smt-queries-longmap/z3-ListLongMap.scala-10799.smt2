; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126660 () Bool)

(assert start!126660)

(declare-fun b!1483275 () Bool)

(declare-fun res!1007496 () Bool)

(declare-fun e!831996 () Bool)

(assert (=> b!1483275 (=> (not res!1007496) (not e!831996))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99517 0))(
  ( (array!99518 (arr!48031 (Array (_ BitVec 32) (_ BitVec 64))) (size!48582 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99517)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483275 (= res!1007496 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48582 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48582 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48582 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483276 () Bool)

(declare-fun e!831995 () Bool)

(assert (=> b!1483276 (= e!831995 (not true))))

(declare-fun e!831991 () Bool)

(assert (=> b!1483276 e!831991))

(declare-fun res!1007499 () Bool)

(assert (=> b!1483276 (=> (not res!1007499) (not e!831991))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99517 (_ BitVec 32)) Bool)

(assert (=> b!1483276 (= res!1007499 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49709 0))(
  ( (Unit!49710) )
))
(declare-fun lt!647452 () Unit!49709)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49709)

(assert (=> b!1483276 (= lt!647452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483277 () Bool)

(declare-fun res!1007492 () Bool)

(assert (=> b!1483277 (=> (not res!1007492) (not e!831995))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483277 (= res!1007492 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483278 () Bool)

(declare-fun res!1007490 () Bool)

(assert (=> b!1483278 (=> (not res!1007490) (not e!831995))))

(declare-fun e!831993 () Bool)

(assert (=> b!1483278 (= res!1007490 e!831993)))

(declare-fun c!137425 () Bool)

(assert (=> b!1483278 (= c!137425 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483279 () Bool)

(declare-fun e!831994 () Bool)

(declare-fun e!831992 () Bool)

(assert (=> b!1483279 (= e!831994 e!831992)))

(declare-fun res!1007487 () Bool)

(assert (=> b!1483279 (=> (not res!1007487) (not e!831992))))

(declare-datatypes ((SeekEntryResult!12168 0))(
  ( (MissingZero!12168 (index!51064 (_ BitVec 32))) (Found!12168 (index!51065 (_ BitVec 32))) (Intermediate!12168 (undefined!12980 Bool) (index!51066 (_ BitVec 32)) (x!132836 (_ BitVec 32))) (Undefined!12168) (MissingVacant!12168 (index!51067 (_ BitVec 32))) )
))
(declare-fun lt!647455 () SeekEntryResult!12168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99517 (_ BitVec 32)) SeekEntryResult!12168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483279 (= res!1007487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48031 a!2862) j!93) mask!2687) (select (arr!48031 a!2862) j!93) a!2862 mask!2687) lt!647455))))

(assert (=> b!1483279 (= lt!647455 (Intermediate!12168 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483280 () Bool)

(declare-fun res!1007491 () Bool)

(assert (=> b!1483280 (=> (not res!1007491) (not e!831996))))

(assert (=> b!1483280 (= res!1007491 (and (= (size!48582 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48582 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48582 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483281 () Bool)

(assert (=> b!1483281 (= e!831992 e!831995)))

(declare-fun res!1007493 () Bool)

(assert (=> b!1483281 (=> (not res!1007493) (not e!831995))))

(declare-fun lt!647454 () SeekEntryResult!12168)

(assert (=> b!1483281 (= res!1007493 (= lt!647454 (Intermediate!12168 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647451 () array!99517)

(declare-fun lt!647453 () (_ BitVec 64))

(assert (=> b!1483281 (= lt!647454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647453 mask!2687) lt!647453 lt!647451 mask!2687))))

(assert (=> b!1483281 (= lt!647453 (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483282 () Bool)

(declare-fun res!1007500 () Bool)

(assert (=> b!1483282 (=> (not res!1007500) (not e!831996))))

(assert (=> b!1483282 (= res!1007500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483283 () Bool)

(assert (=> b!1483283 (= e!831991 (and (or (= (select (arr!48031 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48031 a!2862) intermediateBeforeIndex!19) (select (arr!48031 a!2862) j!93))) (or (and (= (select (arr!48031 a!2862) index!646) (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48031 a!2862) index!646) (select (arr!48031 a!2862) j!93))) (= (select (arr!48031 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!1007489 () Bool)

(assert (=> start!126660 (=> (not res!1007489) (not e!831996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126660 (= res!1007489 (validMask!0 mask!2687))))

(assert (=> start!126660 e!831996))

(assert (=> start!126660 true))

(declare-fun array_inv!37312 (array!99517) Bool)

(assert (=> start!126660 (array_inv!37312 a!2862)))

(declare-fun b!1483284 () Bool)

(assert (=> b!1483284 (= e!831993 (= lt!647454 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647453 lt!647451 mask!2687)))))

(declare-fun b!1483285 () Bool)

(declare-fun res!1007498 () Bool)

(assert (=> b!1483285 (=> (not res!1007498) (not e!831996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483285 (= res!1007498 (validKeyInArray!0 (select (arr!48031 a!2862) i!1006)))))

(declare-fun b!1483286 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99517 (_ BitVec 32)) SeekEntryResult!12168)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99517 (_ BitVec 32)) SeekEntryResult!12168)

(assert (=> b!1483286 (= e!831993 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647453 lt!647451 mask!2687) (seekEntryOrOpen!0 lt!647453 lt!647451 mask!2687)))))

(declare-fun b!1483287 () Bool)

(declare-fun res!1007501 () Bool)

(assert (=> b!1483287 (=> (not res!1007501) (not e!831991))))

(assert (=> b!1483287 (= res!1007501 (= (seekEntryOrOpen!0 (select (arr!48031 a!2862) j!93) a!2862 mask!2687) (Found!12168 j!93)))))

(declare-fun b!1483288 () Bool)

(declare-fun res!1007497 () Bool)

(assert (=> b!1483288 (=> (not res!1007497) (not e!831996))))

(declare-datatypes ((List!34519 0))(
  ( (Nil!34516) (Cons!34515 (h!35900 (_ BitVec 64)) (t!49205 List!34519)) )
))
(declare-fun arrayNoDuplicates!0 (array!99517 (_ BitVec 32) List!34519) Bool)

(assert (=> b!1483288 (= res!1007497 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34516))))

(declare-fun b!1483289 () Bool)

(declare-fun res!1007488 () Bool)

(assert (=> b!1483289 (=> (not res!1007488) (not e!831996))))

(assert (=> b!1483289 (= res!1007488 (validKeyInArray!0 (select (arr!48031 a!2862) j!93)))))

(declare-fun b!1483290 () Bool)

(declare-fun res!1007494 () Bool)

(assert (=> b!1483290 (=> (not res!1007494) (not e!831992))))

(assert (=> b!1483290 (= res!1007494 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48031 a!2862) j!93) a!2862 mask!2687) lt!647455))))

(declare-fun b!1483291 () Bool)

(assert (=> b!1483291 (= e!831996 e!831994)))

(declare-fun res!1007495 () Bool)

(assert (=> b!1483291 (=> (not res!1007495) (not e!831994))))

(assert (=> b!1483291 (= res!1007495 (= (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483291 (= lt!647451 (array!99518 (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48582 a!2862)))))

(assert (= (and start!126660 res!1007489) b!1483280))

(assert (= (and b!1483280 res!1007491) b!1483285))

(assert (= (and b!1483285 res!1007498) b!1483289))

(assert (= (and b!1483289 res!1007488) b!1483282))

(assert (= (and b!1483282 res!1007500) b!1483288))

(assert (= (and b!1483288 res!1007497) b!1483275))

(assert (= (and b!1483275 res!1007496) b!1483291))

(assert (= (and b!1483291 res!1007495) b!1483279))

(assert (= (and b!1483279 res!1007487) b!1483290))

(assert (= (and b!1483290 res!1007494) b!1483281))

(assert (= (and b!1483281 res!1007493) b!1483278))

(assert (= (and b!1483278 c!137425) b!1483284))

(assert (= (and b!1483278 (not c!137425)) b!1483286))

(assert (= (and b!1483278 res!1007490) b!1483277))

(assert (= (and b!1483277 res!1007492) b!1483276))

(assert (= (and b!1483276 res!1007499) b!1483287))

(assert (= (and b!1483287 res!1007501) b!1483283))

(declare-fun m!1368991 () Bool)

(assert (=> b!1483288 m!1368991))

(declare-fun m!1368993 () Bool)

(assert (=> b!1483283 m!1368993))

(declare-fun m!1368995 () Bool)

(assert (=> b!1483283 m!1368995))

(declare-fun m!1368997 () Bool)

(assert (=> b!1483283 m!1368997))

(declare-fun m!1368999 () Bool)

(assert (=> b!1483283 m!1368999))

(declare-fun m!1369001 () Bool)

(assert (=> b!1483283 m!1369001))

(declare-fun m!1369003 () Bool)

(assert (=> start!126660 m!1369003))

(declare-fun m!1369005 () Bool)

(assert (=> start!126660 m!1369005))

(declare-fun m!1369007 () Bool)

(assert (=> b!1483284 m!1369007))

(assert (=> b!1483289 m!1369001))

(assert (=> b!1483289 m!1369001))

(declare-fun m!1369009 () Bool)

(assert (=> b!1483289 m!1369009))

(assert (=> b!1483287 m!1369001))

(assert (=> b!1483287 m!1369001))

(declare-fun m!1369011 () Bool)

(assert (=> b!1483287 m!1369011))

(declare-fun m!1369013 () Bool)

(assert (=> b!1483276 m!1369013))

(declare-fun m!1369015 () Bool)

(assert (=> b!1483276 m!1369015))

(declare-fun m!1369017 () Bool)

(assert (=> b!1483282 m!1369017))

(assert (=> b!1483290 m!1369001))

(assert (=> b!1483290 m!1369001))

(declare-fun m!1369019 () Bool)

(assert (=> b!1483290 m!1369019))

(declare-fun m!1369021 () Bool)

(assert (=> b!1483285 m!1369021))

(assert (=> b!1483285 m!1369021))

(declare-fun m!1369023 () Bool)

(assert (=> b!1483285 m!1369023))

(assert (=> b!1483279 m!1369001))

(assert (=> b!1483279 m!1369001))

(declare-fun m!1369025 () Bool)

(assert (=> b!1483279 m!1369025))

(assert (=> b!1483279 m!1369025))

(assert (=> b!1483279 m!1369001))

(declare-fun m!1369027 () Bool)

(assert (=> b!1483279 m!1369027))

(assert (=> b!1483291 m!1368993))

(declare-fun m!1369029 () Bool)

(assert (=> b!1483291 m!1369029))

(declare-fun m!1369031 () Bool)

(assert (=> b!1483281 m!1369031))

(assert (=> b!1483281 m!1369031))

(declare-fun m!1369033 () Bool)

(assert (=> b!1483281 m!1369033))

(assert (=> b!1483281 m!1368993))

(declare-fun m!1369035 () Bool)

(assert (=> b!1483281 m!1369035))

(declare-fun m!1369037 () Bool)

(assert (=> b!1483286 m!1369037))

(declare-fun m!1369039 () Bool)

(assert (=> b!1483286 m!1369039))

(check-sat (not b!1483288) (not b!1483284) (not b!1483285) (not b!1483286) (not b!1483276) (not b!1483282) (not b!1483281) (not b!1483279) (not b!1483287) (not start!126660) (not b!1483289) (not b!1483290))
(check-sat)
