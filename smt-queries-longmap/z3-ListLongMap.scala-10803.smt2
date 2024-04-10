; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126408 () Bool)

(assert start!126408)

(declare-fun b!1482230 () Bool)

(declare-fun res!1007466 () Bool)

(declare-fun e!831204 () Bool)

(assert (=> b!1482230 (=> (not res!1007466) (not e!831204))))

(declare-datatypes ((array!99427 0))(
  ( (array!99428 (arr!47991 (Array (_ BitVec 32) (_ BitVec 64))) (size!48541 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99427)

(declare-datatypes ((List!34492 0))(
  ( (Nil!34489) (Cons!34488 (h!35859 (_ BitVec 64)) (t!49186 List!34492)) )
))
(declare-fun arrayNoDuplicates!0 (array!99427 (_ BitVec 32) List!34492) Bool)

(assert (=> b!1482230 (= res!1007466 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34489))))

(declare-fun b!1482231 () Bool)

(declare-fun e!831203 () Bool)

(assert (=> b!1482231 (= e!831203 (not true))))

(declare-fun e!831202 () Bool)

(assert (=> b!1482231 e!831202))

(declare-fun res!1007463 () Bool)

(assert (=> b!1482231 (=> (not res!1007463) (not e!831202))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99427 (_ BitVec 32)) Bool)

(assert (=> b!1482231 (= res!1007463 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49802 0))(
  ( (Unit!49803) )
))
(declare-fun lt!647010 () Unit!49802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49802)

(assert (=> b!1482231 (= lt!647010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482232 () Bool)

(declare-fun res!1007464 () Bool)

(assert (=> b!1482232 (=> (not res!1007464) (not e!831202))))

(declare-datatypes ((SeekEntryResult!12231 0))(
  ( (MissingZero!12231 (index!51316 (_ BitVec 32))) (Found!12231 (index!51317 (_ BitVec 32))) (Intermediate!12231 (undefined!13043 Bool) (index!51318 (_ BitVec 32)) (x!132898 (_ BitVec 32))) (Undefined!12231) (MissingVacant!12231 (index!51319 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99427 (_ BitVec 32)) SeekEntryResult!12231)

(assert (=> b!1482232 (= res!1007464 (= (seekEntryOrOpen!0 (select (arr!47991 a!2862) j!93) a!2862 mask!2687) (Found!12231 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1482233 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482233 (= e!831202 (and (or (= (select (arr!47991 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47991 a!2862) intermediateBeforeIndex!19) (select (arr!47991 a!2862) j!93))) (or (and (= (select (arr!47991 a!2862) index!646) (select (store (arr!47991 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47991 a!2862) index!646) (select (arr!47991 a!2862) j!93))) (= (select (arr!47991 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47991 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1482234 () Bool)

(declare-fun e!831205 () Bool)

(declare-fun e!831200 () Bool)

(assert (=> b!1482234 (= e!831205 e!831200)))

(declare-fun res!1007462 () Bool)

(assert (=> b!1482234 (=> (not res!1007462) (not e!831200))))

(declare-fun lt!647012 () SeekEntryResult!12231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99427 (_ BitVec 32)) SeekEntryResult!12231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482234 (= res!1007462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47991 a!2862) j!93) mask!2687) (select (arr!47991 a!2862) j!93) a!2862 mask!2687) lt!647012))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482234 (= lt!647012 (Intermediate!12231 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482235 () Bool)

(declare-fun res!1007467 () Bool)

(assert (=> b!1482235 (=> (not res!1007467) (not e!831203))))

(assert (=> b!1482235 (= res!1007467 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482236 () Bool)

(declare-fun res!1007476 () Bool)

(assert (=> b!1482236 (=> (not res!1007476) (not e!831204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482236 (= res!1007476 (validKeyInArray!0 (select (arr!47991 a!2862) j!93)))))

(declare-fun b!1482237 () Bool)

(assert (=> b!1482237 (= e!831200 e!831203)))

(declare-fun res!1007472 () Bool)

(assert (=> b!1482237 (=> (not res!1007472) (not e!831203))))

(declare-fun lt!647011 () SeekEntryResult!12231)

(assert (=> b!1482237 (= res!1007472 (= lt!647011 (Intermediate!12231 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647009 () array!99427)

(declare-fun lt!647013 () (_ BitVec 64))

(assert (=> b!1482237 (= lt!647011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647013 mask!2687) lt!647013 lt!647009 mask!2687))))

(assert (=> b!1482237 (= lt!647013 (select (store (arr!47991 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482238 () Bool)

(declare-fun res!1007469 () Bool)

(assert (=> b!1482238 (=> (not res!1007469) (not e!831200))))

(assert (=> b!1482238 (= res!1007469 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47991 a!2862) j!93) a!2862 mask!2687) lt!647012))))

(declare-fun b!1482239 () Bool)

(declare-fun res!1007465 () Bool)

(assert (=> b!1482239 (=> (not res!1007465) (not e!831204))))

(assert (=> b!1482239 (= res!1007465 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48541 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48541 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48541 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482240 () Bool)

(declare-fun res!1007475 () Bool)

(assert (=> b!1482240 (=> (not res!1007475) (not e!831203))))

(declare-fun e!831206 () Bool)

(assert (=> b!1482240 (= res!1007475 e!831206)))

(declare-fun c!136905 () Bool)

(assert (=> b!1482240 (= c!136905 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1007468 () Bool)

(assert (=> start!126408 (=> (not res!1007468) (not e!831204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126408 (= res!1007468 (validMask!0 mask!2687))))

(assert (=> start!126408 e!831204))

(assert (=> start!126408 true))

(declare-fun array_inv!37019 (array!99427) Bool)

(assert (=> start!126408 (array_inv!37019 a!2862)))

(declare-fun b!1482241 () Bool)

(declare-fun res!1007470 () Bool)

(assert (=> b!1482241 (=> (not res!1007470) (not e!831204))))

(assert (=> b!1482241 (= res!1007470 (and (= (size!48541 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48541 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48541 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482242 () Bool)

(declare-fun res!1007471 () Bool)

(assert (=> b!1482242 (=> (not res!1007471) (not e!831204))))

(assert (=> b!1482242 (= res!1007471 (validKeyInArray!0 (select (arr!47991 a!2862) i!1006)))))

(declare-fun b!1482243 () Bool)

(declare-fun res!1007474 () Bool)

(assert (=> b!1482243 (=> (not res!1007474) (not e!831204))))

(assert (=> b!1482243 (= res!1007474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482244 () Bool)

(assert (=> b!1482244 (= e!831206 (= lt!647011 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647013 lt!647009 mask!2687)))))

(declare-fun b!1482245 () Bool)

(assert (=> b!1482245 (= e!831204 e!831205)))

(declare-fun res!1007473 () Bool)

(assert (=> b!1482245 (=> (not res!1007473) (not e!831205))))

(assert (=> b!1482245 (= res!1007473 (= (select (store (arr!47991 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482245 (= lt!647009 (array!99428 (store (arr!47991 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48541 a!2862)))))

(declare-fun b!1482246 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99427 (_ BitVec 32)) SeekEntryResult!12231)

(assert (=> b!1482246 (= e!831206 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647013 lt!647009 mask!2687) (seekEntryOrOpen!0 lt!647013 lt!647009 mask!2687)))))

(assert (= (and start!126408 res!1007468) b!1482241))

(assert (= (and b!1482241 res!1007470) b!1482242))

(assert (= (and b!1482242 res!1007471) b!1482236))

(assert (= (and b!1482236 res!1007476) b!1482243))

(assert (= (and b!1482243 res!1007474) b!1482230))

(assert (= (and b!1482230 res!1007466) b!1482239))

(assert (= (and b!1482239 res!1007465) b!1482245))

(assert (= (and b!1482245 res!1007473) b!1482234))

(assert (= (and b!1482234 res!1007462) b!1482238))

(assert (= (and b!1482238 res!1007469) b!1482237))

(assert (= (and b!1482237 res!1007472) b!1482240))

(assert (= (and b!1482240 c!136905) b!1482244))

(assert (= (and b!1482240 (not c!136905)) b!1482246))

(assert (= (and b!1482240 res!1007475) b!1482235))

(assert (= (and b!1482235 res!1007467) b!1482231))

(assert (= (and b!1482231 res!1007463) b!1482232))

(assert (= (and b!1482232 res!1007464) b!1482233))

(declare-fun m!1367955 () Bool)

(assert (=> b!1482230 m!1367955))

(declare-fun m!1367957 () Bool)

(assert (=> b!1482234 m!1367957))

(assert (=> b!1482234 m!1367957))

(declare-fun m!1367959 () Bool)

(assert (=> b!1482234 m!1367959))

(assert (=> b!1482234 m!1367959))

(assert (=> b!1482234 m!1367957))

(declare-fun m!1367961 () Bool)

(assert (=> b!1482234 m!1367961))

(declare-fun m!1367963 () Bool)

(assert (=> b!1482233 m!1367963))

(declare-fun m!1367965 () Bool)

(assert (=> b!1482233 m!1367965))

(declare-fun m!1367967 () Bool)

(assert (=> b!1482233 m!1367967))

(declare-fun m!1367969 () Bool)

(assert (=> b!1482233 m!1367969))

(assert (=> b!1482233 m!1367957))

(declare-fun m!1367971 () Bool)

(assert (=> b!1482237 m!1367971))

(assert (=> b!1482237 m!1367971))

(declare-fun m!1367973 () Bool)

(assert (=> b!1482237 m!1367973))

(assert (=> b!1482237 m!1367963))

(declare-fun m!1367975 () Bool)

(assert (=> b!1482237 m!1367975))

(assert (=> b!1482232 m!1367957))

(assert (=> b!1482232 m!1367957))

(declare-fun m!1367977 () Bool)

(assert (=> b!1482232 m!1367977))

(declare-fun m!1367979 () Bool)

(assert (=> b!1482246 m!1367979))

(declare-fun m!1367981 () Bool)

(assert (=> b!1482246 m!1367981))

(assert (=> b!1482245 m!1367963))

(declare-fun m!1367983 () Bool)

(assert (=> b!1482245 m!1367983))

(declare-fun m!1367985 () Bool)

(assert (=> start!126408 m!1367985))

(declare-fun m!1367987 () Bool)

(assert (=> start!126408 m!1367987))

(declare-fun m!1367989 () Bool)

(assert (=> b!1482244 m!1367989))

(declare-fun m!1367991 () Bool)

(assert (=> b!1482243 m!1367991))

(declare-fun m!1367993 () Bool)

(assert (=> b!1482242 m!1367993))

(assert (=> b!1482242 m!1367993))

(declare-fun m!1367995 () Bool)

(assert (=> b!1482242 m!1367995))

(assert (=> b!1482238 m!1367957))

(assert (=> b!1482238 m!1367957))

(declare-fun m!1367997 () Bool)

(assert (=> b!1482238 m!1367997))

(assert (=> b!1482236 m!1367957))

(assert (=> b!1482236 m!1367957))

(declare-fun m!1367999 () Bool)

(assert (=> b!1482236 m!1367999))

(declare-fun m!1368001 () Bool)

(assert (=> b!1482231 m!1368001))

(declare-fun m!1368003 () Bool)

(assert (=> b!1482231 m!1368003))

(check-sat (not b!1482230) (not b!1482236) (not b!1482244) (not b!1482237) (not b!1482242) (not b!1482246) (not start!126408) (not b!1482243) (not b!1482238) (not b!1482231) (not b!1482232) (not b!1482234))
(check-sat)
