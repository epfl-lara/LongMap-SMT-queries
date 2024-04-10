; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124618 () Bool)

(assert start!124618)

(declare-fun b!1443154 () Bool)

(declare-fun e!813277 () Bool)

(declare-fun e!813274 () Bool)

(assert (=> b!1443154 (= e!813277 e!813274)))

(declare-fun res!975291 () Bool)

(assert (=> b!1443154 (=> (not res!975291) (not e!813274))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98066 0))(
  ( (array!98067 (arr!47321 (Array (_ BitVec 32) (_ BitVec 64))) (size!47871 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98066)

(assert (=> b!1443154 (= res!975291 (= (select (store (arr!47321 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633774 () array!98066)

(assert (=> b!1443154 (= lt!633774 (array!98067 (store (arr!47321 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47871 a!2862)))))

(declare-fun b!1443155 () Bool)

(declare-fun res!975295 () Bool)

(declare-fun e!813278 () Bool)

(assert (=> b!1443155 (=> (not res!975295) (not e!813278))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11573 0))(
  ( (MissingZero!11573 (index!48684 (_ BitVec 32))) (Found!11573 (index!48685 (_ BitVec 32))) (Intermediate!11573 (undefined!12385 Bool) (index!48686 (_ BitVec 32)) (x!130390 (_ BitVec 32))) (Undefined!11573) (MissingVacant!11573 (index!48687 (_ BitVec 32))) )
))
(declare-fun lt!633771 () SeekEntryResult!11573)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98066 (_ BitVec 32)) SeekEntryResult!11573)

(assert (=> b!1443155 (= res!975295 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47321 a!2862) j!93) a!2862 mask!2687) lt!633771))))

(declare-fun b!1443156 () Bool)

(declare-fun e!813281 () Bool)

(assert (=> b!1443156 (= e!813278 e!813281)))

(declare-fun res!975298 () Bool)

(assert (=> b!1443156 (=> (not res!975298) (not e!813281))))

(declare-fun lt!633770 () SeekEntryResult!11573)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443156 (= res!975298 (= lt!633770 (Intermediate!11573 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633773 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443156 (= lt!633770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633773 mask!2687) lt!633773 lt!633774 mask!2687))))

(assert (=> b!1443156 (= lt!633773 (select (store (arr!47321 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443157 () Bool)

(declare-fun res!975304 () Bool)

(assert (=> b!1443157 (=> (not res!975304) (not e!813277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98066 (_ BitVec 32)) Bool)

(assert (=> b!1443157 (= res!975304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443158 () Bool)

(declare-fun res!975303 () Bool)

(declare-fun e!813275 () Bool)

(assert (=> b!1443158 (=> (not res!975303) (not e!813275))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98066 (_ BitVec 32)) SeekEntryResult!11573)

(assert (=> b!1443158 (= res!975303 (= (seekEntryOrOpen!0 (select (arr!47321 a!2862) j!93) a!2862 mask!2687) (Found!11573 j!93)))))

(declare-fun b!1443159 () Bool)

(assert (=> b!1443159 (= e!813274 e!813278)))

(declare-fun res!975300 () Bool)

(assert (=> b!1443159 (=> (not res!975300) (not e!813278))))

(assert (=> b!1443159 (= res!975300 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47321 a!2862) j!93) mask!2687) (select (arr!47321 a!2862) j!93) a!2862 mask!2687) lt!633771))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443159 (= lt!633771 (Intermediate!11573 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!813276 () Bool)

(declare-fun b!1443160 () Bool)

(assert (=> b!1443160 (= e!813276 (= lt!633770 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633773 lt!633774 mask!2687)))))

(declare-fun b!1443161 () Bool)

(declare-fun res!975293 () Bool)

(assert (=> b!1443161 (=> (not res!975293) (not e!813277))))

(assert (=> b!1443161 (= res!975293 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47871 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47871 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47871 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443162 () Bool)

(declare-fun res!975294 () Bool)

(assert (=> b!1443162 (=> (not res!975294) (not e!813277))))

(assert (=> b!1443162 (= res!975294 (and (= (size!47871 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47871 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47871 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!975290 () Bool)

(assert (=> start!124618 (=> (not res!975290) (not e!813277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124618 (= res!975290 (validMask!0 mask!2687))))

(assert (=> start!124618 e!813277))

(assert (=> start!124618 true))

(declare-fun array_inv!36349 (array!98066) Bool)

(assert (=> start!124618 (array_inv!36349 a!2862)))

(declare-fun b!1443163 () Bool)

(declare-fun res!975301 () Bool)

(assert (=> b!1443163 (=> (not res!975301) (not e!813281))))

(assert (=> b!1443163 (= res!975301 e!813276)))

(declare-fun c!133443 () Bool)

(assert (=> b!1443163 (= c!133443 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443164 () Bool)

(declare-fun res!975292 () Bool)

(assert (=> b!1443164 (=> (not res!975292) (not e!813277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443164 (= res!975292 (validKeyInArray!0 (select (arr!47321 a!2862) j!93)))))

(declare-fun b!1443165 () Bool)

(declare-fun res!975299 () Bool)

(assert (=> b!1443165 (=> (not res!975299) (not e!813281))))

(assert (=> b!1443165 (= res!975299 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443166 () Bool)

(declare-fun res!975296 () Bool)

(assert (=> b!1443166 (=> (not res!975296) (not e!813277))))

(declare-datatypes ((List!33822 0))(
  ( (Nil!33819) (Cons!33818 (h!35168 (_ BitVec 64)) (t!48516 List!33822)) )
))
(declare-fun arrayNoDuplicates!0 (array!98066 (_ BitVec 32) List!33822) Bool)

(assert (=> b!1443166 (= res!975296 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33819))))

(declare-fun b!1443167 () Bool)

(assert (=> b!1443167 (= e!813275 (or (= (select (arr!47321 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47321 a!2862) intermediateBeforeIndex!19) (select (arr!47321 a!2862) j!93))))))

(declare-fun b!1443168 () Bool)

(declare-fun e!813279 () Bool)

(assert (=> b!1443168 (= e!813279 (validKeyInArray!0 lt!633773))))

(declare-fun b!1443169 () Bool)

(assert (=> b!1443169 (= e!813281 (not e!813279))))

(declare-fun res!975297 () Bool)

(assert (=> b!1443169 (=> res!975297 e!813279)))

(assert (=> b!1443169 (= res!975297 (or (not (= (select (arr!47321 a!2862) index!646) (select (store (arr!47321 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47321 a!2862) index!646) (select (arr!47321 a!2862) j!93))) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1443169 e!813275))

(declare-fun res!975289 () Bool)

(assert (=> b!1443169 (=> (not res!975289) (not e!813275))))

(assert (=> b!1443169 (= res!975289 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48642 0))(
  ( (Unit!48643) )
))
(declare-fun lt!633772 () Unit!48642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48642)

(assert (=> b!1443169 (= lt!633772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443170 () Bool)

(declare-fun res!975302 () Bool)

(assert (=> b!1443170 (=> (not res!975302) (not e!813277))))

(assert (=> b!1443170 (= res!975302 (validKeyInArray!0 (select (arr!47321 a!2862) i!1006)))))

(declare-fun b!1443171 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98066 (_ BitVec 32)) SeekEntryResult!11573)

(assert (=> b!1443171 (= e!813276 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633773 lt!633774 mask!2687) (seekEntryOrOpen!0 lt!633773 lt!633774 mask!2687)))))

(assert (= (and start!124618 res!975290) b!1443162))

(assert (= (and b!1443162 res!975294) b!1443170))

(assert (= (and b!1443170 res!975302) b!1443164))

(assert (= (and b!1443164 res!975292) b!1443157))

(assert (= (and b!1443157 res!975304) b!1443166))

(assert (= (and b!1443166 res!975296) b!1443161))

(assert (= (and b!1443161 res!975293) b!1443154))

(assert (= (and b!1443154 res!975291) b!1443159))

(assert (= (and b!1443159 res!975300) b!1443155))

(assert (= (and b!1443155 res!975295) b!1443156))

(assert (= (and b!1443156 res!975298) b!1443163))

(assert (= (and b!1443163 c!133443) b!1443160))

(assert (= (and b!1443163 (not c!133443)) b!1443171))

(assert (= (and b!1443163 res!975301) b!1443165))

(assert (= (and b!1443165 res!975299) b!1443169))

(assert (= (and b!1443169 res!975289) b!1443158))

(assert (= (and b!1443158 res!975303) b!1443167))

(assert (= (and b!1443169 (not res!975297)) b!1443168))

(declare-fun m!1332247 () Bool)

(assert (=> b!1443155 m!1332247))

(assert (=> b!1443155 m!1332247))

(declare-fun m!1332249 () Bool)

(assert (=> b!1443155 m!1332249))

(declare-fun m!1332251 () Bool)

(assert (=> b!1443169 m!1332251))

(declare-fun m!1332253 () Bool)

(assert (=> b!1443169 m!1332253))

(declare-fun m!1332255 () Bool)

(assert (=> b!1443169 m!1332255))

(declare-fun m!1332257 () Bool)

(assert (=> b!1443169 m!1332257))

(declare-fun m!1332259 () Bool)

(assert (=> b!1443169 m!1332259))

(assert (=> b!1443169 m!1332247))

(declare-fun m!1332261 () Bool)

(assert (=> b!1443160 m!1332261))

(assert (=> b!1443164 m!1332247))

(assert (=> b!1443164 m!1332247))

(declare-fun m!1332263 () Bool)

(assert (=> b!1443164 m!1332263))

(assert (=> b!1443159 m!1332247))

(assert (=> b!1443159 m!1332247))

(declare-fun m!1332265 () Bool)

(assert (=> b!1443159 m!1332265))

(assert (=> b!1443159 m!1332265))

(assert (=> b!1443159 m!1332247))

(declare-fun m!1332267 () Bool)

(assert (=> b!1443159 m!1332267))

(declare-fun m!1332269 () Bool)

(assert (=> b!1443171 m!1332269))

(declare-fun m!1332271 () Bool)

(assert (=> b!1443171 m!1332271))

(declare-fun m!1332273 () Bool)

(assert (=> b!1443156 m!1332273))

(assert (=> b!1443156 m!1332273))

(declare-fun m!1332275 () Bool)

(assert (=> b!1443156 m!1332275))

(assert (=> b!1443156 m!1332253))

(declare-fun m!1332277 () Bool)

(assert (=> b!1443156 m!1332277))

(declare-fun m!1332279 () Bool)

(assert (=> b!1443168 m!1332279))

(declare-fun m!1332281 () Bool)

(assert (=> b!1443166 m!1332281))

(assert (=> b!1443158 m!1332247))

(assert (=> b!1443158 m!1332247))

(declare-fun m!1332283 () Bool)

(assert (=> b!1443158 m!1332283))

(declare-fun m!1332285 () Bool)

(assert (=> b!1443170 m!1332285))

(assert (=> b!1443170 m!1332285))

(declare-fun m!1332287 () Bool)

(assert (=> b!1443170 m!1332287))

(declare-fun m!1332289 () Bool)

(assert (=> start!124618 m!1332289))

(declare-fun m!1332291 () Bool)

(assert (=> start!124618 m!1332291))

(declare-fun m!1332293 () Bool)

(assert (=> b!1443167 m!1332293))

(assert (=> b!1443167 m!1332247))

(declare-fun m!1332295 () Bool)

(assert (=> b!1443157 m!1332295))

(assert (=> b!1443154 m!1332253))

(declare-fun m!1332297 () Bool)

(assert (=> b!1443154 m!1332297))

(push 1)

