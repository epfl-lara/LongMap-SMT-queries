; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125304 () Bool)

(assert start!125304)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!822559 () Bool)

(declare-fun lt!640789 () (_ BitVec 64))

(declare-fun lt!640791 () (_ BitVec 32))

(declare-fun b!1463505 () Bool)

(declare-datatypes ((array!98752 0))(
  ( (array!98753 (arr!47664 (Array (_ BitVec 32) (_ BitVec 64))) (size!48214 (_ BitVec 32))) )
))
(declare-fun lt!640794 () array!98752)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11916 0))(
  ( (MissingZero!11916 (index!50056 (_ BitVec 32))) (Found!11916 (index!50057 (_ BitVec 32))) (Intermediate!11916 (undefined!12728 Bool) (index!50058 (_ BitVec 32)) (x!131645 (_ BitVec 32))) (Undefined!11916) (MissingVacant!11916 (index!50059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98752 (_ BitVec 32)) SeekEntryResult!11916)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98752 (_ BitVec 32)) SeekEntryResult!11916)

(assert (=> b!1463505 (= e!822559 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640791 intermediateAfterIndex!19 lt!640789 lt!640794 mask!2687) (seekEntryOrOpen!0 lt!640789 lt!640794 mask!2687))))))

(declare-fun b!1463506 () Bool)

(declare-fun res!992752 () Bool)

(declare-fun e!822551 () Bool)

(assert (=> b!1463506 (=> (not res!992752) (not e!822551))))

(declare-fun a!2862 () array!98752)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1463506 (= res!992752 (= (seekEntryOrOpen!0 (select (arr!47664 a!2862) j!93) a!2862 mask!2687) (Found!11916 j!93)))))

(declare-fun b!1463507 () Bool)

(declare-fun res!992756 () Bool)

(declare-fun e!822553 () Bool)

(assert (=> b!1463507 (=> res!992756 e!822553)))

(declare-fun lt!640788 () SeekEntryResult!11916)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98752 (_ BitVec 32)) SeekEntryResult!11916)

(assert (=> b!1463507 (= res!992756 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640791 (select (arr!47664 a!2862) j!93) a!2862 mask!2687) lt!640788)))))

(declare-fun b!1463509 () Bool)

(declare-fun res!992753 () Bool)

(declare-fun e!822552 () Bool)

(assert (=> b!1463509 (=> (not res!992753) (not e!822552))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463509 (= res!992753 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48214 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48214 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48214 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463510 () Bool)

(declare-fun e!822556 () Bool)

(assert (=> b!1463510 (= e!822556 e!822553)))

(declare-fun res!992761 () Bool)

(assert (=> b!1463510 (=> res!992761 e!822553)))

(assert (=> b!1463510 (= res!992761 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640791 #b00000000000000000000000000000000) (bvsge lt!640791 (size!48214 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463510 (= lt!640791 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463511 () Bool)

(declare-fun e!822558 () Bool)

(assert (=> b!1463511 (= e!822558 (not e!822556))))

(declare-fun res!992754 () Bool)

(assert (=> b!1463511 (=> res!992754 e!822556)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463511 (= res!992754 (or (and (= (select (arr!47664 a!2862) index!646) (select (store (arr!47664 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47664 a!2862) index!646) (select (arr!47664 a!2862) j!93))) (= (select (arr!47664 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463511 e!822551))

(declare-fun res!992751 () Bool)

(assert (=> b!1463511 (=> (not res!992751) (not e!822551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98752 (_ BitVec 32)) Bool)

(assert (=> b!1463511 (= res!992751 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49328 0))(
  ( (Unit!49329) )
))
(declare-fun lt!640793 () Unit!49328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49328)

(assert (=> b!1463511 (= lt!640793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463512 () Bool)

(declare-fun res!992747 () Bool)

(assert (=> b!1463512 (=> (not res!992747) (not e!822552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463512 (= res!992747 (validKeyInArray!0 (select (arr!47664 a!2862) j!93)))))

(declare-fun b!1463508 () Bool)

(declare-fun res!992748 () Bool)

(assert (=> b!1463508 (=> (not res!992748) (not e!822552))))

(assert (=> b!1463508 (= res!992748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!992755 () Bool)

(assert (=> start!125304 (=> (not res!992755) (not e!822552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125304 (= res!992755 (validMask!0 mask!2687))))

(assert (=> start!125304 e!822552))

(assert (=> start!125304 true))

(declare-fun array_inv!36692 (array!98752) Bool)

(assert (=> start!125304 (array_inv!36692 a!2862)))

(declare-fun b!1463513 () Bool)

(declare-fun res!992746 () Bool)

(declare-fun e!822560 () Bool)

(assert (=> b!1463513 (=> (not res!992746) (not e!822560))))

(assert (=> b!1463513 (= res!992746 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47664 a!2862) j!93) a!2862 mask!2687) lt!640788))))

(declare-fun b!1463514 () Bool)

(declare-fun res!992759 () Bool)

(assert (=> b!1463514 (=> (not res!992759) (not e!822552))))

(declare-datatypes ((List!34165 0))(
  ( (Nil!34162) (Cons!34161 (h!35511 (_ BitVec 64)) (t!48859 List!34165)) )
))
(declare-fun arrayNoDuplicates!0 (array!98752 (_ BitVec 32) List!34165) Bool)

(assert (=> b!1463514 (= res!992759 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34162))))

(declare-fun b!1463515 () Bool)

(declare-fun e!822557 () Bool)

(assert (=> b!1463515 (= e!822557 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640789 lt!640794 mask!2687) (seekEntryOrOpen!0 lt!640789 lt!640794 mask!2687)))))

(declare-fun b!1463516 () Bool)

(assert (=> b!1463516 (= e!822553 true)))

(declare-fun lt!640790 () Bool)

(assert (=> b!1463516 (= lt!640790 e!822559)))

(declare-fun c!134891 () Bool)

(assert (=> b!1463516 (= c!134891 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463517 () Bool)

(assert (=> b!1463517 (= e!822560 e!822558)))

(declare-fun res!992744 () Bool)

(assert (=> b!1463517 (=> (not res!992744) (not e!822558))))

(declare-fun lt!640792 () SeekEntryResult!11916)

(assert (=> b!1463517 (= res!992744 (= lt!640792 (Intermediate!11916 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463517 (= lt!640792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640789 mask!2687) lt!640789 lt!640794 mask!2687))))

(assert (=> b!1463517 (= lt!640789 (select (store (arr!47664 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463518 () Bool)

(declare-fun res!992745 () Bool)

(assert (=> b!1463518 (=> (not res!992745) (not e!822558))))

(assert (=> b!1463518 (= res!992745 e!822557)))

(declare-fun c!134892 () Bool)

(assert (=> b!1463518 (= c!134892 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463519 () Bool)

(assert (=> b!1463519 (= e!822557 (= lt!640792 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640789 lt!640794 mask!2687)))))

(declare-fun b!1463520 () Bool)

(declare-fun res!992758 () Bool)

(assert (=> b!1463520 (=> (not res!992758) (not e!822558))))

(assert (=> b!1463520 (= res!992758 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463521 () Bool)

(declare-fun e!822554 () Bool)

(assert (=> b!1463521 (= e!822552 e!822554)))

(declare-fun res!992757 () Bool)

(assert (=> b!1463521 (=> (not res!992757) (not e!822554))))

(assert (=> b!1463521 (= res!992757 (= (select (store (arr!47664 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463521 (= lt!640794 (array!98753 (store (arr!47664 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48214 a!2862)))))

(declare-fun b!1463522 () Bool)

(assert (=> b!1463522 (= e!822551 (or (= (select (arr!47664 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47664 a!2862) intermediateBeforeIndex!19) (select (arr!47664 a!2862) j!93))))))

(declare-fun b!1463523 () Bool)

(assert (=> b!1463523 (= e!822554 e!822560)))

(declare-fun res!992750 () Bool)

(assert (=> b!1463523 (=> (not res!992750) (not e!822560))))

(assert (=> b!1463523 (= res!992750 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47664 a!2862) j!93) mask!2687) (select (arr!47664 a!2862) j!93) a!2862 mask!2687) lt!640788))))

(assert (=> b!1463523 (= lt!640788 (Intermediate!11916 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463524 () Bool)

(declare-fun res!992760 () Bool)

(assert (=> b!1463524 (=> (not res!992760) (not e!822552))))

(assert (=> b!1463524 (= res!992760 (and (= (size!48214 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48214 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48214 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463525 () Bool)

(declare-fun res!992749 () Bool)

(assert (=> b!1463525 (=> (not res!992749) (not e!822552))))

(assert (=> b!1463525 (= res!992749 (validKeyInArray!0 (select (arr!47664 a!2862) i!1006)))))

(declare-fun b!1463526 () Bool)

(assert (=> b!1463526 (= e!822559 (not (= lt!640792 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640791 lt!640789 lt!640794 mask!2687))))))

(assert (= (and start!125304 res!992755) b!1463524))

(assert (= (and b!1463524 res!992760) b!1463525))

(assert (= (and b!1463525 res!992749) b!1463512))

(assert (= (and b!1463512 res!992747) b!1463508))

(assert (= (and b!1463508 res!992748) b!1463514))

(assert (= (and b!1463514 res!992759) b!1463509))

(assert (= (and b!1463509 res!992753) b!1463521))

(assert (= (and b!1463521 res!992757) b!1463523))

(assert (= (and b!1463523 res!992750) b!1463513))

(assert (= (and b!1463513 res!992746) b!1463517))

(assert (= (and b!1463517 res!992744) b!1463518))

(assert (= (and b!1463518 c!134892) b!1463519))

(assert (= (and b!1463518 (not c!134892)) b!1463515))

(assert (= (and b!1463518 res!992745) b!1463520))

(assert (= (and b!1463520 res!992758) b!1463511))

(assert (= (and b!1463511 res!992751) b!1463506))

(assert (= (and b!1463506 res!992752) b!1463522))

(assert (= (and b!1463511 (not res!992754)) b!1463510))

(assert (= (and b!1463510 (not res!992761)) b!1463507))

(assert (= (and b!1463507 (not res!992756)) b!1463516))

(assert (= (and b!1463516 c!134891) b!1463526))

(assert (= (and b!1463516 (not c!134891)) b!1463505))

(declare-fun m!1350833 () Bool)

(assert (=> b!1463510 m!1350833))

(declare-fun m!1350835 () Bool)

(assert (=> b!1463506 m!1350835))

(assert (=> b!1463506 m!1350835))

(declare-fun m!1350837 () Bool)

(assert (=> b!1463506 m!1350837))

(declare-fun m!1350839 () Bool)

(assert (=> b!1463511 m!1350839))

(declare-fun m!1350841 () Bool)

(assert (=> b!1463511 m!1350841))

(declare-fun m!1350843 () Bool)

(assert (=> b!1463511 m!1350843))

(declare-fun m!1350845 () Bool)

(assert (=> b!1463511 m!1350845))

(declare-fun m!1350847 () Bool)

(assert (=> b!1463511 m!1350847))

(assert (=> b!1463511 m!1350835))

(assert (=> b!1463513 m!1350835))

(assert (=> b!1463513 m!1350835))

(declare-fun m!1350849 () Bool)

(assert (=> b!1463513 m!1350849))

(declare-fun m!1350851 () Bool)

(assert (=> b!1463525 m!1350851))

(assert (=> b!1463525 m!1350851))

(declare-fun m!1350853 () Bool)

(assert (=> b!1463525 m!1350853))

(declare-fun m!1350855 () Bool)

(assert (=> b!1463505 m!1350855))

(declare-fun m!1350857 () Bool)

(assert (=> b!1463505 m!1350857))

(declare-fun m!1350859 () Bool)

(assert (=> start!125304 m!1350859))

(declare-fun m!1350861 () Bool)

(assert (=> start!125304 m!1350861))

(declare-fun m!1350863 () Bool)

(assert (=> b!1463519 m!1350863))

(assert (=> b!1463521 m!1350841))

(declare-fun m!1350865 () Bool)

(assert (=> b!1463521 m!1350865))

(declare-fun m!1350867 () Bool)

(assert (=> b!1463517 m!1350867))

(assert (=> b!1463517 m!1350867))

(declare-fun m!1350869 () Bool)

(assert (=> b!1463517 m!1350869))

(assert (=> b!1463517 m!1350841))

(declare-fun m!1350871 () Bool)

(assert (=> b!1463517 m!1350871))

(declare-fun m!1350873 () Bool)

(assert (=> b!1463514 m!1350873))

(assert (=> b!1463507 m!1350835))

(assert (=> b!1463507 m!1350835))

(declare-fun m!1350875 () Bool)

(assert (=> b!1463507 m!1350875))

(declare-fun m!1350877 () Bool)

(assert (=> b!1463515 m!1350877))

(assert (=> b!1463515 m!1350857))

(declare-fun m!1350879 () Bool)

(assert (=> b!1463508 m!1350879))

(assert (=> b!1463512 m!1350835))

(assert (=> b!1463512 m!1350835))

(declare-fun m!1350881 () Bool)

(assert (=> b!1463512 m!1350881))

(declare-fun m!1350883 () Bool)

(assert (=> b!1463522 m!1350883))

(assert (=> b!1463522 m!1350835))

(assert (=> b!1463523 m!1350835))

(assert (=> b!1463523 m!1350835))

(declare-fun m!1350885 () Bool)

(assert (=> b!1463523 m!1350885))

(assert (=> b!1463523 m!1350885))

(assert (=> b!1463523 m!1350835))

(declare-fun m!1350887 () Bool)

(assert (=> b!1463523 m!1350887))

(declare-fun m!1350889 () Bool)

(assert (=> b!1463526 m!1350889))

(check-sat (not b!1463525) (not b!1463514) (not b!1463507) (not b!1463513) (not b!1463505) (not b!1463510) (not b!1463523) (not b!1463515) (not b!1463511) (not b!1463512) (not b!1463526) (not b!1463508) (not b!1463517) (not b!1463519) (not start!125304) (not b!1463506))
(check-sat)
