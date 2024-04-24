; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124950 () Bool)

(assert start!124950)

(declare-fun b!1447449 () Bool)

(declare-fun res!978422 () Bool)

(declare-fun e!815362 () Bool)

(assert (=> b!1447449 (=> (not res!978422) (not e!815362))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98293 0))(
  ( (array!98294 (arr!47431 (Array (_ BitVec 32) (_ BitVec 64))) (size!47982 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98293)

(assert (=> b!1447449 (= res!978422 (and (= (size!47982 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47982 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47982 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447450 () Bool)

(declare-fun res!978424 () Bool)

(declare-fun e!815365 () Bool)

(assert (=> b!1447450 (=> (not res!978424) (not e!815365))))

(declare-datatypes ((SeekEntryResult!11580 0))(
  ( (MissingZero!11580 (index!48712 (_ BitVec 32))) (Found!11580 (index!48713 (_ BitVec 32))) (Intermediate!11580 (undefined!12392 Bool) (index!48714 (_ BitVec 32)) (x!130573 (_ BitVec 32))) (Undefined!11580) (MissingVacant!11580 (index!48715 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98293 (_ BitVec 32)) SeekEntryResult!11580)

(assert (=> b!1447450 (= res!978424 (= (seekEntryOrOpen!0 (select (arr!47431 a!2862) j!93) a!2862 mask!2687) (Found!11580 j!93)))))

(declare-fun b!1447451 () Bool)

(declare-fun res!978417 () Bool)

(assert (=> b!1447451 (=> (not res!978417) (not e!815362))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1447451 (= res!978417 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47982 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47982 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47982 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447452 () Bool)

(declare-fun e!815366 () Bool)

(declare-fun e!815367 () Bool)

(assert (=> b!1447452 (= e!815366 e!815367)))

(declare-fun res!978427 () Bool)

(assert (=> b!1447452 (=> (not res!978427) (not e!815367))))

(declare-fun lt!635176 () SeekEntryResult!11580)

(assert (=> b!1447452 (= res!978427 (= lt!635176 (Intermediate!11580 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635179 () array!98293)

(declare-fun lt!635178 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98293 (_ BitVec 32)) SeekEntryResult!11580)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447452 (= lt!635176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635178 mask!2687) lt!635178 lt!635179 mask!2687))))

(assert (=> b!1447452 (= lt!635178 (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447453 () Bool)

(declare-fun res!978418 () Bool)

(assert (=> b!1447453 (=> (not res!978418) (not e!815362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98293 (_ BitVec 32)) Bool)

(assert (=> b!1447453 (= res!978418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447454 () Bool)

(declare-fun res!978426 () Bool)

(assert (=> b!1447454 (=> (not res!978426) (not e!815362))))

(declare-datatypes ((List!33919 0))(
  ( (Nil!33916) (Cons!33915 (h!35276 (_ BitVec 64)) (t!48605 List!33919)) )
))
(declare-fun arrayNoDuplicates!0 (array!98293 (_ BitVec 32) List!33919) Bool)

(assert (=> b!1447454 (= res!978426 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33916))))

(declare-fun b!1447455 () Bool)

(declare-fun res!978421 () Bool)

(assert (=> b!1447455 (=> (not res!978421) (not e!815362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447455 (= res!978421 (validKeyInArray!0 (select (arr!47431 a!2862) i!1006)))))

(declare-fun res!978429 () Bool)

(assert (=> start!124950 (=> (not res!978429) (not e!815362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124950 (= res!978429 (validMask!0 mask!2687))))

(assert (=> start!124950 e!815362))

(assert (=> start!124950 true))

(declare-fun array_inv!36712 (array!98293) Bool)

(assert (=> start!124950 (array_inv!36712 a!2862)))

(declare-fun b!1447456 () Bool)

(assert (=> b!1447456 (= e!815365 (or (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) (select (arr!47431 a!2862) j!93))))))

(declare-fun b!1447457 () Bool)

(declare-fun res!978431 () Bool)

(assert (=> b!1447457 (=> (not res!978431) (not e!815367))))

(assert (=> b!1447457 (= res!978431 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447458 () Bool)

(declare-fun e!815363 () Bool)

(assert (=> b!1447458 (= e!815362 e!815363)))

(declare-fun res!978423 () Bool)

(assert (=> b!1447458 (=> (not res!978423) (not e!815363))))

(assert (=> b!1447458 (= res!978423 (= (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447458 (= lt!635179 (array!98294 (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47982 a!2862)))))

(declare-fun e!815361 () Bool)

(declare-fun b!1447459 () Bool)

(assert (=> b!1447459 (= e!815361 (= lt!635176 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635178 lt!635179 mask!2687)))))

(declare-fun b!1447460 () Bool)

(declare-fun res!978428 () Bool)

(assert (=> b!1447460 (=> (not res!978428) (not e!815367))))

(assert (=> b!1447460 (= res!978428 e!815361)))

(declare-fun c!134035 () Bool)

(assert (=> b!1447460 (= c!134035 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447461 () Bool)

(assert (=> b!1447461 (= e!815367 (not true))))

(assert (=> b!1447461 e!815365))

(declare-fun res!978419 () Bool)

(assert (=> b!1447461 (=> (not res!978419) (not e!815365))))

(assert (=> b!1447461 (= res!978419 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48689 0))(
  ( (Unit!48690) )
))
(declare-fun lt!635175 () Unit!48689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48689)

(assert (=> b!1447461 (= lt!635175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447462 () Bool)

(assert (=> b!1447462 (= e!815363 e!815366)))

(declare-fun res!978420 () Bool)

(assert (=> b!1447462 (=> (not res!978420) (not e!815366))))

(declare-fun lt!635177 () SeekEntryResult!11580)

(assert (=> b!1447462 (= res!978420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47431 a!2862) j!93) mask!2687) (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!635177))))

(assert (=> b!1447462 (= lt!635177 (Intermediate!11580 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447463 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98293 (_ BitVec 32)) SeekEntryResult!11580)

(assert (=> b!1447463 (= e!815361 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635178 lt!635179 mask!2687) (seekEntryOrOpen!0 lt!635178 lt!635179 mask!2687)))))

(declare-fun b!1447464 () Bool)

(declare-fun res!978425 () Bool)

(assert (=> b!1447464 (=> (not res!978425) (not e!815366))))

(assert (=> b!1447464 (= res!978425 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!635177))))

(declare-fun b!1447465 () Bool)

(declare-fun res!978430 () Bool)

(assert (=> b!1447465 (=> (not res!978430) (not e!815362))))

(assert (=> b!1447465 (= res!978430 (validKeyInArray!0 (select (arr!47431 a!2862) j!93)))))

(assert (= (and start!124950 res!978429) b!1447449))

(assert (= (and b!1447449 res!978422) b!1447455))

(assert (= (and b!1447455 res!978421) b!1447465))

(assert (= (and b!1447465 res!978430) b!1447453))

(assert (= (and b!1447453 res!978418) b!1447454))

(assert (= (and b!1447454 res!978426) b!1447451))

(assert (= (and b!1447451 res!978417) b!1447458))

(assert (= (and b!1447458 res!978423) b!1447462))

(assert (= (and b!1447462 res!978420) b!1447464))

(assert (= (and b!1447464 res!978425) b!1447452))

(assert (= (and b!1447452 res!978427) b!1447460))

(assert (= (and b!1447460 c!134035) b!1447459))

(assert (= (and b!1447460 (not c!134035)) b!1447463))

(assert (= (and b!1447460 res!978428) b!1447457))

(assert (= (and b!1447457 res!978431) b!1447461))

(assert (= (and b!1447461 res!978419) b!1447450))

(assert (= (and b!1447450 res!978424) b!1447456))

(declare-fun m!1336465 () Bool)

(assert (=> b!1447450 m!1336465))

(assert (=> b!1447450 m!1336465))

(declare-fun m!1336467 () Bool)

(assert (=> b!1447450 m!1336467))

(assert (=> b!1447465 m!1336465))

(assert (=> b!1447465 m!1336465))

(declare-fun m!1336469 () Bool)

(assert (=> b!1447465 m!1336469))

(declare-fun m!1336471 () Bool)

(assert (=> b!1447454 m!1336471))

(assert (=> b!1447462 m!1336465))

(assert (=> b!1447462 m!1336465))

(declare-fun m!1336473 () Bool)

(assert (=> b!1447462 m!1336473))

(assert (=> b!1447462 m!1336473))

(assert (=> b!1447462 m!1336465))

(declare-fun m!1336475 () Bool)

(assert (=> b!1447462 m!1336475))

(declare-fun m!1336477 () Bool)

(assert (=> b!1447459 m!1336477))

(assert (=> b!1447464 m!1336465))

(assert (=> b!1447464 m!1336465))

(declare-fun m!1336479 () Bool)

(assert (=> b!1447464 m!1336479))

(declare-fun m!1336481 () Bool)

(assert (=> b!1447455 m!1336481))

(assert (=> b!1447455 m!1336481))

(declare-fun m!1336483 () Bool)

(assert (=> b!1447455 m!1336483))

(declare-fun m!1336485 () Bool)

(assert (=> b!1447461 m!1336485))

(declare-fun m!1336487 () Bool)

(assert (=> b!1447461 m!1336487))

(declare-fun m!1336489 () Bool)

(assert (=> start!124950 m!1336489))

(declare-fun m!1336491 () Bool)

(assert (=> start!124950 m!1336491))

(declare-fun m!1336493 () Bool)

(assert (=> b!1447463 m!1336493))

(declare-fun m!1336495 () Bool)

(assert (=> b!1447463 m!1336495))

(declare-fun m!1336497 () Bool)

(assert (=> b!1447453 m!1336497))

(declare-fun m!1336499 () Bool)

(assert (=> b!1447456 m!1336499))

(assert (=> b!1447456 m!1336465))

(declare-fun m!1336501 () Bool)

(assert (=> b!1447458 m!1336501))

(declare-fun m!1336503 () Bool)

(assert (=> b!1447458 m!1336503))

(declare-fun m!1336505 () Bool)

(assert (=> b!1447452 m!1336505))

(assert (=> b!1447452 m!1336505))

(declare-fun m!1336507 () Bool)

(assert (=> b!1447452 m!1336507))

(assert (=> b!1447452 m!1336501))

(declare-fun m!1336509 () Bool)

(assert (=> b!1447452 m!1336509))

(check-sat (not b!1447450) (not b!1447455) (not b!1447464) (not b!1447465) (not b!1447462) (not start!124950) (not b!1447459) (not b!1447452) (not b!1447454) (not b!1447463) (not b!1447461) (not b!1447453))
(check-sat)
