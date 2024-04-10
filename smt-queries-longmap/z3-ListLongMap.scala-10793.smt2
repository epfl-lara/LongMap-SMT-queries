; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126258 () Bool)

(assert start!126258)

(declare-fun b!1480019 () Bool)

(declare-fun res!1005872 () Bool)

(declare-fun e!830145 () Bool)

(assert (=> b!1480019 (=> (not res!1005872) (not e!830145))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99364 0))(
  ( (array!99365 (arr!47961 (Array (_ BitVec 32) (_ BitVec 64))) (size!48511 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99364)

(assert (=> b!1480019 (= res!1005872 (and (= (size!48511 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48511 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48511 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480020 () Bool)

(declare-fun e!830141 () Bool)

(declare-fun e!830142 () Bool)

(assert (=> b!1480020 (= e!830141 e!830142)))

(declare-fun res!1005869 () Bool)

(assert (=> b!1480020 (=> (not res!1005869) (not e!830142))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12201 0))(
  ( (MissingZero!12201 (index!51196 (_ BitVec 32))) (Found!12201 (index!51197 (_ BitVec 32))) (Intermediate!12201 (undefined!13013 Bool) (index!51198 (_ BitVec 32)) (x!132776 (_ BitVec 32))) (Undefined!12201) (MissingVacant!12201 (index!51199 (_ BitVec 32))) )
))
(declare-fun lt!646257 () SeekEntryResult!12201)

(assert (=> b!1480020 (= res!1005869 (= lt!646257 (Intermediate!12201 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646263 () (_ BitVec 64))

(declare-fun lt!646262 () array!99364)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99364 (_ BitVec 32)) SeekEntryResult!12201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480020 (= lt!646257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646263 mask!2687) lt!646263 lt!646262 mask!2687))))

(assert (=> b!1480020 (= lt!646263 (select (store (arr!47961 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480021 () Bool)

(declare-fun e!830146 () Bool)

(assert (=> b!1480021 (= e!830145 e!830146)))

(declare-fun res!1005868 () Bool)

(assert (=> b!1480021 (=> (not res!1005868) (not e!830146))))

(assert (=> b!1480021 (= res!1005868 (= (select (store (arr!47961 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480021 (= lt!646262 (array!99365 (store (arr!47961 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48511 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!830147 () Bool)

(declare-fun b!1480022 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1480022 (= e!830147 (= lt!646257 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646263 lt!646262 mask!2687)))))

(declare-fun b!1480023 () Bool)

(declare-fun res!1005866 () Bool)

(assert (=> b!1480023 (=> (not res!1005866) (not e!830141))))

(declare-fun lt!646258 () SeekEntryResult!12201)

(assert (=> b!1480023 (= res!1005866 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47961 a!2862) j!93) a!2862 mask!2687) lt!646258))))

(declare-fun b!1480024 () Bool)

(declare-fun res!1005883 () Bool)

(assert (=> b!1480024 (=> (not res!1005883) (not e!830145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480024 (= res!1005883 (validKeyInArray!0 (select (arr!47961 a!2862) i!1006)))))

(declare-fun b!1480026 () Bool)

(declare-fun res!1005867 () Bool)

(assert (=> b!1480026 (=> (not res!1005867) (not e!830145))))

(declare-datatypes ((List!34462 0))(
  ( (Nil!34459) (Cons!34458 (h!35826 (_ BitVec 64)) (t!49156 List!34462)) )
))
(declare-fun arrayNoDuplicates!0 (array!99364 (_ BitVec 32) List!34462) Bool)

(assert (=> b!1480026 (= res!1005867 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34459))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!830139 () Bool)

(declare-fun b!1480027 () Bool)

(assert (=> b!1480027 (= e!830139 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480028 () Bool)

(declare-fun e!830140 () Bool)

(assert (=> b!1480028 (= e!830140 true)))

(declare-fun lt!646256 () SeekEntryResult!12201)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99364 (_ BitVec 32)) SeekEntryResult!12201)

(assert (=> b!1480028 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646263 lt!646262 mask!2687) lt!646256)))

(declare-datatypes ((Unit!49742 0))(
  ( (Unit!49743) )
))
(declare-fun lt!646260 () Unit!49742)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49742)

(assert (=> b!1480028 (= lt!646260 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1480029 () Bool)

(declare-fun e!830143 () Bool)

(declare-fun e!830138 () Bool)

(assert (=> b!1480029 (= e!830143 e!830138)))

(declare-fun res!1005875 () Bool)

(assert (=> b!1480029 (=> res!1005875 e!830138)))

(assert (=> b!1480029 (= res!1005875 (or (and (= (select (arr!47961 a!2862) index!646) (select (store (arr!47961 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47961 a!2862) index!646) (select (arr!47961 a!2862) j!93))) (not (= (select (arr!47961 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480030 () Bool)

(declare-fun res!1005878 () Bool)

(assert (=> b!1480030 (=> res!1005878 e!830140)))

(assert (=> b!1480030 (= res!1005878 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47961 a!2862) j!93) a!2862 mask!2687) lt!646256)))))

(declare-fun b!1480031 () Bool)

(declare-fun res!1005881 () Bool)

(assert (=> b!1480031 (=> (not res!1005881) (not e!830145))))

(assert (=> b!1480031 (= res!1005881 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48511 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48511 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48511 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480032 () Bool)

(declare-fun res!1005880 () Bool)

(assert (=> b!1480032 (=> (not res!1005880) (not e!830145))))

(assert (=> b!1480032 (= res!1005880 (validKeyInArray!0 (select (arr!47961 a!2862) j!93)))))

(declare-fun b!1480033 () Bool)

(assert (=> b!1480033 (= e!830142 (not e!830140))))

(declare-fun res!1005882 () Bool)

(assert (=> b!1480033 (=> res!1005882 e!830140)))

(assert (=> b!1480033 (= res!1005882 (or (and (= (select (arr!47961 a!2862) index!646) (select (store (arr!47961 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47961 a!2862) index!646) (select (arr!47961 a!2862) j!93))) (not (= (select (arr!47961 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47961 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480033 e!830143))

(declare-fun res!1005876 () Bool)

(assert (=> b!1480033 (=> (not res!1005876) (not e!830143))))

(declare-fun lt!646259 () SeekEntryResult!12201)

(assert (=> b!1480033 (= res!1005876 (and (= lt!646259 lt!646256) (or (= (select (arr!47961 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47961 a!2862) intermediateBeforeIndex!19) (select (arr!47961 a!2862) j!93)))))))

(assert (=> b!1480033 (= lt!646256 (Found!12201 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99364 (_ BitVec 32)) SeekEntryResult!12201)

(assert (=> b!1480033 (= lt!646259 (seekEntryOrOpen!0 (select (arr!47961 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99364 (_ BitVec 32)) Bool)

(assert (=> b!1480033 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646261 () Unit!49742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49742)

(assert (=> b!1480033 (= lt!646261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480034 () Bool)

(assert (=> b!1480034 (= e!830147 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646263 lt!646262 mask!2687) (seekEntryOrOpen!0 lt!646263 lt!646262 mask!2687)))))

(declare-fun b!1480035 () Bool)

(assert (=> b!1480035 (= e!830146 e!830141)))

(declare-fun res!1005871 () Bool)

(assert (=> b!1480035 (=> (not res!1005871) (not e!830141))))

(assert (=> b!1480035 (= res!1005871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47961 a!2862) j!93) mask!2687) (select (arr!47961 a!2862) j!93) a!2862 mask!2687) lt!646258))))

(assert (=> b!1480035 (= lt!646258 (Intermediate!12201 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480036 () Bool)

(declare-fun res!1005879 () Bool)

(assert (=> b!1480036 (=> (not res!1005879) (not e!830142))))

(assert (=> b!1480036 (= res!1005879 e!830147)))

(declare-fun c!136596 () Bool)

(assert (=> b!1480036 (= c!136596 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1005874 () Bool)

(assert (=> start!126258 (=> (not res!1005874) (not e!830145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126258 (= res!1005874 (validMask!0 mask!2687))))

(assert (=> start!126258 e!830145))

(assert (=> start!126258 true))

(declare-fun array_inv!36989 (array!99364) Bool)

(assert (=> start!126258 (array_inv!36989 a!2862)))

(declare-fun b!1480025 () Bool)

(declare-fun res!1005870 () Bool)

(assert (=> b!1480025 (=> (not res!1005870) (not e!830142))))

(assert (=> b!1480025 (= res!1005870 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480037 () Bool)

(assert (=> b!1480037 (= e!830138 e!830139)))

(declare-fun res!1005877 () Bool)

(assert (=> b!1480037 (=> (not res!1005877) (not e!830139))))

(assert (=> b!1480037 (= res!1005877 (= lt!646259 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47961 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480038 () Bool)

(declare-fun res!1005873 () Bool)

(assert (=> b!1480038 (=> (not res!1005873) (not e!830145))))

(assert (=> b!1480038 (= res!1005873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126258 res!1005874) b!1480019))

(assert (= (and b!1480019 res!1005872) b!1480024))

(assert (= (and b!1480024 res!1005883) b!1480032))

(assert (= (and b!1480032 res!1005880) b!1480038))

(assert (= (and b!1480038 res!1005873) b!1480026))

(assert (= (and b!1480026 res!1005867) b!1480031))

(assert (= (and b!1480031 res!1005881) b!1480021))

(assert (= (and b!1480021 res!1005868) b!1480035))

(assert (= (and b!1480035 res!1005871) b!1480023))

(assert (= (and b!1480023 res!1005866) b!1480020))

(assert (= (and b!1480020 res!1005869) b!1480036))

(assert (= (and b!1480036 c!136596) b!1480022))

(assert (= (and b!1480036 (not c!136596)) b!1480034))

(assert (= (and b!1480036 res!1005879) b!1480025))

(assert (= (and b!1480025 res!1005870) b!1480033))

(assert (= (and b!1480033 res!1005876) b!1480029))

(assert (= (and b!1480029 (not res!1005875)) b!1480037))

(assert (= (and b!1480037 res!1005877) b!1480027))

(assert (= (and b!1480033 (not res!1005882)) b!1480030))

(assert (= (and b!1480030 (not res!1005878)) b!1480028))

(declare-fun m!1365849 () Bool)

(assert (=> b!1480023 m!1365849))

(assert (=> b!1480023 m!1365849))

(declare-fun m!1365851 () Bool)

(assert (=> b!1480023 m!1365851))

(declare-fun m!1365853 () Bool)

(assert (=> b!1480038 m!1365853))

(declare-fun m!1365855 () Bool)

(assert (=> b!1480034 m!1365855))

(declare-fun m!1365857 () Bool)

(assert (=> b!1480034 m!1365857))

(declare-fun m!1365859 () Bool)

(assert (=> b!1480024 m!1365859))

(assert (=> b!1480024 m!1365859))

(declare-fun m!1365861 () Bool)

(assert (=> b!1480024 m!1365861))

(declare-fun m!1365863 () Bool)

(assert (=> b!1480029 m!1365863))

(declare-fun m!1365865 () Bool)

(assert (=> b!1480029 m!1365865))

(declare-fun m!1365867 () Bool)

(assert (=> b!1480029 m!1365867))

(assert (=> b!1480029 m!1365849))

(declare-fun m!1365869 () Bool)

(assert (=> b!1480020 m!1365869))

(assert (=> b!1480020 m!1365869))

(declare-fun m!1365871 () Bool)

(assert (=> b!1480020 m!1365871))

(assert (=> b!1480020 m!1365865))

(declare-fun m!1365873 () Bool)

(assert (=> b!1480020 m!1365873))

(declare-fun m!1365875 () Bool)

(assert (=> start!126258 m!1365875))

(declare-fun m!1365877 () Bool)

(assert (=> start!126258 m!1365877))

(declare-fun m!1365879 () Bool)

(assert (=> b!1480026 m!1365879))

(assert (=> b!1480035 m!1365849))

(assert (=> b!1480035 m!1365849))

(declare-fun m!1365881 () Bool)

(assert (=> b!1480035 m!1365881))

(assert (=> b!1480035 m!1365881))

(assert (=> b!1480035 m!1365849))

(declare-fun m!1365883 () Bool)

(assert (=> b!1480035 m!1365883))

(assert (=> b!1480021 m!1365865))

(declare-fun m!1365885 () Bool)

(assert (=> b!1480021 m!1365885))

(assert (=> b!1480030 m!1365849))

(assert (=> b!1480030 m!1365849))

(declare-fun m!1365887 () Bool)

(assert (=> b!1480030 m!1365887))

(declare-fun m!1365889 () Bool)

(assert (=> b!1480022 m!1365889))

(assert (=> b!1480028 m!1365855))

(declare-fun m!1365891 () Bool)

(assert (=> b!1480028 m!1365891))

(declare-fun m!1365893 () Bool)

(assert (=> b!1480033 m!1365893))

(assert (=> b!1480033 m!1365865))

(declare-fun m!1365895 () Bool)

(assert (=> b!1480033 m!1365895))

(assert (=> b!1480033 m!1365867))

(assert (=> b!1480033 m!1365863))

(assert (=> b!1480033 m!1365849))

(declare-fun m!1365897 () Bool)

(assert (=> b!1480033 m!1365897))

(declare-fun m!1365899 () Bool)

(assert (=> b!1480033 m!1365899))

(assert (=> b!1480033 m!1365849))

(assert (=> b!1480032 m!1365849))

(assert (=> b!1480032 m!1365849))

(declare-fun m!1365901 () Bool)

(assert (=> b!1480032 m!1365901))

(assert (=> b!1480037 m!1365849))

(assert (=> b!1480037 m!1365849))

(declare-fun m!1365903 () Bool)

(assert (=> b!1480037 m!1365903))

(check-sat (not b!1480024) (not b!1480030) (not b!1480020) (not b!1480038) (not b!1480028) (not b!1480032) (not b!1480022) (not b!1480034) (not b!1480023) (not b!1480035) (not b!1480037) (not b!1480026) (not start!126258) (not b!1480033))
(check-sat)
