; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126458 () Bool)

(assert start!126458)

(declare-fun b!1483423 () Bool)

(declare-fun e!831741 () Bool)

(declare-fun e!831740 () Bool)

(assert (=> b!1483423 (= e!831741 (not e!831740))))

(declare-fun res!1008488 () Bool)

(assert (=> b!1483423 (=> res!1008488 e!831740)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99418 0))(
  ( (array!99419 (arr!47986 (Array (_ BitVec 32) (_ BitVec 64))) (size!48538 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99418)

(assert (=> b!1483423 (= res!1008488 (or (and (= (select (arr!47986 a!2862) index!646) (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47986 a!2862) index!646) (select (arr!47986 a!2862) j!93))) (= (select (arr!47986 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!831744 () Bool)

(assert (=> b!1483423 e!831744))

(declare-fun res!1008493 () Bool)

(assert (=> b!1483423 (=> (not res!1008493) (not e!831744))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99418 (_ BitVec 32)) Bool)

(assert (=> b!1483423 (= res!1008493 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49683 0))(
  ( (Unit!49684) )
))
(declare-fun lt!647242 () Unit!49683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49683)

(assert (=> b!1483423 (= lt!647242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483424 () Bool)

(declare-fun res!1008489 () Bool)

(assert (=> b!1483424 (=> (not res!1008489) (not e!831741))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483424 (= res!1008489 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483425 () Bool)

(declare-fun res!1008491 () Bool)

(declare-fun e!831743 () Bool)

(assert (=> b!1483425 (=> (not res!1008491) (not e!831743))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483425 (= res!1008491 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48538 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48538 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48538 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483426 () Bool)

(declare-fun e!831745 () Bool)

(assert (=> b!1483426 (= e!831743 e!831745)))

(declare-fun res!1008494 () Bool)

(assert (=> b!1483426 (=> (not res!1008494) (not e!831745))))

(assert (=> b!1483426 (= res!1008494 (= (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647240 () array!99418)

(assert (=> b!1483426 (= lt!647240 (array!99419 (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48538 a!2862)))))

(declare-fun b!1483427 () Bool)

(declare-fun lt!647245 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12251 0))(
  ( (MissingZero!12251 (index!51396 (_ BitVec 32))) (Found!12251 (index!51397 (_ BitVec 32))) (Intermediate!12251 (undefined!13063 Bool) (index!51398 (_ BitVec 32)) (x!132976 (_ BitVec 32))) (Undefined!12251) (MissingVacant!12251 (index!51399 (_ BitVec 32))) )
))
(declare-fun lt!647243 () SeekEntryResult!12251)

(declare-fun e!831749 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99418 (_ BitVec 32)) SeekEntryResult!12251)

(assert (=> b!1483427 (= e!831749 (= lt!647243 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647245 lt!647240 mask!2687)))))

(declare-fun res!1008495 () Bool)

(assert (=> start!126458 (=> (not res!1008495) (not e!831743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126458 (= res!1008495 (validMask!0 mask!2687))))

(assert (=> start!126458 e!831743))

(assert (=> start!126458 true))

(declare-fun array_inv!37219 (array!99418) Bool)

(assert (=> start!126458 (array_inv!37219 a!2862)))

(declare-fun b!1483428 () Bool)

(declare-fun res!1008505 () Bool)

(assert (=> b!1483428 (=> (not res!1008505) (not e!831741))))

(assert (=> b!1483428 (= res!1008505 e!831749)))

(declare-fun c!136993 () Bool)

(assert (=> b!1483428 (= c!136993 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483429 () Bool)

(declare-fun res!1008499 () Bool)

(assert (=> b!1483429 (=> (not res!1008499) (not e!831743))))

(declare-datatypes ((List!34565 0))(
  ( (Nil!34562) (Cons!34561 (h!35935 (_ BitVec 64)) (t!49251 List!34565)) )
))
(declare-fun arrayNoDuplicates!0 (array!99418 (_ BitVec 32) List!34565) Bool)

(assert (=> b!1483429 (= res!1008499 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34562))))

(declare-fun b!1483430 () Bool)

(declare-fun res!1008503 () Bool)

(assert (=> b!1483430 (=> (not res!1008503) (not e!831743))))

(assert (=> b!1483430 (= res!1008503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!831742 () Bool)

(declare-fun b!1483431 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99418 (_ BitVec 32)) SeekEntryResult!12251)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99418 (_ BitVec 32)) SeekEntryResult!12251)

(assert (=> b!1483431 (= e!831742 (= (seekEntryOrOpen!0 lt!647245 lt!647240 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647245 lt!647240 mask!2687)))))

(declare-fun b!1483432 () Bool)

(declare-fun e!831748 () Bool)

(assert (=> b!1483432 (= e!831748 e!831741)))

(declare-fun res!1008492 () Bool)

(assert (=> b!1483432 (=> (not res!1008492) (not e!831741))))

(assert (=> b!1483432 (= res!1008492 (= lt!647243 (Intermediate!12251 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483432 (= lt!647243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647245 mask!2687) lt!647245 lt!647240 mask!2687))))

(assert (=> b!1483432 (= lt!647245 (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483433 () Bool)

(assert (=> b!1483433 (= e!831745 e!831748)))

(declare-fun res!1008502 () Bool)

(assert (=> b!1483433 (=> (not res!1008502) (not e!831748))))

(declare-fun lt!647241 () SeekEntryResult!12251)

(assert (=> b!1483433 (= res!1008502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47986 a!2862) j!93) mask!2687) (select (arr!47986 a!2862) j!93) a!2862 mask!2687) lt!647241))))

(assert (=> b!1483433 (= lt!647241 (Intermediate!12251 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483434 () Bool)

(declare-fun res!1008501 () Bool)

(assert (=> b!1483434 (=> (not res!1008501) (not e!831743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483434 (= res!1008501 (validKeyInArray!0 (select (arr!47986 a!2862) i!1006)))))

(declare-fun b!1483435 () Bool)

(declare-fun e!831746 () Bool)

(assert (=> b!1483435 (= e!831744 e!831746)))

(declare-fun res!1008498 () Bool)

(assert (=> b!1483435 (=> res!1008498 e!831746)))

(declare-fun lt!647244 () (_ BitVec 64))

(assert (=> b!1483435 (= res!1008498 (or (and (= (select (arr!47986 a!2862) index!646) lt!647244) (= (select (arr!47986 a!2862) index!646) (select (arr!47986 a!2862) j!93))) (= (select (arr!47986 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483435 (= lt!647244 (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483436 () Bool)

(assert (=> b!1483436 (= e!831740 true)))

(declare-fun lt!647246 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483436 (= lt!647246 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483437 () Bool)

(assert (=> b!1483437 (= e!831746 e!831742)))

(declare-fun res!1008504 () Bool)

(assert (=> b!1483437 (=> (not res!1008504) (not e!831742))))

(assert (=> b!1483437 (= res!1008504 (and (= index!646 intermediateAfterIndex!19) (= lt!647244 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483438 () Bool)

(assert (=> b!1483438 (= e!831749 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647245 lt!647240 mask!2687) (seekEntryOrOpen!0 lt!647245 lt!647240 mask!2687)))))

(declare-fun b!1483439 () Bool)

(declare-fun res!1008500 () Bool)

(assert (=> b!1483439 (=> (not res!1008500) (not e!831743))))

(assert (=> b!1483439 (= res!1008500 (and (= (size!48538 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48538 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48538 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483440 () Bool)

(declare-fun res!1008490 () Bool)

(assert (=> b!1483440 (=> (not res!1008490) (not e!831744))))

(assert (=> b!1483440 (= res!1008490 (= (seekEntryOrOpen!0 (select (arr!47986 a!2862) j!93) a!2862 mask!2687) (Found!12251 j!93)))))

(declare-fun b!1483441 () Bool)

(declare-fun res!1008496 () Bool)

(assert (=> b!1483441 (=> (not res!1008496) (not e!831743))))

(assert (=> b!1483441 (= res!1008496 (validKeyInArray!0 (select (arr!47986 a!2862) j!93)))))

(declare-fun b!1483442 () Bool)

(declare-fun res!1008487 () Bool)

(assert (=> b!1483442 (=> (not res!1008487) (not e!831744))))

(assert (=> b!1483442 (= res!1008487 (or (= (select (arr!47986 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47986 a!2862) intermediateBeforeIndex!19) (select (arr!47986 a!2862) j!93))))))

(declare-fun b!1483443 () Bool)

(declare-fun res!1008497 () Bool)

(assert (=> b!1483443 (=> (not res!1008497) (not e!831748))))

(assert (=> b!1483443 (= res!1008497 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47986 a!2862) j!93) a!2862 mask!2687) lt!647241))))

(assert (= (and start!126458 res!1008495) b!1483439))

(assert (= (and b!1483439 res!1008500) b!1483434))

(assert (= (and b!1483434 res!1008501) b!1483441))

(assert (= (and b!1483441 res!1008496) b!1483430))

(assert (= (and b!1483430 res!1008503) b!1483429))

(assert (= (and b!1483429 res!1008499) b!1483425))

(assert (= (and b!1483425 res!1008491) b!1483426))

(assert (= (and b!1483426 res!1008494) b!1483433))

(assert (= (and b!1483433 res!1008502) b!1483443))

(assert (= (and b!1483443 res!1008497) b!1483432))

(assert (= (and b!1483432 res!1008492) b!1483428))

(assert (= (and b!1483428 c!136993) b!1483427))

(assert (= (and b!1483428 (not c!136993)) b!1483438))

(assert (= (and b!1483428 res!1008505) b!1483424))

(assert (= (and b!1483424 res!1008489) b!1483423))

(assert (= (and b!1483423 res!1008493) b!1483440))

(assert (= (and b!1483440 res!1008490) b!1483442))

(assert (= (and b!1483442 res!1008487) b!1483435))

(assert (= (and b!1483435 (not res!1008498)) b!1483437))

(assert (= (and b!1483437 res!1008504) b!1483431))

(assert (= (and b!1483423 (not res!1008488)) b!1483436))

(declare-fun m!1368309 () Bool)

(assert (=> b!1483441 m!1368309))

(assert (=> b!1483441 m!1368309))

(declare-fun m!1368311 () Bool)

(assert (=> b!1483441 m!1368311))

(declare-fun m!1368313 () Bool)

(assert (=> b!1483426 m!1368313))

(declare-fun m!1368315 () Bool)

(assert (=> b!1483426 m!1368315))

(declare-fun m!1368317 () Bool)

(assert (=> b!1483431 m!1368317))

(declare-fun m!1368319 () Bool)

(assert (=> b!1483431 m!1368319))

(declare-fun m!1368321 () Bool)

(assert (=> start!126458 m!1368321))

(declare-fun m!1368323 () Bool)

(assert (=> start!126458 m!1368323))

(declare-fun m!1368325 () Bool)

(assert (=> b!1483442 m!1368325))

(assert (=> b!1483442 m!1368309))

(assert (=> b!1483438 m!1368319))

(assert (=> b!1483438 m!1368317))

(declare-fun m!1368327 () Bool)

(assert (=> b!1483430 m!1368327))

(assert (=> b!1483433 m!1368309))

(assert (=> b!1483433 m!1368309))

(declare-fun m!1368329 () Bool)

(assert (=> b!1483433 m!1368329))

(assert (=> b!1483433 m!1368329))

(assert (=> b!1483433 m!1368309))

(declare-fun m!1368331 () Bool)

(assert (=> b!1483433 m!1368331))

(declare-fun m!1368333 () Bool)

(assert (=> b!1483436 m!1368333))

(assert (=> b!1483443 m!1368309))

(assert (=> b!1483443 m!1368309))

(declare-fun m!1368335 () Bool)

(assert (=> b!1483443 m!1368335))

(declare-fun m!1368337 () Bool)

(assert (=> b!1483423 m!1368337))

(assert (=> b!1483423 m!1368313))

(declare-fun m!1368339 () Bool)

(assert (=> b!1483423 m!1368339))

(declare-fun m!1368341 () Bool)

(assert (=> b!1483423 m!1368341))

(declare-fun m!1368343 () Bool)

(assert (=> b!1483423 m!1368343))

(assert (=> b!1483423 m!1368309))

(declare-fun m!1368345 () Bool)

(assert (=> b!1483427 m!1368345))

(assert (=> b!1483435 m!1368341))

(assert (=> b!1483435 m!1368309))

(assert (=> b!1483435 m!1368313))

(assert (=> b!1483435 m!1368339))

(declare-fun m!1368347 () Bool)

(assert (=> b!1483432 m!1368347))

(assert (=> b!1483432 m!1368347))

(declare-fun m!1368349 () Bool)

(assert (=> b!1483432 m!1368349))

(assert (=> b!1483432 m!1368313))

(declare-fun m!1368351 () Bool)

(assert (=> b!1483432 m!1368351))

(assert (=> b!1483440 m!1368309))

(assert (=> b!1483440 m!1368309))

(declare-fun m!1368353 () Bool)

(assert (=> b!1483440 m!1368353))

(declare-fun m!1368355 () Bool)

(assert (=> b!1483429 m!1368355))

(declare-fun m!1368357 () Bool)

(assert (=> b!1483434 m!1368357))

(assert (=> b!1483434 m!1368357))

(declare-fun m!1368359 () Bool)

(assert (=> b!1483434 m!1368359))

(check-sat (not b!1483423) (not b!1483438) (not b!1483440) (not b!1483433) (not b!1483434) (not b!1483441) (not b!1483431) (not b!1483436) (not b!1483430) (not b!1483443) (not b!1483429) (not start!126458) (not b!1483432) (not b!1483427))
(check-sat)
