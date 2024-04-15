; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127220 () Bool)

(assert start!127220)

(declare-datatypes ((array!99739 0))(
  ( (array!99740 (arr!48136 (Array (_ BitVec 32) (_ BitVec 64))) (size!48688 (_ BitVec 32))) )
))
(declare-fun lt!651523 () array!99739)

(declare-fun lt!651525 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1495292 () Bool)

(declare-fun e!837522 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!651526 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12401 0))(
  ( (MissingZero!12401 (index!51996 (_ BitVec 32))) (Found!12401 (index!51997 (_ BitVec 32))) (Intermediate!12401 (undefined!13213 Bool) (index!51998 (_ BitVec 32)) (x!133610 (_ BitVec 32))) (Undefined!12401) (MissingVacant!12401 (index!51999 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12401)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12401)

(assert (=> b!1495292 (= e!837522 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651525 intermediateAfterIndex!19 lt!651526 lt!651523 mask!2687) (seekEntryOrOpen!0 lt!651526 lt!651523 mask!2687))))))

(declare-fun b!1495293 () Bool)

(declare-fun res!1017217 () Bool)

(declare-fun e!837527 () Bool)

(assert (=> b!1495293 (=> (not res!1017217) (not e!837527))))

(declare-fun a!2862 () array!99739)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495293 (= res!1017217 (validKeyInArray!0 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1495294 () Bool)

(declare-fun e!837520 () Bool)

(declare-fun e!837518 () Bool)

(assert (=> b!1495294 (= e!837520 e!837518)))

(declare-fun res!1017220 () Bool)

(assert (=> b!1495294 (=> (not res!1017220) (not e!837518))))

(declare-fun lt!651524 () SeekEntryResult!12401)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495294 (= res!1017220 (= lt!651524 (Intermediate!12401 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495294 (= lt!651524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651526 mask!2687) lt!651526 lt!651523 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495294 (= lt!651526 (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1017230 () Bool)

(assert (=> start!127220 (=> (not res!1017230) (not e!837527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127220 (= res!1017230 (validMask!0 mask!2687))))

(assert (=> start!127220 e!837527))

(assert (=> start!127220 true))

(declare-fun array_inv!37369 (array!99739) Bool)

(assert (=> start!127220 (array_inv!37369 a!2862)))

(declare-fun b!1495295 () Bool)

(declare-fun e!837525 () Bool)

(assert (=> b!1495295 (= e!837527 e!837525)))

(declare-fun res!1017232 () Bool)

(assert (=> b!1495295 (=> (not res!1017232) (not e!837525))))

(assert (=> b!1495295 (= res!1017232 (= (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495295 (= lt!651523 (array!99740 (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48688 a!2862)))))

(declare-fun b!1495296 () Bool)

(declare-fun res!1017228 () Bool)

(declare-fun e!837526 () Bool)

(assert (=> b!1495296 (=> res!1017228 e!837526)))

(assert (=> b!1495296 (= res!1017228 e!837522)))

(declare-fun c!138573 () Bool)

(assert (=> b!1495296 (= c!138573 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1495297 () Bool)

(declare-fun res!1017224 () Bool)

(assert (=> b!1495297 (=> (not res!1017224) (not e!837518))))

(declare-fun e!837521 () Bool)

(assert (=> b!1495297 (= res!1017224 e!837521)))

(declare-fun c!138574 () Bool)

(assert (=> b!1495297 (= c!138574 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495298 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495298 (= e!837526 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1495299 () Bool)

(declare-fun res!1017225 () Bool)

(declare-fun e!837523 () Bool)

(assert (=> b!1495299 (=> (not res!1017225) (not e!837523))))

(assert (=> b!1495299 (= res!1017225 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) (Found!12401 j!93)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1495300 () Bool)

(assert (=> b!1495300 (= e!837521 (= lt!651524 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651526 lt!651523 mask!2687)))))

(declare-fun b!1495301 () Bool)

(declare-fun res!1017233 () Bool)

(assert (=> b!1495301 (=> (not res!1017233) (not e!837520))))

(declare-fun lt!651522 () SeekEntryResult!12401)

(assert (=> b!1495301 (= res!1017233 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651522))))

(declare-fun b!1495302 () Bool)

(declare-fun res!1017231 () Bool)

(assert (=> b!1495302 (=> (not res!1017231) (not e!837527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99739 (_ BitVec 32)) Bool)

(assert (=> b!1495302 (= res!1017231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495303 () Bool)

(assert (=> b!1495303 (= e!837521 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651526 lt!651523 mask!2687) (seekEntryOrOpen!0 lt!651526 lt!651523 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1495304 () Bool)

(assert (=> b!1495304 (= e!837523 (or (= (select (arr!48136 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48136 a!2862) intermediateBeforeIndex!19) (select (arr!48136 a!2862) j!93))))))

(declare-fun b!1495305 () Bool)

(declare-fun e!837524 () Bool)

(assert (=> b!1495305 (= e!837518 (not e!837524))))

(declare-fun res!1017234 () Bool)

(assert (=> b!1495305 (=> res!1017234 e!837524)))

(assert (=> b!1495305 (= res!1017234 (or (and (= (select (arr!48136 a!2862) index!646) (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48136 a!2862) index!646) (select (arr!48136 a!2862) j!93))) (= (select (arr!48136 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495305 e!837523))

(declare-fun res!1017219 () Bool)

(assert (=> b!1495305 (=> (not res!1017219) (not e!837523))))

(assert (=> b!1495305 (= res!1017219 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49983 0))(
  ( (Unit!49984) )
))
(declare-fun lt!651527 () Unit!49983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49983)

(assert (=> b!1495305 (= lt!651527 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495306 () Bool)

(declare-fun res!1017235 () Bool)

(assert (=> b!1495306 (=> (not res!1017235) (not e!837527))))

(declare-datatypes ((List!34715 0))(
  ( (Nil!34712) (Cons!34711 (h!36106 (_ BitVec 64)) (t!49401 List!34715)) )
))
(declare-fun arrayNoDuplicates!0 (array!99739 (_ BitVec 32) List!34715) Bool)

(assert (=> b!1495306 (= res!1017235 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34712))))

(declare-fun b!1495307 () Bool)

(declare-fun res!1017218 () Bool)

(assert (=> b!1495307 (=> res!1017218 e!837526)))

(assert (=> b!1495307 (= res!1017218 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651525 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651522)))))

(declare-fun b!1495308 () Bool)

(declare-fun res!1017223 () Bool)

(assert (=> b!1495308 (=> (not res!1017223) (not e!837527))))

(assert (=> b!1495308 (= res!1017223 (validKeyInArray!0 (select (arr!48136 a!2862) i!1006)))))

(declare-fun b!1495309 () Bool)

(declare-fun res!1017222 () Bool)

(assert (=> b!1495309 (=> (not res!1017222) (not e!837527))))

(assert (=> b!1495309 (= res!1017222 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48688 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48688 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48688 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495310 () Bool)

(assert (=> b!1495310 (= e!837525 e!837520)))

(declare-fun res!1017221 () Bool)

(assert (=> b!1495310 (=> (not res!1017221) (not e!837520))))

(assert (=> b!1495310 (= res!1017221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651522))))

(assert (=> b!1495310 (= lt!651522 (Intermediate!12401 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495311 () Bool)

(assert (=> b!1495311 (= e!837522 (not (= lt!651524 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651525 lt!651526 lt!651523 mask!2687))))))

(declare-fun b!1495312 () Bool)

(declare-fun res!1017229 () Bool)

(assert (=> b!1495312 (=> (not res!1017229) (not e!837518))))

(assert (=> b!1495312 (= res!1017229 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495313 () Bool)

(assert (=> b!1495313 (= e!837524 e!837526)))

(declare-fun res!1017226 () Bool)

(assert (=> b!1495313 (=> res!1017226 e!837526)))

(assert (=> b!1495313 (= res!1017226 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651525 #b00000000000000000000000000000000) (bvsge lt!651525 (size!48688 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495313 (= lt!651525 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1495314 () Bool)

(declare-fun res!1017227 () Bool)

(assert (=> b!1495314 (=> (not res!1017227) (not e!837527))))

(assert (=> b!1495314 (= res!1017227 (and (= (size!48688 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48688 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48688 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!127220 res!1017230) b!1495314))

(assert (= (and b!1495314 res!1017227) b!1495308))

(assert (= (and b!1495308 res!1017223) b!1495293))

(assert (= (and b!1495293 res!1017217) b!1495302))

(assert (= (and b!1495302 res!1017231) b!1495306))

(assert (= (and b!1495306 res!1017235) b!1495309))

(assert (= (and b!1495309 res!1017222) b!1495295))

(assert (= (and b!1495295 res!1017232) b!1495310))

(assert (= (and b!1495310 res!1017221) b!1495301))

(assert (= (and b!1495301 res!1017233) b!1495294))

(assert (= (and b!1495294 res!1017220) b!1495297))

(assert (= (and b!1495297 c!138574) b!1495300))

(assert (= (and b!1495297 (not c!138574)) b!1495303))

(assert (= (and b!1495297 res!1017224) b!1495312))

(assert (= (and b!1495312 res!1017229) b!1495305))

(assert (= (and b!1495305 res!1017219) b!1495299))

(assert (= (and b!1495299 res!1017225) b!1495304))

(assert (= (and b!1495305 (not res!1017234)) b!1495313))

(assert (= (and b!1495313 (not res!1017226)) b!1495307))

(assert (= (and b!1495307 (not res!1017218)) b!1495296))

(assert (= (and b!1495296 c!138573) b!1495311))

(assert (= (and b!1495296 (not c!138573)) b!1495292))

(assert (= (and b!1495296 (not res!1017228)) b!1495298))

(declare-fun m!1378149 () Bool)

(assert (=> b!1495300 m!1378149))

(declare-fun m!1378151 () Bool)

(assert (=> b!1495303 m!1378151))

(declare-fun m!1378153 () Bool)

(assert (=> b!1495303 m!1378153))

(declare-fun m!1378155 () Bool)

(assert (=> b!1495295 m!1378155))

(declare-fun m!1378157 () Bool)

(assert (=> b!1495295 m!1378157))

(declare-fun m!1378159 () Bool)

(assert (=> b!1495310 m!1378159))

(assert (=> b!1495310 m!1378159))

(declare-fun m!1378161 () Bool)

(assert (=> b!1495310 m!1378161))

(assert (=> b!1495310 m!1378161))

(assert (=> b!1495310 m!1378159))

(declare-fun m!1378163 () Bool)

(assert (=> b!1495310 m!1378163))

(declare-fun m!1378165 () Bool)

(assert (=> b!1495294 m!1378165))

(assert (=> b!1495294 m!1378165))

(declare-fun m!1378167 () Bool)

(assert (=> b!1495294 m!1378167))

(assert (=> b!1495294 m!1378155))

(declare-fun m!1378169 () Bool)

(assert (=> b!1495294 m!1378169))

(assert (=> b!1495307 m!1378159))

(assert (=> b!1495307 m!1378159))

(declare-fun m!1378171 () Bool)

(assert (=> b!1495307 m!1378171))

(declare-fun m!1378173 () Bool)

(assert (=> b!1495313 m!1378173))

(declare-fun m!1378175 () Bool)

(assert (=> b!1495304 m!1378175))

(assert (=> b!1495304 m!1378159))

(declare-fun m!1378177 () Bool)

(assert (=> b!1495292 m!1378177))

(assert (=> b!1495292 m!1378153))

(declare-fun m!1378179 () Bool)

(assert (=> b!1495305 m!1378179))

(assert (=> b!1495305 m!1378155))

(declare-fun m!1378181 () Bool)

(assert (=> b!1495305 m!1378181))

(declare-fun m!1378183 () Bool)

(assert (=> b!1495305 m!1378183))

(declare-fun m!1378185 () Bool)

(assert (=> b!1495305 m!1378185))

(assert (=> b!1495305 m!1378159))

(assert (=> b!1495293 m!1378159))

(assert (=> b!1495293 m!1378159))

(declare-fun m!1378187 () Bool)

(assert (=> b!1495293 m!1378187))

(declare-fun m!1378189 () Bool)

(assert (=> b!1495306 m!1378189))

(declare-fun m!1378191 () Bool)

(assert (=> b!1495302 m!1378191))

(declare-fun m!1378193 () Bool)

(assert (=> b!1495308 m!1378193))

(assert (=> b!1495308 m!1378193))

(declare-fun m!1378195 () Bool)

(assert (=> b!1495308 m!1378195))

(assert (=> b!1495299 m!1378159))

(assert (=> b!1495299 m!1378159))

(declare-fun m!1378197 () Bool)

(assert (=> b!1495299 m!1378197))

(assert (=> b!1495301 m!1378159))

(assert (=> b!1495301 m!1378159))

(declare-fun m!1378199 () Bool)

(assert (=> b!1495301 m!1378199))

(declare-fun m!1378201 () Bool)

(assert (=> start!127220 m!1378201))

(declare-fun m!1378203 () Bool)

(assert (=> start!127220 m!1378203))

(declare-fun m!1378205 () Bool)

(assert (=> b!1495311 m!1378205))

(check-sat (not b!1495310) (not b!1495294) (not b!1495301) (not start!127220) (not b!1495299) (not b!1495313) (not b!1495308) (not b!1495302) (not b!1495311) (not b!1495307) (not b!1495292) (not b!1495300) (not b!1495303) (not b!1495293) (not b!1495305) (not b!1495306))
(check-sat)
(get-model)

(declare-fun d!157039 () Bool)

(assert (=> d!157039 (= (validKeyInArray!0 (select (arr!48136 a!2862) i!1006)) (and (not (= (select (arr!48136 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48136 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495308 d!157039))

(declare-fun b!1495471 () Bool)

(declare-fun e!837600 () SeekEntryResult!12401)

(assert (=> b!1495471 (= e!837600 (Intermediate!12401 false lt!651525 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495472 () Bool)

(declare-fun e!837598 () Bool)

(declare-fun lt!651569 () SeekEntryResult!12401)

(assert (=> b!1495472 (= e!837598 (bvsge (x!133610 lt!651569) #b01111111111111111111111111111110))))

(declare-fun b!1495474 () Bool)

(declare-fun e!837602 () SeekEntryResult!12401)

(assert (=> b!1495474 (= e!837602 e!837600)))

(declare-fun lt!651568 () (_ BitVec 64))

(declare-fun c!138595 () Bool)

(assert (=> b!1495474 (= c!138595 (or (= lt!651568 (select (arr!48136 a!2862) j!93)) (= (bvadd lt!651568 lt!651568) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495475 () Bool)

(assert (=> b!1495475 (and (bvsge (index!51998 lt!651569) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651569) (size!48688 a!2862)))))

(declare-fun e!837599 () Bool)

(assert (=> b!1495475 (= e!837599 (= (select (arr!48136 a!2862) (index!51998 lt!651569)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495476 () Bool)

(assert (=> b!1495476 (and (bvsge (index!51998 lt!651569) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651569) (size!48688 a!2862)))))

(declare-fun res!1017356 () Bool)

(assert (=> b!1495476 (= res!1017356 (= (select (arr!48136 a!2862) (index!51998 lt!651569)) (select (arr!48136 a!2862) j!93)))))

(assert (=> b!1495476 (=> res!1017356 e!837599)))

(declare-fun e!837601 () Bool)

(assert (=> b!1495476 (= e!837601 e!837599)))

(declare-fun b!1495477 () Bool)

(assert (=> b!1495477 (= e!837600 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651525 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495478 () Bool)

(assert (=> b!1495478 (= e!837602 (Intermediate!12401 true lt!651525 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495479 () Bool)

(assert (=> b!1495479 (= e!837598 e!837601)))

(declare-fun res!1017357 () Bool)

(get-info :version)

(assert (=> b!1495479 (= res!1017357 (and ((_ is Intermediate!12401) lt!651569) (not (undefined!13213 lt!651569)) (bvslt (x!133610 lt!651569) #b01111111111111111111111111111110) (bvsge (x!133610 lt!651569) #b00000000000000000000000000000000) (bvsge (x!133610 lt!651569) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495479 (=> (not res!1017357) (not e!837601))))

(declare-fun d!157041 () Bool)

(assert (=> d!157041 e!837598))

(declare-fun c!138593 () Bool)

(assert (=> d!157041 (= c!138593 (and ((_ is Intermediate!12401) lt!651569) (undefined!13213 lt!651569)))))

(assert (=> d!157041 (= lt!651569 e!837602)))

(declare-fun c!138594 () Bool)

(assert (=> d!157041 (= c!138594 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157041 (= lt!651568 (select (arr!48136 a!2862) lt!651525))))

(assert (=> d!157041 (validMask!0 mask!2687)))

(assert (=> d!157041 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651525 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651569)))

(declare-fun b!1495473 () Bool)

(assert (=> b!1495473 (and (bvsge (index!51998 lt!651569) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651569) (size!48688 a!2862)))))

(declare-fun res!1017358 () Bool)

(assert (=> b!1495473 (= res!1017358 (= (select (arr!48136 a!2862) (index!51998 lt!651569)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495473 (=> res!1017358 e!837599)))

(assert (= (and d!157041 c!138594) b!1495478))

(assert (= (and d!157041 (not c!138594)) b!1495474))

(assert (= (and b!1495474 c!138595) b!1495471))

(assert (= (and b!1495474 (not c!138595)) b!1495477))

(assert (= (and d!157041 c!138593) b!1495472))

(assert (= (and d!157041 (not c!138593)) b!1495479))

(assert (= (and b!1495479 res!1017357) b!1495476))

(assert (= (and b!1495476 (not res!1017356)) b!1495473))

(assert (= (and b!1495473 (not res!1017358)) b!1495475))

(declare-fun m!1378323 () Bool)

(assert (=> b!1495475 m!1378323))

(declare-fun m!1378325 () Bool)

(assert (=> d!157041 m!1378325))

(assert (=> d!157041 m!1378201))

(assert (=> b!1495476 m!1378323))

(declare-fun m!1378327 () Bool)

(assert (=> b!1495477 m!1378327))

(assert (=> b!1495477 m!1378327))

(assert (=> b!1495477 m!1378159))

(declare-fun m!1378329 () Bool)

(assert (=> b!1495477 m!1378329))

(assert (=> b!1495473 m!1378323))

(assert (=> b!1495307 d!157041))

(declare-fun b!1495480 () Bool)

(declare-fun e!837605 () SeekEntryResult!12401)

(assert (=> b!1495480 (= e!837605 (Intermediate!12401 false lt!651525 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495481 () Bool)

(declare-fun e!837603 () Bool)

(declare-fun lt!651571 () SeekEntryResult!12401)

(assert (=> b!1495481 (= e!837603 (bvsge (x!133610 lt!651571) #b01111111111111111111111111111110))))

(declare-fun b!1495483 () Bool)

(declare-fun e!837607 () SeekEntryResult!12401)

(assert (=> b!1495483 (= e!837607 e!837605)))

(declare-fun c!138598 () Bool)

(declare-fun lt!651570 () (_ BitVec 64))

(assert (=> b!1495483 (= c!138598 (or (= lt!651570 lt!651526) (= (bvadd lt!651570 lt!651570) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495484 () Bool)

(assert (=> b!1495484 (and (bvsge (index!51998 lt!651571) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651571) (size!48688 lt!651523)))))

(declare-fun e!837604 () Bool)

(assert (=> b!1495484 (= e!837604 (= (select (arr!48136 lt!651523) (index!51998 lt!651571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495485 () Bool)

(assert (=> b!1495485 (and (bvsge (index!51998 lt!651571) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651571) (size!48688 lt!651523)))))

(declare-fun res!1017359 () Bool)

(assert (=> b!1495485 (= res!1017359 (= (select (arr!48136 lt!651523) (index!51998 lt!651571)) lt!651526))))

(assert (=> b!1495485 (=> res!1017359 e!837604)))

(declare-fun e!837606 () Bool)

(assert (=> b!1495485 (= e!837606 e!837604)))

(declare-fun b!1495486 () Bool)

(assert (=> b!1495486 (= e!837605 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651525 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651526 lt!651523 mask!2687))))

(declare-fun b!1495487 () Bool)

(assert (=> b!1495487 (= e!837607 (Intermediate!12401 true lt!651525 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495488 () Bool)

(assert (=> b!1495488 (= e!837603 e!837606)))

(declare-fun res!1017360 () Bool)

(assert (=> b!1495488 (= res!1017360 (and ((_ is Intermediate!12401) lt!651571) (not (undefined!13213 lt!651571)) (bvslt (x!133610 lt!651571) #b01111111111111111111111111111110) (bvsge (x!133610 lt!651571) #b00000000000000000000000000000000) (bvsge (x!133610 lt!651571) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495488 (=> (not res!1017360) (not e!837606))))

(declare-fun d!157043 () Bool)

(assert (=> d!157043 e!837603))

(declare-fun c!138596 () Bool)

(assert (=> d!157043 (= c!138596 (and ((_ is Intermediate!12401) lt!651571) (undefined!13213 lt!651571)))))

(assert (=> d!157043 (= lt!651571 e!837607)))

(declare-fun c!138597 () Bool)

(assert (=> d!157043 (= c!138597 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157043 (= lt!651570 (select (arr!48136 lt!651523) lt!651525))))

(assert (=> d!157043 (validMask!0 mask!2687)))

(assert (=> d!157043 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651525 lt!651526 lt!651523 mask!2687) lt!651571)))

(declare-fun b!1495482 () Bool)

(assert (=> b!1495482 (and (bvsge (index!51998 lt!651571) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651571) (size!48688 lt!651523)))))

(declare-fun res!1017361 () Bool)

(assert (=> b!1495482 (= res!1017361 (= (select (arr!48136 lt!651523) (index!51998 lt!651571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495482 (=> res!1017361 e!837604)))

(assert (= (and d!157043 c!138597) b!1495487))

(assert (= (and d!157043 (not c!138597)) b!1495483))

(assert (= (and b!1495483 c!138598) b!1495480))

(assert (= (and b!1495483 (not c!138598)) b!1495486))

(assert (= (and d!157043 c!138596) b!1495481))

(assert (= (and d!157043 (not c!138596)) b!1495488))

(assert (= (and b!1495488 res!1017360) b!1495485))

(assert (= (and b!1495485 (not res!1017359)) b!1495482))

(assert (= (and b!1495482 (not res!1017361)) b!1495484))

(declare-fun m!1378331 () Bool)

(assert (=> b!1495484 m!1378331))

(declare-fun m!1378333 () Bool)

(assert (=> d!157043 m!1378333))

(assert (=> d!157043 m!1378201))

(assert (=> b!1495485 m!1378331))

(assert (=> b!1495486 m!1378327))

(assert (=> b!1495486 m!1378327))

(declare-fun m!1378335 () Bool)

(assert (=> b!1495486 m!1378335))

(assert (=> b!1495482 m!1378331))

(assert (=> b!1495311 d!157043))

(declare-fun b!1495489 () Bool)

(declare-fun e!837610 () SeekEntryResult!12401)

(assert (=> b!1495489 (= e!837610 (Intermediate!12401 false index!646 x!665))))

(declare-fun b!1495490 () Bool)

(declare-fun e!837608 () Bool)

(declare-fun lt!651573 () SeekEntryResult!12401)

(assert (=> b!1495490 (= e!837608 (bvsge (x!133610 lt!651573) #b01111111111111111111111111111110))))

(declare-fun b!1495492 () Bool)

(declare-fun e!837612 () SeekEntryResult!12401)

(assert (=> b!1495492 (= e!837612 e!837610)))

(declare-fun c!138601 () Bool)

(declare-fun lt!651572 () (_ BitVec 64))

(assert (=> b!1495492 (= c!138601 (or (= lt!651572 lt!651526) (= (bvadd lt!651572 lt!651572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495493 () Bool)

(assert (=> b!1495493 (and (bvsge (index!51998 lt!651573) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651573) (size!48688 lt!651523)))))

(declare-fun e!837609 () Bool)

(assert (=> b!1495493 (= e!837609 (= (select (arr!48136 lt!651523) (index!51998 lt!651573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495494 () Bool)

(assert (=> b!1495494 (and (bvsge (index!51998 lt!651573) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651573) (size!48688 lt!651523)))))

(declare-fun res!1017362 () Bool)

(assert (=> b!1495494 (= res!1017362 (= (select (arr!48136 lt!651523) (index!51998 lt!651573)) lt!651526))))

(assert (=> b!1495494 (=> res!1017362 e!837609)))

(declare-fun e!837611 () Bool)

(assert (=> b!1495494 (= e!837611 e!837609)))

(declare-fun b!1495495 () Bool)

(assert (=> b!1495495 (= e!837610 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651526 lt!651523 mask!2687))))

(declare-fun b!1495496 () Bool)

(assert (=> b!1495496 (= e!837612 (Intermediate!12401 true index!646 x!665))))

(declare-fun b!1495497 () Bool)

(assert (=> b!1495497 (= e!837608 e!837611)))

(declare-fun res!1017363 () Bool)

(assert (=> b!1495497 (= res!1017363 (and ((_ is Intermediate!12401) lt!651573) (not (undefined!13213 lt!651573)) (bvslt (x!133610 lt!651573) #b01111111111111111111111111111110) (bvsge (x!133610 lt!651573) #b00000000000000000000000000000000) (bvsge (x!133610 lt!651573) x!665)))))

(assert (=> b!1495497 (=> (not res!1017363) (not e!837611))))

(declare-fun d!157045 () Bool)

(assert (=> d!157045 e!837608))

(declare-fun c!138599 () Bool)

(assert (=> d!157045 (= c!138599 (and ((_ is Intermediate!12401) lt!651573) (undefined!13213 lt!651573)))))

(assert (=> d!157045 (= lt!651573 e!837612)))

(declare-fun c!138600 () Bool)

(assert (=> d!157045 (= c!138600 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157045 (= lt!651572 (select (arr!48136 lt!651523) index!646))))

(assert (=> d!157045 (validMask!0 mask!2687)))

(assert (=> d!157045 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651526 lt!651523 mask!2687) lt!651573)))

(declare-fun b!1495491 () Bool)

(assert (=> b!1495491 (and (bvsge (index!51998 lt!651573) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651573) (size!48688 lt!651523)))))

(declare-fun res!1017364 () Bool)

(assert (=> b!1495491 (= res!1017364 (= (select (arr!48136 lt!651523) (index!51998 lt!651573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495491 (=> res!1017364 e!837609)))

(assert (= (and d!157045 c!138600) b!1495496))

(assert (= (and d!157045 (not c!138600)) b!1495492))

(assert (= (and b!1495492 c!138601) b!1495489))

(assert (= (and b!1495492 (not c!138601)) b!1495495))

(assert (= (and d!157045 c!138599) b!1495490))

(assert (= (and d!157045 (not c!138599)) b!1495497))

(assert (= (and b!1495497 res!1017363) b!1495494))

(assert (= (and b!1495494 (not res!1017362)) b!1495491))

(assert (= (and b!1495491 (not res!1017364)) b!1495493))

(declare-fun m!1378337 () Bool)

(assert (=> b!1495493 m!1378337))

(declare-fun m!1378339 () Bool)

(assert (=> d!157045 m!1378339))

(assert (=> d!157045 m!1378201))

(assert (=> b!1495494 m!1378337))

(assert (=> b!1495495 m!1378173))

(assert (=> b!1495495 m!1378173))

(declare-fun m!1378341 () Bool)

(assert (=> b!1495495 m!1378341))

(assert (=> b!1495491 m!1378337))

(assert (=> b!1495300 d!157045))

(declare-fun b!1495498 () Bool)

(declare-fun e!837615 () SeekEntryResult!12401)

(assert (=> b!1495498 (= e!837615 (Intermediate!12401 false index!646 x!665))))

(declare-fun b!1495499 () Bool)

(declare-fun e!837613 () Bool)

(declare-fun lt!651575 () SeekEntryResult!12401)

(assert (=> b!1495499 (= e!837613 (bvsge (x!133610 lt!651575) #b01111111111111111111111111111110))))

(declare-fun b!1495501 () Bool)

(declare-fun e!837617 () SeekEntryResult!12401)

(assert (=> b!1495501 (= e!837617 e!837615)))

(declare-fun lt!651574 () (_ BitVec 64))

(declare-fun c!138604 () Bool)

(assert (=> b!1495501 (= c!138604 (or (= lt!651574 (select (arr!48136 a!2862) j!93)) (= (bvadd lt!651574 lt!651574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495502 () Bool)

(assert (=> b!1495502 (and (bvsge (index!51998 lt!651575) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651575) (size!48688 a!2862)))))

(declare-fun e!837614 () Bool)

(assert (=> b!1495502 (= e!837614 (= (select (arr!48136 a!2862) (index!51998 lt!651575)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495503 () Bool)

(assert (=> b!1495503 (and (bvsge (index!51998 lt!651575) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651575) (size!48688 a!2862)))))

(declare-fun res!1017365 () Bool)

(assert (=> b!1495503 (= res!1017365 (= (select (arr!48136 a!2862) (index!51998 lt!651575)) (select (arr!48136 a!2862) j!93)))))

(assert (=> b!1495503 (=> res!1017365 e!837614)))

(declare-fun e!837616 () Bool)

(assert (=> b!1495503 (= e!837616 e!837614)))

(declare-fun b!1495504 () Bool)

(assert (=> b!1495504 (= e!837615 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495505 () Bool)

(assert (=> b!1495505 (= e!837617 (Intermediate!12401 true index!646 x!665))))

(declare-fun b!1495506 () Bool)

(assert (=> b!1495506 (= e!837613 e!837616)))

(declare-fun res!1017366 () Bool)

(assert (=> b!1495506 (= res!1017366 (and ((_ is Intermediate!12401) lt!651575) (not (undefined!13213 lt!651575)) (bvslt (x!133610 lt!651575) #b01111111111111111111111111111110) (bvsge (x!133610 lt!651575) #b00000000000000000000000000000000) (bvsge (x!133610 lt!651575) x!665)))))

(assert (=> b!1495506 (=> (not res!1017366) (not e!837616))))

(declare-fun d!157047 () Bool)

(assert (=> d!157047 e!837613))

(declare-fun c!138602 () Bool)

(assert (=> d!157047 (= c!138602 (and ((_ is Intermediate!12401) lt!651575) (undefined!13213 lt!651575)))))

(assert (=> d!157047 (= lt!651575 e!837617)))

(declare-fun c!138603 () Bool)

(assert (=> d!157047 (= c!138603 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157047 (= lt!651574 (select (arr!48136 a!2862) index!646))))

(assert (=> d!157047 (validMask!0 mask!2687)))

(assert (=> d!157047 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651575)))

(declare-fun b!1495500 () Bool)

(assert (=> b!1495500 (and (bvsge (index!51998 lt!651575) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651575) (size!48688 a!2862)))))

(declare-fun res!1017367 () Bool)

(assert (=> b!1495500 (= res!1017367 (= (select (arr!48136 a!2862) (index!51998 lt!651575)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495500 (=> res!1017367 e!837614)))

(assert (= (and d!157047 c!138603) b!1495505))

(assert (= (and d!157047 (not c!138603)) b!1495501))

(assert (= (and b!1495501 c!138604) b!1495498))

(assert (= (and b!1495501 (not c!138604)) b!1495504))

(assert (= (and d!157047 c!138602) b!1495499))

(assert (= (and d!157047 (not c!138602)) b!1495506))

(assert (= (and b!1495506 res!1017366) b!1495503))

(assert (= (and b!1495503 (not res!1017365)) b!1495500))

(assert (= (and b!1495500 (not res!1017367)) b!1495502))

(declare-fun m!1378343 () Bool)

(assert (=> b!1495502 m!1378343))

(assert (=> d!157047 m!1378183))

(assert (=> d!157047 m!1378201))

(assert (=> b!1495503 m!1378343))

(assert (=> b!1495504 m!1378173))

(assert (=> b!1495504 m!1378173))

(assert (=> b!1495504 m!1378159))

(declare-fun m!1378345 () Bool)

(assert (=> b!1495504 m!1378345))

(assert (=> b!1495500 m!1378343))

(assert (=> b!1495301 d!157047))

(declare-fun b!1495520 () Bool)

(declare-fun e!837624 () SeekEntryResult!12401)

(declare-fun lt!651582 () SeekEntryResult!12401)

(assert (=> b!1495520 (= e!837624 (MissingZero!12401 (index!51998 lt!651582)))))

(declare-fun b!1495521 () Bool)

(declare-fun e!837626 () SeekEntryResult!12401)

(declare-fun e!837625 () SeekEntryResult!12401)

(assert (=> b!1495521 (= e!837626 e!837625)))

(declare-fun lt!651584 () (_ BitVec 64))

(assert (=> b!1495521 (= lt!651584 (select (arr!48136 a!2862) (index!51998 lt!651582)))))

(declare-fun c!138613 () Bool)

(assert (=> b!1495521 (= c!138613 (= lt!651584 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1495522 () Bool)

(assert (=> b!1495522 (= e!837625 (Found!12401 (index!51998 lt!651582)))))

(declare-fun b!1495523 () Bool)

(assert (=> b!1495523 (= e!837624 (seekKeyOrZeroReturnVacant!0 (x!133610 lt!651582) (index!51998 lt!651582) (index!51998 lt!651582) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495524 () Bool)

(declare-fun c!138612 () Bool)

(assert (=> b!1495524 (= c!138612 (= lt!651584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495524 (= e!837625 e!837624)))

(declare-fun b!1495519 () Bool)

(assert (=> b!1495519 (= e!837626 Undefined!12401)))

(declare-fun d!157049 () Bool)

(declare-fun lt!651583 () SeekEntryResult!12401)

(assert (=> d!157049 (and (or ((_ is Undefined!12401) lt!651583) (not ((_ is Found!12401) lt!651583)) (and (bvsge (index!51997 lt!651583) #b00000000000000000000000000000000) (bvslt (index!51997 lt!651583) (size!48688 a!2862)))) (or ((_ is Undefined!12401) lt!651583) ((_ is Found!12401) lt!651583) (not ((_ is MissingZero!12401) lt!651583)) (and (bvsge (index!51996 lt!651583) #b00000000000000000000000000000000) (bvslt (index!51996 lt!651583) (size!48688 a!2862)))) (or ((_ is Undefined!12401) lt!651583) ((_ is Found!12401) lt!651583) ((_ is MissingZero!12401) lt!651583) (not ((_ is MissingVacant!12401) lt!651583)) (and (bvsge (index!51999 lt!651583) #b00000000000000000000000000000000) (bvslt (index!51999 lt!651583) (size!48688 a!2862)))) (or ((_ is Undefined!12401) lt!651583) (ite ((_ is Found!12401) lt!651583) (= (select (arr!48136 a!2862) (index!51997 lt!651583)) (select (arr!48136 a!2862) j!93)) (ite ((_ is MissingZero!12401) lt!651583) (= (select (arr!48136 a!2862) (index!51996 lt!651583)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12401) lt!651583) (= (select (arr!48136 a!2862) (index!51999 lt!651583)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157049 (= lt!651583 e!837626)))

(declare-fun c!138611 () Bool)

(assert (=> d!157049 (= c!138611 (and ((_ is Intermediate!12401) lt!651582) (undefined!13213 lt!651582)))))

(assert (=> d!157049 (= lt!651582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157049 (validMask!0 mask!2687)))

(assert (=> d!157049 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651583)))

(assert (= (and d!157049 c!138611) b!1495519))

(assert (= (and d!157049 (not c!138611)) b!1495521))

(assert (= (and b!1495521 c!138613) b!1495522))

(assert (= (and b!1495521 (not c!138613)) b!1495524))

(assert (= (and b!1495524 c!138612) b!1495520))

(assert (= (and b!1495524 (not c!138612)) b!1495523))

(declare-fun m!1378347 () Bool)

(assert (=> b!1495521 m!1378347))

(assert (=> b!1495523 m!1378159))

(declare-fun m!1378349 () Bool)

(assert (=> b!1495523 m!1378349))

(declare-fun m!1378351 () Bool)

(assert (=> d!157049 m!1378351))

(assert (=> d!157049 m!1378201))

(declare-fun m!1378353 () Bool)

(assert (=> d!157049 m!1378353))

(assert (=> d!157049 m!1378159))

(assert (=> d!157049 m!1378161))

(assert (=> d!157049 m!1378161))

(assert (=> d!157049 m!1378159))

(assert (=> d!157049 m!1378163))

(declare-fun m!1378355 () Bool)

(assert (=> d!157049 m!1378355))

(assert (=> b!1495299 d!157049))

(declare-fun e!837629 () SeekEntryResult!12401)

(declare-fun b!1495525 () Bool)

(assert (=> b!1495525 (= e!837629 (Intermediate!12401 false (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495526 () Bool)

(declare-fun e!837627 () Bool)

(declare-fun lt!651586 () SeekEntryResult!12401)

(assert (=> b!1495526 (= e!837627 (bvsge (x!133610 lt!651586) #b01111111111111111111111111111110))))

(declare-fun b!1495528 () Bool)

(declare-fun e!837631 () SeekEntryResult!12401)

(assert (=> b!1495528 (= e!837631 e!837629)))

(declare-fun lt!651585 () (_ BitVec 64))

(declare-fun c!138616 () Bool)

(assert (=> b!1495528 (= c!138616 (or (= lt!651585 (select (arr!48136 a!2862) j!93)) (= (bvadd lt!651585 lt!651585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495529 () Bool)

(assert (=> b!1495529 (and (bvsge (index!51998 lt!651586) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651586) (size!48688 a!2862)))))

(declare-fun e!837628 () Bool)

(assert (=> b!1495529 (= e!837628 (= (select (arr!48136 a!2862) (index!51998 lt!651586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495530 () Bool)

(assert (=> b!1495530 (and (bvsge (index!51998 lt!651586) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651586) (size!48688 a!2862)))))

(declare-fun res!1017368 () Bool)

(assert (=> b!1495530 (= res!1017368 (= (select (arr!48136 a!2862) (index!51998 lt!651586)) (select (arr!48136 a!2862) j!93)))))

(assert (=> b!1495530 (=> res!1017368 e!837628)))

(declare-fun e!837630 () Bool)

(assert (=> b!1495530 (= e!837630 e!837628)))

(declare-fun b!1495531 () Bool)

(assert (=> b!1495531 (= e!837629 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495532 () Bool)

(assert (=> b!1495532 (= e!837631 (Intermediate!12401 true (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495533 () Bool)

(assert (=> b!1495533 (= e!837627 e!837630)))

(declare-fun res!1017369 () Bool)

(assert (=> b!1495533 (= res!1017369 (and ((_ is Intermediate!12401) lt!651586) (not (undefined!13213 lt!651586)) (bvslt (x!133610 lt!651586) #b01111111111111111111111111111110) (bvsge (x!133610 lt!651586) #b00000000000000000000000000000000) (bvsge (x!133610 lt!651586) #b00000000000000000000000000000000)))))

(assert (=> b!1495533 (=> (not res!1017369) (not e!837630))))

(declare-fun d!157051 () Bool)

(assert (=> d!157051 e!837627))

(declare-fun c!138614 () Bool)

(assert (=> d!157051 (= c!138614 (and ((_ is Intermediate!12401) lt!651586) (undefined!13213 lt!651586)))))

(assert (=> d!157051 (= lt!651586 e!837631)))

(declare-fun c!138615 () Bool)

(assert (=> d!157051 (= c!138615 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157051 (= lt!651585 (select (arr!48136 a!2862) (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687)))))

(assert (=> d!157051 (validMask!0 mask!2687)))

(assert (=> d!157051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!651586)))

(declare-fun b!1495527 () Bool)

(assert (=> b!1495527 (and (bvsge (index!51998 lt!651586) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651586) (size!48688 a!2862)))))

(declare-fun res!1017370 () Bool)

(assert (=> b!1495527 (= res!1017370 (= (select (arr!48136 a!2862) (index!51998 lt!651586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495527 (=> res!1017370 e!837628)))

(assert (= (and d!157051 c!138615) b!1495532))

(assert (= (and d!157051 (not c!138615)) b!1495528))

(assert (= (and b!1495528 c!138616) b!1495525))

(assert (= (and b!1495528 (not c!138616)) b!1495531))

(assert (= (and d!157051 c!138614) b!1495526))

(assert (= (and d!157051 (not c!138614)) b!1495533))

(assert (= (and b!1495533 res!1017369) b!1495530))

(assert (= (and b!1495530 (not res!1017368)) b!1495527))

(assert (= (and b!1495527 (not res!1017370)) b!1495529))

(declare-fun m!1378357 () Bool)

(assert (=> b!1495529 m!1378357))

(assert (=> d!157051 m!1378161))

(declare-fun m!1378359 () Bool)

(assert (=> d!157051 m!1378359))

(assert (=> d!157051 m!1378201))

(assert (=> b!1495530 m!1378357))

(assert (=> b!1495531 m!1378161))

(declare-fun m!1378361 () Bool)

(assert (=> b!1495531 m!1378361))

(assert (=> b!1495531 m!1378361))

(assert (=> b!1495531 m!1378159))

(declare-fun m!1378363 () Bool)

(assert (=> b!1495531 m!1378363))

(assert (=> b!1495527 m!1378357))

(assert (=> b!1495310 d!157051))

(declare-fun d!157053 () Bool)

(declare-fun lt!651592 () (_ BitVec 32))

(declare-fun lt!651591 () (_ BitVec 32))

(assert (=> d!157053 (= lt!651592 (bvmul (bvxor lt!651591 (bvlshr lt!651591 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157053 (= lt!651591 ((_ extract 31 0) (bvand (bvxor (select (arr!48136 a!2862) j!93) (bvlshr (select (arr!48136 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157053 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017371 (let ((h!36109 ((_ extract 31 0) (bvand (bvxor (select (arr!48136 a!2862) j!93) (bvlshr (select (arr!48136 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133614 (bvmul (bvxor h!36109 (bvlshr h!36109 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133614 (bvlshr x!133614 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017371 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017371 #b00000000000000000000000000000000))))))

(assert (=> d!157053 (= (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (bvand (bvxor lt!651592 (bvlshr lt!651592 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495310 d!157053))

(declare-fun b!1495546 () Bool)

(declare-fun c!138624 () Bool)

(declare-fun lt!651597 () (_ BitVec 64))

(assert (=> b!1495546 (= c!138624 (= lt!651597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837638 () SeekEntryResult!12401)

(declare-fun e!837639 () SeekEntryResult!12401)

(assert (=> b!1495546 (= e!837638 e!837639)))

(declare-fun b!1495547 () Bool)

(declare-fun e!837640 () SeekEntryResult!12401)

(assert (=> b!1495547 (= e!837640 Undefined!12401)))

(declare-fun b!1495548 () Bool)

(assert (=> b!1495548 (= e!837638 (Found!12401 index!646))))

(declare-fun lt!651598 () SeekEntryResult!12401)

(declare-fun d!157055 () Bool)

(assert (=> d!157055 (and (or ((_ is Undefined!12401) lt!651598) (not ((_ is Found!12401) lt!651598)) (and (bvsge (index!51997 lt!651598) #b00000000000000000000000000000000) (bvslt (index!51997 lt!651598) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651598) ((_ is Found!12401) lt!651598) (not ((_ is MissingVacant!12401) lt!651598)) (not (= (index!51999 lt!651598) intermediateAfterIndex!19)) (and (bvsge (index!51999 lt!651598) #b00000000000000000000000000000000) (bvslt (index!51999 lt!651598) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651598) (ite ((_ is Found!12401) lt!651598) (= (select (arr!48136 lt!651523) (index!51997 lt!651598)) lt!651526) (and ((_ is MissingVacant!12401) lt!651598) (= (index!51999 lt!651598) intermediateAfterIndex!19) (= (select (arr!48136 lt!651523) (index!51999 lt!651598)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157055 (= lt!651598 e!837640)))

(declare-fun c!138623 () Bool)

(assert (=> d!157055 (= c!138623 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157055 (= lt!651597 (select (arr!48136 lt!651523) index!646))))

(assert (=> d!157055 (validMask!0 mask!2687)))

(assert (=> d!157055 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651526 lt!651523 mask!2687) lt!651598)))

(declare-fun b!1495549 () Bool)

(assert (=> b!1495549 (= e!837639 (MissingVacant!12401 intermediateAfterIndex!19))))

(declare-fun b!1495550 () Bool)

(assert (=> b!1495550 (= e!837639 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651526 lt!651523 mask!2687))))

(declare-fun b!1495551 () Bool)

(assert (=> b!1495551 (= e!837640 e!837638)))

(declare-fun c!138625 () Bool)

(assert (=> b!1495551 (= c!138625 (= lt!651597 lt!651526))))

(assert (= (and d!157055 c!138623) b!1495547))

(assert (= (and d!157055 (not c!138623)) b!1495551))

(assert (= (and b!1495551 c!138625) b!1495548))

(assert (= (and b!1495551 (not c!138625)) b!1495546))

(assert (= (and b!1495546 c!138624) b!1495549))

(assert (= (and b!1495546 (not c!138624)) b!1495550))

(declare-fun m!1378365 () Bool)

(assert (=> d!157055 m!1378365))

(declare-fun m!1378367 () Bool)

(assert (=> d!157055 m!1378367))

(assert (=> d!157055 m!1378339))

(assert (=> d!157055 m!1378201))

(assert (=> b!1495550 m!1378173))

(assert (=> b!1495550 m!1378173))

(declare-fun m!1378369 () Bool)

(assert (=> b!1495550 m!1378369))

(assert (=> b!1495303 d!157055))

(declare-fun b!1495553 () Bool)

(declare-fun e!837641 () SeekEntryResult!12401)

(declare-fun lt!651599 () SeekEntryResult!12401)

(assert (=> b!1495553 (= e!837641 (MissingZero!12401 (index!51998 lt!651599)))))

(declare-fun b!1495554 () Bool)

(declare-fun e!837643 () SeekEntryResult!12401)

(declare-fun e!837642 () SeekEntryResult!12401)

(assert (=> b!1495554 (= e!837643 e!837642)))

(declare-fun lt!651601 () (_ BitVec 64))

(assert (=> b!1495554 (= lt!651601 (select (arr!48136 lt!651523) (index!51998 lt!651599)))))

(declare-fun c!138628 () Bool)

(assert (=> b!1495554 (= c!138628 (= lt!651601 lt!651526))))

(declare-fun b!1495555 () Bool)

(assert (=> b!1495555 (= e!837642 (Found!12401 (index!51998 lt!651599)))))

(declare-fun b!1495556 () Bool)

(assert (=> b!1495556 (= e!837641 (seekKeyOrZeroReturnVacant!0 (x!133610 lt!651599) (index!51998 lt!651599) (index!51998 lt!651599) lt!651526 lt!651523 mask!2687))))

(declare-fun b!1495557 () Bool)

(declare-fun c!138627 () Bool)

(assert (=> b!1495557 (= c!138627 (= lt!651601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495557 (= e!837642 e!837641)))

(declare-fun b!1495552 () Bool)

(assert (=> b!1495552 (= e!837643 Undefined!12401)))

(declare-fun d!157057 () Bool)

(declare-fun lt!651600 () SeekEntryResult!12401)

(assert (=> d!157057 (and (or ((_ is Undefined!12401) lt!651600) (not ((_ is Found!12401) lt!651600)) (and (bvsge (index!51997 lt!651600) #b00000000000000000000000000000000) (bvslt (index!51997 lt!651600) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651600) ((_ is Found!12401) lt!651600) (not ((_ is MissingZero!12401) lt!651600)) (and (bvsge (index!51996 lt!651600) #b00000000000000000000000000000000) (bvslt (index!51996 lt!651600) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651600) ((_ is Found!12401) lt!651600) ((_ is MissingZero!12401) lt!651600) (not ((_ is MissingVacant!12401) lt!651600)) (and (bvsge (index!51999 lt!651600) #b00000000000000000000000000000000) (bvslt (index!51999 lt!651600) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651600) (ite ((_ is Found!12401) lt!651600) (= (select (arr!48136 lt!651523) (index!51997 lt!651600)) lt!651526) (ite ((_ is MissingZero!12401) lt!651600) (= (select (arr!48136 lt!651523) (index!51996 lt!651600)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12401) lt!651600) (= (select (arr!48136 lt!651523) (index!51999 lt!651600)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157057 (= lt!651600 e!837643)))

(declare-fun c!138626 () Bool)

(assert (=> d!157057 (= c!138626 (and ((_ is Intermediate!12401) lt!651599) (undefined!13213 lt!651599)))))

(assert (=> d!157057 (= lt!651599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651526 mask!2687) lt!651526 lt!651523 mask!2687))))

(assert (=> d!157057 (validMask!0 mask!2687)))

(assert (=> d!157057 (= (seekEntryOrOpen!0 lt!651526 lt!651523 mask!2687) lt!651600)))

(assert (= (and d!157057 c!138626) b!1495552))

(assert (= (and d!157057 (not c!138626)) b!1495554))

(assert (= (and b!1495554 c!138628) b!1495555))

(assert (= (and b!1495554 (not c!138628)) b!1495557))

(assert (= (and b!1495557 c!138627) b!1495553))

(assert (= (and b!1495557 (not c!138627)) b!1495556))

(declare-fun m!1378371 () Bool)

(assert (=> b!1495554 m!1378371))

(declare-fun m!1378373 () Bool)

(assert (=> b!1495556 m!1378373))

(declare-fun m!1378375 () Bool)

(assert (=> d!157057 m!1378375))

(assert (=> d!157057 m!1378201))

(declare-fun m!1378377 () Bool)

(assert (=> d!157057 m!1378377))

(assert (=> d!157057 m!1378165))

(assert (=> d!157057 m!1378165))

(assert (=> d!157057 m!1378167))

(declare-fun m!1378379 () Bool)

(assert (=> d!157057 m!1378379))

(assert (=> b!1495303 d!157057))

(declare-fun b!1495558 () Bool)

(declare-fun c!138630 () Bool)

(declare-fun lt!651602 () (_ BitVec 64))

(assert (=> b!1495558 (= c!138630 (= lt!651602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837644 () SeekEntryResult!12401)

(declare-fun e!837645 () SeekEntryResult!12401)

(assert (=> b!1495558 (= e!837644 e!837645)))

(declare-fun b!1495559 () Bool)

(declare-fun e!837646 () SeekEntryResult!12401)

(assert (=> b!1495559 (= e!837646 Undefined!12401)))

(declare-fun b!1495560 () Bool)

(assert (=> b!1495560 (= e!837644 (Found!12401 lt!651525))))

(declare-fun lt!651603 () SeekEntryResult!12401)

(declare-fun d!157059 () Bool)

(assert (=> d!157059 (and (or ((_ is Undefined!12401) lt!651603) (not ((_ is Found!12401) lt!651603)) (and (bvsge (index!51997 lt!651603) #b00000000000000000000000000000000) (bvslt (index!51997 lt!651603) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651603) ((_ is Found!12401) lt!651603) (not ((_ is MissingVacant!12401) lt!651603)) (not (= (index!51999 lt!651603) intermediateAfterIndex!19)) (and (bvsge (index!51999 lt!651603) #b00000000000000000000000000000000) (bvslt (index!51999 lt!651603) (size!48688 lt!651523)))) (or ((_ is Undefined!12401) lt!651603) (ite ((_ is Found!12401) lt!651603) (= (select (arr!48136 lt!651523) (index!51997 lt!651603)) lt!651526) (and ((_ is MissingVacant!12401) lt!651603) (= (index!51999 lt!651603) intermediateAfterIndex!19) (= (select (arr!48136 lt!651523) (index!51999 lt!651603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157059 (= lt!651603 e!837646)))

(declare-fun c!138629 () Bool)

(assert (=> d!157059 (= c!138629 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157059 (= lt!651602 (select (arr!48136 lt!651523) lt!651525))))

(assert (=> d!157059 (validMask!0 mask!2687)))

(assert (=> d!157059 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651525 intermediateAfterIndex!19 lt!651526 lt!651523 mask!2687) lt!651603)))

(declare-fun b!1495561 () Bool)

(assert (=> b!1495561 (= e!837645 (MissingVacant!12401 intermediateAfterIndex!19))))

(declare-fun b!1495562 () Bool)

(assert (=> b!1495562 (= e!837645 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651525 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651526 lt!651523 mask!2687))))

(declare-fun b!1495563 () Bool)

(assert (=> b!1495563 (= e!837646 e!837644)))

(declare-fun c!138631 () Bool)

(assert (=> b!1495563 (= c!138631 (= lt!651602 lt!651526))))

(assert (= (and d!157059 c!138629) b!1495559))

(assert (= (and d!157059 (not c!138629)) b!1495563))

(assert (= (and b!1495563 c!138631) b!1495560))

(assert (= (and b!1495563 (not c!138631)) b!1495558))

(assert (= (and b!1495558 c!138630) b!1495561))

(assert (= (and b!1495558 (not c!138630)) b!1495562))

(declare-fun m!1378381 () Bool)

(assert (=> d!157059 m!1378381))

(declare-fun m!1378383 () Bool)

(assert (=> d!157059 m!1378383))

(assert (=> d!157059 m!1378333))

(assert (=> d!157059 m!1378201))

(assert (=> b!1495562 m!1378327))

(assert (=> b!1495562 m!1378327))

(declare-fun m!1378385 () Bool)

(assert (=> b!1495562 m!1378385))

(assert (=> b!1495292 d!157059))

(assert (=> b!1495292 d!157057))

(declare-fun d!157061 () Bool)

(assert (=> d!157061 (= (validKeyInArray!0 (select (arr!48136 a!2862) j!93)) (and (not (= (select (arr!48136 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48136 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495293 d!157061))

(declare-fun d!157063 () Bool)

(declare-fun lt!651606 () (_ BitVec 32))

(assert (=> d!157063 (and (bvsge lt!651606 #b00000000000000000000000000000000) (bvslt lt!651606 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157063 (= lt!651606 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157063 (validMask!0 mask!2687)))

(assert (=> d!157063 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651606)))

(declare-fun bs!42874 () Bool)

(assert (= bs!42874 d!157063))

(declare-fun m!1378387 () Bool)

(assert (=> bs!42874 m!1378387))

(assert (=> bs!42874 m!1378201))

(assert (=> b!1495313 d!157063))

(declare-fun d!157065 () Bool)

(declare-fun res!1017377 () Bool)

(declare-fun e!837655 () Bool)

(assert (=> d!157065 (=> res!1017377 e!837655)))

(assert (=> d!157065 (= res!1017377 (bvsge #b00000000000000000000000000000000 (size!48688 a!2862)))))

(assert (=> d!157065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837655)))

(declare-fun b!1495572 () Bool)

(declare-fun e!837654 () Bool)

(assert (=> b!1495572 (= e!837655 e!837654)))

(declare-fun c!138634 () Bool)

(assert (=> b!1495572 (= c!138634 (validKeyInArray!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495573 () Bool)

(declare-fun call!67988 () Bool)

(assert (=> b!1495573 (= e!837654 call!67988)))

(declare-fun b!1495574 () Bool)

(declare-fun e!837653 () Bool)

(assert (=> b!1495574 (= e!837653 call!67988)))

(declare-fun bm!67985 () Bool)

(assert (=> bm!67985 (= call!67988 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495575 () Bool)

(assert (=> b!1495575 (= e!837654 e!837653)))

(declare-fun lt!651615 () (_ BitVec 64))

(assert (=> b!1495575 (= lt!651615 (select (arr!48136 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651613 () Unit!49983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99739 (_ BitVec 64) (_ BitVec 32)) Unit!49983)

(assert (=> b!1495575 (= lt!651613 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651615 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1495575 (arrayContainsKey!0 a!2862 lt!651615 #b00000000000000000000000000000000)))

(declare-fun lt!651614 () Unit!49983)

(assert (=> b!1495575 (= lt!651614 lt!651613)))

(declare-fun res!1017376 () Bool)

(assert (=> b!1495575 (= res!1017376 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12401 #b00000000000000000000000000000000)))))

(assert (=> b!1495575 (=> (not res!1017376) (not e!837653))))

(assert (= (and d!157065 (not res!1017377)) b!1495572))

(assert (= (and b!1495572 c!138634) b!1495575))

(assert (= (and b!1495572 (not c!138634)) b!1495573))

(assert (= (and b!1495575 res!1017376) b!1495574))

(assert (= (or b!1495574 b!1495573) bm!67985))

(declare-fun m!1378389 () Bool)

(assert (=> b!1495572 m!1378389))

(assert (=> b!1495572 m!1378389))

(declare-fun m!1378391 () Bool)

(assert (=> b!1495572 m!1378391))

(declare-fun m!1378393 () Bool)

(assert (=> bm!67985 m!1378393))

(assert (=> b!1495575 m!1378389))

(declare-fun m!1378395 () Bool)

(assert (=> b!1495575 m!1378395))

(declare-fun m!1378397 () Bool)

(assert (=> b!1495575 m!1378397))

(assert (=> b!1495575 m!1378389))

(declare-fun m!1378399 () Bool)

(assert (=> b!1495575 m!1378399))

(assert (=> b!1495302 d!157065))

(declare-fun b!1495586 () Bool)

(declare-fun e!837664 () Bool)

(declare-fun contains!9901 (List!34715 (_ BitVec 64)) Bool)

(assert (=> b!1495586 (= e!837664 (contains!9901 Nil!34712 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495587 () Bool)

(declare-fun e!837665 () Bool)

(declare-fun e!837667 () Bool)

(assert (=> b!1495587 (= e!837665 e!837667)))

(declare-fun res!1017386 () Bool)

(assert (=> b!1495587 (=> (not res!1017386) (not e!837667))))

(assert (=> b!1495587 (= res!1017386 (not e!837664))))

(declare-fun res!1017385 () Bool)

(assert (=> b!1495587 (=> (not res!1017385) (not e!837664))))

(assert (=> b!1495587 (= res!1017385 (validKeyInArray!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495588 () Bool)

(declare-fun e!837666 () Bool)

(declare-fun call!67991 () Bool)

(assert (=> b!1495588 (= e!837666 call!67991)))

(declare-fun d!157067 () Bool)

(declare-fun res!1017384 () Bool)

(assert (=> d!157067 (=> res!1017384 e!837665)))

(assert (=> d!157067 (= res!1017384 (bvsge #b00000000000000000000000000000000 (size!48688 a!2862)))))

(assert (=> d!157067 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34712) e!837665)))

(declare-fun bm!67988 () Bool)

(declare-fun c!138637 () Bool)

(assert (=> bm!67988 (= call!67991 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138637 (Cons!34711 (select (arr!48136 a!2862) #b00000000000000000000000000000000) Nil!34712) Nil!34712)))))

(declare-fun b!1495589 () Bool)

(assert (=> b!1495589 (= e!837667 e!837666)))

(assert (=> b!1495589 (= c!138637 (validKeyInArray!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495590 () Bool)

(assert (=> b!1495590 (= e!837666 call!67991)))

(assert (= (and d!157067 (not res!1017384)) b!1495587))

(assert (= (and b!1495587 res!1017385) b!1495586))

(assert (= (and b!1495587 res!1017386) b!1495589))

(assert (= (and b!1495589 c!138637) b!1495590))

(assert (= (and b!1495589 (not c!138637)) b!1495588))

(assert (= (or b!1495590 b!1495588) bm!67988))

(assert (=> b!1495586 m!1378389))

(assert (=> b!1495586 m!1378389))

(declare-fun m!1378401 () Bool)

(assert (=> b!1495586 m!1378401))

(assert (=> b!1495587 m!1378389))

(assert (=> b!1495587 m!1378389))

(assert (=> b!1495587 m!1378391))

(assert (=> bm!67988 m!1378389))

(declare-fun m!1378403 () Bool)

(assert (=> bm!67988 m!1378403))

(assert (=> b!1495589 m!1378389))

(assert (=> b!1495589 m!1378389))

(assert (=> b!1495589 m!1378391))

(assert (=> b!1495306 d!157067))

(declare-fun d!157069 () Bool)

(declare-fun res!1017388 () Bool)

(declare-fun e!837670 () Bool)

(assert (=> d!157069 (=> res!1017388 e!837670)))

(assert (=> d!157069 (= res!1017388 (bvsge j!93 (size!48688 a!2862)))))

(assert (=> d!157069 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837670)))

(declare-fun b!1495591 () Bool)

(declare-fun e!837669 () Bool)

(assert (=> b!1495591 (= e!837670 e!837669)))

(declare-fun c!138638 () Bool)

(assert (=> b!1495591 (= c!138638 (validKeyInArray!0 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1495592 () Bool)

(declare-fun call!67992 () Bool)

(assert (=> b!1495592 (= e!837669 call!67992)))

(declare-fun b!1495593 () Bool)

(declare-fun e!837668 () Bool)

(assert (=> b!1495593 (= e!837668 call!67992)))

(declare-fun bm!67989 () Bool)

(assert (=> bm!67989 (= call!67992 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495594 () Bool)

(assert (=> b!1495594 (= e!837669 e!837668)))

(declare-fun lt!651618 () (_ BitVec 64))

(assert (=> b!1495594 (= lt!651618 (select (arr!48136 a!2862) j!93))))

(declare-fun lt!651616 () Unit!49983)

(assert (=> b!1495594 (= lt!651616 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651618 j!93))))

(assert (=> b!1495594 (arrayContainsKey!0 a!2862 lt!651618 #b00000000000000000000000000000000)))

(declare-fun lt!651617 () Unit!49983)

(assert (=> b!1495594 (= lt!651617 lt!651616)))

(declare-fun res!1017387 () Bool)

(assert (=> b!1495594 (= res!1017387 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) (Found!12401 j!93)))))

(assert (=> b!1495594 (=> (not res!1017387) (not e!837668))))

(assert (= (and d!157069 (not res!1017388)) b!1495591))

(assert (= (and b!1495591 c!138638) b!1495594))

(assert (= (and b!1495591 (not c!138638)) b!1495592))

(assert (= (and b!1495594 res!1017387) b!1495593))

(assert (= (or b!1495593 b!1495592) bm!67989))

(assert (=> b!1495591 m!1378159))

(assert (=> b!1495591 m!1378159))

(assert (=> b!1495591 m!1378187))

(declare-fun m!1378405 () Bool)

(assert (=> bm!67989 m!1378405))

(assert (=> b!1495594 m!1378159))

(declare-fun m!1378407 () Bool)

(assert (=> b!1495594 m!1378407))

(declare-fun m!1378409 () Bool)

(assert (=> b!1495594 m!1378409))

(assert (=> b!1495594 m!1378159))

(assert (=> b!1495594 m!1378197))

(assert (=> b!1495305 d!157069))

(declare-fun d!157071 () Bool)

(assert (=> d!157071 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651621 () Unit!49983)

(declare-fun choose!38 (array!99739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49983)

(assert (=> d!157071 (= lt!651621 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157071 (validMask!0 mask!2687)))

(assert (=> d!157071 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651621)))

(declare-fun bs!42875 () Bool)

(assert (= bs!42875 d!157071))

(assert (=> bs!42875 m!1378185))

(declare-fun m!1378411 () Bool)

(assert (=> bs!42875 m!1378411))

(assert (=> bs!42875 m!1378201))

(assert (=> b!1495305 d!157071))

(declare-fun d!157073 () Bool)

(assert (=> d!157073 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127220 d!157073))

(declare-fun d!157077 () Bool)

(assert (=> d!157077 (= (array_inv!37369 a!2862) (bvsge (size!48688 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127220 d!157077))

(declare-fun b!1495595 () Bool)

(declare-fun e!837673 () SeekEntryResult!12401)

(assert (=> b!1495595 (= e!837673 (Intermediate!12401 false (toIndex!0 lt!651526 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495596 () Bool)

(declare-fun e!837671 () Bool)

(declare-fun lt!651623 () SeekEntryResult!12401)

(assert (=> b!1495596 (= e!837671 (bvsge (x!133610 lt!651623) #b01111111111111111111111111111110))))

(declare-fun b!1495598 () Bool)

(declare-fun e!837675 () SeekEntryResult!12401)

(assert (=> b!1495598 (= e!837675 e!837673)))

(declare-fun c!138641 () Bool)

(declare-fun lt!651622 () (_ BitVec 64))

(assert (=> b!1495598 (= c!138641 (or (= lt!651622 lt!651526) (= (bvadd lt!651622 lt!651622) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495599 () Bool)

(assert (=> b!1495599 (and (bvsge (index!51998 lt!651623) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651623) (size!48688 lt!651523)))))

(declare-fun e!837672 () Bool)

(assert (=> b!1495599 (= e!837672 (= (select (arr!48136 lt!651523) (index!51998 lt!651623)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495600 () Bool)

(assert (=> b!1495600 (and (bvsge (index!51998 lt!651623) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651623) (size!48688 lt!651523)))))

(declare-fun res!1017389 () Bool)

(assert (=> b!1495600 (= res!1017389 (= (select (arr!48136 lt!651523) (index!51998 lt!651623)) lt!651526))))

(assert (=> b!1495600 (=> res!1017389 e!837672)))

(declare-fun e!837674 () Bool)

(assert (=> b!1495600 (= e!837674 e!837672)))

(declare-fun b!1495601 () Bool)

(assert (=> b!1495601 (= e!837673 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651526 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651526 lt!651523 mask!2687))))

(declare-fun b!1495602 () Bool)

(assert (=> b!1495602 (= e!837675 (Intermediate!12401 true (toIndex!0 lt!651526 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495603 () Bool)

(assert (=> b!1495603 (= e!837671 e!837674)))

(declare-fun res!1017390 () Bool)

(assert (=> b!1495603 (= res!1017390 (and ((_ is Intermediate!12401) lt!651623) (not (undefined!13213 lt!651623)) (bvslt (x!133610 lt!651623) #b01111111111111111111111111111110) (bvsge (x!133610 lt!651623) #b00000000000000000000000000000000) (bvsge (x!133610 lt!651623) #b00000000000000000000000000000000)))))

(assert (=> b!1495603 (=> (not res!1017390) (not e!837674))))

(declare-fun d!157079 () Bool)

(assert (=> d!157079 e!837671))

(declare-fun c!138639 () Bool)

(assert (=> d!157079 (= c!138639 (and ((_ is Intermediate!12401) lt!651623) (undefined!13213 lt!651623)))))

(assert (=> d!157079 (= lt!651623 e!837675)))

(declare-fun c!138640 () Bool)

(assert (=> d!157079 (= c!138640 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157079 (= lt!651622 (select (arr!48136 lt!651523) (toIndex!0 lt!651526 mask!2687)))))

(assert (=> d!157079 (validMask!0 mask!2687)))

(assert (=> d!157079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651526 mask!2687) lt!651526 lt!651523 mask!2687) lt!651623)))

(declare-fun b!1495597 () Bool)

(assert (=> b!1495597 (and (bvsge (index!51998 lt!651623) #b00000000000000000000000000000000) (bvslt (index!51998 lt!651623) (size!48688 lt!651523)))))

(declare-fun res!1017391 () Bool)

(assert (=> b!1495597 (= res!1017391 (= (select (arr!48136 lt!651523) (index!51998 lt!651623)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495597 (=> res!1017391 e!837672)))

(assert (= (and d!157079 c!138640) b!1495602))

(assert (= (and d!157079 (not c!138640)) b!1495598))

(assert (= (and b!1495598 c!138641) b!1495595))

(assert (= (and b!1495598 (not c!138641)) b!1495601))

(assert (= (and d!157079 c!138639) b!1495596))

(assert (= (and d!157079 (not c!138639)) b!1495603))

(assert (= (and b!1495603 res!1017390) b!1495600))

(assert (= (and b!1495600 (not res!1017389)) b!1495597))

(assert (= (and b!1495597 (not res!1017391)) b!1495599))

(declare-fun m!1378413 () Bool)

(assert (=> b!1495599 m!1378413))

(assert (=> d!157079 m!1378165))

(declare-fun m!1378415 () Bool)

(assert (=> d!157079 m!1378415))

(assert (=> d!157079 m!1378201))

(assert (=> b!1495600 m!1378413))

(assert (=> b!1495601 m!1378165))

(declare-fun m!1378417 () Bool)

(assert (=> b!1495601 m!1378417))

(assert (=> b!1495601 m!1378417))

(declare-fun m!1378419 () Bool)

(assert (=> b!1495601 m!1378419))

(assert (=> b!1495597 m!1378413))

(assert (=> b!1495294 d!157079))

(declare-fun d!157081 () Bool)

(declare-fun lt!651625 () (_ BitVec 32))

(declare-fun lt!651624 () (_ BitVec 32))

(assert (=> d!157081 (= lt!651625 (bvmul (bvxor lt!651624 (bvlshr lt!651624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157081 (= lt!651624 ((_ extract 31 0) (bvand (bvxor lt!651526 (bvlshr lt!651526 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157081 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017371 (let ((h!36109 ((_ extract 31 0) (bvand (bvxor lt!651526 (bvlshr lt!651526 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133614 (bvmul (bvxor h!36109 (bvlshr h!36109 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133614 (bvlshr x!133614 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017371 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017371 #b00000000000000000000000000000000))))))

(assert (=> d!157081 (= (toIndex!0 lt!651526 mask!2687) (bvand (bvxor lt!651625 (bvlshr lt!651625 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495294 d!157081))

(check-sat (not b!1495486) (not b!1495550) (not b!1495587) (not d!157063) (not d!157043) (not d!157051) (not b!1495591) (not b!1495594) (not b!1495556) (not b!1495504) (not b!1495495) (not bm!67985) (not d!157079) (not d!157047) (not b!1495601) (not b!1495477) (not b!1495589) (not bm!67988) (not d!157071) (not b!1495575) (not b!1495562) (not b!1495523) (not b!1495586) (not d!157045) (not d!157041) (not bm!67989) (not d!157055) (not d!157049) (not b!1495531) (not d!157057) (not b!1495572) (not d!157059))
(check-sat)
