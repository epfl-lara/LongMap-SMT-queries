; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124524 () Bool)

(assert start!124524)

(declare-fun res!973411 () Bool)

(declare-fun e!812362 () Bool)

(assert (=> start!124524 (=> (not res!973411) (not e!812362))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124524 (= res!973411 (validMask!0 mask!2687))))

(assert (=> start!124524 e!812362))

(assert (=> start!124524 true))

(declare-datatypes ((array!97972 0))(
  ( (array!97973 (arr!47274 (Array (_ BitVec 32) (_ BitVec 64))) (size!47824 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97972)

(declare-fun array_inv!36302 (array!97972) Bool)

(assert (=> start!124524 (array_inv!36302 a!2862)))

(declare-fun b!1440987 () Bool)

(declare-fun e!812361 () Bool)

(assert (=> b!1440987 (= e!812361 false)))

(declare-fun lt!633067 () Bool)

(declare-fun e!812364 () Bool)

(assert (=> b!1440987 (= lt!633067 e!812364)))

(declare-fun c!133302 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1440987 (= c!133302 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1440988 () Bool)

(declare-fun res!973408 () Bool)

(assert (=> b!1440988 (=> (not res!973408) (not e!812362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97972 (_ BitVec 32)) Bool)

(assert (=> b!1440988 (= res!973408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440989 () Bool)

(declare-fun e!812363 () Bool)

(declare-fun e!812365 () Bool)

(assert (=> b!1440989 (= e!812363 e!812365)))

(declare-fun res!973412 () Bool)

(assert (=> b!1440989 (=> (not res!973412) (not e!812365))))

(declare-datatypes ((SeekEntryResult!11526 0))(
  ( (MissingZero!11526 (index!48496 (_ BitVec 32))) (Found!11526 (index!48497 (_ BitVec 32))) (Intermediate!11526 (undefined!12338 Bool) (index!48498 (_ BitVec 32)) (x!130215 (_ BitVec 32))) (Undefined!11526) (MissingVacant!11526 (index!48499 (_ BitVec 32))) )
))
(declare-fun lt!633065 () SeekEntryResult!11526)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97972 (_ BitVec 32)) SeekEntryResult!11526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440989 (= res!973412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47274 a!2862) j!93) mask!2687) (select (arr!47274 a!2862) j!93) a!2862 mask!2687) lt!633065))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440989 (= lt!633065 (Intermediate!11526 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440990 () Bool)

(declare-fun res!973410 () Bool)

(assert (=> b!1440990 (=> (not res!973410) (not e!812362))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440990 (= res!973410 (and (= (size!47824 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47824 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47824 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440991 () Bool)

(declare-fun res!973405 () Bool)

(assert (=> b!1440991 (=> (not res!973405) (not e!812362))))

(declare-datatypes ((List!33775 0))(
  ( (Nil!33772) (Cons!33771 (h!35121 (_ BitVec 64)) (t!48469 List!33775)) )
))
(declare-fun arrayNoDuplicates!0 (array!97972 (_ BitVec 32) List!33775) Bool)

(assert (=> b!1440991 (= res!973405 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33772))))

(declare-fun b!1440992 () Bool)

(assert (=> b!1440992 (= e!812365 e!812361)))

(declare-fun res!973413 () Bool)

(assert (=> b!1440992 (=> (not res!973413) (not e!812361))))

(declare-fun lt!633069 () SeekEntryResult!11526)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440992 (= res!973413 (= lt!633069 (Intermediate!11526 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633068 () (_ BitVec 64))

(declare-fun lt!633066 () array!97972)

(assert (=> b!1440992 (= lt!633069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633068 mask!2687) lt!633068 lt!633066 mask!2687))))

(assert (=> b!1440992 (= lt!633068 (select (store (arr!47274 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1440993 () Bool)

(assert (=> b!1440993 (= e!812362 e!812363)))

(declare-fun res!973414 () Bool)

(assert (=> b!1440993 (=> (not res!973414) (not e!812363))))

(assert (=> b!1440993 (= res!973414 (= (select (store (arr!47274 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440993 (= lt!633066 (array!97973 (store (arr!47274 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47824 a!2862)))))

(declare-fun b!1440994 () Bool)

(declare-fun res!973404 () Bool)

(assert (=> b!1440994 (=> (not res!973404) (not e!812362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440994 (= res!973404 (validKeyInArray!0 (select (arr!47274 a!2862) i!1006)))))

(declare-fun b!1440995 () Bool)

(declare-fun res!973409 () Bool)

(assert (=> b!1440995 (=> (not res!973409) (not e!812365))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440995 (= res!973409 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47274 a!2862) j!93) a!2862 mask!2687) lt!633065))))

(declare-fun b!1440996 () Bool)

(declare-fun res!973406 () Bool)

(assert (=> b!1440996 (=> (not res!973406) (not e!812362))))

(assert (=> b!1440996 (= res!973406 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47824 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47824 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47824 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1440997 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97972 (_ BitVec 32)) SeekEntryResult!11526)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97972 (_ BitVec 32)) SeekEntryResult!11526)

(assert (=> b!1440997 (= e!812364 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633068 lt!633066 mask!2687) (seekEntryOrOpen!0 lt!633068 lt!633066 mask!2687))))))

(declare-fun b!1440998 () Bool)

(declare-fun res!973407 () Bool)

(assert (=> b!1440998 (=> (not res!973407) (not e!812362))))

(assert (=> b!1440998 (= res!973407 (validKeyInArray!0 (select (arr!47274 a!2862) j!93)))))

(declare-fun b!1440999 () Bool)

(assert (=> b!1440999 (= e!812364 (not (= lt!633069 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633068 lt!633066 mask!2687))))))

(assert (= (and start!124524 res!973411) b!1440990))

(assert (= (and b!1440990 res!973410) b!1440994))

(assert (= (and b!1440994 res!973404) b!1440998))

(assert (= (and b!1440998 res!973407) b!1440988))

(assert (= (and b!1440988 res!973408) b!1440991))

(assert (= (and b!1440991 res!973405) b!1440996))

(assert (= (and b!1440996 res!973406) b!1440993))

(assert (= (and b!1440993 res!973414) b!1440989))

(assert (= (and b!1440989 res!973412) b!1440995))

(assert (= (and b!1440995 res!973409) b!1440992))

(assert (= (and b!1440992 res!973413) b!1440987))

(assert (= (and b!1440987 c!133302) b!1440999))

(assert (= (and b!1440987 (not c!133302)) b!1440997))

(declare-fun m!1330221 () Bool)

(assert (=> start!124524 m!1330221))

(declare-fun m!1330223 () Bool)

(assert (=> start!124524 m!1330223))

(declare-fun m!1330225 () Bool)

(assert (=> b!1440997 m!1330225))

(declare-fun m!1330227 () Bool)

(assert (=> b!1440997 m!1330227))

(declare-fun m!1330229 () Bool)

(assert (=> b!1440992 m!1330229))

(assert (=> b!1440992 m!1330229))

(declare-fun m!1330231 () Bool)

(assert (=> b!1440992 m!1330231))

(declare-fun m!1330233 () Bool)

(assert (=> b!1440992 m!1330233))

(declare-fun m!1330235 () Bool)

(assert (=> b!1440992 m!1330235))

(declare-fun m!1330237 () Bool)

(assert (=> b!1440998 m!1330237))

(assert (=> b!1440998 m!1330237))

(declare-fun m!1330239 () Bool)

(assert (=> b!1440998 m!1330239))

(assert (=> b!1440995 m!1330237))

(assert (=> b!1440995 m!1330237))

(declare-fun m!1330241 () Bool)

(assert (=> b!1440995 m!1330241))

(assert (=> b!1440993 m!1330233))

(declare-fun m!1330243 () Bool)

(assert (=> b!1440993 m!1330243))

(declare-fun m!1330245 () Bool)

(assert (=> b!1440991 m!1330245))

(declare-fun m!1330247 () Bool)

(assert (=> b!1440994 m!1330247))

(assert (=> b!1440994 m!1330247))

(declare-fun m!1330249 () Bool)

(assert (=> b!1440994 m!1330249))

(declare-fun m!1330251 () Bool)

(assert (=> b!1440988 m!1330251))

(declare-fun m!1330253 () Bool)

(assert (=> b!1440999 m!1330253))

(assert (=> b!1440989 m!1330237))

(assert (=> b!1440989 m!1330237))

(declare-fun m!1330255 () Bool)

(assert (=> b!1440989 m!1330255))

(assert (=> b!1440989 m!1330255))

(assert (=> b!1440989 m!1330237))

(declare-fun m!1330257 () Bool)

(assert (=> b!1440989 m!1330257))

(check-sat (not b!1440998) (not b!1440994) (not b!1440995) (not b!1440988) (not b!1440991) (not b!1440992) (not start!124524) (not b!1440989) (not b!1440999) (not b!1440997))
(check-sat)
