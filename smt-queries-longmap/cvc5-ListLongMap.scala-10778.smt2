; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126166 () Bool)

(assert start!126166)

(declare-fun b!1477462 () Bool)

(declare-fun res!1003600 () Bool)

(declare-fun e!828859 () Bool)

(assert (=> b!1477462 (=> (not res!1003600) (not e!828859))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1477462 (= res!1003600 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477463 () Bool)

(declare-fun res!1003593 () Bool)

(declare-fun e!828861 () Bool)

(assert (=> b!1477463 (=> (not res!1003593) (not e!828861))))

(declare-datatypes ((array!99272 0))(
  ( (array!99273 (arr!47915 (Array (_ BitVec 32) (_ BitVec 64))) (size!48465 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99272)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477463 (= res!1003593 (validKeyInArray!0 (select (arr!47915 a!2862) j!93)))))

(declare-fun b!1477464 () Bool)

(declare-fun res!1003596 () Bool)

(assert (=> b!1477464 (=> (not res!1003596) (not e!828861))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1477464 (= res!1003596 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48465 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48465 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48465 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477465 () Bool)

(declare-fun res!1003598 () Bool)

(assert (=> b!1477465 (=> (not res!1003598) (not e!828861))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1477465 (= res!1003598 (and (= (size!48465 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48465 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48465 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477466 () Bool)

(declare-fun e!828863 () Bool)

(assert (=> b!1477466 (= e!828861 e!828863)))

(declare-fun res!1003585 () Bool)

(assert (=> b!1477466 (=> (not res!1003585) (not e!828863))))

(assert (=> b!1477466 (= res!1003585 (= (select (store (arr!47915 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645359 () array!99272)

(assert (=> b!1477466 (= lt!645359 (array!99273 (store (arr!47915 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48465 a!2862)))))

(declare-fun b!1477467 () Bool)

(declare-fun res!1003586 () Bool)

(declare-fun e!828855 () Bool)

(assert (=> b!1477467 (=> (not res!1003586) (not e!828855))))

(declare-datatypes ((SeekEntryResult!12155 0))(
  ( (MissingZero!12155 (index!51012 (_ BitVec 32))) (Found!12155 (index!51013 (_ BitVec 32))) (Intermediate!12155 (undefined!12967 Bool) (index!51014 (_ BitVec 32)) (x!132610 (_ BitVec 32))) (Undefined!12155) (MissingVacant!12155 (index!51015 (_ BitVec 32))) )
))
(declare-fun lt!645358 () SeekEntryResult!12155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99272 (_ BitVec 32)) SeekEntryResult!12155)

(assert (=> b!1477467 (= res!1003586 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47915 a!2862) j!93) a!2862 mask!2687) lt!645358))))

(declare-fun b!1477468 () Bool)

(declare-fun res!1003594 () Bool)

(assert (=> b!1477468 (=> (not res!1003594) (not e!828861))))

(declare-datatypes ((List!34416 0))(
  ( (Nil!34413) (Cons!34412 (h!35780 (_ BitVec 64)) (t!49110 List!34416)) )
))
(declare-fun arrayNoDuplicates!0 (array!99272 (_ BitVec 32) List!34416) Bool)

(assert (=> b!1477468 (= res!1003594 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34413))))

(declare-fun b!1477469 () Bool)

(declare-fun res!1003592 () Bool)

(assert (=> b!1477469 (=> (not res!1003592) (not e!828861))))

(assert (=> b!1477469 (= res!1003592 (validKeyInArray!0 (select (arr!47915 a!2862) i!1006)))))

(declare-fun b!1477470 () Bool)

(assert (=> b!1477470 (= e!828855 e!828859)))

(declare-fun res!1003595 () Bool)

(assert (=> b!1477470 (=> (not res!1003595) (not e!828859))))

(declare-fun lt!645357 () SeekEntryResult!12155)

(assert (=> b!1477470 (= res!1003595 (= lt!645357 (Intermediate!12155 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645360 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477470 (= lt!645357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645360 mask!2687) lt!645360 lt!645359 mask!2687))))

(assert (=> b!1477470 (= lt!645360 (select (store (arr!47915 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1003589 () Bool)

(assert (=> start!126166 (=> (not res!1003589) (not e!828861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126166 (= res!1003589 (validMask!0 mask!2687))))

(assert (=> start!126166 e!828861))

(assert (=> start!126166 true))

(declare-fun array_inv!36943 (array!99272) Bool)

(assert (=> start!126166 (array_inv!36943 a!2862)))

(declare-fun b!1477471 () Bool)

(declare-fun res!1003590 () Bool)

(assert (=> b!1477471 (=> (not res!1003590) (not e!828859))))

(declare-fun e!828858 () Bool)

(assert (=> b!1477471 (= res!1003590 e!828858)))

(declare-fun c!136458 () Bool)

(assert (=> b!1477471 (= c!136458 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477472 () Bool)

(assert (=> b!1477472 (= e!828863 e!828855)))

(declare-fun res!1003587 () Bool)

(assert (=> b!1477472 (=> (not res!1003587) (not e!828855))))

(assert (=> b!1477472 (= res!1003587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47915 a!2862) j!93) mask!2687) (select (arr!47915 a!2862) j!93) a!2862 mask!2687) lt!645358))))

(assert (=> b!1477472 (= lt!645358 (Intermediate!12155 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477473 () Bool)

(assert (=> b!1477473 (= e!828859 (not true))))

(declare-fun e!828862 () Bool)

(assert (=> b!1477473 e!828862))

(declare-fun res!1003599 () Bool)

(assert (=> b!1477473 (=> (not res!1003599) (not e!828862))))

(declare-fun lt!645355 () SeekEntryResult!12155)

(assert (=> b!1477473 (= res!1003599 (and (= lt!645355 (Found!12155 j!93)) (or (= (select (arr!47915 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47915 a!2862) intermediateBeforeIndex!19) (select (arr!47915 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99272 (_ BitVec 32)) SeekEntryResult!12155)

(assert (=> b!1477473 (= lt!645355 (seekEntryOrOpen!0 (select (arr!47915 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99272 (_ BitVec 32)) Bool)

(assert (=> b!1477473 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49650 0))(
  ( (Unit!49651) )
))
(declare-fun lt!645356 () Unit!49650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49650)

(assert (=> b!1477473 (= lt!645356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477474 () Bool)

(declare-fun e!828856 () Bool)

(assert (=> b!1477474 (= e!828856 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477475 () Bool)

(declare-fun e!828857 () Bool)

(assert (=> b!1477475 (= e!828862 e!828857)))

(declare-fun res!1003591 () Bool)

(assert (=> b!1477475 (=> res!1003591 e!828857)))

(assert (=> b!1477475 (= res!1003591 (or (and (= (select (arr!47915 a!2862) index!646) (select (store (arr!47915 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47915 a!2862) index!646) (select (arr!47915 a!2862) j!93))) (not (= (select (arr!47915 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477476 () Bool)

(assert (=> b!1477476 (= e!828858 (= lt!645357 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645360 lt!645359 mask!2687)))))

(declare-fun b!1477477 () Bool)

(declare-fun res!1003597 () Bool)

(assert (=> b!1477477 (=> (not res!1003597) (not e!828861))))

(assert (=> b!1477477 (= res!1003597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477478 () Bool)

(assert (=> b!1477478 (= e!828857 e!828856)))

(declare-fun res!1003588 () Bool)

(assert (=> b!1477478 (=> (not res!1003588) (not e!828856))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99272 (_ BitVec 32)) SeekEntryResult!12155)

(assert (=> b!1477478 (= res!1003588 (= lt!645355 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47915 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477479 () Bool)

(assert (=> b!1477479 (= e!828858 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645360 lt!645359 mask!2687) (seekEntryOrOpen!0 lt!645360 lt!645359 mask!2687)))))

(assert (= (and start!126166 res!1003589) b!1477465))

(assert (= (and b!1477465 res!1003598) b!1477469))

(assert (= (and b!1477469 res!1003592) b!1477463))

(assert (= (and b!1477463 res!1003593) b!1477477))

(assert (= (and b!1477477 res!1003597) b!1477468))

(assert (= (and b!1477468 res!1003594) b!1477464))

(assert (= (and b!1477464 res!1003596) b!1477466))

(assert (= (and b!1477466 res!1003585) b!1477472))

(assert (= (and b!1477472 res!1003587) b!1477467))

(assert (= (and b!1477467 res!1003586) b!1477470))

(assert (= (and b!1477470 res!1003595) b!1477471))

(assert (= (and b!1477471 c!136458) b!1477476))

(assert (= (and b!1477471 (not c!136458)) b!1477479))

(assert (= (and b!1477471 res!1003590) b!1477462))

(assert (= (and b!1477462 res!1003600) b!1477473))

(assert (= (and b!1477473 res!1003599) b!1477475))

(assert (= (and b!1477475 (not res!1003591)) b!1477478))

(assert (= (and b!1477478 res!1003588) b!1477474))

(declare-fun m!1363411 () Bool)

(assert (=> b!1477477 m!1363411))

(declare-fun m!1363413 () Bool)

(assert (=> b!1477478 m!1363413))

(assert (=> b!1477478 m!1363413))

(declare-fun m!1363415 () Bool)

(assert (=> b!1477478 m!1363415))

(declare-fun m!1363417 () Bool)

(assert (=> b!1477466 m!1363417))

(declare-fun m!1363419 () Bool)

(assert (=> b!1477466 m!1363419))

(declare-fun m!1363421 () Bool)

(assert (=> b!1477470 m!1363421))

(assert (=> b!1477470 m!1363421))

(declare-fun m!1363423 () Bool)

(assert (=> b!1477470 m!1363423))

(assert (=> b!1477470 m!1363417))

(declare-fun m!1363425 () Bool)

(assert (=> b!1477470 m!1363425))

(declare-fun m!1363427 () Bool)

(assert (=> b!1477473 m!1363427))

(declare-fun m!1363429 () Bool)

(assert (=> b!1477473 m!1363429))

(assert (=> b!1477473 m!1363413))

(declare-fun m!1363431 () Bool)

(assert (=> b!1477473 m!1363431))

(declare-fun m!1363433 () Bool)

(assert (=> b!1477473 m!1363433))

(assert (=> b!1477473 m!1363413))

(declare-fun m!1363435 () Bool)

(assert (=> b!1477469 m!1363435))

(assert (=> b!1477469 m!1363435))

(declare-fun m!1363437 () Bool)

(assert (=> b!1477469 m!1363437))

(assert (=> b!1477463 m!1363413))

(assert (=> b!1477463 m!1363413))

(declare-fun m!1363439 () Bool)

(assert (=> b!1477463 m!1363439))

(assert (=> b!1477467 m!1363413))

(assert (=> b!1477467 m!1363413))

(declare-fun m!1363441 () Bool)

(assert (=> b!1477467 m!1363441))

(declare-fun m!1363443 () Bool)

(assert (=> b!1477476 m!1363443))

(declare-fun m!1363445 () Bool)

(assert (=> b!1477475 m!1363445))

(assert (=> b!1477475 m!1363417))

(declare-fun m!1363447 () Bool)

(assert (=> b!1477475 m!1363447))

(assert (=> b!1477475 m!1363413))

(declare-fun m!1363449 () Bool)

(assert (=> b!1477479 m!1363449))

(declare-fun m!1363451 () Bool)

(assert (=> b!1477479 m!1363451))

(assert (=> b!1477472 m!1363413))

(assert (=> b!1477472 m!1363413))

(declare-fun m!1363453 () Bool)

(assert (=> b!1477472 m!1363453))

(assert (=> b!1477472 m!1363453))

(assert (=> b!1477472 m!1363413))

(declare-fun m!1363455 () Bool)

(assert (=> b!1477472 m!1363455))

(declare-fun m!1363457 () Bool)

(assert (=> b!1477468 m!1363457))

(declare-fun m!1363459 () Bool)

(assert (=> start!126166 m!1363459))

(declare-fun m!1363461 () Bool)

(assert (=> start!126166 m!1363461))

(push 1)

