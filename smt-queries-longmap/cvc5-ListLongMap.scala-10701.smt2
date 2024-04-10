; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125344 () Bool)

(assert start!125344)

(declare-fun b!1464825 () Bool)

(declare-fun e!823158 () Bool)

(declare-fun e!823156 () Bool)

(assert (=> b!1464825 (= e!823158 (not e!823156))))

(declare-fun res!993824 () Bool)

(assert (=> b!1464825 (=> res!993824 e!823156)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98792 0))(
  ( (array!98793 (arr!47684 (Array (_ BitVec 32) (_ BitVec 64))) (size!48234 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98792)

(assert (=> b!1464825 (= res!993824 (or (and (= (select (arr!47684 a!2862) index!646) (select (store (arr!47684 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47684 a!2862) index!646) (select (arr!47684 a!2862) j!93))) (= (select (arr!47684 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823160 () Bool)

(assert (=> b!1464825 e!823160))

(declare-fun res!993826 () Bool)

(assert (=> b!1464825 (=> (not res!993826) (not e!823160))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98792 (_ BitVec 32)) Bool)

(assert (=> b!1464825 (= res!993826 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49368 0))(
  ( (Unit!49369) )
))
(declare-fun lt!641209 () Unit!49368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49368)

(assert (=> b!1464825 (= lt!641209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-datatypes ((SeekEntryResult!11936 0))(
  ( (MissingZero!11936 (index!50136 (_ BitVec 32))) (Found!11936 (index!50137 (_ BitVec 32))) (Intermediate!11936 (undefined!12748 Bool) (index!50138 (_ BitVec 32)) (x!131721 (_ BitVec 32))) (Undefined!11936) (MissingVacant!11936 (index!50139 (_ BitVec 32))) )
))
(declare-fun lt!641211 () SeekEntryResult!11936)

(declare-fun b!1464826 () Bool)

(declare-fun lt!641212 () array!98792)

(declare-fun e!823152 () Bool)

(declare-fun lt!641210 () (_ BitVec 32))

(declare-fun lt!641208 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98792 (_ BitVec 32)) SeekEntryResult!11936)

(assert (=> b!1464826 (= e!823152 (not (= lt!641211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641210 lt!641208 lt!641212 mask!2687))))))

(declare-fun b!1464827 () Bool)

(declare-fun e!823155 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98792 (_ BitVec 32)) SeekEntryResult!11936)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98792 (_ BitVec 32)) SeekEntryResult!11936)

(assert (=> b!1464827 (= e!823155 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641208 lt!641212 mask!2687) (seekEntryOrOpen!0 lt!641208 lt!641212 mask!2687)))))

(declare-fun b!1464828 () Bool)

(declare-fun e!823151 () Bool)

(assert (=> b!1464828 (= e!823151 e!823158)))

(declare-fun res!993835 () Bool)

(assert (=> b!1464828 (=> (not res!993835) (not e!823158))))

(assert (=> b!1464828 (= res!993835 (= lt!641211 (Intermediate!11936 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464828 (= lt!641211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641208 mask!2687) lt!641208 lt!641212 mask!2687))))

(assert (=> b!1464828 (= lt!641208 (select (store (arr!47684 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464829 () Bool)

(declare-fun res!993832 () Bool)

(declare-fun e!823159 () Bool)

(assert (=> b!1464829 (=> (not res!993832) (not e!823159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464829 (= res!993832 (validKeyInArray!0 (select (arr!47684 a!2862) i!1006)))))

(declare-fun b!1464831 () Bool)

(declare-fun e!823153 () Bool)

(assert (=> b!1464831 (= e!823153 e!823151)))

(declare-fun res!993839 () Bool)

(assert (=> b!1464831 (=> (not res!993839) (not e!823151))))

(declare-fun lt!641213 () SeekEntryResult!11936)

(assert (=> b!1464831 (= res!993839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47684 a!2862) j!93) mask!2687) (select (arr!47684 a!2862) j!93) a!2862 mask!2687) lt!641213))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464831 (= lt!641213 (Intermediate!11936 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464832 () Bool)

(declare-fun res!993828 () Bool)

(assert (=> b!1464832 (=> (not res!993828) (not e!823159))))

(assert (=> b!1464832 (= res!993828 (and (= (size!48234 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48234 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48234 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464833 () Bool)

(declare-fun res!993838 () Bool)

(assert (=> b!1464833 (=> (not res!993838) (not e!823159))))

(assert (=> b!1464833 (= res!993838 (validKeyInArray!0 (select (arr!47684 a!2862) j!93)))))

(declare-fun b!1464834 () Bool)

(declare-fun res!993841 () Bool)

(assert (=> b!1464834 (=> (not res!993841) (not e!823160))))

(assert (=> b!1464834 (= res!993841 (= (seekEntryOrOpen!0 (select (arr!47684 a!2862) j!93) a!2862 mask!2687) (Found!11936 j!93)))))

(declare-fun b!1464835 () Bool)

(declare-fun res!993831 () Bool)

(assert (=> b!1464835 (=> (not res!993831) (not e!823151))))

(assert (=> b!1464835 (= res!993831 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47684 a!2862) j!93) a!2862 mask!2687) lt!641213))))

(declare-fun b!1464836 () Bool)

(assert (=> b!1464836 (= e!823160 (or (= (select (arr!47684 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47684 a!2862) intermediateBeforeIndex!19) (select (arr!47684 a!2862) j!93))))))

(declare-fun b!1464837 () Bool)

(declare-fun res!993840 () Bool)

(assert (=> b!1464837 (=> (not res!993840) (not e!823158))))

(assert (=> b!1464837 (= res!993840 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464838 () Bool)

(assert (=> b!1464838 (= e!823152 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641210 intermediateAfterIndex!19 lt!641208 lt!641212 mask!2687) (seekEntryOrOpen!0 lt!641208 lt!641212 mask!2687))))))

(declare-fun b!1464839 () Bool)

(declare-fun res!993836 () Bool)

(assert (=> b!1464839 (=> (not res!993836) (not e!823159))))

(declare-datatypes ((List!34185 0))(
  ( (Nil!34182) (Cons!34181 (h!35531 (_ BitVec 64)) (t!48879 List!34185)) )
))
(declare-fun arrayNoDuplicates!0 (array!98792 (_ BitVec 32) List!34185) Bool)

(assert (=> b!1464839 (= res!993836 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34182))))

(declare-fun b!1464840 () Bool)

(assert (=> b!1464840 (= e!823155 (= lt!641211 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641208 lt!641212 mask!2687)))))

(declare-fun b!1464841 () Bool)

(declare-fun res!993825 () Bool)

(assert (=> b!1464841 (=> (not res!993825) (not e!823159))))

(assert (=> b!1464841 (= res!993825 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48234 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48234 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48234 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464842 () Bool)

(declare-fun res!993827 () Bool)

(assert (=> b!1464842 (=> (not res!993827) (not e!823158))))

(assert (=> b!1464842 (= res!993827 e!823155)))

(declare-fun c!135011 () Bool)

(assert (=> b!1464842 (= c!135011 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464843 () Bool)

(assert (=> b!1464843 (= e!823159 e!823153)))

(declare-fun res!993830 () Bool)

(assert (=> b!1464843 (=> (not res!993830) (not e!823153))))

(assert (=> b!1464843 (= res!993830 (= (select (store (arr!47684 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464843 (= lt!641212 (array!98793 (store (arr!47684 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48234 a!2862)))))

(declare-fun res!993834 () Bool)

(assert (=> start!125344 (=> (not res!993834) (not e!823159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125344 (= res!993834 (validMask!0 mask!2687))))

(assert (=> start!125344 e!823159))

(assert (=> start!125344 true))

(declare-fun array_inv!36712 (array!98792) Bool)

(assert (=> start!125344 (array_inv!36712 a!2862)))

(declare-fun b!1464830 () Bool)

(declare-fun e!823154 () Bool)

(assert (=> b!1464830 (= e!823154 true)))

(declare-fun lt!641214 () Bool)

(assert (=> b!1464830 (= lt!641214 e!823152)))

(declare-fun c!135012 () Bool)

(assert (=> b!1464830 (= c!135012 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464844 () Bool)

(declare-fun res!993829 () Bool)

(assert (=> b!1464844 (=> res!993829 e!823154)))

(assert (=> b!1464844 (= res!993829 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641210 (select (arr!47684 a!2862) j!93) a!2862 mask!2687) lt!641213)))))

(declare-fun b!1464845 () Bool)

(declare-fun res!993833 () Bool)

(assert (=> b!1464845 (=> (not res!993833) (not e!823159))))

(assert (=> b!1464845 (= res!993833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464846 () Bool)

(assert (=> b!1464846 (= e!823156 e!823154)))

(declare-fun res!993837 () Bool)

(assert (=> b!1464846 (=> res!993837 e!823154)))

(assert (=> b!1464846 (= res!993837 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641210 #b00000000000000000000000000000000) (bvsge lt!641210 (size!48234 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464846 (= lt!641210 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!125344 res!993834) b!1464832))

(assert (= (and b!1464832 res!993828) b!1464829))

(assert (= (and b!1464829 res!993832) b!1464833))

(assert (= (and b!1464833 res!993838) b!1464845))

(assert (= (and b!1464845 res!993833) b!1464839))

(assert (= (and b!1464839 res!993836) b!1464841))

(assert (= (and b!1464841 res!993825) b!1464843))

(assert (= (and b!1464843 res!993830) b!1464831))

(assert (= (and b!1464831 res!993839) b!1464835))

(assert (= (and b!1464835 res!993831) b!1464828))

(assert (= (and b!1464828 res!993835) b!1464842))

(assert (= (and b!1464842 c!135011) b!1464840))

(assert (= (and b!1464842 (not c!135011)) b!1464827))

(assert (= (and b!1464842 res!993827) b!1464837))

(assert (= (and b!1464837 res!993840) b!1464825))

(assert (= (and b!1464825 res!993826) b!1464834))

(assert (= (and b!1464834 res!993841) b!1464836))

(assert (= (and b!1464825 (not res!993824)) b!1464846))

(assert (= (and b!1464846 (not res!993837)) b!1464844))

(assert (= (and b!1464844 (not res!993829)) b!1464830))

(assert (= (and b!1464830 c!135012) b!1464826))

(assert (= (and b!1464830 (not c!135012)) b!1464838))

(declare-fun m!1351993 () Bool)

(assert (=> b!1464839 m!1351993))

(declare-fun m!1351995 () Bool)

(assert (=> b!1464846 m!1351995))

(declare-fun m!1351997 () Bool)

(assert (=> b!1464844 m!1351997))

(assert (=> b!1464844 m!1351997))

(declare-fun m!1351999 () Bool)

(assert (=> b!1464844 m!1351999))

(declare-fun m!1352001 () Bool)

(assert (=> b!1464845 m!1352001))

(declare-fun m!1352003 () Bool)

(assert (=> start!125344 m!1352003))

(declare-fun m!1352005 () Bool)

(assert (=> start!125344 m!1352005))

(declare-fun m!1352007 () Bool)

(assert (=> b!1464827 m!1352007))

(declare-fun m!1352009 () Bool)

(assert (=> b!1464827 m!1352009))

(assert (=> b!1464833 m!1351997))

(assert (=> b!1464833 m!1351997))

(declare-fun m!1352011 () Bool)

(assert (=> b!1464833 m!1352011))

(declare-fun m!1352013 () Bool)

(assert (=> b!1464826 m!1352013))

(declare-fun m!1352015 () Bool)

(assert (=> b!1464825 m!1352015))

(declare-fun m!1352017 () Bool)

(assert (=> b!1464825 m!1352017))

(declare-fun m!1352019 () Bool)

(assert (=> b!1464825 m!1352019))

(declare-fun m!1352021 () Bool)

(assert (=> b!1464825 m!1352021))

(declare-fun m!1352023 () Bool)

(assert (=> b!1464825 m!1352023))

(assert (=> b!1464825 m!1351997))

(assert (=> b!1464834 m!1351997))

(assert (=> b!1464834 m!1351997))

(declare-fun m!1352025 () Bool)

(assert (=> b!1464834 m!1352025))

(assert (=> b!1464831 m!1351997))

(assert (=> b!1464831 m!1351997))

(declare-fun m!1352027 () Bool)

(assert (=> b!1464831 m!1352027))

(assert (=> b!1464831 m!1352027))

(assert (=> b!1464831 m!1351997))

(declare-fun m!1352029 () Bool)

(assert (=> b!1464831 m!1352029))

(declare-fun m!1352031 () Bool)

(assert (=> b!1464828 m!1352031))

(assert (=> b!1464828 m!1352031))

(declare-fun m!1352033 () Bool)

(assert (=> b!1464828 m!1352033))

(assert (=> b!1464828 m!1352017))

(declare-fun m!1352035 () Bool)

(assert (=> b!1464828 m!1352035))

(assert (=> b!1464835 m!1351997))

(assert (=> b!1464835 m!1351997))

(declare-fun m!1352037 () Bool)

(assert (=> b!1464835 m!1352037))

(declare-fun m!1352039 () Bool)

(assert (=> b!1464836 m!1352039))

(assert (=> b!1464836 m!1351997))

(declare-fun m!1352041 () Bool)

(assert (=> b!1464829 m!1352041))

(assert (=> b!1464829 m!1352041))

(declare-fun m!1352043 () Bool)

(assert (=> b!1464829 m!1352043))

(assert (=> b!1464843 m!1352017))

(declare-fun m!1352045 () Bool)

(assert (=> b!1464843 m!1352045))

(declare-fun m!1352047 () Bool)

(assert (=> b!1464838 m!1352047))

(assert (=> b!1464838 m!1352009))

(declare-fun m!1352049 () Bool)

(assert (=> b!1464840 m!1352049))

(push 1)

