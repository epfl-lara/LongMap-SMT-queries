; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125598 () Bool)

(assert start!125598)

(declare-fun b!1465741 () Bool)

(declare-fun res!993791 () Bool)

(declare-fun e!823858 () Bool)

(assert (=> b!1465741 (=> (not res!993791) (not e!823858))))

(declare-datatypes ((array!98884 0))(
  ( (array!98885 (arr!47725 (Array (_ BitVec 32) (_ BitVec 64))) (size!48276 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98884)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11874 0))(
  ( (MissingZero!11874 (index!49888 (_ BitVec 32))) (Found!11874 (index!49889 (_ BitVec 32))) (Intermediate!11874 (undefined!12686 Bool) (index!49890 (_ BitVec 32)) (x!131660 (_ BitVec 32))) (Undefined!11874) (MissingVacant!11874 (index!49891 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98884 (_ BitVec 32)) SeekEntryResult!11874)

(assert (=> b!1465741 (= res!993791 (= (seekEntryOrOpen!0 (select (arr!47725 a!2862) j!93) a!2862 mask!2687) (Found!11874 j!93)))))

(declare-fun b!1465742 () Bool)

(declare-fun e!823856 () Bool)

(declare-fun e!823859 () Bool)

(assert (=> b!1465742 (= e!823856 (not e!823859))))

(declare-fun res!993802 () Bool)

(assert (=> b!1465742 (=> res!993802 e!823859)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465742 (= res!993802 (or (and (= (select (arr!47725 a!2862) index!646) (select (store (arr!47725 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47725 a!2862) index!646) (select (arr!47725 a!2862) j!93))) (= (select (arr!47725 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465742 e!823858))

(declare-fun res!993795 () Bool)

(assert (=> b!1465742 (=> (not res!993795) (not e!823858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98884 (_ BitVec 32)) Bool)

(assert (=> b!1465742 (= res!993795 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49277 0))(
  ( (Unit!49278) )
))
(declare-fun lt!641593 () Unit!49277)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49277)

(assert (=> b!1465742 (= lt!641593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!641597 () SeekEntryResult!11874)

(declare-fun e!823863 () Bool)

(declare-fun lt!641596 () (_ BitVec 64))

(declare-fun b!1465743 () Bool)

(declare-fun lt!641595 () array!98884)

(declare-fun lt!641594 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98884 (_ BitVec 32)) SeekEntryResult!11874)

(assert (=> b!1465743 (= e!823863 (not (= lt!641597 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641594 lt!641596 lt!641595 mask!2687))))))

(declare-fun b!1465744 () Bool)

(declare-fun e!823862 () Bool)

(assert (=> b!1465744 (= e!823862 e!823856)))

(declare-fun res!993793 () Bool)

(assert (=> b!1465744 (=> (not res!993793) (not e!823856))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465744 (= res!993793 (= lt!641597 (Intermediate!11874 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465744 (= lt!641597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641596 mask!2687) lt!641596 lt!641595 mask!2687))))

(assert (=> b!1465744 (= lt!641596 (select (store (arr!47725 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465745 () Bool)

(declare-fun res!993790 () Bool)

(assert (=> b!1465745 (=> (not res!993790) (not e!823856))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465745 (= res!993790 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465746 () Bool)

(declare-fun e!823855 () Bool)

(declare-fun e!823860 () Bool)

(assert (=> b!1465746 (= e!823855 e!823860)))

(declare-fun res!993801 () Bool)

(assert (=> b!1465746 (=> (not res!993801) (not e!823860))))

(assert (=> b!1465746 (= res!993801 (= (select (store (arr!47725 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465746 (= lt!641595 (array!98885 (store (arr!47725 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48276 a!2862)))))

(declare-fun e!823861 () Bool)

(declare-fun b!1465747 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98884 (_ BitVec 32)) SeekEntryResult!11874)

(assert (=> b!1465747 (= e!823861 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641596 lt!641595 mask!2687) (seekEntryOrOpen!0 lt!641596 lt!641595 mask!2687)))))

(declare-fun b!1465748 () Bool)

(declare-fun res!993794 () Bool)

(declare-fun e!823854 () Bool)

(assert (=> b!1465748 (=> res!993794 e!823854)))

(declare-fun lt!641599 () SeekEntryResult!11874)

(assert (=> b!1465748 (= res!993794 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641594 (select (arr!47725 a!2862) j!93) a!2862 mask!2687) lt!641599)))))

(declare-fun b!1465750 () Bool)

(declare-fun res!993797 () Bool)

(assert (=> b!1465750 (=> (not res!993797) (not e!823855))))

(assert (=> b!1465750 (= res!993797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1465751 () Bool)

(assert (=> b!1465751 (= e!823858 (or (= (select (arr!47725 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47725 a!2862) intermediateBeforeIndex!19) (select (arr!47725 a!2862) j!93))))))

(declare-fun b!1465752 () Bool)

(declare-fun res!993800 () Bool)

(assert (=> b!1465752 (=> (not res!993800) (not e!823862))))

(assert (=> b!1465752 (= res!993800 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47725 a!2862) j!93) a!2862 mask!2687) lt!641599))))

(declare-fun b!1465753 () Bool)

(assert (=> b!1465753 (= e!823861 (= lt!641597 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641596 lt!641595 mask!2687)))))

(declare-fun b!1465754 () Bool)

(declare-fun res!993796 () Bool)

(assert (=> b!1465754 (=> (not res!993796) (not e!823856))))

(assert (=> b!1465754 (= res!993796 e!823861)))

(declare-fun c!135499 () Bool)

(assert (=> b!1465754 (= c!135499 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465755 () Bool)

(assert (=> b!1465755 (= e!823860 e!823862)))

(declare-fun res!993789 () Bool)

(assert (=> b!1465755 (=> (not res!993789) (not e!823862))))

(assert (=> b!1465755 (= res!993789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47725 a!2862) j!93) mask!2687) (select (arr!47725 a!2862) j!93) a!2862 mask!2687) lt!641599))))

(assert (=> b!1465755 (= lt!641599 (Intermediate!11874 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465756 () Bool)

(assert (=> b!1465756 (= e!823854 true)))

(declare-fun lt!641598 () Bool)

(assert (=> b!1465756 (= lt!641598 e!823863)))

(declare-fun c!135498 () Bool)

(assert (=> b!1465756 (= c!135498 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465757 () Bool)

(declare-fun res!993798 () Bool)

(assert (=> b!1465757 (=> (not res!993798) (not e!823855))))

(declare-datatypes ((List!34213 0))(
  ( (Nil!34210) (Cons!34209 (h!35573 (_ BitVec 64)) (t!48899 List!34213)) )
))
(declare-fun arrayNoDuplicates!0 (array!98884 (_ BitVec 32) List!34213) Bool)

(assert (=> b!1465757 (= res!993798 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34210))))

(declare-fun b!1465758 () Bool)

(declare-fun res!993803 () Bool)

(assert (=> b!1465758 (=> (not res!993803) (not e!823855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465758 (= res!993803 (validKeyInArray!0 (select (arr!47725 a!2862) j!93)))))

(declare-fun b!1465759 () Bool)

(declare-fun res!993786 () Bool)

(assert (=> b!1465759 (=> (not res!993786) (not e!823855))))

(assert (=> b!1465759 (= res!993786 (validKeyInArray!0 (select (arr!47725 a!2862) i!1006)))))

(declare-fun b!1465760 () Bool)

(declare-fun res!993788 () Bool)

(assert (=> b!1465760 (=> (not res!993788) (not e!823855))))

(assert (=> b!1465760 (= res!993788 (and (= (size!48276 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48276 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48276 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465761 () Bool)

(assert (=> b!1465761 (= e!823859 e!823854)))

(declare-fun res!993787 () Bool)

(assert (=> b!1465761 (=> res!993787 e!823854)))

(assert (=> b!1465761 (= res!993787 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641594 #b00000000000000000000000000000000) (bvsge lt!641594 (size!48276 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465761 (= lt!641594 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1465762 () Bool)

(assert (=> b!1465762 (= e!823863 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641594 intermediateAfterIndex!19 lt!641596 lt!641595 mask!2687) (seekEntryOrOpen!0 lt!641596 lt!641595 mask!2687))))))

(declare-fun res!993799 () Bool)

(assert (=> start!125598 (=> (not res!993799) (not e!823855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125598 (= res!993799 (validMask!0 mask!2687))))

(assert (=> start!125598 e!823855))

(assert (=> start!125598 true))

(declare-fun array_inv!37006 (array!98884) Bool)

(assert (=> start!125598 (array_inv!37006 a!2862)))

(declare-fun b!1465749 () Bool)

(declare-fun res!993792 () Bool)

(assert (=> b!1465749 (=> (not res!993792) (not e!823855))))

(assert (=> b!1465749 (= res!993792 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48276 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48276 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48276 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125598 res!993799) b!1465760))

(assert (= (and b!1465760 res!993788) b!1465759))

(assert (= (and b!1465759 res!993786) b!1465758))

(assert (= (and b!1465758 res!993803) b!1465750))

(assert (= (and b!1465750 res!993797) b!1465757))

(assert (= (and b!1465757 res!993798) b!1465749))

(assert (= (and b!1465749 res!993792) b!1465746))

(assert (= (and b!1465746 res!993801) b!1465755))

(assert (= (and b!1465755 res!993789) b!1465752))

(assert (= (and b!1465752 res!993800) b!1465744))

(assert (= (and b!1465744 res!993793) b!1465754))

(assert (= (and b!1465754 c!135499) b!1465753))

(assert (= (and b!1465754 (not c!135499)) b!1465747))

(assert (= (and b!1465754 res!993796) b!1465745))

(assert (= (and b!1465745 res!993790) b!1465742))

(assert (= (and b!1465742 res!993795) b!1465741))

(assert (= (and b!1465741 res!993791) b!1465751))

(assert (= (and b!1465742 (not res!993802)) b!1465761))

(assert (= (and b!1465761 (not res!993787)) b!1465748))

(assert (= (and b!1465748 (not res!993794)) b!1465756))

(assert (= (and b!1465756 c!135498) b!1465743))

(assert (= (and b!1465756 (not c!135498)) b!1465762))

(declare-fun m!1352983 () Bool)

(assert (=> b!1465744 m!1352983))

(assert (=> b!1465744 m!1352983))

(declare-fun m!1352985 () Bool)

(assert (=> b!1465744 m!1352985))

(declare-fun m!1352987 () Bool)

(assert (=> b!1465744 m!1352987))

(declare-fun m!1352989 () Bool)

(assert (=> b!1465744 m!1352989))

(declare-fun m!1352991 () Bool)

(assert (=> b!1465741 m!1352991))

(assert (=> b!1465741 m!1352991))

(declare-fun m!1352993 () Bool)

(assert (=> b!1465741 m!1352993))

(declare-fun m!1352995 () Bool)

(assert (=> start!125598 m!1352995))

(declare-fun m!1352997 () Bool)

(assert (=> start!125598 m!1352997))

(assert (=> b!1465746 m!1352987))

(declare-fun m!1352999 () Bool)

(assert (=> b!1465746 m!1352999))

(assert (=> b!1465758 m!1352991))

(assert (=> b!1465758 m!1352991))

(declare-fun m!1353001 () Bool)

(assert (=> b!1465758 m!1353001))

(assert (=> b!1465752 m!1352991))

(assert (=> b!1465752 m!1352991))

(declare-fun m!1353003 () Bool)

(assert (=> b!1465752 m!1353003))

(assert (=> b!1465755 m!1352991))

(assert (=> b!1465755 m!1352991))

(declare-fun m!1353005 () Bool)

(assert (=> b!1465755 m!1353005))

(assert (=> b!1465755 m!1353005))

(assert (=> b!1465755 m!1352991))

(declare-fun m!1353007 () Bool)

(assert (=> b!1465755 m!1353007))

(declare-fun m!1353009 () Bool)

(assert (=> b!1465759 m!1353009))

(assert (=> b!1465759 m!1353009))

(declare-fun m!1353011 () Bool)

(assert (=> b!1465759 m!1353011))

(declare-fun m!1353013 () Bool)

(assert (=> b!1465761 m!1353013))

(declare-fun m!1353015 () Bool)

(assert (=> b!1465747 m!1353015))

(declare-fun m!1353017 () Bool)

(assert (=> b!1465747 m!1353017))

(assert (=> b!1465748 m!1352991))

(assert (=> b!1465748 m!1352991))

(declare-fun m!1353019 () Bool)

(assert (=> b!1465748 m!1353019))

(declare-fun m!1353021 () Bool)

(assert (=> b!1465753 m!1353021))

(declare-fun m!1353023 () Bool)

(assert (=> b!1465757 m!1353023))

(declare-fun m!1353025 () Bool)

(assert (=> b!1465750 m!1353025))

(declare-fun m!1353027 () Bool)

(assert (=> b!1465743 m!1353027))

(declare-fun m!1353029 () Bool)

(assert (=> b!1465742 m!1353029))

(assert (=> b!1465742 m!1352987))

(declare-fun m!1353031 () Bool)

(assert (=> b!1465742 m!1353031))

(declare-fun m!1353033 () Bool)

(assert (=> b!1465742 m!1353033))

(declare-fun m!1353035 () Bool)

(assert (=> b!1465742 m!1353035))

(assert (=> b!1465742 m!1352991))

(declare-fun m!1353037 () Bool)

(assert (=> b!1465762 m!1353037))

(assert (=> b!1465762 m!1353017))

(declare-fun m!1353039 () Bool)

(assert (=> b!1465751 m!1353039))

(assert (=> b!1465751 m!1352991))

(check-sat (not b!1465747) (not start!125598) (not b!1465757) (not b!1465741) (not b!1465755) (not b!1465744) (not b!1465750) (not b!1465758) (not b!1465743) (not b!1465753) (not b!1465748) (not b!1465752) (not b!1465762) (not b!1465759) (not b!1465761) (not b!1465742))
(check-sat)
