; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126414 () Bool)

(assert start!126414)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99358 0))(
  ( (array!99359 (arr!47953 (Array (_ BitVec 32) (_ BitVec 64))) (size!48504 (_ BitVec 32))) )
))
(declare-fun lt!645724 () array!99358)

(declare-fun b!1478360 () Bool)

(declare-fun e!829513 () Bool)

(declare-fun lt!645725 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12090 0))(
  ( (MissingZero!12090 (index!50752 (_ BitVec 32))) (Found!12090 (index!50753 (_ BitVec 32))) (Intermediate!12090 (undefined!12902 Bool) (index!50754 (_ BitVec 32)) (x!132538 (_ BitVec 32))) (Undefined!12090) (MissingVacant!12090 (index!50755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99358 (_ BitVec 32)) SeekEntryResult!12090)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99358 (_ BitVec 32)) SeekEntryResult!12090)

(assert (=> b!1478360 (= e!829513 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645725 lt!645724 mask!2687) (seekEntryOrOpen!0 lt!645725 lt!645724 mask!2687)))))

(declare-fun b!1478361 () Bool)

(declare-fun res!1003475 () Bool)

(declare-fun e!829517 () Bool)

(assert (=> b!1478361 (=> (not res!1003475) (not e!829517))))

(declare-fun a!2862 () array!99358)

(declare-datatypes ((List!34441 0))(
  ( (Nil!34438) (Cons!34437 (h!35819 (_ BitVec 64)) (t!49127 List!34441)) )
))
(declare-fun arrayNoDuplicates!0 (array!99358 (_ BitVec 32) List!34441) Bool)

(assert (=> b!1478361 (= res!1003475 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34438))))

(declare-fun b!1478362 () Bool)

(declare-fun e!829514 () Bool)

(declare-fun e!829520 () Bool)

(assert (=> b!1478362 (= e!829514 e!829520)))

(declare-fun res!1003488 () Bool)

(assert (=> b!1478362 (=> (not res!1003488) (not e!829520))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645722 () SeekEntryResult!12090)

(assert (=> b!1478362 (= res!1003488 (= lt!645722 (Intermediate!12090 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99358 (_ BitVec 32)) SeekEntryResult!12090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478362 (= lt!645722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645725 mask!2687) lt!645725 lt!645724 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478362 (= lt!645725 (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478363 () Bool)

(declare-fun e!829515 () Bool)

(assert (=> b!1478363 (= e!829517 e!829515)))

(declare-fun res!1003479 () Bool)

(assert (=> b!1478363 (=> (not res!1003479) (not e!829515))))

(assert (=> b!1478363 (= res!1003479 (= (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478363 (= lt!645724 (array!99359 (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48504 a!2862)))))

(declare-fun b!1478364 () Bool)

(declare-fun res!1003482 () Bool)

(assert (=> b!1478364 (=> (not res!1003482) (not e!829520))))

(assert (=> b!1478364 (= res!1003482 e!829513)))

(declare-fun c!136972 () Bool)

(assert (=> b!1478364 (= c!136972 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478365 () Bool)

(declare-fun res!1003486 () Bool)

(assert (=> b!1478365 (=> (not res!1003486) (not e!829517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478365 (= res!1003486 (validKeyInArray!0 (select (arr!47953 a!2862) j!93)))))

(declare-fun res!1003485 () Bool)

(assert (=> start!126414 (=> (not res!1003485) (not e!829517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126414 (= res!1003485 (validMask!0 mask!2687))))

(assert (=> start!126414 e!829517))

(assert (=> start!126414 true))

(declare-fun array_inv!37234 (array!99358) Bool)

(assert (=> start!126414 (array_inv!37234 a!2862)))

(declare-fun b!1478366 () Bool)

(assert (=> b!1478366 (= e!829515 e!829514)))

(declare-fun res!1003489 () Bool)

(assert (=> b!1478366 (=> (not res!1003489) (not e!829514))))

(declare-fun lt!645723 () SeekEntryResult!12090)

(assert (=> b!1478366 (= res!1003489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47953 a!2862) j!93) mask!2687) (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!645723))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478366 (= lt!645723 (Intermediate!12090 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478367 () Bool)

(declare-fun res!1003481 () Bool)

(assert (=> b!1478367 (=> (not res!1003481) (not e!829517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99358 (_ BitVec 32)) Bool)

(assert (=> b!1478367 (= res!1003481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478368 () Bool)

(declare-fun res!1003477 () Bool)

(assert (=> b!1478368 (=> (not res!1003477) (not e!829520))))

(assert (=> b!1478368 (= res!1003477 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478369 () Bool)

(assert (=> b!1478369 (= e!829520 (not true))))

(declare-fun e!829521 () Bool)

(assert (=> b!1478369 e!829521))

(declare-fun res!1003478 () Bool)

(assert (=> b!1478369 (=> (not res!1003478) (not e!829521))))

(declare-fun lt!645727 () SeekEntryResult!12090)

(assert (=> b!1478369 (= res!1003478 (and (= lt!645727 (Found!12090 j!93)) (or (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) (select (arr!47953 a!2862) j!93)))))))

(assert (=> b!1478369 (= lt!645727 (seekEntryOrOpen!0 (select (arr!47953 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478369 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49553 0))(
  ( (Unit!49554) )
))
(declare-fun lt!645726 () Unit!49553)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49553)

(assert (=> b!1478369 (= lt!645726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478370 () Bool)

(declare-fun res!1003487 () Bool)

(assert (=> b!1478370 (=> (not res!1003487) (not e!829514))))

(assert (=> b!1478370 (= res!1003487 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!645723))))

(declare-fun b!1478371 () Bool)

(declare-fun e!829518 () Bool)

(assert (=> b!1478371 (= e!829521 e!829518)))

(declare-fun res!1003484 () Bool)

(assert (=> b!1478371 (=> res!1003484 e!829518)))

(assert (=> b!1478371 (= res!1003484 (or (and (= (select (arr!47953 a!2862) index!646) (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47953 a!2862) index!646) (select (arr!47953 a!2862) j!93))) (not (= (select (arr!47953 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478372 () Bool)

(assert (=> b!1478372 (= e!829513 (= lt!645722 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645725 lt!645724 mask!2687)))))

(declare-fun b!1478373 () Bool)

(declare-fun res!1003483 () Bool)

(assert (=> b!1478373 (=> (not res!1003483) (not e!829517))))

(assert (=> b!1478373 (= res!1003483 (and (= (size!48504 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48504 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48504 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!829516 () Bool)

(declare-fun b!1478374 () Bool)

(assert (=> b!1478374 (= e!829516 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478375 () Bool)

(declare-fun res!1003490 () Bool)

(assert (=> b!1478375 (=> (not res!1003490) (not e!829517))))

(assert (=> b!1478375 (= res!1003490 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48504 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48504 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48504 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478376 () Bool)

(assert (=> b!1478376 (= e!829518 e!829516)))

(declare-fun res!1003476 () Bool)

(assert (=> b!1478376 (=> (not res!1003476) (not e!829516))))

(assert (=> b!1478376 (= res!1003476 (= lt!645727 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47953 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478377 () Bool)

(declare-fun res!1003480 () Bool)

(assert (=> b!1478377 (=> (not res!1003480) (not e!829517))))

(assert (=> b!1478377 (= res!1003480 (validKeyInArray!0 (select (arr!47953 a!2862) i!1006)))))

(assert (= (and start!126414 res!1003485) b!1478373))

(assert (= (and b!1478373 res!1003483) b!1478377))

(assert (= (and b!1478377 res!1003480) b!1478365))

(assert (= (and b!1478365 res!1003486) b!1478367))

(assert (= (and b!1478367 res!1003481) b!1478361))

(assert (= (and b!1478361 res!1003475) b!1478375))

(assert (= (and b!1478375 res!1003490) b!1478363))

(assert (= (and b!1478363 res!1003479) b!1478366))

(assert (= (and b!1478366 res!1003489) b!1478370))

(assert (= (and b!1478370 res!1003487) b!1478362))

(assert (= (and b!1478362 res!1003488) b!1478364))

(assert (= (and b!1478364 c!136972) b!1478372))

(assert (= (and b!1478364 (not c!136972)) b!1478360))

(assert (= (and b!1478364 res!1003482) b!1478368))

(assert (= (and b!1478368 res!1003477) b!1478369))

(assert (= (and b!1478369 res!1003478) b!1478371))

(assert (= (and b!1478371 (not res!1003484)) b!1478376))

(assert (= (and b!1478376 res!1003476) b!1478374))

(declare-fun m!1364317 () Bool)

(assert (=> b!1478363 m!1364317))

(declare-fun m!1364319 () Bool)

(assert (=> b!1478363 m!1364319))

(declare-fun m!1364321 () Bool)

(assert (=> b!1478372 m!1364321))

(declare-fun m!1364323 () Bool)

(assert (=> b!1478365 m!1364323))

(assert (=> b!1478365 m!1364323))

(declare-fun m!1364325 () Bool)

(assert (=> b!1478365 m!1364325))

(declare-fun m!1364327 () Bool)

(assert (=> b!1478362 m!1364327))

(assert (=> b!1478362 m!1364327))

(declare-fun m!1364329 () Bool)

(assert (=> b!1478362 m!1364329))

(assert (=> b!1478362 m!1364317))

(declare-fun m!1364331 () Bool)

(assert (=> b!1478362 m!1364331))

(declare-fun m!1364333 () Bool)

(assert (=> b!1478377 m!1364333))

(assert (=> b!1478377 m!1364333))

(declare-fun m!1364335 () Bool)

(assert (=> b!1478377 m!1364335))

(declare-fun m!1364337 () Bool)

(assert (=> b!1478371 m!1364337))

(assert (=> b!1478371 m!1364317))

(declare-fun m!1364339 () Bool)

(assert (=> b!1478371 m!1364339))

(assert (=> b!1478371 m!1364323))

(declare-fun m!1364341 () Bool)

(assert (=> b!1478361 m!1364341))

(declare-fun m!1364343 () Bool)

(assert (=> b!1478369 m!1364343))

(declare-fun m!1364345 () Bool)

(assert (=> b!1478369 m!1364345))

(assert (=> b!1478369 m!1364323))

(declare-fun m!1364347 () Bool)

(assert (=> b!1478369 m!1364347))

(declare-fun m!1364349 () Bool)

(assert (=> b!1478369 m!1364349))

(assert (=> b!1478369 m!1364323))

(declare-fun m!1364351 () Bool)

(assert (=> b!1478367 m!1364351))

(declare-fun m!1364353 () Bool)

(assert (=> b!1478360 m!1364353))

(declare-fun m!1364355 () Bool)

(assert (=> b!1478360 m!1364355))

(assert (=> b!1478370 m!1364323))

(assert (=> b!1478370 m!1364323))

(declare-fun m!1364357 () Bool)

(assert (=> b!1478370 m!1364357))

(assert (=> b!1478366 m!1364323))

(assert (=> b!1478366 m!1364323))

(declare-fun m!1364359 () Bool)

(assert (=> b!1478366 m!1364359))

(assert (=> b!1478366 m!1364359))

(assert (=> b!1478366 m!1364323))

(declare-fun m!1364361 () Bool)

(assert (=> b!1478366 m!1364361))

(assert (=> b!1478376 m!1364323))

(assert (=> b!1478376 m!1364323))

(declare-fun m!1364363 () Bool)

(assert (=> b!1478376 m!1364363))

(declare-fun m!1364365 () Bool)

(assert (=> start!126414 m!1364365))

(declare-fun m!1364367 () Bool)

(assert (=> start!126414 m!1364367))

(check-sat (not b!1478362) (not b!1478360) (not b!1478377) (not b!1478369) (not b!1478376) (not b!1478366) (not b!1478370) (not start!126414) (not b!1478367) (not b!1478372) (not b!1478365) (not b!1478361))
(check-sat)
