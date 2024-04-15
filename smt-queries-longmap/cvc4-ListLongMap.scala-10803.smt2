; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126358 () Bool)

(assert start!126358)

(declare-fun res!1007329 () Bool)

(declare-fun e!830973 () Bool)

(assert (=> start!126358 (=> (not res!1007329) (not e!830973))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126358 (= res!1007329 (validMask!0 mask!2687))))

(assert (=> start!126358 e!830973))

(assert (=> start!126358 true))

(declare-datatypes ((array!99375 0))(
  ( (array!99376 (arr!47966 (Array (_ BitVec 32) (_ BitVec 64))) (size!48518 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99375)

(declare-fun array_inv!37199 (array!99375) Bool)

(assert (=> start!126358 (array_inv!37199 a!2862)))

(declare-datatypes ((SeekEntryResult!12231 0))(
  ( (MissingZero!12231 (index!51316 (_ BitVec 32))) (Found!12231 (index!51317 (_ BitVec 32))) (Intermediate!12231 (undefined!13043 Bool) (index!51318 (_ BitVec 32)) (x!132891 (_ BitVec 32))) (Undefined!12231) (MissingVacant!12231 (index!51319 (_ BitVec 32))) )
))
(declare-fun lt!646706 () SeekEntryResult!12231)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646707 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!830977 () Bool)

(declare-fun b!1481861 () Bool)

(declare-fun lt!646709 () array!99375)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99375 (_ BitVec 32)) SeekEntryResult!12231)

(assert (=> b!1481861 (= e!830977 (= lt!646706 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646707 lt!646709 mask!2687)))))

(declare-fun b!1481862 () Bool)

(declare-fun e!830972 () Bool)

(declare-fun e!830975 () Bool)

(assert (=> b!1481862 (= e!830972 e!830975)))

(declare-fun res!1007326 () Bool)

(assert (=> b!1481862 (=> (not res!1007326) (not e!830975))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481862 (= res!1007326 (= lt!646706 (Intermediate!12231 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481862 (= lt!646706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646707 mask!2687) lt!646707 lt!646709 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481862 (= lt!646707 (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481863 () Bool)

(declare-fun res!1007321 () Bool)

(assert (=> b!1481863 (=> (not res!1007321) (not e!830973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481863 (= res!1007321 (validKeyInArray!0 (select (arr!47966 a!2862) j!93)))))

(declare-fun b!1481864 () Bool)

(declare-fun res!1007330 () Bool)

(assert (=> b!1481864 (=> (not res!1007330) (not e!830973))))

(declare-datatypes ((List!34545 0))(
  ( (Nil!34542) (Cons!34541 (h!35912 (_ BitVec 64)) (t!49231 List!34545)) )
))
(declare-fun arrayNoDuplicates!0 (array!99375 (_ BitVec 32) List!34545) Bool)

(assert (=> b!1481864 (= res!1007330 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34542))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1481865 () Bool)

(declare-fun e!830978 () Bool)

(assert (=> b!1481865 (= e!830978 (and (or (= (select (arr!47966 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47966 a!2862) intermediateBeforeIndex!19) (select (arr!47966 a!2862) j!93))) (or (and (= (select (arr!47966 a!2862) index!646) (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47966 a!2862) index!646) (select (arr!47966 a!2862) j!93))) (= (select (arr!47966 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481866 () Bool)

(declare-fun res!1007327 () Bool)

(assert (=> b!1481866 (=> (not res!1007327) (not e!830972))))

(declare-fun lt!646708 () SeekEntryResult!12231)

(assert (=> b!1481866 (= res!1007327 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646708))))

(declare-fun b!1481867 () Bool)

(assert (=> b!1481867 (= e!830975 (not true))))

(assert (=> b!1481867 e!830978))

(declare-fun res!1007324 () Bool)

(assert (=> b!1481867 (=> (not res!1007324) (not e!830978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99375 (_ BitVec 32)) Bool)

(assert (=> b!1481867 (= res!1007324 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49643 0))(
  ( (Unit!49644) )
))
(declare-fun lt!646705 () Unit!49643)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49643)

(assert (=> b!1481867 (= lt!646705 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481868 () Bool)

(declare-fun res!1007332 () Bool)

(assert (=> b!1481868 (=> (not res!1007332) (not e!830973))))

(assert (=> b!1481868 (= res!1007332 (and (= (size!48518 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48518 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48518 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481869 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99375 (_ BitVec 32)) SeekEntryResult!12231)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99375 (_ BitVec 32)) SeekEntryResult!12231)

(assert (=> b!1481869 (= e!830977 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646707 lt!646709 mask!2687) (seekEntryOrOpen!0 lt!646707 lt!646709 mask!2687)))))

(declare-fun b!1481870 () Bool)

(declare-fun e!830974 () Bool)

(assert (=> b!1481870 (= e!830973 e!830974)))

(declare-fun res!1007328 () Bool)

(assert (=> b!1481870 (=> (not res!1007328) (not e!830974))))

(assert (=> b!1481870 (= res!1007328 (= (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481870 (= lt!646709 (array!99376 (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48518 a!2862)))))

(declare-fun b!1481871 () Bool)

(declare-fun res!1007319 () Bool)

(assert (=> b!1481871 (=> (not res!1007319) (not e!830975))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481871 (= res!1007319 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481872 () Bool)

(declare-fun res!1007331 () Bool)

(assert (=> b!1481872 (=> (not res!1007331) (not e!830973))))

(assert (=> b!1481872 (= res!1007331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481873 () Bool)

(declare-fun res!1007323 () Bool)

(assert (=> b!1481873 (=> (not res!1007323) (not e!830978))))

(assert (=> b!1481873 (= res!1007323 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) (Found!12231 j!93)))))

(declare-fun b!1481874 () Bool)

(assert (=> b!1481874 (= e!830974 e!830972)))

(declare-fun res!1007320 () Bool)

(assert (=> b!1481874 (=> (not res!1007320) (not e!830972))))

(assert (=> b!1481874 (= res!1007320 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646708))))

(assert (=> b!1481874 (= lt!646708 (Intermediate!12231 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481875 () Bool)

(declare-fun res!1007322 () Bool)

(assert (=> b!1481875 (=> (not res!1007322) (not e!830975))))

(assert (=> b!1481875 (= res!1007322 e!830977)))

(declare-fun c!136795 () Bool)

(assert (=> b!1481875 (= c!136795 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481876 () Bool)

(declare-fun res!1007325 () Bool)

(assert (=> b!1481876 (=> (not res!1007325) (not e!830973))))

(assert (=> b!1481876 (= res!1007325 (validKeyInArray!0 (select (arr!47966 a!2862) i!1006)))))

(declare-fun b!1481877 () Bool)

(declare-fun res!1007318 () Bool)

(assert (=> b!1481877 (=> (not res!1007318) (not e!830973))))

(assert (=> b!1481877 (= res!1007318 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48518 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48518 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48518 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126358 res!1007329) b!1481868))

(assert (= (and b!1481868 res!1007332) b!1481876))

(assert (= (and b!1481876 res!1007325) b!1481863))

(assert (= (and b!1481863 res!1007321) b!1481872))

(assert (= (and b!1481872 res!1007331) b!1481864))

(assert (= (and b!1481864 res!1007330) b!1481877))

(assert (= (and b!1481877 res!1007318) b!1481870))

(assert (= (and b!1481870 res!1007328) b!1481874))

(assert (= (and b!1481874 res!1007320) b!1481866))

(assert (= (and b!1481866 res!1007327) b!1481862))

(assert (= (and b!1481862 res!1007326) b!1481875))

(assert (= (and b!1481875 c!136795) b!1481861))

(assert (= (and b!1481875 (not c!136795)) b!1481869))

(assert (= (and b!1481875 res!1007322) b!1481871))

(assert (= (and b!1481871 res!1007319) b!1481867))

(assert (= (and b!1481867 res!1007324) b!1481873))

(assert (= (and b!1481873 res!1007323) b!1481865))

(declare-fun m!1367051 () Bool)

(assert (=> start!126358 m!1367051))

(declare-fun m!1367053 () Bool)

(assert (=> start!126358 m!1367053))

(declare-fun m!1367055 () Bool)

(assert (=> b!1481873 m!1367055))

(assert (=> b!1481873 m!1367055))

(declare-fun m!1367057 () Bool)

(assert (=> b!1481873 m!1367057))

(declare-fun m!1367059 () Bool)

(assert (=> b!1481864 m!1367059))

(declare-fun m!1367061 () Bool)

(assert (=> b!1481867 m!1367061))

(declare-fun m!1367063 () Bool)

(assert (=> b!1481867 m!1367063))

(declare-fun m!1367065 () Bool)

(assert (=> b!1481870 m!1367065))

(declare-fun m!1367067 () Bool)

(assert (=> b!1481870 m!1367067))

(assert (=> b!1481863 m!1367055))

(assert (=> b!1481863 m!1367055))

(declare-fun m!1367069 () Bool)

(assert (=> b!1481863 m!1367069))

(assert (=> b!1481865 m!1367065))

(declare-fun m!1367071 () Bool)

(assert (=> b!1481865 m!1367071))

(declare-fun m!1367073 () Bool)

(assert (=> b!1481865 m!1367073))

(declare-fun m!1367075 () Bool)

(assert (=> b!1481865 m!1367075))

(assert (=> b!1481865 m!1367055))

(assert (=> b!1481866 m!1367055))

(assert (=> b!1481866 m!1367055))

(declare-fun m!1367077 () Bool)

(assert (=> b!1481866 m!1367077))

(declare-fun m!1367079 () Bool)

(assert (=> b!1481862 m!1367079))

(assert (=> b!1481862 m!1367079))

(declare-fun m!1367081 () Bool)

(assert (=> b!1481862 m!1367081))

(assert (=> b!1481862 m!1367065))

(declare-fun m!1367083 () Bool)

(assert (=> b!1481862 m!1367083))

(declare-fun m!1367085 () Bool)

(assert (=> b!1481869 m!1367085))

(declare-fun m!1367087 () Bool)

(assert (=> b!1481869 m!1367087))

(assert (=> b!1481874 m!1367055))

(assert (=> b!1481874 m!1367055))

(declare-fun m!1367089 () Bool)

(assert (=> b!1481874 m!1367089))

(assert (=> b!1481874 m!1367089))

(assert (=> b!1481874 m!1367055))

(declare-fun m!1367091 () Bool)

(assert (=> b!1481874 m!1367091))

(declare-fun m!1367093 () Bool)

(assert (=> b!1481861 m!1367093))

(declare-fun m!1367095 () Bool)

(assert (=> b!1481876 m!1367095))

(assert (=> b!1481876 m!1367095))

(declare-fun m!1367097 () Bool)

(assert (=> b!1481876 m!1367097))

(declare-fun m!1367099 () Bool)

(assert (=> b!1481872 m!1367099))

(push 1)

(assert (not b!1481863))

(assert (not b!1481873))

(assert (not b!1481874))

(assert (not b!1481872))

(assert (not b!1481876))

(assert (not b!1481862))

(assert (not b!1481866))

(assert (not b!1481867))

(assert (not start!126358))

(assert (not b!1481869))

(assert (not b!1481864))

(assert (not b!1481861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

