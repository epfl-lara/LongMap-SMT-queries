; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124972 () Bool)

(assert start!124972)

(declare-fun b!1453515 () Bool)

(declare-fun res!984627 () Bool)

(declare-fun e!818083 () Bool)

(assert (=> b!1453515 (=> (not res!984627) (not e!818083))))

(declare-datatypes ((array!98398 0))(
  ( (array!98399 (arr!47488 (Array (_ BitVec 32) (_ BitVec 64))) (size!48040 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98398)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453515 (= res!984627 (validKeyInArray!0 (select (arr!47488 a!2862) i!1006)))))

(declare-fun b!1453517 () Bool)

(declare-fun res!984625 () Bool)

(assert (=> b!1453517 (=> (not res!984625) (not e!818083))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453517 (= res!984625 (and (= (size!48040 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48040 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48040 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453518 () Bool)

(declare-fun res!984623 () Bool)

(declare-fun e!818080 () Bool)

(assert (=> b!1453518 (=> (not res!984623) (not e!818080))))

(declare-fun e!818084 () Bool)

(assert (=> b!1453518 (= res!984623 e!818084)))

(declare-fun c!133966 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453518 (= c!133966 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453519 () Bool)

(declare-fun e!818076 () Bool)

(declare-fun e!818077 () Bool)

(assert (=> b!1453519 (= e!818076 e!818077)))

(declare-fun res!984626 () Bool)

(assert (=> b!1453519 (=> (not res!984626) (not e!818077))))

(declare-datatypes ((SeekEntryResult!11765 0))(
  ( (MissingZero!11765 (index!49452 (_ BitVec 32))) (Found!11765 (index!49453 (_ BitVec 32))) (Intermediate!11765 (undefined!12577 Bool) (index!49454 (_ BitVec 32)) (x!131089 (_ BitVec 32))) (Undefined!11765) (MissingVacant!11765 (index!49455 (_ BitVec 32))) )
))
(declare-fun lt!637093 () SeekEntryResult!11765)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98398 (_ BitVec 32)) SeekEntryResult!11765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453519 (= res!984626 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47488 a!2862) j!93) mask!2687) (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!637093))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453519 (= lt!637093 (Intermediate!11765 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453520 () Bool)

(declare-fun res!984621 () Bool)

(declare-fun e!818078 () Bool)

(assert (=> b!1453520 (=> (not res!984621) (not e!818078))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98398 (_ BitVec 32)) SeekEntryResult!11765)

(assert (=> b!1453520 (= res!984621 (= (seekEntryOrOpen!0 (select (arr!47488 a!2862) j!93) a!2862 mask!2687) (Found!11765 j!93)))))

(declare-fun b!1453521 () Bool)

(declare-fun res!984618 () Bool)

(assert (=> b!1453521 (=> (not res!984618) (not e!818083))))

(declare-datatypes ((List!34067 0))(
  ( (Nil!34064) (Cons!34063 (h!35413 (_ BitVec 64)) (t!48753 List!34067)) )
))
(declare-fun arrayNoDuplicates!0 (array!98398 (_ BitVec 32) List!34067) Bool)

(assert (=> b!1453521 (= res!984618 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34064))))

(declare-fun lt!637089 () array!98398)

(declare-fun lt!637094 () (_ BitVec 64))

(declare-fun b!1453522 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98398 (_ BitVec 32)) SeekEntryResult!11765)

(assert (=> b!1453522 (= e!818084 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637094 lt!637089 mask!2687) (seekEntryOrOpen!0 lt!637094 lt!637089 mask!2687)))))

(declare-fun b!1453523 () Bool)

(declare-fun res!984624 () Bool)

(assert (=> b!1453523 (=> (not res!984624) (not e!818080))))

(assert (=> b!1453523 (= res!984624 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!637092 () (_ BitVec 32))

(declare-fun e!818082 () Bool)

(declare-fun b!1453524 () Bool)

(declare-fun lt!637091 () SeekEntryResult!11765)

(assert (=> b!1453524 (= e!818082 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637092 intermediateAfterIndex!19 lt!637094 lt!637089 mask!2687) lt!637091)))))

(declare-fun b!1453525 () Bool)

(declare-fun e!818085 () Bool)

(assert (=> b!1453525 (= e!818085 true)))

(declare-fun lt!637090 () Bool)

(assert (=> b!1453525 (= lt!637090 e!818082)))

(declare-fun c!133965 () Bool)

(assert (=> b!1453525 (= c!133965 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453526 () Bool)

(declare-fun res!984615 () Bool)

(assert (=> b!1453526 (=> (not res!984615) (not e!818083))))

(assert (=> b!1453526 (= res!984615 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48040 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48040 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48040 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453527 () Bool)

(declare-fun res!984622 () Bool)

(assert (=> b!1453527 (=> (not res!984622) (not e!818077))))

(assert (=> b!1453527 (= res!984622 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!637093))))

(declare-fun b!1453528 () Bool)

(declare-fun res!984613 () Bool)

(assert (=> b!1453528 (=> (not res!984613) (not e!818083))))

(assert (=> b!1453528 (= res!984613 (validKeyInArray!0 (select (arr!47488 a!2862) j!93)))))

(declare-fun res!984617 () Bool)

(assert (=> start!124972 (=> (not res!984617) (not e!818083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124972 (= res!984617 (validMask!0 mask!2687))))

(assert (=> start!124972 e!818083))

(assert (=> start!124972 true))

(declare-fun array_inv!36721 (array!98398) Bool)

(assert (=> start!124972 (array_inv!36721 a!2862)))

(declare-fun b!1453516 () Bool)

(assert (=> b!1453516 (= e!818077 e!818080)))

(declare-fun res!984611 () Bool)

(assert (=> b!1453516 (=> (not res!984611) (not e!818080))))

(declare-fun lt!637088 () SeekEntryResult!11765)

(assert (=> b!1453516 (= res!984611 (= lt!637088 (Intermediate!11765 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453516 (= lt!637088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637094 mask!2687) lt!637094 lt!637089 mask!2687))))

(assert (=> b!1453516 (= lt!637094 (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453529 () Bool)

(declare-fun res!984612 () Bool)

(assert (=> b!1453529 (=> (not res!984612) (not e!818083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98398 (_ BitVec 32)) Bool)

(assert (=> b!1453529 (= res!984612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453530 () Bool)

(declare-fun e!818079 () Bool)

(assert (=> b!1453530 (= e!818080 (not e!818079))))

(declare-fun res!984616 () Bool)

(assert (=> b!1453530 (=> res!984616 e!818079)))

(assert (=> b!1453530 (= res!984616 (or (and (= (select (arr!47488 a!2862) index!646) (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47488 a!2862) index!646) (select (arr!47488 a!2862) j!93))) (= (select (arr!47488 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453530 e!818078))

(declare-fun res!984614 () Bool)

(assert (=> b!1453530 (=> (not res!984614) (not e!818078))))

(assert (=> b!1453530 (= res!984614 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48867 0))(
  ( (Unit!48868) )
))
(declare-fun lt!637095 () Unit!48867)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48867)

(assert (=> b!1453530 (= lt!637095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453531 () Bool)

(assert (=> b!1453531 (= e!818079 e!818085)))

(declare-fun res!984620 () Bool)

(assert (=> b!1453531 (=> res!984620 e!818085)))

(assert (=> b!1453531 (= res!984620 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637092 #b00000000000000000000000000000000) (bvsge lt!637092 (size!48040 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453531 (= lt!637092 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453531 (= lt!637091 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637094 lt!637089 mask!2687))))

(assert (=> b!1453531 (= lt!637091 (seekEntryOrOpen!0 lt!637094 lt!637089 mask!2687))))

(declare-fun b!1453532 () Bool)

(assert (=> b!1453532 (= e!818083 e!818076)))

(declare-fun res!984628 () Bool)

(assert (=> b!1453532 (=> (not res!984628) (not e!818076))))

(assert (=> b!1453532 (= res!984628 (= (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453532 (= lt!637089 (array!98399 (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48040 a!2862)))))

(declare-fun b!1453533 () Bool)

(assert (=> b!1453533 (= e!818084 (= lt!637088 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637094 lt!637089 mask!2687)))))

(declare-fun b!1453534 () Bool)

(assert (=> b!1453534 (= e!818078 (and (or (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) (select (arr!47488 a!2862) j!93))) (let ((bdg!52999 (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47488 a!2862) index!646) bdg!52999) (= (select (arr!47488 a!2862) index!646) (select (arr!47488 a!2862) j!93))) (= (select (arr!47488 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!52999 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453535 () Bool)

(assert (=> b!1453535 (= e!818082 (not (= lt!637088 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637092 lt!637094 lt!637089 mask!2687))))))

(declare-fun b!1453536 () Bool)

(declare-fun res!984619 () Bool)

(assert (=> b!1453536 (=> res!984619 e!818085)))

(assert (=> b!1453536 (= res!984619 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637092 (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!637093)))))

(assert (= (and start!124972 res!984617) b!1453517))

(assert (= (and b!1453517 res!984625) b!1453515))

(assert (= (and b!1453515 res!984627) b!1453528))

(assert (= (and b!1453528 res!984613) b!1453529))

(assert (= (and b!1453529 res!984612) b!1453521))

(assert (= (and b!1453521 res!984618) b!1453526))

(assert (= (and b!1453526 res!984615) b!1453532))

(assert (= (and b!1453532 res!984628) b!1453519))

(assert (= (and b!1453519 res!984626) b!1453527))

(assert (= (and b!1453527 res!984622) b!1453516))

(assert (= (and b!1453516 res!984611) b!1453518))

(assert (= (and b!1453518 c!133966) b!1453533))

(assert (= (and b!1453518 (not c!133966)) b!1453522))

(assert (= (and b!1453518 res!984623) b!1453523))

(assert (= (and b!1453523 res!984624) b!1453530))

(assert (= (and b!1453530 res!984614) b!1453520))

(assert (= (and b!1453520 res!984621) b!1453534))

(assert (= (and b!1453530 (not res!984616)) b!1453531))

(assert (= (and b!1453531 (not res!984620)) b!1453536))

(assert (= (and b!1453536 (not res!984619)) b!1453525))

(assert (= (and b!1453525 c!133965) b!1453535))

(assert (= (and b!1453525 (not c!133965)) b!1453524))

(declare-fun m!1341465 () Bool)

(assert (=> b!1453530 m!1341465))

(declare-fun m!1341467 () Bool)

(assert (=> b!1453530 m!1341467))

(declare-fun m!1341469 () Bool)

(assert (=> b!1453530 m!1341469))

(declare-fun m!1341471 () Bool)

(assert (=> b!1453530 m!1341471))

(declare-fun m!1341473 () Bool)

(assert (=> b!1453530 m!1341473))

(declare-fun m!1341475 () Bool)

(assert (=> b!1453530 m!1341475))

(assert (=> b!1453528 m!1341475))

(assert (=> b!1453528 m!1341475))

(declare-fun m!1341477 () Bool)

(assert (=> b!1453528 m!1341477))

(declare-fun m!1341479 () Bool)

(assert (=> b!1453524 m!1341479))

(declare-fun m!1341481 () Bool)

(assert (=> b!1453533 m!1341481))

(declare-fun m!1341483 () Bool)

(assert (=> b!1453516 m!1341483))

(assert (=> b!1453516 m!1341483))

(declare-fun m!1341485 () Bool)

(assert (=> b!1453516 m!1341485))

(assert (=> b!1453516 m!1341467))

(declare-fun m!1341487 () Bool)

(assert (=> b!1453516 m!1341487))

(assert (=> b!1453527 m!1341475))

(assert (=> b!1453527 m!1341475))

(declare-fun m!1341489 () Bool)

(assert (=> b!1453527 m!1341489))

(declare-fun m!1341491 () Bool)

(assert (=> b!1453522 m!1341491))

(declare-fun m!1341493 () Bool)

(assert (=> b!1453522 m!1341493))

(assert (=> b!1453520 m!1341475))

(assert (=> b!1453520 m!1341475))

(declare-fun m!1341495 () Bool)

(assert (=> b!1453520 m!1341495))

(declare-fun m!1341497 () Bool)

(assert (=> start!124972 m!1341497))

(declare-fun m!1341499 () Bool)

(assert (=> start!124972 m!1341499))

(assert (=> b!1453519 m!1341475))

(assert (=> b!1453519 m!1341475))

(declare-fun m!1341501 () Bool)

(assert (=> b!1453519 m!1341501))

(assert (=> b!1453519 m!1341501))

(assert (=> b!1453519 m!1341475))

(declare-fun m!1341503 () Bool)

(assert (=> b!1453519 m!1341503))

(declare-fun m!1341505 () Bool)

(assert (=> b!1453529 m!1341505))

(assert (=> b!1453534 m!1341467))

(declare-fun m!1341507 () Bool)

(assert (=> b!1453534 m!1341507))

(assert (=> b!1453534 m!1341469))

(assert (=> b!1453534 m!1341471))

(assert (=> b!1453534 m!1341475))

(declare-fun m!1341509 () Bool)

(assert (=> b!1453535 m!1341509))

(declare-fun m!1341511 () Bool)

(assert (=> b!1453531 m!1341511))

(assert (=> b!1453531 m!1341491))

(assert (=> b!1453531 m!1341493))

(declare-fun m!1341513 () Bool)

(assert (=> b!1453515 m!1341513))

(assert (=> b!1453515 m!1341513))

(declare-fun m!1341515 () Bool)

(assert (=> b!1453515 m!1341515))

(assert (=> b!1453532 m!1341467))

(declare-fun m!1341517 () Bool)

(assert (=> b!1453532 m!1341517))

(declare-fun m!1341519 () Bool)

(assert (=> b!1453521 m!1341519))

(assert (=> b!1453536 m!1341475))

(assert (=> b!1453536 m!1341475))

(declare-fun m!1341521 () Bool)

(assert (=> b!1453536 m!1341521))

(check-sat (not b!1453536) (not b!1453527) (not b!1453521) (not b!1453524) (not b!1453515) (not b!1453530) (not b!1453522) (not b!1453531) (not b!1453519) (not b!1453535) (not b!1453529) (not start!124972) (not b!1453533) (not b!1453516) (not b!1453528) (not b!1453520))
(check-sat)
