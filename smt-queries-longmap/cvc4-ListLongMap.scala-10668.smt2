; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125150 () Bool)

(assert start!125150)

(declare-fun res!988689 () Bool)

(declare-fun e!820421 () Bool)

(assert (=> start!125150 (=> (not res!988689) (not e!820421))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125150 (= res!988689 (validMask!0 mask!2687))))

(assert (=> start!125150 e!820421))

(assert (=> start!125150 true))

(declare-datatypes ((array!98598 0))(
  ( (array!98599 (arr!47587 (Array (_ BitVec 32) (_ BitVec 64))) (size!48137 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98598)

(declare-fun array_inv!36615 (array!98598) Bool)

(assert (=> start!125150 (array_inv!36615 a!2862)))

(declare-fun b!1458594 () Bool)

(declare-fun e!820416 () Bool)

(declare-fun e!820420 () Bool)

(assert (=> b!1458594 (= e!820416 e!820420)))

(declare-fun res!988701 () Bool)

(assert (=> b!1458594 (=> (not res!988701) (not e!820420))))

(declare-datatypes ((SeekEntryResult!11839 0))(
  ( (MissingZero!11839 (index!49748 (_ BitVec 32))) (Found!11839 (index!49749 (_ BitVec 32))) (Intermediate!11839 (undefined!12651 Bool) (index!49750 (_ BitVec 32)) (x!131360 (_ BitVec 32))) (Undefined!11839) (MissingVacant!11839 (index!49751 (_ BitVec 32))) )
))
(declare-fun lt!639098 () SeekEntryResult!11839)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98598 (_ BitVec 32)) SeekEntryResult!11839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458594 (= res!988701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47587 a!2862) j!93) mask!2687) (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!639098))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458594 (= lt!639098 (Intermediate!11839 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458595 () Bool)

(declare-fun res!988702 () Bool)

(declare-fun e!820417 () Bool)

(assert (=> b!1458595 (=> (not res!988702) (not e!820417))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98598 (_ BitVec 32)) SeekEntryResult!11839)

(assert (=> b!1458595 (= res!988702 (= (seekEntryOrOpen!0 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) (Found!11839 j!93)))))

(declare-fun b!1458596 () Bool)

(declare-fun res!988694 () Bool)

(declare-fun e!820415 () Bool)

(assert (=> b!1458596 (=> (not res!988694) (not e!820415))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458596 (= res!988694 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458597 () Bool)

(declare-fun res!988688 () Bool)

(assert (=> b!1458597 (=> (not res!988688) (not e!820421))))

(declare-datatypes ((List!34088 0))(
  ( (Nil!34085) (Cons!34084 (h!35434 (_ BitVec 64)) (t!48782 List!34088)) )
))
(declare-fun arrayNoDuplicates!0 (array!98598 (_ BitVec 32) List!34088) Bool)

(assert (=> b!1458597 (= res!988688 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34085))))

(declare-fun b!1458598 () Bool)

(declare-fun res!988687 () Bool)

(assert (=> b!1458598 (=> (not res!988687) (not e!820421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458598 (= res!988687 (validKeyInArray!0 (select (arr!47587 a!2862) j!93)))))

(declare-fun b!1458599 () Bool)

(assert (=> b!1458599 (= e!820420 e!820415)))

(declare-fun res!988692 () Bool)

(assert (=> b!1458599 (=> (not res!988692) (not e!820415))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!639100 () SeekEntryResult!11839)

(assert (=> b!1458599 (= res!988692 (= lt!639100 (Intermediate!11839 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639105 () array!98598)

(declare-fun lt!639101 () (_ BitVec 64))

(assert (=> b!1458599 (= lt!639100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639101 mask!2687) lt!639101 lt!639105 mask!2687))))

(assert (=> b!1458599 (= lt!639101 (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458600 () Bool)

(declare-fun res!988693 () Bool)

(assert (=> b!1458600 (=> (not res!988693) (not e!820421))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1458600 (= res!988693 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48137 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48137 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48137 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458601 () Bool)

(declare-fun res!988686 () Bool)

(assert (=> b!1458601 (=> (not res!988686) (not e!820421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98598 (_ BitVec 32)) Bool)

(assert (=> b!1458601 (= res!988686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458602 () Bool)

(declare-fun res!988700 () Bool)

(assert (=> b!1458602 (=> (not res!988700) (not e!820415))))

(declare-fun e!820412 () Bool)

(assert (=> b!1458602 (= res!988700 e!820412)))

(declare-fun c!134466 () Bool)

(assert (=> b!1458602 (= c!134466 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458603 () Bool)

(declare-fun res!988696 () Bool)

(assert (=> b!1458603 (=> (not res!988696) (not e!820420))))

(assert (=> b!1458603 (= res!988696 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!639098))))

(declare-fun b!1458604 () Bool)

(declare-fun e!820418 () Bool)

(assert (=> b!1458604 (= e!820418 true)))

(declare-fun lt!639103 () Bool)

(declare-fun e!820413 () Bool)

(assert (=> b!1458604 (= lt!639103 e!820413)))

(declare-fun c!134465 () Bool)

(assert (=> b!1458604 (= c!134465 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458605 () Bool)

(assert (=> b!1458605 (= e!820417 (and (or (= (select (arr!47587 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47587 a!2862) intermediateBeforeIndex!19) (select (arr!47587 a!2862) j!93))) (let ((bdg!53437 (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47587 a!2862) index!646) bdg!53437) (= (select (arr!47587 a!2862) index!646) (select (arr!47587 a!2862) j!93))) (= (select (arr!47587 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53437 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458606 () Bool)

(assert (=> b!1458606 (= e!820412 (= lt!639100 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639101 lt!639105 mask!2687)))))

(declare-fun b!1458607 () Bool)

(assert (=> b!1458607 (= e!820421 e!820416)))

(declare-fun res!988695 () Bool)

(assert (=> b!1458607 (=> (not res!988695) (not e!820416))))

(assert (=> b!1458607 (= res!988695 (= (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458607 (= lt!639105 (array!98599 (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48137 a!2862)))))

(declare-fun b!1458608 () Bool)

(declare-fun res!988697 () Bool)

(assert (=> b!1458608 (=> res!988697 e!820418)))

(declare-fun lt!639104 () (_ BitVec 32))

(assert (=> b!1458608 (= res!988697 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639104 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!639098)))))

(declare-fun lt!639102 () SeekEntryResult!11839)

(declare-fun b!1458609 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98598 (_ BitVec 32)) SeekEntryResult!11839)

(assert (=> b!1458609 (= e!820413 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639104 intermediateAfterIndex!19 lt!639101 lt!639105 mask!2687) lt!639102)))))

(declare-fun b!1458610 () Bool)

(declare-fun res!988690 () Bool)

(assert (=> b!1458610 (=> (not res!988690) (not e!820421))))

(assert (=> b!1458610 (= res!988690 (and (= (size!48137 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48137 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48137 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458611 () Bool)

(assert (=> b!1458611 (= e!820412 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639101 lt!639105 mask!2687) (seekEntryOrOpen!0 lt!639101 lt!639105 mask!2687)))))

(declare-fun b!1458612 () Bool)

(assert (=> b!1458612 (= e!820413 (not (= lt!639100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639104 lt!639101 lt!639105 mask!2687))))))

(declare-fun b!1458613 () Bool)

(declare-fun res!988698 () Bool)

(assert (=> b!1458613 (=> (not res!988698) (not e!820421))))

(assert (=> b!1458613 (= res!988698 (validKeyInArray!0 (select (arr!47587 a!2862) i!1006)))))

(declare-fun b!1458614 () Bool)

(declare-fun e!820419 () Bool)

(assert (=> b!1458614 (= e!820415 (not e!820419))))

(declare-fun res!988699 () Bool)

(assert (=> b!1458614 (=> res!988699 e!820419)))

(assert (=> b!1458614 (= res!988699 (or (and (= (select (arr!47587 a!2862) index!646) (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47587 a!2862) index!646) (select (arr!47587 a!2862) j!93))) (= (select (arr!47587 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458614 e!820417))

(declare-fun res!988685 () Bool)

(assert (=> b!1458614 (=> (not res!988685) (not e!820417))))

(assert (=> b!1458614 (= res!988685 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49174 0))(
  ( (Unit!49175) )
))
(declare-fun lt!639099 () Unit!49174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49174)

(assert (=> b!1458614 (= lt!639099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458615 () Bool)

(assert (=> b!1458615 (= e!820419 e!820418)))

(declare-fun res!988691 () Bool)

(assert (=> b!1458615 (=> res!988691 e!820418)))

(assert (=> b!1458615 (= res!988691 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639104 #b00000000000000000000000000000000) (bvsge lt!639104 (size!48137 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458615 (= lt!639104 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458615 (= lt!639102 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639101 lt!639105 mask!2687))))

(assert (=> b!1458615 (= lt!639102 (seekEntryOrOpen!0 lt!639101 lt!639105 mask!2687))))

(assert (= (and start!125150 res!988689) b!1458610))

(assert (= (and b!1458610 res!988690) b!1458613))

(assert (= (and b!1458613 res!988698) b!1458598))

(assert (= (and b!1458598 res!988687) b!1458601))

(assert (= (and b!1458601 res!988686) b!1458597))

(assert (= (and b!1458597 res!988688) b!1458600))

(assert (= (and b!1458600 res!988693) b!1458607))

(assert (= (and b!1458607 res!988695) b!1458594))

(assert (= (and b!1458594 res!988701) b!1458603))

(assert (= (and b!1458603 res!988696) b!1458599))

(assert (= (and b!1458599 res!988692) b!1458602))

(assert (= (and b!1458602 c!134466) b!1458606))

(assert (= (and b!1458602 (not c!134466)) b!1458611))

(assert (= (and b!1458602 res!988700) b!1458596))

(assert (= (and b!1458596 res!988694) b!1458614))

(assert (= (and b!1458614 res!988685) b!1458595))

(assert (= (and b!1458595 res!988702) b!1458605))

(assert (= (and b!1458614 (not res!988699)) b!1458615))

(assert (= (and b!1458615 (not res!988691)) b!1458608))

(assert (= (and b!1458608 (not res!988697)) b!1458604))

(assert (= (and b!1458604 c!134465) b!1458612))

(assert (= (and b!1458604 (not c!134465)) b!1458609))

(declare-fun m!1346433 () Bool)

(assert (=> b!1458605 m!1346433))

(declare-fun m!1346435 () Bool)

(assert (=> b!1458605 m!1346435))

(declare-fun m!1346437 () Bool)

(assert (=> b!1458605 m!1346437))

(declare-fun m!1346439 () Bool)

(assert (=> b!1458605 m!1346439))

(declare-fun m!1346441 () Bool)

(assert (=> b!1458605 m!1346441))

(assert (=> b!1458595 m!1346441))

(assert (=> b!1458595 m!1346441))

(declare-fun m!1346443 () Bool)

(assert (=> b!1458595 m!1346443))

(declare-fun m!1346445 () Bool)

(assert (=> b!1458614 m!1346445))

(assert (=> b!1458614 m!1346433))

(assert (=> b!1458614 m!1346437))

(assert (=> b!1458614 m!1346439))

(declare-fun m!1346447 () Bool)

(assert (=> b!1458614 m!1346447))

(assert (=> b!1458614 m!1346441))

(declare-fun m!1346449 () Bool)

(assert (=> b!1458611 m!1346449))

(declare-fun m!1346451 () Bool)

(assert (=> b!1458611 m!1346451))

(declare-fun m!1346453 () Bool)

(assert (=> b!1458615 m!1346453))

(assert (=> b!1458615 m!1346449))

(assert (=> b!1458615 m!1346451))

(declare-fun m!1346455 () Bool)

(assert (=> b!1458606 m!1346455))

(declare-fun m!1346457 () Bool)

(assert (=> b!1458599 m!1346457))

(assert (=> b!1458599 m!1346457))

(declare-fun m!1346459 () Bool)

(assert (=> b!1458599 m!1346459))

(assert (=> b!1458599 m!1346433))

(declare-fun m!1346461 () Bool)

(assert (=> b!1458599 m!1346461))

(assert (=> b!1458598 m!1346441))

(assert (=> b!1458598 m!1346441))

(declare-fun m!1346463 () Bool)

(assert (=> b!1458598 m!1346463))

(assert (=> b!1458607 m!1346433))

(declare-fun m!1346465 () Bool)

(assert (=> b!1458607 m!1346465))

(declare-fun m!1346467 () Bool)

(assert (=> b!1458609 m!1346467))

(declare-fun m!1346469 () Bool)

(assert (=> start!125150 m!1346469))

(declare-fun m!1346471 () Bool)

(assert (=> start!125150 m!1346471))

(assert (=> b!1458608 m!1346441))

(assert (=> b!1458608 m!1346441))

(declare-fun m!1346473 () Bool)

(assert (=> b!1458608 m!1346473))

(declare-fun m!1346475 () Bool)

(assert (=> b!1458612 m!1346475))

(assert (=> b!1458603 m!1346441))

(assert (=> b!1458603 m!1346441))

(declare-fun m!1346477 () Bool)

(assert (=> b!1458603 m!1346477))

(declare-fun m!1346479 () Bool)

(assert (=> b!1458601 m!1346479))

(declare-fun m!1346481 () Bool)

(assert (=> b!1458613 m!1346481))

(assert (=> b!1458613 m!1346481))

(declare-fun m!1346483 () Bool)

(assert (=> b!1458613 m!1346483))

(declare-fun m!1346485 () Bool)

(assert (=> b!1458597 m!1346485))

(assert (=> b!1458594 m!1346441))

(assert (=> b!1458594 m!1346441))

(declare-fun m!1346487 () Bool)

(assert (=> b!1458594 m!1346487))

(assert (=> b!1458594 m!1346487))

(assert (=> b!1458594 m!1346441))

(declare-fun m!1346489 () Bool)

(assert (=> b!1458594 m!1346489))

(push 1)

