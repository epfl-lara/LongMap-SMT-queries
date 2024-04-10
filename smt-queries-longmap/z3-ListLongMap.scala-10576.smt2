; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124596 () Bool)

(assert start!124596)

(declare-fun b!1442591 () Bool)

(declare-fun e!813045 () Bool)

(declare-fun e!813047 () Bool)

(assert (=> b!1442591 (= e!813045 e!813047)))

(declare-fun res!974793 () Bool)

(assert (=> b!1442591 (=> (not res!974793) (not e!813047))))

(declare-datatypes ((array!98044 0))(
  ( (array!98045 (arr!47310 (Array (_ BitVec 32) (_ BitVec 64))) (size!47860 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98044)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11562 0))(
  ( (MissingZero!11562 (index!48640 (_ BitVec 32))) (Found!11562 (index!48641 (_ BitVec 32))) (Intermediate!11562 (undefined!12374 Bool) (index!48642 (_ BitVec 32)) (x!130347 (_ BitVec 32))) (Undefined!11562) (MissingVacant!11562 (index!48643 (_ BitVec 32))) )
))
(declare-fun lt!633606 () SeekEntryResult!11562)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98044 (_ BitVec 32)) SeekEntryResult!11562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442591 (= res!974793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47310 a!2862) j!93) mask!2687) (select (arr!47310 a!2862) j!93) a!2862 mask!2687) lt!633606))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442591 (= lt!633606 (Intermediate!11562 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442592 () Bool)

(declare-fun res!974799 () Bool)

(declare-fun e!813044 () Bool)

(assert (=> b!1442592 (=> (not res!974799) (not e!813044))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442592 (= res!974799 (and (= (size!47860 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47860 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47860 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442593 () Bool)

(declare-fun res!974806 () Bool)

(assert (=> b!1442593 (=> (not res!974806) (not e!813044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98044 (_ BitVec 32)) Bool)

(assert (=> b!1442593 (= res!974806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!974804 () Bool)

(assert (=> start!124596 (=> (not res!974804) (not e!813044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124596 (= res!974804 (validMask!0 mask!2687))))

(assert (=> start!124596 e!813044))

(assert (=> start!124596 true))

(declare-fun array_inv!36338 (array!98044) Bool)

(assert (=> start!124596 (array_inv!36338 a!2862)))

(declare-fun lt!633605 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633609 () array!98044)

(declare-fun b!1442594 () Bool)

(declare-fun e!813046 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98044 (_ BitVec 32)) SeekEntryResult!11562)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98044 (_ BitVec 32)) SeekEntryResult!11562)

(assert (=> b!1442594 (= e!813046 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633605 lt!633609 mask!2687) (seekEntryOrOpen!0 lt!633605 lt!633609 mask!2687)))))

(declare-fun b!1442595 () Bool)

(declare-fun res!974800 () Bool)

(assert (=> b!1442595 (=> (not res!974800) (not e!813044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442595 (= res!974800 (validKeyInArray!0 (select (arr!47310 a!2862) j!93)))))

(declare-fun b!1442596 () Bool)

(declare-fun e!813043 () Bool)

(assert (=> b!1442596 (= e!813043 (not true))))

(declare-fun e!813041 () Bool)

(assert (=> b!1442596 e!813041))

(declare-fun res!974803 () Bool)

(assert (=> b!1442596 (=> (not res!974803) (not e!813041))))

(assert (=> b!1442596 (= res!974803 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48620 0))(
  ( (Unit!48621) )
))
(declare-fun lt!633607 () Unit!48620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48620)

(assert (=> b!1442596 (= lt!633607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442597 () Bool)

(declare-fun res!974802 () Bool)

(assert (=> b!1442597 (=> (not res!974802) (not e!813043))))

(assert (=> b!1442597 (= res!974802 e!813046)))

(declare-fun c!133410 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442597 (= c!133410 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442598 () Bool)

(declare-fun lt!633608 () SeekEntryResult!11562)

(assert (=> b!1442598 (= e!813046 (= lt!633608 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633605 lt!633609 mask!2687)))))

(declare-fun b!1442599 () Bool)

(declare-fun res!974795 () Bool)

(assert (=> b!1442599 (=> (not res!974795) (not e!813041))))

(assert (=> b!1442599 (= res!974795 (= (seekEntryOrOpen!0 (select (arr!47310 a!2862) j!93) a!2862 mask!2687) (Found!11562 j!93)))))

(declare-fun b!1442600 () Bool)

(assert (=> b!1442600 (= e!813047 e!813043)))

(declare-fun res!974792 () Bool)

(assert (=> b!1442600 (=> (not res!974792) (not e!813043))))

(assert (=> b!1442600 (= res!974792 (= lt!633608 (Intermediate!11562 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442600 (= lt!633608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633605 mask!2687) lt!633605 lt!633609 mask!2687))))

(assert (=> b!1442600 (= lt!633605 (select (store (arr!47310 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442601 () Bool)

(declare-fun res!974794 () Bool)

(assert (=> b!1442601 (=> (not res!974794) (not e!813044))))

(declare-datatypes ((List!33811 0))(
  ( (Nil!33808) (Cons!33807 (h!35157 (_ BitVec 64)) (t!48505 List!33811)) )
))
(declare-fun arrayNoDuplicates!0 (array!98044 (_ BitVec 32) List!33811) Bool)

(assert (=> b!1442601 (= res!974794 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33808))))

(declare-fun b!1442602 () Bool)

(assert (=> b!1442602 (= e!813044 e!813045)))

(declare-fun res!974796 () Bool)

(assert (=> b!1442602 (=> (not res!974796) (not e!813045))))

(assert (=> b!1442602 (= res!974796 (= (select (store (arr!47310 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442602 (= lt!633609 (array!98045 (store (arr!47310 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47860 a!2862)))))

(declare-fun b!1442603 () Bool)

(declare-fun res!974805 () Bool)

(assert (=> b!1442603 (=> (not res!974805) (not e!813044))))

(assert (=> b!1442603 (= res!974805 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47860 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47860 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47860 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442604 () Bool)

(assert (=> b!1442604 (= e!813041 (or (= (select (arr!47310 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47310 a!2862) intermediateBeforeIndex!19) (select (arr!47310 a!2862) j!93))))))

(declare-fun b!1442605 () Bool)

(declare-fun res!974797 () Bool)

(assert (=> b!1442605 (=> (not res!974797) (not e!813047))))

(assert (=> b!1442605 (= res!974797 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47310 a!2862) j!93) a!2862 mask!2687) lt!633606))))

(declare-fun b!1442606 () Bool)

(declare-fun res!974801 () Bool)

(assert (=> b!1442606 (=> (not res!974801) (not e!813043))))

(assert (=> b!1442606 (= res!974801 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442607 () Bool)

(declare-fun res!974798 () Bool)

(assert (=> b!1442607 (=> (not res!974798) (not e!813044))))

(assert (=> b!1442607 (= res!974798 (validKeyInArray!0 (select (arr!47310 a!2862) i!1006)))))

(assert (= (and start!124596 res!974804) b!1442592))

(assert (= (and b!1442592 res!974799) b!1442607))

(assert (= (and b!1442607 res!974798) b!1442595))

(assert (= (and b!1442595 res!974800) b!1442593))

(assert (= (and b!1442593 res!974806) b!1442601))

(assert (= (and b!1442601 res!974794) b!1442603))

(assert (= (and b!1442603 res!974805) b!1442602))

(assert (= (and b!1442602 res!974796) b!1442591))

(assert (= (and b!1442591 res!974793) b!1442605))

(assert (= (and b!1442605 res!974797) b!1442600))

(assert (= (and b!1442600 res!974792) b!1442597))

(assert (= (and b!1442597 c!133410) b!1442598))

(assert (= (and b!1442597 (not c!133410)) b!1442594))

(assert (= (and b!1442597 res!974802) b!1442606))

(assert (= (and b!1442606 res!974801) b!1442596))

(assert (= (and b!1442596 res!974803) b!1442599))

(assert (= (and b!1442599 res!974795) b!1442604))

(declare-fun m!1331729 () Bool)

(assert (=> b!1442591 m!1331729))

(assert (=> b!1442591 m!1331729))

(declare-fun m!1331731 () Bool)

(assert (=> b!1442591 m!1331731))

(assert (=> b!1442591 m!1331731))

(assert (=> b!1442591 m!1331729))

(declare-fun m!1331733 () Bool)

(assert (=> b!1442591 m!1331733))

(declare-fun m!1331735 () Bool)

(assert (=> b!1442594 m!1331735))

(declare-fun m!1331737 () Bool)

(assert (=> b!1442594 m!1331737))

(declare-fun m!1331739 () Bool)

(assert (=> b!1442596 m!1331739))

(declare-fun m!1331741 () Bool)

(assert (=> b!1442596 m!1331741))

(declare-fun m!1331743 () Bool)

(assert (=> b!1442604 m!1331743))

(assert (=> b!1442604 m!1331729))

(assert (=> b!1442595 m!1331729))

(assert (=> b!1442595 m!1331729))

(declare-fun m!1331745 () Bool)

(assert (=> b!1442595 m!1331745))

(declare-fun m!1331747 () Bool)

(assert (=> b!1442607 m!1331747))

(assert (=> b!1442607 m!1331747))

(declare-fun m!1331749 () Bool)

(assert (=> b!1442607 m!1331749))

(declare-fun m!1331751 () Bool)

(assert (=> b!1442602 m!1331751))

(declare-fun m!1331753 () Bool)

(assert (=> b!1442602 m!1331753))

(declare-fun m!1331755 () Bool)

(assert (=> b!1442601 m!1331755))

(declare-fun m!1331757 () Bool)

(assert (=> start!124596 m!1331757))

(declare-fun m!1331759 () Bool)

(assert (=> start!124596 m!1331759))

(declare-fun m!1331761 () Bool)

(assert (=> b!1442600 m!1331761))

(assert (=> b!1442600 m!1331761))

(declare-fun m!1331763 () Bool)

(assert (=> b!1442600 m!1331763))

(assert (=> b!1442600 m!1331751))

(declare-fun m!1331765 () Bool)

(assert (=> b!1442600 m!1331765))

(declare-fun m!1331767 () Bool)

(assert (=> b!1442593 m!1331767))

(assert (=> b!1442605 m!1331729))

(assert (=> b!1442605 m!1331729))

(declare-fun m!1331769 () Bool)

(assert (=> b!1442605 m!1331769))

(declare-fun m!1331771 () Bool)

(assert (=> b!1442598 m!1331771))

(assert (=> b!1442599 m!1331729))

(assert (=> b!1442599 m!1331729))

(declare-fun m!1331773 () Bool)

(assert (=> b!1442599 m!1331773))

(check-sat (not b!1442598) (not b!1442605) (not b!1442599) (not b!1442607) (not b!1442591) (not b!1442601) (not b!1442600) (not b!1442596) (not start!124596) (not b!1442594) (not b!1442595) (not b!1442593))
(check-sat)
