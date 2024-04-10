; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126134 () Bool)

(assert start!126134)

(declare-fun b!1476599 () Bool)

(declare-fun e!828431 () Bool)

(declare-fun e!828425 () Bool)

(assert (=> b!1476599 (= e!828431 e!828425)))

(declare-fun res!1002826 () Bool)

(assert (=> b!1476599 (=> res!1002826 e!828425)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99240 0))(
  ( (array!99241 (arr!47899 (Array (_ BitVec 32) (_ BitVec 64))) (size!48449 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99240)

(assert (=> b!1476599 (= res!1002826 (or (and (= (select (arr!47899 a!2862) index!646) (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47899 a!2862) index!646) (select (arr!47899 a!2862) j!93))) (not (= (select (arr!47899 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476600 () Bool)

(declare-fun res!1002823 () Bool)

(declare-fun e!828423 () Bool)

(assert (=> b!1476600 (=> (not res!1002823) (not e!828423))))

(declare-datatypes ((SeekEntryResult!12139 0))(
  ( (MissingZero!12139 (index!50948 (_ BitVec 32))) (Found!12139 (index!50949 (_ BitVec 32))) (Intermediate!12139 (undefined!12951 Bool) (index!50950 (_ BitVec 32)) (x!132546 (_ BitVec 32))) (Undefined!12139) (MissingVacant!12139 (index!50951 (_ BitVec 32))) )
))
(declare-fun lt!645067 () SeekEntryResult!12139)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99240 (_ BitVec 32)) SeekEntryResult!12139)

(assert (=> b!1476600 (= res!1002823 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47899 a!2862) j!93) a!2862 mask!2687) lt!645067))))

(declare-fun e!828428 () Bool)

(declare-fun b!1476601 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476601 (= e!828428 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476602 () Bool)

(declare-fun res!1002818 () Bool)

(declare-fun e!828429 () Bool)

(assert (=> b!1476602 (=> (not res!1002818) (not e!828429))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476602 (= res!1002818 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476603 () Bool)

(declare-fun res!1002829 () Bool)

(declare-fun e!828426 () Bool)

(assert (=> b!1476603 (=> (not res!1002829) (not e!828426))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476603 (= res!1002829 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48449 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48449 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48449 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476604 () Bool)

(declare-fun e!828430 () Bool)

(assert (=> b!1476604 (= e!828430 e!828423)))

(declare-fun res!1002827 () Bool)

(assert (=> b!1476604 (=> (not res!1002827) (not e!828423))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476604 (= res!1002827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47899 a!2862) j!93) mask!2687) (select (arr!47899 a!2862) j!93) a!2862 mask!2687) lt!645067))))

(assert (=> b!1476604 (= lt!645067 (Intermediate!12139 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476605 () Bool)

(declare-fun res!1002831 () Bool)

(assert (=> b!1476605 (=> (not res!1002831) (not e!828426))))

(declare-datatypes ((List!34400 0))(
  ( (Nil!34397) (Cons!34396 (h!35764 (_ BitVec 64)) (t!49094 List!34400)) )
))
(declare-fun arrayNoDuplicates!0 (array!99240 (_ BitVec 32) List!34400) Bool)

(assert (=> b!1476605 (= res!1002831 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34397))))

(declare-fun b!1476606 () Bool)

(assert (=> b!1476606 (= e!828425 e!828428)))

(declare-fun res!1002832 () Bool)

(assert (=> b!1476606 (=> (not res!1002832) (not e!828428))))

(declare-fun lt!645069 () SeekEntryResult!12139)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99240 (_ BitVec 32)) SeekEntryResult!12139)

(assert (=> b!1476606 (= res!1002832 (= lt!645069 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47899 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476607 () Bool)

(assert (=> b!1476607 (= e!828423 e!828429)))

(declare-fun res!1002824 () Bool)

(assert (=> b!1476607 (=> (not res!1002824) (not e!828429))))

(declare-fun lt!645072 () SeekEntryResult!12139)

(assert (=> b!1476607 (= res!1002824 (= lt!645072 (Intermediate!12139 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645070 () (_ BitVec 64))

(declare-fun lt!645071 () array!99240)

(assert (=> b!1476607 (= lt!645072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645070 mask!2687) lt!645070 lt!645071 mask!2687))))

(assert (=> b!1476607 (= lt!645070 (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1002822 () Bool)

(assert (=> start!126134 (=> (not res!1002822) (not e!828426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126134 (= res!1002822 (validMask!0 mask!2687))))

(assert (=> start!126134 e!828426))

(assert (=> start!126134 true))

(declare-fun array_inv!36927 (array!99240) Bool)

(assert (=> start!126134 (array_inv!36927 a!2862)))

(declare-fun e!828427 () Bool)

(declare-fun b!1476598 () Bool)

(assert (=> b!1476598 (= e!828427 (= lt!645072 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645070 lt!645071 mask!2687)))))

(declare-fun b!1476608 () Bool)

(declare-fun res!1002825 () Bool)

(assert (=> b!1476608 (=> (not res!1002825) (not e!828429))))

(assert (=> b!1476608 (= res!1002825 e!828427)))

(declare-fun c!136410 () Bool)

(assert (=> b!1476608 (= c!136410 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476609 () Bool)

(declare-fun res!1002819 () Bool)

(assert (=> b!1476609 (=> (not res!1002819) (not e!828426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476609 (= res!1002819 (validKeyInArray!0 (select (arr!47899 a!2862) j!93)))))

(declare-fun b!1476610 () Bool)

(assert (=> b!1476610 (= e!828426 e!828430)))

(declare-fun res!1002830 () Bool)

(assert (=> b!1476610 (=> (not res!1002830) (not e!828430))))

(assert (=> b!1476610 (= res!1002830 (= (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476610 (= lt!645071 (array!99241 (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48449 a!2862)))))

(declare-fun b!1476611 () Bool)

(declare-fun res!1002821 () Bool)

(assert (=> b!1476611 (=> (not res!1002821) (not e!828426))))

(assert (=> b!1476611 (= res!1002821 (and (= (size!48449 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48449 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48449 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476612 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99240 (_ BitVec 32)) SeekEntryResult!12139)

(assert (=> b!1476612 (= e!828427 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645070 lt!645071 mask!2687) (seekEntryOrOpen!0 lt!645070 lt!645071 mask!2687)))))

(declare-fun b!1476613 () Bool)

(declare-fun res!1002820 () Bool)

(assert (=> b!1476613 (=> (not res!1002820) (not e!828426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99240 (_ BitVec 32)) Bool)

(assert (=> b!1476613 (= res!1002820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476614 () Bool)

(declare-fun res!1002828 () Bool)

(assert (=> b!1476614 (=> (not res!1002828) (not e!828426))))

(assert (=> b!1476614 (= res!1002828 (validKeyInArray!0 (select (arr!47899 a!2862) i!1006)))))

(declare-fun b!1476615 () Bool)

(assert (=> b!1476615 (= e!828429 (not true))))

(assert (=> b!1476615 e!828431))

(declare-fun res!1002817 () Bool)

(assert (=> b!1476615 (=> (not res!1002817) (not e!828431))))

(assert (=> b!1476615 (= res!1002817 (and (= lt!645069 (Found!12139 j!93)) (or (= (select (arr!47899 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47899 a!2862) intermediateBeforeIndex!19) (select (arr!47899 a!2862) j!93)))))))

(assert (=> b!1476615 (= lt!645069 (seekEntryOrOpen!0 (select (arr!47899 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476615 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49618 0))(
  ( (Unit!49619) )
))
(declare-fun lt!645068 () Unit!49618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49618)

(assert (=> b!1476615 (= lt!645068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126134 res!1002822) b!1476611))

(assert (= (and b!1476611 res!1002821) b!1476614))

(assert (= (and b!1476614 res!1002828) b!1476609))

(assert (= (and b!1476609 res!1002819) b!1476613))

(assert (= (and b!1476613 res!1002820) b!1476605))

(assert (= (and b!1476605 res!1002831) b!1476603))

(assert (= (and b!1476603 res!1002829) b!1476610))

(assert (= (and b!1476610 res!1002830) b!1476604))

(assert (= (and b!1476604 res!1002827) b!1476600))

(assert (= (and b!1476600 res!1002823) b!1476607))

(assert (= (and b!1476607 res!1002824) b!1476608))

(assert (= (and b!1476608 c!136410) b!1476598))

(assert (= (and b!1476608 (not c!136410)) b!1476612))

(assert (= (and b!1476608 res!1002825) b!1476602))

(assert (= (and b!1476602 res!1002818) b!1476615))

(assert (= (and b!1476615 res!1002817) b!1476599))

(assert (= (and b!1476599 (not res!1002826)) b!1476606))

(assert (= (and b!1476606 res!1002832) b!1476601))

(declare-fun m!1362579 () Bool)

(assert (=> b!1476613 m!1362579))

(declare-fun m!1362581 () Bool)

(assert (=> b!1476614 m!1362581))

(assert (=> b!1476614 m!1362581))

(declare-fun m!1362583 () Bool)

(assert (=> b!1476614 m!1362583))

(declare-fun m!1362585 () Bool)

(assert (=> start!126134 m!1362585))

(declare-fun m!1362587 () Bool)

(assert (=> start!126134 m!1362587))

(declare-fun m!1362589 () Bool)

(assert (=> b!1476600 m!1362589))

(assert (=> b!1476600 m!1362589))

(declare-fun m!1362591 () Bool)

(assert (=> b!1476600 m!1362591))

(declare-fun m!1362593 () Bool)

(assert (=> b!1476607 m!1362593))

(assert (=> b!1476607 m!1362593))

(declare-fun m!1362595 () Bool)

(assert (=> b!1476607 m!1362595))

(declare-fun m!1362597 () Bool)

(assert (=> b!1476607 m!1362597))

(declare-fun m!1362599 () Bool)

(assert (=> b!1476607 m!1362599))

(declare-fun m!1362601 () Bool)

(assert (=> b!1476598 m!1362601))

(assert (=> b!1476606 m!1362589))

(assert (=> b!1476606 m!1362589))

(declare-fun m!1362603 () Bool)

(assert (=> b!1476606 m!1362603))

(declare-fun m!1362605 () Bool)

(assert (=> b!1476605 m!1362605))

(assert (=> b!1476604 m!1362589))

(assert (=> b!1476604 m!1362589))

(declare-fun m!1362607 () Bool)

(assert (=> b!1476604 m!1362607))

(assert (=> b!1476604 m!1362607))

(assert (=> b!1476604 m!1362589))

(declare-fun m!1362609 () Bool)

(assert (=> b!1476604 m!1362609))

(declare-fun m!1362611 () Bool)

(assert (=> b!1476599 m!1362611))

(assert (=> b!1476599 m!1362597))

(declare-fun m!1362613 () Bool)

(assert (=> b!1476599 m!1362613))

(assert (=> b!1476599 m!1362589))

(declare-fun m!1362615 () Bool)

(assert (=> b!1476612 m!1362615))

(declare-fun m!1362617 () Bool)

(assert (=> b!1476612 m!1362617))

(declare-fun m!1362619 () Bool)

(assert (=> b!1476615 m!1362619))

(declare-fun m!1362621 () Bool)

(assert (=> b!1476615 m!1362621))

(assert (=> b!1476615 m!1362589))

(declare-fun m!1362623 () Bool)

(assert (=> b!1476615 m!1362623))

(declare-fun m!1362625 () Bool)

(assert (=> b!1476615 m!1362625))

(assert (=> b!1476615 m!1362589))

(assert (=> b!1476609 m!1362589))

(assert (=> b!1476609 m!1362589))

(declare-fun m!1362627 () Bool)

(assert (=> b!1476609 m!1362627))

(assert (=> b!1476610 m!1362597))

(declare-fun m!1362629 () Bool)

(assert (=> b!1476610 m!1362629))

(push 1)

