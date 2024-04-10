; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125318 () Bool)

(assert start!125318)

(declare-fun b!1463967 () Bool)

(declare-fun res!993130 () Bool)

(declare-fun e!822764 () Bool)

(assert (=> b!1463967 (=> (not res!993130) (not e!822764))))

(declare-datatypes ((SeekEntryResult!11923 0))(
  ( (MissingZero!11923 (index!50084 (_ BitVec 32))) (Found!11923 (index!50085 (_ BitVec 32))) (Intermediate!11923 (undefined!12735 Bool) (index!50086 (_ BitVec 32)) (x!131668 (_ BitVec 32))) (Undefined!11923) (MissingVacant!11923 (index!50087 (_ BitVec 32))) )
))
(declare-fun lt!640935 () SeekEntryResult!11923)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98766 0))(
  ( (array!98767 (arr!47671 (Array (_ BitVec 32) (_ BitVec 64))) (size!48221 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98766)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98766 (_ BitVec 32)) SeekEntryResult!11923)

(assert (=> b!1463967 (= res!993130 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!640935))))

(declare-fun b!1463968 () Bool)

(declare-fun res!993125 () Bool)

(declare-fun e!822766 () Bool)

(assert (=> b!1463968 (=> (not res!993125) (not e!822766))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463968 (= res!993125 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463969 () Bool)

(declare-fun res!993122 () Bool)

(declare-fun e!822761 () Bool)

(assert (=> b!1463969 (=> (not res!993122) (not e!822761))))

(declare-datatypes ((List!34172 0))(
  ( (Nil!34169) (Cons!34168 (h!35518 (_ BitVec 64)) (t!48866 List!34172)) )
))
(declare-fun arrayNoDuplicates!0 (array!98766 (_ BitVec 32) List!34172) Bool)

(assert (=> b!1463969 (= res!993122 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34169))))

(declare-fun b!1463970 () Bool)

(declare-fun res!993123 () Bool)

(assert (=> b!1463970 (=> (not res!993123) (not e!822761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463970 (= res!993123 (validKeyInArray!0 (select (arr!47671 a!2862) i!1006)))))

(declare-fun b!1463971 () Bool)

(assert (=> b!1463971 (= e!822764 e!822766)))

(declare-fun res!993131 () Bool)

(assert (=> b!1463971 (=> (not res!993131) (not e!822766))))

(declare-fun lt!640938 () SeekEntryResult!11923)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463971 (= res!993131 (= lt!640938 (Intermediate!11923 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640939 () (_ BitVec 64))

(declare-fun lt!640937 () array!98766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463971 (= lt!640938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640939 mask!2687) lt!640939 lt!640937 mask!2687))))

(assert (=> b!1463971 (= lt!640939 (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463972 () Bool)

(declare-fun e!822768 () Bool)

(assert (=> b!1463972 (= e!822761 e!822768)))

(declare-fun res!993136 () Bool)

(assert (=> b!1463972 (=> (not res!993136) (not e!822768))))

(assert (=> b!1463972 (= res!993136 (= (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463972 (= lt!640937 (array!98767 (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48221 a!2862)))))

(declare-fun b!1463973 () Bool)

(declare-fun e!822765 () Bool)

(assert (=> b!1463973 (= e!822766 (not e!822765))))

(declare-fun res!993139 () Bool)

(assert (=> b!1463973 (=> res!993139 e!822765)))

(assert (=> b!1463973 (= res!993139 (or (and (= (select (arr!47671 a!2862) index!646) (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47671 a!2862) index!646) (select (arr!47671 a!2862) j!93))) (= (select (arr!47671 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822762 () Bool)

(assert (=> b!1463973 e!822762))

(declare-fun res!993132 () Bool)

(assert (=> b!1463973 (=> (not res!993132) (not e!822762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98766 (_ BitVec 32)) Bool)

(assert (=> b!1463973 (= res!993132 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49342 0))(
  ( (Unit!49343) )
))
(declare-fun lt!640936 () Unit!49342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49342)

(assert (=> b!1463973 (= lt!640936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463974 () Bool)

(declare-fun res!993126 () Bool)

(assert (=> b!1463974 (=> (not res!993126) (not e!822761))))

(assert (=> b!1463974 (= res!993126 (and (= (size!48221 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48221 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48221 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463975 () Bool)

(declare-fun e!822770 () Bool)

(assert (=> b!1463975 (= e!822765 e!822770)))

(declare-fun res!993129 () Bool)

(assert (=> b!1463975 (=> res!993129 e!822770)))

(declare-fun lt!640940 () (_ BitVec 32))

(assert (=> b!1463975 (= res!993129 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640940 #b00000000000000000000000000000000) (bvsge lt!640940 (size!48221 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463975 (= lt!640940 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463976 () Bool)

(declare-fun res!993127 () Bool)

(assert (=> b!1463976 (=> (not res!993127) (not e!822761))))

(assert (=> b!1463976 (= res!993127 (validKeyInArray!0 (select (arr!47671 a!2862) j!93)))))

(declare-fun b!1463977 () Bool)

(assert (=> b!1463977 (= e!822768 e!822764)))

(declare-fun res!993137 () Bool)

(assert (=> b!1463977 (=> (not res!993137) (not e!822764))))

(assert (=> b!1463977 (= res!993137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47671 a!2862) j!93) mask!2687) (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!640935))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463977 (= lt!640935 (Intermediate!11923 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463978 () Bool)

(declare-fun e!822769 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98766 (_ BitVec 32)) SeekEntryResult!11923)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98766 (_ BitVec 32)) SeekEntryResult!11923)

(assert (=> b!1463978 (= e!822769 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640939 lt!640937 mask!2687) (seekEntryOrOpen!0 lt!640939 lt!640937 mask!2687)))))

(declare-fun b!1463979 () Bool)

(declare-fun res!993124 () Bool)

(assert (=> b!1463979 (=> res!993124 e!822770)))

(assert (=> b!1463979 (= res!993124 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640940 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!640935)))))

(declare-fun b!1463980 () Bool)

(declare-fun res!993134 () Bool)

(assert (=> b!1463980 (=> (not res!993134) (not e!822762))))

(assert (=> b!1463980 (= res!993134 (= (seekEntryOrOpen!0 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) (Found!11923 j!93)))))

(declare-fun b!1463981 () Bool)

(assert (=> b!1463981 (= e!822769 (= lt!640938 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640939 lt!640937 mask!2687)))))

(declare-fun b!1463982 () Bool)

(declare-fun res!993135 () Bool)

(assert (=> b!1463982 (=> (not res!993135) (not e!822761))))

(assert (=> b!1463982 (= res!993135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463983 () Bool)

(declare-fun e!822763 () Bool)

(assert (=> b!1463983 (= e!822763 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640940 intermediateAfterIndex!19 lt!640939 lt!640937 mask!2687) (seekEntryOrOpen!0 lt!640939 lt!640937 mask!2687))))))

(declare-fun res!993133 () Bool)

(assert (=> start!125318 (=> (not res!993133) (not e!822761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125318 (= res!993133 (validMask!0 mask!2687))))

(assert (=> start!125318 e!822761))

(assert (=> start!125318 true))

(declare-fun array_inv!36699 (array!98766) Bool)

(assert (=> start!125318 (array_inv!36699 a!2862)))

(declare-fun b!1463984 () Bool)

(declare-fun res!993138 () Bool)

(assert (=> b!1463984 (=> (not res!993138) (not e!822761))))

(assert (=> b!1463984 (= res!993138 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48221 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48221 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48221 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463985 () Bool)

(assert (=> b!1463985 (= e!822763 (not (= lt!640938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640940 lt!640939 lt!640937 mask!2687))))))

(declare-fun b!1463986 () Bool)

(assert (=> b!1463986 (= e!822762 (or (= (select (arr!47671 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47671 a!2862) intermediateBeforeIndex!19) (select (arr!47671 a!2862) j!93))))))

(declare-fun b!1463987 () Bool)

(assert (=> b!1463987 (= e!822770 true)))

(declare-fun lt!640941 () Bool)

(assert (=> b!1463987 (= lt!640941 e!822763)))

(declare-fun c!134933 () Bool)

(assert (=> b!1463987 (= c!134933 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463988 () Bool)

(declare-fun res!993128 () Bool)

(assert (=> b!1463988 (=> (not res!993128) (not e!822766))))

(assert (=> b!1463988 (= res!993128 e!822769)))

(declare-fun c!134934 () Bool)

(assert (=> b!1463988 (= c!134934 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125318 res!993133) b!1463974))

(assert (= (and b!1463974 res!993126) b!1463970))

(assert (= (and b!1463970 res!993123) b!1463976))

(assert (= (and b!1463976 res!993127) b!1463982))

(assert (= (and b!1463982 res!993135) b!1463969))

(assert (= (and b!1463969 res!993122) b!1463984))

(assert (= (and b!1463984 res!993138) b!1463972))

(assert (= (and b!1463972 res!993136) b!1463977))

(assert (= (and b!1463977 res!993137) b!1463967))

(assert (= (and b!1463967 res!993130) b!1463971))

(assert (= (and b!1463971 res!993131) b!1463988))

(assert (= (and b!1463988 c!134934) b!1463981))

(assert (= (and b!1463988 (not c!134934)) b!1463978))

(assert (= (and b!1463988 res!993128) b!1463968))

(assert (= (and b!1463968 res!993125) b!1463973))

(assert (= (and b!1463973 res!993132) b!1463980))

(assert (= (and b!1463980 res!993134) b!1463986))

(assert (= (and b!1463973 (not res!993139)) b!1463975))

(assert (= (and b!1463975 (not res!993129)) b!1463979))

(assert (= (and b!1463979 (not res!993124)) b!1463987))

(assert (= (and b!1463987 c!134933) b!1463985))

(assert (= (and b!1463987 (not c!134933)) b!1463983))

(declare-fun m!1351239 () Bool)

(assert (=> b!1463975 m!1351239))

(declare-fun m!1351241 () Bool)

(assert (=> b!1463976 m!1351241))

(assert (=> b!1463976 m!1351241))

(declare-fun m!1351243 () Bool)

(assert (=> b!1463976 m!1351243))

(declare-fun m!1351245 () Bool)

(assert (=> b!1463981 m!1351245))

(declare-fun m!1351247 () Bool)

(assert (=> b!1463973 m!1351247))

(declare-fun m!1351249 () Bool)

(assert (=> b!1463973 m!1351249))

(declare-fun m!1351251 () Bool)

(assert (=> b!1463973 m!1351251))

(declare-fun m!1351253 () Bool)

(assert (=> b!1463973 m!1351253))

(declare-fun m!1351255 () Bool)

(assert (=> b!1463973 m!1351255))

(assert (=> b!1463973 m!1351241))

(declare-fun m!1351257 () Bool)

(assert (=> b!1463970 m!1351257))

(assert (=> b!1463970 m!1351257))

(declare-fun m!1351259 () Bool)

(assert (=> b!1463970 m!1351259))

(assert (=> b!1463977 m!1351241))

(assert (=> b!1463977 m!1351241))

(declare-fun m!1351261 () Bool)

(assert (=> b!1463977 m!1351261))

(assert (=> b!1463977 m!1351261))

(assert (=> b!1463977 m!1351241))

(declare-fun m!1351263 () Bool)

(assert (=> b!1463977 m!1351263))

(declare-fun m!1351265 () Bool)

(assert (=> b!1463985 m!1351265))

(assert (=> b!1463979 m!1351241))

(assert (=> b!1463979 m!1351241))

(declare-fun m!1351267 () Bool)

(assert (=> b!1463979 m!1351267))

(declare-fun m!1351269 () Bool)

(assert (=> b!1463978 m!1351269))

(declare-fun m!1351271 () Bool)

(assert (=> b!1463978 m!1351271))

(declare-fun m!1351273 () Bool)

(assert (=> b!1463971 m!1351273))

(assert (=> b!1463971 m!1351273))

(declare-fun m!1351275 () Bool)

(assert (=> b!1463971 m!1351275))

(assert (=> b!1463971 m!1351249))

(declare-fun m!1351277 () Bool)

(assert (=> b!1463971 m!1351277))

(assert (=> b!1463972 m!1351249))

(declare-fun m!1351279 () Bool)

(assert (=> b!1463972 m!1351279))

(assert (=> b!1463967 m!1351241))

(assert (=> b!1463967 m!1351241))

(declare-fun m!1351281 () Bool)

(assert (=> b!1463967 m!1351281))

(declare-fun m!1351283 () Bool)

(assert (=> b!1463986 m!1351283))

(assert (=> b!1463986 m!1351241))

(declare-fun m!1351285 () Bool)

(assert (=> b!1463969 m!1351285))

(declare-fun m!1351287 () Bool)

(assert (=> b!1463982 m!1351287))

(declare-fun m!1351289 () Bool)

(assert (=> start!125318 m!1351289))

(declare-fun m!1351291 () Bool)

(assert (=> start!125318 m!1351291))

(declare-fun m!1351293 () Bool)

(assert (=> b!1463983 m!1351293))

(assert (=> b!1463983 m!1351271))

(assert (=> b!1463980 m!1351241))

(assert (=> b!1463980 m!1351241))

(declare-fun m!1351295 () Bool)

(assert (=> b!1463980 m!1351295))

(push 1)

