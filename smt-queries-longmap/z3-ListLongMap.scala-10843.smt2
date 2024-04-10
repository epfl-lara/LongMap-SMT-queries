; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126906 () Bool)

(assert start!126906)

(declare-fun b!1491274 () Bool)

(declare-fun e!835559 () Bool)

(declare-fun e!835556 () Bool)

(assert (=> b!1491274 (= e!835559 e!835556)))

(declare-fun res!1014466 () Bool)

(assert (=> b!1491274 (=> (not res!1014466) (not e!835556))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99679 0))(
  ( (array!99680 (arr!48111 (Array (_ BitVec 32) (_ BitVec 64))) (size!48661 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99679)

(assert (=> b!1491274 (= res!1014466 (= (select (store (arr!48111 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650225 () array!99679)

(assert (=> b!1491274 (= lt!650225 (array!99680 (store (arr!48111 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48661 a!2862)))))

(declare-fun b!1491275 () Bool)

(declare-fun res!1014475 () Bool)

(assert (=> b!1491275 (=> (not res!1014475) (not e!835559))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1491275 (= res!1014475 (and (= (size!48661 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48661 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48661 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491276 () Bool)

(declare-fun res!1014465 () Bool)

(assert (=> b!1491276 (=> (not res!1014465) (not e!835559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491276 (= res!1014465 (validKeyInArray!0 (select (arr!48111 a!2862) j!93)))))

(declare-fun b!1491277 () Bool)

(declare-fun res!1014463 () Bool)

(declare-fun e!835553 () Bool)

(assert (=> b!1491277 (=> (not res!1014463) (not e!835553))))

(declare-datatypes ((SeekEntryResult!12351 0))(
  ( (MissingZero!12351 (index!51796 (_ BitVec 32))) (Found!12351 (index!51797 (_ BitVec 32))) (Intermediate!12351 (undefined!13163 Bool) (index!51798 (_ BitVec 32)) (x!133383 (_ BitVec 32))) (Undefined!12351) (MissingVacant!12351 (index!51799 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99679 (_ BitVec 32)) SeekEntryResult!12351)

(assert (=> b!1491277 (= res!1014463 (= (seekEntryOrOpen!0 (select (arr!48111 a!2862) j!93) a!2862 mask!2687) (Found!12351 j!93)))))

(declare-fun b!1491278 () Bool)

(declare-fun res!1014464 () Bool)

(declare-fun e!835555 () Bool)

(assert (=> b!1491278 (=> (not res!1014464) (not e!835555))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491278 (= res!1014464 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491279 () Bool)

(declare-fun lt!650221 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!835558 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99679 (_ BitVec 32)) SeekEntryResult!12351)

(assert (=> b!1491279 (= e!835558 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650221 lt!650225 mask!2687) (seekEntryOrOpen!0 lt!650221 lt!650225 mask!2687)))))

(declare-fun b!1491280 () Bool)

(declare-fun e!835552 () Bool)

(assert (=> b!1491280 (= e!835556 e!835552)))

(declare-fun res!1014461 () Bool)

(assert (=> b!1491280 (=> (not res!1014461) (not e!835552))))

(declare-fun lt!650223 () SeekEntryResult!12351)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99679 (_ BitVec 32)) SeekEntryResult!12351)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491280 (= res!1014461 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48111 a!2862) j!93) mask!2687) (select (arr!48111 a!2862) j!93) a!2862 mask!2687) lt!650223))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491280 (= lt!650223 (Intermediate!12351 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491281 () Bool)

(declare-fun lt!650224 () SeekEntryResult!12351)

(assert (=> b!1491281 (= e!835558 (= lt!650224 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650221 lt!650225 mask!2687)))))

(declare-fun b!1491283 () Bool)

(declare-fun e!835554 () Bool)

(assert (=> b!1491283 (= e!835554 true)))

(declare-fun lt!650226 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491283 (= lt!650226 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491284 () Bool)

(declare-fun res!1014473 () Bool)

(assert (=> b!1491284 (=> (not res!1014473) (not e!835559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99679 (_ BitVec 32)) Bool)

(assert (=> b!1491284 (= res!1014473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491285 () Bool)

(declare-fun res!1014472 () Bool)

(assert (=> b!1491285 (=> (not res!1014472) (not e!835559))))

(assert (=> b!1491285 (= res!1014472 (validKeyInArray!0 (select (arr!48111 a!2862) i!1006)))))

(declare-fun b!1491286 () Bool)

(assert (=> b!1491286 (= e!835552 e!835555)))

(declare-fun res!1014471 () Bool)

(assert (=> b!1491286 (=> (not res!1014471) (not e!835555))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491286 (= res!1014471 (= lt!650224 (Intermediate!12351 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491286 (= lt!650224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650221 mask!2687) lt!650221 lt!650225 mask!2687))))

(assert (=> b!1491286 (= lt!650221 (select (store (arr!48111 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491287 () Bool)

(declare-fun res!1014474 () Bool)

(assert (=> b!1491287 (=> (not res!1014474) (not e!835552))))

(assert (=> b!1491287 (= res!1014474 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48111 a!2862) j!93) a!2862 mask!2687) lt!650223))))

(declare-fun b!1491288 () Bool)

(declare-fun res!1014470 () Bool)

(assert (=> b!1491288 (=> (not res!1014470) (not e!835559))))

(declare-datatypes ((List!34612 0))(
  ( (Nil!34609) (Cons!34608 (h!35991 (_ BitVec 64)) (t!49306 List!34612)) )
))
(declare-fun arrayNoDuplicates!0 (array!99679 (_ BitVec 32) List!34612) Bool)

(assert (=> b!1491288 (= res!1014470 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34609))))

(declare-fun b!1491289 () Bool)

(declare-fun res!1014469 () Bool)

(assert (=> b!1491289 (=> (not res!1014469) (not e!835559))))

(assert (=> b!1491289 (= res!1014469 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48661 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48661 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48661 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491290 () Bool)

(assert (=> b!1491290 (= e!835555 (not e!835554))))

(declare-fun res!1014468 () Bool)

(assert (=> b!1491290 (=> res!1014468 e!835554)))

(assert (=> b!1491290 (= res!1014468 (or (and (= (select (arr!48111 a!2862) index!646) (select (store (arr!48111 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48111 a!2862) index!646) (select (arr!48111 a!2862) j!93))) (= (select (arr!48111 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491290 e!835553))

(declare-fun res!1014467 () Bool)

(assert (=> b!1491290 (=> (not res!1014467) (not e!835553))))

(assert (=> b!1491290 (= res!1014467 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50042 0))(
  ( (Unit!50043) )
))
(declare-fun lt!650222 () Unit!50042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50042)

(assert (=> b!1491290 (= lt!650222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491291 () Bool)

(declare-fun res!1014462 () Bool)

(assert (=> b!1491291 (=> (not res!1014462) (not e!835555))))

(assert (=> b!1491291 (= res!1014462 e!835558)))

(declare-fun c!137934 () Bool)

(assert (=> b!1491291 (= c!137934 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1014460 () Bool)

(assert (=> start!126906 (=> (not res!1014460) (not e!835559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126906 (= res!1014460 (validMask!0 mask!2687))))

(assert (=> start!126906 e!835559))

(assert (=> start!126906 true))

(declare-fun array_inv!37139 (array!99679) Bool)

(assert (=> start!126906 (array_inv!37139 a!2862)))

(declare-fun b!1491282 () Bool)

(assert (=> b!1491282 (= e!835553 (or (= (select (arr!48111 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48111 a!2862) intermediateBeforeIndex!19) (select (arr!48111 a!2862) j!93))))))

(assert (= (and start!126906 res!1014460) b!1491275))

(assert (= (and b!1491275 res!1014475) b!1491285))

(assert (= (and b!1491285 res!1014472) b!1491276))

(assert (= (and b!1491276 res!1014465) b!1491284))

(assert (= (and b!1491284 res!1014473) b!1491288))

(assert (= (and b!1491288 res!1014470) b!1491289))

(assert (= (and b!1491289 res!1014469) b!1491274))

(assert (= (and b!1491274 res!1014466) b!1491280))

(assert (= (and b!1491280 res!1014461) b!1491287))

(assert (= (and b!1491287 res!1014474) b!1491286))

(assert (= (and b!1491286 res!1014471) b!1491291))

(assert (= (and b!1491291 c!137934) b!1491281))

(assert (= (and b!1491291 (not c!137934)) b!1491279))

(assert (= (and b!1491291 res!1014462) b!1491278))

(assert (= (and b!1491278 res!1014464) b!1491290))

(assert (= (and b!1491290 res!1014467) b!1491277))

(assert (= (and b!1491277 res!1014463) b!1491282))

(assert (= (and b!1491290 (not res!1014468)) b!1491283))

(declare-fun m!1375403 () Bool)

(assert (=> b!1491284 m!1375403))

(declare-fun m!1375405 () Bool)

(assert (=> b!1491276 m!1375405))

(assert (=> b!1491276 m!1375405))

(declare-fun m!1375407 () Bool)

(assert (=> b!1491276 m!1375407))

(declare-fun m!1375409 () Bool)

(assert (=> start!126906 m!1375409))

(declare-fun m!1375411 () Bool)

(assert (=> start!126906 m!1375411))

(declare-fun m!1375413 () Bool)

(assert (=> b!1491274 m!1375413))

(declare-fun m!1375415 () Bool)

(assert (=> b!1491274 m!1375415))

(assert (=> b!1491277 m!1375405))

(assert (=> b!1491277 m!1375405))

(declare-fun m!1375417 () Bool)

(assert (=> b!1491277 m!1375417))

(declare-fun m!1375419 () Bool)

(assert (=> b!1491288 m!1375419))

(declare-fun m!1375421 () Bool)

(assert (=> b!1491281 m!1375421))

(declare-fun m!1375423 () Bool)

(assert (=> b!1491286 m!1375423))

(assert (=> b!1491286 m!1375423))

(declare-fun m!1375425 () Bool)

(assert (=> b!1491286 m!1375425))

(assert (=> b!1491286 m!1375413))

(declare-fun m!1375427 () Bool)

(assert (=> b!1491286 m!1375427))

(declare-fun m!1375429 () Bool)

(assert (=> b!1491290 m!1375429))

(assert (=> b!1491290 m!1375413))

(declare-fun m!1375431 () Bool)

(assert (=> b!1491290 m!1375431))

(declare-fun m!1375433 () Bool)

(assert (=> b!1491290 m!1375433))

(declare-fun m!1375435 () Bool)

(assert (=> b!1491290 m!1375435))

(assert (=> b!1491290 m!1375405))

(declare-fun m!1375437 () Bool)

(assert (=> b!1491282 m!1375437))

(assert (=> b!1491282 m!1375405))

(declare-fun m!1375439 () Bool)

(assert (=> b!1491283 m!1375439))

(declare-fun m!1375441 () Bool)

(assert (=> b!1491279 m!1375441))

(declare-fun m!1375443 () Bool)

(assert (=> b!1491279 m!1375443))

(declare-fun m!1375445 () Bool)

(assert (=> b!1491285 m!1375445))

(assert (=> b!1491285 m!1375445))

(declare-fun m!1375447 () Bool)

(assert (=> b!1491285 m!1375447))

(assert (=> b!1491287 m!1375405))

(assert (=> b!1491287 m!1375405))

(declare-fun m!1375449 () Bool)

(assert (=> b!1491287 m!1375449))

(assert (=> b!1491280 m!1375405))

(assert (=> b!1491280 m!1375405))

(declare-fun m!1375451 () Bool)

(assert (=> b!1491280 m!1375451))

(assert (=> b!1491280 m!1375451))

(assert (=> b!1491280 m!1375405))

(declare-fun m!1375453 () Bool)

(assert (=> b!1491280 m!1375453))

(check-sat (not b!1491287) (not b!1491276) (not b!1491280) (not b!1491277) (not b!1491284) (not start!126906) (not b!1491286) (not b!1491283) (not b!1491285) (not b!1491290) (not b!1491281) (not b!1491288) (not b!1491279))
(check-sat)
