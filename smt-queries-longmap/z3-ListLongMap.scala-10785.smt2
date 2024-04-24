; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126486 () Bool)

(assert start!126486)

(declare-fun res!1005205 () Bool)

(declare-fun e!830490 () Bool)

(assert (=> start!126486 (=> (not res!1005205) (not e!830490))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126486 (= res!1005205 (validMask!0 mask!2687))))

(assert (=> start!126486 e!830490))

(assert (=> start!126486 true))

(declare-datatypes ((array!99430 0))(
  ( (array!99431 (arr!47989 (Array (_ BitVec 32) (_ BitVec 64))) (size!48540 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99430)

(declare-fun array_inv!37270 (array!99430) Bool)

(assert (=> start!126486 (array_inv!37270 a!2862)))

(declare-fun b!1480304 () Bool)

(declare-fun res!1005211 () Bool)

(assert (=> b!1480304 (=> (not res!1005211) (not e!830490))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1480304 (= res!1005211 (and (= (size!48540 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48540 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48540 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480305 () Bool)

(declare-fun e!830485 () Bool)

(declare-fun e!830493 () Bool)

(assert (=> b!1480305 (= e!830485 e!830493)))

(declare-fun res!1005212 () Bool)

(assert (=> b!1480305 (=> (not res!1005212) (not e!830493))))

(declare-datatypes ((SeekEntryResult!12126 0))(
  ( (MissingZero!12126 (index!50896 (_ BitVec 32))) (Found!12126 (index!50897 (_ BitVec 32))) (Intermediate!12126 (undefined!12938 Bool) (index!50898 (_ BitVec 32)) (x!132670 (_ BitVec 32))) (Undefined!12126) (MissingVacant!12126 (index!50899 (_ BitVec 32))) )
))
(declare-fun lt!646375 () SeekEntryResult!12126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99430 (_ BitVec 32)) SeekEntryResult!12126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480305 (= res!1005212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47989 a!2862) j!93) mask!2687) (select (arr!47989 a!2862) j!93) a!2862 mask!2687) lt!646375))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480305 (= lt!646375 (Intermediate!12126 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646371 () SeekEntryResult!12126)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646373 () (_ BitVec 64))

(declare-fun e!830492 () Bool)

(declare-fun lt!646374 () array!99430)

(declare-fun b!1480306 () Bool)

(assert (=> b!1480306 (= e!830492 (= lt!646371 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646373 lt!646374 mask!2687)))))

(declare-fun b!1480307 () Bool)

(declare-fun res!1005216 () Bool)

(assert (=> b!1480307 (=> (not res!1005216) (not e!830490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480307 (= res!1005216 (validKeyInArray!0 (select (arr!47989 a!2862) i!1006)))))

(declare-fun b!1480308 () Bool)

(declare-fun e!830487 () Bool)

(assert (=> b!1480308 (= e!830487 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480309 () Bool)

(declare-fun e!830488 () Bool)

(declare-fun e!830486 () Bool)

(assert (=> b!1480309 (= e!830488 e!830486)))

(declare-fun res!1005215 () Bool)

(assert (=> b!1480309 (=> res!1005215 e!830486)))

(assert (=> b!1480309 (= res!1005215 (or (and (= (select (arr!47989 a!2862) index!646) (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47989 a!2862) index!646) (select (arr!47989 a!2862) j!93))) (not (= (select (arr!47989 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480310 () Bool)

(assert (=> b!1480310 (= e!830490 e!830485)))

(declare-fun res!1005204 () Bool)

(assert (=> b!1480310 (=> (not res!1005204) (not e!830485))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480310 (= res!1005204 (= (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480310 (= lt!646374 (array!99431 (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48540 a!2862)))))

(declare-fun b!1480311 () Bool)

(declare-fun res!1005214 () Bool)

(assert (=> b!1480311 (=> (not res!1005214) (not e!830490))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480311 (= res!1005214 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48540 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48540 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48540 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480312 () Bool)

(declare-fun res!1005213 () Bool)

(assert (=> b!1480312 (=> (not res!1005213) (not e!830490))))

(declare-datatypes ((List!34477 0))(
  ( (Nil!34474) (Cons!34473 (h!35855 (_ BitVec 64)) (t!49163 List!34477)) )
))
(declare-fun arrayNoDuplicates!0 (array!99430 (_ BitVec 32) List!34477) Bool)

(assert (=> b!1480312 (= res!1005213 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34474))))

(declare-fun b!1480313 () Bool)

(declare-fun res!1005206 () Bool)

(declare-fun e!830489 () Bool)

(assert (=> b!1480313 (=> (not res!1005206) (not e!830489))))

(assert (=> b!1480313 (= res!1005206 e!830492)))

(declare-fun c!137080 () Bool)

(assert (=> b!1480313 (= c!137080 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480314 () Bool)

(declare-fun res!1005203 () Bool)

(assert (=> b!1480314 (=> (not res!1005203) (not e!830490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99430 (_ BitVec 32)) Bool)

(assert (=> b!1480314 (= res!1005203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480315 () Bool)

(assert (=> b!1480315 (= e!830489 (not (or (and (= (select (arr!47989 a!2862) index!646) (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47989 a!2862) index!646) (select (arr!47989 a!2862) j!93))) (not (= (select (arr!47989 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480315 e!830488))

(declare-fun res!1005218 () Bool)

(assert (=> b!1480315 (=> (not res!1005218) (not e!830488))))

(declare-fun lt!646372 () SeekEntryResult!12126)

(assert (=> b!1480315 (= res!1005218 (and (= lt!646372 (Found!12126 j!93)) (or (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) (select (arr!47989 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99430 (_ BitVec 32)) SeekEntryResult!12126)

(assert (=> b!1480315 (= lt!646372 (seekEntryOrOpen!0 (select (arr!47989 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1480315 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49625 0))(
  ( (Unit!49626) )
))
(declare-fun lt!646370 () Unit!49625)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49625)

(assert (=> b!1480315 (= lt!646370 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480316 () Bool)

(assert (=> b!1480316 (= e!830493 e!830489)))

(declare-fun res!1005208 () Bool)

(assert (=> b!1480316 (=> (not res!1005208) (not e!830489))))

(assert (=> b!1480316 (= res!1005208 (= lt!646371 (Intermediate!12126 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480316 (= lt!646371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646373 mask!2687) lt!646373 lt!646374 mask!2687))))

(assert (=> b!1480316 (= lt!646373 (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480317 () Bool)

(declare-fun res!1005217 () Bool)

(assert (=> b!1480317 (=> (not res!1005217) (not e!830490))))

(assert (=> b!1480317 (= res!1005217 (validKeyInArray!0 (select (arr!47989 a!2862) j!93)))))

(declare-fun b!1480318 () Bool)

(declare-fun res!1005209 () Bool)

(assert (=> b!1480318 (=> (not res!1005209) (not e!830493))))

(assert (=> b!1480318 (= res!1005209 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47989 a!2862) j!93) a!2862 mask!2687) lt!646375))))

(declare-fun b!1480319 () Bool)

(assert (=> b!1480319 (= e!830486 e!830487)))

(declare-fun res!1005210 () Bool)

(assert (=> b!1480319 (=> (not res!1005210) (not e!830487))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99430 (_ BitVec 32)) SeekEntryResult!12126)

(assert (=> b!1480319 (= res!1005210 (= lt!646372 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47989 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480320 () Bool)

(assert (=> b!1480320 (= e!830492 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646373 lt!646374 mask!2687) (seekEntryOrOpen!0 lt!646373 lt!646374 mask!2687)))))

(declare-fun b!1480321 () Bool)

(declare-fun res!1005207 () Bool)

(assert (=> b!1480321 (=> (not res!1005207) (not e!830489))))

(assert (=> b!1480321 (= res!1005207 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126486 res!1005205) b!1480304))

(assert (= (and b!1480304 res!1005211) b!1480307))

(assert (= (and b!1480307 res!1005216) b!1480317))

(assert (= (and b!1480317 res!1005217) b!1480314))

(assert (= (and b!1480314 res!1005203) b!1480312))

(assert (= (and b!1480312 res!1005213) b!1480311))

(assert (= (and b!1480311 res!1005214) b!1480310))

(assert (= (and b!1480310 res!1005204) b!1480305))

(assert (= (and b!1480305 res!1005212) b!1480318))

(assert (= (and b!1480318 res!1005209) b!1480316))

(assert (= (and b!1480316 res!1005208) b!1480313))

(assert (= (and b!1480313 c!137080) b!1480306))

(assert (= (and b!1480313 (not c!137080)) b!1480320))

(assert (= (and b!1480313 res!1005206) b!1480321))

(assert (= (and b!1480321 res!1005207) b!1480315))

(assert (= (and b!1480315 res!1005218) b!1480309))

(assert (= (and b!1480309 (not res!1005215)) b!1480319))

(assert (= (and b!1480319 res!1005210) b!1480308))

(declare-fun m!1366189 () Bool)

(assert (=> b!1480316 m!1366189))

(assert (=> b!1480316 m!1366189))

(declare-fun m!1366191 () Bool)

(assert (=> b!1480316 m!1366191))

(declare-fun m!1366193 () Bool)

(assert (=> b!1480316 m!1366193))

(declare-fun m!1366195 () Bool)

(assert (=> b!1480316 m!1366195))

(declare-fun m!1366197 () Bool)

(assert (=> b!1480314 m!1366197))

(declare-fun m!1366199 () Bool)

(assert (=> b!1480317 m!1366199))

(assert (=> b!1480317 m!1366199))

(declare-fun m!1366201 () Bool)

(assert (=> b!1480317 m!1366201))

(declare-fun m!1366203 () Bool)

(assert (=> b!1480320 m!1366203))

(declare-fun m!1366205 () Bool)

(assert (=> b!1480320 m!1366205))

(declare-fun m!1366207 () Bool)

(assert (=> start!126486 m!1366207))

(declare-fun m!1366209 () Bool)

(assert (=> start!126486 m!1366209))

(assert (=> b!1480319 m!1366199))

(assert (=> b!1480319 m!1366199))

(declare-fun m!1366211 () Bool)

(assert (=> b!1480319 m!1366211))

(assert (=> b!1480305 m!1366199))

(assert (=> b!1480305 m!1366199))

(declare-fun m!1366213 () Bool)

(assert (=> b!1480305 m!1366213))

(assert (=> b!1480305 m!1366213))

(assert (=> b!1480305 m!1366199))

(declare-fun m!1366215 () Bool)

(assert (=> b!1480305 m!1366215))

(declare-fun m!1366217 () Bool)

(assert (=> b!1480306 m!1366217))

(assert (=> b!1480318 m!1366199))

(assert (=> b!1480318 m!1366199))

(declare-fun m!1366219 () Bool)

(assert (=> b!1480318 m!1366219))

(declare-fun m!1366221 () Bool)

(assert (=> b!1480312 m!1366221))

(declare-fun m!1366223 () Bool)

(assert (=> b!1480309 m!1366223))

(assert (=> b!1480309 m!1366193))

(declare-fun m!1366225 () Bool)

(assert (=> b!1480309 m!1366225))

(assert (=> b!1480309 m!1366199))

(declare-fun m!1366227 () Bool)

(assert (=> b!1480315 m!1366227))

(assert (=> b!1480315 m!1366193))

(declare-fun m!1366229 () Bool)

(assert (=> b!1480315 m!1366229))

(assert (=> b!1480315 m!1366225))

(assert (=> b!1480315 m!1366223))

(assert (=> b!1480315 m!1366199))

(declare-fun m!1366231 () Bool)

(assert (=> b!1480315 m!1366231))

(declare-fun m!1366233 () Bool)

(assert (=> b!1480315 m!1366233))

(assert (=> b!1480315 m!1366199))

(declare-fun m!1366235 () Bool)

(assert (=> b!1480307 m!1366235))

(assert (=> b!1480307 m!1366235))

(declare-fun m!1366237 () Bool)

(assert (=> b!1480307 m!1366237))

(assert (=> b!1480310 m!1366193))

(declare-fun m!1366239 () Bool)

(assert (=> b!1480310 m!1366239))

(check-sat (not b!1480317) (not b!1480320) (not start!126486) (not b!1480316) (not b!1480318) (not b!1480319) (not b!1480314) (not b!1480305) (not b!1480315) (not b!1480306) (not b!1480307) (not b!1480312))
(check-sat)
