; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126474 () Bool)

(assert start!126474)

(declare-fun b!1479980 () Bool)

(declare-fun e!830330 () Bool)

(declare-fun e!830328 () Bool)

(assert (=> b!1479980 (= e!830330 e!830328)))

(declare-fun res!1004916 () Bool)

(assert (=> b!1479980 (=> (not res!1004916) (not e!830328))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99418 0))(
  ( (array!99419 (arr!47983 (Array (_ BitVec 32) (_ BitVec 64))) (size!48534 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99418)

(assert (=> b!1479980 (= res!1004916 (= (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646264 () array!99418)

(assert (=> b!1479980 (= lt!646264 (array!99419 (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48534 a!2862)))))

(declare-fun lt!646266 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1479981 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!830324 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12120 0))(
  ( (MissingZero!12120 (index!50872 (_ BitVec 32))) (Found!12120 (index!50873 (_ BitVec 32))) (Intermediate!12120 (undefined!12932 Bool) (index!50874 (_ BitVec 32)) (x!132648 (_ BitVec 32))) (Undefined!12120) (MissingVacant!12120 (index!50875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99418 (_ BitVec 32)) SeekEntryResult!12120)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99418 (_ BitVec 32)) SeekEntryResult!12120)

(assert (=> b!1479981 (= e!830324 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646266 lt!646264 mask!2687) (seekEntryOrOpen!0 lt!646266 lt!646264 mask!2687)))))

(declare-fun b!1479982 () Bool)

(declare-fun res!1004920 () Bool)

(assert (=> b!1479982 (=> (not res!1004920) (not e!830330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99418 (_ BitVec 32)) Bool)

(assert (=> b!1479982 (= res!1004920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479983 () Bool)

(declare-fun res!1004929 () Bool)

(assert (=> b!1479983 (=> (not res!1004929) (not e!830330))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479983 (= res!1004929 (and (= (size!48534 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48534 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48534 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479984 () Bool)

(declare-fun e!830325 () Bool)

(declare-fun e!830329 () Bool)

(assert (=> b!1479984 (= e!830325 e!830329)))

(declare-fun res!1004930 () Bool)

(assert (=> b!1479984 (=> (not res!1004930) (not e!830329))))

(declare-fun lt!646263 () SeekEntryResult!12120)

(assert (=> b!1479984 (= res!1004930 (= lt!646263 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47983 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479985 () Bool)

(declare-fun res!1004924 () Bool)

(declare-fun e!830331 () Bool)

(assert (=> b!1479985 (=> (not res!1004924) (not e!830331))))

(declare-fun lt!646262 () SeekEntryResult!12120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99418 (_ BitVec 32)) SeekEntryResult!12120)

(assert (=> b!1479985 (= res!1004924 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47983 a!2862) j!93) a!2862 mask!2687) lt!646262))))

(declare-fun b!1479986 () Bool)

(declare-fun e!830327 () Bool)

(assert (=> b!1479986 (= e!830327 (not true))))

(declare-fun e!830326 () Bool)

(assert (=> b!1479986 e!830326))

(declare-fun res!1004915 () Bool)

(assert (=> b!1479986 (=> (not res!1004915) (not e!830326))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479986 (= res!1004915 (and (= lt!646263 (Found!12120 j!93)) (or (= (select (arr!47983 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47983 a!2862) intermediateBeforeIndex!19) (select (arr!47983 a!2862) j!93)))))))

(assert (=> b!1479986 (= lt!646263 (seekEntryOrOpen!0 (select (arr!47983 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479986 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49613 0))(
  ( (Unit!49614) )
))
(declare-fun lt!646267 () Unit!49613)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49613)

(assert (=> b!1479986 (= lt!646267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479987 () Bool)

(declare-fun res!1004927 () Bool)

(assert (=> b!1479987 (=> (not res!1004927) (not e!830330))))

(declare-datatypes ((List!34471 0))(
  ( (Nil!34468) (Cons!34467 (h!35849 (_ BitVec 64)) (t!49157 List!34471)) )
))
(declare-fun arrayNoDuplicates!0 (array!99418 (_ BitVec 32) List!34471) Bool)

(assert (=> b!1479987 (= res!1004927 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34468))))

(declare-fun b!1479988 () Bool)

(assert (=> b!1479988 (= e!830331 e!830327)))

(declare-fun res!1004926 () Bool)

(assert (=> b!1479988 (=> (not res!1004926) (not e!830327))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!646265 () SeekEntryResult!12120)

(assert (=> b!1479988 (= res!1004926 (= lt!646265 (Intermediate!12120 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479988 (= lt!646265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646266 mask!2687) lt!646266 lt!646264 mask!2687))))

(assert (=> b!1479988 (= lt!646266 (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479989 () Bool)

(declare-fun res!1004925 () Bool)

(assert (=> b!1479989 (=> (not res!1004925) (not e!830327))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479989 (= res!1004925 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479990 () Bool)

(assert (=> b!1479990 (= e!830329 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479991 () Bool)

(assert (=> b!1479991 (= e!830324 (= lt!646265 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646266 lt!646264 mask!2687)))))

(declare-fun b!1479992 () Bool)

(declare-fun res!1004919 () Bool)

(assert (=> b!1479992 (=> (not res!1004919) (not e!830330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479992 (= res!1004919 (validKeyInArray!0 (select (arr!47983 a!2862) i!1006)))))

(declare-fun b!1479994 () Bool)

(assert (=> b!1479994 (= e!830326 e!830325)))

(declare-fun res!1004921 () Bool)

(assert (=> b!1479994 (=> res!1004921 e!830325)))

(assert (=> b!1479994 (= res!1004921 (or (and (= (select (arr!47983 a!2862) index!646) (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47983 a!2862) index!646) (select (arr!47983 a!2862) j!93))) (not (= (select (arr!47983 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479995 () Bool)

(declare-fun res!1004918 () Bool)

(assert (=> b!1479995 (=> (not res!1004918) (not e!830330))))

(assert (=> b!1479995 (= res!1004918 (validKeyInArray!0 (select (arr!47983 a!2862) j!93)))))

(declare-fun b!1479993 () Bool)

(declare-fun res!1004928 () Bool)

(assert (=> b!1479993 (=> (not res!1004928) (not e!830327))))

(assert (=> b!1479993 (= res!1004928 e!830324)))

(declare-fun c!137062 () Bool)

(assert (=> b!1479993 (= c!137062 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1004922 () Bool)

(assert (=> start!126474 (=> (not res!1004922) (not e!830330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126474 (= res!1004922 (validMask!0 mask!2687))))

(assert (=> start!126474 e!830330))

(assert (=> start!126474 true))

(declare-fun array_inv!37264 (array!99418) Bool)

(assert (=> start!126474 (array_inv!37264 a!2862)))

(declare-fun b!1479996 () Bool)

(assert (=> b!1479996 (= e!830328 e!830331)))

(declare-fun res!1004923 () Bool)

(assert (=> b!1479996 (=> (not res!1004923) (not e!830331))))

(assert (=> b!1479996 (= res!1004923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47983 a!2862) j!93) mask!2687) (select (arr!47983 a!2862) j!93) a!2862 mask!2687) lt!646262))))

(assert (=> b!1479996 (= lt!646262 (Intermediate!12120 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479997 () Bool)

(declare-fun res!1004917 () Bool)

(assert (=> b!1479997 (=> (not res!1004917) (not e!830330))))

(assert (=> b!1479997 (= res!1004917 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48534 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48534 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48534 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126474 res!1004922) b!1479983))

(assert (= (and b!1479983 res!1004929) b!1479992))

(assert (= (and b!1479992 res!1004919) b!1479995))

(assert (= (and b!1479995 res!1004918) b!1479982))

(assert (= (and b!1479982 res!1004920) b!1479987))

(assert (= (and b!1479987 res!1004927) b!1479997))

(assert (= (and b!1479997 res!1004917) b!1479980))

(assert (= (and b!1479980 res!1004916) b!1479996))

(assert (= (and b!1479996 res!1004923) b!1479985))

(assert (= (and b!1479985 res!1004924) b!1479988))

(assert (= (and b!1479988 res!1004926) b!1479993))

(assert (= (and b!1479993 c!137062) b!1479991))

(assert (= (and b!1479993 (not c!137062)) b!1479981))

(assert (= (and b!1479993 res!1004928) b!1479989))

(assert (= (and b!1479989 res!1004925) b!1479986))

(assert (= (and b!1479986 res!1004915) b!1479994))

(assert (= (and b!1479994 (not res!1004921)) b!1479984))

(assert (= (and b!1479984 res!1004930) b!1479990))

(declare-fun m!1365877 () Bool)

(assert (=> b!1479995 m!1365877))

(assert (=> b!1479995 m!1365877))

(declare-fun m!1365879 () Bool)

(assert (=> b!1479995 m!1365879))

(declare-fun m!1365881 () Bool)

(assert (=> b!1479987 m!1365881))

(declare-fun m!1365883 () Bool)

(assert (=> b!1479991 m!1365883))

(assert (=> b!1479984 m!1365877))

(assert (=> b!1479984 m!1365877))

(declare-fun m!1365885 () Bool)

(assert (=> b!1479984 m!1365885))

(declare-fun m!1365887 () Bool)

(assert (=> b!1479980 m!1365887))

(declare-fun m!1365889 () Bool)

(assert (=> b!1479980 m!1365889))

(declare-fun m!1365891 () Bool)

(assert (=> b!1479981 m!1365891))

(declare-fun m!1365893 () Bool)

(assert (=> b!1479981 m!1365893))

(assert (=> b!1479985 m!1365877))

(assert (=> b!1479985 m!1365877))

(declare-fun m!1365895 () Bool)

(assert (=> b!1479985 m!1365895))

(declare-fun m!1365897 () Bool)

(assert (=> b!1479988 m!1365897))

(assert (=> b!1479988 m!1365897))

(declare-fun m!1365899 () Bool)

(assert (=> b!1479988 m!1365899))

(assert (=> b!1479988 m!1365887))

(declare-fun m!1365901 () Bool)

(assert (=> b!1479988 m!1365901))

(declare-fun m!1365903 () Bool)

(assert (=> b!1479994 m!1365903))

(assert (=> b!1479994 m!1365887))

(declare-fun m!1365905 () Bool)

(assert (=> b!1479994 m!1365905))

(assert (=> b!1479994 m!1365877))

(assert (=> b!1479996 m!1365877))

(assert (=> b!1479996 m!1365877))

(declare-fun m!1365907 () Bool)

(assert (=> b!1479996 m!1365907))

(assert (=> b!1479996 m!1365907))

(assert (=> b!1479996 m!1365877))

(declare-fun m!1365909 () Bool)

(assert (=> b!1479996 m!1365909))

(declare-fun m!1365911 () Bool)

(assert (=> b!1479982 m!1365911))

(declare-fun m!1365913 () Bool)

(assert (=> start!126474 m!1365913))

(declare-fun m!1365915 () Bool)

(assert (=> start!126474 m!1365915))

(declare-fun m!1365917 () Bool)

(assert (=> b!1479986 m!1365917))

(declare-fun m!1365919 () Bool)

(assert (=> b!1479986 m!1365919))

(assert (=> b!1479986 m!1365877))

(declare-fun m!1365921 () Bool)

(assert (=> b!1479986 m!1365921))

(declare-fun m!1365923 () Bool)

(assert (=> b!1479986 m!1365923))

(assert (=> b!1479986 m!1365877))

(declare-fun m!1365925 () Bool)

(assert (=> b!1479992 m!1365925))

(assert (=> b!1479992 m!1365925))

(declare-fun m!1365927 () Bool)

(assert (=> b!1479992 m!1365927))

(check-sat (not b!1479981) (not b!1479984) (not b!1479992) (not b!1479986) (not b!1479996) (not b!1479995) (not b!1479987) (not b!1479982) (not b!1479991) (not b!1479988) (not start!126474) (not b!1479985))
(check-sat)
