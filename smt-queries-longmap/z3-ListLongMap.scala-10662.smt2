; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125328 () Bool)

(assert start!125328)

(declare-fun b!1458601 () Bool)

(declare-fun res!988109 () Bool)

(declare-fun e!820653 () Bool)

(assert (=> b!1458601 (=> (not res!988109) (not e!820653))))

(declare-datatypes ((array!98671 0))(
  ( (array!98672 (arr!47620 (Array (_ BitVec 32) (_ BitVec 64))) (size!48171 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98671)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458601 (= res!988109 (validKeyInArray!0 (select (arr!47620 a!2862) j!93)))))

(declare-fun b!1458602 () Bool)

(declare-fun res!988114 () Bool)

(declare-fun e!820654 () Bool)

(assert (=> b!1458602 (=> (not res!988114) (not e!820654))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458602 (= res!988114 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458603 () Bool)

(declare-fun e!820659 () Bool)

(assert (=> b!1458603 (= e!820653 e!820659)))

(declare-fun res!988112 () Bool)

(assert (=> b!1458603 (=> (not res!988112) (not e!820659))))

(assert (=> b!1458603 (= res!988112 (= (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639098 () array!98671)

(assert (=> b!1458603 (= lt!639098 (array!98672 (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48171 a!2862)))))

(declare-fun b!1458604 () Bool)

(declare-fun e!820657 () Bool)

(declare-fun e!820656 () Bool)

(assert (=> b!1458604 (= e!820657 e!820656)))

(declare-fun res!988115 () Bool)

(assert (=> b!1458604 (=> res!988115 e!820656)))

(declare-fun lt!639097 () (_ BitVec 32))

(assert (=> b!1458604 (= res!988115 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639097 #b00000000000000000000000000000000) (bvsge lt!639097 (size!48171 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458604 (= lt!639097 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-datatypes ((SeekEntryResult!11769 0))(
  ( (MissingZero!11769 (index!49468 (_ BitVec 32))) (Found!11769 (index!49469 (_ BitVec 32))) (Intermediate!11769 (undefined!12581 Bool) (index!49470 (_ BitVec 32)) (x!131266 (_ BitVec 32))) (Undefined!11769) (MissingVacant!11769 (index!49471 (_ BitVec 32))) )
))
(declare-fun lt!639102 () SeekEntryResult!11769)

(declare-fun lt!639103 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98671 (_ BitVec 32)) SeekEntryResult!11769)

(assert (=> b!1458604 (= lt!639102 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639103 lt!639098 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98671 (_ BitVec 32)) SeekEntryResult!11769)

(assert (=> b!1458604 (= lt!639102 (seekEntryOrOpen!0 lt!639103 lt!639098 mask!2687))))

(declare-fun e!820655 () Bool)

(declare-fun b!1458605 () Bool)

(assert (=> b!1458605 (= e!820655 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639097 intermediateAfterIndex!19 lt!639103 lt!639098 mask!2687) lt!639102)))))

(declare-fun res!988123 () Bool)

(assert (=> start!125328 (=> (not res!988123) (not e!820653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125328 (= res!988123 (validMask!0 mask!2687))))

(assert (=> start!125328 e!820653))

(assert (=> start!125328 true))

(declare-fun array_inv!36901 (array!98671) Bool)

(assert (=> start!125328 (array_inv!36901 a!2862)))

(declare-fun lt!639101 () SeekEntryResult!11769)

(declare-fun b!1458606 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98671 (_ BitVec 32)) SeekEntryResult!11769)

(assert (=> b!1458606 (= e!820655 (not (= lt!639101 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639097 lt!639103 lt!639098 mask!2687))))))

(declare-fun b!1458607 () Bool)

(declare-fun res!988118 () Bool)

(assert (=> b!1458607 (=> (not res!988118) (not e!820653))))

(assert (=> b!1458607 (= res!988118 (validKeyInArray!0 (select (arr!47620 a!2862) i!1006)))))

(declare-fun b!1458608 () Bool)

(declare-fun e!820658 () Bool)

(assert (=> b!1458608 (= e!820658 e!820654)))

(declare-fun res!988107 () Bool)

(assert (=> b!1458608 (=> (not res!988107) (not e!820654))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458608 (= res!988107 (= lt!639101 (Intermediate!11769 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458608 (= lt!639101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639103 mask!2687) lt!639103 lt!639098 mask!2687))))

(assert (=> b!1458608 (= lt!639103 (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458609 () Bool)

(declare-fun e!820650 () Bool)

(assert (=> b!1458609 (= e!820650 (= lt!639101 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639103 lt!639098 mask!2687)))))

(declare-fun b!1458610 () Bool)

(assert (=> b!1458610 (= e!820659 e!820658)))

(declare-fun res!988116 () Bool)

(assert (=> b!1458610 (=> (not res!988116) (not e!820658))))

(declare-fun lt!639096 () SeekEntryResult!11769)

(assert (=> b!1458610 (= res!988116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47620 a!2862) j!93) mask!2687) (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!639096))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1458610 (= lt!639096 (Intermediate!11769 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458611 () Bool)

(declare-fun res!988110 () Bool)

(declare-fun e!820652 () Bool)

(assert (=> b!1458611 (=> (not res!988110) (not e!820652))))

(assert (=> b!1458611 (= res!988110 (= (seekEntryOrOpen!0 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) (Found!11769 j!93)))))

(declare-fun b!1458612 () Bool)

(assert (=> b!1458612 (= e!820650 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639103 lt!639098 mask!2687) (seekEntryOrOpen!0 lt!639103 lt!639098 mask!2687)))))

(declare-fun b!1458613 () Bool)

(assert (=> b!1458613 (= e!820654 (not e!820657))))

(declare-fun res!988121 () Bool)

(assert (=> b!1458613 (=> res!988121 e!820657)))

(assert (=> b!1458613 (= res!988121 (or (and (= (select (arr!47620 a!2862) index!646) (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47620 a!2862) index!646) (select (arr!47620 a!2862) j!93))) (= (select (arr!47620 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458613 e!820652))

(declare-fun res!988119 () Bool)

(assert (=> b!1458613 (=> (not res!988119) (not e!820652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98671 (_ BitVec 32)) Bool)

(assert (=> b!1458613 (= res!988119 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49067 0))(
  ( (Unit!49068) )
))
(declare-fun lt!639100 () Unit!49067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49067)

(assert (=> b!1458613 (= lt!639100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458614 () Bool)

(declare-fun res!988111 () Bool)

(assert (=> b!1458614 (=> (not res!988111) (not e!820653))))

(assert (=> b!1458614 (= res!988111 (and (= (size!48171 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48171 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48171 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458615 () Bool)

(declare-fun res!988117 () Bool)

(assert (=> b!1458615 (=> (not res!988117) (not e!820653))))

(assert (=> b!1458615 (= res!988117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458616 () Bool)

(declare-fun res!988124 () Bool)

(assert (=> b!1458616 (=> (not res!988124) (not e!820654))))

(assert (=> b!1458616 (= res!988124 e!820650)))

(declare-fun c!134767 () Bool)

(assert (=> b!1458616 (= c!134767 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458617 () Bool)

(assert (=> b!1458617 (= e!820656 true)))

(declare-fun lt!639099 () Bool)

(assert (=> b!1458617 (= lt!639099 e!820655)))

(declare-fun c!134766 () Bool)

(assert (=> b!1458617 (= c!134766 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458618 () Bool)

(declare-fun res!988113 () Bool)

(assert (=> b!1458618 (=> (not res!988113) (not e!820658))))

(assert (=> b!1458618 (= res!988113 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!639096))))

(declare-fun b!1458619 () Bool)

(declare-fun res!988108 () Bool)

(assert (=> b!1458619 (=> (not res!988108) (not e!820653))))

(declare-datatypes ((List!34108 0))(
  ( (Nil!34105) (Cons!34104 (h!35465 (_ BitVec 64)) (t!48794 List!34108)) )
))
(declare-fun arrayNoDuplicates!0 (array!98671 (_ BitVec 32) List!34108) Bool)

(assert (=> b!1458619 (= res!988108 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34105))))

(declare-fun b!1458620 () Bool)

(declare-fun res!988120 () Bool)

(assert (=> b!1458620 (=> res!988120 e!820656)))

(assert (=> b!1458620 (= res!988120 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639097 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!639096)))))

(declare-fun b!1458621 () Bool)

(declare-fun res!988122 () Bool)

(assert (=> b!1458621 (=> (not res!988122) (not e!820653))))

(assert (=> b!1458621 (= res!988122 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48171 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48171 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48171 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458622 () Bool)

(assert (=> b!1458622 (= e!820652 (and (or (= (select (arr!47620 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47620 a!2862) intermediateBeforeIndex!19) (select (arr!47620 a!2862) j!93))) (let ((bdg!53324 (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47620 a!2862) index!646) bdg!53324) (= (select (arr!47620 a!2862) index!646) (select (arr!47620 a!2862) j!93))) (= (select (arr!47620 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53324 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!125328 res!988123) b!1458614))

(assert (= (and b!1458614 res!988111) b!1458607))

(assert (= (and b!1458607 res!988118) b!1458601))

(assert (= (and b!1458601 res!988109) b!1458615))

(assert (= (and b!1458615 res!988117) b!1458619))

(assert (= (and b!1458619 res!988108) b!1458621))

(assert (= (and b!1458621 res!988122) b!1458603))

(assert (= (and b!1458603 res!988112) b!1458610))

(assert (= (and b!1458610 res!988116) b!1458618))

(assert (= (and b!1458618 res!988113) b!1458608))

(assert (= (and b!1458608 res!988107) b!1458616))

(assert (= (and b!1458616 c!134767) b!1458609))

(assert (= (and b!1458616 (not c!134767)) b!1458612))

(assert (= (and b!1458616 res!988124) b!1458602))

(assert (= (and b!1458602 res!988114) b!1458613))

(assert (= (and b!1458613 res!988119) b!1458611))

(assert (= (and b!1458611 res!988110) b!1458622))

(assert (= (and b!1458613 (not res!988121)) b!1458604))

(assert (= (and b!1458604 (not res!988115)) b!1458620))

(assert (= (and b!1458620 (not res!988120)) b!1458617))

(assert (= (and b!1458617 c!134766) b!1458606))

(assert (= (and b!1458617 (not c!134766)) b!1458605))

(declare-fun m!1346713 () Bool)

(assert (=> b!1458605 m!1346713))

(declare-fun m!1346715 () Bool)

(assert (=> b!1458606 m!1346715))

(declare-fun m!1346717 () Bool)

(assert (=> b!1458611 m!1346717))

(assert (=> b!1458611 m!1346717))

(declare-fun m!1346719 () Bool)

(assert (=> b!1458611 m!1346719))

(assert (=> b!1458610 m!1346717))

(assert (=> b!1458610 m!1346717))

(declare-fun m!1346721 () Bool)

(assert (=> b!1458610 m!1346721))

(assert (=> b!1458610 m!1346721))

(assert (=> b!1458610 m!1346717))

(declare-fun m!1346723 () Bool)

(assert (=> b!1458610 m!1346723))

(declare-fun m!1346725 () Bool)

(assert (=> b!1458609 m!1346725))

(declare-fun m!1346727 () Bool)

(assert (=> b!1458615 m!1346727))

(declare-fun m!1346729 () Bool)

(assert (=> b!1458608 m!1346729))

(assert (=> b!1458608 m!1346729))

(declare-fun m!1346731 () Bool)

(assert (=> b!1458608 m!1346731))

(declare-fun m!1346733 () Bool)

(assert (=> b!1458608 m!1346733))

(declare-fun m!1346735 () Bool)

(assert (=> b!1458608 m!1346735))

(assert (=> b!1458618 m!1346717))

(assert (=> b!1458618 m!1346717))

(declare-fun m!1346737 () Bool)

(assert (=> b!1458618 m!1346737))

(declare-fun m!1346739 () Bool)

(assert (=> b!1458604 m!1346739))

(declare-fun m!1346741 () Bool)

(assert (=> b!1458604 m!1346741))

(declare-fun m!1346743 () Bool)

(assert (=> b!1458604 m!1346743))

(assert (=> b!1458620 m!1346717))

(assert (=> b!1458620 m!1346717))

(declare-fun m!1346745 () Bool)

(assert (=> b!1458620 m!1346745))

(assert (=> b!1458612 m!1346741))

(assert (=> b!1458612 m!1346743))

(declare-fun m!1346747 () Bool)

(assert (=> b!1458607 m!1346747))

(assert (=> b!1458607 m!1346747))

(declare-fun m!1346749 () Bool)

(assert (=> b!1458607 m!1346749))

(assert (=> b!1458603 m!1346733))

(declare-fun m!1346751 () Bool)

(assert (=> b!1458603 m!1346751))

(assert (=> b!1458601 m!1346717))

(assert (=> b!1458601 m!1346717))

(declare-fun m!1346753 () Bool)

(assert (=> b!1458601 m!1346753))

(assert (=> b!1458622 m!1346733))

(declare-fun m!1346755 () Bool)

(assert (=> b!1458622 m!1346755))

(declare-fun m!1346757 () Bool)

(assert (=> b!1458622 m!1346757))

(declare-fun m!1346759 () Bool)

(assert (=> b!1458622 m!1346759))

(assert (=> b!1458622 m!1346717))

(declare-fun m!1346761 () Bool)

(assert (=> start!125328 m!1346761))

(declare-fun m!1346763 () Bool)

(assert (=> start!125328 m!1346763))

(declare-fun m!1346765 () Bool)

(assert (=> b!1458613 m!1346765))

(assert (=> b!1458613 m!1346733))

(assert (=> b!1458613 m!1346757))

(assert (=> b!1458613 m!1346759))

(declare-fun m!1346767 () Bool)

(assert (=> b!1458613 m!1346767))

(assert (=> b!1458613 m!1346717))

(declare-fun m!1346769 () Bool)

(assert (=> b!1458619 m!1346769))

(check-sat (not b!1458620) (not b!1458608) (not b!1458615) (not b!1458606) (not b!1458604) (not b!1458618) (not b!1458609) (not b!1458607) (not start!125328) (not b!1458605) (not b!1458613) (not b!1458610) (not b!1458619) (not b!1458611) (not b!1458612) (not b!1458601))
(check-sat)
