; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126164 () Bool)

(assert start!126164)

(declare-fun b!1477408 () Bool)

(declare-fun res!1003537 () Bool)

(declare-fun e!828836 () Bool)

(assert (=> b!1477408 (=> (not res!1003537) (not e!828836))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99270 0))(
  ( (array!99271 (arr!47914 (Array (_ BitVec 32) (_ BitVec 64))) (size!48464 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99270)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477408 (= res!1003537 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48464 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48464 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48464 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477409 () Bool)

(declare-fun res!1003549 () Bool)

(assert (=> b!1477409 (=> (not res!1003549) (not e!828836))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99270 (_ BitVec 32)) Bool)

(assert (=> b!1477409 (= res!1003549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477410 () Bool)

(declare-fun res!1003544 () Bool)

(assert (=> b!1477410 (=> (not res!1003544) (not e!828836))))

(declare-datatypes ((List!34415 0))(
  ( (Nil!34412) (Cons!34411 (h!35779 (_ BitVec 64)) (t!49109 List!34415)) )
))
(declare-fun arrayNoDuplicates!0 (array!99270 (_ BitVec 32) List!34415) Bool)

(assert (=> b!1477410 (= res!1003544 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34412))))

(declare-fun b!1477411 () Bool)

(declare-fun e!828833 () Bool)

(assert (=> b!1477411 (= e!828833 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477412 () Bool)

(declare-fun e!828834 () Bool)

(assert (=> b!1477412 (= e!828834 (not true))))

(declare-fun e!828828 () Bool)

(assert (=> b!1477412 e!828828))

(declare-fun res!1003542 () Bool)

(assert (=> b!1477412 (=> (not res!1003542) (not e!828828))))

(declare-datatypes ((SeekEntryResult!12154 0))(
  ( (MissingZero!12154 (index!51008 (_ BitVec 32))) (Found!12154 (index!51009 (_ BitVec 32))) (Intermediate!12154 (undefined!12966 Bool) (index!51010 (_ BitVec 32)) (x!132601 (_ BitVec 32))) (Undefined!12154) (MissingVacant!12154 (index!51011 (_ BitVec 32))) )
))
(declare-fun lt!645339 () SeekEntryResult!12154)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477412 (= res!1003542 (and (= lt!645339 (Found!12154 j!93)) (or (= (select (arr!47914 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47914 a!2862) intermediateBeforeIndex!19) (select (arr!47914 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99270 (_ BitVec 32)) SeekEntryResult!12154)

(assert (=> b!1477412 (= lt!645339 (seekEntryOrOpen!0 (select (arr!47914 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477412 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49648 0))(
  ( (Unit!49649) )
))
(declare-fun lt!645342 () Unit!49648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49648)

(assert (=> b!1477412 (= lt!645342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1003540 () Bool)

(assert (=> start!126164 (=> (not res!1003540) (not e!828836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126164 (= res!1003540 (validMask!0 mask!2687))))

(assert (=> start!126164 e!828836))

(assert (=> start!126164 true))

(declare-fun array_inv!36942 (array!99270) Bool)

(assert (=> start!126164 (array_inv!36942 a!2862)))

(declare-fun b!1477413 () Bool)

(declare-fun res!1003551 () Bool)

(assert (=> b!1477413 (=> (not res!1003551) (not e!828836))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477413 (= res!1003551 (validKeyInArray!0 (select (arr!47914 a!2862) i!1006)))))

(declare-fun b!1477414 () Bool)

(declare-fun e!828832 () Bool)

(declare-fun e!828830 () Bool)

(assert (=> b!1477414 (= e!828832 e!828830)))

(declare-fun res!1003552 () Bool)

(assert (=> b!1477414 (=> (not res!1003552) (not e!828830))))

(declare-fun lt!645341 () SeekEntryResult!12154)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99270 (_ BitVec 32)) SeekEntryResult!12154)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477414 (= res!1003552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47914 a!2862) j!93) mask!2687) (select (arr!47914 a!2862) j!93) a!2862 mask!2687) lt!645341))))

(assert (=> b!1477414 (= lt!645341 (Intermediate!12154 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477415 () Bool)

(declare-fun res!1003546 () Bool)

(assert (=> b!1477415 (=> (not res!1003546) (not e!828834))))

(declare-fun e!828829 () Bool)

(assert (=> b!1477415 (= res!1003546 e!828829)))

(declare-fun c!136455 () Bool)

(assert (=> b!1477415 (= c!136455 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477416 () Bool)

(declare-fun res!1003545 () Bool)

(assert (=> b!1477416 (=> (not res!1003545) (not e!828836))))

(assert (=> b!1477416 (= res!1003545 (and (= (size!48464 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48464 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48464 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477417 () Bool)

(declare-fun e!828835 () Bool)

(assert (=> b!1477417 (= e!828835 e!828833)))

(declare-fun res!1003538 () Bool)

(assert (=> b!1477417 (=> (not res!1003538) (not e!828833))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99270 (_ BitVec 32)) SeekEntryResult!12154)

(assert (=> b!1477417 (= res!1003538 (= lt!645339 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47914 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477418 () Bool)

(assert (=> b!1477418 (= e!828836 e!828832)))

(declare-fun res!1003548 () Bool)

(assert (=> b!1477418 (=> (not res!1003548) (not e!828832))))

(assert (=> b!1477418 (= res!1003548 (= (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645337 () array!99270)

(assert (=> b!1477418 (= lt!645337 (array!99271 (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48464 a!2862)))))

(declare-fun b!1477419 () Bool)

(declare-fun res!1003550 () Bool)

(assert (=> b!1477419 (=> (not res!1003550) (not e!828834))))

(assert (=> b!1477419 (= res!1003550 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!645338 () (_ BitVec 64))

(declare-fun b!1477420 () Bool)

(assert (=> b!1477420 (= e!828829 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645338 lt!645337 mask!2687) (seekEntryOrOpen!0 lt!645338 lt!645337 mask!2687)))))

(declare-fun b!1477421 () Bool)

(assert (=> b!1477421 (= e!828830 e!828834)))

(declare-fun res!1003541 () Bool)

(assert (=> b!1477421 (=> (not res!1003541) (not e!828834))))

(declare-fun lt!645340 () SeekEntryResult!12154)

(assert (=> b!1477421 (= res!1003541 (= lt!645340 (Intermediate!12154 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477421 (= lt!645340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645338 mask!2687) lt!645338 lt!645337 mask!2687))))

(assert (=> b!1477421 (= lt!645338 (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477422 () Bool)

(assert (=> b!1477422 (= e!828829 (= lt!645340 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645338 lt!645337 mask!2687)))))

(declare-fun b!1477423 () Bool)

(assert (=> b!1477423 (= e!828828 e!828835)))

(declare-fun res!1003539 () Bool)

(assert (=> b!1477423 (=> res!1003539 e!828835)))

(assert (=> b!1477423 (= res!1003539 (or (and (= (select (arr!47914 a!2862) index!646) (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47914 a!2862) index!646) (select (arr!47914 a!2862) j!93))) (not (= (select (arr!47914 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477424 () Bool)

(declare-fun res!1003547 () Bool)

(assert (=> b!1477424 (=> (not res!1003547) (not e!828830))))

(assert (=> b!1477424 (= res!1003547 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47914 a!2862) j!93) a!2862 mask!2687) lt!645341))))

(declare-fun b!1477425 () Bool)

(declare-fun res!1003543 () Bool)

(assert (=> b!1477425 (=> (not res!1003543) (not e!828836))))

(assert (=> b!1477425 (= res!1003543 (validKeyInArray!0 (select (arr!47914 a!2862) j!93)))))

(assert (= (and start!126164 res!1003540) b!1477416))

(assert (= (and b!1477416 res!1003545) b!1477413))

(assert (= (and b!1477413 res!1003551) b!1477425))

(assert (= (and b!1477425 res!1003543) b!1477409))

(assert (= (and b!1477409 res!1003549) b!1477410))

(assert (= (and b!1477410 res!1003544) b!1477408))

(assert (= (and b!1477408 res!1003537) b!1477418))

(assert (= (and b!1477418 res!1003548) b!1477414))

(assert (= (and b!1477414 res!1003552) b!1477424))

(assert (= (and b!1477424 res!1003547) b!1477421))

(assert (= (and b!1477421 res!1003541) b!1477415))

(assert (= (and b!1477415 c!136455) b!1477422))

(assert (= (and b!1477415 (not c!136455)) b!1477420))

(assert (= (and b!1477415 res!1003546) b!1477419))

(assert (= (and b!1477419 res!1003550) b!1477412))

(assert (= (and b!1477412 res!1003542) b!1477423))

(assert (= (and b!1477423 (not res!1003539)) b!1477417))

(assert (= (and b!1477417 res!1003538) b!1477411))

(declare-fun m!1363359 () Bool)

(assert (=> b!1477412 m!1363359))

(declare-fun m!1363361 () Bool)

(assert (=> b!1477412 m!1363361))

(declare-fun m!1363363 () Bool)

(assert (=> b!1477412 m!1363363))

(declare-fun m!1363365 () Bool)

(assert (=> b!1477412 m!1363365))

(declare-fun m!1363367 () Bool)

(assert (=> b!1477412 m!1363367))

(assert (=> b!1477412 m!1363363))

(declare-fun m!1363369 () Bool)

(assert (=> b!1477423 m!1363369))

(declare-fun m!1363371 () Bool)

(assert (=> b!1477423 m!1363371))

(declare-fun m!1363373 () Bool)

(assert (=> b!1477423 m!1363373))

(assert (=> b!1477423 m!1363363))

(declare-fun m!1363375 () Bool)

(assert (=> b!1477420 m!1363375))

(declare-fun m!1363377 () Bool)

(assert (=> b!1477420 m!1363377))

(declare-fun m!1363379 () Bool)

(assert (=> b!1477421 m!1363379))

(assert (=> b!1477421 m!1363379))

(declare-fun m!1363381 () Bool)

(assert (=> b!1477421 m!1363381))

(assert (=> b!1477421 m!1363371))

(declare-fun m!1363383 () Bool)

(assert (=> b!1477421 m!1363383))

(assert (=> b!1477414 m!1363363))

(assert (=> b!1477414 m!1363363))

(declare-fun m!1363385 () Bool)

(assert (=> b!1477414 m!1363385))

(assert (=> b!1477414 m!1363385))

(assert (=> b!1477414 m!1363363))

(declare-fun m!1363387 () Bool)

(assert (=> b!1477414 m!1363387))

(assert (=> b!1477418 m!1363371))

(declare-fun m!1363389 () Bool)

(assert (=> b!1477418 m!1363389))

(assert (=> b!1477424 m!1363363))

(assert (=> b!1477424 m!1363363))

(declare-fun m!1363391 () Bool)

(assert (=> b!1477424 m!1363391))

(declare-fun m!1363393 () Bool)

(assert (=> b!1477422 m!1363393))

(declare-fun m!1363395 () Bool)

(assert (=> b!1477413 m!1363395))

(assert (=> b!1477413 m!1363395))

(declare-fun m!1363397 () Bool)

(assert (=> b!1477413 m!1363397))

(assert (=> b!1477417 m!1363363))

(assert (=> b!1477417 m!1363363))

(declare-fun m!1363399 () Bool)

(assert (=> b!1477417 m!1363399))

(assert (=> b!1477425 m!1363363))

(assert (=> b!1477425 m!1363363))

(declare-fun m!1363401 () Bool)

(assert (=> b!1477425 m!1363401))

(declare-fun m!1363403 () Bool)

(assert (=> b!1477409 m!1363403))

(declare-fun m!1363405 () Bool)

(assert (=> start!126164 m!1363405))

(declare-fun m!1363407 () Bool)

(assert (=> start!126164 m!1363407))

(declare-fun m!1363409 () Bool)

(assert (=> b!1477410 m!1363409))

(push 1)

