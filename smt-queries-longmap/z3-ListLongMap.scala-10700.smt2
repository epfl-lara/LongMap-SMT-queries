; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125616 () Bool)

(assert start!125616)

(declare-fun b!1466335 () Bool)

(declare-fun res!994284 () Bool)

(declare-fun e!824129 () Bool)

(assert (=> b!1466335 (=> (not res!994284) (not e!824129))))

(declare-datatypes ((array!98902 0))(
  ( (array!98903 (arr!47734 (Array (_ BitVec 32) (_ BitVec 64))) (size!48285 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98902)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98902 (_ BitVec 32)) Bool)

(assert (=> b!1466335 (= res!994284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466336 () Bool)

(declare-fun res!994282 () Bool)

(assert (=> b!1466336 (=> (not res!994282) (not e!824129))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466336 (= res!994282 (validKeyInArray!0 (select (arr!47734 a!2862) j!93)))))

(declare-fun b!1466337 () Bool)

(declare-fun e!824131 () Bool)

(assert (=> b!1466337 (= e!824131 true)))

(declare-fun lt!641784 () Bool)

(declare-fun e!824130 () Bool)

(assert (=> b!1466337 (= lt!641784 e!824130)))

(declare-fun c!135552 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466337 (= c!135552 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466338 () Bool)

(declare-fun e!824132 () Bool)

(declare-fun e!824124 () Bool)

(assert (=> b!1466338 (= e!824132 e!824124)))

(declare-fun res!994283 () Bool)

(assert (=> b!1466338 (=> (not res!994283) (not e!824124))))

(declare-datatypes ((SeekEntryResult!11883 0))(
  ( (MissingZero!11883 (index!49924 (_ BitVec 32))) (Found!11883 (index!49925 (_ BitVec 32))) (Intermediate!11883 (undefined!12695 Bool) (index!49926 (_ BitVec 32)) (x!131693 (_ BitVec 32))) (Undefined!11883) (MissingVacant!11883 (index!49927 (_ BitVec 32))) )
))
(declare-fun lt!641787 () SeekEntryResult!11883)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466338 (= res!994283 (= lt!641787 (Intermediate!11883 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641786 () array!98902)

(declare-fun lt!641783 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98902 (_ BitVec 32)) SeekEntryResult!11883)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466338 (= lt!641787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641783 mask!2687) lt!641783 lt!641786 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466338 (= lt!641783 (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466339 () Bool)

(declare-fun e!824126 () Bool)

(assert (=> b!1466339 (= e!824124 (not e!824126))))

(declare-fun res!994280 () Bool)

(assert (=> b!1466339 (=> res!994280 e!824126)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466339 (= res!994280 (or (and (= (select (arr!47734 a!2862) index!646) (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47734 a!2862) index!646) (select (arr!47734 a!2862) j!93))) (= (select (arr!47734 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!824128 () Bool)

(assert (=> b!1466339 e!824128))

(declare-fun res!994279 () Bool)

(assert (=> b!1466339 (=> (not res!994279) (not e!824128))))

(assert (=> b!1466339 (= res!994279 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49295 0))(
  ( (Unit!49296) )
))
(declare-fun lt!641785 () Unit!49295)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49295)

(assert (=> b!1466339 (= lt!641785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!641788 () (_ BitVec 32))

(declare-fun b!1466340 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98902 (_ BitVec 32)) SeekEntryResult!11883)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98902 (_ BitVec 32)) SeekEntryResult!11883)

(assert (=> b!1466340 (= e!824130 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641788 intermediateAfterIndex!19 lt!641783 lt!641786 mask!2687) (seekEntryOrOpen!0 lt!641783 lt!641786 mask!2687))))))

(declare-fun b!1466341 () Bool)

(declare-fun res!994276 () Bool)

(assert (=> b!1466341 (=> (not res!994276) (not e!824124))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466341 (= res!994276 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466342 () Bool)

(declare-fun res!994278 () Bool)

(assert (=> b!1466342 (=> (not res!994278) (not e!824124))))

(declare-fun e!824125 () Bool)

(assert (=> b!1466342 (= res!994278 e!824125)))

(declare-fun c!135553 () Bool)

(assert (=> b!1466342 (= c!135553 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466343 () Bool)

(declare-fun e!824127 () Bool)

(assert (=> b!1466343 (= e!824127 e!824132)))

(declare-fun res!994275 () Bool)

(assert (=> b!1466343 (=> (not res!994275) (not e!824132))))

(declare-fun lt!641782 () SeekEntryResult!11883)

(assert (=> b!1466343 (= res!994275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47734 a!2862) j!93) mask!2687) (select (arr!47734 a!2862) j!93) a!2862 mask!2687) lt!641782))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1466343 (= lt!641782 (Intermediate!11883 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466344 () Bool)

(declare-fun res!994289 () Bool)

(assert (=> b!1466344 (=> (not res!994289) (not e!824129))))

(assert (=> b!1466344 (= res!994289 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48285 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48285 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48285 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466346 () Bool)

(assert (=> b!1466346 (= e!824130 (not (= lt!641787 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641788 lt!641783 lt!641786 mask!2687))))))

(declare-fun b!1466347 () Bool)

(assert (=> b!1466347 (= e!824126 e!824131)))

(declare-fun res!994281 () Bool)

(assert (=> b!1466347 (=> res!994281 e!824131)))

(assert (=> b!1466347 (= res!994281 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641788 #b00000000000000000000000000000000) (bvsge lt!641788 (size!48285 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466347 (= lt!641788 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1466348 () Bool)

(assert (=> b!1466348 (= e!824128 (or (= (select (arr!47734 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47734 a!2862) intermediateBeforeIndex!19) (select (arr!47734 a!2862) j!93))))))

(declare-fun b!1466349 () Bool)

(assert (=> b!1466349 (= e!824129 e!824127)))

(declare-fun res!994273 () Bool)

(assert (=> b!1466349 (=> (not res!994273) (not e!824127))))

(assert (=> b!1466349 (= res!994273 (= (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466349 (= lt!641786 (array!98903 (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48285 a!2862)))))

(declare-fun b!1466350 () Bool)

(declare-fun res!994288 () Bool)

(assert (=> b!1466350 (=> (not res!994288) (not e!824129))))

(declare-datatypes ((List!34222 0))(
  ( (Nil!34219) (Cons!34218 (h!35582 (_ BitVec 64)) (t!48908 List!34222)) )
))
(declare-fun arrayNoDuplicates!0 (array!98902 (_ BitVec 32) List!34222) Bool)

(assert (=> b!1466350 (= res!994288 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34219))))

(declare-fun b!1466351 () Bool)

(declare-fun res!994277 () Bool)

(assert (=> b!1466351 (=> (not res!994277) (not e!824128))))

(assert (=> b!1466351 (= res!994277 (= (seekEntryOrOpen!0 (select (arr!47734 a!2862) j!93) a!2862 mask!2687) (Found!11883 j!93)))))

(declare-fun b!1466352 () Bool)

(declare-fun res!994286 () Bool)

(assert (=> b!1466352 (=> (not res!994286) (not e!824129))))

(assert (=> b!1466352 (= res!994286 (validKeyInArray!0 (select (arr!47734 a!2862) i!1006)))))

(declare-fun b!1466353 () Bool)

(declare-fun res!994274 () Bool)

(assert (=> b!1466353 (=> (not res!994274) (not e!824129))))

(assert (=> b!1466353 (= res!994274 (and (= (size!48285 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48285 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48285 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466354 () Bool)

(declare-fun res!994272 () Bool)

(assert (=> b!1466354 (=> (not res!994272) (not e!824132))))

(assert (=> b!1466354 (= res!994272 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47734 a!2862) j!93) a!2862 mask!2687) lt!641782))))

(declare-fun b!1466355 () Bool)

(declare-fun res!994285 () Bool)

(assert (=> b!1466355 (=> res!994285 e!824131)))

(assert (=> b!1466355 (= res!994285 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641788 (select (arr!47734 a!2862) j!93) a!2862 mask!2687) lt!641782)))))

(declare-fun b!1466356 () Bool)

(assert (=> b!1466356 (= e!824125 (= lt!641787 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641783 lt!641786 mask!2687)))))

(declare-fun b!1466345 () Bool)

(assert (=> b!1466345 (= e!824125 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641783 lt!641786 mask!2687) (seekEntryOrOpen!0 lt!641783 lt!641786 mask!2687)))))

(declare-fun res!994287 () Bool)

(assert (=> start!125616 (=> (not res!994287) (not e!824129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125616 (= res!994287 (validMask!0 mask!2687))))

(assert (=> start!125616 e!824129))

(assert (=> start!125616 true))

(declare-fun array_inv!37015 (array!98902) Bool)

(assert (=> start!125616 (array_inv!37015 a!2862)))

(assert (= (and start!125616 res!994287) b!1466353))

(assert (= (and b!1466353 res!994274) b!1466352))

(assert (= (and b!1466352 res!994286) b!1466336))

(assert (= (and b!1466336 res!994282) b!1466335))

(assert (= (and b!1466335 res!994284) b!1466350))

(assert (= (and b!1466350 res!994288) b!1466344))

(assert (= (and b!1466344 res!994289) b!1466349))

(assert (= (and b!1466349 res!994273) b!1466343))

(assert (= (and b!1466343 res!994275) b!1466354))

(assert (= (and b!1466354 res!994272) b!1466338))

(assert (= (and b!1466338 res!994283) b!1466342))

(assert (= (and b!1466342 c!135553) b!1466356))

(assert (= (and b!1466342 (not c!135553)) b!1466345))

(assert (= (and b!1466342 res!994278) b!1466341))

(assert (= (and b!1466341 res!994276) b!1466339))

(assert (= (and b!1466339 res!994279) b!1466351))

(assert (= (and b!1466351 res!994277) b!1466348))

(assert (= (and b!1466339 (not res!994280)) b!1466347))

(assert (= (and b!1466347 (not res!994281)) b!1466355))

(assert (= (and b!1466355 (not res!994285)) b!1466337))

(assert (= (and b!1466337 c!135552) b!1466346))

(assert (= (and b!1466337 (not c!135552)) b!1466340))

(declare-fun m!1353505 () Bool)

(assert (=> start!125616 m!1353505))

(declare-fun m!1353507 () Bool)

(assert (=> start!125616 m!1353507))

(declare-fun m!1353509 () Bool)

(assert (=> b!1466350 m!1353509))

(declare-fun m!1353511 () Bool)

(assert (=> b!1466339 m!1353511))

(declare-fun m!1353513 () Bool)

(assert (=> b!1466339 m!1353513))

(declare-fun m!1353515 () Bool)

(assert (=> b!1466339 m!1353515))

(declare-fun m!1353517 () Bool)

(assert (=> b!1466339 m!1353517))

(declare-fun m!1353519 () Bool)

(assert (=> b!1466339 m!1353519))

(declare-fun m!1353521 () Bool)

(assert (=> b!1466339 m!1353521))

(declare-fun m!1353523 () Bool)

(assert (=> b!1466347 m!1353523))

(declare-fun m!1353525 () Bool)

(assert (=> b!1466338 m!1353525))

(assert (=> b!1466338 m!1353525))

(declare-fun m!1353527 () Bool)

(assert (=> b!1466338 m!1353527))

(assert (=> b!1466338 m!1353513))

(declare-fun m!1353529 () Bool)

(assert (=> b!1466338 m!1353529))

(declare-fun m!1353531 () Bool)

(assert (=> b!1466352 m!1353531))

(assert (=> b!1466352 m!1353531))

(declare-fun m!1353533 () Bool)

(assert (=> b!1466352 m!1353533))

(assert (=> b!1466349 m!1353513))

(declare-fun m!1353535 () Bool)

(assert (=> b!1466349 m!1353535))

(declare-fun m!1353537 () Bool)

(assert (=> b!1466340 m!1353537))

(declare-fun m!1353539 () Bool)

(assert (=> b!1466340 m!1353539))

(assert (=> b!1466354 m!1353521))

(assert (=> b!1466354 m!1353521))

(declare-fun m!1353541 () Bool)

(assert (=> b!1466354 m!1353541))

(assert (=> b!1466351 m!1353521))

(assert (=> b!1466351 m!1353521))

(declare-fun m!1353543 () Bool)

(assert (=> b!1466351 m!1353543))

(declare-fun m!1353545 () Bool)

(assert (=> b!1466346 m!1353545))

(assert (=> b!1466336 m!1353521))

(assert (=> b!1466336 m!1353521))

(declare-fun m!1353547 () Bool)

(assert (=> b!1466336 m!1353547))

(declare-fun m!1353549 () Bool)

(assert (=> b!1466356 m!1353549))

(assert (=> b!1466355 m!1353521))

(assert (=> b!1466355 m!1353521))

(declare-fun m!1353551 () Bool)

(assert (=> b!1466355 m!1353551))

(declare-fun m!1353553 () Bool)

(assert (=> b!1466335 m!1353553))

(declare-fun m!1353555 () Bool)

(assert (=> b!1466345 m!1353555))

(assert (=> b!1466345 m!1353539))

(declare-fun m!1353557 () Bool)

(assert (=> b!1466348 m!1353557))

(assert (=> b!1466348 m!1353521))

(assert (=> b!1466343 m!1353521))

(assert (=> b!1466343 m!1353521))

(declare-fun m!1353559 () Bool)

(assert (=> b!1466343 m!1353559))

(assert (=> b!1466343 m!1353559))

(assert (=> b!1466343 m!1353521))

(declare-fun m!1353561 () Bool)

(assert (=> b!1466343 m!1353561))

(check-sat (not b!1466351) (not b!1466338) (not b!1466346) (not b!1466355) (not b!1466343) (not b!1466354) (not b!1466339) (not b!1466335) (not b!1466340) (not b!1466350) (not b!1466356) (not start!125616) (not b!1466347) (not b!1466352) (not b!1466345) (not b!1466336))
(check-sat)
