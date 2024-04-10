; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126206 () Bool)

(assert start!126206)

(declare-fun b!1478542 () Bool)

(declare-fun res!1004559 () Bool)

(declare-fun e!829401 () Bool)

(assert (=> b!1478542 (=> (not res!1004559) (not e!829401))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99312 0))(
  ( (array!99313 (arr!47935 (Array (_ BitVec 32) (_ BitVec 64))) (size!48485 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99312)

(assert (=> b!1478542 (= res!1004559 (and (= (size!48485 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48485 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48485 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478543 () Bool)

(declare-fun res!1004560 () Bool)

(assert (=> b!1478543 (=> (not res!1004560) (not e!829401))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478543 (= res!1004560 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48485 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48485 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48485 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478544 () Bool)

(declare-fun res!1004555 () Bool)

(assert (=> b!1478544 (=> (not res!1004555) (not e!829401))))

(declare-datatypes ((List!34436 0))(
  ( (Nil!34433) (Cons!34432 (h!35800 (_ BitVec 64)) (t!49130 List!34436)) )
))
(declare-fun arrayNoDuplicates!0 (array!99312 (_ BitVec 32) List!34436) Bool)

(assert (=> b!1478544 (= res!1004555 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34433))))

(declare-fun b!1478545 () Bool)

(declare-fun res!1004546 () Bool)

(assert (=> b!1478545 (=> (not res!1004546) (not e!829401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99312 (_ BitVec 32)) Bool)

(assert (=> b!1478545 (= res!1004546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478546 () Bool)

(declare-fun e!829395 () Bool)

(declare-fun e!829403 () Bool)

(assert (=> b!1478546 (= e!829395 e!829403)))

(declare-fun res!1004557 () Bool)

(assert (=> b!1478546 (=> (not res!1004557) (not e!829403))))

(declare-datatypes ((SeekEntryResult!12175 0))(
  ( (MissingZero!12175 (index!51092 (_ BitVec 32))) (Found!12175 (index!51093 (_ BitVec 32))) (Intermediate!12175 (undefined!12987 Bool) (index!51094 (_ BitVec 32)) (x!132678 (_ BitVec 32))) (Undefined!12175) (MissingVacant!12175 (index!51095 (_ BitVec 32))) )
))
(declare-fun lt!645719 () SeekEntryResult!12175)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99312 (_ BitVec 32)) SeekEntryResult!12175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478546 (= res!1004557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47935 a!2862) j!93) mask!2687) (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!645719))))

(assert (=> b!1478546 (= lt!645719 (Intermediate!12175 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478547 () Bool)

(declare-fun e!829402 () Bool)

(assert (=> b!1478547 (= e!829402 (not true))))

(declare-fun e!829398 () Bool)

(assert (=> b!1478547 e!829398))

(declare-fun res!1004558 () Bool)

(assert (=> b!1478547 (=> (not res!1004558) (not e!829398))))

(declare-fun lt!645717 () SeekEntryResult!12175)

(assert (=> b!1478547 (= res!1004558 (and (= lt!645717 (Found!12175 j!93)) (or (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) (select (arr!47935 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99312 (_ BitVec 32)) SeekEntryResult!12175)

(assert (=> b!1478547 (= lt!645717 (seekEntryOrOpen!0 (select (arr!47935 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478547 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49690 0))(
  ( (Unit!49691) )
))
(declare-fun lt!645715 () Unit!49690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49690)

(assert (=> b!1478547 (= lt!645715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478548 () Bool)

(declare-fun res!1004548 () Bool)

(assert (=> b!1478548 (=> (not res!1004548) (not e!829402))))

(assert (=> b!1478548 (= res!1004548 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478549 () Bool)

(assert (=> b!1478549 (= e!829403 e!829402)))

(declare-fun res!1004556 () Bool)

(assert (=> b!1478549 (=> (not res!1004556) (not e!829402))))

(declare-fun lt!645716 () SeekEntryResult!12175)

(assert (=> b!1478549 (= res!1004556 (= lt!645716 (Intermediate!12175 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645720 () array!99312)

(declare-fun lt!645718 () (_ BitVec 64))

(assert (=> b!1478549 (= lt!645716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645718 mask!2687) lt!645718 lt!645720 mask!2687))))

(assert (=> b!1478549 (= lt!645718 (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!829399 () Bool)

(declare-fun b!1478550 () Bool)

(assert (=> b!1478550 (= e!829399 (= lt!645716 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645718 lt!645720 mask!2687)))))

(declare-fun res!1004550 () Bool)

(assert (=> start!126206 (=> (not res!1004550) (not e!829401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126206 (= res!1004550 (validMask!0 mask!2687))))

(assert (=> start!126206 e!829401))

(assert (=> start!126206 true))

(declare-fun array_inv!36963 (array!99312) Bool)

(assert (=> start!126206 (array_inv!36963 a!2862)))

(declare-fun b!1478551 () Bool)

(declare-fun res!1004552 () Bool)

(assert (=> b!1478551 (=> (not res!1004552) (not e!829402))))

(assert (=> b!1478551 (= res!1004552 e!829399)))

(declare-fun c!136518 () Bool)

(assert (=> b!1478551 (= c!136518 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478552 () Bool)

(declare-fun res!1004553 () Bool)

(assert (=> b!1478552 (=> (not res!1004553) (not e!829401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478552 (= res!1004553 (validKeyInArray!0 (select (arr!47935 a!2862) i!1006)))))

(declare-fun b!1478553 () Bool)

(assert (=> b!1478553 (= e!829401 e!829395)))

(declare-fun res!1004549 () Bool)

(assert (=> b!1478553 (=> (not res!1004549) (not e!829395))))

(assert (=> b!1478553 (= res!1004549 (= (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478553 (= lt!645720 (array!99313 (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48485 a!2862)))))

(declare-fun b!1478554 () Bool)

(declare-fun e!829396 () Bool)

(assert (=> b!1478554 (= e!829398 e!829396)))

(declare-fun res!1004547 () Bool)

(assert (=> b!1478554 (=> res!1004547 e!829396)))

(assert (=> b!1478554 (= res!1004547 (or (and (= (select (arr!47935 a!2862) index!646) (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47935 a!2862) index!646) (select (arr!47935 a!2862) j!93))) (not (= (select (arr!47935 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478555 () Bool)

(declare-fun res!1004554 () Bool)

(assert (=> b!1478555 (=> (not res!1004554) (not e!829403))))

(assert (=> b!1478555 (= res!1004554 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!645719))))

(declare-fun b!1478556 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99312 (_ BitVec 32)) SeekEntryResult!12175)

(assert (=> b!1478556 (= e!829399 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645718 lt!645720 mask!2687) (seekEntryOrOpen!0 lt!645718 lt!645720 mask!2687)))))

(declare-fun b!1478557 () Bool)

(declare-fun e!829400 () Bool)

(assert (=> b!1478557 (= e!829396 e!829400)))

(declare-fun res!1004545 () Bool)

(assert (=> b!1478557 (=> (not res!1004545) (not e!829400))))

(assert (=> b!1478557 (= res!1004545 (= lt!645717 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47935 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478558 () Bool)

(assert (=> b!1478558 (= e!829400 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478559 () Bool)

(declare-fun res!1004551 () Bool)

(assert (=> b!1478559 (=> (not res!1004551) (not e!829401))))

(assert (=> b!1478559 (= res!1004551 (validKeyInArray!0 (select (arr!47935 a!2862) j!93)))))

(assert (= (and start!126206 res!1004550) b!1478542))

(assert (= (and b!1478542 res!1004559) b!1478552))

(assert (= (and b!1478552 res!1004553) b!1478559))

(assert (= (and b!1478559 res!1004551) b!1478545))

(assert (= (and b!1478545 res!1004546) b!1478544))

(assert (= (and b!1478544 res!1004555) b!1478543))

(assert (= (and b!1478543 res!1004560) b!1478553))

(assert (= (and b!1478553 res!1004549) b!1478546))

(assert (= (and b!1478546 res!1004557) b!1478555))

(assert (= (and b!1478555 res!1004554) b!1478549))

(assert (= (and b!1478549 res!1004556) b!1478551))

(assert (= (and b!1478551 c!136518) b!1478550))

(assert (= (and b!1478551 (not c!136518)) b!1478556))

(assert (= (and b!1478551 res!1004552) b!1478548))

(assert (= (and b!1478548 res!1004548) b!1478547))

(assert (= (and b!1478547 res!1004558) b!1478554))

(assert (= (and b!1478554 (not res!1004547)) b!1478557))

(assert (= (and b!1478557 res!1004545) b!1478558))

(declare-fun m!1364451 () Bool)

(assert (=> b!1478559 m!1364451))

(assert (=> b!1478559 m!1364451))

(declare-fun m!1364453 () Bool)

(assert (=> b!1478559 m!1364453))

(declare-fun m!1364455 () Bool)

(assert (=> b!1478554 m!1364455))

(declare-fun m!1364457 () Bool)

(assert (=> b!1478554 m!1364457))

(declare-fun m!1364459 () Bool)

(assert (=> b!1478554 m!1364459))

(assert (=> b!1478554 m!1364451))

(declare-fun m!1364461 () Bool)

(assert (=> b!1478550 m!1364461))

(assert (=> b!1478557 m!1364451))

(assert (=> b!1478557 m!1364451))

(declare-fun m!1364463 () Bool)

(assert (=> b!1478557 m!1364463))

(assert (=> b!1478546 m!1364451))

(assert (=> b!1478546 m!1364451))

(declare-fun m!1364465 () Bool)

(assert (=> b!1478546 m!1364465))

(assert (=> b!1478546 m!1364465))

(assert (=> b!1478546 m!1364451))

(declare-fun m!1364467 () Bool)

(assert (=> b!1478546 m!1364467))

(declare-fun m!1364469 () Bool)

(assert (=> b!1478552 m!1364469))

(assert (=> b!1478552 m!1364469))

(declare-fun m!1364471 () Bool)

(assert (=> b!1478552 m!1364471))

(declare-fun m!1364473 () Bool)

(assert (=> b!1478549 m!1364473))

(assert (=> b!1478549 m!1364473))

(declare-fun m!1364475 () Bool)

(assert (=> b!1478549 m!1364475))

(assert (=> b!1478549 m!1364457))

(declare-fun m!1364477 () Bool)

(assert (=> b!1478549 m!1364477))

(declare-fun m!1364479 () Bool)

(assert (=> b!1478545 m!1364479))

(declare-fun m!1364481 () Bool)

(assert (=> b!1478544 m!1364481))

(assert (=> b!1478553 m!1364457))

(declare-fun m!1364483 () Bool)

(assert (=> b!1478553 m!1364483))

(declare-fun m!1364485 () Bool)

(assert (=> b!1478547 m!1364485))

(declare-fun m!1364487 () Bool)

(assert (=> b!1478547 m!1364487))

(assert (=> b!1478547 m!1364451))

(declare-fun m!1364489 () Bool)

(assert (=> b!1478547 m!1364489))

(declare-fun m!1364491 () Bool)

(assert (=> b!1478547 m!1364491))

(assert (=> b!1478547 m!1364451))

(declare-fun m!1364493 () Bool)

(assert (=> start!126206 m!1364493))

(declare-fun m!1364495 () Bool)

(assert (=> start!126206 m!1364495))

(declare-fun m!1364497 () Bool)

(assert (=> b!1478556 m!1364497))

(declare-fun m!1364499 () Bool)

(assert (=> b!1478556 m!1364499))

(assert (=> b!1478555 m!1364451))

(assert (=> b!1478555 m!1364451))

(declare-fun m!1364501 () Bool)

(assert (=> b!1478555 m!1364501))

(push 1)

(assert (not b!1478546))

(assert (not b!1478544))

(assert (not b!1478559))

(assert (not b!1478556))

(assert (not b!1478545))

(assert (not b!1478550))

(assert (not b!1478547))

(assert (not b!1478555))

(assert (not b!1478549))

(assert (not b!1478557))

(assert (not b!1478552))

(assert (not start!126206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

