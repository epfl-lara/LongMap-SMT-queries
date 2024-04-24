; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125436 () Bool)

(assert start!125436)

(declare-fun b!1462029 () Bool)

(declare-fun e!822122 () Bool)

(declare-fun e!822123 () Bool)

(assert (=> b!1462029 (= e!822122 e!822123)))

(declare-fun res!990952 () Bool)

(assert (=> b!1462029 (=> (not res!990952) (not e!822123))))

(declare-datatypes ((SeekEntryResult!11823 0))(
  ( (MissingZero!11823 (index!49684 (_ BitVec 32))) (Found!11823 (index!49685 (_ BitVec 32))) (Intermediate!11823 (undefined!12635 Bool) (index!49686 (_ BitVec 32)) (x!131464 (_ BitVec 32))) (Undefined!11823) (MissingVacant!11823 (index!49687 (_ BitVec 32))) )
))
(declare-fun lt!640379 () SeekEntryResult!11823)

(declare-datatypes ((array!98779 0))(
  ( (array!98780 (arr!47674 (Array (_ BitVec 32) (_ BitVec 64))) (size!48225 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98779)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98779 (_ BitVec 32)) SeekEntryResult!11823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462029 (= res!990952 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!640379))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462029 (= lt!640379 (Intermediate!11823 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462031 () Bool)

(declare-fun res!990950 () Bool)

(declare-fun e!822126 () Bool)

(assert (=> b!1462031 (=> (not res!990950) (not e!822126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98779 (_ BitVec 32)) Bool)

(assert (=> b!1462031 (= res!990950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462032 () Bool)

(declare-fun res!990953 () Bool)

(assert (=> b!1462032 (=> (not res!990953) (not e!822126))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462032 (= res!990953 (and (= (size!48225 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48225 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48225 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462033 () Bool)

(declare-fun res!990949 () Bool)

(assert (=> b!1462033 (=> (not res!990949) (not e!822123))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1462033 (= res!990949 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!640379))))

(declare-fun b!1462034 () Bool)

(assert (=> b!1462034 (= e!822126 e!822122)))

(declare-fun res!990948 () Bool)

(assert (=> b!1462034 (=> (not res!990948) (not e!822122))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462034 (= res!990948 (= (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640381 () array!98779)

(assert (=> b!1462034 (= lt!640381 (array!98780 (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48225 a!2862)))))

(declare-fun b!1462035 () Bool)

(declare-fun res!990955 () Bool)

(assert (=> b!1462035 (=> (not res!990955) (not e!822126))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462035 (= res!990955 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48225 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48225 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48225 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!822121 () Bool)

(declare-fun b!1462036 () Bool)

(assert (=> b!1462036 (= e!822121 (or (= (select (arr!47674 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47674 a!2862) intermediateBeforeIndex!19) (select (arr!47674 a!2862) j!93))))))

(declare-fun e!822120 () Bool)

(declare-fun b!1462037 () Bool)

(declare-fun lt!640377 () SeekEntryResult!11823)

(declare-fun lt!640378 () (_ BitVec 64))

(assert (=> b!1462037 (= e!822120 (= lt!640377 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640378 lt!640381 mask!2687)))))

(declare-fun b!1462030 () Bool)

(declare-fun e!822125 () Bool)

(assert (=> b!1462030 (= e!822123 e!822125)))

(declare-fun res!990945 () Bool)

(assert (=> b!1462030 (=> (not res!990945) (not e!822125))))

(assert (=> b!1462030 (= res!990945 (= lt!640377 (Intermediate!11823 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462030 (= lt!640377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640378 mask!2687) lt!640378 lt!640381 mask!2687))))

(assert (=> b!1462030 (= lt!640378 (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!990959 () Bool)

(assert (=> start!125436 (=> (not res!990959) (not e!822126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125436 (= res!990959 (validMask!0 mask!2687))))

(assert (=> start!125436 e!822126))

(assert (=> start!125436 true))

(declare-fun array_inv!36955 (array!98779) Bool)

(assert (=> start!125436 (array_inv!36955 a!2862)))

(declare-fun b!1462038 () Bool)

(declare-fun res!990951 () Bool)

(assert (=> b!1462038 (=> (not res!990951) (not e!822126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462038 (= res!990951 (validKeyInArray!0 (select (arr!47674 a!2862) i!1006)))))

(declare-fun b!1462039 () Bool)

(declare-fun res!990954 () Bool)

(assert (=> b!1462039 (=> (not res!990954) (not e!822126))))

(declare-datatypes ((List!34162 0))(
  ( (Nil!34159) (Cons!34158 (h!35519 (_ BitVec 64)) (t!48848 List!34162)) )
))
(declare-fun arrayNoDuplicates!0 (array!98779 (_ BitVec 32) List!34162) Bool)

(assert (=> b!1462039 (= res!990954 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34159))))

(declare-fun b!1462040 () Bool)

(declare-fun res!990958 () Bool)

(assert (=> b!1462040 (=> (not res!990958) (not e!822125))))

(assert (=> b!1462040 (= res!990958 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462041 () Bool)

(declare-fun res!990947 () Bool)

(assert (=> b!1462041 (=> (not res!990947) (not e!822125))))

(assert (=> b!1462041 (= res!990947 e!822120)))

(declare-fun c!135061 () Bool)

(assert (=> b!1462041 (= c!135061 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462042 () Bool)

(declare-fun res!990946 () Bool)

(assert (=> b!1462042 (=> (not res!990946) (not e!822121))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98779 (_ BitVec 32)) SeekEntryResult!11823)

(assert (=> b!1462042 (= res!990946 (= (seekEntryOrOpen!0 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) (Found!11823 j!93)))))

(declare-fun b!1462043 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98779 (_ BitVec 32)) SeekEntryResult!11823)

(assert (=> b!1462043 (= e!822120 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640378 lt!640381 mask!2687) (seekEntryOrOpen!0 lt!640378 lt!640381 mask!2687)))))

(declare-fun b!1462044 () Bool)

(declare-fun res!990956 () Bool)

(assert (=> b!1462044 (=> (not res!990956) (not e!822126))))

(assert (=> b!1462044 (= res!990956 (validKeyInArray!0 (select (arr!47674 a!2862) j!93)))))

(declare-fun b!1462045 () Bool)

(assert (=> b!1462045 (= e!822125 (not (or (and (= (select (arr!47674 a!2862) index!646) (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47674 a!2862) index!646) (select (arr!47674 a!2862) j!93))) (= (select (arr!47674 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000)))))))

(assert (=> b!1462045 e!822121))

(declare-fun res!990957 () Bool)

(assert (=> b!1462045 (=> (not res!990957) (not e!822121))))

(assert (=> b!1462045 (= res!990957 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49175 0))(
  ( (Unit!49176) )
))
(declare-fun lt!640380 () Unit!49175)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49175)

(assert (=> b!1462045 (= lt!640380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125436 res!990959) b!1462032))

(assert (= (and b!1462032 res!990953) b!1462038))

(assert (= (and b!1462038 res!990951) b!1462044))

(assert (= (and b!1462044 res!990956) b!1462031))

(assert (= (and b!1462031 res!990950) b!1462039))

(assert (= (and b!1462039 res!990954) b!1462035))

(assert (= (and b!1462035 res!990955) b!1462034))

(assert (= (and b!1462034 res!990948) b!1462029))

(assert (= (and b!1462029 res!990952) b!1462033))

(assert (= (and b!1462033 res!990949) b!1462030))

(assert (= (and b!1462030 res!990945) b!1462041))

(assert (= (and b!1462041 c!135061) b!1462037))

(assert (= (and b!1462041 (not c!135061)) b!1462043))

(assert (= (and b!1462041 res!990947) b!1462040))

(assert (= (and b!1462040 res!990958) b!1462045))

(assert (= (and b!1462045 res!990957) b!1462042))

(assert (= (and b!1462042 res!990946) b!1462036))

(declare-fun m!1349815 () Bool)

(assert (=> b!1462033 m!1349815))

(assert (=> b!1462033 m!1349815))

(declare-fun m!1349817 () Bool)

(assert (=> b!1462033 m!1349817))

(declare-fun m!1349819 () Bool)

(assert (=> b!1462031 m!1349819))

(assert (=> b!1462029 m!1349815))

(assert (=> b!1462029 m!1349815))

(declare-fun m!1349821 () Bool)

(assert (=> b!1462029 m!1349821))

(assert (=> b!1462029 m!1349821))

(assert (=> b!1462029 m!1349815))

(declare-fun m!1349823 () Bool)

(assert (=> b!1462029 m!1349823))

(declare-fun m!1349825 () Bool)

(assert (=> b!1462045 m!1349825))

(declare-fun m!1349827 () Bool)

(assert (=> b!1462045 m!1349827))

(declare-fun m!1349829 () Bool)

(assert (=> b!1462045 m!1349829))

(declare-fun m!1349831 () Bool)

(assert (=> b!1462045 m!1349831))

(declare-fun m!1349833 () Bool)

(assert (=> b!1462045 m!1349833))

(assert (=> b!1462045 m!1349815))

(declare-fun m!1349835 () Bool)

(assert (=> b!1462038 m!1349835))

(assert (=> b!1462038 m!1349835))

(declare-fun m!1349837 () Bool)

(assert (=> b!1462038 m!1349837))

(declare-fun m!1349839 () Bool)

(assert (=> b!1462036 m!1349839))

(assert (=> b!1462036 m!1349815))

(declare-fun m!1349841 () Bool)

(assert (=> b!1462043 m!1349841))

(declare-fun m!1349843 () Bool)

(assert (=> b!1462043 m!1349843))

(declare-fun m!1349845 () Bool)

(assert (=> b!1462039 m!1349845))

(declare-fun m!1349847 () Bool)

(assert (=> b!1462030 m!1349847))

(assert (=> b!1462030 m!1349847))

(declare-fun m!1349849 () Bool)

(assert (=> b!1462030 m!1349849))

(assert (=> b!1462030 m!1349827))

(declare-fun m!1349851 () Bool)

(assert (=> b!1462030 m!1349851))

(assert (=> b!1462034 m!1349827))

(declare-fun m!1349853 () Bool)

(assert (=> b!1462034 m!1349853))

(assert (=> b!1462044 m!1349815))

(assert (=> b!1462044 m!1349815))

(declare-fun m!1349855 () Bool)

(assert (=> b!1462044 m!1349855))

(declare-fun m!1349857 () Bool)

(assert (=> start!125436 m!1349857))

(declare-fun m!1349859 () Bool)

(assert (=> start!125436 m!1349859))

(assert (=> b!1462042 m!1349815))

(assert (=> b!1462042 m!1349815))

(declare-fun m!1349861 () Bool)

(assert (=> b!1462042 m!1349861))

(declare-fun m!1349863 () Bool)

(assert (=> b!1462037 m!1349863))

(check-sat (not start!125436) (not b!1462037) (not b!1462038) (not b!1462030) (not b!1462045) (not b!1462039) (not b!1462044) (not b!1462031) (not b!1462043) (not b!1462029) (not b!1462042) (not b!1462033))
(check-sat)
(get-model)

(declare-fun bm!67767 () Bool)

(declare-fun call!67770 () Bool)

(declare-fun c!135070 () Bool)

(assert (=> bm!67767 (= call!67770 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135070 (Cons!34158 (select (arr!47674 a!2862) #b00000000000000000000000000000000) Nil!34159) Nil!34159)))))

(declare-fun b!1462158 () Bool)

(declare-fun e!822177 () Bool)

(declare-fun contains!9940 (List!34162 (_ BitVec 64)) Bool)

(assert (=> b!1462158 (= e!822177 (contains!9940 Nil!34159 (select (arr!47674 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1462159 () Bool)

(declare-fun e!822178 () Bool)

(assert (=> b!1462159 (= e!822178 call!67770)))

(declare-fun b!1462160 () Bool)

(declare-fun e!822179 () Bool)

(assert (=> b!1462160 (= e!822179 e!822178)))

(assert (=> b!1462160 (= c!135070 (validKeyInArray!0 (select (arr!47674 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1462161 () Bool)

(declare-fun e!822180 () Bool)

(assert (=> b!1462161 (= e!822180 e!822179)))

(declare-fun res!991057 () Bool)

(assert (=> b!1462161 (=> (not res!991057) (not e!822179))))

(assert (=> b!1462161 (= res!991057 (not e!822177))))

(declare-fun res!991058 () Bool)

(assert (=> b!1462161 (=> (not res!991058) (not e!822177))))

(assert (=> b!1462161 (= res!991058 (validKeyInArray!0 (select (arr!47674 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1462162 () Bool)

(assert (=> b!1462162 (= e!822178 call!67770)))

(declare-fun d!155563 () Bool)

(declare-fun res!991056 () Bool)

(assert (=> d!155563 (=> res!991056 e!822180)))

(assert (=> d!155563 (= res!991056 (bvsge #b00000000000000000000000000000000 (size!48225 a!2862)))))

(assert (=> d!155563 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34159) e!822180)))

(assert (= (and d!155563 (not res!991056)) b!1462161))

(assert (= (and b!1462161 res!991058) b!1462158))

(assert (= (and b!1462161 res!991057) b!1462160))

(assert (= (and b!1462160 c!135070) b!1462162))

(assert (= (and b!1462160 (not c!135070)) b!1462159))

(assert (= (or b!1462162 b!1462159) bm!67767))

(declare-fun m!1349965 () Bool)

(assert (=> bm!67767 m!1349965))

(declare-fun m!1349967 () Bool)

(assert (=> bm!67767 m!1349967))

(assert (=> b!1462158 m!1349965))

(assert (=> b!1462158 m!1349965))

(declare-fun m!1349969 () Bool)

(assert (=> b!1462158 m!1349969))

(assert (=> b!1462160 m!1349965))

(assert (=> b!1462160 m!1349965))

(declare-fun m!1349971 () Bool)

(assert (=> b!1462160 m!1349971))

(assert (=> b!1462161 m!1349965))

(assert (=> b!1462161 m!1349965))

(assert (=> b!1462161 m!1349971))

(assert (=> b!1462039 d!155563))

(declare-fun d!155565 () Bool)

(assert (=> d!155565 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125436 d!155565))

(declare-fun d!155567 () Bool)

(assert (=> d!155567 (= (array_inv!36955 a!2862) (bvsge (size!48225 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125436 d!155567))

(declare-fun d!155569 () Bool)

(assert (=> d!155569 (= (validKeyInArray!0 (select (arr!47674 a!2862) i!1006)) (and (not (= (select (arr!47674 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47674 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1462038 d!155569))

(declare-fun b!1462181 () Bool)

(declare-fun lt!640417 () SeekEntryResult!11823)

(assert (=> b!1462181 (and (bvsge (index!49686 lt!640417) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640417) (size!48225 a!2862)))))

(declare-fun res!991065 () Bool)

(assert (=> b!1462181 (= res!991065 (= (select (arr!47674 a!2862) (index!49686 lt!640417)) (select (arr!47674 a!2862) j!93)))))

(declare-fun e!822194 () Bool)

(assert (=> b!1462181 (=> res!991065 e!822194)))

(declare-fun e!822191 () Bool)

(assert (=> b!1462181 (= e!822191 e!822194)))

(declare-fun d!155571 () Bool)

(declare-fun e!822193 () Bool)

(assert (=> d!155571 e!822193))

(declare-fun c!135078 () Bool)

(get-info :version)

(assert (=> d!155571 (= c!135078 (and ((_ is Intermediate!11823) lt!640417) (undefined!12635 lt!640417)))))

(declare-fun e!822195 () SeekEntryResult!11823)

(assert (=> d!155571 (= lt!640417 e!822195)))

(declare-fun c!135079 () Bool)

(assert (=> d!155571 (= c!135079 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!640416 () (_ BitVec 64))

(assert (=> d!155571 (= lt!640416 (select (arr!47674 a!2862) (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687)))))

(assert (=> d!155571 (validMask!0 mask!2687)))

(assert (=> d!155571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!640417)))

(declare-fun e!822192 () SeekEntryResult!11823)

(declare-fun b!1462182 () Bool)

(assert (=> b!1462182 (= e!822192 (Intermediate!11823 false (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1462183 () Bool)

(assert (=> b!1462183 (= e!822195 e!822192)))

(declare-fun c!135077 () Bool)

(assert (=> b!1462183 (= c!135077 (or (= lt!640416 (select (arr!47674 a!2862) j!93)) (= (bvadd lt!640416 lt!640416) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1462184 () Bool)

(assert (=> b!1462184 (and (bvsge (index!49686 lt!640417) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640417) (size!48225 a!2862)))))

(assert (=> b!1462184 (= e!822194 (= (select (arr!47674 a!2862) (index!49686 lt!640417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1462185 () Bool)

(assert (=> b!1462185 (and (bvsge (index!49686 lt!640417) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640417) (size!48225 a!2862)))))

(declare-fun res!991067 () Bool)

(assert (=> b!1462185 (= res!991067 (= (select (arr!47674 a!2862) (index!49686 lt!640417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462185 (=> res!991067 e!822194)))

(declare-fun b!1462186 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462186 (= e!822192 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1462187 () Bool)

(assert (=> b!1462187 (= e!822193 (bvsge (x!131464 lt!640417) #b01111111111111111111111111111110))))

(declare-fun b!1462188 () Bool)

(assert (=> b!1462188 (= e!822193 e!822191)))

(declare-fun res!991066 () Bool)

(assert (=> b!1462188 (= res!991066 (and ((_ is Intermediate!11823) lt!640417) (not (undefined!12635 lt!640417)) (bvslt (x!131464 lt!640417) #b01111111111111111111111111111110) (bvsge (x!131464 lt!640417) #b00000000000000000000000000000000) (bvsge (x!131464 lt!640417) #b00000000000000000000000000000000)))))

(assert (=> b!1462188 (=> (not res!991066) (not e!822191))))

(declare-fun b!1462189 () Bool)

(assert (=> b!1462189 (= e!822195 (Intermediate!11823 true (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155571 c!135079) b!1462189))

(assert (= (and d!155571 (not c!135079)) b!1462183))

(assert (= (and b!1462183 c!135077) b!1462182))

(assert (= (and b!1462183 (not c!135077)) b!1462186))

(assert (= (and d!155571 c!135078) b!1462187))

(assert (= (and d!155571 (not c!135078)) b!1462188))

(assert (= (and b!1462188 res!991066) b!1462181))

(assert (= (and b!1462181 (not res!991065)) b!1462185))

(assert (= (and b!1462185 (not res!991067)) b!1462184))

(assert (=> b!1462186 m!1349821))

(declare-fun m!1349973 () Bool)

(assert (=> b!1462186 m!1349973))

(assert (=> b!1462186 m!1349973))

(assert (=> b!1462186 m!1349815))

(declare-fun m!1349975 () Bool)

(assert (=> b!1462186 m!1349975))

(assert (=> d!155571 m!1349821))

(declare-fun m!1349977 () Bool)

(assert (=> d!155571 m!1349977))

(assert (=> d!155571 m!1349857))

(declare-fun m!1349979 () Bool)

(assert (=> b!1462184 m!1349979))

(assert (=> b!1462181 m!1349979))

(assert (=> b!1462185 m!1349979))

(assert (=> b!1462029 d!155571))

(declare-fun d!155573 () Bool)

(declare-fun lt!640423 () (_ BitVec 32))

(declare-fun lt!640422 () (_ BitVec 32))

(assert (=> d!155573 (= lt!640423 (bvmul (bvxor lt!640422 (bvlshr lt!640422 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155573 (= lt!640422 ((_ extract 31 0) (bvand (bvxor (select (arr!47674 a!2862) j!93) (bvlshr (select (arr!47674 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155573 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!991068 (let ((h!35522 ((_ extract 31 0) (bvand (bvxor (select (arr!47674 a!2862) j!93) (bvlshr (select (arr!47674 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!131468 (bvmul (bvxor h!35522 (bvlshr h!35522 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!131468 (bvlshr x!131468 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!991068 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!991068 #b00000000000000000000000000000000))))))

(assert (=> d!155573 (= (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (bvand (bvxor lt!640423 (bvlshr lt!640423 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1462029 d!155573))

(declare-fun b!1462190 () Bool)

(declare-fun lt!640425 () SeekEntryResult!11823)

(assert (=> b!1462190 (and (bvsge (index!49686 lt!640425) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640425) (size!48225 lt!640381)))))

(declare-fun res!991069 () Bool)

(assert (=> b!1462190 (= res!991069 (= (select (arr!47674 lt!640381) (index!49686 lt!640425)) lt!640378))))

(declare-fun e!822199 () Bool)

(assert (=> b!1462190 (=> res!991069 e!822199)))

(declare-fun e!822196 () Bool)

(assert (=> b!1462190 (= e!822196 e!822199)))

(declare-fun d!155575 () Bool)

(declare-fun e!822198 () Bool)

(assert (=> d!155575 e!822198))

(declare-fun c!135081 () Bool)

(assert (=> d!155575 (= c!135081 (and ((_ is Intermediate!11823) lt!640425) (undefined!12635 lt!640425)))))

(declare-fun e!822200 () SeekEntryResult!11823)

(assert (=> d!155575 (= lt!640425 e!822200)))

(declare-fun c!135082 () Bool)

(assert (=> d!155575 (= c!135082 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!640424 () (_ BitVec 64))

(assert (=> d!155575 (= lt!640424 (select (arr!47674 lt!640381) index!646))))

(assert (=> d!155575 (validMask!0 mask!2687)))

(assert (=> d!155575 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640378 lt!640381 mask!2687) lt!640425)))

(declare-fun b!1462191 () Bool)

(declare-fun e!822197 () SeekEntryResult!11823)

(assert (=> b!1462191 (= e!822197 (Intermediate!11823 false index!646 x!665))))

(declare-fun b!1462192 () Bool)

(assert (=> b!1462192 (= e!822200 e!822197)))

(declare-fun c!135080 () Bool)

(assert (=> b!1462192 (= c!135080 (or (= lt!640424 lt!640378) (= (bvadd lt!640424 lt!640424) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1462193 () Bool)

(assert (=> b!1462193 (and (bvsge (index!49686 lt!640425) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640425) (size!48225 lt!640381)))))

(assert (=> b!1462193 (= e!822199 (= (select (arr!47674 lt!640381) (index!49686 lt!640425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1462194 () Bool)

(assert (=> b!1462194 (and (bvsge (index!49686 lt!640425) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640425) (size!48225 lt!640381)))))

(declare-fun res!991071 () Bool)

(assert (=> b!1462194 (= res!991071 (= (select (arr!47674 lt!640381) (index!49686 lt!640425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462194 (=> res!991071 e!822199)))

(declare-fun b!1462195 () Bool)

(assert (=> b!1462195 (= e!822197 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!640378 lt!640381 mask!2687))))

(declare-fun b!1462196 () Bool)

(assert (=> b!1462196 (= e!822198 (bvsge (x!131464 lt!640425) #b01111111111111111111111111111110))))

(declare-fun b!1462197 () Bool)

(assert (=> b!1462197 (= e!822198 e!822196)))

(declare-fun res!991070 () Bool)

(assert (=> b!1462197 (= res!991070 (and ((_ is Intermediate!11823) lt!640425) (not (undefined!12635 lt!640425)) (bvslt (x!131464 lt!640425) #b01111111111111111111111111111110) (bvsge (x!131464 lt!640425) #b00000000000000000000000000000000) (bvsge (x!131464 lt!640425) x!665)))))

(assert (=> b!1462197 (=> (not res!991070) (not e!822196))))

(declare-fun b!1462198 () Bool)

(assert (=> b!1462198 (= e!822200 (Intermediate!11823 true index!646 x!665))))

(assert (= (and d!155575 c!135082) b!1462198))

(assert (= (and d!155575 (not c!135082)) b!1462192))

(assert (= (and b!1462192 c!135080) b!1462191))

(assert (= (and b!1462192 (not c!135080)) b!1462195))

(assert (= (and d!155575 c!135081) b!1462196))

(assert (= (and d!155575 (not c!135081)) b!1462197))

(assert (= (and b!1462197 res!991070) b!1462190))

(assert (= (and b!1462190 (not res!991069)) b!1462194))

(assert (= (and b!1462194 (not res!991071)) b!1462193))

(declare-fun m!1349981 () Bool)

(assert (=> b!1462195 m!1349981))

(assert (=> b!1462195 m!1349981))

(declare-fun m!1349983 () Bool)

(assert (=> b!1462195 m!1349983))

(declare-fun m!1349985 () Bool)

(assert (=> d!155575 m!1349985))

(assert (=> d!155575 m!1349857))

(declare-fun m!1349987 () Bool)

(assert (=> b!1462193 m!1349987))

(assert (=> b!1462190 m!1349987))

(assert (=> b!1462194 m!1349987))

(assert (=> b!1462037 d!155575))

(declare-fun d!155577 () Bool)

(assert (=> d!155577 (= (validKeyInArray!0 (select (arr!47674 a!2862) j!93)) (and (not (= (select (arr!47674 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47674 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1462044 d!155577))

(declare-fun b!1462199 () Bool)

(declare-fun lt!640427 () SeekEntryResult!11823)

(assert (=> b!1462199 (and (bvsge (index!49686 lt!640427) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640427) (size!48225 a!2862)))))

(declare-fun res!991072 () Bool)

(assert (=> b!1462199 (= res!991072 (= (select (arr!47674 a!2862) (index!49686 lt!640427)) (select (arr!47674 a!2862) j!93)))))

(declare-fun e!822204 () Bool)

(assert (=> b!1462199 (=> res!991072 e!822204)))

(declare-fun e!822201 () Bool)

(assert (=> b!1462199 (= e!822201 e!822204)))

(declare-fun d!155579 () Bool)

(declare-fun e!822203 () Bool)

(assert (=> d!155579 e!822203))

(declare-fun c!135084 () Bool)

(assert (=> d!155579 (= c!135084 (and ((_ is Intermediate!11823) lt!640427) (undefined!12635 lt!640427)))))

(declare-fun e!822205 () SeekEntryResult!11823)

(assert (=> d!155579 (= lt!640427 e!822205)))

(declare-fun c!135085 () Bool)

(assert (=> d!155579 (= c!135085 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!640426 () (_ BitVec 64))

(assert (=> d!155579 (= lt!640426 (select (arr!47674 a!2862) index!646))))

(assert (=> d!155579 (validMask!0 mask!2687)))

(assert (=> d!155579 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!640427)))

(declare-fun b!1462200 () Bool)

(declare-fun e!822202 () SeekEntryResult!11823)

(assert (=> b!1462200 (= e!822202 (Intermediate!11823 false index!646 x!665))))

(declare-fun b!1462201 () Bool)

(assert (=> b!1462201 (= e!822205 e!822202)))

(declare-fun c!135083 () Bool)

(assert (=> b!1462201 (= c!135083 (or (= lt!640426 (select (arr!47674 a!2862) j!93)) (= (bvadd lt!640426 lt!640426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1462202 () Bool)

(assert (=> b!1462202 (and (bvsge (index!49686 lt!640427) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640427) (size!48225 a!2862)))))

(assert (=> b!1462202 (= e!822204 (= (select (arr!47674 a!2862) (index!49686 lt!640427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1462203 () Bool)

(assert (=> b!1462203 (and (bvsge (index!49686 lt!640427) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640427) (size!48225 a!2862)))))

(declare-fun res!991074 () Bool)

(assert (=> b!1462203 (= res!991074 (= (select (arr!47674 a!2862) (index!49686 lt!640427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462203 (=> res!991074 e!822204)))

(declare-fun b!1462204 () Bool)

(assert (=> b!1462204 (= e!822202 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1462205 () Bool)

(assert (=> b!1462205 (= e!822203 (bvsge (x!131464 lt!640427) #b01111111111111111111111111111110))))

(declare-fun b!1462206 () Bool)

(assert (=> b!1462206 (= e!822203 e!822201)))

(declare-fun res!991073 () Bool)

(assert (=> b!1462206 (= res!991073 (and ((_ is Intermediate!11823) lt!640427) (not (undefined!12635 lt!640427)) (bvslt (x!131464 lt!640427) #b01111111111111111111111111111110) (bvsge (x!131464 lt!640427) #b00000000000000000000000000000000) (bvsge (x!131464 lt!640427) x!665)))))

(assert (=> b!1462206 (=> (not res!991073) (not e!822201))))

(declare-fun b!1462207 () Bool)

(assert (=> b!1462207 (= e!822205 (Intermediate!11823 true index!646 x!665))))

(assert (= (and d!155579 c!135085) b!1462207))

(assert (= (and d!155579 (not c!135085)) b!1462201))

(assert (= (and b!1462201 c!135083) b!1462200))

(assert (= (and b!1462201 (not c!135083)) b!1462204))

(assert (= (and d!155579 c!135084) b!1462205))

(assert (= (and d!155579 (not c!135084)) b!1462206))

(assert (= (and b!1462206 res!991073) b!1462199))

(assert (= (and b!1462199 (not res!991072)) b!1462203))

(assert (= (and b!1462203 (not res!991074)) b!1462202))

(assert (=> b!1462204 m!1349981))

(assert (=> b!1462204 m!1349981))

(assert (=> b!1462204 m!1349815))

(declare-fun m!1349989 () Bool)

(assert (=> b!1462204 m!1349989))

(assert (=> d!155579 m!1349831))

(assert (=> d!155579 m!1349857))

(declare-fun m!1349991 () Bool)

(assert (=> b!1462202 m!1349991))

(assert (=> b!1462199 m!1349991))

(assert (=> b!1462203 m!1349991))

(assert (=> b!1462033 d!155579))

(declare-fun b!1462216 () Bool)

(declare-fun e!822213 () Bool)

(declare-fun e!822214 () Bool)

(assert (=> b!1462216 (= e!822213 e!822214)))

(declare-fun lt!640436 () (_ BitVec 64))

(assert (=> b!1462216 (= lt!640436 (select (arr!47674 a!2862) j!93))))

(declare-fun lt!640434 () Unit!49175)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!98779 (_ BitVec 64) (_ BitVec 32)) Unit!49175)

(assert (=> b!1462216 (= lt!640434 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!640436 j!93))))

(declare-fun arrayContainsKey!0 (array!98779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1462216 (arrayContainsKey!0 a!2862 lt!640436 #b00000000000000000000000000000000)))

(declare-fun lt!640435 () Unit!49175)

(assert (=> b!1462216 (= lt!640435 lt!640434)))

(declare-fun res!991079 () Bool)

(assert (=> b!1462216 (= res!991079 (= (seekEntryOrOpen!0 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) (Found!11823 j!93)))))

(assert (=> b!1462216 (=> (not res!991079) (not e!822214))))

(declare-fun b!1462217 () Bool)

(declare-fun call!67773 () Bool)

(assert (=> b!1462217 (= e!822213 call!67773)))

(declare-fun d!155581 () Bool)

(declare-fun res!991080 () Bool)

(declare-fun e!822212 () Bool)

(assert (=> d!155581 (=> res!991080 e!822212)))

(assert (=> d!155581 (= res!991080 (bvsge j!93 (size!48225 a!2862)))))

(assert (=> d!155581 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!822212)))

(declare-fun bm!67770 () Bool)

(assert (=> bm!67770 (= call!67773 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1462218 () Bool)

(assert (=> b!1462218 (= e!822214 call!67773)))

(declare-fun b!1462219 () Bool)

(assert (=> b!1462219 (= e!822212 e!822213)))

(declare-fun c!135088 () Bool)

(assert (=> b!1462219 (= c!135088 (validKeyInArray!0 (select (arr!47674 a!2862) j!93)))))

(assert (= (and d!155581 (not res!991080)) b!1462219))

(assert (= (and b!1462219 c!135088) b!1462216))

(assert (= (and b!1462219 (not c!135088)) b!1462217))

(assert (= (and b!1462216 res!991079) b!1462218))

(assert (= (or b!1462218 b!1462217) bm!67770))

(assert (=> b!1462216 m!1349815))

(declare-fun m!1349993 () Bool)

(assert (=> b!1462216 m!1349993))

(declare-fun m!1349995 () Bool)

(assert (=> b!1462216 m!1349995))

(assert (=> b!1462216 m!1349815))

(assert (=> b!1462216 m!1349861))

(declare-fun m!1349997 () Bool)

(assert (=> bm!67770 m!1349997))

(assert (=> b!1462219 m!1349815))

(assert (=> b!1462219 m!1349815))

(assert (=> b!1462219 m!1349855))

(assert (=> b!1462045 d!155581))

(declare-fun d!155585 () Bool)

(assert (=> d!155585 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!640439 () Unit!49175)

(declare-fun choose!38 (array!98779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49175)

(assert (=> d!155585 (= lt!640439 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155585 (validMask!0 mask!2687)))

(assert (=> d!155585 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!640439)))

(declare-fun bs!42298 () Bool)

(assert (= bs!42298 d!155585))

(assert (=> bs!42298 m!1349833))

(declare-fun m!1349999 () Bool)

(assert (=> bs!42298 m!1349999))

(assert (=> bs!42298 m!1349857))

(assert (=> b!1462045 d!155585))

(declare-fun b!1462220 () Bool)

(declare-fun e!822216 () Bool)

(declare-fun e!822217 () Bool)

(assert (=> b!1462220 (= e!822216 e!822217)))

(declare-fun lt!640442 () (_ BitVec 64))

(assert (=> b!1462220 (= lt!640442 (select (arr!47674 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!640440 () Unit!49175)

(assert (=> b!1462220 (= lt!640440 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!640442 #b00000000000000000000000000000000))))

(assert (=> b!1462220 (arrayContainsKey!0 a!2862 lt!640442 #b00000000000000000000000000000000)))

(declare-fun lt!640441 () Unit!49175)

(assert (=> b!1462220 (= lt!640441 lt!640440)))

(declare-fun res!991081 () Bool)

(assert (=> b!1462220 (= res!991081 (= (seekEntryOrOpen!0 (select (arr!47674 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11823 #b00000000000000000000000000000000)))))

(assert (=> b!1462220 (=> (not res!991081) (not e!822217))))

(declare-fun b!1462221 () Bool)

(declare-fun call!67774 () Bool)

(assert (=> b!1462221 (= e!822216 call!67774)))

(declare-fun d!155587 () Bool)

(declare-fun res!991082 () Bool)

(declare-fun e!822215 () Bool)

(assert (=> d!155587 (=> res!991082 e!822215)))

(assert (=> d!155587 (= res!991082 (bvsge #b00000000000000000000000000000000 (size!48225 a!2862)))))

(assert (=> d!155587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!822215)))

(declare-fun bm!67771 () Bool)

(assert (=> bm!67771 (= call!67774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1462222 () Bool)

(assert (=> b!1462222 (= e!822217 call!67774)))

(declare-fun b!1462223 () Bool)

(assert (=> b!1462223 (= e!822215 e!822216)))

(declare-fun c!135089 () Bool)

(assert (=> b!1462223 (= c!135089 (validKeyInArray!0 (select (arr!47674 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155587 (not res!991082)) b!1462223))

(assert (= (and b!1462223 c!135089) b!1462220))

(assert (= (and b!1462223 (not c!135089)) b!1462221))

(assert (= (and b!1462220 res!991081) b!1462222))

(assert (= (or b!1462222 b!1462221) bm!67771))

(assert (=> b!1462220 m!1349965))

(declare-fun m!1350001 () Bool)

(assert (=> b!1462220 m!1350001))

(declare-fun m!1350003 () Bool)

(assert (=> b!1462220 m!1350003))

(assert (=> b!1462220 m!1349965))

(declare-fun m!1350005 () Bool)

(assert (=> b!1462220 m!1350005))

(declare-fun m!1350007 () Bool)

(assert (=> bm!67771 m!1350007))

(assert (=> b!1462223 m!1349965))

(assert (=> b!1462223 m!1349965))

(assert (=> b!1462223 m!1349971))

(assert (=> b!1462031 d!155587))

(declare-fun b!1462224 () Bool)

(declare-fun lt!640444 () SeekEntryResult!11823)

(assert (=> b!1462224 (and (bvsge (index!49686 lt!640444) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640444) (size!48225 lt!640381)))))

(declare-fun res!991083 () Bool)

(assert (=> b!1462224 (= res!991083 (= (select (arr!47674 lt!640381) (index!49686 lt!640444)) lt!640378))))

(declare-fun e!822221 () Bool)

(assert (=> b!1462224 (=> res!991083 e!822221)))

(declare-fun e!822218 () Bool)

(assert (=> b!1462224 (= e!822218 e!822221)))

(declare-fun d!155589 () Bool)

(declare-fun e!822220 () Bool)

(assert (=> d!155589 e!822220))

(declare-fun c!135091 () Bool)

(assert (=> d!155589 (= c!135091 (and ((_ is Intermediate!11823) lt!640444) (undefined!12635 lt!640444)))))

(declare-fun e!822222 () SeekEntryResult!11823)

(assert (=> d!155589 (= lt!640444 e!822222)))

(declare-fun c!135092 () Bool)

(assert (=> d!155589 (= c!135092 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!640443 () (_ BitVec 64))

(assert (=> d!155589 (= lt!640443 (select (arr!47674 lt!640381) (toIndex!0 lt!640378 mask!2687)))))

(assert (=> d!155589 (validMask!0 mask!2687)))

(assert (=> d!155589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640378 mask!2687) lt!640378 lt!640381 mask!2687) lt!640444)))

(declare-fun b!1462225 () Bool)

(declare-fun e!822219 () SeekEntryResult!11823)

(assert (=> b!1462225 (= e!822219 (Intermediate!11823 false (toIndex!0 lt!640378 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1462226 () Bool)

(assert (=> b!1462226 (= e!822222 e!822219)))

(declare-fun c!135090 () Bool)

(assert (=> b!1462226 (= c!135090 (or (= lt!640443 lt!640378) (= (bvadd lt!640443 lt!640443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1462227 () Bool)

(assert (=> b!1462227 (and (bvsge (index!49686 lt!640444) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640444) (size!48225 lt!640381)))))

(assert (=> b!1462227 (= e!822221 (= (select (arr!47674 lt!640381) (index!49686 lt!640444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1462228 () Bool)

(assert (=> b!1462228 (and (bvsge (index!49686 lt!640444) #b00000000000000000000000000000000) (bvslt (index!49686 lt!640444) (size!48225 lt!640381)))))

(declare-fun res!991085 () Bool)

(assert (=> b!1462228 (= res!991085 (= (select (arr!47674 lt!640381) (index!49686 lt!640444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462228 (=> res!991085 e!822221)))

(declare-fun b!1462229 () Bool)

(assert (=> b!1462229 (= e!822219 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!640378 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!640378 lt!640381 mask!2687))))

(declare-fun b!1462230 () Bool)

(assert (=> b!1462230 (= e!822220 (bvsge (x!131464 lt!640444) #b01111111111111111111111111111110))))

(declare-fun b!1462231 () Bool)

(assert (=> b!1462231 (= e!822220 e!822218)))

(declare-fun res!991084 () Bool)

(assert (=> b!1462231 (= res!991084 (and ((_ is Intermediate!11823) lt!640444) (not (undefined!12635 lt!640444)) (bvslt (x!131464 lt!640444) #b01111111111111111111111111111110) (bvsge (x!131464 lt!640444) #b00000000000000000000000000000000) (bvsge (x!131464 lt!640444) #b00000000000000000000000000000000)))))

(assert (=> b!1462231 (=> (not res!991084) (not e!822218))))

(declare-fun b!1462232 () Bool)

(assert (=> b!1462232 (= e!822222 (Intermediate!11823 true (toIndex!0 lt!640378 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155589 c!135092) b!1462232))

(assert (= (and d!155589 (not c!135092)) b!1462226))

(assert (= (and b!1462226 c!135090) b!1462225))

(assert (= (and b!1462226 (not c!135090)) b!1462229))

(assert (= (and d!155589 c!135091) b!1462230))

(assert (= (and d!155589 (not c!135091)) b!1462231))

(assert (= (and b!1462231 res!991084) b!1462224))

(assert (= (and b!1462224 (not res!991083)) b!1462228))

(assert (= (and b!1462228 (not res!991085)) b!1462227))

(assert (=> b!1462229 m!1349847))

(declare-fun m!1350009 () Bool)

(assert (=> b!1462229 m!1350009))

(assert (=> b!1462229 m!1350009))

(declare-fun m!1350011 () Bool)

(assert (=> b!1462229 m!1350011))

(assert (=> d!155589 m!1349847))

(declare-fun m!1350013 () Bool)

(assert (=> d!155589 m!1350013))

(assert (=> d!155589 m!1349857))

(declare-fun m!1350015 () Bool)

(assert (=> b!1462227 m!1350015))

(assert (=> b!1462224 m!1350015))

(assert (=> b!1462228 m!1350015))

(assert (=> b!1462030 d!155589))

(declare-fun d!155591 () Bool)

(declare-fun lt!640446 () (_ BitVec 32))

(declare-fun lt!640445 () (_ BitVec 32))

(assert (=> d!155591 (= lt!640446 (bvmul (bvxor lt!640445 (bvlshr lt!640445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155591 (= lt!640445 ((_ extract 31 0) (bvand (bvxor lt!640378 (bvlshr lt!640378 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155591 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!991068 (let ((h!35522 ((_ extract 31 0) (bvand (bvxor lt!640378 (bvlshr lt!640378 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!131468 (bvmul (bvxor h!35522 (bvlshr h!35522 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!131468 (bvlshr x!131468 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!991068 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!991068 #b00000000000000000000000000000000))))))

(assert (=> d!155591 (= (toIndex!0 lt!640378 mask!2687) (bvand (bvxor lt!640446 (bvlshr lt!640446 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1462030 d!155591))

(declare-fun b!1462281 () Bool)

(declare-fun e!822249 () SeekEntryResult!11823)

(assert (=> b!1462281 (= e!822249 (MissingVacant!11823 intermediateAfterIndex!19))))

(declare-fun b!1462282 () Bool)

(declare-fun e!822251 () SeekEntryResult!11823)

(declare-fun e!822250 () SeekEntryResult!11823)

(assert (=> b!1462282 (= e!822251 e!822250)))

(declare-fun c!135112 () Bool)

(declare-fun lt!640465 () (_ BitVec 64))

(assert (=> b!1462282 (= c!135112 (= lt!640465 lt!640378))))

(declare-fun b!1462283 () Bool)

(assert (=> b!1462283 (= e!822249 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!640378 lt!640381 mask!2687))))

(declare-fun b!1462284 () Bool)

(assert (=> b!1462284 (= e!822251 Undefined!11823)))

(declare-fun b!1462285 () Bool)

(assert (=> b!1462285 (= e!822250 (Found!11823 index!646))))

(declare-fun lt!640466 () SeekEntryResult!11823)

(declare-fun d!155593 () Bool)

(assert (=> d!155593 (and (or ((_ is Undefined!11823) lt!640466) (not ((_ is Found!11823) lt!640466)) (and (bvsge (index!49685 lt!640466) #b00000000000000000000000000000000) (bvslt (index!49685 lt!640466) (size!48225 lt!640381)))) (or ((_ is Undefined!11823) lt!640466) ((_ is Found!11823) lt!640466) (not ((_ is MissingVacant!11823) lt!640466)) (not (= (index!49687 lt!640466) intermediateAfterIndex!19)) (and (bvsge (index!49687 lt!640466) #b00000000000000000000000000000000) (bvslt (index!49687 lt!640466) (size!48225 lt!640381)))) (or ((_ is Undefined!11823) lt!640466) (ite ((_ is Found!11823) lt!640466) (= (select (arr!47674 lt!640381) (index!49685 lt!640466)) lt!640378) (and ((_ is MissingVacant!11823) lt!640466) (= (index!49687 lt!640466) intermediateAfterIndex!19) (= (select (arr!47674 lt!640381) (index!49687 lt!640466)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155593 (= lt!640466 e!822251)))

(declare-fun c!135113 () Bool)

(assert (=> d!155593 (= c!135113 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155593 (= lt!640465 (select (arr!47674 lt!640381) index!646))))

(assert (=> d!155593 (validMask!0 mask!2687)))

(assert (=> d!155593 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640378 lt!640381 mask!2687) lt!640466)))

(declare-fun b!1462286 () Bool)

(declare-fun c!135111 () Bool)

(assert (=> b!1462286 (= c!135111 (= lt!640465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462286 (= e!822250 e!822249)))

(assert (= (and d!155593 c!135113) b!1462284))

(assert (= (and d!155593 (not c!135113)) b!1462282))

(assert (= (and b!1462282 c!135112) b!1462285))

(assert (= (and b!1462282 (not c!135112)) b!1462286))

(assert (= (and b!1462286 c!135111) b!1462281))

(assert (= (and b!1462286 (not c!135111)) b!1462283))

(assert (=> b!1462283 m!1349981))

(assert (=> b!1462283 m!1349981))

(declare-fun m!1350033 () Bool)

(assert (=> b!1462283 m!1350033))

(declare-fun m!1350035 () Bool)

(assert (=> d!155593 m!1350035))

(declare-fun m!1350037 () Bool)

(assert (=> d!155593 m!1350037))

(assert (=> d!155593 m!1349985))

(assert (=> d!155593 m!1349857))

(assert (=> b!1462043 d!155593))

(declare-fun lt!640493 () SeekEntryResult!11823)

(declare-fun e!822277 () SeekEntryResult!11823)

(declare-fun b!1462329 () Bool)

(assert (=> b!1462329 (= e!822277 (seekKeyOrZeroReturnVacant!0 (x!131464 lt!640493) (index!49686 lt!640493) (index!49686 lt!640493) lt!640378 lt!640381 mask!2687))))

(declare-fun b!1462330 () Bool)

(assert (=> b!1462330 (= e!822277 (MissingZero!11823 (index!49686 lt!640493)))))

(declare-fun b!1462331 () Bool)

(declare-fun e!822278 () SeekEntryResult!11823)

(assert (=> b!1462331 (= e!822278 (Found!11823 (index!49686 lt!640493)))))

(declare-fun b!1462332 () Bool)

(declare-fun c!135134 () Bool)

(declare-fun lt!640491 () (_ BitVec 64))

(assert (=> b!1462332 (= c!135134 (= lt!640491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462332 (= e!822278 e!822277)))

(declare-fun b!1462333 () Bool)

(declare-fun e!822276 () SeekEntryResult!11823)

(assert (=> b!1462333 (= e!822276 e!822278)))

(assert (=> b!1462333 (= lt!640491 (select (arr!47674 lt!640381) (index!49686 lt!640493)))))

(declare-fun c!135132 () Bool)

(assert (=> b!1462333 (= c!135132 (= lt!640491 lt!640378))))

(declare-fun b!1462334 () Bool)

(assert (=> b!1462334 (= e!822276 Undefined!11823)))

(declare-fun d!155603 () Bool)

(declare-fun lt!640492 () SeekEntryResult!11823)

(assert (=> d!155603 (and (or ((_ is Undefined!11823) lt!640492) (not ((_ is Found!11823) lt!640492)) (and (bvsge (index!49685 lt!640492) #b00000000000000000000000000000000) (bvslt (index!49685 lt!640492) (size!48225 lt!640381)))) (or ((_ is Undefined!11823) lt!640492) ((_ is Found!11823) lt!640492) (not ((_ is MissingZero!11823) lt!640492)) (and (bvsge (index!49684 lt!640492) #b00000000000000000000000000000000) (bvslt (index!49684 lt!640492) (size!48225 lt!640381)))) (or ((_ is Undefined!11823) lt!640492) ((_ is Found!11823) lt!640492) ((_ is MissingZero!11823) lt!640492) (not ((_ is MissingVacant!11823) lt!640492)) (and (bvsge (index!49687 lt!640492) #b00000000000000000000000000000000) (bvslt (index!49687 lt!640492) (size!48225 lt!640381)))) (or ((_ is Undefined!11823) lt!640492) (ite ((_ is Found!11823) lt!640492) (= (select (arr!47674 lt!640381) (index!49685 lt!640492)) lt!640378) (ite ((_ is MissingZero!11823) lt!640492) (= (select (arr!47674 lt!640381) (index!49684 lt!640492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11823) lt!640492) (= (select (arr!47674 lt!640381) (index!49687 lt!640492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155603 (= lt!640492 e!822276)))

(declare-fun c!135133 () Bool)

(assert (=> d!155603 (= c!135133 (and ((_ is Intermediate!11823) lt!640493) (undefined!12635 lt!640493)))))

(assert (=> d!155603 (= lt!640493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640378 mask!2687) lt!640378 lt!640381 mask!2687))))

(assert (=> d!155603 (validMask!0 mask!2687)))

(assert (=> d!155603 (= (seekEntryOrOpen!0 lt!640378 lt!640381 mask!2687) lt!640492)))

(assert (= (and d!155603 c!135133) b!1462334))

(assert (= (and d!155603 (not c!135133)) b!1462333))

(assert (= (and b!1462333 c!135132) b!1462331))

(assert (= (and b!1462333 (not c!135132)) b!1462332))

(assert (= (and b!1462332 c!135134) b!1462330))

(assert (= (and b!1462332 (not c!135134)) b!1462329))

(declare-fun m!1350055 () Bool)

(assert (=> b!1462329 m!1350055))

(declare-fun m!1350057 () Bool)

(assert (=> b!1462333 m!1350057))

(declare-fun m!1350059 () Bool)

(assert (=> d!155603 m!1350059))

(assert (=> d!155603 m!1349847))

(assert (=> d!155603 m!1349849))

(assert (=> d!155603 m!1349857))

(declare-fun m!1350061 () Bool)

(assert (=> d!155603 m!1350061))

(declare-fun m!1350063 () Bool)

(assert (=> d!155603 m!1350063))

(assert (=> d!155603 m!1349847))

(assert (=> b!1462043 d!155603))

(declare-fun e!822285 () SeekEntryResult!11823)

(declare-fun b!1462344 () Bool)

(declare-fun lt!640500 () SeekEntryResult!11823)

(assert (=> b!1462344 (= e!822285 (seekKeyOrZeroReturnVacant!0 (x!131464 lt!640500) (index!49686 lt!640500) (index!49686 lt!640500) (select (arr!47674 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1462345 () Bool)

(assert (=> b!1462345 (= e!822285 (MissingZero!11823 (index!49686 lt!640500)))))

(declare-fun b!1462346 () Bool)

(declare-fun e!822286 () SeekEntryResult!11823)

(assert (=> b!1462346 (= e!822286 (Found!11823 (index!49686 lt!640500)))))

(declare-fun b!1462347 () Bool)

(declare-fun c!135140 () Bool)

(declare-fun lt!640498 () (_ BitVec 64))

(assert (=> b!1462347 (= c!135140 (= lt!640498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462347 (= e!822286 e!822285)))

(declare-fun b!1462348 () Bool)

(declare-fun e!822284 () SeekEntryResult!11823)

(assert (=> b!1462348 (= e!822284 e!822286)))

(assert (=> b!1462348 (= lt!640498 (select (arr!47674 a!2862) (index!49686 lt!640500)))))

(declare-fun c!135138 () Bool)

(assert (=> b!1462348 (= c!135138 (= lt!640498 (select (arr!47674 a!2862) j!93)))))

(declare-fun b!1462349 () Bool)

(assert (=> b!1462349 (= e!822284 Undefined!11823)))

(declare-fun d!155611 () Bool)

(declare-fun lt!640499 () SeekEntryResult!11823)

(assert (=> d!155611 (and (or ((_ is Undefined!11823) lt!640499) (not ((_ is Found!11823) lt!640499)) (and (bvsge (index!49685 lt!640499) #b00000000000000000000000000000000) (bvslt (index!49685 lt!640499) (size!48225 a!2862)))) (or ((_ is Undefined!11823) lt!640499) ((_ is Found!11823) lt!640499) (not ((_ is MissingZero!11823) lt!640499)) (and (bvsge (index!49684 lt!640499) #b00000000000000000000000000000000) (bvslt (index!49684 lt!640499) (size!48225 a!2862)))) (or ((_ is Undefined!11823) lt!640499) ((_ is Found!11823) lt!640499) ((_ is MissingZero!11823) lt!640499) (not ((_ is MissingVacant!11823) lt!640499)) (and (bvsge (index!49687 lt!640499) #b00000000000000000000000000000000) (bvslt (index!49687 lt!640499) (size!48225 a!2862)))) (or ((_ is Undefined!11823) lt!640499) (ite ((_ is Found!11823) lt!640499) (= (select (arr!47674 a!2862) (index!49685 lt!640499)) (select (arr!47674 a!2862) j!93)) (ite ((_ is MissingZero!11823) lt!640499) (= (select (arr!47674 a!2862) (index!49684 lt!640499)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11823) lt!640499) (= (select (arr!47674 a!2862) (index!49687 lt!640499)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155611 (= lt!640499 e!822284)))

(declare-fun c!135139 () Bool)

(assert (=> d!155611 (= c!135139 (and ((_ is Intermediate!11823) lt!640500) (undefined!12635 lt!640500)))))

(assert (=> d!155611 (= lt!640500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155611 (validMask!0 mask!2687)))

(assert (=> d!155611 (= (seekEntryOrOpen!0 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!640499)))

(assert (= (and d!155611 c!135139) b!1462349))

(assert (= (and d!155611 (not c!135139)) b!1462348))

(assert (= (and b!1462348 c!135138) b!1462346))

(assert (= (and b!1462348 (not c!135138)) b!1462347))

(assert (= (and b!1462347 c!135140) b!1462345))

(assert (= (and b!1462347 (not c!135140)) b!1462344))

(assert (=> b!1462344 m!1349815))

(declare-fun m!1350073 () Bool)

(assert (=> b!1462344 m!1350073))

(declare-fun m!1350075 () Bool)

(assert (=> b!1462348 m!1350075))

(declare-fun m!1350079 () Bool)

(assert (=> d!155611 m!1350079))

(assert (=> d!155611 m!1349821))

(assert (=> d!155611 m!1349815))

(assert (=> d!155611 m!1349823))

(assert (=> d!155611 m!1349857))

(declare-fun m!1350081 () Bool)

(assert (=> d!155611 m!1350081))

(declare-fun m!1350083 () Bool)

(assert (=> d!155611 m!1350083))

(assert (=> d!155611 m!1349815))

(assert (=> d!155611 m!1349821))

(assert (=> b!1462042 d!155611))

(check-sat (not bm!67767) (not bm!67771) (not d!155579) (not d!155593) (not b!1462216) (not b!1462158) (not b!1462161) (not d!155575) (not d!155603) (not d!155585) (not b!1462229) (not d!155611) (not d!155589) (not bm!67770) (not b!1462160) (not b!1462204) (not d!155571) (not b!1462223) (not b!1462220) (not b!1462344) (not b!1462186) (not b!1462195) (not b!1462219) (not b!1462329) (not b!1462283))
(check-sat)
