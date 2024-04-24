; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127284 () Bool)

(assert start!127284)

(declare-fun b!1494281 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!837249 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99832 0))(
  ( (array!99833 (arr!48181 (Array (_ BitVec 32) (_ BitVec 64))) (size!48732 (_ BitVec 32))) )
))
(declare-fun lt!651334 () array!99832)

(declare-fun lt!651333 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12318 0))(
  ( (MissingZero!12318 (index!51664 (_ BitVec 32))) (Found!12318 (index!51665 (_ BitVec 32))) (Intermediate!12318 (undefined!13130 Bool) (index!51666 (_ BitVec 32)) (x!133443 (_ BitVec 32))) (Undefined!12318) (MissingVacant!12318 (index!51667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99832 (_ BitVec 32)) SeekEntryResult!12318)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99832 (_ BitVec 32)) SeekEntryResult!12318)

(assert (=> b!1494281 (= e!837249 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651333 lt!651334 mask!2687) (seekEntryOrOpen!0 lt!651333 lt!651334 mask!2687)))))

(declare-fun b!1494282 () Bool)

(declare-fun res!1016003 () Bool)

(declare-fun e!837253 () Bool)

(assert (=> b!1494282 (=> (not res!1016003) (not e!837253))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99832)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494282 (= res!1016003 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48732 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48732 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48732 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494283 () Bool)

(declare-fun res!1015994 () Bool)

(assert (=> b!1494283 (=> (not res!1015994) (not e!837253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99832 (_ BitVec 32)) Bool)

(assert (=> b!1494283 (= res!1015994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494284 () Bool)

(declare-fun e!837248 () Bool)

(declare-fun e!837252 () Bool)

(assert (=> b!1494284 (= e!837248 e!837252)))

(declare-fun res!1016007 () Bool)

(assert (=> b!1494284 (=> (not res!1016007) (not e!837252))))

(declare-fun lt!651335 () SeekEntryResult!12318)

(assert (=> b!1494284 (= res!1016007 (= lt!651335 (Intermediate!12318 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99832 (_ BitVec 32)) SeekEntryResult!12318)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494284 (= lt!651335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651333 mask!2687) lt!651333 lt!651334 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494284 (= lt!651333 (select (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494285 () Bool)

(declare-fun e!837250 () Bool)

(assert (=> b!1494285 (= e!837250 (or (= (select (arr!48181 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48181 a!2862) intermediateBeforeIndex!19) (select (arr!48181 a!2862) j!93))))))

(declare-fun b!1494286 () Bool)

(declare-fun res!1015997 () Bool)

(assert (=> b!1494286 (=> (not res!1015997) (not e!837252))))

(assert (=> b!1494286 (= res!1015997 e!837249)))

(declare-fun c!138682 () Bool)

(assert (=> b!1494286 (= c!138682 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494287 () Bool)

(declare-fun res!1016006 () Bool)

(assert (=> b!1494287 (=> (not res!1016006) (not e!837252))))

(assert (=> b!1494287 (= res!1016006 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494288 () Bool)

(declare-fun e!837251 () Bool)

(assert (=> b!1494288 (= e!837251 e!837248)))

(declare-fun res!1016008 () Bool)

(assert (=> b!1494288 (=> (not res!1016008) (not e!837248))))

(declare-fun lt!651336 () SeekEntryResult!12318)

(assert (=> b!1494288 (= res!1016008 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48181 a!2862) j!93) mask!2687) (select (arr!48181 a!2862) j!93) a!2862 mask!2687) lt!651336))))

(assert (=> b!1494288 (= lt!651336 (Intermediate!12318 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494289 () Bool)

(declare-fun res!1016004 () Bool)

(assert (=> b!1494289 (=> (not res!1016004) (not e!837248))))

(assert (=> b!1494289 (= res!1016004 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48181 a!2862) j!93) a!2862 mask!2687) lt!651336))))

(declare-fun b!1494290 () Bool)

(declare-fun res!1016001 () Bool)

(assert (=> b!1494290 (=> (not res!1016001) (not e!837253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494290 (= res!1016001 (validKeyInArray!0 (select (arr!48181 a!2862) j!93)))))

(declare-fun b!1494291 () Bool)

(declare-fun res!1015996 () Bool)

(assert (=> b!1494291 (=> (not res!1015996) (not e!837250))))

(assert (=> b!1494291 (= res!1015996 (= (seekEntryOrOpen!0 (select (arr!48181 a!2862) j!93) a!2862 mask!2687) (Found!12318 j!93)))))

(declare-fun b!1494292 () Bool)

(declare-fun res!1015995 () Bool)

(assert (=> b!1494292 (=> (not res!1015995) (not e!837253))))

(assert (=> b!1494292 (= res!1015995 (and (= (size!48732 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48732 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48732 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494294 () Bool)

(assert (=> b!1494294 (= e!837253 e!837251)))

(declare-fun res!1015998 () Bool)

(assert (=> b!1494294 (=> (not res!1015998) (not e!837251))))

(assert (=> b!1494294 (= res!1015998 (= (select (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494294 (= lt!651334 (array!99833 (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48732 a!2862)))))

(declare-fun res!1016005 () Bool)

(assert (=> start!127284 (=> (not res!1016005) (not e!837253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127284 (= res!1016005 (validMask!0 mask!2687))))

(assert (=> start!127284 e!837253))

(assert (=> start!127284 true))

(declare-fun array_inv!37462 (array!99832) Bool)

(assert (=> start!127284 (array_inv!37462 a!2862)))

(declare-fun b!1494293 () Bool)

(declare-fun res!1016009 () Bool)

(assert (=> b!1494293 (=> (not res!1016009) (not e!837253))))

(declare-datatypes ((List!34669 0))(
  ( (Nil!34666) (Cons!34665 (h!36065 (_ BitVec 64)) (t!49355 List!34669)) )
))
(declare-fun arrayNoDuplicates!0 (array!99832 (_ BitVec 32) List!34669) Bool)

(assert (=> b!1494293 (= res!1016009 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34666))))

(declare-fun b!1494295 () Bool)

(declare-fun e!837255 () Bool)

(assert (=> b!1494295 (= e!837255 true)))

(declare-fun lt!651337 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494295 (= lt!651337 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1494296 () Bool)

(declare-fun res!1016000 () Bool)

(assert (=> b!1494296 (=> (not res!1016000) (not e!837253))))

(assert (=> b!1494296 (= res!1016000 (validKeyInArray!0 (select (arr!48181 a!2862) i!1006)))))

(declare-fun b!1494297 () Bool)

(assert (=> b!1494297 (= e!837249 (= lt!651335 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651333 lt!651334 mask!2687)))))

(declare-fun b!1494298 () Bool)

(assert (=> b!1494298 (= e!837252 (not e!837255))))

(declare-fun res!1015999 () Bool)

(assert (=> b!1494298 (=> res!1015999 e!837255)))

(assert (=> b!1494298 (= res!1015999 (or (and (= (select (arr!48181 a!2862) index!646) (select (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48181 a!2862) index!646) (select (arr!48181 a!2862) j!93))) (= (select (arr!48181 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494298 e!837250))

(declare-fun res!1016002 () Bool)

(assert (=> b!1494298 (=> (not res!1016002) (not e!837250))))

(assert (=> b!1494298 (= res!1016002 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50009 0))(
  ( (Unit!50010) )
))
(declare-fun lt!651332 () Unit!50009)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50009)

(assert (=> b!1494298 (= lt!651332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127284 res!1016005) b!1494292))

(assert (= (and b!1494292 res!1015995) b!1494296))

(assert (= (and b!1494296 res!1016000) b!1494290))

(assert (= (and b!1494290 res!1016001) b!1494283))

(assert (= (and b!1494283 res!1015994) b!1494293))

(assert (= (and b!1494293 res!1016009) b!1494282))

(assert (= (and b!1494282 res!1016003) b!1494294))

(assert (= (and b!1494294 res!1015998) b!1494288))

(assert (= (and b!1494288 res!1016008) b!1494289))

(assert (= (and b!1494289 res!1016004) b!1494284))

(assert (= (and b!1494284 res!1016007) b!1494286))

(assert (= (and b!1494286 c!138682) b!1494297))

(assert (= (and b!1494286 (not c!138682)) b!1494281))

(assert (= (and b!1494286 res!1015997) b!1494287))

(assert (= (and b!1494287 res!1016006) b!1494298))

(assert (= (and b!1494298 res!1016002) b!1494291))

(assert (= (and b!1494291 res!1015996) b!1494285))

(assert (= (and b!1494298 (not res!1015999)) b!1494295))

(declare-fun m!1378231 () Bool)

(assert (=> b!1494285 m!1378231))

(declare-fun m!1378233 () Bool)

(assert (=> b!1494285 m!1378233))

(declare-fun m!1378235 () Bool)

(assert (=> b!1494297 m!1378235))

(declare-fun m!1378237 () Bool)

(assert (=> b!1494281 m!1378237))

(declare-fun m!1378239 () Bool)

(assert (=> b!1494281 m!1378239))

(assert (=> b!1494291 m!1378233))

(assert (=> b!1494291 m!1378233))

(declare-fun m!1378241 () Bool)

(assert (=> b!1494291 m!1378241))

(assert (=> b!1494289 m!1378233))

(assert (=> b!1494289 m!1378233))

(declare-fun m!1378243 () Bool)

(assert (=> b!1494289 m!1378243))

(declare-fun m!1378245 () Bool)

(assert (=> b!1494293 m!1378245))

(declare-fun m!1378247 () Bool)

(assert (=> b!1494298 m!1378247))

(declare-fun m!1378249 () Bool)

(assert (=> b!1494298 m!1378249))

(declare-fun m!1378251 () Bool)

(assert (=> b!1494298 m!1378251))

(declare-fun m!1378253 () Bool)

(assert (=> b!1494298 m!1378253))

(declare-fun m!1378255 () Bool)

(assert (=> b!1494298 m!1378255))

(assert (=> b!1494298 m!1378233))

(assert (=> b!1494294 m!1378249))

(declare-fun m!1378257 () Bool)

(assert (=> b!1494294 m!1378257))

(declare-fun m!1378259 () Bool)

(assert (=> b!1494283 m!1378259))

(declare-fun m!1378261 () Bool)

(assert (=> b!1494296 m!1378261))

(assert (=> b!1494296 m!1378261))

(declare-fun m!1378263 () Bool)

(assert (=> b!1494296 m!1378263))

(declare-fun m!1378265 () Bool)

(assert (=> b!1494284 m!1378265))

(assert (=> b!1494284 m!1378265))

(declare-fun m!1378267 () Bool)

(assert (=> b!1494284 m!1378267))

(assert (=> b!1494284 m!1378249))

(declare-fun m!1378269 () Bool)

(assert (=> b!1494284 m!1378269))

(declare-fun m!1378271 () Bool)

(assert (=> start!127284 m!1378271))

(declare-fun m!1378273 () Bool)

(assert (=> start!127284 m!1378273))

(declare-fun m!1378275 () Bool)

(assert (=> b!1494295 m!1378275))

(assert (=> b!1494288 m!1378233))

(assert (=> b!1494288 m!1378233))

(declare-fun m!1378277 () Bool)

(assert (=> b!1494288 m!1378277))

(assert (=> b!1494288 m!1378277))

(assert (=> b!1494288 m!1378233))

(declare-fun m!1378279 () Bool)

(assert (=> b!1494288 m!1378279))

(assert (=> b!1494290 m!1378233))

(assert (=> b!1494290 m!1378233))

(declare-fun m!1378281 () Bool)

(assert (=> b!1494290 m!1378281))

(check-sat (not b!1494288) (not b!1494298) (not b!1494295) (not b!1494290) (not start!127284) (not b!1494296) (not b!1494283) (not b!1494289) (not b!1494297) (not b!1494293) (not b!1494284) (not b!1494291) (not b!1494281))
(check-sat)
