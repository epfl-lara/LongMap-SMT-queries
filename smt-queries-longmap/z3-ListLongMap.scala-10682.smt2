; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125200 () Bool)

(assert start!125200)

(declare-fun b!1460868 () Bool)

(declare-fun res!990674 () Bool)

(declare-fun e!821330 () Bool)

(assert (=> b!1460868 (=> res!990674 e!821330)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98626 0))(
  ( (array!98627 (arr!47602 (Array (_ BitVec 32) (_ BitVec 64))) (size!48154 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98626)

(declare-datatypes ((SeekEntryResult!11879 0))(
  ( (MissingZero!11879 (index!49908 (_ BitVec 32))) (Found!11879 (index!49909 (_ BitVec 32))) (Intermediate!11879 (undefined!12691 Bool) (index!49910 (_ BitVec 32)) (x!131507 (_ BitVec 32))) (Undefined!11879) (MissingVacant!11879 (index!49911 (_ BitVec 32))) )
))
(declare-fun lt!639780 () SeekEntryResult!11879)

(declare-fun lt!639781 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98626 (_ BitVec 32)) SeekEntryResult!11879)

(assert (=> b!1460868 (= res!990674 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639781 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!639780)))))

(declare-fun b!1460869 () Bool)

(declare-fun e!821334 () Bool)

(declare-fun e!821329 () Bool)

(assert (=> b!1460869 (= e!821334 e!821329)))

(declare-fun res!990669 () Bool)

(assert (=> b!1460869 (=> (not res!990669) (not e!821329))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460869 (= res!990669 (= (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639779 () array!98626)

(assert (=> b!1460869 (= lt!639779 (array!98627 (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48154 a!2862)))))

(declare-fun b!1460870 () Bool)

(declare-fun lt!639783 () (_ BitVec 64))

(declare-fun lt!639777 () SeekEntryResult!11879)

(declare-fun e!821326 () Bool)

(assert (=> b!1460870 (= e!821326 (not (= lt!639777 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639781 lt!639783 lt!639779 mask!2687))))))

(declare-fun b!1460871 () Bool)

(declare-fun res!990680 () Bool)

(declare-fun e!821328 () Bool)

(assert (=> b!1460871 (=> (not res!990680) (not e!821328))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460871 (= res!990680 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!639780))))

(declare-fun e!821325 () Bool)

(declare-fun b!1460872 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98626 (_ BitVec 32)) SeekEntryResult!11879)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98626 (_ BitVec 32)) SeekEntryResult!11879)

(assert (=> b!1460872 (= e!821325 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639783 lt!639779 mask!2687) (seekEntryOrOpen!0 lt!639783 lt!639779 mask!2687)))))

(declare-fun b!1460873 () Bool)

(declare-fun e!821332 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1460873 (= e!821332 (or (= (select (arr!47602 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47602 a!2862) intermediateBeforeIndex!19) (select (arr!47602 a!2862) j!93))))))

(declare-fun res!990684 () Bool)

(assert (=> start!125200 (=> (not res!990684) (not e!821334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125200 (= res!990684 (validMask!0 mask!2687))))

(assert (=> start!125200 e!821334))

(assert (=> start!125200 true))

(declare-fun array_inv!36835 (array!98626) Bool)

(assert (=> start!125200 (array_inv!36835 a!2862)))

(declare-fun b!1460874 () Bool)

(declare-fun res!990678 () Bool)

(assert (=> b!1460874 (=> (not res!990678) (not e!821334))))

(assert (=> b!1460874 (= res!990678 (and (= (size!48154 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48154 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48154 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460875 () Bool)

(declare-fun res!990683 () Bool)

(assert (=> b!1460875 (=> (not res!990683) (not e!821334))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460875 (= res!990683 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48154 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48154 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48154 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460876 () Bool)

(declare-fun e!821333 () Bool)

(assert (=> b!1460876 (= e!821333 e!821330)))

(declare-fun res!990673 () Bool)

(assert (=> b!1460876 (=> res!990673 e!821330)))

(assert (=> b!1460876 (= res!990673 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639781 #b00000000000000000000000000000000) (bvsge lt!639781 (size!48154 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460876 (= lt!639781 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1460877 () Bool)

(declare-fun res!990672 () Bool)

(assert (=> b!1460877 (=> (not res!990672) (not e!821332))))

(assert (=> b!1460877 (= res!990672 (= (seekEntryOrOpen!0 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) (Found!11879 j!93)))))

(declare-fun b!1460878 () Bool)

(assert (=> b!1460878 (= e!821329 e!821328)))

(declare-fun res!990671 () Bool)

(assert (=> b!1460878 (=> (not res!990671) (not e!821328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460878 (= res!990671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47602 a!2862) j!93) mask!2687) (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!639780))))

(assert (=> b!1460878 (= lt!639780 (Intermediate!11879 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460879 () Bool)

(declare-fun res!990681 () Bool)

(assert (=> b!1460879 (=> (not res!990681) (not e!821334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98626 (_ BitVec 32)) Bool)

(assert (=> b!1460879 (= res!990681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460880 () Bool)

(assert (=> b!1460880 (= e!821330 true)))

(declare-fun lt!639778 () Bool)

(assert (=> b!1460880 (= lt!639778 e!821326)))

(declare-fun c!134614 () Bool)

(assert (=> b!1460880 (= c!134614 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460881 () Bool)

(declare-fun res!990685 () Bool)

(declare-fun e!821331 () Bool)

(assert (=> b!1460881 (=> (not res!990685) (not e!821331))))

(assert (=> b!1460881 (= res!990685 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460882 () Bool)

(declare-fun res!990676 () Bool)

(assert (=> b!1460882 (=> (not res!990676) (not e!821334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460882 (= res!990676 (validKeyInArray!0 (select (arr!47602 a!2862) i!1006)))))

(declare-fun b!1460883 () Bool)

(assert (=> b!1460883 (= e!821325 (= lt!639777 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639783 lt!639779 mask!2687)))))

(declare-fun b!1460884 () Bool)

(declare-fun res!990679 () Bool)

(assert (=> b!1460884 (=> (not res!990679) (not e!821334))))

(declare-datatypes ((List!34181 0))(
  ( (Nil!34178) (Cons!34177 (h!35527 (_ BitVec 64)) (t!48867 List!34181)) )
))
(declare-fun arrayNoDuplicates!0 (array!98626 (_ BitVec 32) List!34181) Bool)

(assert (=> b!1460884 (= res!990679 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34178))))

(declare-fun b!1460885 () Bool)

(declare-fun res!990668 () Bool)

(assert (=> b!1460885 (=> (not res!990668) (not e!821331))))

(assert (=> b!1460885 (= res!990668 e!821325)))

(declare-fun c!134613 () Bool)

(assert (=> b!1460885 (= c!134613 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460886 () Bool)

(assert (=> b!1460886 (= e!821326 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639781 intermediateAfterIndex!19 lt!639783 lt!639779 mask!2687) (seekEntryOrOpen!0 lt!639783 lt!639779 mask!2687))))))

(declare-fun b!1460887 () Bool)

(assert (=> b!1460887 (= e!821331 (not e!821333))))

(declare-fun res!990675 () Bool)

(assert (=> b!1460887 (=> res!990675 e!821333)))

(assert (=> b!1460887 (= res!990675 (or (and (= (select (arr!47602 a!2862) index!646) (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47602 a!2862) index!646) (select (arr!47602 a!2862) j!93))) (= (select (arr!47602 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1460887 e!821332))

(declare-fun res!990677 () Bool)

(assert (=> b!1460887 (=> (not res!990677) (not e!821332))))

(assert (=> b!1460887 (= res!990677 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49095 0))(
  ( (Unit!49096) )
))
(declare-fun lt!639782 () Unit!49095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49095)

(assert (=> b!1460887 (= lt!639782 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460888 () Bool)

(assert (=> b!1460888 (= e!821328 e!821331)))

(declare-fun res!990670 () Bool)

(assert (=> b!1460888 (=> (not res!990670) (not e!821331))))

(assert (=> b!1460888 (= res!990670 (= lt!639777 (Intermediate!11879 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460888 (= lt!639777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639783 mask!2687) lt!639783 lt!639779 mask!2687))))

(assert (=> b!1460888 (= lt!639783 (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460889 () Bool)

(declare-fun res!990682 () Bool)

(assert (=> b!1460889 (=> (not res!990682) (not e!821334))))

(assert (=> b!1460889 (= res!990682 (validKeyInArray!0 (select (arr!47602 a!2862) j!93)))))

(assert (= (and start!125200 res!990684) b!1460874))

(assert (= (and b!1460874 res!990678) b!1460882))

(assert (= (and b!1460882 res!990676) b!1460889))

(assert (= (and b!1460889 res!990682) b!1460879))

(assert (= (and b!1460879 res!990681) b!1460884))

(assert (= (and b!1460884 res!990679) b!1460875))

(assert (= (and b!1460875 res!990683) b!1460869))

(assert (= (and b!1460869 res!990669) b!1460878))

(assert (= (and b!1460878 res!990671) b!1460871))

(assert (= (and b!1460871 res!990680) b!1460888))

(assert (= (and b!1460888 res!990670) b!1460885))

(assert (= (and b!1460885 c!134613) b!1460883))

(assert (= (and b!1460885 (not c!134613)) b!1460872))

(assert (= (and b!1460885 res!990668) b!1460881))

(assert (= (and b!1460881 res!990685) b!1460887))

(assert (= (and b!1460887 res!990677) b!1460877))

(assert (= (and b!1460877 res!990672) b!1460873))

(assert (= (and b!1460887 (not res!990675)) b!1460876))

(assert (= (and b!1460876 (not res!990673)) b!1460868))

(assert (= (and b!1460868 (not res!990674)) b!1460880))

(assert (= (and b!1460880 c!134614) b!1460870))

(assert (= (and b!1460880 (not c!134614)) b!1460886))

(declare-fun m!1348011 () Bool)

(assert (=> b!1460877 m!1348011))

(assert (=> b!1460877 m!1348011))

(declare-fun m!1348013 () Bool)

(assert (=> b!1460877 m!1348013))

(assert (=> b!1460871 m!1348011))

(assert (=> b!1460871 m!1348011))

(declare-fun m!1348015 () Bool)

(assert (=> b!1460871 m!1348015))

(declare-fun m!1348017 () Bool)

(assert (=> b!1460872 m!1348017))

(declare-fun m!1348019 () Bool)

(assert (=> b!1460872 m!1348019))

(assert (=> b!1460868 m!1348011))

(assert (=> b!1460868 m!1348011))

(declare-fun m!1348021 () Bool)

(assert (=> b!1460868 m!1348021))

(declare-fun m!1348023 () Bool)

(assert (=> b!1460883 m!1348023))

(declare-fun m!1348025 () Bool)

(assert (=> b!1460884 m!1348025))

(declare-fun m!1348027 () Bool)

(assert (=> b!1460870 m!1348027))

(declare-fun m!1348029 () Bool)

(assert (=> b!1460869 m!1348029))

(declare-fun m!1348031 () Bool)

(assert (=> b!1460869 m!1348031))

(declare-fun m!1348033 () Bool)

(assert (=> b!1460879 m!1348033))

(declare-fun m!1348035 () Bool)

(assert (=> b!1460876 m!1348035))

(assert (=> b!1460889 m!1348011))

(assert (=> b!1460889 m!1348011))

(declare-fun m!1348037 () Bool)

(assert (=> b!1460889 m!1348037))

(assert (=> b!1460878 m!1348011))

(assert (=> b!1460878 m!1348011))

(declare-fun m!1348039 () Bool)

(assert (=> b!1460878 m!1348039))

(assert (=> b!1460878 m!1348039))

(assert (=> b!1460878 m!1348011))

(declare-fun m!1348041 () Bool)

(assert (=> b!1460878 m!1348041))

(declare-fun m!1348043 () Bool)

(assert (=> b!1460886 m!1348043))

(assert (=> b!1460886 m!1348019))

(declare-fun m!1348045 () Bool)

(assert (=> b!1460882 m!1348045))

(assert (=> b!1460882 m!1348045))

(declare-fun m!1348047 () Bool)

(assert (=> b!1460882 m!1348047))

(declare-fun m!1348049 () Bool)

(assert (=> b!1460873 m!1348049))

(assert (=> b!1460873 m!1348011))

(declare-fun m!1348051 () Bool)

(assert (=> b!1460888 m!1348051))

(assert (=> b!1460888 m!1348051))

(declare-fun m!1348053 () Bool)

(assert (=> b!1460888 m!1348053))

(assert (=> b!1460888 m!1348029))

(declare-fun m!1348055 () Bool)

(assert (=> b!1460888 m!1348055))

(declare-fun m!1348057 () Bool)

(assert (=> b!1460887 m!1348057))

(assert (=> b!1460887 m!1348029))

(declare-fun m!1348059 () Bool)

(assert (=> b!1460887 m!1348059))

(declare-fun m!1348061 () Bool)

(assert (=> b!1460887 m!1348061))

(declare-fun m!1348063 () Bool)

(assert (=> b!1460887 m!1348063))

(assert (=> b!1460887 m!1348011))

(declare-fun m!1348065 () Bool)

(assert (=> start!125200 m!1348065))

(declare-fun m!1348067 () Bool)

(assert (=> start!125200 m!1348067))

(check-sat (not start!125200) (not b!1460882) (not b!1460876) (not b!1460879) (not b!1460868) (not b!1460889) (not b!1460884) (not b!1460871) (not b!1460872) (not b!1460887) (not b!1460886) (not b!1460888) (not b!1460877) (not b!1460883) (not b!1460878) (not b!1460870))
(check-sat)
