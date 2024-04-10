; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126162 () Bool)

(assert start!126162)

(declare-fun b!1477354 () Bool)

(declare-fun res!1003502 () Bool)

(declare-fun e!828804 () Bool)

(assert (=> b!1477354 (=> (not res!1003502) (not e!828804))))

(declare-datatypes ((array!99268 0))(
  ( (array!99269 (arr!47913 (Array (_ BitVec 32) (_ BitVec 64))) (size!48463 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99268)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477354 (= res!1003502 (validKeyInArray!0 (select (arr!47913 a!2862) i!1006)))))

(declare-fun lt!645321 () array!99268)

(declare-fun b!1477355 () Bool)

(declare-fun lt!645323 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!828807 () Bool)

(declare-datatypes ((SeekEntryResult!12153 0))(
  ( (MissingZero!12153 (index!51004 (_ BitVec 32))) (Found!12153 (index!51005 (_ BitVec 32))) (Intermediate!12153 (undefined!12965 Bool) (index!51006 (_ BitVec 32)) (x!132600 (_ BitVec 32))) (Undefined!12153) (MissingVacant!12153 (index!51007 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99268 (_ BitVec 32)) SeekEntryResult!12153)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99268 (_ BitVec 32)) SeekEntryResult!12153)

(assert (=> b!1477355 (= e!828807 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645323 lt!645321 mask!2687) (seekEntryOrOpen!0 lt!645323 lt!645321 mask!2687)))))

(declare-fun b!1477356 () Bool)

(declare-fun res!1003492 () Bool)

(assert (=> b!1477356 (=> (not res!1003492) (not e!828804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99268 (_ BitVec 32)) Bool)

(assert (=> b!1477356 (= res!1003492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477357 () Bool)

(declare-fun res!1003503 () Bool)

(assert (=> b!1477357 (=> (not res!1003503) (not e!828804))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477357 (= res!1003503 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48463 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48463 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48463 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477358 () Bool)

(declare-fun e!828803 () Bool)

(assert (=> b!1477358 (= e!828804 e!828803)))

(declare-fun res!1003497 () Bool)

(assert (=> b!1477358 (=> (not res!1003497) (not e!828803))))

(assert (=> b!1477358 (= res!1003497 (= (select (store (arr!47913 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477358 (= lt!645321 (array!99269 (store (arr!47913 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48463 a!2862)))))

(declare-fun b!1477359 () Bool)

(declare-fun res!1003491 () Bool)

(assert (=> b!1477359 (=> (not res!1003491) (not e!828804))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477359 (= res!1003491 (validKeyInArray!0 (select (arr!47913 a!2862) j!93)))))

(declare-fun b!1477360 () Bool)

(declare-fun e!828806 () Bool)

(declare-fun e!828809 () Bool)

(assert (=> b!1477360 (= e!828806 e!828809)))

(declare-fun res!1003493 () Bool)

(assert (=> b!1477360 (=> (not res!1003493) (not e!828809))))

(declare-fun lt!645324 () SeekEntryResult!12153)

(assert (=> b!1477360 (= res!1003493 (= lt!645324 (Intermediate!12153 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99268 (_ BitVec 32)) SeekEntryResult!12153)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477360 (= lt!645324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645323 mask!2687) lt!645323 lt!645321 mask!2687))))

(assert (=> b!1477360 (= lt!645323 (select (store (arr!47913 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477361 () Bool)

(declare-fun e!828805 () Bool)

(declare-fun e!828808 () Bool)

(assert (=> b!1477361 (= e!828805 e!828808)))

(declare-fun res!1003495 () Bool)

(assert (=> b!1477361 (=> res!1003495 e!828808)))

(assert (=> b!1477361 (= res!1003495 (or (and (= (select (arr!47913 a!2862) index!646) (select (store (arr!47913 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47913 a!2862) index!646) (select (arr!47913 a!2862) j!93))) (not (= (select (arr!47913 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477362 () Bool)

(assert (=> b!1477362 (= e!828803 e!828806)))

(declare-fun res!1003489 () Bool)

(assert (=> b!1477362 (=> (not res!1003489) (not e!828806))))

(declare-fun lt!645319 () SeekEntryResult!12153)

(assert (=> b!1477362 (= res!1003489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47913 a!2862) j!93) mask!2687) (select (arr!47913 a!2862) j!93) a!2862 mask!2687) lt!645319))))

(assert (=> b!1477362 (= lt!645319 (Intermediate!12153 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477363 () Bool)

(declare-fun res!1003496 () Bool)

(assert (=> b!1477363 (=> (not res!1003496) (not e!828804))))

(assert (=> b!1477363 (= res!1003496 (and (= (size!48463 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48463 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48463 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1003490 () Bool)

(assert (=> start!126162 (=> (not res!1003490) (not e!828804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126162 (= res!1003490 (validMask!0 mask!2687))))

(assert (=> start!126162 e!828804))

(assert (=> start!126162 true))

(declare-fun array_inv!36941 (array!99268) Bool)

(assert (=> start!126162 (array_inv!36941 a!2862)))

(declare-fun b!1477364 () Bool)

(declare-fun res!1003494 () Bool)

(assert (=> b!1477364 (=> (not res!1003494) (not e!828809))))

(assert (=> b!1477364 (= res!1003494 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477365 () Bool)

(declare-fun e!828802 () Bool)

(assert (=> b!1477365 (= e!828808 e!828802)))

(declare-fun res!1003504 () Bool)

(assert (=> b!1477365 (=> (not res!1003504) (not e!828802))))

(declare-fun lt!645320 () SeekEntryResult!12153)

(assert (=> b!1477365 (= res!1003504 (= lt!645320 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47913 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477366 () Bool)

(declare-fun res!1003500 () Bool)

(assert (=> b!1477366 (=> (not res!1003500) (not e!828804))))

(declare-datatypes ((List!34414 0))(
  ( (Nil!34411) (Cons!34410 (h!35778 (_ BitVec 64)) (t!49108 List!34414)) )
))
(declare-fun arrayNoDuplicates!0 (array!99268 (_ BitVec 32) List!34414) Bool)

(assert (=> b!1477366 (= res!1003500 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34411))))

(declare-fun b!1477367 () Bool)

(declare-fun res!1003501 () Bool)

(assert (=> b!1477367 (=> (not res!1003501) (not e!828809))))

(assert (=> b!1477367 (= res!1003501 e!828807)))

(declare-fun c!136452 () Bool)

(assert (=> b!1477367 (= c!136452 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477368 () Bool)

(declare-fun res!1003498 () Bool)

(assert (=> b!1477368 (=> (not res!1003498) (not e!828806))))

(assert (=> b!1477368 (= res!1003498 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47913 a!2862) j!93) a!2862 mask!2687) lt!645319))))

(declare-fun b!1477369 () Bool)

(assert (=> b!1477369 (= e!828802 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477370 () Bool)

(assert (=> b!1477370 (= e!828809 (not true))))

(assert (=> b!1477370 e!828805))

(declare-fun res!1003499 () Bool)

(assert (=> b!1477370 (=> (not res!1003499) (not e!828805))))

(assert (=> b!1477370 (= res!1003499 (and (= lt!645320 (Found!12153 j!93)) (or (= (select (arr!47913 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47913 a!2862) intermediateBeforeIndex!19) (select (arr!47913 a!2862) j!93)))))))

(assert (=> b!1477370 (= lt!645320 (seekEntryOrOpen!0 (select (arr!47913 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477370 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49646 0))(
  ( (Unit!49647) )
))
(declare-fun lt!645322 () Unit!49646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49646)

(assert (=> b!1477370 (= lt!645322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477371 () Bool)

(assert (=> b!1477371 (= e!828807 (= lt!645324 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645323 lt!645321 mask!2687)))))

(assert (= (and start!126162 res!1003490) b!1477363))

(assert (= (and b!1477363 res!1003496) b!1477354))

(assert (= (and b!1477354 res!1003502) b!1477359))

(assert (= (and b!1477359 res!1003491) b!1477356))

(assert (= (and b!1477356 res!1003492) b!1477366))

(assert (= (and b!1477366 res!1003500) b!1477357))

(assert (= (and b!1477357 res!1003503) b!1477358))

(assert (= (and b!1477358 res!1003497) b!1477362))

(assert (= (and b!1477362 res!1003489) b!1477368))

(assert (= (and b!1477368 res!1003498) b!1477360))

(assert (= (and b!1477360 res!1003493) b!1477367))

(assert (= (and b!1477367 c!136452) b!1477371))

(assert (= (and b!1477367 (not c!136452)) b!1477355))

(assert (= (and b!1477367 res!1003501) b!1477364))

(assert (= (and b!1477364 res!1003494) b!1477370))

(assert (= (and b!1477370 res!1003499) b!1477361))

(assert (= (and b!1477361 (not res!1003495)) b!1477365))

(assert (= (and b!1477365 res!1003504) b!1477369))

(declare-fun m!1363307 () Bool)

(assert (=> b!1477355 m!1363307))

(declare-fun m!1363309 () Bool)

(assert (=> b!1477355 m!1363309))

(declare-fun m!1363311 () Bool)

(assert (=> b!1477365 m!1363311))

(assert (=> b!1477365 m!1363311))

(declare-fun m!1363313 () Bool)

(assert (=> b!1477365 m!1363313))

(declare-fun m!1363315 () Bool)

(assert (=> b!1477354 m!1363315))

(assert (=> b!1477354 m!1363315))

(declare-fun m!1363317 () Bool)

(assert (=> b!1477354 m!1363317))

(declare-fun m!1363319 () Bool)

(assert (=> b!1477361 m!1363319))

(declare-fun m!1363321 () Bool)

(assert (=> b!1477361 m!1363321))

(declare-fun m!1363323 () Bool)

(assert (=> b!1477361 m!1363323))

(assert (=> b!1477361 m!1363311))

(assert (=> b!1477359 m!1363311))

(assert (=> b!1477359 m!1363311))

(declare-fun m!1363325 () Bool)

(assert (=> b!1477359 m!1363325))

(assert (=> b!1477358 m!1363321))

(declare-fun m!1363327 () Bool)

(assert (=> b!1477358 m!1363327))

(assert (=> b!1477362 m!1363311))

(assert (=> b!1477362 m!1363311))

(declare-fun m!1363329 () Bool)

(assert (=> b!1477362 m!1363329))

(assert (=> b!1477362 m!1363329))

(assert (=> b!1477362 m!1363311))

(declare-fun m!1363331 () Bool)

(assert (=> b!1477362 m!1363331))

(declare-fun m!1363333 () Bool)

(assert (=> b!1477360 m!1363333))

(assert (=> b!1477360 m!1363333))

(declare-fun m!1363335 () Bool)

(assert (=> b!1477360 m!1363335))

(assert (=> b!1477360 m!1363321))

(declare-fun m!1363337 () Bool)

(assert (=> b!1477360 m!1363337))

(declare-fun m!1363339 () Bool)

(assert (=> b!1477366 m!1363339))

(declare-fun m!1363341 () Bool)

(assert (=> start!126162 m!1363341))

(declare-fun m!1363343 () Bool)

(assert (=> start!126162 m!1363343))

(declare-fun m!1363345 () Bool)

(assert (=> b!1477371 m!1363345))

(declare-fun m!1363347 () Bool)

(assert (=> b!1477356 m!1363347))

(declare-fun m!1363349 () Bool)

(assert (=> b!1477370 m!1363349))

(declare-fun m!1363351 () Bool)

(assert (=> b!1477370 m!1363351))

(assert (=> b!1477370 m!1363311))

(declare-fun m!1363353 () Bool)

(assert (=> b!1477370 m!1363353))

(declare-fun m!1363355 () Bool)

(assert (=> b!1477370 m!1363355))

(assert (=> b!1477370 m!1363311))

(assert (=> b!1477368 m!1363311))

(assert (=> b!1477368 m!1363311))

(declare-fun m!1363357 () Bool)

(assert (=> b!1477368 m!1363357))

(check-sat (not b!1477360) (not b!1477368) (not b!1477359) (not b!1477366) (not b!1477370) (not b!1477371) (not start!126162) (not b!1477355) (not b!1477354) (not b!1477362) (not b!1477356) (not b!1477365))
(check-sat)
