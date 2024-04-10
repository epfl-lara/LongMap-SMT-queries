; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126918 () Bool)

(assert start!126918)

(declare-fun b!1491598 () Bool)

(declare-fun res!1014749 () Bool)

(declare-fun e!835698 () Bool)

(assert (=> b!1491598 (=> (not res!1014749) (not e!835698))))

(declare-datatypes ((array!99691 0))(
  ( (array!99692 (arr!48117 (Array (_ BitVec 32) (_ BitVec 64))) (size!48667 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99691)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12357 0))(
  ( (MissingZero!12357 (index!51820 (_ BitVec 32))) (Found!12357 (index!51821 (_ BitVec 32))) (Intermediate!12357 (undefined!13169 Bool) (index!51822 (_ BitVec 32)) (x!133405 (_ BitVec 32))) (Undefined!12357) (MissingVacant!12357 (index!51823 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99691 (_ BitVec 32)) SeekEntryResult!12357)

(assert (=> b!1491598 (= res!1014749 (= (seekEntryOrOpen!0 (select (arr!48117 a!2862) j!93) a!2862 mask!2687) (Found!12357 j!93)))))

(declare-fun b!1491599 () Bool)

(declare-fun e!835700 () Bool)

(declare-fun e!835697 () Bool)

(assert (=> b!1491599 (= e!835700 e!835697)))

(declare-fun res!1014750 () Bool)

(assert (=> b!1491599 (=> (not res!1014750) (not e!835697))))

(declare-fun lt!650331 () SeekEntryResult!12357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99691 (_ BitVec 32)) SeekEntryResult!12357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491599 (= res!1014750 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48117 a!2862) j!93) mask!2687) (select (arr!48117 a!2862) j!93) a!2862 mask!2687) lt!650331))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491599 (= lt!650331 (Intermediate!12357 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491600 () Bool)

(declare-fun e!835696 () Bool)

(assert (=> b!1491600 (= e!835697 e!835696)))

(declare-fun res!1014755 () Bool)

(assert (=> b!1491600 (=> (not res!1014755) (not e!835696))))

(declare-fun lt!650332 () SeekEntryResult!12357)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491600 (= res!1014755 (= lt!650332 (Intermediate!12357 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650330 () (_ BitVec 64))

(declare-fun lt!650329 () array!99691)

(assert (=> b!1491600 (= lt!650332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650330 mask!2687) lt!650330 lt!650329 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491600 (= lt!650330 (select (store (arr!48117 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491601 () Bool)

(declare-fun e!835699 () Bool)

(assert (=> b!1491601 (= e!835699 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650333 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491601 (= lt!650333 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491602 () Bool)

(declare-fun e!835703 () Bool)

(assert (=> b!1491602 (= e!835703 e!835700)))

(declare-fun res!1014762 () Bool)

(assert (=> b!1491602 (=> (not res!1014762) (not e!835700))))

(assert (=> b!1491602 (= res!1014762 (= (select (store (arr!48117 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491602 (= lt!650329 (array!99692 (store (arr!48117 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48667 a!2862)))))

(declare-fun b!1491603 () Bool)

(declare-fun res!1014752 () Bool)

(assert (=> b!1491603 (=> (not res!1014752) (not e!835703))))

(assert (=> b!1491603 (= res!1014752 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48667 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48667 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48667 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491604 () Bool)

(declare-fun res!1014759 () Bool)

(assert (=> b!1491604 (=> (not res!1014759) (not e!835703))))

(declare-datatypes ((List!34618 0))(
  ( (Nil!34615) (Cons!34614 (h!35997 (_ BitVec 64)) (t!49312 List!34618)) )
))
(declare-fun arrayNoDuplicates!0 (array!99691 (_ BitVec 32) List!34618) Bool)

(assert (=> b!1491604 (= res!1014759 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34615))))

(declare-fun b!1491605 () Bool)

(declare-fun e!835701 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99691 (_ BitVec 32)) SeekEntryResult!12357)

(assert (=> b!1491605 (= e!835701 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650330 lt!650329 mask!2687) (seekEntryOrOpen!0 lt!650330 lt!650329 mask!2687)))))

(declare-fun b!1491606 () Bool)

(declare-fun res!1014758 () Bool)

(assert (=> b!1491606 (=> (not res!1014758) (not e!835703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99691 (_ BitVec 32)) Bool)

(assert (=> b!1491606 (= res!1014758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491607 () Bool)

(assert (=> b!1491607 (= e!835701 (= lt!650332 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650330 lt!650329 mask!2687)))))

(declare-fun res!1014761 () Bool)

(assert (=> start!126918 (=> (not res!1014761) (not e!835703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126918 (= res!1014761 (validMask!0 mask!2687))))

(assert (=> start!126918 e!835703))

(assert (=> start!126918 true))

(declare-fun array_inv!37145 (array!99691) Bool)

(assert (=> start!126918 (array_inv!37145 a!2862)))

(declare-fun b!1491608 () Bool)

(assert (=> b!1491608 (= e!835698 (or (= (select (arr!48117 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48117 a!2862) intermediateBeforeIndex!19) (select (arr!48117 a!2862) j!93))))))

(declare-fun b!1491609 () Bool)

(assert (=> b!1491609 (= e!835696 (not e!835699))))

(declare-fun res!1014751 () Bool)

(assert (=> b!1491609 (=> res!1014751 e!835699)))

(assert (=> b!1491609 (= res!1014751 (or (and (= (select (arr!48117 a!2862) index!646) (select (store (arr!48117 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48117 a!2862) index!646) (select (arr!48117 a!2862) j!93))) (= (select (arr!48117 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491609 e!835698))

(declare-fun res!1014754 () Bool)

(assert (=> b!1491609 (=> (not res!1014754) (not e!835698))))

(assert (=> b!1491609 (= res!1014754 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50054 0))(
  ( (Unit!50055) )
))
(declare-fun lt!650334 () Unit!50054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50054)

(assert (=> b!1491609 (= lt!650334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491610 () Bool)

(declare-fun res!1014757 () Bool)

(assert (=> b!1491610 (=> (not res!1014757) (not e!835696))))

(assert (=> b!1491610 (= res!1014757 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491611 () Bool)

(declare-fun res!1014763 () Bool)

(assert (=> b!1491611 (=> (not res!1014763) (not e!835697))))

(assert (=> b!1491611 (= res!1014763 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48117 a!2862) j!93) a!2862 mask!2687) lt!650331))))

(declare-fun b!1491612 () Bool)

(declare-fun res!1014760 () Bool)

(assert (=> b!1491612 (=> (not res!1014760) (not e!835703))))

(assert (=> b!1491612 (= res!1014760 (and (= (size!48667 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48667 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48667 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491613 () Bool)

(declare-fun res!1014756 () Bool)

(assert (=> b!1491613 (=> (not res!1014756) (not e!835703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491613 (= res!1014756 (validKeyInArray!0 (select (arr!48117 a!2862) j!93)))))

(declare-fun b!1491614 () Bool)

(declare-fun res!1014753 () Bool)

(assert (=> b!1491614 (=> (not res!1014753) (not e!835696))))

(assert (=> b!1491614 (= res!1014753 e!835701)))

(declare-fun c!137952 () Bool)

(assert (=> b!1491614 (= c!137952 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491615 () Bool)

(declare-fun res!1014748 () Bool)

(assert (=> b!1491615 (=> (not res!1014748) (not e!835703))))

(assert (=> b!1491615 (= res!1014748 (validKeyInArray!0 (select (arr!48117 a!2862) i!1006)))))

(assert (= (and start!126918 res!1014761) b!1491612))

(assert (= (and b!1491612 res!1014760) b!1491615))

(assert (= (and b!1491615 res!1014748) b!1491613))

(assert (= (and b!1491613 res!1014756) b!1491606))

(assert (= (and b!1491606 res!1014758) b!1491604))

(assert (= (and b!1491604 res!1014759) b!1491603))

(assert (= (and b!1491603 res!1014752) b!1491602))

(assert (= (and b!1491602 res!1014762) b!1491599))

(assert (= (and b!1491599 res!1014750) b!1491611))

(assert (= (and b!1491611 res!1014763) b!1491600))

(assert (= (and b!1491600 res!1014755) b!1491614))

(assert (= (and b!1491614 c!137952) b!1491607))

(assert (= (and b!1491614 (not c!137952)) b!1491605))

(assert (= (and b!1491614 res!1014753) b!1491610))

(assert (= (and b!1491610 res!1014757) b!1491609))

(assert (= (and b!1491609 res!1014754) b!1491598))

(assert (= (and b!1491598 res!1014749) b!1491608))

(assert (= (and b!1491609 (not res!1014751)) b!1491601))

(declare-fun m!1375715 () Bool)

(assert (=> b!1491598 m!1375715))

(assert (=> b!1491598 m!1375715))

(declare-fun m!1375717 () Bool)

(assert (=> b!1491598 m!1375717))

(declare-fun m!1375719 () Bool)

(assert (=> b!1491605 m!1375719))

(declare-fun m!1375721 () Bool)

(assert (=> b!1491605 m!1375721))

(assert (=> b!1491599 m!1375715))

(assert (=> b!1491599 m!1375715))

(declare-fun m!1375723 () Bool)

(assert (=> b!1491599 m!1375723))

(assert (=> b!1491599 m!1375723))

(assert (=> b!1491599 m!1375715))

(declare-fun m!1375725 () Bool)

(assert (=> b!1491599 m!1375725))

(declare-fun m!1375727 () Bool)

(assert (=> b!1491601 m!1375727))

(declare-fun m!1375729 () Bool)

(assert (=> b!1491609 m!1375729))

(declare-fun m!1375731 () Bool)

(assert (=> b!1491609 m!1375731))

(declare-fun m!1375733 () Bool)

(assert (=> b!1491609 m!1375733))

(declare-fun m!1375735 () Bool)

(assert (=> b!1491609 m!1375735))

(declare-fun m!1375737 () Bool)

(assert (=> b!1491609 m!1375737))

(assert (=> b!1491609 m!1375715))

(declare-fun m!1375739 () Bool)

(assert (=> b!1491604 m!1375739))

(declare-fun m!1375741 () Bool)

(assert (=> start!126918 m!1375741))

(declare-fun m!1375743 () Bool)

(assert (=> start!126918 m!1375743))

(assert (=> b!1491611 m!1375715))

(assert (=> b!1491611 m!1375715))

(declare-fun m!1375745 () Bool)

(assert (=> b!1491611 m!1375745))

(declare-fun m!1375747 () Bool)

(assert (=> b!1491606 m!1375747))

(declare-fun m!1375749 () Bool)

(assert (=> b!1491608 m!1375749))

(assert (=> b!1491608 m!1375715))

(declare-fun m!1375751 () Bool)

(assert (=> b!1491600 m!1375751))

(assert (=> b!1491600 m!1375751))

(declare-fun m!1375753 () Bool)

(assert (=> b!1491600 m!1375753))

(assert (=> b!1491600 m!1375731))

(declare-fun m!1375755 () Bool)

(assert (=> b!1491600 m!1375755))

(assert (=> b!1491602 m!1375731))

(declare-fun m!1375757 () Bool)

(assert (=> b!1491602 m!1375757))

(assert (=> b!1491613 m!1375715))

(assert (=> b!1491613 m!1375715))

(declare-fun m!1375759 () Bool)

(assert (=> b!1491613 m!1375759))

(declare-fun m!1375761 () Bool)

(assert (=> b!1491607 m!1375761))

(declare-fun m!1375763 () Bool)

(assert (=> b!1491615 m!1375763))

(assert (=> b!1491615 m!1375763))

(declare-fun m!1375765 () Bool)

(assert (=> b!1491615 m!1375765))

(check-sat (not b!1491598) (not start!126918) (not b!1491599) (not b!1491605) (not b!1491609) (not b!1491601) (not b!1491606) (not b!1491615) (not b!1491607) (not b!1491611) (not b!1491604) (not b!1491600) (not b!1491613))
(check-sat)
