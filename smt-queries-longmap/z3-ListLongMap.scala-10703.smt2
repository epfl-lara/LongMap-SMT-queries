; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125358 () Bool)

(assert start!125358)

(declare-fun b!1465287 () Bool)

(declare-fun res!994212 () Bool)

(declare-fun e!823362 () Bool)

(assert (=> b!1465287 (=> (not res!994212) (not e!823362))))

(declare-datatypes ((array!98806 0))(
  ( (array!98807 (arr!47691 (Array (_ BitVec 32) (_ BitVec 64))) (size!48241 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98806)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465287 (= res!994212 (validKeyInArray!0 (select (arr!47691 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!823370 () Bool)

(declare-fun lt!641361 () (_ BitVec 32))

(declare-fun b!1465288 () Bool)

(declare-fun lt!641356 () array!98806)

(declare-fun lt!641355 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11943 0))(
  ( (MissingZero!11943 (index!50164 (_ BitVec 32))) (Found!11943 (index!50165 (_ BitVec 32))) (Intermediate!11943 (undefined!12755 Bool) (index!50166 (_ BitVec 32)) (x!131744 (_ BitVec 32))) (Undefined!11943) (MissingVacant!11943 (index!50167 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11943)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11943)

(assert (=> b!1465288 (= e!823370 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641361 intermediateAfterIndex!19 lt!641355 lt!641356 mask!2687) (seekEntryOrOpen!0 lt!641355 lt!641356 mask!2687))))))

(declare-fun b!1465289 () Bool)

(declare-fun e!823368 () Bool)

(assert (=> b!1465289 (= e!823368 true)))

(declare-fun lt!641358 () Bool)

(assert (=> b!1465289 (= lt!641358 e!823370)))

(declare-fun c!135054 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465289 (= c!135054 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465290 () Bool)

(declare-fun res!994214 () Bool)

(assert (=> b!1465290 (=> res!994214 e!823368)))

(declare-fun lt!641359 () SeekEntryResult!11943)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11943)

(assert (=> b!1465290 (= res!994214 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641361 (select (arr!47691 a!2862) j!93) a!2862 mask!2687) lt!641359)))))

(declare-fun b!1465291 () Bool)

(declare-fun e!823364 () Bool)

(assert (=> b!1465291 (= e!823362 e!823364)))

(declare-fun res!994209 () Bool)

(assert (=> b!1465291 (=> (not res!994209) (not e!823364))))

(assert (=> b!1465291 (= res!994209 (= (select (store (arr!47691 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465291 (= lt!641356 (array!98807 (store (arr!47691 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48241 a!2862)))))

(declare-fun b!1465292 () Bool)

(declare-fun res!994203 () Bool)

(assert (=> b!1465292 (=> (not res!994203) (not e!823362))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1465292 (= res!994203 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48241 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48241 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48241 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465293 () Bool)

(declare-fun res!994217 () Bool)

(declare-fun e!823369 () Bool)

(assert (=> b!1465293 (=> (not res!994217) (not e!823369))))

(assert (=> b!1465293 (= res!994217 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465294 () Bool)

(declare-fun res!994206 () Bool)

(declare-fun e!823361 () Bool)

(assert (=> b!1465294 (=> (not res!994206) (not e!823361))))

(assert (=> b!1465294 (= res!994206 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47691 a!2862) j!93) a!2862 mask!2687) lt!641359))))

(declare-fun b!1465295 () Bool)

(declare-fun res!994211 () Bool)

(assert (=> b!1465295 (=> (not res!994211) (not e!823362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98806 (_ BitVec 32)) Bool)

(assert (=> b!1465295 (= res!994211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465296 () Bool)

(declare-fun e!823367 () Bool)

(assert (=> b!1465296 (= e!823367 e!823368)))

(declare-fun res!994219 () Bool)

(assert (=> b!1465296 (=> res!994219 e!823368)))

(assert (=> b!1465296 (= res!994219 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641361 #b00000000000000000000000000000000) (bvsge lt!641361 (size!48241 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465296 (= lt!641361 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!641360 () SeekEntryResult!11943)

(declare-fun b!1465297 () Bool)

(assert (=> b!1465297 (= e!823370 (not (= lt!641360 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641361 lt!641355 lt!641356 mask!2687))))))

(declare-fun b!1465298 () Bool)

(declare-fun e!823365 () Bool)

(assert (=> b!1465298 (= e!823365 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641355 lt!641356 mask!2687) (seekEntryOrOpen!0 lt!641355 lt!641356 mask!2687)))))

(declare-fun b!1465299 () Bool)

(declare-fun res!994204 () Bool)

(declare-fun e!823363 () Bool)

(assert (=> b!1465299 (=> (not res!994204) (not e!823363))))

(assert (=> b!1465299 (= res!994204 (= (seekEntryOrOpen!0 (select (arr!47691 a!2862) j!93) a!2862 mask!2687) (Found!11943 j!93)))))

(declare-fun b!1465301 () Bool)

(assert (=> b!1465301 (= e!823369 (not e!823367))))

(declare-fun res!994218 () Bool)

(assert (=> b!1465301 (=> res!994218 e!823367)))

(assert (=> b!1465301 (= res!994218 (or (and (= (select (arr!47691 a!2862) index!646) (select (store (arr!47691 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47691 a!2862) index!646) (select (arr!47691 a!2862) j!93))) (= (select (arr!47691 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465301 e!823363))

(declare-fun res!994207 () Bool)

(assert (=> b!1465301 (=> (not res!994207) (not e!823363))))

(assert (=> b!1465301 (= res!994207 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49382 0))(
  ( (Unit!49383) )
))
(declare-fun lt!641357 () Unit!49382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49382)

(assert (=> b!1465301 (= lt!641357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465302 () Bool)

(declare-fun res!994215 () Bool)

(assert (=> b!1465302 (=> (not res!994215) (not e!823362))))

(declare-datatypes ((List!34192 0))(
  ( (Nil!34189) (Cons!34188 (h!35538 (_ BitVec 64)) (t!48886 List!34192)) )
))
(declare-fun arrayNoDuplicates!0 (array!98806 (_ BitVec 32) List!34192) Bool)

(assert (=> b!1465302 (= res!994215 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34189))))

(declare-fun b!1465303 () Bool)

(declare-fun res!994202 () Bool)

(assert (=> b!1465303 (=> (not res!994202) (not e!823362))))

(assert (=> b!1465303 (= res!994202 (validKeyInArray!0 (select (arr!47691 a!2862) j!93)))))

(declare-fun b!1465304 () Bool)

(assert (=> b!1465304 (= e!823361 e!823369)))

(declare-fun res!994205 () Bool)

(assert (=> b!1465304 (=> (not res!994205) (not e!823369))))

(assert (=> b!1465304 (= res!994205 (= lt!641360 (Intermediate!11943 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465304 (= lt!641360 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641355 mask!2687) lt!641355 lt!641356 mask!2687))))

(assert (=> b!1465304 (= lt!641355 (select (store (arr!47691 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465305 () Bool)

(assert (=> b!1465305 (= e!823365 (= lt!641360 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641355 lt!641356 mask!2687)))))

(declare-fun b!1465306 () Bool)

(assert (=> b!1465306 (= e!823363 (or (= (select (arr!47691 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47691 a!2862) intermediateBeforeIndex!19) (select (arr!47691 a!2862) j!93))))))

(declare-fun b!1465307 () Bool)

(assert (=> b!1465307 (= e!823364 e!823361)))

(declare-fun res!994208 () Bool)

(assert (=> b!1465307 (=> (not res!994208) (not e!823361))))

(assert (=> b!1465307 (= res!994208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47691 a!2862) j!93) mask!2687) (select (arr!47691 a!2862) j!93) a!2862 mask!2687) lt!641359))))

(assert (=> b!1465307 (= lt!641359 (Intermediate!11943 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465308 () Bool)

(declare-fun res!994216 () Bool)

(assert (=> b!1465308 (=> (not res!994216) (not e!823362))))

(assert (=> b!1465308 (= res!994216 (and (= (size!48241 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48241 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48241 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465300 () Bool)

(declare-fun res!994210 () Bool)

(assert (=> b!1465300 (=> (not res!994210) (not e!823369))))

(assert (=> b!1465300 (= res!994210 e!823365)))

(declare-fun c!135053 () Bool)

(assert (=> b!1465300 (= c!135053 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!994213 () Bool)

(assert (=> start!125358 (=> (not res!994213) (not e!823362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125358 (= res!994213 (validMask!0 mask!2687))))

(assert (=> start!125358 e!823362))

(assert (=> start!125358 true))

(declare-fun array_inv!36719 (array!98806) Bool)

(assert (=> start!125358 (array_inv!36719 a!2862)))

(assert (= (and start!125358 res!994213) b!1465308))

(assert (= (and b!1465308 res!994216) b!1465287))

(assert (= (and b!1465287 res!994212) b!1465303))

(assert (= (and b!1465303 res!994202) b!1465295))

(assert (= (and b!1465295 res!994211) b!1465302))

(assert (= (and b!1465302 res!994215) b!1465292))

(assert (= (and b!1465292 res!994203) b!1465291))

(assert (= (and b!1465291 res!994209) b!1465307))

(assert (= (and b!1465307 res!994208) b!1465294))

(assert (= (and b!1465294 res!994206) b!1465304))

(assert (= (and b!1465304 res!994205) b!1465300))

(assert (= (and b!1465300 c!135053) b!1465305))

(assert (= (and b!1465300 (not c!135053)) b!1465298))

(assert (= (and b!1465300 res!994210) b!1465293))

(assert (= (and b!1465293 res!994217) b!1465301))

(assert (= (and b!1465301 res!994207) b!1465299))

(assert (= (and b!1465299 res!994204) b!1465306))

(assert (= (and b!1465301 (not res!994218)) b!1465296))

(assert (= (and b!1465296 (not res!994219)) b!1465290))

(assert (= (and b!1465290 (not res!994214)) b!1465289))

(assert (= (and b!1465289 c!135054) b!1465297))

(assert (= (and b!1465289 (not c!135054)) b!1465288))

(declare-fun m!1352399 () Bool)

(assert (=> b!1465294 m!1352399))

(assert (=> b!1465294 m!1352399))

(declare-fun m!1352401 () Bool)

(assert (=> b!1465294 m!1352401))

(declare-fun m!1352403 () Bool)

(assert (=> b!1465287 m!1352403))

(assert (=> b!1465287 m!1352403))

(declare-fun m!1352405 () Bool)

(assert (=> b!1465287 m!1352405))

(declare-fun m!1352407 () Bool)

(assert (=> b!1465301 m!1352407))

(declare-fun m!1352409 () Bool)

(assert (=> b!1465301 m!1352409))

(declare-fun m!1352411 () Bool)

(assert (=> b!1465301 m!1352411))

(declare-fun m!1352413 () Bool)

(assert (=> b!1465301 m!1352413))

(declare-fun m!1352415 () Bool)

(assert (=> b!1465301 m!1352415))

(assert (=> b!1465301 m!1352399))

(assert (=> b!1465290 m!1352399))

(assert (=> b!1465290 m!1352399))

(declare-fun m!1352417 () Bool)

(assert (=> b!1465290 m!1352417))

(declare-fun m!1352419 () Bool)

(assert (=> b!1465297 m!1352419))

(declare-fun m!1352421 () Bool)

(assert (=> start!125358 m!1352421))

(declare-fun m!1352423 () Bool)

(assert (=> start!125358 m!1352423))

(declare-fun m!1352425 () Bool)

(assert (=> b!1465288 m!1352425))

(declare-fun m!1352427 () Bool)

(assert (=> b!1465288 m!1352427))

(declare-fun m!1352429 () Bool)

(assert (=> b!1465306 m!1352429))

(assert (=> b!1465306 m!1352399))

(declare-fun m!1352431 () Bool)

(assert (=> b!1465296 m!1352431))

(assert (=> b!1465299 m!1352399))

(assert (=> b!1465299 m!1352399))

(declare-fun m!1352433 () Bool)

(assert (=> b!1465299 m!1352433))

(declare-fun m!1352435 () Bool)

(assert (=> b!1465302 m!1352435))

(declare-fun m!1352437 () Bool)

(assert (=> b!1465295 m!1352437))

(assert (=> b!1465307 m!1352399))

(assert (=> b!1465307 m!1352399))

(declare-fun m!1352439 () Bool)

(assert (=> b!1465307 m!1352439))

(assert (=> b!1465307 m!1352439))

(assert (=> b!1465307 m!1352399))

(declare-fun m!1352441 () Bool)

(assert (=> b!1465307 m!1352441))

(assert (=> b!1465291 m!1352409))

(declare-fun m!1352443 () Bool)

(assert (=> b!1465291 m!1352443))

(declare-fun m!1352445 () Bool)

(assert (=> b!1465304 m!1352445))

(assert (=> b!1465304 m!1352445))

(declare-fun m!1352447 () Bool)

(assert (=> b!1465304 m!1352447))

(assert (=> b!1465304 m!1352409))

(declare-fun m!1352449 () Bool)

(assert (=> b!1465304 m!1352449))

(declare-fun m!1352451 () Bool)

(assert (=> b!1465305 m!1352451))

(declare-fun m!1352453 () Bool)

(assert (=> b!1465298 m!1352453))

(assert (=> b!1465298 m!1352427))

(assert (=> b!1465303 m!1352399))

(assert (=> b!1465303 m!1352399))

(declare-fun m!1352455 () Bool)

(assert (=> b!1465303 m!1352455))

(check-sat (not b!1465296) (not b!1465298) (not b!1465301) (not b!1465290) (not b!1465303) (not b!1465287) (not b!1465305) (not b!1465297) (not b!1465288) (not b!1465295) (not b!1465299) (not start!125358) (not b!1465294) (not b!1465307) (not b!1465302) (not b!1465304))
(check-sat)
