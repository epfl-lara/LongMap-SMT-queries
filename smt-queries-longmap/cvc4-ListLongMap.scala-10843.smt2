; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126908 () Bool)

(assert start!126908)

(declare-fun b!1491328 () Bool)

(declare-fun res!1014508 () Bool)

(declare-fun e!835579 () Bool)

(assert (=> b!1491328 (=> (not res!1014508) (not e!835579))))

(declare-datatypes ((array!99681 0))(
  ( (array!99682 (arr!48112 (Array (_ BitVec 32) (_ BitVec 64))) (size!48662 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99681)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491328 (= res!1014508 (validKeyInArray!0 (select (arr!48112 a!2862) j!93)))))

(declare-fun b!1491329 () Bool)

(declare-fun res!1014509 () Bool)

(assert (=> b!1491329 (=> (not res!1014509) (not e!835579))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491329 (= res!1014509 (and (= (size!48662 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48662 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48662 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491330 () Bool)

(declare-fun res!1014511 () Bool)

(assert (=> b!1491330 (=> (not res!1014511) (not e!835579))))

(declare-datatypes ((List!34613 0))(
  ( (Nil!34610) (Cons!34609 (h!35992 (_ BitVec 64)) (t!49307 List!34613)) )
))
(declare-fun arrayNoDuplicates!0 (array!99681 (_ BitVec 32) List!34613) Bool)

(assert (=> b!1491330 (= res!1014511 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34610))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1491331 () Bool)

(declare-fun lt!650244 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12352 0))(
  ( (MissingZero!12352 (index!51800 (_ BitVec 32))) (Found!12352 (index!51801 (_ BitVec 32))) (Intermediate!12352 (undefined!13164 Bool) (index!51802 (_ BitVec 32)) (x!133384 (_ BitVec 32))) (Undefined!12352) (MissingVacant!12352 (index!51803 (_ BitVec 32))) )
))
(declare-fun lt!650241 () SeekEntryResult!12352)

(declare-fun lt!650240 () array!99681)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!835580 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99681 (_ BitVec 32)) SeekEntryResult!12352)

(assert (=> b!1491331 (= e!835580 (= lt!650241 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650244 lt!650240 mask!2687)))))

(declare-fun b!1491332 () Bool)

(declare-fun res!1014521 () Bool)

(assert (=> b!1491332 (=> (not res!1014521) (not e!835579))))

(assert (=> b!1491332 (= res!1014521 (validKeyInArray!0 (select (arr!48112 a!2862) i!1006)))))

(declare-fun b!1491333 () Bool)

(declare-fun res!1014515 () Bool)

(declare-fun e!835583 () Bool)

(assert (=> b!1491333 (=> (not res!1014515) (not e!835583))))

(assert (=> b!1491333 (= res!1014515 e!835580)))

(declare-fun c!137937 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491333 (= c!137937 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491335 () Bool)

(declare-fun e!835581 () Bool)

(assert (=> b!1491335 (= e!835583 (not e!835581))))

(declare-fun res!1014518 () Bool)

(assert (=> b!1491335 (=> res!1014518 e!835581)))

(assert (=> b!1491335 (= res!1014518 (or (and (= (select (arr!48112 a!2862) index!646) (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48112 a!2862) index!646) (select (arr!48112 a!2862) j!93))) (= (select (arr!48112 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835582 () Bool)

(assert (=> b!1491335 e!835582))

(declare-fun res!1014513 () Bool)

(assert (=> b!1491335 (=> (not res!1014513) (not e!835582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99681 (_ BitVec 32)) Bool)

(assert (=> b!1491335 (= res!1014513 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50044 0))(
  ( (Unit!50045) )
))
(declare-fun lt!650243 () Unit!50044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50044)

(assert (=> b!1491335 (= lt!650243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491336 () Bool)

(declare-fun e!835578 () Bool)

(declare-fun e!835576 () Bool)

(assert (=> b!1491336 (= e!835578 e!835576)))

(declare-fun res!1014510 () Bool)

(assert (=> b!1491336 (=> (not res!1014510) (not e!835576))))

(declare-fun lt!650239 () SeekEntryResult!12352)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491336 (= res!1014510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!650239))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491336 (= lt!650239 (Intermediate!12352 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491337 () Bool)

(assert (=> b!1491337 (= e!835576 e!835583)))

(declare-fun res!1014522 () Bool)

(assert (=> b!1491337 (=> (not res!1014522) (not e!835583))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491337 (= res!1014522 (= lt!650241 (Intermediate!12352 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491337 (= lt!650241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650244 mask!2687) lt!650244 lt!650240 mask!2687))))

(assert (=> b!1491337 (= lt!650244 (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491338 () Bool)

(declare-fun res!1014517 () Bool)

(assert (=> b!1491338 (=> (not res!1014517) (not e!835576))))

(assert (=> b!1491338 (= res!1014517 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!650239))))

(declare-fun b!1491339 () Bool)

(assert (=> b!1491339 (= e!835582 (or (= (select (arr!48112 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48112 a!2862) intermediateBeforeIndex!19) (select (arr!48112 a!2862) j!93))))))

(declare-fun b!1491340 () Bool)

(declare-fun res!1014514 () Bool)

(assert (=> b!1491340 (=> (not res!1014514) (not e!835583))))

(assert (=> b!1491340 (= res!1014514 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1014520 () Bool)

(assert (=> start!126908 (=> (not res!1014520) (not e!835579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126908 (= res!1014520 (validMask!0 mask!2687))))

(assert (=> start!126908 e!835579))

(assert (=> start!126908 true))

(declare-fun array_inv!37140 (array!99681) Bool)

(assert (=> start!126908 (array_inv!37140 a!2862)))

(declare-fun b!1491334 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99681 (_ BitVec 32)) SeekEntryResult!12352)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99681 (_ BitVec 32)) SeekEntryResult!12352)

(assert (=> b!1491334 (= e!835580 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650244 lt!650240 mask!2687) (seekEntryOrOpen!0 lt!650244 lt!650240 mask!2687)))))

(declare-fun b!1491341 () Bool)

(assert (=> b!1491341 (= e!835581 true)))

(declare-fun lt!650242 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491341 (= lt!650242 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491342 () Bool)

(assert (=> b!1491342 (= e!835579 e!835578)))

(declare-fun res!1014519 () Bool)

(assert (=> b!1491342 (=> (not res!1014519) (not e!835578))))

(assert (=> b!1491342 (= res!1014519 (= (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491342 (= lt!650240 (array!99682 (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48662 a!2862)))))

(declare-fun b!1491343 () Bool)

(declare-fun res!1014512 () Bool)

(assert (=> b!1491343 (=> (not res!1014512) (not e!835582))))

(assert (=> b!1491343 (= res!1014512 (= (seekEntryOrOpen!0 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) (Found!12352 j!93)))))

(declare-fun b!1491344 () Bool)

(declare-fun res!1014523 () Bool)

(assert (=> b!1491344 (=> (not res!1014523) (not e!835579))))

(assert (=> b!1491344 (= res!1014523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491345 () Bool)

(declare-fun res!1014516 () Bool)

(assert (=> b!1491345 (=> (not res!1014516) (not e!835579))))

(assert (=> b!1491345 (= res!1014516 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48662 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48662 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48662 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126908 res!1014520) b!1491329))

(assert (= (and b!1491329 res!1014509) b!1491332))

(assert (= (and b!1491332 res!1014521) b!1491328))

(assert (= (and b!1491328 res!1014508) b!1491344))

(assert (= (and b!1491344 res!1014523) b!1491330))

(assert (= (and b!1491330 res!1014511) b!1491345))

(assert (= (and b!1491345 res!1014516) b!1491342))

(assert (= (and b!1491342 res!1014519) b!1491336))

(assert (= (and b!1491336 res!1014510) b!1491338))

(assert (= (and b!1491338 res!1014517) b!1491337))

(assert (= (and b!1491337 res!1014522) b!1491333))

(assert (= (and b!1491333 c!137937) b!1491331))

(assert (= (and b!1491333 (not c!137937)) b!1491334))

(assert (= (and b!1491333 res!1014515) b!1491340))

(assert (= (and b!1491340 res!1014514) b!1491335))

(assert (= (and b!1491335 res!1014513) b!1491343))

(assert (= (and b!1491343 res!1014512) b!1491339))

(assert (= (and b!1491335 (not res!1014518)) b!1491341))

(declare-fun m!1375455 () Bool)

(assert (=> b!1491341 m!1375455))

(declare-fun m!1375457 () Bool)

(assert (=> b!1491344 m!1375457))

(declare-fun m!1375459 () Bool)

(assert (=> b!1491342 m!1375459))

(declare-fun m!1375461 () Bool)

(assert (=> b!1491342 m!1375461))

(declare-fun m!1375463 () Bool)

(assert (=> start!126908 m!1375463))

(declare-fun m!1375465 () Bool)

(assert (=> start!126908 m!1375465))

(declare-fun m!1375467 () Bool)

(assert (=> b!1491328 m!1375467))

(assert (=> b!1491328 m!1375467))

(declare-fun m!1375469 () Bool)

(assert (=> b!1491328 m!1375469))

(declare-fun m!1375471 () Bool)

(assert (=> b!1491331 m!1375471))

(declare-fun m!1375473 () Bool)

(assert (=> b!1491334 m!1375473))

(declare-fun m!1375475 () Bool)

(assert (=> b!1491334 m!1375475))

(assert (=> b!1491338 m!1375467))

(assert (=> b!1491338 m!1375467))

(declare-fun m!1375477 () Bool)

(assert (=> b!1491338 m!1375477))

(declare-fun m!1375479 () Bool)

(assert (=> b!1491335 m!1375479))

(assert (=> b!1491335 m!1375459))

(declare-fun m!1375481 () Bool)

(assert (=> b!1491335 m!1375481))

(declare-fun m!1375483 () Bool)

(assert (=> b!1491335 m!1375483))

(declare-fun m!1375485 () Bool)

(assert (=> b!1491335 m!1375485))

(assert (=> b!1491335 m!1375467))

(declare-fun m!1375487 () Bool)

(assert (=> b!1491339 m!1375487))

(assert (=> b!1491339 m!1375467))

(declare-fun m!1375489 () Bool)

(assert (=> b!1491332 m!1375489))

(assert (=> b!1491332 m!1375489))

(declare-fun m!1375491 () Bool)

(assert (=> b!1491332 m!1375491))

(assert (=> b!1491343 m!1375467))

(assert (=> b!1491343 m!1375467))

(declare-fun m!1375493 () Bool)

(assert (=> b!1491343 m!1375493))

(declare-fun m!1375495 () Bool)

(assert (=> b!1491337 m!1375495))

(assert (=> b!1491337 m!1375495))

(declare-fun m!1375497 () Bool)

(assert (=> b!1491337 m!1375497))

(assert (=> b!1491337 m!1375459))

(declare-fun m!1375499 () Bool)

(assert (=> b!1491337 m!1375499))

(declare-fun m!1375501 () Bool)

(assert (=> b!1491330 m!1375501))

(assert (=> b!1491336 m!1375467))

(assert (=> b!1491336 m!1375467))

(declare-fun m!1375503 () Bool)

(assert (=> b!1491336 m!1375503))

(assert (=> b!1491336 m!1375503))

(assert (=> b!1491336 m!1375467))

(declare-fun m!1375505 () Bool)

(assert (=> b!1491336 m!1375505))

(push 1)

