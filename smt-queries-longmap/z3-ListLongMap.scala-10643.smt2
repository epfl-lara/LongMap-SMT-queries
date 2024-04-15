; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124966 () Bool)

(assert start!124966)

(declare-fun b!1453331 () Bool)

(declare-fun e!818000 () Bool)

(declare-fun e!817993 () Bool)

(assert (=> b!1453331 (= e!818000 e!817993)))

(declare-fun res!984457 () Bool)

(assert (=> b!1453331 (=> (not res!984457) (not e!817993))))

(declare-datatypes ((SeekEntryResult!11762 0))(
  ( (MissingZero!11762 (index!49440 (_ BitVec 32))) (Found!11762 (index!49441 (_ BitVec 32))) (Intermediate!11762 (undefined!12574 Bool) (index!49442 (_ BitVec 32)) (x!131078 (_ BitVec 32))) (Undefined!11762) (MissingVacant!11762 (index!49443 (_ BitVec 32))) )
))
(declare-fun lt!637034 () SeekEntryResult!11762)

(declare-datatypes ((array!98392 0))(
  ( (array!98393 (arr!47485 (Array (_ BitVec 32) (_ BitVec 64))) (size!48037 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98392)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98392 (_ BitVec 32)) SeekEntryResult!11762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453331 (= res!984457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47485 a!2862) j!93) mask!2687) (select (arr!47485 a!2862) j!93) a!2862 mask!2687) lt!637034))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453331 (= lt!637034 (Intermediate!11762 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453332 () Bool)

(declare-fun res!984454 () Bool)

(declare-fun e!818001 () Bool)

(assert (=> b!1453332 (=> (not res!984454) (not e!818001))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98392 (_ BitVec 32)) SeekEntryResult!11762)

(assert (=> b!1453332 (= res!984454 (= (seekEntryOrOpen!0 (select (arr!47485 a!2862) j!93) a!2862 mask!2687) (Found!11762 j!93)))))

(declare-fun b!1453333 () Bool)

(declare-fun res!984450 () Bool)

(declare-fun e!817996 () Bool)

(assert (=> b!1453333 (=> (not res!984450) (not e!817996))))

(declare-fun e!817995 () Bool)

(assert (=> b!1453333 (= res!984450 e!817995)))

(declare-fun c!133954 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453333 (= c!133954 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453334 () Bool)

(declare-fun lt!637032 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!637033 () array!98392)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98392 (_ BitVec 32)) SeekEntryResult!11762)

(assert (=> b!1453334 (= e!817995 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637032 lt!637033 mask!2687) (seekEntryOrOpen!0 lt!637032 lt!637033 mask!2687)))))

(declare-fun b!1453335 () Bool)

(assert (=> b!1453335 (= e!817996 (not true))))

(assert (=> b!1453335 e!818001))

(declare-fun res!984461 () Bool)

(assert (=> b!1453335 (=> (not res!984461) (not e!818001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98392 (_ BitVec 32)) Bool)

(assert (=> b!1453335 (= res!984461 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48861 0))(
  ( (Unit!48862) )
))
(declare-fun lt!637035 () Unit!48861)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48861)

(assert (=> b!1453335 (= lt!637035 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453336 () Bool)

(declare-fun res!984466 () Bool)

(declare-fun e!817998 () Bool)

(assert (=> b!1453336 (=> (not res!984466) (not e!817998))))

(assert (=> b!1453336 (= res!984466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453338 () Bool)

(declare-fun res!984449 () Bool)

(assert (=> b!1453338 (=> (not res!984449) (not e!817998))))

(assert (=> b!1453338 (= res!984449 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48037 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48037 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48037 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453339 () Bool)

(assert (=> b!1453339 (= e!817993 e!817996)))

(declare-fun res!984464 () Bool)

(assert (=> b!1453339 (=> (not res!984464) (not e!817996))))

(declare-fun lt!637031 () SeekEntryResult!11762)

(assert (=> b!1453339 (= res!984464 (= lt!637031 (Intermediate!11762 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453339 (= lt!637031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637032 mask!2687) lt!637032 lt!637033 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453339 (= lt!637032 (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453340 () Bool)

(declare-fun res!984458 () Bool)

(assert (=> b!1453340 (=> (not res!984458) (not e!817998))))

(assert (=> b!1453340 (= res!984458 (and (= (size!48037 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48037 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48037 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453341 () Bool)

(declare-fun res!984456 () Bool)

(assert (=> b!1453341 (=> (not res!984456) (not e!817998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453341 (= res!984456 (validKeyInArray!0 (select (arr!47485 a!2862) i!1006)))))

(declare-fun b!1453342 () Bool)

(assert (=> b!1453342 (= e!817995 (= lt!637031 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637032 lt!637033 mask!2687)))))

(declare-fun b!1453343 () Bool)

(declare-fun res!984453 () Bool)

(assert (=> b!1453343 (=> (not res!984453) (not e!817998))))

(declare-datatypes ((List!34064 0))(
  ( (Nil!34061) (Cons!34060 (h!35410 (_ BitVec 64)) (t!48750 List!34064)) )
))
(declare-fun arrayNoDuplicates!0 (array!98392 (_ BitVec 32) List!34064) Bool)

(assert (=> b!1453343 (= res!984453 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34061))))

(declare-fun b!1453344 () Bool)

(declare-fun res!984451 () Bool)

(assert (=> b!1453344 (=> (not res!984451) (not e!817993))))

(assert (=> b!1453344 (= res!984451 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47485 a!2862) j!93) a!2862 mask!2687) lt!637034))))

(declare-fun b!1453345 () Bool)

(declare-fun res!984462 () Bool)

(assert (=> b!1453345 (=> (not res!984462) (not e!817996))))

(assert (=> b!1453345 (= res!984462 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453346 () Bool)

(declare-fun res!984452 () Bool)

(assert (=> b!1453346 (=> (not res!984452) (not e!817998))))

(assert (=> b!1453346 (= res!984452 (validKeyInArray!0 (select (arr!47485 a!2862) j!93)))))

(declare-fun e!817994 () Bool)

(declare-fun b!1453337 () Bool)

(assert (=> b!1453337 (= e!817994 (= (seekEntryOrOpen!0 lt!637032 lt!637033 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637032 lt!637033 mask!2687)))))

(declare-fun res!984459 () Bool)

(assert (=> start!124966 (=> (not res!984459) (not e!817998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124966 (= res!984459 (validMask!0 mask!2687))))

(assert (=> start!124966 e!817998))

(assert (=> start!124966 true))

(declare-fun array_inv!36718 (array!98392) Bool)

(assert (=> start!124966 (array_inv!36718 a!2862)))

(declare-fun b!1453347 () Bool)

(declare-fun res!984465 () Bool)

(assert (=> b!1453347 (=> (not res!984465) (not e!818001))))

(assert (=> b!1453347 (= res!984465 (or (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) (select (arr!47485 a!2862) j!93))))))

(declare-fun b!1453348 () Bool)

(declare-fun e!817997 () Bool)

(assert (=> b!1453348 (= e!818001 e!817997)))

(declare-fun res!984463 () Bool)

(assert (=> b!1453348 (=> res!984463 e!817997)))

(declare-fun lt!637030 () (_ BitVec 64))

(assert (=> b!1453348 (= res!984463 (or (and (= (select (arr!47485 a!2862) index!646) lt!637030) (= (select (arr!47485 a!2862) index!646) (select (arr!47485 a!2862) j!93))) (= (select (arr!47485 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453348 (= lt!637030 (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453349 () Bool)

(assert (=> b!1453349 (= e!817997 e!817994)))

(declare-fun res!984455 () Bool)

(assert (=> b!1453349 (=> (not res!984455) (not e!817994))))

(assert (=> b!1453349 (= res!984455 (and (= index!646 intermediateAfterIndex!19) (= lt!637030 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453350 () Bool)

(assert (=> b!1453350 (= e!817998 e!818000)))

(declare-fun res!984460 () Bool)

(assert (=> b!1453350 (=> (not res!984460) (not e!818000))))

(assert (=> b!1453350 (= res!984460 (= (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453350 (= lt!637033 (array!98393 (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48037 a!2862)))))

(assert (= (and start!124966 res!984459) b!1453340))

(assert (= (and b!1453340 res!984458) b!1453341))

(assert (= (and b!1453341 res!984456) b!1453346))

(assert (= (and b!1453346 res!984452) b!1453336))

(assert (= (and b!1453336 res!984466) b!1453343))

(assert (= (and b!1453343 res!984453) b!1453338))

(assert (= (and b!1453338 res!984449) b!1453350))

(assert (= (and b!1453350 res!984460) b!1453331))

(assert (= (and b!1453331 res!984457) b!1453344))

(assert (= (and b!1453344 res!984451) b!1453339))

(assert (= (and b!1453339 res!984464) b!1453333))

(assert (= (and b!1453333 c!133954) b!1453342))

(assert (= (and b!1453333 (not c!133954)) b!1453334))

(assert (= (and b!1453333 res!984450) b!1453345))

(assert (= (and b!1453345 res!984462) b!1453335))

(assert (= (and b!1453335 res!984461) b!1453332))

(assert (= (and b!1453332 res!984454) b!1453347))

(assert (= (and b!1453347 res!984465) b!1453348))

(assert (= (and b!1453348 (not res!984463)) b!1453349))

(assert (= (and b!1453349 res!984455) b!1453337))

(declare-fun m!1341315 () Bool)

(assert (=> b!1453350 m!1341315))

(declare-fun m!1341317 () Bool)

(assert (=> b!1453350 m!1341317))

(declare-fun m!1341319 () Bool)

(assert (=> b!1453342 m!1341319))

(declare-fun m!1341321 () Bool)

(assert (=> b!1453344 m!1341321))

(assert (=> b!1453344 m!1341321))

(declare-fun m!1341323 () Bool)

(assert (=> b!1453344 m!1341323))

(declare-fun m!1341325 () Bool)

(assert (=> b!1453348 m!1341325))

(assert (=> b!1453348 m!1341321))

(assert (=> b!1453348 m!1341315))

(declare-fun m!1341327 () Bool)

(assert (=> b!1453348 m!1341327))

(declare-fun m!1341329 () Bool)

(assert (=> b!1453335 m!1341329))

(declare-fun m!1341331 () Bool)

(assert (=> b!1453335 m!1341331))

(declare-fun m!1341333 () Bool)

(assert (=> b!1453343 m!1341333))

(assert (=> b!1453346 m!1341321))

(assert (=> b!1453346 m!1341321))

(declare-fun m!1341335 () Bool)

(assert (=> b!1453346 m!1341335))

(declare-fun m!1341337 () Bool)

(assert (=> start!124966 m!1341337))

(declare-fun m!1341339 () Bool)

(assert (=> start!124966 m!1341339))

(assert (=> b!1453332 m!1341321))

(assert (=> b!1453332 m!1341321))

(declare-fun m!1341341 () Bool)

(assert (=> b!1453332 m!1341341))

(declare-fun m!1341343 () Bool)

(assert (=> b!1453339 m!1341343))

(assert (=> b!1453339 m!1341343))

(declare-fun m!1341345 () Bool)

(assert (=> b!1453339 m!1341345))

(assert (=> b!1453339 m!1341315))

(declare-fun m!1341347 () Bool)

(assert (=> b!1453339 m!1341347))

(assert (=> b!1453331 m!1341321))

(assert (=> b!1453331 m!1341321))

(declare-fun m!1341349 () Bool)

(assert (=> b!1453331 m!1341349))

(assert (=> b!1453331 m!1341349))

(assert (=> b!1453331 m!1341321))

(declare-fun m!1341351 () Bool)

(assert (=> b!1453331 m!1341351))

(declare-fun m!1341353 () Bool)

(assert (=> b!1453337 m!1341353))

(declare-fun m!1341355 () Bool)

(assert (=> b!1453337 m!1341355))

(declare-fun m!1341357 () Bool)

(assert (=> b!1453347 m!1341357))

(assert (=> b!1453347 m!1341321))

(assert (=> b!1453334 m!1341355))

(assert (=> b!1453334 m!1341353))

(declare-fun m!1341359 () Bool)

(assert (=> b!1453341 m!1341359))

(assert (=> b!1453341 m!1341359))

(declare-fun m!1341361 () Bool)

(assert (=> b!1453341 m!1341361))

(declare-fun m!1341363 () Bool)

(assert (=> b!1453336 m!1341363))

(check-sat (not b!1453332) (not b!1453342) (not b!1453335) (not start!124966) (not b!1453343) (not b!1453331) (not b!1453336) (not b!1453337) (not b!1453344) (not b!1453341) (not b!1453334) (not b!1453339) (not b!1453346))
(check-sat)
