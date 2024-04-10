; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126240 () Bool)

(assert start!126240)

(declare-fun b!1479479 () Bool)

(declare-fun e!829873 () Bool)

(declare-fun e!829875 () Bool)

(assert (=> b!1479479 (= e!829873 e!829875)))

(declare-fun res!1005380 () Bool)

(assert (=> b!1479479 (=> (not res!1005380) (not e!829875))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99346 0))(
  ( (array!99347 (arr!47952 (Array (_ BitVec 32) (_ BitVec 64))) (size!48502 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99346)

(assert (=> b!1479479 (= res!1005380 (= (select (store (arr!47952 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646044 () array!99346)

(assert (=> b!1479479 (= lt!646044 (array!99347 (store (arr!47952 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48502 a!2862)))))

(declare-fun lt!646045 () (_ BitVec 64))

(declare-fun e!829872 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1479480 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12192 0))(
  ( (MissingZero!12192 (index!51160 (_ BitVec 32))) (Found!12192 (index!51161 (_ BitVec 32))) (Intermediate!12192 (undefined!13004 Bool) (index!51162 (_ BitVec 32)) (x!132743 (_ BitVec 32))) (Undefined!12192) (MissingVacant!12192 (index!51163 (_ BitVec 32))) )
))
(declare-fun lt!646046 () SeekEntryResult!12192)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99346 (_ BitVec 32)) SeekEntryResult!12192)

(assert (=> b!1479480 (= e!829872 (= lt!646046 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646045 lt!646044 mask!2687)))))

(declare-fun b!1479481 () Bool)

(declare-fun res!1005385 () Bool)

(assert (=> b!1479481 (=> (not res!1005385) (not e!829873))))

(declare-datatypes ((List!34453 0))(
  ( (Nil!34450) (Cons!34449 (h!35817 (_ BitVec 64)) (t!49147 List!34453)) )
))
(declare-fun arrayNoDuplicates!0 (array!99346 (_ BitVec 32) List!34453) Bool)

(assert (=> b!1479481 (= res!1005385 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34450))))

(declare-fun b!1479482 () Bool)

(declare-fun e!829876 () Bool)

(assert (=> b!1479482 (= e!829876 true)))

(declare-fun lt!646040 () SeekEntryResult!12192)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99346 (_ BitVec 32)) SeekEntryResult!12192)

(assert (=> b!1479482 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646045 lt!646044 mask!2687) lt!646040)))

(declare-datatypes ((Unit!49724 0))(
  ( (Unit!49725) )
))
(declare-fun lt!646041 () Unit!49724)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49724)

(assert (=> b!1479482 (= lt!646041 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479484 () Bool)

(declare-fun e!829871 () Bool)

(declare-fun e!829869 () Bool)

(assert (=> b!1479484 (= e!829871 e!829869)))

(declare-fun res!1005390 () Bool)

(assert (=> b!1479484 (=> res!1005390 e!829869)))

(assert (=> b!1479484 (= res!1005390 (or (and (= (select (arr!47952 a!2862) index!646) (select (store (arr!47952 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47952 a!2862) index!646) (select (arr!47952 a!2862) j!93))) (not (= (select (arr!47952 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479485 () Bool)

(declare-fun res!1005397 () Bool)

(assert (=> b!1479485 (=> (not res!1005397) (not e!829873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99346 (_ BitVec 32)) Bool)

(assert (=> b!1479485 (= res!1005397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479486 () Bool)

(declare-fun e!829877 () Bool)

(assert (=> b!1479486 (= e!829877 (not e!829876))))

(declare-fun res!1005394 () Bool)

(assert (=> b!1479486 (=> res!1005394 e!829876)))

(assert (=> b!1479486 (= res!1005394 (or (and (= (select (arr!47952 a!2862) index!646) (select (store (arr!47952 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47952 a!2862) index!646) (select (arr!47952 a!2862) j!93))) (not (= (select (arr!47952 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47952 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479486 e!829871))

(declare-fun res!1005383 () Bool)

(assert (=> b!1479486 (=> (not res!1005383) (not e!829871))))

(declare-fun lt!646042 () SeekEntryResult!12192)

(assert (=> b!1479486 (= res!1005383 (and (= lt!646042 lt!646040) (or (= (select (arr!47952 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47952 a!2862) intermediateBeforeIndex!19) (select (arr!47952 a!2862) j!93)))))))

(assert (=> b!1479486 (= lt!646040 (Found!12192 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99346 (_ BitVec 32)) SeekEntryResult!12192)

(assert (=> b!1479486 (= lt!646042 (seekEntryOrOpen!0 (select (arr!47952 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479486 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646043 () Unit!49724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49724)

(assert (=> b!1479486 (= lt!646043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479487 () Bool)

(declare-fun res!1005381 () Bool)

(assert (=> b!1479487 (=> (not res!1005381) (not e!829877))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479487 (= res!1005381 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479488 () Bool)

(declare-fun res!1005395 () Bool)

(assert (=> b!1479488 (=> (not res!1005395) (not e!829873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479488 (= res!1005395 (validKeyInArray!0 (select (arr!47952 a!2862) i!1006)))))

(declare-fun b!1479489 () Bool)

(assert (=> b!1479489 (= e!829872 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646045 lt!646044 mask!2687) (seekEntryOrOpen!0 lt!646045 lt!646044 mask!2687)))))

(declare-fun b!1479490 () Bool)

(declare-fun res!1005388 () Bool)

(assert (=> b!1479490 (=> (not res!1005388) (not e!829873))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479490 (= res!1005388 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48502 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48502 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48502 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479491 () Bool)

(declare-fun e!829868 () Bool)

(assert (=> b!1479491 (= e!829875 e!829868)))

(declare-fun res!1005386 () Bool)

(assert (=> b!1479491 (=> (not res!1005386) (not e!829868))))

(declare-fun lt!646047 () SeekEntryResult!12192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479491 (= res!1005386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47952 a!2862) j!93) mask!2687) (select (arr!47952 a!2862) j!93) a!2862 mask!2687) lt!646047))))

(assert (=> b!1479491 (= lt!646047 (Intermediate!12192 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479492 () Bool)

(declare-fun e!829874 () Bool)

(assert (=> b!1479492 (= e!829869 e!829874)))

(declare-fun res!1005396 () Bool)

(assert (=> b!1479492 (=> (not res!1005396) (not e!829874))))

(assert (=> b!1479492 (= res!1005396 (= lt!646042 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47952 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479493 () Bool)

(declare-fun res!1005391 () Bool)

(assert (=> b!1479493 (=> (not res!1005391) (not e!829877))))

(assert (=> b!1479493 (= res!1005391 e!829872)))

(declare-fun c!136569 () Bool)

(assert (=> b!1479493 (= c!136569 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479494 () Bool)

(declare-fun res!1005387 () Bool)

(assert (=> b!1479494 (=> (not res!1005387) (not e!829873))))

(assert (=> b!1479494 (= res!1005387 (validKeyInArray!0 (select (arr!47952 a!2862) j!93)))))

(declare-fun b!1479495 () Bool)

(declare-fun res!1005382 () Bool)

(assert (=> b!1479495 (=> res!1005382 e!829876)))

(assert (=> b!1479495 (= res!1005382 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47952 a!2862) j!93) a!2862 mask!2687) lt!646040)))))

(declare-fun b!1479496 () Bool)

(declare-fun res!1005393 () Bool)

(assert (=> b!1479496 (=> (not res!1005393) (not e!829868))))

(assert (=> b!1479496 (= res!1005393 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47952 a!2862) j!93) a!2862 mask!2687) lt!646047))))

(declare-fun res!1005392 () Bool)

(assert (=> start!126240 (=> (not res!1005392) (not e!829873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126240 (= res!1005392 (validMask!0 mask!2687))))

(assert (=> start!126240 e!829873))

(assert (=> start!126240 true))

(declare-fun array_inv!36980 (array!99346) Bool)

(assert (=> start!126240 (array_inv!36980 a!2862)))

(declare-fun b!1479483 () Bool)

(assert (=> b!1479483 (= e!829874 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479497 () Bool)

(declare-fun res!1005389 () Bool)

(assert (=> b!1479497 (=> (not res!1005389) (not e!829873))))

(assert (=> b!1479497 (= res!1005389 (and (= (size!48502 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48502 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48502 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479498 () Bool)

(assert (=> b!1479498 (= e!829868 e!829877)))

(declare-fun res!1005384 () Bool)

(assert (=> b!1479498 (=> (not res!1005384) (not e!829877))))

(assert (=> b!1479498 (= res!1005384 (= lt!646046 (Intermediate!12192 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479498 (= lt!646046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646045 mask!2687) lt!646045 lt!646044 mask!2687))))

(assert (=> b!1479498 (= lt!646045 (select (store (arr!47952 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126240 res!1005392) b!1479497))

(assert (= (and b!1479497 res!1005389) b!1479488))

(assert (= (and b!1479488 res!1005395) b!1479494))

(assert (= (and b!1479494 res!1005387) b!1479485))

(assert (= (and b!1479485 res!1005397) b!1479481))

(assert (= (and b!1479481 res!1005385) b!1479490))

(assert (= (and b!1479490 res!1005388) b!1479479))

(assert (= (and b!1479479 res!1005380) b!1479491))

(assert (= (and b!1479491 res!1005386) b!1479496))

(assert (= (and b!1479496 res!1005393) b!1479498))

(assert (= (and b!1479498 res!1005384) b!1479493))

(assert (= (and b!1479493 c!136569) b!1479480))

(assert (= (and b!1479493 (not c!136569)) b!1479489))

(assert (= (and b!1479493 res!1005391) b!1479487))

(assert (= (and b!1479487 res!1005381) b!1479486))

(assert (= (and b!1479486 res!1005383) b!1479484))

(assert (= (and b!1479484 (not res!1005390)) b!1479492))

(assert (= (and b!1479492 res!1005396) b!1479483))

(assert (= (and b!1479486 (not res!1005394)) b!1479495))

(assert (= (and b!1479495 (not res!1005382)) b!1479482))

(declare-fun m!1365345 () Bool)

(assert (=> b!1479491 m!1365345))

(assert (=> b!1479491 m!1365345))

(declare-fun m!1365347 () Bool)

(assert (=> b!1479491 m!1365347))

(assert (=> b!1479491 m!1365347))

(assert (=> b!1479491 m!1365345))

(declare-fun m!1365349 () Bool)

(assert (=> b!1479491 m!1365349))

(assert (=> b!1479494 m!1365345))

(assert (=> b!1479494 m!1365345))

(declare-fun m!1365351 () Bool)

(assert (=> b!1479494 m!1365351))

(declare-fun m!1365353 () Bool)

(assert (=> b!1479488 m!1365353))

(assert (=> b!1479488 m!1365353))

(declare-fun m!1365355 () Bool)

(assert (=> b!1479488 m!1365355))

(declare-fun m!1365357 () Bool)

(assert (=> b!1479486 m!1365357))

(declare-fun m!1365359 () Bool)

(assert (=> b!1479486 m!1365359))

(declare-fun m!1365361 () Bool)

(assert (=> b!1479486 m!1365361))

(declare-fun m!1365363 () Bool)

(assert (=> b!1479486 m!1365363))

(declare-fun m!1365365 () Bool)

(assert (=> b!1479486 m!1365365))

(assert (=> b!1479486 m!1365345))

(declare-fun m!1365367 () Bool)

(assert (=> b!1479486 m!1365367))

(declare-fun m!1365369 () Bool)

(assert (=> b!1479486 m!1365369))

(assert (=> b!1479486 m!1365345))

(declare-fun m!1365371 () Bool)

(assert (=> b!1479480 m!1365371))

(declare-fun m!1365373 () Bool)

(assert (=> b!1479485 m!1365373))

(assert (=> b!1479496 m!1365345))

(assert (=> b!1479496 m!1365345))

(declare-fun m!1365375 () Bool)

(assert (=> b!1479496 m!1365375))

(assert (=> b!1479479 m!1365359))

(declare-fun m!1365377 () Bool)

(assert (=> b!1479479 m!1365377))

(declare-fun m!1365379 () Bool)

(assert (=> start!126240 m!1365379))

(declare-fun m!1365381 () Bool)

(assert (=> start!126240 m!1365381))

(assert (=> b!1479492 m!1365345))

(assert (=> b!1479492 m!1365345))

(declare-fun m!1365383 () Bool)

(assert (=> b!1479492 m!1365383))

(assert (=> b!1479484 m!1365365))

(assert (=> b!1479484 m!1365359))

(assert (=> b!1479484 m!1365363))

(assert (=> b!1479484 m!1365345))

(declare-fun m!1365385 () Bool)

(assert (=> b!1479481 m!1365385))

(declare-fun m!1365387 () Bool)

(assert (=> b!1479498 m!1365387))

(assert (=> b!1479498 m!1365387))

(declare-fun m!1365389 () Bool)

(assert (=> b!1479498 m!1365389))

(assert (=> b!1479498 m!1365359))

(declare-fun m!1365391 () Bool)

(assert (=> b!1479498 m!1365391))

(declare-fun m!1365393 () Bool)

(assert (=> b!1479482 m!1365393))

(declare-fun m!1365395 () Bool)

(assert (=> b!1479482 m!1365395))

(assert (=> b!1479495 m!1365345))

(assert (=> b!1479495 m!1365345))

(declare-fun m!1365397 () Bool)

(assert (=> b!1479495 m!1365397))

(assert (=> b!1479489 m!1365393))

(declare-fun m!1365399 () Bool)

(assert (=> b!1479489 m!1365399))

(check-sat (not b!1479496) (not b!1479486) (not b!1479482) (not b!1479492) (not b!1479495) (not b!1479480) (not b!1479481) (not b!1479491) (not b!1479498) (not b!1479485) (not start!126240) (not b!1479489) (not b!1479494) (not b!1479488))
(check-sat)
