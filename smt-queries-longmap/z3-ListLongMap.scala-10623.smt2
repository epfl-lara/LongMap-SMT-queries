; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125094 () Bool)

(assert start!125094)

(declare-fun b!1451550 () Bool)

(declare-fun res!982101 () Bool)

(declare-fun e!817482 () Bool)

(assert (=> b!1451550 (=> (not res!982101) (not e!817482))))

(declare-fun e!817478 () Bool)

(assert (=> b!1451550 (= res!982101 e!817478)))

(declare-fun c!134251 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451550 (= c!134251 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451551 () Bool)

(declare-fun res!982091 () Bool)

(declare-fun e!817481 () Bool)

(assert (=> b!1451551 (=> (not res!982091) (not e!817481))))

(declare-datatypes ((array!98437 0))(
  ( (array!98438 (arr!47503 (Array (_ BitVec 32) (_ BitVec 64))) (size!48054 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98437)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451551 (= res!982091 (validKeyInArray!0 (select (arr!47503 a!2862) j!93)))))

(declare-fun lt!636684 () (_ BitVec 64))

(declare-fun b!1451552 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!636688 () array!98437)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11652 0))(
  ( (MissingZero!11652 (index!49000 (_ BitVec 32))) (Found!11652 (index!49001 (_ BitVec 32))) (Intermediate!11652 (undefined!12464 Bool) (index!49002 (_ BitVec 32)) (x!130837 (_ BitVec 32))) (Undefined!11652) (MissingVacant!11652 (index!49003 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98437 (_ BitVec 32)) SeekEntryResult!11652)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98437 (_ BitVec 32)) SeekEntryResult!11652)

(assert (=> b!1451552 (= e!817478 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636684 lt!636688 mask!2687) (seekEntryOrOpen!0 lt!636684 lt!636688 mask!2687)))))

(declare-fun b!1451553 () Bool)

(declare-fun res!982090 () Bool)

(declare-fun e!817474 () Bool)

(assert (=> b!1451553 (=> (not res!982090) (not e!817474))))

(declare-fun lt!636690 () SeekEntryResult!11652)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98437 (_ BitVec 32)) SeekEntryResult!11652)

(assert (=> b!1451553 (= res!982090 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!636690))))

(declare-fun res!982093 () Bool)

(assert (=> start!125094 (=> (not res!982093) (not e!817481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125094 (= res!982093 (validMask!0 mask!2687))))

(assert (=> start!125094 e!817481))

(assert (=> start!125094 true))

(declare-fun array_inv!36784 (array!98437) Bool)

(assert (=> start!125094 (array_inv!36784 a!2862)))

(declare-fun b!1451554 () Bool)

(declare-fun res!982103 () Bool)

(assert (=> b!1451554 (=> (not res!982103) (not e!817481))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451554 (= res!982103 (and (= (size!48054 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48054 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48054 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451555 () Bool)

(declare-fun e!817479 () Bool)

(assert (=> b!1451555 (= e!817481 e!817479)))

(declare-fun res!982096 () Bool)

(assert (=> b!1451555 (=> (not res!982096) (not e!817479))))

(assert (=> b!1451555 (= res!982096 (= (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451555 (= lt!636688 (array!98438 (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48054 a!2862)))))

(declare-fun b!1451556 () Bool)

(declare-fun e!817475 () Bool)

(assert (=> b!1451556 (= e!817482 (not e!817475))))

(declare-fun res!982092 () Bool)

(assert (=> b!1451556 (=> res!982092 e!817475)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451556 (= res!982092 (or (and (= (select (arr!47503 a!2862) index!646) (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47503 a!2862) index!646) (select (arr!47503 a!2862) j!93))) (not (= (select (arr!47503 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!817473 () Bool)

(assert (=> b!1451556 e!817473))

(declare-fun res!982089 () Bool)

(assert (=> b!1451556 (=> (not res!982089) (not e!817473))))

(declare-fun lt!636687 () SeekEntryResult!11652)

(declare-fun lt!636685 () SeekEntryResult!11652)

(assert (=> b!1451556 (= res!982089 (and (= lt!636687 lt!636685) (or (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) (select (arr!47503 a!2862) j!93)))))))

(assert (=> b!1451556 (= lt!636685 (Found!11652 j!93))))

(assert (=> b!1451556 (= lt!636687 (seekEntryOrOpen!0 (select (arr!47503 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98437 (_ BitVec 32)) Bool)

(assert (=> b!1451556 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48833 0))(
  ( (Unit!48834) )
))
(declare-fun lt!636689 () Unit!48833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48833)

(assert (=> b!1451556 (= lt!636689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451557 () Bool)

(assert (=> b!1451557 (= e!817474 e!817482)))

(declare-fun res!982098 () Bool)

(assert (=> b!1451557 (=> (not res!982098) (not e!817482))))

(declare-fun lt!636686 () SeekEntryResult!11652)

(assert (=> b!1451557 (= res!982098 (= lt!636686 (Intermediate!11652 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451557 (= lt!636686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636684 mask!2687) lt!636684 lt!636688 mask!2687))))

(assert (=> b!1451557 (= lt!636684 (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451558 () Bool)

(assert (=> b!1451558 (= e!817478 (= lt!636686 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636684 lt!636688 mask!2687)))))

(declare-fun b!1451559 () Bool)

(assert (=> b!1451559 (= e!817479 e!817474)))

(declare-fun res!982087 () Bool)

(assert (=> b!1451559 (=> (not res!982087) (not e!817474))))

(assert (=> b!1451559 (= res!982087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47503 a!2862) j!93) mask!2687) (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!636690))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451559 (= lt!636690 (Intermediate!11652 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451560 () Bool)

(declare-fun e!817480 () Bool)

(declare-fun e!817477 () Bool)

(assert (=> b!1451560 (= e!817480 e!817477)))

(declare-fun res!982088 () Bool)

(assert (=> b!1451560 (=> (not res!982088) (not e!817477))))

(assert (=> b!1451560 (= res!982088 (= lt!636687 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47503 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451561 () Bool)

(declare-fun res!982100 () Bool)

(assert (=> b!1451561 (=> (not res!982100) (not e!817482))))

(assert (=> b!1451561 (= res!982100 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451562 () Bool)

(declare-fun res!982097 () Bool)

(assert (=> b!1451562 (=> (not res!982097) (not e!817481))))

(assert (=> b!1451562 (= res!982097 (validKeyInArray!0 (select (arr!47503 a!2862) i!1006)))))

(declare-fun b!1451563 () Bool)

(assert (=> b!1451563 (= e!817477 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451564 () Bool)

(assert (=> b!1451564 (= e!817473 e!817480)))

(declare-fun res!982094 () Bool)

(assert (=> b!1451564 (=> res!982094 e!817480)))

(assert (=> b!1451564 (= res!982094 (or (and (= (select (arr!47503 a!2862) index!646) (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47503 a!2862) index!646) (select (arr!47503 a!2862) j!93))) (not (= (select (arr!47503 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451565 () Bool)

(assert (=> b!1451565 (= e!817475 true)))

(assert (=> b!1451565 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636684 lt!636688 mask!2687) lt!636685)))

(declare-fun lt!636691 () Unit!48833)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48833)

(assert (=> b!1451565 (= lt!636691 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451566 () Bool)

(declare-fun res!982086 () Bool)

(assert (=> b!1451566 (=> (not res!982086) (not e!817481))))

(assert (=> b!1451566 (= res!982086 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48054 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48054 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48054 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451567 () Bool)

(declare-fun res!982095 () Bool)

(assert (=> b!1451567 (=> (not res!982095) (not e!817481))))

(assert (=> b!1451567 (= res!982095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451568 () Bool)

(declare-fun res!982102 () Bool)

(assert (=> b!1451568 (=> (not res!982102) (not e!817481))))

(declare-datatypes ((List!33991 0))(
  ( (Nil!33988) (Cons!33987 (h!35348 (_ BitVec 64)) (t!48677 List!33991)) )
))
(declare-fun arrayNoDuplicates!0 (array!98437 (_ BitVec 32) List!33991) Bool)

(assert (=> b!1451568 (= res!982102 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33988))))

(declare-fun b!1451569 () Bool)

(declare-fun res!982099 () Bool)

(assert (=> b!1451569 (=> res!982099 e!817475)))

(assert (=> b!1451569 (= res!982099 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!636685)))))

(assert (= (and start!125094 res!982093) b!1451554))

(assert (= (and b!1451554 res!982103) b!1451562))

(assert (= (and b!1451562 res!982097) b!1451551))

(assert (= (and b!1451551 res!982091) b!1451567))

(assert (= (and b!1451567 res!982095) b!1451568))

(assert (= (and b!1451568 res!982102) b!1451566))

(assert (= (and b!1451566 res!982086) b!1451555))

(assert (= (and b!1451555 res!982096) b!1451559))

(assert (= (and b!1451559 res!982087) b!1451553))

(assert (= (and b!1451553 res!982090) b!1451557))

(assert (= (and b!1451557 res!982098) b!1451550))

(assert (= (and b!1451550 c!134251) b!1451558))

(assert (= (and b!1451550 (not c!134251)) b!1451552))

(assert (= (and b!1451550 res!982101) b!1451561))

(assert (= (and b!1451561 res!982100) b!1451556))

(assert (= (and b!1451556 res!982089) b!1451564))

(assert (= (and b!1451564 (not res!982094)) b!1451560))

(assert (= (and b!1451560 res!982088) b!1451563))

(assert (= (and b!1451556 (not res!982092)) b!1451569))

(assert (= (and b!1451569 (not res!982099)) b!1451565))

(declare-fun m!1340323 () Bool)

(assert (=> start!125094 m!1340323))

(declare-fun m!1340325 () Bool)

(assert (=> start!125094 m!1340325))

(declare-fun m!1340327 () Bool)

(assert (=> b!1451565 m!1340327))

(declare-fun m!1340329 () Bool)

(assert (=> b!1451565 m!1340329))

(assert (=> b!1451552 m!1340327))

(declare-fun m!1340331 () Bool)

(assert (=> b!1451552 m!1340331))

(declare-fun m!1340333 () Bool)

(assert (=> b!1451557 m!1340333))

(assert (=> b!1451557 m!1340333))

(declare-fun m!1340335 () Bool)

(assert (=> b!1451557 m!1340335))

(declare-fun m!1340337 () Bool)

(assert (=> b!1451557 m!1340337))

(declare-fun m!1340339 () Bool)

(assert (=> b!1451557 m!1340339))

(declare-fun m!1340341 () Bool)

(assert (=> b!1451562 m!1340341))

(assert (=> b!1451562 m!1340341))

(declare-fun m!1340343 () Bool)

(assert (=> b!1451562 m!1340343))

(declare-fun m!1340345 () Bool)

(assert (=> b!1451560 m!1340345))

(assert (=> b!1451560 m!1340345))

(declare-fun m!1340347 () Bool)

(assert (=> b!1451560 m!1340347))

(declare-fun m!1340349 () Bool)

(assert (=> b!1451567 m!1340349))

(declare-fun m!1340351 () Bool)

(assert (=> b!1451568 m!1340351))

(declare-fun m!1340353 () Bool)

(assert (=> b!1451558 m!1340353))

(assert (=> b!1451559 m!1340345))

(assert (=> b!1451559 m!1340345))

(declare-fun m!1340355 () Bool)

(assert (=> b!1451559 m!1340355))

(assert (=> b!1451559 m!1340355))

(assert (=> b!1451559 m!1340345))

(declare-fun m!1340357 () Bool)

(assert (=> b!1451559 m!1340357))

(assert (=> b!1451553 m!1340345))

(assert (=> b!1451553 m!1340345))

(declare-fun m!1340359 () Bool)

(assert (=> b!1451553 m!1340359))

(declare-fun m!1340361 () Bool)

(assert (=> b!1451564 m!1340361))

(assert (=> b!1451564 m!1340337))

(declare-fun m!1340363 () Bool)

(assert (=> b!1451564 m!1340363))

(assert (=> b!1451564 m!1340345))

(declare-fun m!1340365 () Bool)

(assert (=> b!1451556 m!1340365))

(assert (=> b!1451556 m!1340337))

(declare-fun m!1340367 () Bool)

(assert (=> b!1451556 m!1340367))

(assert (=> b!1451556 m!1340363))

(assert (=> b!1451556 m!1340361))

(assert (=> b!1451556 m!1340345))

(declare-fun m!1340369 () Bool)

(assert (=> b!1451556 m!1340369))

(declare-fun m!1340371 () Bool)

(assert (=> b!1451556 m!1340371))

(assert (=> b!1451556 m!1340345))

(assert (=> b!1451551 m!1340345))

(assert (=> b!1451551 m!1340345))

(declare-fun m!1340373 () Bool)

(assert (=> b!1451551 m!1340373))

(assert (=> b!1451555 m!1340337))

(declare-fun m!1340375 () Bool)

(assert (=> b!1451555 m!1340375))

(assert (=> b!1451569 m!1340345))

(assert (=> b!1451569 m!1340345))

(declare-fun m!1340377 () Bool)

(assert (=> b!1451569 m!1340377))

(check-sat (not start!125094) (not b!1451553) (not b!1451562) (not b!1451556) (not b!1451565) (not b!1451552) (not b!1451569) (not b!1451568) (not b!1451559) (not b!1451560) (not b!1451567) (not b!1451551) (not b!1451558) (not b!1451557))
(check-sat)
