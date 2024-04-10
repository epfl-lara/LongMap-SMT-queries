; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124624 () Bool)

(assert start!124624)

(declare-fun b!1443316 () Bool)

(declare-fun res!975441 () Bool)

(declare-fun e!813347 () Bool)

(assert (=> b!1443316 (=> (not res!975441) (not e!813347))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98072 0))(
  ( (array!98073 (arr!47324 (Array (_ BitVec 32) (_ BitVec 64))) (size!47874 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98072)

(declare-datatypes ((SeekEntryResult!11576 0))(
  ( (MissingZero!11576 (index!48696 (_ BitVec 32))) (Found!11576 (index!48697 (_ BitVec 32))) (Intermediate!11576 (undefined!12388 Bool) (index!48698 (_ BitVec 32)) (x!130401 (_ BitVec 32))) (Undefined!11576) (MissingVacant!11576 (index!48699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98072 (_ BitVec 32)) SeekEntryResult!11576)

(assert (=> b!1443316 (= res!975441 (= (seekEntryOrOpen!0 (select (arr!47324 a!2862) j!93) a!2862 mask!2687) (Found!11576 j!93)))))

(declare-fun res!975448 () Bool)

(declare-fun e!813348 () Bool)

(assert (=> start!124624 (=> (not res!975448) (not e!813348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124624 (= res!975448 (validMask!0 mask!2687))))

(assert (=> start!124624 e!813348))

(assert (=> start!124624 true))

(declare-fun array_inv!36352 (array!98072) Bool)

(assert (=> start!124624 (array_inv!36352 a!2862)))

(declare-fun b!1443317 () Bool)

(declare-fun res!975436 () Bool)

(assert (=> b!1443317 (=> (not res!975436) (not e!813348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443317 (= res!975436 (validKeyInArray!0 (select (arr!47324 a!2862) j!93)))))

(declare-fun b!1443318 () Bool)

(declare-fun e!813352 () Bool)

(declare-fun e!813349 () Bool)

(assert (=> b!1443318 (= e!813352 (not e!813349))))

(declare-fun res!975444 () Bool)

(assert (=> b!1443318 (=> res!975444 e!813349)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443318 (= res!975444 (or (not (= (select (arr!47324 a!2862) index!646) (select (store (arr!47324 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47324 a!2862) index!646) (select (arr!47324 a!2862) j!93)))))))

(assert (=> b!1443318 e!813347))

(declare-fun res!975445 () Bool)

(assert (=> b!1443318 (=> (not res!975445) (not e!813347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98072 (_ BitVec 32)) Bool)

(assert (=> b!1443318 (= res!975445 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48648 0))(
  ( (Unit!48649) )
))
(declare-fun lt!633819 () Unit!48648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48648)

(assert (=> b!1443318 (= lt!633819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633821 () array!98072)

(declare-fun lt!633822 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1443319 () Bool)

(declare-fun e!813350 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98072 (_ BitVec 32)) SeekEntryResult!11576)

(assert (=> b!1443319 (= e!813350 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633822 lt!633821 mask!2687) (seekEntryOrOpen!0 lt!633822 lt!633821 mask!2687)))))

(declare-fun b!1443320 () Bool)

(declare-fun e!813346 () Bool)

(assert (=> b!1443320 (= e!813348 e!813346)))

(declare-fun res!975447 () Bool)

(assert (=> b!1443320 (=> (not res!975447) (not e!813346))))

(assert (=> b!1443320 (= res!975447 (= (select (store (arr!47324 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443320 (= lt!633821 (array!98073 (store (arr!47324 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47874 a!2862)))))

(declare-fun b!1443321 () Bool)

(assert (=> b!1443321 (= e!813349 true)))

(declare-fun lt!633817 () SeekEntryResult!11576)

(assert (=> b!1443321 (= lt!633817 (seekEntryOrOpen!0 lt!633822 lt!633821 mask!2687))))

(declare-fun b!1443322 () Bool)

(declare-fun res!975440 () Bool)

(assert (=> b!1443322 (=> (not res!975440) (not e!813348))))

(assert (=> b!1443322 (= res!975440 (validKeyInArray!0 (select (arr!47324 a!2862) i!1006)))))

(declare-fun b!1443323 () Bool)

(declare-fun e!813353 () Bool)

(assert (=> b!1443323 (= e!813346 e!813353)))

(declare-fun res!975433 () Bool)

(assert (=> b!1443323 (=> (not res!975433) (not e!813353))))

(declare-fun lt!633820 () SeekEntryResult!11576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98072 (_ BitVec 32)) SeekEntryResult!11576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443323 (= res!975433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47324 a!2862) j!93) mask!2687) (select (arr!47324 a!2862) j!93) a!2862 mask!2687) lt!633820))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443323 (= lt!633820 (Intermediate!11576 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443324 () Bool)

(assert (=> b!1443324 (= e!813347 (or (= (select (arr!47324 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47324 a!2862) intermediateBeforeIndex!19) (select (arr!47324 a!2862) j!93))))))

(declare-fun b!1443325 () Bool)

(declare-fun res!975438 () Bool)

(assert (=> b!1443325 (=> (not res!975438) (not e!813353))))

(assert (=> b!1443325 (= res!975438 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47324 a!2862) j!93) a!2862 mask!2687) lt!633820))))

(declare-fun b!1443326 () Bool)

(declare-fun res!975442 () Bool)

(assert (=> b!1443326 (=> (not res!975442) (not e!813352))))

(assert (=> b!1443326 (= res!975442 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443327 () Bool)

(declare-fun res!975435 () Bool)

(assert (=> b!1443327 (=> (not res!975435) (not e!813352))))

(assert (=> b!1443327 (= res!975435 e!813350)))

(declare-fun c!133452 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443327 (= c!133452 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443328 () Bool)

(assert (=> b!1443328 (= e!813353 e!813352)))

(declare-fun res!975434 () Bool)

(assert (=> b!1443328 (=> (not res!975434) (not e!813352))))

(declare-fun lt!633818 () SeekEntryResult!11576)

(assert (=> b!1443328 (= res!975434 (= lt!633818 (Intermediate!11576 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443328 (= lt!633818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633822 mask!2687) lt!633822 lt!633821 mask!2687))))

(assert (=> b!1443328 (= lt!633822 (select (store (arr!47324 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443329 () Bool)

(declare-fun res!975446 () Bool)

(assert (=> b!1443329 (=> (not res!975446) (not e!813348))))

(assert (=> b!1443329 (= res!975446 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47874 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47874 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47874 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443330 () Bool)

(assert (=> b!1443330 (= e!813350 (= lt!633818 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633822 lt!633821 mask!2687)))))

(declare-fun b!1443331 () Bool)

(declare-fun res!975439 () Bool)

(assert (=> b!1443331 (=> (not res!975439) (not e!813348))))

(declare-datatypes ((List!33825 0))(
  ( (Nil!33822) (Cons!33821 (h!35171 (_ BitVec 64)) (t!48519 List!33825)) )
))
(declare-fun arrayNoDuplicates!0 (array!98072 (_ BitVec 32) List!33825) Bool)

(assert (=> b!1443331 (= res!975439 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33822))))

(declare-fun b!1443332 () Bool)

(declare-fun res!975443 () Bool)

(assert (=> b!1443332 (=> (not res!975443) (not e!813348))))

(assert (=> b!1443332 (= res!975443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443333 () Bool)

(declare-fun res!975437 () Bool)

(assert (=> b!1443333 (=> (not res!975437) (not e!813348))))

(assert (=> b!1443333 (= res!975437 (and (= (size!47874 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47874 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47874 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124624 res!975448) b!1443333))

(assert (= (and b!1443333 res!975437) b!1443322))

(assert (= (and b!1443322 res!975440) b!1443317))

(assert (= (and b!1443317 res!975436) b!1443332))

(assert (= (and b!1443332 res!975443) b!1443331))

(assert (= (and b!1443331 res!975439) b!1443329))

(assert (= (and b!1443329 res!975446) b!1443320))

(assert (= (and b!1443320 res!975447) b!1443323))

(assert (= (and b!1443323 res!975433) b!1443325))

(assert (= (and b!1443325 res!975438) b!1443328))

(assert (= (and b!1443328 res!975434) b!1443327))

(assert (= (and b!1443327 c!133452) b!1443330))

(assert (= (and b!1443327 (not c!133452)) b!1443319))

(assert (= (and b!1443327 res!975435) b!1443326))

(assert (= (and b!1443326 res!975442) b!1443318))

(assert (= (and b!1443318 res!975445) b!1443316))

(assert (= (and b!1443316 res!975441) b!1443324))

(assert (= (and b!1443318 (not res!975444)) b!1443321))

(declare-fun m!1332403 () Bool)

(assert (=> b!1443322 m!1332403))

(assert (=> b!1443322 m!1332403))

(declare-fun m!1332405 () Bool)

(assert (=> b!1443322 m!1332405))

(declare-fun m!1332407 () Bool)

(assert (=> b!1443319 m!1332407))

(declare-fun m!1332409 () Bool)

(assert (=> b!1443319 m!1332409))

(declare-fun m!1332411 () Bool)

(assert (=> b!1443320 m!1332411))

(declare-fun m!1332413 () Bool)

(assert (=> b!1443320 m!1332413))

(declare-fun m!1332415 () Bool)

(assert (=> b!1443328 m!1332415))

(assert (=> b!1443328 m!1332415))

(declare-fun m!1332417 () Bool)

(assert (=> b!1443328 m!1332417))

(assert (=> b!1443328 m!1332411))

(declare-fun m!1332419 () Bool)

(assert (=> b!1443328 m!1332419))

(declare-fun m!1332421 () Bool)

(assert (=> b!1443332 m!1332421))

(declare-fun m!1332423 () Bool)

(assert (=> b!1443318 m!1332423))

(assert (=> b!1443318 m!1332411))

(declare-fun m!1332425 () Bool)

(assert (=> b!1443318 m!1332425))

(declare-fun m!1332427 () Bool)

(assert (=> b!1443318 m!1332427))

(declare-fun m!1332429 () Bool)

(assert (=> b!1443318 m!1332429))

(declare-fun m!1332431 () Bool)

(assert (=> b!1443318 m!1332431))

(assert (=> b!1443316 m!1332431))

(assert (=> b!1443316 m!1332431))

(declare-fun m!1332433 () Bool)

(assert (=> b!1443316 m!1332433))

(declare-fun m!1332435 () Bool)

(assert (=> start!124624 m!1332435))

(declare-fun m!1332437 () Bool)

(assert (=> start!124624 m!1332437))

(assert (=> b!1443321 m!1332409))

(declare-fun m!1332439 () Bool)

(assert (=> b!1443330 m!1332439))

(assert (=> b!1443325 m!1332431))

(assert (=> b!1443325 m!1332431))

(declare-fun m!1332441 () Bool)

(assert (=> b!1443325 m!1332441))

(assert (=> b!1443317 m!1332431))

(assert (=> b!1443317 m!1332431))

(declare-fun m!1332443 () Bool)

(assert (=> b!1443317 m!1332443))

(declare-fun m!1332445 () Bool)

(assert (=> b!1443324 m!1332445))

(assert (=> b!1443324 m!1332431))

(assert (=> b!1443323 m!1332431))

(assert (=> b!1443323 m!1332431))

(declare-fun m!1332447 () Bool)

(assert (=> b!1443323 m!1332447))

(assert (=> b!1443323 m!1332447))

(assert (=> b!1443323 m!1332431))

(declare-fun m!1332449 () Bool)

(assert (=> b!1443323 m!1332449))

(declare-fun m!1332451 () Bool)

(assert (=> b!1443331 m!1332451))

(push 1)

