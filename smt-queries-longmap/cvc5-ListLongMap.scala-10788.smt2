; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126226 () Bool)

(assert start!126226)

(declare-fun b!1479082 () Bool)

(declare-fun res!1005030 () Bool)

(declare-fun e!829672 () Bool)

(assert (=> b!1479082 (=> (not res!1005030) (not e!829672))))

(declare-datatypes ((array!99332 0))(
  ( (array!99333 (arr!47945 (Array (_ BitVec 32) (_ BitVec 64))) (size!48495 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99332)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479082 (= res!1005030 (validKeyInArray!0 (select (arr!47945 a!2862) j!93)))))

(declare-fun b!1479083 () Bool)

(declare-fun e!829665 () Bool)

(declare-fun e!829667 () Bool)

(assert (=> b!1479083 (= e!829665 e!829667)))

(declare-fun res!1005038 () Bool)

(assert (=> b!1479083 (=> res!1005038 e!829667)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479083 (= res!1005038 (or (and (= (select (arr!47945 a!2862) index!646) (select (store (arr!47945 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47945 a!2862) index!646) (select (arr!47945 a!2862) j!93))) (not (= (select (arr!47945 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!829669 () Bool)

(declare-fun lt!645897 () (_ BitVec 64))

(declare-fun b!1479084 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645898 () array!99332)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12185 0))(
  ( (MissingZero!12185 (index!51132 (_ BitVec 32))) (Found!12185 (index!51133 (_ BitVec 32))) (Intermediate!12185 (undefined!12997 Bool) (index!51134 (_ BitVec 32)) (x!132720 (_ BitVec 32))) (Undefined!12185) (MissingVacant!12185 (index!51135 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99332 (_ BitVec 32)) SeekEntryResult!12185)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99332 (_ BitVec 32)) SeekEntryResult!12185)

(assert (=> b!1479084 (= e!829669 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645897 lt!645898 mask!2687) (seekEntryOrOpen!0 lt!645897 lt!645898 mask!2687)))))

(declare-fun b!1479085 () Bool)

(declare-fun e!829666 () Bool)

(declare-fun e!829668 () Bool)

(assert (=> b!1479085 (= e!829666 e!829668)))

(declare-fun res!1005040 () Bool)

(assert (=> b!1479085 (=> (not res!1005040) (not e!829668))))

(declare-fun lt!645899 () SeekEntryResult!12185)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479085 (= res!1005040 (= lt!645899 (Intermediate!12185 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99332 (_ BitVec 32)) SeekEntryResult!12185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479085 (= lt!645899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645897 mask!2687) lt!645897 lt!645898 mask!2687))))

(assert (=> b!1479085 (= lt!645897 (select (store (arr!47945 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!829673 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1479086 () Bool)

(assert (=> b!1479086 (= e!829673 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479087 () Bool)

(declare-fun res!1005034 () Bool)

(assert (=> b!1479087 (=> (not res!1005034) (not e!829672))))

(assert (=> b!1479087 (= res!1005034 (and (= (size!48495 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48495 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48495 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479088 () Bool)

(declare-fun res!1005029 () Bool)

(assert (=> b!1479088 (=> (not res!1005029) (not e!829668))))

(assert (=> b!1479088 (= res!1005029 e!829669)))

(declare-fun c!136548 () Bool)

(assert (=> b!1479088 (= c!136548 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479089 () Bool)

(declare-fun res!1005031 () Bool)

(assert (=> b!1479089 (=> (not res!1005031) (not e!829672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99332 (_ BitVec 32)) Bool)

(assert (=> b!1479089 (= res!1005031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479090 () Bool)

(declare-fun res!1005026 () Bool)

(assert (=> b!1479090 (=> (not res!1005026) (not e!829672))))

(assert (=> b!1479090 (= res!1005026 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48495 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48495 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48495 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479091 () Bool)

(declare-fun res!1005028 () Bool)

(assert (=> b!1479091 (=> (not res!1005028) (not e!829668))))

(assert (=> b!1479091 (= res!1005028 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479092 () Bool)

(declare-fun res!1005036 () Bool)

(assert (=> b!1479092 (=> (not res!1005036) (not e!829666))))

(declare-fun lt!645896 () SeekEntryResult!12185)

(assert (=> b!1479092 (= res!1005036 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47945 a!2862) j!93) a!2862 mask!2687) lt!645896))))

(declare-fun b!1479093 () Bool)

(assert (=> b!1479093 (= e!829669 (= lt!645899 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645897 lt!645898 mask!2687)))))

(declare-fun b!1479094 () Bool)

(declare-fun e!829670 () Bool)

(assert (=> b!1479094 (= e!829672 e!829670)))

(declare-fun res!1005033 () Bool)

(assert (=> b!1479094 (=> (not res!1005033) (not e!829670))))

(assert (=> b!1479094 (= res!1005033 (= (select (store (arr!47945 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479094 (= lt!645898 (array!99333 (store (arr!47945 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48495 a!2862)))))

(declare-fun b!1479096 () Bool)

(assert (=> b!1479096 (= e!829668 (not true))))

(assert (=> b!1479096 e!829665))

(declare-fun res!1005032 () Bool)

(assert (=> b!1479096 (=> (not res!1005032) (not e!829665))))

(declare-fun lt!645895 () SeekEntryResult!12185)

(assert (=> b!1479096 (= res!1005032 (and (= lt!645895 (Found!12185 j!93)) (or (= (select (arr!47945 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47945 a!2862) intermediateBeforeIndex!19) (select (arr!47945 a!2862) j!93)))))))

(assert (=> b!1479096 (= lt!645895 (seekEntryOrOpen!0 (select (arr!47945 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479096 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49710 0))(
  ( (Unit!49711) )
))
(declare-fun lt!645900 () Unit!49710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49710)

(assert (=> b!1479096 (= lt!645900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479097 () Bool)

(declare-fun res!1005025 () Bool)

(assert (=> b!1479097 (=> (not res!1005025) (not e!829672))))

(assert (=> b!1479097 (= res!1005025 (validKeyInArray!0 (select (arr!47945 a!2862) i!1006)))))

(declare-fun b!1479098 () Bool)

(declare-fun res!1005037 () Bool)

(assert (=> b!1479098 (=> (not res!1005037) (not e!829672))))

(declare-datatypes ((List!34446 0))(
  ( (Nil!34443) (Cons!34442 (h!35810 (_ BitVec 64)) (t!49140 List!34446)) )
))
(declare-fun arrayNoDuplicates!0 (array!99332 (_ BitVec 32) List!34446) Bool)

(assert (=> b!1479098 (= res!1005037 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34443))))

(declare-fun b!1479099 () Bool)

(assert (=> b!1479099 (= e!829667 e!829673)))

(declare-fun res!1005035 () Bool)

(assert (=> b!1479099 (=> (not res!1005035) (not e!829673))))

(assert (=> b!1479099 (= res!1005035 (= lt!645895 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47945 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!1005039 () Bool)

(assert (=> start!126226 (=> (not res!1005039) (not e!829672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126226 (= res!1005039 (validMask!0 mask!2687))))

(assert (=> start!126226 e!829672))

(assert (=> start!126226 true))

(declare-fun array_inv!36973 (array!99332) Bool)

(assert (=> start!126226 (array_inv!36973 a!2862)))

(declare-fun b!1479095 () Bool)

(assert (=> b!1479095 (= e!829670 e!829666)))

(declare-fun res!1005027 () Bool)

(assert (=> b!1479095 (=> (not res!1005027) (not e!829666))))

(assert (=> b!1479095 (= res!1005027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47945 a!2862) j!93) mask!2687) (select (arr!47945 a!2862) j!93) a!2862 mask!2687) lt!645896))))

(assert (=> b!1479095 (= lt!645896 (Intermediate!12185 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126226 res!1005039) b!1479087))

(assert (= (and b!1479087 res!1005034) b!1479097))

(assert (= (and b!1479097 res!1005025) b!1479082))

(assert (= (and b!1479082 res!1005030) b!1479089))

(assert (= (and b!1479089 res!1005031) b!1479098))

(assert (= (and b!1479098 res!1005037) b!1479090))

(assert (= (and b!1479090 res!1005026) b!1479094))

(assert (= (and b!1479094 res!1005033) b!1479095))

(assert (= (and b!1479095 res!1005027) b!1479092))

(assert (= (and b!1479092 res!1005036) b!1479085))

(assert (= (and b!1479085 res!1005040) b!1479088))

(assert (= (and b!1479088 c!136548) b!1479093))

(assert (= (and b!1479088 (not c!136548)) b!1479084))

(assert (= (and b!1479088 res!1005029) b!1479091))

(assert (= (and b!1479091 res!1005028) b!1479096))

(assert (= (and b!1479096 res!1005032) b!1479083))

(assert (= (and b!1479083 (not res!1005038)) b!1479099))

(assert (= (and b!1479099 res!1005035) b!1479086))

(declare-fun m!1364971 () Bool)

(assert (=> b!1479085 m!1364971))

(assert (=> b!1479085 m!1364971))

(declare-fun m!1364973 () Bool)

(assert (=> b!1479085 m!1364973))

(declare-fun m!1364975 () Bool)

(assert (=> b!1479085 m!1364975))

(declare-fun m!1364977 () Bool)

(assert (=> b!1479085 m!1364977))

(declare-fun m!1364979 () Bool)

(assert (=> b!1479095 m!1364979))

(assert (=> b!1479095 m!1364979))

(declare-fun m!1364981 () Bool)

(assert (=> b!1479095 m!1364981))

(assert (=> b!1479095 m!1364981))

(assert (=> b!1479095 m!1364979))

(declare-fun m!1364983 () Bool)

(assert (=> b!1479095 m!1364983))

(assert (=> b!1479082 m!1364979))

(assert (=> b!1479082 m!1364979))

(declare-fun m!1364985 () Bool)

(assert (=> b!1479082 m!1364985))

(assert (=> b!1479099 m!1364979))

(assert (=> b!1479099 m!1364979))

(declare-fun m!1364987 () Bool)

(assert (=> b!1479099 m!1364987))

(declare-fun m!1364989 () Bool)

(assert (=> b!1479093 m!1364989))

(declare-fun m!1364991 () Bool)

(assert (=> start!126226 m!1364991))

(declare-fun m!1364993 () Bool)

(assert (=> start!126226 m!1364993))

(declare-fun m!1364995 () Bool)

(assert (=> b!1479084 m!1364995))

(declare-fun m!1364997 () Bool)

(assert (=> b!1479084 m!1364997))

(declare-fun m!1364999 () Bool)

(assert (=> b!1479096 m!1364999))

(declare-fun m!1365001 () Bool)

(assert (=> b!1479096 m!1365001))

(assert (=> b!1479096 m!1364979))

(declare-fun m!1365003 () Bool)

(assert (=> b!1479096 m!1365003))

(declare-fun m!1365005 () Bool)

(assert (=> b!1479096 m!1365005))

(assert (=> b!1479096 m!1364979))

(assert (=> b!1479094 m!1364975))

(declare-fun m!1365007 () Bool)

(assert (=> b!1479094 m!1365007))

(declare-fun m!1365009 () Bool)

(assert (=> b!1479083 m!1365009))

(assert (=> b!1479083 m!1364975))

(declare-fun m!1365011 () Bool)

(assert (=> b!1479083 m!1365011))

(assert (=> b!1479083 m!1364979))

(assert (=> b!1479092 m!1364979))

(assert (=> b!1479092 m!1364979))

(declare-fun m!1365013 () Bool)

(assert (=> b!1479092 m!1365013))

(declare-fun m!1365015 () Bool)

(assert (=> b!1479089 m!1365015))

(declare-fun m!1365017 () Bool)

(assert (=> b!1479097 m!1365017))

(assert (=> b!1479097 m!1365017))

(declare-fun m!1365019 () Bool)

(assert (=> b!1479097 m!1365019))

(declare-fun m!1365021 () Bool)

(assert (=> b!1479098 m!1365021))

(push 1)

