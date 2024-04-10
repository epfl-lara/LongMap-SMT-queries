; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125090 () Bool)

(assert start!125090)

(declare-fun res!987073 () Bool)

(declare-fun e!819517 () Bool)

(assert (=> start!125090 (=> (not res!987073) (not e!819517))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125090 (= res!987073 (validMask!0 mask!2687))))

(assert (=> start!125090 e!819517))

(assert (=> start!125090 true))

(declare-datatypes ((array!98538 0))(
  ( (array!98539 (arr!47557 (Array (_ BitVec 32) (_ BitVec 64))) (size!48107 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98538)

(declare-fun array_inv!36585 (array!98538) Bool)

(assert (=> start!125090 (array_inv!36585 a!2862)))

(declare-fun lt!638384 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638385 () array!98538)

(declare-fun b!1456614 () Bool)

(declare-datatypes ((SeekEntryResult!11809 0))(
  ( (MissingZero!11809 (index!49628 (_ BitVec 32))) (Found!11809 (index!49629 (_ BitVec 32))) (Intermediate!11809 (undefined!12621 Bool) (index!49630 (_ BitVec 32)) (x!131250 (_ BitVec 32))) (Undefined!11809) (MissingVacant!11809 (index!49631 (_ BitVec 32))) )
))
(declare-fun lt!638383 () SeekEntryResult!11809)

(declare-fun lt!638381 () (_ BitVec 64))

(declare-fun e!819514 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98538 (_ BitVec 32)) SeekEntryResult!11809)

(assert (=> b!1456614 (= e!819514 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638384 intermediateAfterIndex!19 lt!638381 lt!638385 mask!2687) lt!638383)))))

(declare-fun b!1456615 () Bool)

(declare-fun res!987076 () Bool)

(assert (=> b!1456615 (=> (not res!987076) (not e!819517))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456615 (= res!987076 (validKeyInArray!0 (select (arr!47557 a!2862) i!1006)))))

(declare-fun b!1456616 () Bool)

(declare-fun e!819519 () Bool)

(assert (=> b!1456616 (= e!819517 e!819519)))

(declare-fun res!987077 () Bool)

(assert (=> b!1456616 (=> (not res!987077) (not e!819519))))

(assert (=> b!1456616 (= res!987077 (= (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456616 (= lt!638385 (array!98539 (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48107 a!2862)))))

(declare-fun b!1456617 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!819512 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98538 (_ BitVec 32)) SeekEntryResult!11809)

(assert (=> b!1456617 (= e!819512 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638381 lt!638385 mask!2687) (seekEntryOrOpen!0 lt!638381 lt!638385 mask!2687)))))

(declare-fun b!1456618 () Bool)

(declare-fun res!987075 () Bool)

(assert (=> b!1456618 (=> (not res!987075) (not e!819517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98538 (_ BitVec 32)) Bool)

(assert (=> b!1456618 (= res!987075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456619 () Bool)

(declare-fun e!819515 () Bool)

(declare-fun e!819513 () Bool)

(assert (=> b!1456619 (= e!819515 e!819513)))

(declare-fun res!987067 () Bool)

(assert (=> b!1456619 (=> res!987067 e!819513)))

(assert (=> b!1456619 (= res!987067 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638384 #b00000000000000000000000000000000) (bvsge lt!638384 (size!48107 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456619 (= lt!638384 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456619 (= lt!638383 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638381 lt!638385 mask!2687))))

(assert (=> b!1456619 (= lt!638383 (seekEntryOrOpen!0 lt!638381 lt!638385 mask!2687))))

(declare-fun b!1456620 () Bool)

(declare-fun res!987065 () Bool)

(assert (=> b!1456620 (=> res!987065 e!819513)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!638382 () SeekEntryResult!11809)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98538 (_ BitVec 32)) SeekEntryResult!11809)

(assert (=> b!1456620 (= res!987065 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638384 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!638382)))))

(declare-fun lt!638380 () SeekEntryResult!11809)

(declare-fun b!1456621 () Bool)

(assert (=> b!1456621 (= e!819512 (= lt!638380 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638381 lt!638385 mask!2687)))))

(declare-fun b!1456622 () Bool)

(declare-fun e!819520 () Bool)

(assert (=> b!1456622 (= e!819519 e!819520)))

(declare-fun res!987072 () Bool)

(assert (=> b!1456622 (=> (not res!987072) (not e!819520))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456622 (= res!987072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47557 a!2862) j!93) mask!2687) (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!638382))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456622 (= lt!638382 (Intermediate!11809 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456623 () Bool)

(declare-fun res!987079 () Bool)

(assert (=> b!1456623 (=> (not res!987079) (not e!819517))))

(declare-datatypes ((List!34058 0))(
  ( (Nil!34055) (Cons!34054 (h!35404 (_ BitVec 64)) (t!48752 List!34058)) )
))
(declare-fun arrayNoDuplicates!0 (array!98538 (_ BitVec 32) List!34058) Bool)

(assert (=> b!1456623 (= res!987079 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34055))))

(declare-fun b!1456624 () Bool)

(declare-fun res!987074 () Bool)

(assert (=> b!1456624 (=> (not res!987074) (not e!819520))))

(assert (=> b!1456624 (= res!987074 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!638382))))

(declare-fun b!1456625 () Bool)

(declare-fun res!987078 () Bool)

(declare-fun e!819518 () Bool)

(assert (=> b!1456625 (=> (not res!987078) (not e!819518))))

(assert (=> b!1456625 (= res!987078 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456626 () Bool)

(assert (=> b!1456626 (= e!819518 (not e!819515))))

(declare-fun res!987082 () Bool)

(assert (=> b!1456626 (=> res!987082 e!819515)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456626 (= res!987082 (or (and (= (select (arr!47557 a!2862) index!646) (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47557 a!2862) index!646) (select (arr!47557 a!2862) j!93))) (= (select (arr!47557 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819516 () Bool)

(assert (=> b!1456626 e!819516))

(declare-fun res!987081 () Bool)

(assert (=> b!1456626 (=> (not res!987081) (not e!819516))))

(assert (=> b!1456626 (= res!987081 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49114 0))(
  ( (Unit!49115) )
))
(declare-fun lt!638379 () Unit!49114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49114)

(assert (=> b!1456626 (= lt!638379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456627 () Bool)

(declare-fun res!987071 () Bool)

(assert (=> b!1456627 (=> (not res!987071) (not e!819518))))

(assert (=> b!1456627 (= res!987071 e!819512)))

(declare-fun c!134285 () Bool)

(assert (=> b!1456627 (= c!134285 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456628 () Bool)

(declare-fun res!987068 () Bool)

(assert (=> b!1456628 (=> (not res!987068) (not e!819517))))

(assert (=> b!1456628 (= res!987068 (validKeyInArray!0 (select (arr!47557 a!2862) j!93)))))

(declare-fun b!1456629 () Bool)

(declare-fun res!987070 () Bool)

(assert (=> b!1456629 (=> (not res!987070) (not e!819516))))

(assert (=> b!1456629 (= res!987070 (= (seekEntryOrOpen!0 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) (Found!11809 j!93)))))

(declare-fun b!1456630 () Bool)

(declare-fun res!987080 () Bool)

(assert (=> b!1456630 (=> (not res!987080) (not e!819517))))

(assert (=> b!1456630 (= res!987080 (and (= (size!48107 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48107 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48107 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456631 () Bool)

(assert (=> b!1456631 (= e!819514 (not (= lt!638380 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638384 lt!638381 lt!638385 mask!2687))))))

(declare-fun b!1456632 () Bool)

(declare-fun res!987069 () Bool)

(assert (=> b!1456632 (=> (not res!987069) (not e!819517))))

(assert (=> b!1456632 (= res!987069 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48107 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48107 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48107 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456633 () Bool)

(assert (=> b!1456633 (= e!819513 true)))

(declare-fun lt!638378 () Bool)

(assert (=> b!1456633 (= lt!638378 e!819514)))

(declare-fun c!134286 () Bool)

(assert (=> b!1456633 (= c!134286 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456634 () Bool)

(assert (=> b!1456634 (= e!819520 e!819518)))

(declare-fun res!987066 () Bool)

(assert (=> b!1456634 (=> (not res!987066) (not e!819518))))

(assert (=> b!1456634 (= res!987066 (= lt!638380 (Intermediate!11809 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456634 (= lt!638380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638381 mask!2687) lt!638381 lt!638385 mask!2687))))

(assert (=> b!1456634 (= lt!638381 (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456635 () Bool)

(assert (=> b!1456635 (= e!819516 (and (or (= (select (arr!47557 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47557 a!2862) intermediateBeforeIndex!19) (select (arr!47557 a!2862) j!93))) (let ((bdg!53257 (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47557 a!2862) index!646) bdg!53257) (= (select (arr!47557 a!2862) index!646) (select (arr!47557 a!2862) j!93))) (= (select (arr!47557 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53257 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!125090 res!987073) b!1456630))

(assert (= (and b!1456630 res!987080) b!1456615))

(assert (= (and b!1456615 res!987076) b!1456628))

(assert (= (and b!1456628 res!987068) b!1456618))

(assert (= (and b!1456618 res!987075) b!1456623))

(assert (= (and b!1456623 res!987079) b!1456632))

(assert (= (and b!1456632 res!987069) b!1456616))

(assert (= (and b!1456616 res!987077) b!1456622))

(assert (= (and b!1456622 res!987072) b!1456624))

(assert (= (and b!1456624 res!987074) b!1456634))

(assert (= (and b!1456634 res!987066) b!1456627))

(assert (= (and b!1456627 c!134285) b!1456621))

(assert (= (and b!1456627 (not c!134285)) b!1456617))

(assert (= (and b!1456627 res!987071) b!1456625))

(assert (= (and b!1456625 res!987078) b!1456626))

(assert (= (and b!1456626 res!987081) b!1456629))

(assert (= (and b!1456629 res!987070) b!1456635))

(assert (= (and b!1456626 (not res!987082)) b!1456619))

(assert (= (and b!1456619 (not res!987067)) b!1456620))

(assert (= (and b!1456620 (not res!987065)) b!1456633))

(assert (= (and b!1456633 c!134286) b!1456631))

(assert (= (and b!1456633 (not c!134286)) b!1456614))

(declare-fun m!1344693 () Bool)

(assert (=> b!1456618 m!1344693))

(declare-fun m!1344695 () Bool)

(assert (=> b!1456616 m!1344695))

(declare-fun m!1344697 () Bool)

(assert (=> b!1456616 m!1344697))

(declare-fun m!1344699 () Bool)

(assert (=> b!1456624 m!1344699))

(assert (=> b!1456624 m!1344699))

(declare-fun m!1344701 () Bool)

(assert (=> b!1456624 m!1344701))

(assert (=> b!1456628 m!1344699))

(assert (=> b!1456628 m!1344699))

(declare-fun m!1344703 () Bool)

(assert (=> b!1456628 m!1344703))

(assert (=> b!1456629 m!1344699))

(assert (=> b!1456629 m!1344699))

(declare-fun m!1344705 () Bool)

(assert (=> b!1456629 m!1344705))

(assert (=> b!1456622 m!1344699))

(assert (=> b!1456622 m!1344699))

(declare-fun m!1344707 () Bool)

(assert (=> b!1456622 m!1344707))

(assert (=> b!1456622 m!1344707))

(assert (=> b!1456622 m!1344699))

(declare-fun m!1344709 () Bool)

(assert (=> b!1456622 m!1344709))

(declare-fun m!1344711 () Bool)

(assert (=> b!1456634 m!1344711))

(assert (=> b!1456634 m!1344711))

(declare-fun m!1344713 () Bool)

(assert (=> b!1456634 m!1344713))

(assert (=> b!1456634 m!1344695))

(declare-fun m!1344715 () Bool)

(assert (=> b!1456634 m!1344715))

(declare-fun m!1344717 () Bool)

(assert (=> b!1456621 m!1344717))

(assert (=> b!1456635 m!1344695))

(declare-fun m!1344719 () Bool)

(assert (=> b!1456635 m!1344719))

(declare-fun m!1344721 () Bool)

(assert (=> b!1456635 m!1344721))

(declare-fun m!1344723 () Bool)

(assert (=> b!1456635 m!1344723))

(assert (=> b!1456635 m!1344699))

(assert (=> b!1456620 m!1344699))

(assert (=> b!1456620 m!1344699))

(declare-fun m!1344725 () Bool)

(assert (=> b!1456620 m!1344725))

(declare-fun m!1344727 () Bool)

(assert (=> b!1456615 m!1344727))

(assert (=> b!1456615 m!1344727))

(declare-fun m!1344729 () Bool)

(assert (=> b!1456615 m!1344729))

(declare-fun m!1344731 () Bool)

(assert (=> b!1456619 m!1344731))

(declare-fun m!1344733 () Bool)

(assert (=> b!1456619 m!1344733))

(declare-fun m!1344735 () Bool)

(assert (=> b!1456619 m!1344735))

(declare-fun m!1344737 () Bool)

(assert (=> b!1456623 m!1344737))

(declare-fun m!1344739 () Bool)

(assert (=> b!1456626 m!1344739))

(assert (=> b!1456626 m!1344695))

(assert (=> b!1456626 m!1344721))

(assert (=> b!1456626 m!1344723))

(declare-fun m!1344741 () Bool)

(assert (=> b!1456626 m!1344741))

(assert (=> b!1456626 m!1344699))

(assert (=> b!1456617 m!1344733))

(assert (=> b!1456617 m!1344735))

(declare-fun m!1344743 () Bool)

(assert (=> b!1456614 m!1344743))

(declare-fun m!1344745 () Bool)

(assert (=> start!125090 m!1344745))

(declare-fun m!1344747 () Bool)

(assert (=> start!125090 m!1344747))

(declare-fun m!1344749 () Bool)

(assert (=> b!1456631 m!1344749))

(push 1)

