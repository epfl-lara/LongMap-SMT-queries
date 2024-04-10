; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127374 () Bool)

(assert start!127374)

(declare-fun b!1497461 () Bool)

(declare-fun res!1018633 () Bool)

(declare-fun e!838578 () Bool)

(assert (=> b!1497461 (=> (not res!1018633) (not e!838578))))

(declare-datatypes ((array!99836 0))(
  ( (array!99837 (arr!48182 (Array (_ BitVec 32) (_ BitVec 64))) (size!48732 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99836)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99836 (_ BitVec 32)) Bool)

(assert (=> b!1497461 (= res!1018633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497462 () Bool)

(declare-fun e!838572 () Bool)

(assert (=> b!1497462 (= e!838572 true)))

(declare-fun lt!652453 () array!99836)

(declare-fun lt!652455 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12422 0))(
  ( (MissingZero!12422 (index!52080 (_ BitVec 32))) (Found!12422 (index!52081 (_ BitVec 32))) (Intermediate!12422 (undefined!13234 Bool) (index!52082 (_ BitVec 32)) (x!133704 (_ BitVec 32))) (Undefined!12422) (MissingVacant!12422 (index!52083 (_ BitVec 32))) )
))
(declare-fun lt!652449 () SeekEntryResult!12422)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99836 (_ BitVec 32)) SeekEntryResult!12422)

(assert (=> b!1497462 (= lt!652449 (seekEntryOrOpen!0 lt!652455 lt!652453 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!652451 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((Unit!50184 0))(
  ( (Unit!50185) )
))
(declare-fun lt!652452 () Unit!50184)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50184)

(assert (=> b!1497462 (= lt!652452 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652451 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497463 () Bool)

(declare-fun res!1018635 () Bool)

(assert (=> b!1497463 (=> res!1018635 e!838572)))

(assert (=> b!1497463 (= res!1018635 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497464 () Bool)

(declare-fun e!838573 () Bool)

(assert (=> b!1497464 (= e!838573 e!838572)))

(declare-fun res!1018623 () Bool)

(assert (=> b!1497464 (=> res!1018623 e!838572)))

(assert (=> b!1497464 (= res!1018623 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652451 #b00000000000000000000000000000000) (bvsge lt!652451 (size!48732 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497464 (= lt!652451 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497465 () Bool)

(declare-fun res!1018632 () Bool)

(assert (=> b!1497465 (=> (not res!1018632) (not e!838578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497465 (= res!1018632 (validKeyInArray!0 (select (arr!48182 a!2862) j!93)))))

(declare-fun b!1497466 () Bool)

(declare-fun res!1018619 () Bool)

(declare-fun e!838577 () Bool)

(assert (=> b!1497466 (=> (not res!1018619) (not e!838577))))

(declare-fun lt!652456 () SeekEntryResult!12422)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99836 (_ BitVec 32)) SeekEntryResult!12422)

(assert (=> b!1497466 (= res!1018619 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48182 a!2862) j!93) a!2862 mask!2687) lt!652456))))

(declare-fun b!1497467 () Bool)

(declare-fun lt!652450 () SeekEntryResult!12422)

(declare-fun e!838574 () Bool)

(assert (=> b!1497467 (= e!838574 (= lt!652450 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652455 lt!652453 mask!2687)))))

(declare-fun e!838575 () Bool)

(declare-fun b!1497468 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99836 (_ BitVec 32)) SeekEntryResult!12422)

(assert (=> b!1497468 (= e!838575 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652451 intermediateAfterIndex!19 lt!652455 lt!652453 mask!2687) (seekEntryOrOpen!0 lt!652455 lt!652453 mask!2687))))))

(declare-fun b!1497469 () Bool)

(declare-fun e!838576 () Bool)

(assert (=> b!1497469 (= e!838578 e!838576)))

(declare-fun res!1018636 () Bool)

(assert (=> b!1497469 (=> (not res!1018636) (not e!838576))))

(assert (=> b!1497469 (= res!1018636 (= (select (store (arr!48182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497469 (= lt!652453 (array!99837 (store (arr!48182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48732 a!2862)))))

(declare-fun b!1497470 () Bool)

(declare-fun res!1018631 () Bool)

(assert (=> b!1497470 (=> (not res!1018631) (not e!838578))))

(assert (=> b!1497470 (= res!1018631 (and (= (size!48732 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48732 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48732 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497471 () Bool)

(declare-fun e!838571 () Bool)

(assert (=> b!1497471 (= e!838577 e!838571)))

(declare-fun res!1018621 () Bool)

(assert (=> b!1497471 (=> (not res!1018621) (not e!838571))))

(assert (=> b!1497471 (= res!1018621 (= lt!652450 (Intermediate!12422 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497471 (= lt!652450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652455 mask!2687) lt!652455 lt!652453 mask!2687))))

(assert (=> b!1497471 (= lt!652455 (select (store (arr!48182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497472 () Bool)

(assert (=> b!1497472 (= e!838576 e!838577)))

(declare-fun res!1018628 () Bool)

(assert (=> b!1497472 (=> (not res!1018628) (not e!838577))))

(assert (=> b!1497472 (= res!1018628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48182 a!2862) j!93) mask!2687) (select (arr!48182 a!2862) j!93) a!2862 mask!2687) lt!652456))))

(assert (=> b!1497472 (= lt!652456 (Intermediate!12422 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497473 () Bool)

(declare-fun res!1018626 () Bool)

(assert (=> b!1497473 (=> (not res!1018626) (not e!838571))))

(assert (=> b!1497473 (= res!1018626 e!838574)))

(declare-fun c!138956 () Bool)

(assert (=> b!1497473 (= c!138956 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497474 () Bool)

(declare-fun res!1018634 () Bool)

(assert (=> b!1497474 (=> (not res!1018634) (not e!838578))))

(declare-datatypes ((List!34683 0))(
  ( (Nil!34680) (Cons!34679 (h!36076 (_ BitVec 64)) (t!49377 List!34683)) )
))
(declare-fun arrayNoDuplicates!0 (array!99836 (_ BitVec 32) List!34683) Bool)

(assert (=> b!1497474 (= res!1018634 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34680))))

(declare-fun b!1497475 () Bool)

(declare-fun res!1018625 () Bool)

(assert (=> b!1497475 (=> res!1018625 e!838572)))

(assert (=> b!1497475 (= res!1018625 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652451 (select (arr!48182 a!2862) j!93) a!2862 mask!2687) lt!652456)))))

(declare-fun b!1497476 () Bool)

(declare-fun res!1018622 () Bool)

(assert (=> b!1497476 (=> (not res!1018622) (not e!838578))))

(assert (=> b!1497476 (= res!1018622 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48732 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48732 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48732 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497477 () Bool)

(assert (=> b!1497477 (= e!838574 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652455 lt!652453 mask!2687) (seekEntryOrOpen!0 lt!652455 lt!652453 mask!2687)))))

(declare-fun b!1497478 () Bool)

(declare-fun res!1018630 () Bool)

(assert (=> b!1497478 (=> res!1018630 e!838572)))

(assert (=> b!1497478 (= res!1018630 e!838575)))

(declare-fun c!138955 () Bool)

(assert (=> b!1497478 (= c!138955 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497479 () Bool)

(assert (=> b!1497479 (= e!838571 (not e!838573))))

(declare-fun res!1018627 () Bool)

(assert (=> b!1497479 (=> res!1018627 e!838573)))

(assert (=> b!1497479 (= res!1018627 (or (and (= (select (arr!48182 a!2862) index!646) (select (store (arr!48182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48182 a!2862) index!646) (select (arr!48182 a!2862) j!93))) (= (select (arr!48182 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497479 (and (= lt!652449 (Found!12422 j!93)) (or (= (select (arr!48182 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48182 a!2862) intermediateBeforeIndex!19) (select (arr!48182 a!2862) j!93))))))

(assert (=> b!1497479 (= lt!652449 (seekEntryOrOpen!0 (select (arr!48182 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497479 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652454 () Unit!50184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50184)

(assert (=> b!1497479 (= lt!652454 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497480 () Bool)

(declare-fun res!1018629 () Bool)

(assert (=> b!1497480 (=> (not res!1018629) (not e!838578))))

(assert (=> b!1497480 (= res!1018629 (validKeyInArray!0 (select (arr!48182 a!2862) i!1006)))))

(declare-fun b!1497481 () Bool)

(assert (=> b!1497481 (= e!838575 (not (= lt!652450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652451 lt!652455 lt!652453 mask!2687))))))

(declare-fun res!1018624 () Bool)

(assert (=> start!127374 (=> (not res!1018624) (not e!838578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127374 (= res!1018624 (validMask!0 mask!2687))))

(assert (=> start!127374 e!838578))

(assert (=> start!127374 true))

(declare-fun array_inv!37210 (array!99836) Bool)

(assert (=> start!127374 (array_inv!37210 a!2862)))

(declare-fun b!1497482 () Bool)

(declare-fun res!1018620 () Bool)

(assert (=> b!1497482 (=> (not res!1018620) (not e!838571))))

(assert (=> b!1497482 (= res!1018620 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127374 res!1018624) b!1497470))

(assert (= (and b!1497470 res!1018631) b!1497480))

(assert (= (and b!1497480 res!1018629) b!1497465))

(assert (= (and b!1497465 res!1018632) b!1497461))

(assert (= (and b!1497461 res!1018633) b!1497474))

(assert (= (and b!1497474 res!1018634) b!1497476))

(assert (= (and b!1497476 res!1018622) b!1497469))

(assert (= (and b!1497469 res!1018636) b!1497472))

(assert (= (and b!1497472 res!1018628) b!1497466))

(assert (= (and b!1497466 res!1018619) b!1497471))

(assert (= (and b!1497471 res!1018621) b!1497473))

(assert (= (and b!1497473 c!138956) b!1497467))

(assert (= (and b!1497473 (not c!138956)) b!1497477))

(assert (= (and b!1497473 res!1018626) b!1497482))

(assert (= (and b!1497482 res!1018620) b!1497479))

(assert (= (and b!1497479 (not res!1018627)) b!1497464))

(assert (= (and b!1497464 (not res!1018623)) b!1497475))

(assert (= (and b!1497475 (not res!1018625)) b!1497478))

(assert (= (and b!1497478 c!138955) b!1497481))

(assert (= (and b!1497478 (not c!138955)) b!1497468))

(assert (= (and b!1497478 (not res!1018630)) b!1497463))

(assert (= (and b!1497463 (not res!1018635)) b!1497462))

(declare-fun m!1380535 () Bool)

(assert (=> b!1497475 m!1380535))

(assert (=> b!1497475 m!1380535))

(declare-fun m!1380537 () Bool)

(assert (=> b!1497475 m!1380537))

(declare-fun m!1380539 () Bool)

(assert (=> b!1497462 m!1380539))

(declare-fun m!1380541 () Bool)

(assert (=> b!1497462 m!1380541))

(declare-fun m!1380543 () Bool)

(assert (=> b!1497464 m!1380543))

(declare-fun m!1380545 () Bool)

(assert (=> b!1497461 m!1380545))

(declare-fun m!1380547 () Bool)

(assert (=> start!127374 m!1380547))

(declare-fun m!1380549 () Bool)

(assert (=> start!127374 m!1380549))

(declare-fun m!1380551 () Bool)

(assert (=> b!1497469 m!1380551))

(declare-fun m!1380553 () Bool)

(assert (=> b!1497469 m!1380553))

(declare-fun m!1380555 () Bool)

(assert (=> b!1497474 m!1380555))

(assert (=> b!1497466 m!1380535))

(assert (=> b!1497466 m!1380535))

(declare-fun m!1380557 () Bool)

(assert (=> b!1497466 m!1380557))

(declare-fun m!1380559 () Bool)

(assert (=> b!1497468 m!1380559))

(assert (=> b!1497468 m!1380539))

(declare-fun m!1380561 () Bool)

(assert (=> b!1497467 m!1380561))

(declare-fun m!1380563 () Bool)

(assert (=> b!1497480 m!1380563))

(assert (=> b!1497480 m!1380563))

(declare-fun m!1380565 () Bool)

(assert (=> b!1497480 m!1380565))

(declare-fun m!1380567 () Bool)

(assert (=> b!1497481 m!1380567))

(declare-fun m!1380569 () Bool)

(assert (=> b!1497479 m!1380569))

(assert (=> b!1497479 m!1380551))

(declare-fun m!1380571 () Bool)

(assert (=> b!1497479 m!1380571))

(declare-fun m!1380573 () Bool)

(assert (=> b!1497479 m!1380573))

(declare-fun m!1380575 () Bool)

(assert (=> b!1497479 m!1380575))

(assert (=> b!1497479 m!1380535))

(declare-fun m!1380577 () Bool)

(assert (=> b!1497479 m!1380577))

(declare-fun m!1380579 () Bool)

(assert (=> b!1497479 m!1380579))

(assert (=> b!1497479 m!1380535))

(declare-fun m!1380581 () Bool)

(assert (=> b!1497471 m!1380581))

(assert (=> b!1497471 m!1380581))

(declare-fun m!1380583 () Bool)

(assert (=> b!1497471 m!1380583))

(assert (=> b!1497471 m!1380551))

(declare-fun m!1380585 () Bool)

(assert (=> b!1497471 m!1380585))

(assert (=> b!1497465 m!1380535))

(assert (=> b!1497465 m!1380535))

(declare-fun m!1380587 () Bool)

(assert (=> b!1497465 m!1380587))

(assert (=> b!1497472 m!1380535))

(assert (=> b!1497472 m!1380535))

(declare-fun m!1380589 () Bool)

(assert (=> b!1497472 m!1380589))

(assert (=> b!1497472 m!1380589))

(assert (=> b!1497472 m!1380535))

(declare-fun m!1380591 () Bool)

(assert (=> b!1497472 m!1380591))

(declare-fun m!1380593 () Bool)

(assert (=> b!1497477 m!1380593))

(assert (=> b!1497477 m!1380539))

(push 1)

