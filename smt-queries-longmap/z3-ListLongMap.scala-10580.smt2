; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124620 () Bool)

(assert start!124620)

(declare-fun b!1443208 () Bool)

(declare-fun e!813299 () Bool)

(declare-fun e!813300 () Bool)

(assert (=> b!1443208 (= e!813299 e!813300)))

(declare-fun res!975347 () Bool)

(assert (=> b!1443208 (=> (not res!975347) (not e!813300))))

(declare-datatypes ((SeekEntryResult!11574 0))(
  ( (MissingZero!11574 (index!48688 (_ BitVec 32))) (Found!11574 (index!48689 (_ BitVec 32))) (Intermediate!11574 (undefined!12386 Bool) (index!48690 (_ BitVec 32)) (x!130391 (_ BitVec 32))) (Undefined!11574) (MissingVacant!11574 (index!48691 (_ BitVec 32))) )
))
(declare-fun lt!633788 () SeekEntryResult!11574)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443208 (= res!975347 (= lt!633788 (Intermediate!11574 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98068 0))(
  ( (array!98069 (arr!47322 (Array (_ BitVec 32) (_ BitVec 64))) (size!47872 (_ BitVec 32))) )
))
(declare-fun lt!633787 () array!98068)

(declare-fun lt!633789 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98068 (_ BitVec 32)) SeekEntryResult!11574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443208 (= lt!633788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633789 mask!2687) lt!633789 lt!633787 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98068)

(assert (=> b!1443208 (= lt!633789 (select (store (arr!47322 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443209 () Bool)

(declare-fun res!975339 () Bool)

(declare-fun e!813301 () Bool)

(assert (=> b!1443209 (=> (not res!975339) (not e!813301))))

(declare-datatypes ((List!33823 0))(
  ( (Nil!33820) (Cons!33819 (h!35169 (_ BitVec 64)) (t!48517 List!33823)) )
))
(declare-fun arrayNoDuplicates!0 (array!98068 (_ BitVec 32) List!33823) Bool)

(assert (=> b!1443209 (= res!975339 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33820))))

(declare-fun b!1443210 () Bool)

(declare-fun res!975338 () Bool)

(declare-fun e!813304 () Bool)

(assert (=> b!1443210 (=> (not res!975338) (not e!813304))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98068 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1443210 (= res!975338 (= (seekEntryOrOpen!0 (select (arr!47322 a!2862) j!93) a!2862 mask!2687) (Found!11574 j!93)))))

(declare-fun res!975349 () Bool)

(assert (=> start!124620 (=> (not res!975349) (not e!813301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124620 (= res!975349 (validMask!0 mask!2687))))

(assert (=> start!124620 e!813301))

(assert (=> start!124620 true))

(declare-fun array_inv!36350 (array!98068) Bool)

(assert (=> start!124620 (array_inv!36350 a!2862)))

(declare-fun b!1443211 () Bool)

(declare-fun res!975352 () Bool)

(assert (=> b!1443211 (=> (not res!975352) (not e!813300))))

(declare-fun e!813302 () Bool)

(assert (=> b!1443211 (= res!975352 e!813302)))

(declare-fun c!133446 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1443211 (= c!133446 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443212 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98068 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1443212 (= e!813302 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633789 lt!633787 mask!2687) (seekEntryOrOpen!0 lt!633789 lt!633787 mask!2687)))))

(declare-fun b!1443213 () Bool)

(declare-fun e!813305 () Bool)

(assert (=> b!1443213 (= e!813300 (not e!813305))))

(declare-fun res!975350 () Bool)

(assert (=> b!1443213 (=> res!975350 e!813305)))

(assert (=> b!1443213 (= res!975350 (or (not (= (select (arr!47322 a!2862) index!646) (select (store (arr!47322 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47322 a!2862) index!646) (select (arr!47322 a!2862) j!93))) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1443213 e!813304))

(declare-fun res!975346 () Bool)

(assert (=> b!1443213 (=> (not res!975346) (not e!813304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98068 (_ BitVec 32)) Bool)

(assert (=> b!1443213 (= res!975346 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48644 0))(
  ( (Unit!48645) )
))
(declare-fun lt!633785 () Unit!48644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48644)

(assert (=> b!1443213 (= lt!633785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443214 () Bool)

(declare-fun res!975351 () Bool)

(assert (=> b!1443214 (=> (not res!975351) (not e!813301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443214 (= res!975351 (validKeyInArray!0 (select (arr!47322 a!2862) i!1006)))))

(declare-fun b!1443215 () Bool)

(declare-fun res!975348 () Bool)

(assert (=> b!1443215 (=> (not res!975348) (not e!813299))))

(declare-fun lt!633786 () SeekEntryResult!11574)

(assert (=> b!1443215 (= res!975348 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47322 a!2862) j!93) a!2862 mask!2687) lt!633786))))

(declare-fun b!1443216 () Bool)

(declare-fun e!813303 () Bool)

(assert (=> b!1443216 (= e!813301 e!813303)))

(declare-fun res!975342 () Bool)

(assert (=> b!1443216 (=> (not res!975342) (not e!813303))))

(assert (=> b!1443216 (= res!975342 (= (select (store (arr!47322 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443216 (= lt!633787 (array!98069 (store (arr!47322 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47872 a!2862)))))

(declare-fun b!1443217 () Bool)

(assert (=> b!1443217 (= e!813302 (= lt!633788 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633789 lt!633787 mask!2687)))))

(declare-fun b!1443218 () Bool)

(declare-fun res!975344 () Bool)

(assert (=> b!1443218 (=> (not res!975344) (not e!813301))))

(assert (=> b!1443218 (= res!975344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443219 () Bool)

(declare-fun res!975345 () Bool)

(assert (=> b!1443219 (=> (not res!975345) (not e!813301))))

(assert (=> b!1443219 (= res!975345 (and (= (size!47872 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47872 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47872 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443220 () Bool)

(assert (=> b!1443220 (= e!813305 (validKeyInArray!0 lt!633789))))

(declare-fun b!1443221 () Bool)

(declare-fun res!975341 () Bool)

(assert (=> b!1443221 (=> (not res!975341) (not e!813301))))

(assert (=> b!1443221 (= res!975341 (validKeyInArray!0 (select (arr!47322 a!2862) j!93)))))

(declare-fun b!1443222 () Bool)

(assert (=> b!1443222 (= e!813303 e!813299)))

(declare-fun res!975340 () Bool)

(assert (=> b!1443222 (=> (not res!975340) (not e!813299))))

(assert (=> b!1443222 (= res!975340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47322 a!2862) j!93) mask!2687) (select (arr!47322 a!2862) j!93) a!2862 mask!2687) lt!633786))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443222 (= lt!633786 (Intermediate!11574 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443223 () Bool)

(declare-fun res!975337 () Bool)

(assert (=> b!1443223 (=> (not res!975337) (not e!813301))))

(assert (=> b!1443223 (= res!975337 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47872 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47872 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47872 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443224 () Bool)

(assert (=> b!1443224 (= e!813304 (or (= (select (arr!47322 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47322 a!2862) intermediateBeforeIndex!19) (select (arr!47322 a!2862) j!93))))))

(declare-fun b!1443225 () Bool)

(declare-fun res!975343 () Bool)

(assert (=> b!1443225 (=> (not res!975343) (not e!813300))))

(assert (=> b!1443225 (= res!975343 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124620 res!975349) b!1443219))

(assert (= (and b!1443219 res!975345) b!1443214))

(assert (= (and b!1443214 res!975351) b!1443221))

(assert (= (and b!1443221 res!975341) b!1443218))

(assert (= (and b!1443218 res!975344) b!1443209))

(assert (= (and b!1443209 res!975339) b!1443223))

(assert (= (and b!1443223 res!975337) b!1443216))

(assert (= (and b!1443216 res!975342) b!1443222))

(assert (= (and b!1443222 res!975340) b!1443215))

(assert (= (and b!1443215 res!975348) b!1443208))

(assert (= (and b!1443208 res!975347) b!1443211))

(assert (= (and b!1443211 c!133446) b!1443217))

(assert (= (and b!1443211 (not c!133446)) b!1443212))

(assert (= (and b!1443211 res!975352) b!1443225))

(assert (= (and b!1443225 res!975343) b!1443213))

(assert (= (and b!1443213 res!975346) b!1443210))

(assert (= (and b!1443210 res!975338) b!1443224))

(assert (= (and b!1443213 (not res!975350)) b!1443220))

(declare-fun m!1332299 () Bool)

(assert (=> b!1443215 m!1332299))

(assert (=> b!1443215 m!1332299))

(declare-fun m!1332301 () Bool)

(assert (=> b!1443215 m!1332301))

(declare-fun m!1332303 () Bool)

(assert (=> b!1443212 m!1332303))

(declare-fun m!1332305 () Bool)

(assert (=> b!1443212 m!1332305))

(assert (=> b!1443222 m!1332299))

(assert (=> b!1443222 m!1332299))

(declare-fun m!1332307 () Bool)

(assert (=> b!1443222 m!1332307))

(assert (=> b!1443222 m!1332307))

(assert (=> b!1443222 m!1332299))

(declare-fun m!1332309 () Bool)

(assert (=> b!1443222 m!1332309))

(declare-fun m!1332311 () Bool)

(assert (=> b!1443208 m!1332311))

(assert (=> b!1443208 m!1332311))

(declare-fun m!1332313 () Bool)

(assert (=> b!1443208 m!1332313))

(declare-fun m!1332315 () Bool)

(assert (=> b!1443208 m!1332315))

(declare-fun m!1332317 () Bool)

(assert (=> b!1443208 m!1332317))

(declare-fun m!1332319 () Bool)

(assert (=> b!1443217 m!1332319))

(declare-fun m!1332321 () Bool)

(assert (=> start!124620 m!1332321))

(declare-fun m!1332323 () Bool)

(assert (=> start!124620 m!1332323))

(assert (=> b!1443210 m!1332299))

(assert (=> b!1443210 m!1332299))

(declare-fun m!1332325 () Bool)

(assert (=> b!1443210 m!1332325))

(declare-fun m!1332327 () Bool)

(assert (=> b!1443218 m!1332327))

(declare-fun m!1332329 () Bool)

(assert (=> b!1443214 m!1332329))

(assert (=> b!1443214 m!1332329))

(declare-fun m!1332331 () Bool)

(assert (=> b!1443214 m!1332331))

(assert (=> b!1443216 m!1332315))

(declare-fun m!1332333 () Bool)

(assert (=> b!1443216 m!1332333))

(declare-fun m!1332335 () Bool)

(assert (=> b!1443224 m!1332335))

(assert (=> b!1443224 m!1332299))

(declare-fun m!1332337 () Bool)

(assert (=> b!1443213 m!1332337))

(assert (=> b!1443213 m!1332315))

(declare-fun m!1332339 () Bool)

(assert (=> b!1443213 m!1332339))

(declare-fun m!1332341 () Bool)

(assert (=> b!1443213 m!1332341))

(declare-fun m!1332343 () Bool)

(assert (=> b!1443213 m!1332343))

(assert (=> b!1443213 m!1332299))

(declare-fun m!1332345 () Bool)

(assert (=> b!1443220 m!1332345))

(declare-fun m!1332347 () Bool)

(assert (=> b!1443209 m!1332347))

(assert (=> b!1443221 m!1332299))

(assert (=> b!1443221 m!1332299))

(declare-fun m!1332349 () Bool)

(assert (=> b!1443221 m!1332349))

(check-sat (not b!1443214) (not start!124620) (not b!1443209) (not b!1443221) (not b!1443217) (not b!1443215) (not b!1443212) (not b!1443218) (not b!1443210) (not b!1443222) (not b!1443220) (not b!1443213) (not b!1443208))
(check-sat)
