; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125122 () Bool)

(assert start!125122)

(declare-fun b!1458465 () Bool)

(declare-fun res!988662 () Bool)

(declare-fun e!820331 () Bool)

(assert (=> b!1458465 (=> (not res!988662) (not e!820331))))

(declare-datatypes ((array!98548 0))(
  ( (array!98549 (arr!47563 (Array (_ BitVec 32) (_ BitVec 64))) (size!48115 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98548)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98548 (_ BitVec 32)) Bool)

(assert (=> b!1458465 (= res!988662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458466 () Bool)

(declare-fun res!988677 () Bool)

(assert (=> b!1458466 (=> (not res!988677) (not e!820331))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458466 (= res!988677 (and (= (size!48115 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48115 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48115 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458467 () Bool)

(declare-fun e!820330 () Bool)

(declare-fun e!820327 () Bool)

(assert (=> b!1458467 (= e!820330 e!820327)))

(declare-fun res!988661 () Bool)

(assert (=> b!1458467 (=> res!988661 e!820327)))

(declare-fun lt!638891 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1458467 (= res!988661 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638891 #b00000000000000000000000000000000) (bvsge lt!638891 (size!48115 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458467 (= lt!638891 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638896 () array!98548)

(declare-fun lt!638895 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11840 0))(
  ( (MissingZero!11840 (index!49752 (_ BitVec 32))) (Found!11840 (index!49753 (_ BitVec 32))) (Intermediate!11840 (undefined!12652 Bool) (index!49754 (_ BitVec 32)) (x!131364 (_ BitVec 32))) (Undefined!11840) (MissingVacant!11840 (index!49755 (_ BitVec 32))) )
))
(declare-fun lt!638897 () SeekEntryResult!11840)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98548 (_ BitVec 32)) SeekEntryResult!11840)

(assert (=> b!1458467 (= lt!638897 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638895 lt!638896 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98548 (_ BitVec 32)) SeekEntryResult!11840)

(assert (=> b!1458467 (= lt!638897 (seekEntryOrOpen!0 lt!638895 lt!638896 mask!2687))))

(declare-fun b!1458468 () Bool)

(declare-fun res!988678 () Bool)

(assert (=> b!1458468 (=> (not res!988678) (not e!820331))))

(declare-datatypes ((List!34142 0))(
  ( (Nil!34139) (Cons!34138 (h!35488 (_ BitVec 64)) (t!48828 List!34142)) )
))
(declare-fun arrayNoDuplicates!0 (array!98548 (_ BitVec 32) List!34142) Bool)

(assert (=> b!1458468 (= res!988678 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34139))))

(declare-fun b!1458469 () Bool)

(declare-fun e!820328 () Bool)

(declare-fun e!820332 () Bool)

(assert (=> b!1458469 (= e!820328 e!820332)))

(declare-fun res!988665 () Bool)

(assert (=> b!1458469 (=> (not res!988665) (not e!820332))))

(declare-fun lt!638892 () SeekEntryResult!11840)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98548 (_ BitVec 32)) SeekEntryResult!11840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458469 (= res!988665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47563 a!2862) j!93) mask!2687) (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!638892))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458469 (= lt!638892 (Intermediate!11840 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458471 () Bool)

(declare-fun e!820324 () Bool)

(assert (=> b!1458471 (= e!820324 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638891 intermediateAfterIndex!19 lt!638895 lt!638896 mask!2687) lt!638897)))))

(declare-fun e!820329 () Bool)

(declare-fun b!1458472 () Bool)

(assert (=> b!1458472 (= e!820329 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638895 lt!638896 mask!2687) (seekEntryOrOpen!0 lt!638895 lt!638896 mask!2687)))))

(declare-fun b!1458473 () Bool)

(declare-fun res!988666 () Bool)

(assert (=> b!1458473 (=> (not res!988666) (not e!820332))))

(assert (=> b!1458473 (= res!988666 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!638892))))

(declare-fun b!1458474 () Bool)

(declare-fun res!988664 () Bool)

(assert (=> b!1458474 (=> res!988664 e!820327)))

(assert (=> b!1458474 (= res!988664 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638891 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!638892)))))

(declare-fun b!1458475 () Bool)

(assert (=> b!1458475 (= e!820327 true)))

(declare-fun lt!638898 () SeekEntryResult!11840)

(assert (=> b!1458475 (= lt!638898 lt!638897)))

(declare-datatypes ((Unit!49017 0))(
  ( (Unit!49018) )
))
(declare-fun lt!638893 () Unit!49017)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49017)

(assert (=> b!1458475 (= lt!638893 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!638891 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458476 () Bool)

(declare-fun res!988674 () Bool)

(declare-fun e!820326 () Bool)

(assert (=> b!1458476 (=> (not res!988674) (not e!820326))))

(assert (=> b!1458476 (= res!988674 e!820329)))

(declare-fun c!134416 () Bool)

(assert (=> b!1458476 (= c!134416 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458477 () Bool)

(declare-fun res!988667 () Bool)

(assert (=> b!1458477 (=> res!988667 e!820327)))

(assert (=> b!1458477 (= res!988667 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1458478 () Bool)

(assert (=> b!1458478 (= e!820331 e!820328)))

(declare-fun res!988668 () Bool)

(assert (=> b!1458478 (=> (not res!988668) (not e!820328))))

(assert (=> b!1458478 (= res!988668 (= (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458478 (= lt!638896 (array!98549 (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48115 a!2862)))))

(declare-fun b!1458479 () Bool)

(declare-fun res!988669 () Bool)

(assert (=> b!1458479 (=> (not res!988669) (not e!820331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458479 (= res!988669 (validKeyInArray!0 (select (arr!47563 a!2862) j!93)))))

(declare-fun b!1458480 () Bool)

(declare-fun res!988676 () Bool)

(assert (=> b!1458480 (=> (not res!988676) (not e!820326))))

(assert (=> b!1458480 (= res!988676 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458470 () Bool)

(declare-fun lt!638890 () SeekEntryResult!11840)

(assert (=> b!1458470 (= e!820324 (not (= lt!638890 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638891 lt!638895 lt!638896 mask!2687))))))

(declare-fun res!988672 () Bool)

(assert (=> start!125122 (=> (not res!988672) (not e!820331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125122 (= res!988672 (validMask!0 mask!2687))))

(assert (=> start!125122 e!820331))

(assert (=> start!125122 true))

(declare-fun array_inv!36796 (array!98548) Bool)

(assert (=> start!125122 (array_inv!36796 a!2862)))

(declare-fun b!1458481 () Bool)

(declare-fun res!988675 () Bool)

(assert (=> b!1458481 (=> (not res!988675) (not e!820331))))

(assert (=> b!1458481 (= res!988675 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48115 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48115 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48115 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458482 () Bool)

(declare-fun res!988663 () Bool)

(assert (=> b!1458482 (=> (not res!988663) (not e!820331))))

(assert (=> b!1458482 (= res!988663 (validKeyInArray!0 (select (arr!47563 a!2862) i!1006)))))

(declare-fun b!1458483 () Bool)

(assert (=> b!1458483 (= e!820332 e!820326)))

(declare-fun res!988671 () Bool)

(assert (=> b!1458483 (=> (not res!988671) (not e!820326))))

(assert (=> b!1458483 (= res!988671 (= lt!638890 (Intermediate!11840 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458483 (= lt!638890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638895 mask!2687) lt!638895 lt!638896 mask!2687))))

(assert (=> b!1458483 (= lt!638895 (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458484 () Bool)

(assert (=> b!1458484 (= e!820329 (= lt!638890 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638895 lt!638896 mask!2687)))))

(declare-fun b!1458485 () Bool)

(assert (=> b!1458485 (= e!820326 (not e!820330))))

(declare-fun res!988673 () Bool)

(assert (=> b!1458485 (=> res!988673 e!820330)))

(assert (=> b!1458485 (= res!988673 (or (and (= (select (arr!47563 a!2862) index!646) (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47563 a!2862) index!646) (select (arr!47563 a!2862) j!93))) (= (select (arr!47563 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458485 (and (= lt!638898 (Found!11840 j!93)) (or (= (select (arr!47563 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47563 a!2862) intermediateBeforeIndex!19) (select (arr!47563 a!2862) j!93))) (let ((bdg!53449 (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47563 a!2862) index!646) bdg!53449) (= (select (arr!47563 a!2862) index!646) (select (arr!47563 a!2862) j!93))) (= (select (arr!47563 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53449 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458485 (= lt!638898 (seekEntryOrOpen!0 (select (arr!47563 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1458485 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!638894 () Unit!49017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49017)

(assert (=> b!1458485 (= lt!638894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458486 () Bool)

(declare-fun res!988670 () Bool)

(assert (=> b!1458486 (=> res!988670 e!820327)))

(assert (=> b!1458486 (= res!988670 e!820324)))

(declare-fun c!134415 () Bool)

(assert (=> b!1458486 (= c!134415 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125122 res!988672) b!1458466))

(assert (= (and b!1458466 res!988677) b!1458482))

(assert (= (and b!1458482 res!988663) b!1458479))

(assert (= (and b!1458479 res!988669) b!1458465))

(assert (= (and b!1458465 res!988662) b!1458468))

(assert (= (and b!1458468 res!988678) b!1458481))

(assert (= (and b!1458481 res!988675) b!1458478))

(assert (= (and b!1458478 res!988668) b!1458469))

(assert (= (and b!1458469 res!988665) b!1458473))

(assert (= (and b!1458473 res!988666) b!1458483))

(assert (= (and b!1458483 res!988671) b!1458476))

(assert (= (and b!1458476 c!134416) b!1458484))

(assert (= (and b!1458476 (not c!134416)) b!1458472))

(assert (= (and b!1458476 res!988674) b!1458480))

(assert (= (and b!1458480 res!988676) b!1458485))

(assert (= (and b!1458485 (not res!988673)) b!1458467))

(assert (= (and b!1458467 (not res!988661)) b!1458474))

(assert (= (and b!1458474 (not res!988664)) b!1458486))

(assert (= (and b!1458486 c!134415) b!1458470))

(assert (= (and b!1458486 (not c!134415)) b!1458471))

(assert (= (and b!1458486 (not res!988670)) b!1458477))

(assert (= (and b!1458477 (not res!988667)) b!1458475))

(declare-fun m!1345815 () Bool)

(assert (=> start!125122 m!1345815))

(declare-fun m!1345817 () Bool)

(assert (=> start!125122 m!1345817))

(declare-fun m!1345819 () Bool)

(assert (=> b!1458465 m!1345819))

(declare-fun m!1345821 () Bool)

(assert (=> b!1458483 m!1345821))

(assert (=> b!1458483 m!1345821))

(declare-fun m!1345823 () Bool)

(assert (=> b!1458483 m!1345823))

(declare-fun m!1345825 () Bool)

(assert (=> b!1458483 m!1345825))

(declare-fun m!1345827 () Bool)

(assert (=> b!1458483 m!1345827))

(declare-fun m!1345829 () Bool)

(assert (=> b!1458482 m!1345829))

(assert (=> b!1458482 m!1345829))

(declare-fun m!1345831 () Bool)

(assert (=> b!1458482 m!1345831))

(declare-fun m!1345833 () Bool)

(assert (=> b!1458484 m!1345833))

(declare-fun m!1345835 () Bool)

(assert (=> b!1458474 m!1345835))

(assert (=> b!1458474 m!1345835))

(declare-fun m!1345837 () Bool)

(assert (=> b!1458474 m!1345837))

(declare-fun m!1345839 () Bool)

(assert (=> b!1458468 m!1345839))

(assert (=> b!1458473 m!1345835))

(assert (=> b!1458473 m!1345835))

(declare-fun m!1345841 () Bool)

(assert (=> b!1458473 m!1345841))

(assert (=> b!1458478 m!1345825))

(declare-fun m!1345843 () Bool)

(assert (=> b!1458478 m!1345843))

(declare-fun m!1345845 () Bool)

(assert (=> b!1458485 m!1345845))

(assert (=> b!1458485 m!1345825))

(declare-fun m!1345847 () Bool)

(assert (=> b!1458485 m!1345847))

(declare-fun m!1345849 () Bool)

(assert (=> b!1458485 m!1345849))

(declare-fun m!1345851 () Bool)

(assert (=> b!1458485 m!1345851))

(assert (=> b!1458485 m!1345835))

(declare-fun m!1345853 () Bool)

(assert (=> b!1458485 m!1345853))

(declare-fun m!1345855 () Bool)

(assert (=> b!1458485 m!1345855))

(assert (=> b!1458485 m!1345835))

(declare-fun m!1345857 () Bool)

(assert (=> b!1458470 m!1345857))

(assert (=> b!1458469 m!1345835))

(assert (=> b!1458469 m!1345835))

(declare-fun m!1345859 () Bool)

(assert (=> b!1458469 m!1345859))

(assert (=> b!1458469 m!1345859))

(assert (=> b!1458469 m!1345835))

(declare-fun m!1345861 () Bool)

(assert (=> b!1458469 m!1345861))

(declare-fun m!1345863 () Bool)

(assert (=> b!1458471 m!1345863))

(assert (=> b!1458479 m!1345835))

(assert (=> b!1458479 m!1345835))

(declare-fun m!1345865 () Bool)

(assert (=> b!1458479 m!1345865))

(declare-fun m!1345867 () Bool)

(assert (=> b!1458475 m!1345867))

(declare-fun m!1345869 () Bool)

(assert (=> b!1458472 m!1345869))

(declare-fun m!1345871 () Bool)

(assert (=> b!1458472 m!1345871))

(declare-fun m!1345873 () Bool)

(assert (=> b!1458467 m!1345873))

(assert (=> b!1458467 m!1345869))

(assert (=> b!1458467 m!1345871))

(check-sat (not b!1458482) (not b!1458465) (not b!1458473) (not b!1458475) (not b!1458479) (not b!1458470) (not b!1458485) (not b!1458469) (not b!1458468) (not b!1458484) (not b!1458467) (not b!1458474) (not b!1458471) (not start!125122) (not b!1458472) (not b!1458483))
(check-sat)
