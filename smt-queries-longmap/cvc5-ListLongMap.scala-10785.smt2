; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126208 () Bool)

(assert start!126208)

(declare-fun b!1478596 () Bool)

(declare-fun res!1004604 () Bool)

(declare-fun e!829427 () Bool)

(assert (=> b!1478596 (=> (not res!1004604) (not e!829427))))

(declare-datatypes ((array!99314 0))(
  ( (array!99315 (arr!47936 (Array (_ BitVec 32) (_ BitVec 64))) (size!48486 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99314)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478596 (= res!1004604 (validKeyInArray!0 (select (arr!47936 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!829429 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!645738 () (_ BitVec 64))

(declare-fun lt!645736 () array!99314)

(declare-fun b!1478597 () Bool)

(declare-datatypes ((SeekEntryResult!12176 0))(
  ( (MissingZero!12176 (index!51096 (_ BitVec 32))) (Found!12176 (index!51097 (_ BitVec 32))) (Intermediate!12176 (undefined!12988 Bool) (index!51098 (_ BitVec 32)) (x!132687 (_ BitVec 32))) (Undefined!12176) (MissingVacant!12176 (index!51099 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99314 (_ BitVec 32)) SeekEntryResult!12176)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99314 (_ BitVec 32)) SeekEntryResult!12176)

(assert (=> b!1478597 (= e!829429 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645738 lt!645736 mask!2687) (seekEntryOrOpen!0 lt!645738 lt!645736 mask!2687)))))

(declare-fun b!1478598 () Bool)

(declare-fun e!829425 () Bool)

(declare-fun e!829428 () Bool)

(assert (=> b!1478598 (= e!829425 e!829428)))

(declare-fun res!1004608 () Bool)

(assert (=> b!1478598 (=> (not res!1004608) (not e!829428))))

(declare-fun lt!645733 () SeekEntryResult!12176)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99314 (_ BitVec 32)) SeekEntryResult!12176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478598 (= res!1004608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47936 a!2862) j!93) mask!2687) (select (arr!47936 a!2862) j!93) a!2862 mask!2687) lt!645733))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478598 (= lt!645733 (Intermediate!12176 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478599 () Bool)

(declare-fun res!1004597 () Bool)

(assert (=> b!1478599 (=> (not res!1004597) (not e!829427))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478599 (= res!1004597 (and (= (size!48486 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48486 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48486 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478600 () Bool)

(declare-fun res!1004599 () Bool)

(declare-fun e!829426 () Bool)

(assert (=> b!1478600 (=> (not res!1004599) (not e!829426))))

(assert (=> b!1478600 (= res!1004599 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1004598 () Bool)

(assert (=> start!126208 (=> (not res!1004598) (not e!829427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126208 (= res!1004598 (validMask!0 mask!2687))))

(assert (=> start!126208 e!829427))

(assert (=> start!126208 true))

(declare-fun array_inv!36964 (array!99314) Bool)

(assert (=> start!126208 (array_inv!36964 a!2862)))

(declare-fun b!1478601 () Bool)

(declare-fun res!1004602 () Bool)

(assert (=> b!1478601 (=> (not res!1004602) (not e!829427))))

(declare-datatypes ((List!34437 0))(
  ( (Nil!34434) (Cons!34433 (h!35801 (_ BitVec 64)) (t!49131 List!34437)) )
))
(declare-fun arrayNoDuplicates!0 (array!99314 (_ BitVec 32) List!34437) Bool)

(assert (=> b!1478601 (= res!1004602 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34434))))

(declare-fun b!1478602 () Bool)

(assert (=> b!1478602 (= e!829428 e!829426)))

(declare-fun res!1004595 () Bool)

(assert (=> b!1478602 (=> (not res!1004595) (not e!829426))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645735 () SeekEntryResult!12176)

(assert (=> b!1478602 (= res!1004595 (= lt!645735 (Intermediate!12176 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478602 (= lt!645735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645738 mask!2687) lt!645738 lt!645736 mask!2687))))

(assert (=> b!1478602 (= lt!645738 (select (store (arr!47936 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!829430 () Bool)

(declare-fun b!1478603 () Bool)

(assert (=> b!1478603 (= e!829430 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478604 () Bool)

(declare-fun res!1004607 () Bool)

(assert (=> b!1478604 (=> (not res!1004607) (not e!829427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99314 (_ BitVec 32)) Bool)

(assert (=> b!1478604 (= res!1004607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478605 () Bool)

(declare-fun res!1004594 () Bool)

(assert (=> b!1478605 (=> (not res!1004594) (not e!829428))))

(assert (=> b!1478605 (= res!1004594 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47936 a!2862) j!93) a!2862 mask!2687) lt!645733))))

(declare-fun b!1478606 () Bool)

(declare-fun res!1004603 () Bool)

(assert (=> b!1478606 (=> (not res!1004603) (not e!829427))))

(assert (=> b!1478606 (= res!1004603 (validKeyInArray!0 (select (arr!47936 a!2862) i!1006)))))

(declare-fun b!1478607 () Bool)

(declare-fun e!829423 () Bool)

(assert (=> b!1478607 (= e!829423 e!829430)))

(declare-fun res!1004596 () Bool)

(assert (=> b!1478607 (=> (not res!1004596) (not e!829430))))

(declare-fun lt!645734 () SeekEntryResult!12176)

(assert (=> b!1478607 (= res!1004596 (= lt!645734 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47936 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478608 () Bool)

(declare-fun res!1004601 () Bool)

(assert (=> b!1478608 (=> (not res!1004601) (not e!829426))))

(assert (=> b!1478608 (= res!1004601 e!829429)))

(declare-fun c!136521 () Bool)

(assert (=> b!1478608 (= c!136521 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478609 () Bool)

(assert (=> b!1478609 (= e!829426 (not (or (and (= (select (arr!47936 a!2862) index!646) (select (store (arr!47936 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47936 a!2862) index!646) (select (arr!47936 a!2862) j!93))) (not (= (select (arr!47936 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!47936 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829424 () Bool)

(assert (=> b!1478609 e!829424))

(declare-fun res!1004600 () Bool)

(assert (=> b!1478609 (=> (not res!1004600) (not e!829424))))

(assert (=> b!1478609 (= res!1004600 (and (= lt!645734 (Found!12176 j!93)) (or (= (select (arr!47936 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47936 a!2862) intermediateBeforeIndex!19) (select (arr!47936 a!2862) j!93)))))))

(assert (=> b!1478609 (= lt!645734 (seekEntryOrOpen!0 (select (arr!47936 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478609 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49692 0))(
  ( (Unit!49693) )
))
(declare-fun lt!645737 () Unit!49692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49692)

(assert (=> b!1478609 (= lt!645737 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478610 () Bool)

(assert (=> b!1478610 (= e!829429 (= lt!645735 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645738 lt!645736 mask!2687)))))

(declare-fun b!1478611 () Bool)

(assert (=> b!1478611 (= e!829424 e!829423)))

(declare-fun res!1004606 () Bool)

(assert (=> b!1478611 (=> res!1004606 e!829423)))

(assert (=> b!1478611 (= res!1004606 (or (and (= (select (arr!47936 a!2862) index!646) (select (store (arr!47936 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47936 a!2862) index!646) (select (arr!47936 a!2862) j!93))) (not (= (select (arr!47936 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478612 () Bool)

(declare-fun res!1004593 () Bool)

(assert (=> b!1478612 (=> (not res!1004593) (not e!829427))))

(assert (=> b!1478612 (= res!1004593 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48486 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48486 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48486 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478613 () Bool)

(assert (=> b!1478613 (= e!829427 e!829425)))

(declare-fun res!1004605 () Bool)

(assert (=> b!1478613 (=> (not res!1004605) (not e!829425))))

(assert (=> b!1478613 (= res!1004605 (= (select (store (arr!47936 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478613 (= lt!645736 (array!99315 (store (arr!47936 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48486 a!2862)))))

(assert (= (and start!126208 res!1004598) b!1478599))

(assert (= (and b!1478599 res!1004597) b!1478606))

(assert (= (and b!1478606 res!1004603) b!1478596))

(assert (= (and b!1478596 res!1004604) b!1478604))

(assert (= (and b!1478604 res!1004607) b!1478601))

(assert (= (and b!1478601 res!1004602) b!1478612))

(assert (= (and b!1478612 res!1004593) b!1478613))

(assert (= (and b!1478613 res!1004605) b!1478598))

(assert (= (and b!1478598 res!1004608) b!1478605))

(assert (= (and b!1478605 res!1004594) b!1478602))

(assert (= (and b!1478602 res!1004595) b!1478608))

(assert (= (and b!1478608 c!136521) b!1478610))

(assert (= (and b!1478608 (not c!136521)) b!1478597))

(assert (= (and b!1478608 res!1004601) b!1478600))

(assert (= (and b!1478600 res!1004599) b!1478609))

(assert (= (and b!1478609 res!1004600) b!1478611))

(assert (= (and b!1478611 (not res!1004606)) b!1478607))

(assert (= (and b!1478607 res!1004596) b!1478603))

(declare-fun m!1364503 () Bool)

(assert (=> b!1478598 m!1364503))

(assert (=> b!1478598 m!1364503))

(declare-fun m!1364505 () Bool)

(assert (=> b!1478598 m!1364505))

(assert (=> b!1478598 m!1364505))

(assert (=> b!1478598 m!1364503))

(declare-fun m!1364507 () Bool)

(assert (=> b!1478598 m!1364507))

(declare-fun m!1364509 () Bool)

(assert (=> b!1478610 m!1364509))

(declare-fun m!1364511 () Bool)

(assert (=> b!1478597 m!1364511))

(declare-fun m!1364513 () Bool)

(assert (=> b!1478597 m!1364513))

(declare-fun m!1364515 () Bool)

(assert (=> start!126208 m!1364515))

(declare-fun m!1364517 () Bool)

(assert (=> start!126208 m!1364517))

(declare-fun m!1364519 () Bool)

(assert (=> b!1478602 m!1364519))

(assert (=> b!1478602 m!1364519))

(declare-fun m!1364521 () Bool)

(assert (=> b!1478602 m!1364521))

(declare-fun m!1364523 () Bool)

(assert (=> b!1478602 m!1364523))

(declare-fun m!1364525 () Bool)

(assert (=> b!1478602 m!1364525))

(declare-fun m!1364527 () Bool)

(assert (=> b!1478601 m!1364527))

(declare-fun m!1364529 () Bool)

(assert (=> b!1478609 m!1364529))

(assert (=> b!1478609 m!1364523))

(declare-fun m!1364531 () Bool)

(assert (=> b!1478609 m!1364531))

(declare-fun m!1364533 () Bool)

(assert (=> b!1478609 m!1364533))

(declare-fun m!1364535 () Bool)

(assert (=> b!1478609 m!1364535))

(assert (=> b!1478609 m!1364503))

(declare-fun m!1364537 () Bool)

(assert (=> b!1478609 m!1364537))

(declare-fun m!1364539 () Bool)

(assert (=> b!1478609 m!1364539))

(assert (=> b!1478609 m!1364503))

(assert (=> b!1478613 m!1364523))

(declare-fun m!1364541 () Bool)

(assert (=> b!1478613 m!1364541))

(assert (=> b!1478596 m!1364503))

(assert (=> b!1478596 m!1364503))

(declare-fun m!1364543 () Bool)

(assert (=> b!1478596 m!1364543))

(assert (=> b!1478611 m!1364535))

(assert (=> b!1478611 m!1364523))

(assert (=> b!1478611 m!1364533))

(assert (=> b!1478611 m!1364503))

(declare-fun m!1364545 () Bool)

(assert (=> b!1478606 m!1364545))

(assert (=> b!1478606 m!1364545))

(declare-fun m!1364547 () Bool)

(assert (=> b!1478606 m!1364547))

(assert (=> b!1478605 m!1364503))

(assert (=> b!1478605 m!1364503))

(declare-fun m!1364549 () Bool)

(assert (=> b!1478605 m!1364549))

(declare-fun m!1364551 () Bool)

(assert (=> b!1478604 m!1364551))

(assert (=> b!1478607 m!1364503))

(assert (=> b!1478607 m!1364503))

(declare-fun m!1364553 () Bool)

(assert (=> b!1478607 m!1364553))

(push 1)

