; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125360 () Bool)

(assert start!125360)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!823400 () Bool)

(declare-fun lt!641381 () (_ BitVec 32))

(declare-fun b!1465353 () Bool)

(declare-datatypes ((array!98808 0))(
  ( (array!98809 (arr!47692 (Array (_ BitVec 32) (_ BitVec 64))) (size!48242 (_ BitVec 32))) )
))
(declare-fun lt!641378 () array!98808)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641382 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11944 0))(
  ( (MissingZero!11944 (index!50168 (_ BitVec 32))) (Found!11944 (index!50169 (_ BitVec 32))) (Intermediate!11944 (undefined!12756 Bool) (index!50170 (_ BitVec 32)) (x!131745 (_ BitVec 32))) (Undefined!11944) (MissingVacant!11944 (index!50171 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98808 (_ BitVec 32)) SeekEntryResult!11944)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98808 (_ BitVec 32)) SeekEntryResult!11944)

(assert (=> b!1465353 (= e!823400 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641381 intermediateAfterIndex!19 lt!641382 lt!641378 mask!2687) (seekEntryOrOpen!0 lt!641382 lt!641378 mask!2687))))))

(declare-fun b!1465354 () Bool)

(declare-fun res!994267 () Bool)

(declare-fun e!823391 () Bool)

(assert (=> b!1465354 (=> (not res!994267) (not e!823391))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465354 (= res!994267 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465355 () Bool)

(declare-fun res!994260 () Bool)

(declare-fun e!823393 () Bool)

(assert (=> b!1465355 (=> (not res!994260) (not e!823393))))

(declare-fun a!2862 () array!98808)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98808 (_ BitVec 32)) Bool)

(assert (=> b!1465355 (= res!994260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465356 () Bool)

(declare-fun res!994256 () Bool)

(declare-fun e!823394 () Bool)

(assert (=> b!1465356 (=> (not res!994256) (not e!823394))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!641379 () SeekEntryResult!11944)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98808 (_ BitVec 32)) SeekEntryResult!11944)

(assert (=> b!1465356 (= res!994256 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!641379))))

(declare-fun b!1465357 () Bool)

(declare-fun e!823398 () Bool)

(assert (=> b!1465357 (= e!823393 e!823398)))

(declare-fun res!994257 () Bool)

(assert (=> b!1465357 (=> (not res!994257) (not e!823398))))

(assert (=> b!1465357 (= res!994257 (= (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465357 (= lt!641378 (array!98809 (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48242 a!2862)))))

(declare-fun b!1465358 () Bool)

(declare-fun e!823396 () Bool)

(assert (=> b!1465358 (= e!823396 true)))

(declare-fun lt!641380 () Bool)

(assert (=> b!1465358 (= lt!641380 e!823400)))

(declare-fun c!135060 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465358 (= c!135060 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465360 () Bool)

(declare-fun res!994262 () Bool)

(assert (=> b!1465360 (=> (not res!994262) (not e!823393))))

(declare-datatypes ((List!34193 0))(
  ( (Nil!34190) (Cons!34189 (h!35539 (_ BitVec 64)) (t!48887 List!34193)) )
))
(declare-fun arrayNoDuplicates!0 (array!98808 (_ BitVec 32) List!34193) Bool)

(assert (=> b!1465360 (= res!994262 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34190))))

(declare-fun b!1465361 () Bool)

(declare-fun res!994259 () Bool)

(assert (=> b!1465361 (=> (not res!994259) (not e!823393))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1465361 (= res!994259 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48242 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48242 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48242 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465362 () Bool)

(declare-fun e!823395 () Bool)

(declare-fun lt!641377 () SeekEntryResult!11944)

(assert (=> b!1465362 (= e!823395 (= lt!641377 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641382 lt!641378 mask!2687)))))

(declare-fun b!1465363 () Bool)

(assert (=> b!1465363 (= e!823398 e!823394)))

(declare-fun res!994258 () Bool)

(assert (=> b!1465363 (=> (not res!994258) (not e!823394))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465363 (= res!994258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47692 a!2862) j!93) mask!2687) (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!641379))))

(assert (=> b!1465363 (= lt!641379 (Intermediate!11944 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465364 () Bool)

(declare-fun res!994265 () Bool)

(assert (=> b!1465364 (=> (not res!994265) (not e!823393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465364 (= res!994265 (validKeyInArray!0 (select (arr!47692 a!2862) j!93)))))

(declare-fun b!1465365 () Bool)

(declare-fun e!823397 () Bool)

(assert (=> b!1465365 (= e!823397 e!823396)))

(declare-fun res!994261 () Bool)

(assert (=> b!1465365 (=> res!994261 e!823396)))

(assert (=> b!1465365 (= res!994261 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641381 #b00000000000000000000000000000000) (bvsge lt!641381 (size!48242 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465365 (= lt!641381 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465366 () Bool)

(assert (=> b!1465366 (= e!823395 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641382 lt!641378 mask!2687) (seekEntryOrOpen!0 lt!641382 lt!641378 mask!2687)))))

(declare-fun b!1465367 () Bool)

(declare-fun res!994264 () Bool)

(declare-fun e!823392 () Bool)

(assert (=> b!1465367 (=> (not res!994264) (not e!823392))))

(assert (=> b!1465367 (= res!994264 (= (seekEntryOrOpen!0 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) (Found!11944 j!93)))))

(declare-fun b!1465368 () Bool)

(declare-fun res!994271 () Bool)

(assert (=> b!1465368 (=> res!994271 e!823396)))

(assert (=> b!1465368 (= res!994271 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641381 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!641379)))))

(declare-fun b!1465369 () Bool)

(declare-fun res!994268 () Bool)

(assert (=> b!1465369 (=> (not res!994268) (not e!823393))))

(assert (=> b!1465369 (= res!994268 (validKeyInArray!0 (select (arr!47692 a!2862) i!1006)))))

(declare-fun res!994263 () Bool)

(assert (=> start!125360 (=> (not res!994263) (not e!823393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125360 (= res!994263 (validMask!0 mask!2687))))

(assert (=> start!125360 e!823393))

(assert (=> start!125360 true))

(declare-fun array_inv!36720 (array!98808) Bool)

(assert (=> start!125360 (array_inv!36720 a!2862)))

(declare-fun b!1465359 () Bool)

(assert (=> b!1465359 (= e!823392 (or (= (select (arr!47692 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47692 a!2862) intermediateBeforeIndex!19) (select (arr!47692 a!2862) j!93))))))

(declare-fun b!1465370 () Bool)

(declare-fun res!994266 () Bool)

(assert (=> b!1465370 (=> (not res!994266) (not e!823391))))

(assert (=> b!1465370 (= res!994266 e!823395)))

(declare-fun c!135059 () Bool)

(assert (=> b!1465370 (= c!135059 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465371 () Bool)

(assert (=> b!1465371 (= e!823391 (not e!823397))))

(declare-fun res!994270 () Bool)

(assert (=> b!1465371 (=> res!994270 e!823397)))

(assert (=> b!1465371 (= res!994270 (or (and (= (select (arr!47692 a!2862) index!646) (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47692 a!2862) index!646) (select (arr!47692 a!2862) j!93))) (= (select (arr!47692 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465371 e!823392))

(declare-fun res!994272 () Bool)

(assert (=> b!1465371 (=> (not res!994272) (not e!823392))))

(assert (=> b!1465371 (= res!994272 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49384 0))(
  ( (Unit!49385) )
))
(declare-fun lt!641376 () Unit!49384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49384)

(assert (=> b!1465371 (= lt!641376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465372 () Bool)

(declare-fun res!994269 () Bool)

(assert (=> b!1465372 (=> (not res!994269) (not e!823393))))

(assert (=> b!1465372 (= res!994269 (and (= (size!48242 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48242 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48242 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465373 () Bool)

(assert (=> b!1465373 (= e!823394 e!823391)))

(declare-fun res!994273 () Bool)

(assert (=> b!1465373 (=> (not res!994273) (not e!823391))))

(assert (=> b!1465373 (= res!994273 (= lt!641377 (Intermediate!11944 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465373 (= lt!641377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641382 mask!2687) lt!641382 lt!641378 mask!2687))))

(assert (=> b!1465373 (= lt!641382 (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465374 () Bool)

(assert (=> b!1465374 (= e!823400 (not (= lt!641377 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641381 lt!641382 lt!641378 mask!2687))))))

(assert (= (and start!125360 res!994263) b!1465372))

(assert (= (and b!1465372 res!994269) b!1465369))

(assert (= (and b!1465369 res!994268) b!1465364))

(assert (= (and b!1465364 res!994265) b!1465355))

(assert (= (and b!1465355 res!994260) b!1465360))

(assert (= (and b!1465360 res!994262) b!1465361))

(assert (= (and b!1465361 res!994259) b!1465357))

(assert (= (and b!1465357 res!994257) b!1465363))

(assert (= (and b!1465363 res!994258) b!1465356))

(assert (= (and b!1465356 res!994256) b!1465373))

(assert (= (and b!1465373 res!994273) b!1465370))

(assert (= (and b!1465370 c!135059) b!1465362))

(assert (= (and b!1465370 (not c!135059)) b!1465366))

(assert (= (and b!1465370 res!994266) b!1465354))

(assert (= (and b!1465354 res!994267) b!1465371))

(assert (= (and b!1465371 res!994272) b!1465367))

(assert (= (and b!1465367 res!994264) b!1465359))

(assert (= (and b!1465371 (not res!994270)) b!1465365))

(assert (= (and b!1465365 (not res!994261)) b!1465368))

(assert (= (and b!1465368 (not res!994271)) b!1465358))

(assert (= (and b!1465358 c!135060) b!1465374))

(assert (= (and b!1465358 (not c!135060)) b!1465353))

(declare-fun m!1352457 () Bool)

(assert (=> b!1465353 m!1352457))

(declare-fun m!1352459 () Bool)

(assert (=> b!1465353 m!1352459))

(declare-fun m!1352461 () Bool)

(assert (=> b!1465360 m!1352461))

(declare-fun m!1352463 () Bool)

(assert (=> b!1465356 m!1352463))

(assert (=> b!1465356 m!1352463))

(declare-fun m!1352465 () Bool)

(assert (=> b!1465356 m!1352465))

(assert (=> b!1465368 m!1352463))

(assert (=> b!1465368 m!1352463))

(declare-fun m!1352467 () Bool)

(assert (=> b!1465368 m!1352467))

(declare-fun m!1352469 () Bool)

(assert (=> b!1465369 m!1352469))

(assert (=> b!1465369 m!1352469))

(declare-fun m!1352471 () Bool)

(assert (=> b!1465369 m!1352471))

(assert (=> b!1465364 m!1352463))

(assert (=> b!1465364 m!1352463))

(declare-fun m!1352473 () Bool)

(assert (=> b!1465364 m!1352473))

(declare-fun m!1352475 () Bool)

(assert (=> b!1465365 m!1352475))

(declare-fun m!1352477 () Bool)

(assert (=> b!1465355 m!1352477))

(declare-fun m!1352479 () Bool)

(assert (=> b!1465373 m!1352479))

(assert (=> b!1465373 m!1352479))

(declare-fun m!1352481 () Bool)

(assert (=> b!1465373 m!1352481))

(declare-fun m!1352483 () Bool)

(assert (=> b!1465373 m!1352483))

(declare-fun m!1352485 () Bool)

(assert (=> b!1465373 m!1352485))

(declare-fun m!1352487 () Bool)

(assert (=> b!1465371 m!1352487))

(assert (=> b!1465371 m!1352483))

(declare-fun m!1352489 () Bool)

(assert (=> b!1465371 m!1352489))

(declare-fun m!1352491 () Bool)

(assert (=> b!1465371 m!1352491))

(declare-fun m!1352493 () Bool)

(assert (=> b!1465371 m!1352493))

(assert (=> b!1465371 m!1352463))

(declare-fun m!1352495 () Bool)

(assert (=> b!1465362 m!1352495))

(assert (=> b!1465363 m!1352463))

(assert (=> b!1465363 m!1352463))

(declare-fun m!1352497 () Bool)

(assert (=> b!1465363 m!1352497))

(assert (=> b!1465363 m!1352497))

(assert (=> b!1465363 m!1352463))

(declare-fun m!1352499 () Bool)

(assert (=> b!1465363 m!1352499))

(assert (=> b!1465357 m!1352483))

(declare-fun m!1352501 () Bool)

(assert (=> b!1465357 m!1352501))

(declare-fun m!1352503 () Bool)

(assert (=> b!1465374 m!1352503))

(declare-fun m!1352505 () Bool)

(assert (=> b!1465359 m!1352505))

(assert (=> b!1465359 m!1352463))

(declare-fun m!1352507 () Bool)

(assert (=> start!125360 m!1352507))

(declare-fun m!1352509 () Bool)

(assert (=> start!125360 m!1352509))

(declare-fun m!1352511 () Bool)

(assert (=> b!1465366 m!1352511))

(assert (=> b!1465366 m!1352459))

(assert (=> b!1465367 m!1352463))

(assert (=> b!1465367 m!1352463))

(declare-fun m!1352513 () Bool)

(assert (=> b!1465367 m!1352513))

(push 1)

