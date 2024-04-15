; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125248 () Bool)

(assert start!125248)

(declare-datatypes ((array!98674 0))(
  ( (array!98675 (arr!47626 (Array (_ BitVec 32) (_ BitVec 64))) (size!48178 (_ BitVec 32))) )
))
(declare-fun lt!640283 () array!98674)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1462452 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11903 0))(
  ( (MissingZero!11903 (index!50004 (_ BitVec 32))) (Found!11903 (index!50005 (_ BitVec 32))) (Intermediate!11903 (undefined!12715 Bool) (index!50006 (_ BitVec 32)) (x!131595 (_ BitVec 32))) (Undefined!11903) (MissingVacant!11903 (index!50007 (_ BitVec 32))) )
))
(declare-fun lt!640284 () SeekEntryResult!11903)

(declare-fun e!822050 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640282 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98674 (_ BitVec 32)) SeekEntryResult!11903)

(assert (=> b!1462452 (= e!822050 (= lt!640284 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640282 lt!640283 mask!2687)))))

(declare-fun b!1462453 () Bool)

(declare-fun res!991969 () Bool)

(declare-fun e!822046 () Bool)

(assert (=> b!1462453 (=> (not res!991969) (not e!822046))))

(declare-fun a!2862 () array!98674)

(declare-datatypes ((List!34205 0))(
  ( (Nil!34202) (Cons!34201 (h!35551 (_ BitVec 64)) (t!48891 List!34205)) )
))
(declare-fun arrayNoDuplicates!0 (array!98674 (_ BitVec 32) List!34205) Bool)

(assert (=> b!1462453 (= res!991969 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34202))))

(declare-fun b!1462454 () Bool)

(declare-fun res!991979 () Bool)

(declare-fun e!822052 () Bool)

(assert (=> b!1462454 (=> res!991979 e!822052)))

(declare-fun lt!640281 () SeekEntryResult!11903)

(declare-fun lt!640287 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1462454 (= res!991979 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640287 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!640281)))))

(declare-fun b!1462455 () Bool)

(declare-fun res!991973 () Bool)

(declare-fun e!822054 () Bool)

(assert (=> b!1462455 (=> (not res!991973) (not e!822054))))

(assert (=> b!1462455 (= res!991973 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!640281))))

(declare-fun b!1462456 () Bool)

(declare-fun res!991975 () Bool)

(assert (=> b!1462456 (=> (not res!991975) (not e!822046))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462456 (= res!991975 (and (= (size!48178 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48178 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48178 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462457 () Bool)

(declare-fun e!822047 () Bool)

(assert (=> b!1462457 (= e!822054 e!822047)))

(declare-fun res!991966 () Bool)

(assert (=> b!1462457 (=> (not res!991966) (not e!822047))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462457 (= res!991966 (= lt!640284 (Intermediate!11903 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462457 (= lt!640284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640282 mask!2687) lt!640282 lt!640283 mask!2687))))

(assert (=> b!1462457 (= lt!640282 (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462458 () Bool)

(declare-fun res!991976 () Bool)

(assert (=> b!1462458 (=> (not res!991976) (not e!822047))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462458 (= res!991976 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462459 () Bool)

(declare-fun res!991972 () Bool)

(assert (=> b!1462459 (=> (not res!991972) (not e!822046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462459 (= res!991972 (validKeyInArray!0 (select (arr!47626 a!2862) j!93)))))

(declare-fun b!1462460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98674 (_ BitVec 32)) SeekEntryResult!11903)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98674 (_ BitVec 32)) SeekEntryResult!11903)

(assert (=> b!1462460 (= e!822050 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640282 lt!640283 mask!2687) (seekEntryOrOpen!0 lt!640282 lt!640283 mask!2687)))))

(declare-fun res!991970 () Bool)

(assert (=> start!125248 (=> (not res!991970) (not e!822046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125248 (= res!991970 (validMask!0 mask!2687))))

(assert (=> start!125248 e!822046))

(assert (=> start!125248 true))

(declare-fun array_inv!36859 (array!98674) Bool)

(assert (=> start!125248 (array_inv!36859 a!2862)))

(declare-fun b!1462461 () Bool)

(declare-fun e!822048 () Bool)

(assert (=> b!1462461 (= e!822048 (not (= lt!640284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640287 lt!640282 lt!640283 mask!2687))))))

(declare-fun b!1462462 () Bool)

(declare-fun e!822051 () Bool)

(assert (=> b!1462462 (= e!822051 e!822052)))

(declare-fun res!991980 () Bool)

(assert (=> b!1462462 (=> res!991980 e!822052)))

(assert (=> b!1462462 (= res!991980 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640287 #b00000000000000000000000000000000) (bvsge lt!640287 (size!48178 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462462 (= lt!640287 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462463 () Bool)

(declare-fun res!991978 () Bool)

(assert (=> b!1462463 (=> (not res!991978) (not e!822047))))

(assert (=> b!1462463 (= res!991978 e!822050)))

(declare-fun c!134757 () Bool)

(assert (=> b!1462463 (= c!134757 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462464 () Bool)

(assert (=> b!1462464 (= e!822052 true)))

(declare-fun lt!640286 () Bool)

(assert (=> b!1462464 (= lt!640286 e!822048)))

(declare-fun c!134758 () Bool)

(assert (=> b!1462464 (= c!134758 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462465 () Bool)

(declare-fun e!822053 () Bool)

(assert (=> b!1462465 (= e!822053 e!822054)))

(declare-fun res!991968 () Bool)

(assert (=> b!1462465 (=> (not res!991968) (not e!822054))))

(assert (=> b!1462465 (= res!991968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47626 a!2862) j!93) mask!2687) (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!640281))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1462465 (= lt!640281 (Intermediate!11903 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462466 () Bool)

(declare-fun res!991967 () Bool)

(assert (=> b!1462466 (=> (not res!991967) (not e!822046))))

(assert (=> b!1462466 (= res!991967 (validKeyInArray!0 (select (arr!47626 a!2862) i!1006)))))

(declare-fun b!1462467 () Bool)

(declare-fun res!991971 () Bool)

(declare-fun e!822049 () Bool)

(assert (=> b!1462467 (=> (not res!991971) (not e!822049))))

(assert (=> b!1462467 (= res!991971 (= (seekEntryOrOpen!0 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) (Found!11903 j!93)))))

(declare-fun b!1462468 () Bool)

(declare-fun res!991964 () Bool)

(assert (=> b!1462468 (=> (not res!991964) (not e!822046))))

(assert (=> b!1462468 (= res!991964 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48178 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48178 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48178 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462469 () Bool)

(assert (=> b!1462469 (= e!822048 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640287 intermediateAfterIndex!19 lt!640282 lt!640283 mask!2687) (seekEntryOrOpen!0 lt!640282 lt!640283 mask!2687))))))

(declare-fun b!1462470 () Bool)

(assert (=> b!1462470 (= e!822047 (not e!822051))))

(declare-fun res!991981 () Bool)

(assert (=> b!1462470 (=> res!991981 e!822051)))

(assert (=> b!1462470 (= res!991981 (or (and (= (select (arr!47626 a!2862) index!646) (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47626 a!2862) index!646) (select (arr!47626 a!2862) j!93))) (= (select (arr!47626 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462470 e!822049))

(declare-fun res!991974 () Bool)

(assert (=> b!1462470 (=> (not res!991974) (not e!822049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98674 (_ BitVec 32)) Bool)

(assert (=> b!1462470 (= res!991974 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49143 0))(
  ( (Unit!49144) )
))
(declare-fun lt!640285 () Unit!49143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49143)

(assert (=> b!1462470 (= lt!640285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462471 () Bool)

(assert (=> b!1462471 (= e!822046 e!822053)))

(declare-fun res!991977 () Bool)

(assert (=> b!1462471 (=> (not res!991977) (not e!822053))))

(assert (=> b!1462471 (= res!991977 (= (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462471 (= lt!640283 (array!98675 (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48178 a!2862)))))

(declare-fun b!1462472 () Bool)

(declare-fun res!991965 () Bool)

(assert (=> b!1462472 (=> (not res!991965) (not e!822046))))

(assert (=> b!1462472 (= res!991965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462473 () Bool)

(assert (=> b!1462473 (= e!822049 (or (= (select (arr!47626 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47626 a!2862) intermediateBeforeIndex!19) (select (arr!47626 a!2862) j!93))))))

(assert (= (and start!125248 res!991970) b!1462456))

(assert (= (and b!1462456 res!991975) b!1462466))

(assert (= (and b!1462466 res!991967) b!1462459))

(assert (= (and b!1462459 res!991972) b!1462472))

(assert (= (and b!1462472 res!991965) b!1462453))

(assert (= (and b!1462453 res!991969) b!1462468))

(assert (= (and b!1462468 res!991964) b!1462471))

(assert (= (and b!1462471 res!991977) b!1462465))

(assert (= (and b!1462465 res!991968) b!1462455))

(assert (= (and b!1462455 res!991973) b!1462457))

(assert (= (and b!1462457 res!991966) b!1462463))

(assert (= (and b!1462463 c!134757) b!1462452))

(assert (= (and b!1462463 (not c!134757)) b!1462460))

(assert (= (and b!1462463 res!991978) b!1462458))

(assert (= (and b!1462458 res!991976) b!1462470))

(assert (= (and b!1462470 res!991974) b!1462467))

(assert (= (and b!1462467 res!991971) b!1462473))

(assert (= (and b!1462470 (not res!991981)) b!1462462))

(assert (= (and b!1462462 (not res!991980)) b!1462454))

(assert (= (and b!1462454 (not res!991979)) b!1462464))

(assert (= (and b!1462464 c!134758) b!1462461))

(assert (= (and b!1462464 (not c!134758)) b!1462469))

(declare-fun m!1349403 () Bool)

(assert (=> b!1462472 m!1349403))

(declare-fun m!1349405 () Bool)

(assert (=> b!1462455 m!1349405))

(assert (=> b!1462455 m!1349405))

(declare-fun m!1349407 () Bool)

(assert (=> b!1462455 m!1349407))

(assert (=> b!1462465 m!1349405))

(assert (=> b!1462465 m!1349405))

(declare-fun m!1349409 () Bool)

(assert (=> b!1462465 m!1349409))

(assert (=> b!1462465 m!1349409))

(assert (=> b!1462465 m!1349405))

(declare-fun m!1349411 () Bool)

(assert (=> b!1462465 m!1349411))

(declare-fun m!1349413 () Bool)

(assert (=> b!1462461 m!1349413))

(assert (=> b!1462459 m!1349405))

(assert (=> b!1462459 m!1349405))

(declare-fun m!1349415 () Bool)

(assert (=> b!1462459 m!1349415))

(declare-fun m!1349417 () Bool)

(assert (=> b!1462460 m!1349417))

(declare-fun m!1349419 () Bool)

(assert (=> b!1462460 m!1349419))

(declare-fun m!1349421 () Bool)

(assert (=> start!125248 m!1349421))

(declare-fun m!1349423 () Bool)

(assert (=> start!125248 m!1349423))

(declare-fun m!1349425 () Bool)

(assert (=> b!1462470 m!1349425))

(declare-fun m!1349427 () Bool)

(assert (=> b!1462470 m!1349427))

(declare-fun m!1349429 () Bool)

(assert (=> b!1462470 m!1349429))

(declare-fun m!1349431 () Bool)

(assert (=> b!1462470 m!1349431))

(declare-fun m!1349433 () Bool)

(assert (=> b!1462470 m!1349433))

(assert (=> b!1462470 m!1349405))

(declare-fun m!1349435 () Bool)

(assert (=> b!1462462 m!1349435))

(declare-fun m!1349437 () Bool)

(assert (=> b!1462457 m!1349437))

(assert (=> b!1462457 m!1349437))

(declare-fun m!1349439 () Bool)

(assert (=> b!1462457 m!1349439))

(assert (=> b!1462457 m!1349427))

(declare-fun m!1349441 () Bool)

(assert (=> b!1462457 m!1349441))

(assert (=> b!1462471 m!1349427))

(declare-fun m!1349443 () Bool)

(assert (=> b!1462471 m!1349443))

(declare-fun m!1349445 () Bool)

(assert (=> b!1462453 m!1349445))

(assert (=> b!1462454 m!1349405))

(assert (=> b!1462454 m!1349405))

(declare-fun m!1349447 () Bool)

(assert (=> b!1462454 m!1349447))

(declare-fun m!1349449 () Bool)

(assert (=> b!1462452 m!1349449))

(declare-fun m!1349451 () Bool)

(assert (=> b!1462473 m!1349451))

(assert (=> b!1462473 m!1349405))

(assert (=> b!1462467 m!1349405))

(assert (=> b!1462467 m!1349405))

(declare-fun m!1349453 () Bool)

(assert (=> b!1462467 m!1349453))

(declare-fun m!1349455 () Bool)

(assert (=> b!1462466 m!1349455))

(assert (=> b!1462466 m!1349455))

(declare-fun m!1349457 () Bool)

(assert (=> b!1462466 m!1349457))

(declare-fun m!1349459 () Bool)

(assert (=> b!1462469 m!1349459))

(assert (=> b!1462469 m!1349419))

(check-sat (not b!1462452) (not b!1462459) (not b!1462465) (not start!125248) (not b!1462453) (not b!1462462) (not b!1462466) (not b!1462457) (not b!1462469) (not b!1462472) (not b!1462460) (not b!1462454) (not b!1462467) (not b!1462470) (not b!1462455) (not b!1462461))
(check-sat)
