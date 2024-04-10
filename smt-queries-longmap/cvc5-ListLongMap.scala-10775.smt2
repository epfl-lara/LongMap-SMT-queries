; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126148 () Bool)

(assert start!126148)

(declare-fun b!1476976 () Bool)

(declare-fun res!1003160 () Bool)

(declare-fun e!828615 () Bool)

(assert (=> b!1476976 (=> (not res!1003160) (not e!828615))))

(declare-fun e!828614 () Bool)

(assert (=> b!1476976 (= res!1003160 e!828614)))

(declare-fun c!136431 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476976 (= c!136431 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476977 () Bool)

(declare-fun res!1003164 () Bool)

(declare-fun e!828616 () Bool)

(assert (=> b!1476977 (=> (not res!1003164) (not e!828616))))

(declare-datatypes ((array!99254 0))(
  ( (array!99255 (arr!47906 (Array (_ BitVec 32) (_ BitVec 64))) (size!48456 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99254)

(declare-datatypes ((List!34407 0))(
  ( (Nil!34404) (Cons!34403 (h!35771 (_ BitVec 64)) (t!49101 List!34407)) )
))
(declare-fun arrayNoDuplicates!0 (array!99254 (_ BitVec 32) List!34407) Bool)

(assert (=> b!1476977 (= res!1003164 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34404))))

(declare-fun b!1476978 () Bool)

(declare-fun res!1003161 () Bool)

(assert (=> b!1476978 (=> (not res!1003161) (not e!828616))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476978 (= res!1003161 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48456 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48456 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48456 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476980 () Bool)

(declare-fun e!828620 () Bool)

(declare-fun e!828617 () Bool)

(assert (=> b!1476980 (= e!828620 e!828617)))

(declare-fun res!1003156 () Bool)

(assert (=> b!1476980 (=> (not res!1003156) (not e!828617))))

(declare-datatypes ((SeekEntryResult!12146 0))(
  ( (MissingZero!12146 (index!50976 (_ BitVec 32))) (Found!12146 (index!50977 (_ BitVec 32))) (Intermediate!12146 (undefined!12958 Bool) (index!50978 (_ BitVec 32)) (x!132577 (_ BitVec 32))) (Undefined!12146) (MissingVacant!12146 (index!50979 (_ BitVec 32))) )
))
(declare-fun lt!645194 () SeekEntryResult!12146)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99254 (_ BitVec 32)) SeekEntryResult!12146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476980 (= res!1003156 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47906 a!2862) j!93) mask!2687) (select (arr!47906 a!2862) j!93) a!2862 mask!2687) lt!645194))))

(assert (=> b!1476980 (= lt!645194 (Intermediate!12146 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476981 () Bool)

(declare-fun res!1003155 () Bool)

(assert (=> b!1476981 (=> (not res!1003155) (not e!828615))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476981 (= res!1003155 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476982 () Bool)

(declare-fun res!1003154 () Bool)

(assert (=> b!1476982 (=> (not res!1003154) (not e!828616))))

(assert (=> b!1476982 (= res!1003154 (and (= (size!48456 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48456 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48456 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476983 () Bool)

(declare-fun e!828618 () Bool)

(assert (=> b!1476983 (= e!828618 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476984 () Bool)

(declare-fun res!1003166 () Bool)

(assert (=> b!1476984 (=> (not res!1003166) (not e!828617))))

(assert (=> b!1476984 (= res!1003166 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47906 a!2862) j!93) a!2862 mask!2687) lt!645194))))

(declare-fun b!1476985 () Bool)

(declare-fun res!1003165 () Bool)

(assert (=> b!1476985 (=> (not res!1003165) (not e!828616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99254 (_ BitVec 32)) Bool)

(assert (=> b!1476985 (= res!1003165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476986 () Bool)

(assert (=> b!1476986 (= e!828616 e!828620)))

(declare-fun res!1003158 () Bool)

(assert (=> b!1476986 (=> (not res!1003158) (not e!828620))))

(assert (=> b!1476986 (= res!1003158 (= (select (store (arr!47906 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645193 () array!99254)

(assert (=> b!1476986 (= lt!645193 (array!99255 (store (arr!47906 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48456 a!2862)))))

(declare-fun b!1476987 () Bool)

(assert (=> b!1476987 (= e!828617 e!828615)))

(declare-fun res!1003162 () Bool)

(assert (=> b!1476987 (=> (not res!1003162) (not e!828615))))

(declare-fun lt!645195 () SeekEntryResult!12146)

(assert (=> b!1476987 (= res!1003162 (= lt!645195 (Intermediate!12146 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645198 () (_ BitVec 64))

(assert (=> b!1476987 (= lt!645195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645198 mask!2687) lt!645198 lt!645193 mask!2687))))

(assert (=> b!1476987 (= lt!645198 (select (store (arr!47906 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476988 () Bool)

(declare-fun res!1003168 () Bool)

(assert (=> b!1476988 (=> (not res!1003168) (not e!828616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476988 (= res!1003168 (validKeyInArray!0 (select (arr!47906 a!2862) i!1006)))))

(declare-fun b!1476989 () Bool)

(assert (=> b!1476989 (= e!828614 (= lt!645195 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645198 lt!645193 mask!2687)))))

(declare-fun res!1003163 () Bool)

(assert (=> start!126148 (=> (not res!1003163) (not e!828616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126148 (= res!1003163 (validMask!0 mask!2687))))

(assert (=> start!126148 e!828616))

(assert (=> start!126148 true))

(declare-fun array_inv!36934 (array!99254) Bool)

(assert (=> start!126148 (array_inv!36934 a!2862)))

(declare-fun b!1476979 () Bool)

(declare-fun e!828612 () Bool)

(declare-fun e!828619 () Bool)

(assert (=> b!1476979 (= e!828612 e!828619)))

(declare-fun res!1003157 () Bool)

(assert (=> b!1476979 (=> res!1003157 e!828619)))

(assert (=> b!1476979 (= res!1003157 (or (and (= (select (arr!47906 a!2862) index!646) (select (store (arr!47906 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47906 a!2862) index!646) (select (arr!47906 a!2862) j!93))) (not (= (select (arr!47906 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99254 (_ BitVec 32)) SeekEntryResult!12146)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99254 (_ BitVec 32)) SeekEntryResult!12146)

(assert (=> b!1476990 (= e!828614 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645198 lt!645193 mask!2687) (seekEntryOrOpen!0 lt!645198 lt!645193 mask!2687)))))

(declare-fun b!1476991 () Bool)

(assert (=> b!1476991 (= e!828615 (not true))))

(assert (=> b!1476991 e!828612))

(declare-fun res!1003153 () Bool)

(assert (=> b!1476991 (=> (not res!1003153) (not e!828612))))

(declare-fun lt!645196 () SeekEntryResult!12146)

(assert (=> b!1476991 (= res!1003153 (and (= lt!645196 (Found!12146 j!93)) (or (= (select (arr!47906 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47906 a!2862) intermediateBeforeIndex!19) (select (arr!47906 a!2862) j!93)))))))

(assert (=> b!1476991 (= lt!645196 (seekEntryOrOpen!0 (select (arr!47906 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476991 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49632 0))(
  ( (Unit!49633) )
))
(declare-fun lt!645197 () Unit!49632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49632)

(assert (=> b!1476991 (= lt!645197 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476992 () Bool)

(assert (=> b!1476992 (= e!828619 e!828618)))

(declare-fun res!1003167 () Bool)

(assert (=> b!1476992 (=> (not res!1003167) (not e!828618))))

(assert (=> b!1476992 (= res!1003167 (= lt!645196 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47906 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476993 () Bool)

(declare-fun res!1003159 () Bool)

(assert (=> b!1476993 (=> (not res!1003159) (not e!828616))))

(assert (=> b!1476993 (= res!1003159 (validKeyInArray!0 (select (arr!47906 a!2862) j!93)))))

(assert (= (and start!126148 res!1003163) b!1476982))

(assert (= (and b!1476982 res!1003154) b!1476988))

(assert (= (and b!1476988 res!1003168) b!1476993))

(assert (= (and b!1476993 res!1003159) b!1476985))

(assert (= (and b!1476985 res!1003165) b!1476977))

(assert (= (and b!1476977 res!1003164) b!1476978))

(assert (= (and b!1476978 res!1003161) b!1476986))

(assert (= (and b!1476986 res!1003158) b!1476980))

(assert (= (and b!1476980 res!1003156) b!1476984))

(assert (= (and b!1476984 res!1003166) b!1476987))

(assert (= (and b!1476987 res!1003162) b!1476976))

(assert (= (and b!1476976 c!136431) b!1476989))

(assert (= (and b!1476976 (not c!136431)) b!1476990))

(assert (= (and b!1476976 res!1003160) b!1476981))

(assert (= (and b!1476981 res!1003155) b!1476991))

(assert (= (and b!1476991 res!1003153) b!1476979))

(assert (= (and b!1476979 (not res!1003157)) b!1476992))

(assert (= (and b!1476992 res!1003167) b!1476983))

(declare-fun m!1362943 () Bool)

(assert (=> start!126148 m!1362943))

(declare-fun m!1362945 () Bool)

(assert (=> start!126148 m!1362945))

(declare-fun m!1362947 () Bool)

(assert (=> b!1476991 m!1362947))

(declare-fun m!1362949 () Bool)

(assert (=> b!1476991 m!1362949))

(declare-fun m!1362951 () Bool)

(assert (=> b!1476991 m!1362951))

(declare-fun m!1362953 () Bool)

(assert (=> b!1476991 m!1362953))

(declare-fun m!1362955 () Bool)

(assert (=> b!1476991 m!1362955))

(assert (=> b!1476991 m!1362951))

(declare-fun m!1362957 () Bool)

(assert (=> b!1476985 m!1362957))

(assert (=> b!1476993 m!1362951))

(assert (=> b!1476993 m!1362951))

(declare-fun m!1362959 () Bool)

(assert (=> b!1476993 m!1362959))

(assert (=> b!1476980 m!1362951))

(assert (=> b!1476980 m!1362951))

(declare-fun m!1362961 () Bool)

(assert (=> b!1476980 m!1362961))

(assert (=> b!1476980 m!1362961))

(assert (=> b!1476980 m!1362951))

(declare-fun m!1362963 () Bool)

(assert (=> b!1476980 m!1362963))

(declare-fun m!1362965 () Bool)

(assert (=> b!1476988 m!1362965))

(assert (=> b!1476988 m!1362965))

(declare-fun m!1362967 () Bool)

(assert (=> b!1476988 m!1362967))

(declare-fun m!1362969 () Bool)

(assert (=> b!1476987 m!1362969))

(assert (=> b!1476987 m!1362969))

(declare-fun m!1362971 () Bool)

(assert (=> b!1476987 m!1362971))

(declare-fun m!1362973 () Bool)

(assert (=> b!1476987 m!1362973))

(declare-fun m!1362975 () Bool)

(assert (=> b!1476987 m!1362975))

(assert (=> b!1476986 m!1362973))

(declare-fun m!1362977 () Bool)

(assert (=> b!1476986 m!1362977))

(assert (=> b!1476984 m!1362951))

(assert (=> b!1476984 m!1362951))

(declare-fun m!1362979 () Bool)

(assert (=> b!1476984 m!1362979))

(declare-fun m!1362981 () Bool)

(assert (=> b!1476989 m!1362981))

(declare-fun m!1362983 () Bool)

(assert (=> b!1476990 m!1362983))

(declare-fun m!1362985 () Bool)

(assert (=> b!1476990 m!1362985))

(assert (=> b!1476992 m!1362951))

(assert (=> b!1476992 m!1362951))

(declare-fun m!1362987 () Bool)

(assert (=> b!1476992 m!1362987))

(declare-fun m!1362989 () Bool)

(assert (=> b!1476979 m!1362989))

(assert (=> b!1476979 m!1362973))

(declare-fun m!1362991 () Bool)

(assert (=> b!1476979 m!1362991))

(assert (=> b!1476979 m!1362951))

(declare-fun m!1362993 () Bool)

(assert (=> b!1476977 m!1362993))

(push 1)

