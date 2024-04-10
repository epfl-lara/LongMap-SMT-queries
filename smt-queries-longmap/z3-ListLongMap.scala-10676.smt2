; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125196 () Bool)

(assert start!125196)

(declare-fun b!1460117 () Bool)

(declare-fun e!821047 () Bool)

(declare-fun e!821046 () Bool)

(assert (=> b!1460117 (= e!821047 e!821046)))

(declare-fun res!989939 () Bool)

(assert (=> b!1460117 (=> res!989939 e!821046)))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1460117 (= res!989939 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!11862 0))(
  ( (MissingZero!11862 (index!49840 (_ BitVec 32))) (Found!11862 (index!49841 (_ BitVec 32))) (Intermediate!11862 (undefined!12674 Bool) (index!49842 (_ BitVec 32)) (x!131447 (_ BitVec 32))) (Undefined!11862) (MissingVacant!11862 (index!49843 (_ BitVec 32))) )
))
(declare-fun lt!639721 () SeekEntryResult!11862)

(declare-fun lt!639718 () SeekEntryResult!11862)

(assert (=> b!1460117 (= lt!639721 lt!639718)))

(declare-fun lt!639719 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49220 0))(
  ( (Unit!49221) )
))
(declare-fun lt!639723 () Unit!49220)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98644 0))(
  ( (array!98645 (arr!47610 (Array (_ BitVec 32) (_ BitVec 64))) (size!48160 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98644)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49220)

(assert (=> b!1460117 (= lt!639723 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639719 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460118 () Bool)

(declare-fun res!989945 () Bool)

(declare-fun e!821042 () Bool)

(assert (=> b!1460118 (=> (not res!989945) (not e!821042))))

(declare-fun lt!639724 () SeekEntryResult!11862)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98644 (_ BitVec 32)) SeekEntryResult!11862)

(assert (=> b!1460118 (= res!989945 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47610 a!2862) j!93) a!2862 mask!2687) lt!639724))))

(declare-fun lt!639725 () array!98644)

(declare-fun e!821048 () Bool)

(declare-fun b!1460119 () Bool)

(declare-fun lt!639722 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98644 (_ BitVec 32)) SeekEntryResult!11862)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98644 (_ BitVec 32)) SeekEntryResult!11862)

(assert (=> b!1460119 (= e!821048 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639722 lt!639725 mask!2687) (seekEntryOrOpen!0 lt!639722 lt!639725 mask!2687)))))

(declare-fun b!1460120 () Bool)

(declare-fun res!989941 () Bool)

(declare-fun e!821041 () Bool)

(assert (=> b!1460120 (=> (not res!989941) (not e!821041))))

(assert (=> b!1460120 (= res!989941 (and (= (size!48160 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48160 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48160 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460121 () Bool)

(declare-fun lt!639720 () SeekEntryResult!11862)

(assert (=> b!1460121 (= e!821048 (= lt!639720 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639722 lt!639725 mask!2687)))))

(declare-fun b!1460122 () Bool)

(declare-fun e!821039 () Bool)

(assert (=> b!1460122 (= e!821041 e!821039)))

(declare-fun res!989942 () Bool)

(assert (=> b!1460122 (=> (not res!989942) (not e!821039))))

(assert (=> b!1460122 (= res!989942 (= (select (store (arr!47610 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460122 (= lt!639725 (array!98645 (store (arr!47610 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48160 a!2862)))))

(declare-fun res!989946 () Bool)

(assert (=> start!125196 (=> (not res!989946) (not e!821041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125196 (= res!989946 (validMask!0 mask!2687))))

(assert (=> start!125196 e!821041))

(assert (=> start!125196 true))

(declare-fun array_inv!36638 (array!98644) Bool)

(assert (=> start!125196 (array_inv!36638 a!2862)))

(declare-fun b!1460123 () Bool)

(declare-fun res!989940 () Bool)

(assert (=> b!1460123 (=> res!989940 e!821047)))

(assert (=> b!1460123 (= res!989940 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun e!821045 () Bool)

(declare-fun b!1460124 () Bool)

(assert (=> b!1460124 (= e!821045 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639719 intermediateAfterIndex!19 lt!639722 lt!639725 mask!2687) lt!639718)))))

(declare-fun b!1460125 () Bool)

(declare-fun res!989935 () Bool)

(assert (=> b!1460125 (=> res!989935 e!821047)))

(assert (=> b!1460125 (= res!989935 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639719 (select (arr!47610 a!2862) j!93) a!2862 mask!2687) lt!639724)))))

(declare-fun b!1460126 () Bool)

(declare-fun res!989944 () Bool)

(assert (=> b!1460126 (=> (not res!989944) (not e!821041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460126 (= res!989944 (validKeyInArray!0 (select (arr!47610 a!2862) j!93)))))

(declare-fun b!1460127 () Bool)

(declare-fun res!989943 () Bool)

(declare-fun e!821040 () Bool)

(assert (=> b!1460127 (=> (not res!989943) (not e!821040))))

(assert (=> b!1460127 (= res!989943 e!821048)))

(declare-fun c!134604 () Bool)

(assert (=> b!1460127 (= c!134604 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460128 () Bool)

(assert (=> b!1460128 (= e!821039 e!821042)))

(declare-fun res!989949 () Bool)

(assert (=> b!1460128 (=> (not res!989949) (not e!821042))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460128 (= res!989949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47610 a!2862) j!93) mask!2687) (select (arr!47610 a!2862) j!93) a!2862 mask!2687) lt!639724))))

(assert (=> b!1460128 (= lt!639724 (Intermediate!11862 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460129 () Bool)

(declare-fun res!989932 () Bool)

(assert (=> b!1460129 (=> (not res!989932) (not e!821041))))

(declare-datatypes ((List!34111 0))(
  ( (Nil!34108) (Cons!34107 (h!35457 (_ BitVec 64)) (t!48805 List!34111)) )
))
(declare-fun arrayNoDuplicates!0 (array!98644 (_ BitVec 32) List!34111) Bool)

(assert (=> b!1460129 (= res!989932 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34108))))

(declare-fun b!1460130 () Bool)

(declare-fun res!989947 () Bool)

(assert (=> b!1460130 (=> res!989947 e!821047)))

(assert (=> b!1460130 (= res!989947 e!821045)))

(declare-fun c!134603 () Bool)

(assert (=> b!1460130 (= c!134603 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460131 () Bool)

(declare-fun res!989948 () Bool)

(assert (=> b!1460131 (=> (not res!989948) (not e!821040))))

(assert (=> b!1460131 (= res!989948 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460132 () Bool)

(assert (=> b!1460132 (= e!821046 (validKeyInArray!0 lt!639722))))

(declare-fun b!1460133 () Bool)

(declare-fun res!989950 () Bool)

(assert (=> b!1460133 (=> (not res!989950) (not e!821041))))

(assert (=> b!1460133 (= res!989950 (validKeyInArray!0 (select (arr!47610 a!2862) i!1006)))))

(declare-fun b!1460134 () Bool)

(declare-fun e!821043 () Bool)

(assert (=> b!1460134 (= e!821040 (not e!821043))))

(declare-fun res!989938 () Bool)

(assert (=> b!1460134 (=> res!989938 e!821043)))

(assert (=> b!1460134 (= res!989938 (or (and (= (select (arr!47610 a!2862) index!646) (select (store (arr!47610 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47610 a!2862) index!646) (select (arr!47610 a!2862) j!93))) (= (select (arr!47610 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460134 (and (= lt!639721 (Found!11862 j!93)) (or (= (select (arr!47610 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47610 a!2862) intermediateBeforeIndex!19) (select (arr!47610 a!2862) j!93))) (let ((bdg!53563 (select (store (arr!47610 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47610 a!2862) index!646) bdg!53563) (= (select (arr!47610 a!2862) index!646) (select (arr!47610 a!2862) j!93))) (= (select (arr!47610 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53563 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460134 (= lt!639721 (seekEntryOrOpen!0 (select (arr!47610 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98644 (_ BitVec 32)) Bool)

(assert (=> b!1460134 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639726 () Unit!49220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49220)

(assert (=> b!1460134 (= lt!639726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460135 () Bool)

(assert (=> b!1460135 (= e!821045 (not (= lt!639720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639719 lt!639722 lt!639725 mask!2687))))))

(declare-fun b!1460136 () Bool)

(assert (=> b!1460136 (= e!821042 e!821040)))

(declare-fun res!989936 () Bool)

(assert (=> b!1460136 (=> (not res!989936) (not e!821040))))

(assert (=> b!1460136 (= res!989936 (= lt!639720 (Intermediate!11862 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460136 (= lt!639720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639722 mask!2687) lt!639722 lt!639725 mask!2687))))

(assert (=> b!1460136 (= lt!639722 (select (store (arr!47610 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460137 () Bool)

(declare-fun res!989937 () Bool)

(assert (=> b!1460137 (=> (not res!989937) (not e!821041))))

(assert (=> b!1460137 (= res!989937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460138 () Bool)

(assert (=> b!1460138 (= e!821043 e!821047)))

(declare-fun res!989934 () Bool)

(assert (=> b!1460138 (=> res!989934 e!821047)))

(assert (=> b!1460138 (= res!989934 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639719 #b00000000000000000000000000000000) (bvsge lt!639719 (size!48160 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460138 (= lt!639719 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1460138 (= lt!639718 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639722 lt!639725 mask!2687))))

(assert (=> b!1460138 (= lt!639718 (seekEntryOrOpen!0 lt!639722 lt!639725 mask!2687))))

(declare-fun b!1460139 () Bool)

(declare-fun res!989933 () Bool)

(assert (=> b!1460139 (=> (not res!989933) (not e!821041))))

(assert (=> b!1460139 (= res!989933 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48160 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48160 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48160 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125196 res!989946) b!1460120))

(assert (= (and b!1460120 res!989941) b!1460133))

(assert (= (and b!1460133 res!989950) b!1460126))

(assert (= (and b!1460126 res!989944) b!1460137))

(assert (= (and b!1460137 res!989937) b!1460129))

(assert (= (and b!1460129 res!989932) b!1460139))

(assert (= (and b!1460139 res!989933) b!1460122))

(assert (= (and b!1460122 res!989942) b!1460128))

(assert (= (and b!1460128 res!989949) b!1460118))

(assert (= (and b!1460118 res!989945) b!1460136))

(assert (= (and b!1460136 res!989936) b!1460127))

(assert (= (and b!1460127 c!134604) b!1460121))

(assert (= (and b!1460127 (not c!134604)) b!1460119))

(assert (= (and b!1460127 res!989943) b!1460131))

(assert (= (and b!1460131 res!989948) b!1460134))

(assert (= (and b!1460134 (not res!989938)) b!1460138))

(assert (= (and b!1460138 (not res!989934)) b!1460125))

(assert (= (and b!1460125 (not res!989935)) b!1460130))

(assert (= (and b!1460130 c!134603) b!1460135))

(assert (= (and b!1460130 (not c!134603)) b!1460124))

(assert (= (and b!1460130 (not res!989947)) b!1460123))

(assert (= (and b!1460123 (not res!989940)) b!1460117))

(assert (= (and b!1460117 (not res!989939)) b!1460132))

(declare-fun m!1347813 () Bool)

(assert (=> b!1460138 m!1347813))

(declare-fun m!1347815 () Bool)

(assert (=> b!1460138 m!1347815))

(declare-fun m!1347817 () Bool)

(assert (=> b!1460138 m!1347817))

(declare-fun m!1347819 () Bool)

(assert (=> b!1460122 m!1347819))

(declare-fun m!1347821 () Bool)

(assert (=> b!1460122 m!1347821))

(declare-fun m!1347823 () Bool)

(assert (=> b!1460121 m!1347823))

(declare-fun m!1347825 () Bool)

(assert (=> b!1460117 m!1347825))

(declare-fun m!1347827 () Bool)

(assert (=> b!1460136 m!1347827))

(assert (=> b!1460136 m!1347827))

(declare-fun m!1347829 () Bool)

(assert (=> b!1460136 m!1347829))

(assert (=> b!1460136 m!1347819))

(declare-fun m!1347831 () Bool)

(assert (=> b!1460136 m!1347831))

(declare-fun m!1347833 () Bool)

(assert (=> b!1460132 m!1347833))

(declare-fun m!1347835 () Bool)

(assert (=> b!1460134 m!1347835))

(assert (=> b!1460134 m!1347819))

(declare-fun m!1347837 () Bool)

(assert (=> b!1460134 m!1347837))

(declare-fun m!1347839 () Bool)

(assert (=> b!1460134 m!1347839))

(declare-fun m!1347841 () Bool)

(assert (=> b!1460134 m!1347841))

(declare-fun m!1347843 () Bool)

(assert (=> b!1460134 m!1347843))

(declare-fun m!1347845 () Bool)

(assert (=> b!1460134 m!1347845))

(declare-fun m!1347847 () Bool)

(assert (=> b!1460134 m!1347847))

(assert (=> b!1460134 m!1347843))

(declare-fun m!1347849 () Bool)

(assert (=> b!1460124 m!1347849))

(declare-fun m!1347851 () Bool)

(assert (=> b!1460133 m!1347851))

(assert (=> b!1460133 m!1347851))

(declare-fun m!1347853 () Bool)

(assert (=> b!1460133 m!1347853))

(assert (=> b!1460126 m!1347843))

(assert (=> b!1460126 m!1347843))

(declare-fun m!1347855 () Bool)

(assert (=> b!1460126 m!1347855))

(assert (=> b!1460128 m!1347843))

(assert (=> b!1460128 m!1347843))

(declare-fun m!1347857 () Bool)

(assert (=> b!1460128 m!1347857))

(assert (=> b!1460128 m!1347857))

(assert (=> b!1460128 m!1347843))

(declare-fun m!1347859 () Bool)

(assert (=> b!1460128 m!1347859))

(assert (=> b!1460119 m!1347815))

(assert (=> b!1460119 m!1347817))

(declare-fun m!1347861 () Bool)

(assert (=> b!1460137 m!1347861))

(assert (=> b!1460118 m!1347843))

(assert (=> b!1460118 m!1347843))

(declare-fun m!1347863 () Bool)

(assert (=> b!1460118 m!1347863))

(declare-fun m!1347865 () Bool)

(assert (=> start!125196 m!1347865))

(declare-fun m!1347867 () Bool)

(assert (=> start!125196 m!1347867))

(declare-fun m!1347869 () Bool)

(assert (=> b!1460135 m!1347869))

(declare-fun m!1347871 () Bool)

(assert (=> b!1460129 m!1347871))

(assert (=> b!1460125 m!1347843))

(assert (=> b!1460125 m!1347843))

(declare-fun m!1347873 () Bool)

(assert (=> b!1460125 m!1347873))

(check-sat (not b!1460129) (not b!1460128) (not b!1460134) (not b!1460117) (not b!1460119) (not b!1460124) (not start!125196) (not b!1460132) (not b!1460136) (not b!1460121) (not b!1460125) (not b!1460126) (not b!1460118) (not b!1460137) (not b!1460135) (not b!1460138) (not b!1460133))
(check-sat)
