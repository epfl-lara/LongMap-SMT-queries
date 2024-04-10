; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125086 () Bool)

(assert start!125086)

(declare-fun e!819458 () Bool)

(declare-datatypes ((array!98534 0))(
  ( (array!98535 (arr!47555 (Array (_ BitVec 32) (_ BitVec 64))) (size!48105 (_ BitVec 32))) )
))
(declare-fun lt!638332 () array!98534)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638337 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1456483 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11807 0))(
  ( (MissingZero!11807 (index!49620 (_ BitVec 32))) (Found!11807 (index!49621 (_ BitVec 32))) (Intermediate!11807 (undefined!12619 Bool) (index!49622 (_ BitVec 32)) (x!131248 (_ BitVec 32))) (Undefined!11807) (MissingVacant!11807 (index!49623 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98534 (_ BitVec 32)) SeekEntryResult!11807)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98534 (_ BitVec 32)) SeekEntryResult!11807)

(assert (=> b!1456483 (= e!819458 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638337 lt!638332 mask!2687) (seekEntryOrOpen!0 lt!638337 lt!638332 mask!2687)))))

(declare-fun b!1456484 () Bool)

(declare-fun e!819455 () Bool)

(declare-fun e!819461 () Bool)

(assert (=> b!1456484 (= e!819455 e!819461)))

(declare-fun res!986960 () Bool)

(assert (=> b!1456484 (=> res!986960 e!819461)))

(declare-fun a!2862 () array!98534)

(declare-fun lt!638331 () (_ BitVec 32))

(assert (=> b!1456484 (= res!986960 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638331 #b00000000000000000000000000000000) (bvsge lt!638331 (size!48105 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456484 (= lt!638331 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638333 () SeekEntryResult!11807)

(assert (=> b!1456484 (= lt!638333 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638337 lt!638332 mask!2687))))

(assert (=> b!1456484 (= lt!638333 (seekEntryOrOpen!0 lt!638337 lt!638332 mask!2687))))

(declare-fun b!1456485 () Bool)

(declare-fun e!819453 () Bool)

(assert (=> b!1456485 (= e!819453 (not e!819455))))

(declare-fun res!986970 () Bool)

(assert (=> b!1456485 (=> res!986970 e!819455)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456485 (= res!986970 (or (and (= (select (arr!47555 a!2862) index!646) (select (store (arr!47555 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47555 a!2862) index!646) (select (arr!47555 a!2862) j!93))) (= (select (arr!47555 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819459 () Bool)

(assert (=> b!1456485 e!819459))

(declare-fun res!986962 () Bool)

(assert (=> b!1456485 (=> (not res!986962) (not e!819459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98534 (_ BitVec 32)) Bool)

(assert (=> b!1456485 (= res!986962 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49110 0))(
  ( (Unit!49111) )
))
(declare-fun lt!638336 () Unit!49110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49110)

(assert (=> b!1456485 (= lt!638336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456486 () Bool)

(declare-fun e!819452 () Bool)

(assert (=> b!1456486 (= e!819452 e!819453)))

(declare-fun res!986967 () Bool)

(assert (=> b!1456486 (=> (not res!986967) (not e!819453))))

(declare-fun lt!638334 () SeekEntryResult!11807)

(assert (=> b!1456486 (= res!986967 (= lt!638334 (Intermediate!11807 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98534 (_ BitVec 32)) SeekEntryResult!11807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456486 (= lt!638334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638337 mask!2687) lt!638337 lt!638332 mask!2687))))

(assert (=> b!1456486 (= lt!638337 (select (store (arr!47555 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456487 () Bool)

(declare-fun res!986968 () Bool)

(assert (=> b!1456487 (=> (not res!986968) (not e!819453))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456487 (= res!986968 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456488 () Bool)

(declare-fun res!986961 () Bool)

(declare-fun e!819457 () Bool)

(assert (=> b!1456488 (=> (not res!986961) (not e!819457))))

(declare-datatypes ((List!34056 0))(
  ( (Nil!34053) (Cons!34052 (h!35402 (_ BitVec 64)) (t!48750 List!34056)) )
))
(declare-fun arrayNoDuplicates!0 (array!98534 (_ BitVec 32) List!34056) Bool)

(assert (=> b!1456488 (= res!986961 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34053))))

(declare-fun b!1456489 () Bool)

(declare-fun e!819460 () Bool)

(assert (=> b!1456489 (= e!819460 e!819452)))

(declare-fun res!986974 () Bool)

(assert (=> b!1456489 (=> (not res!986974) (not e!819452))))

(declare-fun lt!638335 () SeekEntryResult!11807)

(assert (=> b!1456489 (= res!986974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47555 a!2862) j!93) mask!2687) (select (arr!47555 a!2862) j!93) a!2862 mask!2687) lt!638335))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1456489 (= lt!638335 (Intermediate!11807 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456490 () Bool)

(declare-fun res!986973 () Bool)

(assert (=> b!1456490 (=> (not res!986973) (not e!819457))))

(assert (=> b!1456490 (= res!986973 (and (= (size!48105 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48105 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48105 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456491 () Bool)

(declare-fun res!986958 () Bool)

(assert (=> b!1456491 (=> res!986958 e!819461)))

(assert (=> b!1456491 (= res!986958 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638331 (select (arr!47555 a!2862) j!93) a!2862 mask!2687) lt!638335)))))

(declare-fun b!1456492 () Bool)

(declare-fun res!986963 () Bool)

(assert (=> b!1456492 (=> (not res!986963) (not e!819457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456492 (= res!986963 (validKeyInArray!0 (select (arr!47555 a!2862) i!1006)))))

(declare-fun b!1456493 () Bool)

(declare-fun res!986964 () Bool)

(assert (=> b!1456493 (=> (not res!986964) (not e!819453))))

(assert (=> b!1456493 (= res!986964 e!819458)))

(declare-fun c!134274 () Bool)

(assert (=> b!1456493 (= c!134274 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456494 () Bool)

(assert (=> b!1456494 (= e!819458 (= lt!638334 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638337 lt!638332 mask!2687)))))

(declare-fun b!1456495 () Bool)

(assert (=> b!1456495 (= e!819457 e!819460)))

(declare-fun res!986972 () Bool)

(assert (=> b!1456495 (=> (not res!986972) (not e!819460))))

(assert (=> b!1456495 (= res!986972 (= (select (store (arr!47555 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456495 (= lt!638332 (array!98535 (store (arr!47555 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48105 a!2862)))))

(declare-fun b!1456496 () Bool)

(assert (=> b!1456496 (= e!819461 true)))

(declare-fun lt!638330 () Bool)

(declare-fun e!819456 () Bool)

(assert (=> b!1456496 (= lt!638330 e!819456)))

(declare-fun c!134273 () Bool)

(assert (=> b!1456496 (= c!134273 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!986971 () Bool)

(assert (=> start!125086 (=> (not res!986971) (not e!819457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125086 (= res!986971 (validMask!0 mask!2687))))

(assert (=> start!125086 e!819457))

(assert (=> start!125086 true))

(declare-fun array_inv!36583 (array!98534) Bool)

(assert (=> start!125086 (array_inv!36583 a!2862)))

(declare-fun b!1456482 () Bool)

(assert (=> b!1456482 (= e!819456 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638331 intermediateAfterIndex!19 lt!638337 lt!638332 mask!2687) lt!638333)))))

(declare-fun b!1456497 () Bool)

(declare-fun res!986966 () Bool)

(assert (=> b!1456497 (=> (not res!986966) (not e!819457))))

(assert (=> b!1456497 (= res!986966 (validKeyInArray!0 (select (arr!47555 a!2862) j!93)))))

(declare-fun b!1456498 () Bool)

(declare-fun res!986969 () Bool)

(assert (=> b!1456498 (=> (not res!986969) (not e!819452))))

(assert (=> b!1456498 (= res!986969 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47555 a!2862) j!93) a!2862 mask!2687) lt!638335))))

(declare-fun b!1456499 () Bool)

(declare-fun res!986965 () Bool)

(assert (=> b!1456499 (=> (not res!986965) (not e!819459))))

(assert (=> b!1456499 (= res!986965 (= (seekEntryOrOpen!0 (select (arr!47555 a!2862) j!93) a!2862 mask!2687) (Found!11807 j!93)))))

(declare-fun b!1456500 () Bool)

(declare-fun res!986959 () Bool)

(assert (=> b!1456500 (=> (not res!986959) (not e!819457))))

(assert (=> b!1456500 (= res!986959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456501 () Bool)

(assert (=> b!1456501 (= e!819459 (and (or (= (select (arr!47555 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47555 a!2862) intermediateBeforeIndex!19) (select (arr!47555 a!2862) j!93))) (let ((bdg!53251 (select (store (arr!47555 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47555 a!2862) index!646) bdg!53251) (= (select (arr!47555 a!2862) index!646) (select (arr!47555 a!2862) j!93))) (= (select (arr!47555 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53251 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456502 () Bool)

(declare-fun res!986957 () Bool)

(assert (=> b!1456502 (=> (not res!986957) (not e!819457))))

(assert (=> b!1456502 (= res!986957 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48105 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48105 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48105 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456503 () Bool)

(assert (=> b!1456503 (= e!819456 (not (= lt!638334 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638331 lt!638337 lt!638332 mask!2687))))))

(assert (= (and start!125086 res!986971) b!1456490))

(assert (= (and b!1456490 res!986973) b!1456492))

(assert (= (and b!1456492 res!986963) b!1456497))

(assert (= (and b!1456497 res!986966) b!1456500))

(assert (= (and b!1456500 res!986959) b!1456488))

(assert (= (and b!1456488 res!986961) b!1456502))

(assert (= (and b!1456502 res!986957) b!1456495))

(assert (= (and b!1456495 res!986972) b!1456489))

(assert (= (and b!1456489 res!986974) b!1456498))

(assert (= (and b!1456498 res!986969) b!1456486))

(assert (= (and b!1456486 res!986967) b!1456493))

(assert (= (and b!1456493 c!134274) b!1456494))

(assert (= (and b!1456493 (not c!134274)) b!1456483))

(assert (= (and b!1456493 res!986964) b!1456487))

(assert (= (and b!1456487 res!986968) b!1456485))

(assert (= (and b!1456485 res!986962) b!1456499))

(assert (= (and b!1456499 res!986965) b!1456501))

(assert (= (and b!1456485 (not res!986970)) b!1456484))

(assert (= (and b!1456484 (not res!986960)) b!1456491))

(assert (= (and b!1456491 (not res!986958)) b!1456496))

(assert (= (and b!1456496 c!134273) b!1456503))

(assert (= (and b!1456496 (not c!134273)) b!1456482))

(declare-fun m!1344577 () Bool)

(assert (=> b!1456489 m!1344577))

(assert (=> b!1456489 m!1344577))

(declare-fun m!1344579 () Bool)

(assert (=> b!1456489 m!1344579))

(assert (=> b!1456489 m!1344579))

(assert (=> b!1456489 m!1344577))

(declare-fun m!1344581 () Bool)

(assert (=> b!1456489 m!1344581))

(declare-fun m!1344583 () Bool)

(assert (=> b!1456488 m!1344583))

(declare-fun m!1344585 () Bool)

(assert (=> b!1456500 m!1344585))

(declare-fun m!1344587 () Bool)

(assert (=> start!125086 m!1344587))

(declare-fun m!1344589 () Bool)

(assert (=> start!125086 m!1344589))

(assert (=> b!1456498 m!1344577))

(assert (=> b!1456498 m!1344577))

(declare-fun m!1344591 () Bool)

(assert (=> b!1456498 m!1344591))

(declare-fun m!1344593 () Bool)

(assert (=> b!1456492 m!1344593))

(assert (=> b!1456492 m!1344593))

(declare-fun m!1344595 () Bool)

(assert (=> b!1456492 m!1344595))

(declare-fun m!1344597 () Bool)

(assert (=> b!1456503 m!1344597))

(declare-fun m!1344599 () Bool)

(assert (=> b!1456482 m!1344599))

(declare-fun m!1344601 () Bool)

(assert (=> b!1456486 m!1344601))

(assert (=> b!1456486 m!1344601))

(declare-fun m!1344603 () Bool)

(assert (=> b!1456486 m!1344603))

(declare-fun m!1344605 () Bool)

(assert (=> b!1456486 m!1344605))

(declare-fun m!1344607 () Bool)

(assert (=> b!1456486 m!1344607))

(declare-fun m!1344609 () Bool)

(assert (=> b!1456485 m!1344609))

(assert (=> b!1456485 m!1344605))

(declare-fun m!1344611 () Bool)

(assert (=> b!1456485 m!1344611))

(declare-fun m!1344613 () Bool)

(assert (=> b!1456485 m!1344613))

(declare-fun m!1344615 () Bool)

(assert (=> b!1456485 m!1344615))

(assert (=> b!1456485 m!1344577))

(assert (=> b!1456495 m!1344605))

(declare-fun m!1344617 () Bool)

(assert (=> b!1456495 m!1344617))

(declare-fun m!1344619 () Bool)

(assert (=> b!1456494 m!1344619))

(declare-fun m!1344621 () Bool)

(assert (=> b!1456484 m!1344621))

(declare-fun m!1344623 () Bool)

(assert (=> b!1456484 m!1344623))

(declare-fun m!1344625 () Bool)

(assert (=> b!1456484 m!1344625))

(assert (=> b!1456497 m!1344577))

(assert (=> b!1456497 m!1344577))

(declare-fun m!1344627 () Bool)

(assert (=> b!1456497 m!1344627))

(assert (=> b!1456491 m!1344577))

(assert (=> b!1456491 m!1344577))

(declare-fun m!1344629 () Bool)

(assert (=> b!1456491 m!1344629))

(assert (=> b!1456483 m!1344623))

(assert (=> b!1456483 m!1344625))

(assert (=> b!1456501 m!1344605))

(declare-fun m!1344631 () Bool)

(assert (=> b!1456501 m!1344631))

(assert (=> b!1456501 m!1344611))

(assert (=> b!1456501 m!1344613))

(assert (=> b!1456501 m!1344577))

(assert (=> b!1456499 m!1344577))

(assert (=> b!1456499 m!1344577))

(declare-fun m!1344633 () Bool)

(assert (=> b!1456499 m!1344633))

(push 1)

