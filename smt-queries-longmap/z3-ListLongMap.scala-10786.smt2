; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126492 () Bool)

(assert start!126492)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1480466 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!830570 () Bool)

(assert (=> b!1480466 (= e!830570 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480467 () Bool)

(declare-fun res!1005352 () Bool)

(declare-fun e!830569 () Bool)

(assert (=> b!1480467 (=> (not res!1005352) (not e!830569))))

(declare-datatypes ((array!99436 0))(
  ( (array!99437 (arr!47992 (Array (_ BitVec 32) (_ BitVec 64))) (size!48543 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99436)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12129 0))(
  ( (MissingZero!12129 (index!50908 (_ BitVec 32))) (Found!12129 (index!50909 (_ BitVec 32))) (Intermediate!12129 (undefined!12941 Bool) (index!50910 (_ BitVec 32)) (x!132681 (_ BitVec 32))) (Undefined!12129) (MissingVacant!12129 (index!50911 (_ BitVec 32))) )
))
(declare-fun lt!646424 () SeekEntryResult!12129)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99436 (_ BitVec 32)) SeekEntryResult!12129)

(assert (=> b!1480467 (= res!1005352 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47992 a!2862) j!93) a!2862 mask!2687) lt!646424))))

(declare-fun b!1480468 () Bool)

(declare-fun e!830571 () Bool)

(assert (=> b!1480468 (= e!830571 e!830570)))

(declare-fun res!1005358 () Bool)

(assert (=> b!1480468 (=> (not res!1005358) (not e!830570))))

(declare-fun lt!646427 () SeekEntryResult!12129)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99436 (_ BitVec 32)) SeekEntryResult!12129)

(assert (=> b!1480468 (= res!1005358 (= lt!646427 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47992 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480469 () Bool)

(declare-fun e!830566 () Bool)

(declare-fun lt!646426 () SeekEntryResult!12129)

(declare-fun lt!646429 () (_ BitVec 64))

(declare-fun lt!646425 () array!99436)

(assert (=> b!1480469 (= e!830566 (= lt!646426 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646429 lt!646425 mask!2687)))))

(declare-fun b!1480470 () Bool)

(declare-fun res!1005349 () Bool)

(declare-fun e!830567 () Bool)

(assert (=> b!1480470 (=> (not res!1005349) (not e!830567))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1480470 (= res!1005349 (and (= (size!48543 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48543 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48543 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480471 () Bool)

(declare-fun res!1005354 () Bool)

(declare-fun e!830574 () Bool)

(assert (=> b!1480471 (=> (not res!1005354) (not e!830574))))

(assert (=> b!1480471 (= res!1005354 e!830566)))

(declare-fun c!137089 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480471 (= c!137089 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480472 () Bool)

(assert (=> b!1480472 (= e!830569 e!830574)))

(declare-fun res!1005360 () Bool)

(assert (=> b!1480472 (=> (not res!1005360) (not e!830574))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480472 (= res!1005360 (= lt!646426 (Intermediate!12129 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480472 (= lt!646426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646429 mask!2687) lt!646429 lt!646425 mask!2687))))

(assert (=> b!1480472 (= lt!646429 (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480473 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99436 (_ BitVec 32)) SeekEntryResult!12129)

(assert (=> b!1480473 (= e!830566 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646429 lt!646425 mask!2687) (seekEntryOrOpen!0 lt!646429 lt!646425 mask!2687)))))

(declare-fun b!1480474 () Bool)

(declare-fun res!1005356 () Bool)

(assert (=> b!1480474 (=> (not res!1005356) (not e!830567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480474 (= res!1005356 (validKeyInArray!0 (select (arr!47992 a!2862) i!1006)))))

(declare-fun b!1480475 () Bool)

(declare-fun res!1005348 () Bool)

(assert (=> b!1480475 (=> (not res!1005348) (not e!830567))))

(assert (=> b!1480475 (= res!1005348 (validKeyInArray!0 (select (arr!47992 a!2862) j!93)))))

(declare-fun b!1480477 () Bool)

(declare-fun res!1005350 () Bool)

(assert (=> b!1480477 (=> (not res!1005350) (not e!830567))))

(declare-datatypes ((List!34480 0))(
  ( (Nil!34477) (Cons!34476 (h!35858 (_ BitVec 64)) (t!49166 List!34480)) )
))
(declare-fun arrayNoDuplicates!0 (array!99436 (_ BitVec 32) List!34480) Bool)

(assert (=> b!1480477 (= res!1005350 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34477))))

(declare-fun b!1480478 () Bool)

(declare-fun e!830573 () Bool)

(assert (=> b!1480478 (= e!830573 e!830569)))

(declare-fun res!1005359 () Bool)

(assert (=> b!1480478 (=> (not res!1005359) (not e!830569))))

(assert (=> b!1480478 (= res!1005359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47992 a!2862) j!93) mask!2687) (select (arr!47992 a!2862) j!93) a!2862 mask!2687) lt!646424))))

(assert (=> b!1480478 (= lt!646424 (Intermediate!12129 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480479 () Bool)

(assert (=> b!1480479 (= e!830567 e!830573)))

(declare-fun res!1005361 () Bool)

(assert (=> b!1480479 (=> (not res!1005361) (not e!830573))))

(assert (=> b!1480479 (= res!1005361 (= (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480479 (= lt!646425 (array!99437 (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48543 a!2862)))))

(declare-fun b!1480480 () Bool)

(declare-fun e!830568 () Bool)

(assert (=> b!1480480 (= e!830568 e!830571)))

(declare-fun res!1005362 () Bool)

(assert (=> b!1480480 (=> res!1005362 e!830571)))

(assert (=> b!1480480 (= res!1005362 (or (and (= (select (arr!47992 a!2862) index!646) (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47992 a!2862) index!646) (select (arr!47992 a!2862) j!93))) (not (= (select (arr!47992 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480481 () Bool)

(assert (=> b!1480481 (= e!830574 (not true))))

(assert (=> b!1480481 e!830568))

(declare-fun res!1005357 () Bool)

(assert (=> b!1480481 (=> (not res!1005357) (not e!830568))))

(assert (=> b!1480481 (= res!1005357 (and (= lt!646427 (Found!12129 j!93)) (or (= (select (arr!47992 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47992 a!2862) intermediateBeforeIndex!19) (select (arr!47992 a!2862) j!93)))))))

(assert (=> b!1480481 (= lt!646427 (seekEntryOrOpen!0 (select (arr!47992 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99436 (_ BitVec 32)) Bool)

(assert (=> b!1480481 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49631 0))(
  ( (Unit!49632) )
))
(declare-fun lt!646428 () Unit!49631)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49631)

(assert (=> b!1480481 (= lt!646428 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480482 () Bool)

(declare-fun res!1005353 () Bool)

(assert (=> b!1480482 (=> (not res!1005353) (not e!830567))))

(assert (=> b!1480482 (= res!1005353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480483 () Bool)

(declare-fun res!1005351 () Bool)

(assert (=> b!1480483 (=> (not res!1005351) (not e!830574))))

(assert (=> b!1480483 (= res!1005351 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1005347 () Bool)

(assert (=> start!126492 (=> (not res!1005347) (not e!830567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126492 (= res!1005347 (validMask!0 mask!2687))))

(assert (=> start!126492 e!830567))

(assert (=> start!126492 true))

(declare-fun array_inv!37273 (array!99436) Bool)

(assert (=> start!126492 (array_inv!37273 a!2862)))

(declare-fun b!1480476 () Bool)

(declare-fun res!1005355 () Bool)

(assert (=> b!1480476 (=> (not res!1005355) (not e!830567))))

(assert (=> b!1480476 (= res!1005355 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48543 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48543 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48543 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126492 res!1005347) b!1480470))

(assert (= (and b!1480470 res!1005349) b!1480474))

(assert (= (and b!1480474 res!1005356) b!1480475))

(assert (= (and b!1480475 res!1005348) b!1480482))

(assert (= (and b!1480482 res!1005353) b!1480477))

(assert (= (and b!1480477 res!1005350) b!1480476))

(assert (= (and b!1480476 res!1005355) b!1480479))

(assert (= (and b!1480479 res!1005361) b!1480478))

(assert (= (and b!1480478 res!1005359) b!1480467))

(assert (= (and b!1480467 res!1005352) b!1480472))

(assert (= (and b!1480472 res!1005360) b!1480471))

(assert (= (and b!1480471 c!137089) b!1480469))

(assert (= (and b!1480471 (not c!137089)) b!1480473))

(assert (= (and b!1480471 res!1005354) b!1480483))

(assert (= (and b!1480483 res!1005351) b!1480481))

(assert (= (and b!1480481 res!1005357) b!1480480))

(assert (= (and b!1480480 (not res!1005362)) b!1480468))

(assert (= (and b!1480468 res!1005358) b!1480466))

(declare-fun m!1366345 () Bool)

(assert (=> b!1480479 m!1366345))

(declare-fun m!1366347 () Bool)

(assert (=> b!1480479 m!1366347))

(declare-fun m!1366349 () Bool)

(assert (=> b!1480482 m!1366349))

(declare-fun m!1366351 () Bool)

(assert (=> b!1480468 m!1366351))

(assert (=> b!1480468 m!1366351))

(declare-fun m!1366353 () Bool)

(assert (=> b!1480468 m!1366353))

(declare-fun m!1366355 () Bool)

(assert (=> b!1480472 m!1366355))

(assert (=> b!1480472 m!1366355))

(declare-fun m!1366357 () Bool)

(assert (=> b!1480472 m!1366357))

(assert (=> b!1480472 m!1366345))

(declare-fun m!1366359 () Bool)

(assert (=> b!1480472 m!1366359))

(declare-fun m!1366361 () Bool)

(assert (=> b!1480474 m!1366361))

(assert (=> b!1480474 m!1366361))

(declare-fun m!1366363 () Bool)

(assert (=> b!1480474 m!1366363))

(declare-fun m!1366365 () Bool)

(assert (=> start!126492 m!1366365))

(declare-fun m!1366367 () Bool)

(assert (=> start!126492 m!1366367))

(declare-fun m!1366369 () Bool)

(assert (=> b!1480473 m!1366369))

(declare-fun m!1366371 () Bool)

(assert (=> b!1480473 m!1366371))

(declare-fun m!1366373 () Bool)

(assert (=> b!1480469 m!1366373))

(assert (=> b!1480467 m!1366351))

(assert (=> b!1480467 m!1366351))

(declare-fun m!1366375 () Bool)

(assert (=> b!1480467 m!1366375))

(assert (=> b!1480475 m!1366351))

(assert (=> b!1480475 m!1366351))

(declare-fun m!1366377 () Bool)

(assert (=> b!1480475 m!1366377))

(declare-fun m!1366379 () Bool)

(assert (=> b!1480477 m!1366379))

(declare-fun m!1366381 () Bool)

(assert (=> b!1480480 m!1366381))

(assert (=> b!1480480 m!1366345))

(declare-fun m!1366383 () Bool)

(assert (=> b!1480480 m!1366383))

(assert (=> b!1480480 m!1366351))

(declare-fun m!1366385 () Bool)

(assert (=> b!1480481 m!1366385))

(declare-fun m!1366387 () Bool)

(assert (=> b!1480481 m!1366387))

(assert (=> b!1480481 m!1366351))

(declare-fun m!1366389 () Bool)

(assert (=> b!1480481 m!1366389))

(declare-fun m!1366391 () Bool)

(assert (=> b!1480481 m!1366391))

(assert (=> b!1480481 m!1366351))

(assert (=> b!1480478 m!1366351))

(assert (=> b!1480478 m!1366351))

(declare-fun m!1366393 () Bool)

(assert (=> b!1480478 m!1366393))

(assert (=> b!1480478 m!1366393))

(assert (=> b!1480478 m!1366351))

(declare-fun m!1366395 () Bool)

(assert (=> b!1480478 m!1366395))

(check-sat (not b!1480475) (not b!1480477) (not b!1480478) (not b!1480474) (not b!1480472) (not b!1480467) (not b!1480469) (not b!1480482) (not b!1480468) (not b!1480481) (not start!126492) (not b!1480473))
(check-sat)
