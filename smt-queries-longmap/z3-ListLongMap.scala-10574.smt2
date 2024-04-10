; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124584 () Bool)

(assert start!124584)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1442285 () Bool)

(declare-fun e!812919 () Bool)

(declare-datatypes ((array!98032 0))(
  ( (array!98033 (arr!47304 (Array (_ BitVec 32) (_ BitVec 64))) (size!47854 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98032)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442285 (= e!812919 (or (= (select (arr!47304 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47304 a!2862) intermediateBeforeIndex!19) (select (arr!47304 a!2862) j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633517 () (_ BitVec 64))

(declare-fun e!812920 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!633515 () array!98032)

(declare-fun b!1442286 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11556 0))(
  ( (MissingZero!11556 (index!48616 (_ BitVec 32))) (Found!11556 (index!48617 (_ BitVec 32))) (Intermediate!11556 (undefined!12368 Bool) (index!48618 (_ BitVec 32)) (x!130325 (_ BitVec 32))) (Undefined!11556) (MissingVacant!11556 (index!48619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98032 (_ BitVec 32)) SeekEntryResult!11556)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98032 (_ BitVec 32)) SeekEntryResult!11556)

(assert (=> b!1442286 (= e!812920 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633517 lt!633515 mask!2687) (seekEntryOrOpen!0 lt!633517 lt!633515 mask!2687)))))

(declare-fun b!1442287 () Bool)

(declare-fun res!974535 () Bool)

(assert (=> b!1442287 (=> (not res!974535) (not e!812919))))

(assert (=> b!1442287 (= res!974535 (= (seekEntryOrOpen!0 (select (arr!47304 a!2862) j!93) a!2862 mask!2687) (Found!11556 j!93)))))

(declare-fun b!1442288 () Bool)

(declare-fun res!974528 () Bool)

(declare-fun e!812921 () Bool)

(assert (=> b!1442288 (=> (not res!974528) (not e!812921))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442288 (= res!974528 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47854 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47854 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47854 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442289 () Bool)

(declare-fun e!812918 () Bool)

(assert (=> b!1442289 (= e!812921 e!812918)))

(declare-fun res!974527 () Bool)

(assert (=> b!1442289 (=> (not res!974527) (not e!812918))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442289 (= res!974527 (= (select (store (arr!47304 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442289 (= lt!633515 (array!98033 (store (arr!47304 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47854 a!2862)))))

(declare-fun b!1442290 () Bool)

(declare-fun res!974532 () Bool)

(assert (=> b!1442290 (=> (not res!974532) (not e!812921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442290 (= res!974532 (validKeyInArray!0 (select (arr!47304 a!2862) i!1006)))))

(declare-fun b!1442291 () Bool)

(declare-fun res!974524 () Bool)

(declare-fun e!812915 () Bool)

(assert (=> b!1442291 (=> (not res!974524) (not e!812915))))

(assert (=> b!1442291 (= res!974524 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442292 () Bool)

(declare-fun res!974529 () Bool)

(assert (=> b!1442292 (=> (not res!974529) (not e!812921))))

(assert (=> b!1442292 (= res!974529 (validKeyInArray!0 (select (arr!47304 a!2862) j!93)))))

(declare-fun b!1442293 () Bool)

(declare-fun res!974526 () Bool)

(assert (=> b!1442293 (=> (not res!974526) (not e!812921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98032 (_ BitVec 32)) Bool)

(assert (=> b!1442293 (= res!974526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442294 () Bool)

(declare-fun res!974533 () Bool)

(assert (=> b!1442294 (=> (not res!974533) (not e!812921))))

(declare-datatypes ((List!33805 0))(
  ( (Nil!33802) (Cons!33801 (h!35151 (_ BitVec 64)) (t!48499 List!33805)) )
))
(declare-fun arrayNoDuplicates!0 (array!98032 (_ BitVec 32) List!33805) Bool)

(assert (=> b!1442294 (= res!974533 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33802))))

(declare-fun b!1442295 () Bool)

(declare-fun res!974534 () Bool)

(assert (=> b!1442295 (=> (not res!974534) (not e!812915))))

(assert (=> b!1442295 (= res!974534 e!812920)))

(declare-fun c!133392 () Bool)

(assert (=> b!1442295 (= c!133392 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442296 () Bool)

(assert (=> b!1442296 (= e!812915 (not (or (not (= (select (arr!47304 a!2862) index!646) (select (store (arr!47304 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47304 a!2862) index!646) (select (arr!47304 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1442296 e!812919))

(declare-fun res!974522 () Bool)

(assert (=> b!1442296 (=> (not res!974522) (not e!812919))))

(assert (=> b!1442296 (= res!974522 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48608 0))(
  ( (Unit!48609) )
))
(declare-fun lt!633516 () Unit!48608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48608)

(assert (=> b!1442296 (= lt!633516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442297 () Bool)

(declare-fun e!812917 () Bool)

(assert (=> b!1442297 (= e!812918 e!812917)))

(declare-fun res!974523 () Bool)

(assert (=> b!1442297 (=> (not res!974523) (not e!812917))))

(declare-fun lt!633518 () SeekEntryResult!11556)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98032 (_ BitVec 32)) SeekEntryResult!11556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442297 (= res!974523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47304 a!2862) j!93) mask!2687) (select (arr!47304 a!2862) j!93) a!2862 mask!2687) lt!633518))))

(assert (=> b!1442297 (= lt!633518 (Intermediate!11556 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442298 () Bool)

(assert (=> b!1442298 (= e!812917 e!812915)))

(declare-fun res!974530 () Bool)

(assert (=> b!1442298 (=> (not res!974530) (not e!812915))))

(declare-fun lt!633519 () SeekEntryResult!11556)

(assert (=> b!1442298 (= res!974530 (= lt!633519 (Intermediate!11556 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442298 (= lt!633519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633517 mask!2687) lt!633517 lt!633515 mask!2687))))

(assert (=> b!1442298 (= lt!633517 (select (store (arr!47304 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442299 () Bool)

(assert (=> b!1442299 (= e!812920 (= lt!633519 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633517 lt!633515 mask!2687)))))

(declare-fun res!974531 () Bool)

(assert (=> start!124584 (=> (not res!974531) (not e!812921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124584 (= res!974531 (validMask!0 mask!2687))))

(assert (=> start!124584 e!812921))

(assert (=> start!124584 true))

(declare-fun array_inv!36332 (array!98032) Bool)

(assert (=> start!124584 (array_inv!36332 a!2862)))

(declare-fun b!1442300 () Bool)

(declare-fun res!974525 () Bool)

(assert (=> b!1442300 (=> (not res!974525) (not e!812917))))

(assert (=> b!1442300 (= res!974525 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47304 a!2862) j!93) a!2862 mask!2687) lt!633518))))

(declare-fun b!1442301 () Bool)

(declare-fun res!974536 () Bool)

(assert (=> b!1442301 (=> (not res!974536) (not e!812921))))

(assert (=> b!1442301 (= res!974536 (and (= (size!47854 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47854 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47854 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124584 res!974531) b!1442301))

(assert (= (and b!1442301 res!974536) b!1442290))

(assert (= (and b!1442290 res!974532) b!1442292))

(assert (= (and b!1442292 res!974529) b!1442293))

(assert (= (and b!1442293 res!974526) b!1442294))

(assert (= (and b!1442294 res!974533) b!1442288))

(assert (= (and b!1442288 res!974528) b!1442289))

(assert (= (and b!1442289 res!974527) b!1442297))

(assert (= (and b!1442297 res!974523) b!1442300))

(assert (= (and b!1442300 res!974525) b!1442298))

(assert (= (and b!1442298 res!974530) b!1442295))

(assert (= (and b!1442295 c!133392) b!1442299))

(assert (= (and b!1442295 (not c!133392)) b!1442286))

(assert (= (and b!1442295 res!974534) b!1442291))

(assert (= (and b!1442291 res!974524) b!1442296))

(assert (= (and b!1442296 res!974522) b!1442287))

(assert (= (and b!1442287 res!974535) b!1442285))

(declare-fun m!1331445 () Bool)

(assert (=> start!124584 m!1331445))

(declare-fun m!1331447 () Bool)

(assert (=> start!124584 m!1331447))

(declare-fun m!1331449 () Bool)

(assert (=> b!1442287 m!1331449))

(assert (=> b!1442287 m!1331449))

(declare-fun m!1331451 () Bool)

(assert (=> b!1442287 m!1331451))

(assert (=> b!1442292 m!1331449))

(assert (=> b!1442292 m!1331449))

(declare-fun m!1331453 () Bool)

(assert (=> b!1442292 m!1331453))

(declare-fun m!1331455 () Bool)

(assert (=> b!1442299 m!1331455))

(declare-fun m!1331457 () Bool)

(assert (=> b!1442293 m!1331457))

(declare-fun m!1331459 () Bool)

(assert (=> b!1442298 m!1331459))

(assert (=> b!1442298 m!1331459))

(declare-fun m!1331461 () Bool)

(assert (=> b!1442298 m!1331461))

(declare-fun m!1331463 () Bool)

(assert (=> b!1442298 m!1331463))

(declare-fun m!1331465 () Bool)

(assert (=> b!1442298 m!1331465))

(assert (=> b!1442297 m!1331449))

(assert (=> b!1442297 m!1331449))

(declare-fun m!1331467 () Bool)

(assert (=> b!1442297 m!1331467))

(assert (=> b!1442297 m!1331467))

(assert (=> b!1442297 m!1331449))

(declare-fun m!1331469 () Bool)

(assert (=> b!1442297 m!1331469))

(declare-fun m!1331471 () Bool)

(assert (=> b!1442290 m!1331471))

(assert (=> b!1442290 m!1331471))

(declare-fun m!1331473 () Bool)

(assert (=> b!1442290 m!1331473))

(assert (=> b!1442300 m!1331449))

(assert (=> b!1442300 m!1331449))

(declare-fun m!1331475 () Bool)

(assert (=> b!1442300 m!1331475))

(declare-fun m!1331477 () Bool)

(assert (=> b!1442294 m!1331477))

(assert (=> b!1442289 m!1331463))

(declare-fun m!1331479 () Bool)

(assert (=> b!1442289 m!1331479))

(declare-fun m!1331481 () Bool)

(assert (=> b!1442285 m!1331481))

(assert (=> b!1442285 m!1331449))

(declare-fun m!1331483 () Bool)

(assert (=> b!1442286 m!1331483))

(declare-fun m!1331485 () Bool)

(assert (=> b!1442286 m!1331485))

(declare-fun m!1331487 () Bool)

(assert (=> b!1442296 m!1331487))

(assert (=> b!1442296 m!1331463))

(declare-fun m!1331489 () Bool)

(assert (=> b!1442296 m!1331489))

(declare-fun m!1331491 () Bool)

(assert (=> b!1442296 m!1331491))

(declare-fun m!1331493 () Bool)

(assert (=> b!1442296 m!1331493))

(assert (=> b!1442296 m!1331449))

(check-sat (not b!1442287) (not b!1442286) (not b!1442293) (not b!1442300) (not b!1442292) (not start!124584) (not b!1442298) (not b!1442294) (not b!1442299) (not b!1442297) (not b!1442296) (not b!1442290))
(check-sat)
