; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125306 () Bool)

(assert start!125306)

(declare-fun b!1463571 () Bool)

(declare-fun res!992805 () Bool)

(declare-fun e!822586 () Bool)

(assert (=> b!1463571 (=> (not res!992805) (not e!822586))))

(declare-datatypes ((array!98754 0))(
  ( (array!98755 (arr!47665 (Array (_ BitVec 32) (_ BitVec 64))) (size!48215 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98754)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463571 (= res!992805 (validKeyInArray!0 (select (arr!47665 a!2862) j!93)))))

(declare-fun b!1463572 () Bool)

(declare-fun res!992810 () Bool)

(declare-fun e!822589 () Bool)

(assert (=> b!1463572 (=> res!992810 e!822589)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11917 0))(
  ( (MissingZero!11917 (index!50060 (_ BitVec 32))) (Found!11917 (index!50061 (_ BitVec 32))) (Intermediate!11917 (undefined!12729 Bool) (index!50062 (_ BitVec 32)) (x!131646 (_ BitVec 32))) (Undefined!11917) (MissingVacant!11917 (index!50063 (_ BitVec 32))) )
))
(declare-fun lt!640814 () SeekEntryResult!11917)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640813 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98754 (_ BitVec 32)) SeekEntryResult!11917)

(assert (=> b!1463572 (= res!992810 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640813 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!640814)))))

(declare-fun res!992801 () Bool)

(assert (=> start!125306 (=> (not res!992801) (not e!822586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125306 (= res!992801 (validMask!0 mask!2687))))

(assert (=> start!125306 e!822586))

(assert (=> start!125306 true))

(declare-fun array_inv!36693 (array!98754) Bool)

(assert (=> start!125306 (array_inv!36693 a!2862)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!822581 () Bool)

(declare-fun b!1463573 () Bool)

(assert (=> b!1463573 (= e!822581 (or (= (select (arr!47665 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47665 a!2862) intermediateBeforeIndex!19) (select (arr!47665 a!2862) j!93))))))

(declare-fun b!1463574 () Bool)

(declare-fun e!822588 () Bool)

(declare-fun e!822583 () Bool)

(assert (=> b!1463574 (= e!822588 e!822583)))

(declare-fun res!992806 () Bool)

(assert (=> b!1463574 (=> (not res!992806) (not e!822583))))

(declare-fun lt!640812 () SeekEntryResult!11917)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463574 (= res!992806 (= lt!640812 (Intermediate!11917 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640809 () array!98754)

(declare-fun lt!640815 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463574 (= lt!640812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640815 mask!2687) lt!640815 lt!640809 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463574 (= lt!640815 (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463575 () Bool)

(declare-fun res!992811 () Bool)

(assert (=> b!1463575 (=> (not res!992811) (not e!822586))))

(assert (=> b!1463575 (= res!992811 (validKeyInArray!0 (select (arr!47665 a!2862) i!1006)))))

(declare-fun b!1463576 () Bool)

(declare-fun e!822585 () Bool)

(assert (=> b!1463576 (= e!822585 e!822588)))

(declare-fun res!992813 () Bool)

(assert (=> b!1463576 (=> (not res!992813) (not e!822588))))

(assert (=> b!1463576 (= res!992813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47665 a!2862) j!93) mask!2687) (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!640814))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463576 (= lt!640814 (Intermediate!11917 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463577 () Bool)

(assert (=> b!1463577 (= e!822589 true)))

(declare-fun lt!640811 () Bool)

(declare-fun e!822584 () Bool)

(assert (=> b!1463577 (= lt!640811 e!822584)))

(declare-fun c!134898 () Bool)

(assert (=> b!1463577 (= c!134898 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463578 () Bool)

(declare-fun res!992812 () Bool)

(assert (=> b!1463578 (=> (not res!992812) (not e!822583))))

(declare-fun e!822582 () Bool)

(assert (=> b!1463578 (= res!992812 e!822582)))

(declare-fun c!134897 () Bool)

(assert (=> b!1463578 (= c!134897 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463579 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98754 (_ BitVec 32)) SeekEntryResult!11917)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98754 (_ BitVec 32)) SeekEntryResult!11917)

(assert (=> b!1463579 (= e!822584 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640813 intermediateAfterIndex!19 lt!640815 lt!640809 mask!2687) (seekEntryOrOpen!0 lt!640815 lt!640809 mask!2687))))))

(declare-fun b!1463580 () Bool)

(declare-fun res!992800 () Bool)

(assert (=> b!1463580 (=> (not res!992800) (not e!822586))))

(declare-datatypes ((List!34166 0))(
  ( (Nil!34163) (Cons!34162 (h!35512 (_ BitVec 64)) (t!48860 List!34166)) )
))
(declare-fun arrayNoDuplicates!0 (array!98754 (_ BitVec 32) List!34166) Bool)

(assert (=> b!1463580 (= res!992800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34163))))

(declare-fun b!1463581 () Bool)

(declare-fun res!992809 () Bool)

(assert (=> b!1463581 (=> (not res!992809) (not e!822586))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1463581 (= res!992809 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48215 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48215 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48215 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463582 () Bool)

(assert (=> b!1463582 (= e!822586 e!822585)))

(declare-fun res!992798 () Bool)

(assert (=> b!1463582 (=> (not res!992798) (not e!822585))))

(assert (=> b!1463582 (= res!992798 (= (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463582 (= lt!640809 (array!98755 (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48215 a!2862)))))

(declare-fun b!1463583 () Bool)

(assert (=> b!1463583 (= e!822582 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640815 lt!640809 mask!2687) (seekEntryOrOpen!0 lt!640815 lt!640809 mask!2687)))))

(declare-fun b!1463584 () Bool)

(declare-fun e!822587 () Bool)

(assert (=> b!1463584 (= e!822583 (not e!822587))))

(declare-fun res!992815 () Bool)

(assert (=> b!1463584 (=> res!992815 e!822587)))

(assert (=> b!1463584 (= res!992815 (or (and (= (select (arr!47665 a!2862) index!646) (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47665 a!2862) index!646) (select (arr!47665 a!2862) j!93))) (= (select (arr!47665 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463584 e!822581))

(declare-fun res!992807 () Bool)

(assert (=> b!1463584 (=> (not res!992807) (not e!822581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98754 (_ BitVec 32)) Bool)

(assert (=> b!1463584 (= res!992807 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49330 0))(
  ( (Unit!49331) )
))
(declare-fun lt!640810 () Unit!49330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49330)

(assert (=> b!1463584 (= lt!640810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463585 () Bool)

(declare-fun res!992808 () Bool)

(assert (=> b!1463585 (=> (not res!992808) (not e!822583))))

(assert (=> b!1463585 (= res!992808 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463586 () Bool)

(declare-fun res!992804 () Bool)

(assert (=> b!1463586 (=> (not res!992804) (not e!822586))))

(assert (=> b!1463586 (= res!992804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463587 () Bool)

(declare-fun res!992803 () Bool)

(assert (=> b!1463587 (=> (not res!992803) (not e!822588))))

(assert (=> b!1463587 (= res!992803 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!640814))))

(declare-fun b!1463588 () Bool)

(declare-fun res!992802 () Bool)

(assert (=> b!1463588 (=> (not res!992802) (not e!822581))))

(assert (=> b!1463588 (= res!992802 (= (seekEntryOrOpen!0 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) (Found!11917 j!93)))))

(declare-fun b!1463589 () Bool)

(assert (=> b!1463589 (= e!822582 (= lt!640812 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640815 lt!640809 mask!2687)))))

(declare-fun b!1463590 () Bool)

(assert (=> b!1463590 (= e!822584 (not (= lt!640812 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640813 lt!640815 lt!640809 mask!2687))))))

(declare-fun b!1463591 () Bool)

(assert (=> b!1463591 (= e!822587 e!822589)))

(declare-fun res!992799 () Bool)

(assert (=> b!1463591 (=> res!992799 e!822589)))

(assert (=> b!1463591 (= res!992799 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640813 #b00000000000000000000000000000000) (bvsge lt!640813 (size!48215 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463591 (= lt!640813 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463592 () Bool)

(declare-fun res!992814 () Bool)

(assert (=> b!1463592 (=> (not res!992814) (not e!822586))))

(assert (=> b!1463592 (= res!992814 (and (= (size!48215 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48215 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48215 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125306 res!992801) b!1463592))

(assert (= (and b!1463592 res!992814) b!1463575))

(assert (= (and b!1463575 res!992811) b!1463571))

(assert (= (and b!1463571 res!992805) b!1463586))

(assert (= (and b!1463586 res!992804) b!1463580))

(assert (= (and b!1463580 res!992800) b!1463581))

(assert (= (and b!1463581 res!992809) b!1463582))

(assert (= (and b!1463582 res!992798) b!1463576))

(assert (= (and b!1463576 res!992813) b!1463587))

(assert (= (and b!1463587 res!992803) b!1463574))

(assert (= (and b!1463574 res!992806) b!1463578))

(assert (= (and b!1463578 c!134897) b!1463589))

(assert (= (and b!1463578 (not c!134897)) b!1463583))

(assert (= (and b!1463578 res!992812) b!1463585))

(assert (= (and b!1463585 res!992808) b!1463584))

(assert (= (and b!1463584 res!992807) b!1463588))

(assert (= (and b!1463588 res!992802) b!1463573))

(assert (= (and b!1463584 (not res!992815)) b!1463591))

(assert (= (and b!1463591 (not res!992799)) b!1463572))

(assert (= (and b!1463572 (not res!992810)) b!1463577))

(assert (= (and b!1463577 c!134898) b!1463590))

(assert (= (and b!1463577 (not c!134898)) b!1463579))

(declare-fun m!1350891 () Bool)

(assert (=> b!1463591 m!1350891))

(declare-fun m!1350893 () Bool)

(assert (=> b!1463587 m!1350893))

(assert (=> b!1463587 m!1350893))

(declare-fun m!1350895 () Bool)

(assert (=> b!1463587 m!1350895))

(declare-fun m!1350897 () Bool)

(assert (=> b!1463586 m!1350897))

(declare-fun m!1350899 () Bool)

(assert (=> b!1463590 m!1350899))

(assert (=> b!1463572 m!1350893))

(assert (=> b!1463572 m!1350893))

(declare-fun m!1350901 () Bool)

(assert (=> b!1463572 m!1350901))

(declare-fun m!1350903 () Bool)

(assert (=> b!1463575 m!1350903))

(assert (=> b!1463575 m!1350903))

(declare-fun m!1350905 () Bool)

(assert (=> b!1463575 m!1350905))

(declare-fun m!1350907 () Bool)

(assert (=> b!1463589 m!1350907))

(declare-fun m!1350909 () Bool)

(assert (=> start!125306 m!1350909))

(declare-fun m!1350911 () Bool)

(assert (=> start!125306 m!1350911))

(declare-fun m!1350913 () Bool)

(assert (=> b!1463574 m!1350913))

(assert (=> b!1463574 m!1350913))

(declare-fun m!1350915 () Bool)

(assert (=> b!1463574 m!1350915))

(declare-fun m!1350917 () Bool)

(assert (=> b!1463574 m!1350917))

(declare-fun m!1350919 () Bool)

(assert (=> b!1463574 m!1350919))

(assert (=> b!1463588 m!1350893))

(assert (=> b!1463588 m!1350893))

(declare-fun m!1350921 () Bool)

(assert (=> b!1463588 m!1350921))

(declare-fun m!1350923 () Bool)

(assert (=> b!1463583 m!1350923))

(declare-fun m!1350925 () Bool)

(assert (=> b!1463583 m!1350925))

(declare-fun m!1350927 () Bool)

(assert (=> b!1463579 m!1350927))

(assert (=> b!1463579 m!1350925))

(assert (=> b!1463582 m!1350917))

(declare-fun m!1350929 () Bool)

(assert (=> b!1463582 m!1350929))

(declare-fun m!1350931 () Bool)

(assert (=> b!1463584 m!1350931))

(assert (=> b!1463584 m!1350917))

(declare-fun m!1350933 () Bool)

(assert (=> b!1463584 m!1350933))

(declare-fun m!1350935 () Bool)

(assert (=> b!1463584 m!1350935))

(declare-fun m!1350937 () Bool)

(assert (=> b!1463584 m!1350937))

(assert (=> b!1463584 m!1350893))

(assert (=> b!1463571 m!1350893))

(assert (=> b!1463571 m!1350893))

(declare-fun m!1350939 () Bool)

(assert (=> b!1463571 m!1350939))

(declare-fun m!1350941 () Bool)

(assert (=> b!1463573 m!1350941))

(assert (=> b!1463573 m!1350893))

(assert (=> b!1463576 m!1350893))

(assert (=> b!1463576 m!1350893))

(declare-fun m!1350943 () Bool)

(assert (=> b!1463576 m!1350943))

(assert (=> b!1463576 m!1350943))

(assert (=> b!1463576 m!1350893))

(declare-fun m!1350945 () Bool)

(assert (=> b!1463576 m!1350945))

(declare-fun m!1350947 () Bool)

(assert (=> b!1463580 m!1350947))

(push 1)

