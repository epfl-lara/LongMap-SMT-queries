; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124586 () Bool)

(assert start!124586)

(declare-fun b!1442336 () Bool)

(declare-fun res!974580 () Bool)

(declare-fun e!812936 () Bool)

(assert (=> b!1442336 (=> (not res!974580) (not e!812936))))

(declare-fun e!812937 () Bool)

(assert (=> b!1442336 (= res!974580 e!812937)))

(declare-fun c!133395 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442336 (= c!133395 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442337 () Bool)

(declare-fun res!974575 () Bool)

(assert (=> b!1442337 (=> (not res!974575) (not e!812936))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442337 (= res!974575 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442338 () Bool)

(declare-fun e!812938 () Bool)

(assert (=> b!1442338 (= e!812938 e!812936)))

(declare-fun res!974578 () Bool)

(assert (=> b!1442338 (=> (not res!974578) (not e!812936))))

(declare-datatypes ((SeekEntryResult!11557 0))(
  ( (MissingZero!11557 (index!48620 (_ BitVec 32))) (Found!11557 (index!48621 (_ BitVec 32))) (Intermediate!11557 (undefined!12369 Bool) (index!48622 (_ BitVec 32)) (x!130326 (_ BitVec 32))) (Undefined!11557) (MissingVacant!11557 (index!48623 (_ BitVec 32))) )
))
(declare-fun lt!633532 () SeekEntryResult!11557)

(assert (=> b!1442338 (= res!974578 (= lt!633532 (Intermediate!11557 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98034 0))(
  ( (array!98035 (arr!47305 (Array (_ BitVec 32) (_ BitVec 64))) (size!47855 (_ BitVec 32))) )
))
(declare-fun lt!633533 () array!98034)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633531 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98034 (_ BitVec 32)) SeekEntryResult!11557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442338 (= lt!633532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633531 mask!2687) lt!633531 lt!633533 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!98034)

(assert (=> b!1442338 (= lt!633531 (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!812939 () Bool)

(declare-fun b!1442339 () Bool)

(assert (=> b!1442339 (= e!812939 (or (= (select (arr!47305 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47305 a!2862) intermediateBeforeIndex!19) (select (arr!47305 a!2862) j!93))))))

(declare-fun b!1442340 () Bool)

(declare-fun res!974576 () Bool)

(declare-fun e!812942 () Bool)

(assert (=> b!1442340 (=> (not res!974576) (not e!812942))))

(assert (=> b!1442340 (= res!974576 (and (= (size!47855 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47855 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47855 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442341 () Bool)

(declare-fun res!974574 () Bool)

(assert (=> b!1442341 (=> (not res!974574) (not e!812942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442341 (= res!974574 (validKeyInArray!0 (select (arr!47305 a!2862) i!1006)))))

(declare-fun b!1442342 () Bool)

(declare-fun res!974579 () Bool)

(assert (=> b!1442342 (=> (not res!974579) (not e!812942))))

(declare-datatypes ((List!33806 0))(
  ( (Nil!33803) (Cons!33802 (h!35152 (_ BitVec 64)) (t!48500 List!33806)) )
))
(declare-fun arrayNoDuplicates!0 (array!98034 (_ BitVec 32) List!33806) Bool)

(assert (=> b!1442342 (= res!974579 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33803))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1442343 () Bool)

(assert (=> b!1442343 (= e!812936 (not (or (not (= (select (arr!47305 a!2862) index!646) (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47305 a!2862) index!646) (select (arr!47305 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1442343 e!812939))

(declare-fun res!974573 () Bool)

(assert (=> b!1442343 (=> (not res!974573) (not e!812939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98034 (_ BitVec 32)) Bool)

(assert (=> b!1442343 (= res!974573 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48610 0))(
  ( (Unit!48611) )
))
(declare-fun lt!633534 () Unit!48610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48610)

(assert (=> b!1442343 (= lt!633534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!974572 () Bool)

(assert (=> start!124586 (=> (not res!974572) (not e!812942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124586 (= res!974572 (validMask!0 mask!2687))))

(assert (=> start!124586 e!812942))

(assert (=> start!124586 true))

(declare-fun array_inv!36333 (array!98034) Bool)

(assert (=> start!124586 (array_inv!36333 a!2862)))

(declare-fun b!1442344 () Bool)

(declare-fun res!974568 () Bool)

(assert (=> b!1442344 (=> (not res!974568) (not e!812939))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98034 (_ BitVec 32)) SeekEntryResult!11557)

(assert (=> b!1442344 (= res!974568 (= (seekEntryOrOpen!0 (select (arr!47305 a!2862) j!93) a!2862 mask!2687) (Found!11557 j!93)))))

(declare-fun b!1442345 () Bool)

(declare-fun res!974567 () Bool)

(assert (=> b!1442345 (=> (not res!974567) (not e!812942))))

(assert (=> b!1442345 (= res!974567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442346 () Bool)

(declare-fun res!974569 () Bool)

(assert (=> b!1442346 (=> (not res!974569) (not e!812938))))

(declare-fun lt!633530 () SeekEntryResult!11557)

(assert (=> b!1442346 (= res!974569 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47305 a!2862) j!93) a!2862 mask!2687) lt!633530))))

(declare-fun b!1442347 () Bool)

(declare-fun e!812940 () Bool)

(assert (=> b!1442347 (= e!812942 e!812940)))

(declare-fun res!974570 () Bool)

(assert (=> b!1442347 (=> (not res!974570) (not e!812940))))

(assert (=> b!1442347 (= res!974570 (= (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442347 (= lt!633533 (array!98035 (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47855 a!2862)))))

(declare-fun b!1442348 () Bool)

(declare-fun res!974571 () Bool)

(assert (=> b!1442348 (=> (not res!974571) (not e!812942))))

(assert (=> b!1442348 (= res!974571 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47855 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47855 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47855 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442349 () Bool)

(assert (=> b!1442349 (= e!812940 e!812938)))

(declare-fun res!974577 () Bool)

(assert (=> b!1442349 (=> (not res!974577) (not e!812938))))

(assert (=> b!1442349 (= res!974577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47305 a!2862) j!93) mask!2687) (select (arr!47305 a!2862) j!93) a!2862 mask!2687) lt!633530))))

(assert (=> b!1442349 (= lt!633530 (Intermediate!11557 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442350 () Bool)

(declare-fun res!974581 () Bool)

(assert (=> b!1442350 (=> (not res!974581) (not e!812942))))

(assert (=> b!1442350 (= res!974581 (validKeyInArray!0 (select (arr!47305 a!2862) j!93)))))

(declare-fun b!1442351 () Bool)

(assert (=> b!1442351 (= e!812937 (= lt!633532 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633531 lt!633533 mask!2687)))))

(declare-fun b!1442352 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98034 (_ BitVec 32)) SeekEntryResult!11557)

(assert (=> b!1442352 (= e!812937 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633531 lt!633533 mask!2687) (seekEntryOrOpen!0 lt!633531 lt!633533 mask!2687)))))

(assert (= (and start!124586 res!974572) b!1442340))

(assert (= (and b!1442340 res!974576) b!1442341))

(assert (= (and b!1442341 res!974574) b!1442350))

(assert (= (and b!1442350 res!974581) b!1442345))

(assert (= (and b!1442345 res!974567) b!1442342))

(assert (= (and b!1442342 res!974579) b!1442348))

(assert (= (and b!1442348 res!974571) b!1442347))

(assert (= (and b!1442347 res!974570) b!1442349))

(assert (= (and b!1442349 res!974577) b!1442346))

(assert (= (and b!1442346 res!974569) b!1442338))

(assert (= (and b!1442338 res!974578) b!1442336))

(assert (= (and b!1442336 c!133395) b!1442351))

(assert (= (and b!1442336 (not c!133395)) b!1442352))

(assert (= (and b!1442336 res!974580) b!1442337))

(assert (= (and b!1442337 res!974575) b!1442343))

(assert (= (and b!1442343 res!974573) b!1442344))

(assert (= (and b!1442344 res!974568) b!1442339))

(declare-fun m!1331495 () Bool)

(assert (=> b!1442344 m!1331495))

(assert (=> b!1442344 m!1331495))

(declare-fun m!1331497 () Bool)

(assert (=> b!1442344 m!1331497))

(declare-fun m!1331499 () Bool)

(assert (=> b!1442352 m!1331499))

(declare-fun m!1331501 () Bool)

(assert (=> b!1442352 m!1331501))

(assert (=> b!1442350 m!1331495))

(assert (=> b!1442350 m!1331495))

(declare-fun m!1331503 () Bool)

(assert (=> b!1442350 m!1331503))

(declare-fun m!1331505 () Bool)

(assert (=> b!1442345 m!1331505))

(declare-fun m!1331507 () Bool)

(assert (=> b!1442338 m!1331507))

(assert (=> b!1442338 m!1331507))

(declare-fun m!1331509 () Bool)

(assert (=> b!1442338 m!1331509))

(declare-fun m!1331511 () Bool)

(assert (=> b!1442338 m!1331511))

(declare-fun m!1331513 () Bool)

(assert (=> b!1442338 m!1331513))

(declare-fun m!1331515 () Bool)

(assert (=> b!1442343 m!1331515))

(assert (=> b!1442343 m!1331511))

(declare-fun m!1331517 () Bool)

(assert (=> b!1442343 m!1331517))

(declare-fun m!1331519 () Bool)

(assert (=> b!1442343 m!1331519))

(declare-fun m!1331521 () Bool)

(assert (=> b!1442343 m!1331521))

(assert (=> b!1442343 m!1331495))

(declare-fun m!1331523 () Bool)

(assert (=> b!1442339 m!1331523))

(assert (=> b!1442339 m!1331495))

(declare-fun m!1331525 () Bool)

(assert (=> b!1442351 m!1331525))

(assert (=> b!1442349 m!1331495))

(assert (=> b!1442349 m!1331495))

(declare-fun m!1331527 () Bool)

(assert (=> b!1442349 m!1331527))

(assert (=> b!1442349 m!1331527))

(assert (=> b!1442349 m!1331495))

(declare-fun m!1331529 () Bool)

(assert (=> b!1442349 m!1331529))

(declare-fun m!1331531 () Bool)

(assert (=> start!124586 m!1331531))

(declare-fun m!1331533 () Bool)

(assert (=> start!124586 m!1331533))

(assert (=> b!1442347 m!1331511))

(declare-fun m!1331535 () Bool)

(assert (=> b!1442347 m!1331535))

(declare-fun m!1331537 () Bool)

(assert (=> b!1442341 m!1331537))

(assert (=> b!1442341 m!1331537))

(declare-fun m!1331539 () Bool)

(assert (=> b!1442341 m!1331539))

(declare-fun m!1331541 () Bool)

(assert (=> b!1442342 m!1331541))

(assert (=> b!1442346 m!1331495))

(assert (=> b!1442346 m!1331495))

(declare-fun m!1331543 () Bool)

(assert (=> b!1442346 m!1331543))

(push 1)

(assert (not b!1442349))

(assert (not b!1442344))

(assert (not start!124586))

(assert (not b!1442345))

(assert (not b!1442352))

