; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127368 () Bool)

(assert start!127368)

(declare-fun b!1497263 () Bool)

(declare-fun res!1018471 () Bool)

(declare-fun e!838490 () Bool)

(assert (=> b!1497263 (=> res!1018471 e!838490)))

(declare-fun e!838495 () Bool)

(assert (=> b!1497263 (= res!1018471 e!838495)))

(declare-fun c!138938 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497263 (= c!138938 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497264 () Bool)

(declare-fun res!1018462 () Bool)

(declare-fun e!838498 () Bool)

(assert (=> b!1497264 (=> (not res!1018462) (not e!838498))))

(declare-datatypes ((array!99830 0))(
  ( (array!99831 (arr!48179 (Array (_ BitVec 32) (_ BitVec 64))) (size!48729 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99830)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497264 (= res!1018462 (validKeyInArray!0 (select (arr!48179 a!2862) i!1006)))))

(declare-fun b!1497265 () Bool)

(declare-fun res!1018472 () Bool)

(assert (=> b!1497265 (=> res!1018472 e!838490)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497265 (= res!1018472 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497266 () Bool)

(declare-fun e!838492 () Bool)

(declare-fun e!838497 () Bool)

(assert (=> b!1497266 (= e!838492 (not e!838497))))

(declare-fun res!1018464 () Bool)

(assert (=> b!1497266 (=> res!1018464 e!838497)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1497266 (= res!1018464 (or (and (= (select (arr!48179 a!2862) index!646) (select (store (arr!48179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48179 a!2862) index!646) (select (arr!48179 a!2862) j!93))) (= (select (arr!48179 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12419 0))(
  ( (MissingZero!12419 (index!52068 (_ BitVec 32))) (Found!12419 (index!52069 (_ BitVec 32))) (Intermediate!12419 (undefined!13231 Bool) (index!52070 (_ BitVec 32)) (x!133693 (_ BitVec 32))) (Undefined!12419) (MissingVacant!12419 (index!52071 (_ BitVec 32))) )
))
(declare-fun lt!652378 () SeekEntryResult!12419)

(assert (=> b!1497266 (and (= lt!652378 (Found!12419 j!93)) (or (= (select (arr!48179 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48179 a!2862) intermediateBeforeIndex!19) (select (arr!48179 a!2862) j!93))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99830 (_ BitVec 32)) SeekEntryResult!12419)

(assert (=> b!1497266 (= lt!652378 (seekEntryOrOpen!0 (select (arr!48179 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99830 (_ BitVec 32)) Bool)

(assert (=> b!1497266 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50178 0))(
  ( (Unit!50179) )
))
(declare-fun lt!652380 () Unit!50178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50178)

(assert (=> b!1497266 (= lt!652380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!652382 () SeekEntryResult!12419)

(declare-fun lt!652384 () array!99830)

(declare-fun b!1497267 () Bool)

(declare-fun lt!652383 () (_ BitVec 64))

(declare-fun e!838494 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99830 (_ BitVec 32)) SeekEntryResult!12419)

(assert (=> b!1497267 (= e!838494 (= lt!652382 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652383 lt!652384 mask!2687)))))

(declare-fun res!1018459 () Bool)

(assert (=> start!127368 (=> (not res!1018459) (not e!838498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127368 (= res!1018459 (validMask!0 mask!2687))))

(assert (=> start!127368 e!838498))

(assert (=> start!127368 true))

(declare-fun array_inv!37207 (array!99830) Bool)

(assert (=> start!127368 (array_inv!37207 a!2862)))

(declare-fun b!1497268 () Bool)

(declare-fun res!1018474 () Bool)

(assert (=> b!1497268 (=> (not res!1018474) (not e!838498))))

(assert (=> b!1497268 (= res!1018474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497269 () Bool)

(declare-fun res!1018470 () Bool)

(assert (=> b!1497269 (=> (not res!1018470) (not e!838498))))

(assert (=> b!1497269 (= res!1018470 (and (= (size!48729 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48729 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48729 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497270 () Bool)

(declare-fun e!838491 () Bool)

(declare-fun e!838496 () Bool)

(assert (=> b!1497270 (= e!838491 e!838496)))

(declare-fun res!1018473 () Bool)

(assert (=> b!1497270 (=> (not res!1018473) (not e!838496))))

(declare-fun lt!652379 () SeekEntryResult!12419)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497270 (= res!1018473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48179 a!2862) j!93) mask!2687) (select (arr!48179 a!2862) j!93) a!2862 mask!2687) lt!652379))))

(assert (=> b!1497270 (= lt!652379 (Intermediate!12419 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497271 () Bool)

(declare-fun res!1018457 () Bool)

(assert (=> b!1497271 (=> (not res!1018457) (not e!838498))))

(assert (=> b!1497271 (= res!1018457 (validKeyInArray!0 (select (arr!48179 a!2862) j!93)))))

(declare-fun b!1497272 () Bool)

(declare-fun res!1018461 () Bool)

(assert (=> b!1497272 (=> (not res!1018461) (not e!838492))))

(assert (=> b!1497272 (= res!1018461 e!838494)))

(declare-fun c!138937 () Bool)

(assert (=> b!1497272 (= c!138937 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497273 () Bool)

(declare-fun lt!652377 () (_ BitVec 32))

(assert (=> b!1497273 (= e!838495 (not (= lt!652382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652377 lt!652383 lt!652384 mask!2687))))))

(declare-fun b!1497274 () Bool)

(declare-fun res!1018465 () Bool)

(assert (=> b!1497274 (=> (not res!1018465) (not e!838492))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1497274 (= res!1018465 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497275 () Bool)

(declare-fun res!1018467 () Bool)

(assert (=> b!1497275 (=> res!1018467 e!838490)))

(assert (=> b!1497275 (= res!1018467 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652377 (select (arr!48179 a!2862) j!93) a!2862 mask!2687) lt!652379)))))

(declare-fun b!1497276 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99830 (_ BitVec 32)) SeekEntryResult!12419)

(assert (=> b!1497276 (= e!838494 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652383 lt!652384 mask!2687) (seekEntryOrOpen!0 lt!652383 lt!652384 mask!2687)))))

(declare-fun b!1497277 () Bool)

(assert (=> b!1497277 (= e!838495 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652377 intermediateAfterIndex!19 lt!652383 lt!652384 mask!2687) (seekEntryOrOpen!0 lt!652383 lt!652384 mask!2687))))))

(declare-fun b!1497278 () Bool)

(assert (=> b!1497278 (= e!838498 e!838491)))

(declare-fun res!1018458 () Bool)

(assert (=> b!1497278 (=> (not res!1018458) (not e!838491))))

(assert (=> b!1497278 (= res!1018458 (= (select (store (arr!48179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497278 (= lt!652384 (array!99831 (store (arr!48179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48729 a!2862)))))

(declare-fun b!1497279 () Bool)

(assert (=> b!1497279 (= e!838496 e!838492)))

(declare-fun res!1018460 () Bool)

(assert (=> b!1497279 (=> (not res!1018460) (not e!838492))))

(assert (=> b!1497279 (= res!1018460 (= lt!652382 (Intermediate!12419 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1497279 (= lt!652382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652383 mask!2687) lt!652383 lt!652384 mask!2687))))

(assert (=> b!1497279 (= lt!652383 (select (store (arr!48179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497280 () Bool)

(declare-fun res!1018466 () Bool)

(assert (=> b!1497280 (=> (not res!1018466) (not e!838498))))

(declare-datatypes ((List!34680 0))(
  ( (Nil!34677) (Cons!34676 (h!36073 (_ BitVec 64)) (t!49374 List!34680)) )
))
(declare-fun arrayNoDuplicates!0 (array!99830 (_ BitVec 32) List!34680) Bool)

(assert (=> b!1497280 (= res!1018466 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34677))))

(declare-fun b!1497281 () Bool)

(declare-fun res!1018468 () Bool)

(assert (=> b!1497281 (=> (not res!1018468) (not e!838498))))

(assert (=> b!1497281 (= res!1018468 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48729 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48729 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48729 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497282 () Bool)

(declare-fun res!1018469 () Bool)

(assert (=> b!1497282 (=> (not res!1018469) (not e!838496))))

(assert (=> b!1497282 (= res!1018469 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48179 a!2862) j!93) a!2862 mask!2687) lt!652379))))

(declare-fun b!1497283 () Bool)

(assert (=> b!1497283 (= e!838497 e!838490)))

(declare-fun res!1018463 () Bool)

(assert (=> b!1497283 (=> res!1018463 e!838490)))

(assert (=> b!1497283 (= res!1018463 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652377 #b00000000000000000000000000000000) (bvsge lt!652377 (size!48729 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497283 (= lt!652377 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497284 () Bool)

(assert (=> b!1497284 (= e!838490 true)))

(assert (=> b!1497284 (= lt!652378 (seekEntryOrOpen!0 lt!652383 lt!652384 mask!2687))))

(declare-fun lt!652381 () Unit!50178)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50178)

(assert (=> b!1497284 (= lt!652381 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652377 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!127368 res!1018459) b!1497269))

(assert (= (and b!1497269 res!1018470) b!1497264))

(assert (= (and b!1497264 res!1018462) b!1497271))

(assert (= (and b!1497271 res!1018457) b!1497268))

(assert (= (and b!1497268 res!1018474) b!1497280))

(assert (= (and b!1497280 res!1018466) b!1497281))

(assert (= (and b!1497281 res!1018468) b!1497278))

(assert (= (and b!1497278 res!1018458) b!1497270))

(assert (= (and b!1497270 res!1018473) b!1497282))

(assert (= (and b!1497282 res!1018469) b!1497279))

(assert (= (and b!1497279 res!1018460) b!1497272))

(assert (= (and b!1497272 c!138937) b!1497267))

(assert (= (and b!1497272 (not c!138937)) b!1497276))

(assert (= (and b!1497272 res!1018461) b!1497274))

(assert (= (and b!1497274 res!1018465) b!1497266))

(assert (= (and b!1497266 (not res!1018464)) b!1497283))

(assert (= (and b!1497283 (not res!1018463)) b!1497275))

(assert (= (and b!1497275 (not res!1018467)) b!1497263))

(assert (= (and b!1497263 c!138938) b!1497273))

(assert (= (and b!1497263 (not c!138938)) b!1497277))

(assert (= (and b!1497263 (not res!1018471)) b!1497265))

(assert (= (and b!1497265 (not res!1018472)) b!1497284))

(declare-fun m!1380355 () Bool)

(assert (=> start!127368 m!1380355))

(declare-fun m!1380357 () Bool)

(assert (=> start!127368 m!1380357))

(declare-fun m!1380359 () Bool)

(assert (=> b!1497282 m!1380359))

(assert (=> b!1497282 m!1380359))

(declare-fun m!1380361 () Bool)

(assert (=> b!1497282 m!1380361))

(declare-fun m!1380363 () Bool)

(assert (=> b!1497277 m!1380363))

(declare-fun m!1380365 () Bool)

(assert (=> b!1497277 m!1380365))

(declare-fun m!1380367 () Bool)

(assert (=> b!1497268 m!1380367))

(declare-fun m!1380369 () Bool)

(assert (=> b!1497267 m!1380369))

(declare-fun m!1380371 () Bool)

(assert (=> b!1497280 m!1380371))

(declare-fun m!1380373 () Bool)

(assert (=> b!1497264 m!1380373))

(assert (=> b!1497264 m!1380373))

(declare-fun m!1380375 () Bool)

(assert (=> b!1497264 m!1380375))

(declare-fun m!1380377 () Bool)

(assert (=> b!1497273 m!1380377))

(assert (=> b!1497271 m!1380359))

(assert (=> b!1497271 m!1380359))

(declare-fun m!1380379 () Bool)

(assert (=> b!1497271 m!1380379))

(declare-fun m!1380381 () Bool)

(assert (=> b!1497283 m!1380381))

(assert (=> b!1497284 m!1380365))

(declare-fun m!1380383 () Bool)

(assert (=> b!1497284 m!1380383))

(assert (=> b!1497275 m!1380359))

(assert (=> b!1497275 m!1380359))

(declare-fun m!1380385 () Bool)

(assert (=> b!1497275 m!1380385))

(assert (=> b!1497270 m!1380359))

(assert (=> b!1497270 m!1380359))

(declare-fun m!1380387 () Bool)

(assert (=> b!1497270 m!1380387))

(assert (=> b!1497270 m!1380387))

(assert (=> b!1497270 m!1380359))

(declare-fun m!1380389 () Bool)

(assert (=> b!1497270 m!1380389))

(declare-fun m!1380391 () Bool)

(assert (=> b!1497266 m!1380391))

(declare-fun m!1380393 () Bool)

(assert (=> b!1497266 m!1380393))

(declare-fun m!1380395 () Bool)

(assert (=> b!1497266 m!1380395))

(declare-fun m!1380397 () Bool)

(assert (=> b!1497266 m!1380397))

(declare-fun m!1380399 () Bool)

(assert (=> b!1497266 m!1380399))

(assert (=> b!1497266 m!1380359))

(declare-fun m!1380401 () Bool)

(assert (=> b!1497266 m!1380401))

(declare-fun m!1380403 () Bool)

(assert (=> b!1497266 m!1380403))

(assert (=> b!1497266 m!1380359))

(declare-fun m!1380405 () Bool)

(assert (=> b!1497276 m!1380405))

(assert (=> b!1497276 m!1380365))

(declare-fun m!1380407 () Bool)

(assert (=> b!1497279 m!1380407))

(assert (=> b!1497279 m!1380407))

(declare-fun m!1380409 () Bool)

(assert (=> b!1497279 m!1380409))

(assert (=> b!1497279 m!1380393))

(declare-fun m!1380411 () Bool)

(assert (=> b!1497279 m!1380411))

(assert (=> b!1497278 m!1380393))

(declare-fun m!1380413 () Bool)

(assert (=> b!1497278 m!1380413))

(push 1)

