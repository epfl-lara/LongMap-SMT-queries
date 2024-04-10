; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125334 () Bool)

(assert start!125334)

(declare-fun b!1464495 () Bool)

(declare-fun e!823010 () Bool)

(declare-fun e!823007 () Bool)

(assert (=> b!1464495 (= e!823010 e!823007)))

(declare-fun res!993569 () Bool)

(assert (=> b!1464495 (=> (not res!993569) (not e!823007))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98782 0))(
  ( (array!98783 (arr!47679 (Array (_ BitVec 32) (_ BitVec 64))) (size!48229 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98782)

(assert (=> b!1464495 (= res!993569 (= (select (store (arr!47679 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641104 () array!98782)

(assert (=> b!1464495 (= lt!641104 (array!98783 (store (arr!47679 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48229 a!2862)))))

(declare-fun b!1464496 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!823004 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!641107 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11931 0))(
  ( (MissingZero!11931 (index!50116 (_ BitVec 32))) (Found!11931 (index!50117 (_ BitVec 32))) (Intermediate!11931 (undefined!12743 Bool) (index!50118 (_ BitVec 32)) (x!131700 (_ BitVec 32))) (Undefined!11931) (MissingVacant!11931 (index!50119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98782 (_ BitVec 32)) SeekEntryResult!11931)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98782 (_ BitVec 32)) SeekEntryResult!11931)

(assert (=> b!1464496 (= e!823004 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641107 lt!641104 mask!2687) (seekEntryOrOpen!0 lt!641107 lt!641104 mask!2687)))))

(declare-fun b!1464497 () Bool)

(declare-fun res!993556 () Bool)

(declare-fun e!823001 () Bool)

(assert (=> b!1464497 (=> (not res!993556) (not e!823001))))

(declare-fun lt!641103 () SeekEntryResult!11931)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98782 (_ BitVec 32)) SeekEntryResult!11931)

(assert (=> b!1464497 (= res!993556 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47679 a!2862) j!93) a!2862 mask!2687) lt!641103))))

(declare-fun b!1464498 () Bool)

(declare-fun res!993567 () Bool)

(declare-fun e!823006 () Bool)

(assert (=> b!1464498 (=> (not res!993567) (not e!823006))))

(assert (=> b!1464498 (= res!993567 (= (seekEntryOrOpen!0 (select (arr!47679 a!2862) j!93) a!2862 mask!2687) (Found!11931 j!93)))))

(declare-fun b!1464499 () Bool)

(declare-fun e!823002 () Bool)

(declare-fun e!823008 () Bool)

(assert (=> b!1464499 (= e!823002 e!823008)))

(declare-fun res!993554 () Bool)

(assert (=> b!1464499 (=> res!993554 e!823008)))

(declare-fun lt!641108 () (_ BitVec 32))

(assert (=> b!1464499 (= res!993554 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641108 #b00000000000000000000000000000000) (bvsge lt!641108 (size!48229 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464499 (= lt!641108 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464500 () Bool)

(declare-fun e!823009 () Bool)

(assert (=> b!1464500 (= e!823001 e!823009)))

(declare-fun res!993559 () Bool)

(assert (=> b!1464500 (=> (not res!993559) (not e!823009))))

(declare-fun lt!641109 () SeekEntryResult!11931)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464500 (= res!993559 (= lt!641109 (Intermediate!11931 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464500 (= lt!641109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641107 mask!2687) lt!641107 lt!641104 mask!2687))))

(assert (=> b!1464500 (= lt!641107 (select (store (arr!47679 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464501 () Bool)

(declare-fun res!993568 () Bool)

(assert (=> b!1464501 (=> (not res!993568) (not e!823010))))

(assert (=> b!1464501 (= res!993568 (and (= (size!48229 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48229 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48229 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464502 () Bool)

(assert (=> b!1464502 (= e!823009 (not e!823002))))

(declare-fun res!993566 () Bool)

(assert (=> b!1464502 (=> res!993566 e!823002)))

(assert (=> b!1464502 (= res!993566 (or (and (= (select (arr!47679 a!2862) index!646) (select (store (arr!47679 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47679 a!2862) index!646) (select (arr!47679 a!2862) j!93))) (= (select (arr!47679 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464502 e!823006))

(declare-fun res!993557 () Bool)

(assert (=> b!1464502 (=> (not res!993557) (not e!823006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98782 (_ BitVec 32)) Bool)

(assert (=> b!1464502 (= res!993557 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49358 0))(
  ( (Unit!49359) )
))
(declare-fun lt!641106 () Unit!49358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49358)

(assert (=> b!1464502 (= lt!641106 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464503 () Bool)

(declare-fun res!993558 () Bool)

(assert (=> b!1464503 (=> (not res!993558) (not e!823010))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464503 (= res!993558 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48229 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48229 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48229 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464504 () Bool)

(declare-fun res!993560 () Bool)

(assert (=> b!1464504 (=> (not res!993560) (not e!823010))))

(declare-datatypes ((List!34180 0))(
  ( (Nil!34177) (Cons!34176 (h!35526 (_ BitVec 64)) (t!48874 List!34180)) )
))
(declare-fun arrayNoDuplicates!0 (array!98782 (_ BitVec 32) List!34180) Bool)

(assert (=> b!1464504 (= res!993560 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34177))))

(declare-fun b!1464505 () Bool)

(declare-fun e!823003 () Bool)

(assert (=> b!1464505 (= e!823003 (not (= lt!641109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641108 lt!641107 lt!641104 mask!2687))))))

(declare-fun b!1464506 () Bool)

(assert (=> b!1464506 (= e!823003 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641108 intermediateAfterIndex!19 lt!641107 lt!641104 mask!2687) (seekEntryOrOpen!0 lt!641107 lt!641104 mask!2687))))))

(declare-fun b!1464507 () Bool)

(declare-fun res!993563 () Bool)

(assert (=> b!1464507 (=> (not res!993563) (not e!823010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464507 (= res!993563 (validKeyInArray!0 (select (arr!47679 a!2862) j!93)))))

(declare-fun b!1464508 () Bool)

(declare-fun res!993571 () Bool)

(assert (=> b!1464508 (=> (not res!993571) (not e!823009))))

(assert (=> b!1464508 (= res!993571 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464510 () Bool)

(declare-fun res!993570 () Bool)

(assert (=> b!1464510 (=> (not res!993570) (not e!823010))))

(assert (=> b!1464510 (= res!993570 (validKeyInArray!0 (select (arr!47679 a!2862) i!1006)))))

(declare-fun b!1464511 () Bool)

(declare-fun res!993561 () Bool)

(assert (=> b!1464511 (=> (not res!993561) (not e!823009))))

(assert (=> b!1464511 (= res!993561 e!823004)))

(declare-fun c!134982 () Bool)

(assert (=> b!1464511 (= c!134982 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464512 () Bool)

(assert (=> b!1464512 (= e!823008 true)))

(declare-fun lt!641105 () Bool)

(assert (=> b!1464512 (= lt!641105 e!823003)))

(declare-fun c!134981 () Bool)

(assert (=> b!1464512 (= c!134981 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464509 () Bool)

(assert (=> b!1464509 (= e!823007 e!823001)))

(declare-fun res!993555 () Bool)

(assert (=> b!1464509 (=> (not res!993555) (not e!823001))))

(assert (=> b!1464509 (= res!993555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47679 a!2862) j!93) mask!2687) (select (arr!47679 a!2862) j!93) a!2862 mask!2687) lt!641103))))

(assert (=> b!1464509 (= lt!641103 (Intermediate!11931 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!993565 () Bool)

(assert (=> start!125334 (=> (not res!993565) (not e!823010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125334 (= res!993565 (validMask!0 mask!2687))))

(assert (=> start!125334 e!823010))

(assert (=> start!125334 true))

(declare-fun array_inv!36707 (array!98782) Bool)

(assert (=> start!125334 (array_inv!36707 a!2862)))

(declare-fun b!1464513 () Bool)

(declare-fun res!993562 () Bool)

(assert (=> b!1464513 (=> (not res!993562) (not e!823010))))

(assert (=> b!1464513 (= res!993562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464514 () Bool)

(assert (=> b!1464514 (= e!823006 (or (= (select (arr!47679 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47679 a!2862) intermediateBeforeIndex!19) (select (arr!47679 a!2862) j!93))))))

(declare-fun b!1464515 () Bool)

(declare-fun res!993564 () Bool)

(assert (=> b!1464515 (=> res!993564 e!823008)))

(assert (=> b!1464515 (= res!993564 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641108 (select (arr!47679 a!2862) j!93) a!2862 mask!2687) lt!641103)))))

(declare-fun b!1464516 () Bool)

(assert (=> b!1464516 (= e!823004 (= lt!641109 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641107 lt!641104 mask!2687)))))

(assert (= (and start!125334 res!993565) b!1464501))

(assert (= (and b!1464501 res!993568) b!1464510))

(assert (= (and b!1464510 res!993570) b!1464507))

(assert (= (and b!1464507 res!993563) b!1464513))

(assert (= (and b!1464513 res!993562) b!1464504))

(assert (= (and b!1464504 res!993560) b!1464503))

(assert (= (and b!1464503 res!993558) b!1464495))

(assert (= (and b!1464495 res!993569) b!1464509))

(assert (= (and b!1464509 res!993555) b!1464497))

(assert (= (and b!1464497 res!993556) b!1464500))

(assert (= (and b!1464500 res!993559) b!1464511))

(assert (= (and b!1464511 c!134982) b!1464516))

(assert (= (and b!1464511 (not c!134982)) b!1464496))

(assert (= (and b!1464511 res!993561) b!1464508))

(assert (= (and b!1464508 res!993571) b!1464502))

(assert (= (and b!1464502 res!993557) b!1464498))

(assert (= (and b!1464498 res!993567) b!1464514))

(assert (= (and b!1464502 (not res!993566)) b!1464499))

(assert (= (and b!1464499 (not res!993554)) b!1464515))

(assert (= (and b!1464515 (not res!993564)) b!1464512))

(assert (= (and b!1464512 c!134981) b!1464505))

(assert (= (and b!1464512 (not c!134981)) b!1464506))

(declare-fun m!1351703 () Bool)

(assert (=> b!1464504 m!1351703))

(declare-fun m!1351705 () Bool)

(assert (=> b!1464514 m!1351705))

(declare-fun m!1351707 () Bool)

(assert (=> b!1464514 m!1351707))

(declare-fun m!1351709 () Bool)

(assert (=> b!1464513 m!1351709))

(declare-fun m!1351711 () Bool)

(assert (=> b!1464506 m!1351711))

(declare-fun m!1351713 () Bool)

(assert (=> b!1464506 m!1351713))

(assert (=> b!1464515 m!1351707))

(assert (=> b!1464515 m!1351707))

(declare-fun m!1351715 () Bool)

(assert (=> b!1464515 m!1351715))

(declare-fun m!1351717 () Bool)

(assert (=> b!1464505 m!1351717))

(declare-fun m!1351719 () Bool)

(assert (=> b!1464502 m!1351719))

(declare-fun m!1351721 () Bool)

(assert (=> b!1464502 m!1351721))

(declare-fun m!1351723 () Bool)

(assert (=> b!1464502 m!1351723))

(declare-fun m!1351725 () Bool)

(assert (=> b!1464502 m!1351725))

(declare-fun m!1351727 () Bool)

(assert (=> b!1464502 m!1351727))

(assert (=> b!1464502 m!1351707))

(assert (=> b!1464507 m!1351707))

(assert (=> b!1464507 m!1351707))

(declare-fun m!1351729 () Bool)

(assert (=> b!1464507 m!1351729))

(declare-fun m!1351731 () Bool)

(assert (=> b!1464496 m!1351731))

(assert (=> b!1464496 m!1351713))

(declare-fun m!1351733 () Bool)

(assert (=> b!1464500 m!1351733))

(assert (=> b!1464500 m!1351733))

(declare-fun m!1351735 () Bool)

(assert (=> b!1464500 m!1351735))

(assert (=> b!1464500 m!1351721))

(declare-fun m!1351737 () Bool)

(assert (=> b!1464500 m!1351737))

(assert (=> b!1464509 m!1351707))

(assert (=> b!1464509 m!1351707))

(declare-fun m!1351739 () Bool)

(assert (=> b!1464509 m!1351739))

(assert (=> b!1464509 m!1351739))

(assert (=> b!1464509 m!1351707))

(declare-fun m!1351741 () Bool)

(assert (=> b!1464509 m!1351741))

(declare-fun m!1351743 () Bool)

(assert (=> start!125334 m!1351743))

(declare-fun m!1351745 () Bool)

(assert (=> start!125334 m!1351745))

(assert (=> b!1464495 m!1351721))

(declare-fun m!1351747 () Bool)

(assert (=> b!1464495 m!1351747))

(assert (=> b!1464497 m!1351707))

(assert (=> b!1464497 m!1351707))

(declare-fun m!1351749 () Bool)

(assert (=> b!1464497 m!1351749))

(assert (=> b!1464498 m!1351707))

(assert (=> b!1464498 m!1351707))

(declare-fun m!1351751 () Bool)

(assert (=> b!1464498 m!1351751))

(declare-fun m!1351753 () Bool)

(assert (=> b!1464510 m!1351753))

(assert (=> b!1464510 m!1351753))

(declare-fun m!1351755 () Bool)

(assert (=> b!1464510 m!1351755))

(declare-fun m!1351757 () Bool)

(assert (=> b!1464499 m!1351757))

(declare-fun m!1351759 () Bool)

(assert (=> b!1464516 m!1351759))

(check-sat (not b!1464502) (not b!1464504) (not b!1464498) (not b!1464500) (not b!1464499) (not b!1464507) (not b!1464515) (not b!1464505) (not b!1464513) (not b!1464497) (not b!1464506) (not b!1464516) (not start!125334) (not b!1464509) (not b!1464510) (not b!1464496))
(check-sat)
