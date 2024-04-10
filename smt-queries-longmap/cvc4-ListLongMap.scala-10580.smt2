; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124622 () Bool)

(assert start!124622)

(declare-fun b!1443262 () Bool)

(declare-fun res!975390 () Bool)

(declare-fun e!813328 () Bool)

(assert (=> b!1443262 (=> (not res!975390) (not e!813328))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443262 (= res!975390 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443263 () Bool)

(declare-fun res!975393 () Bool)

(declare-fun e!813324 () Bool)

(assert (=> b!1443263 (=> (not res!975393) (not e!813324))))

(declare-datatypes ((SeekEntryResult!11575 0))(
  ( (MissingZero!11575 (index!48692 (_ BitVec 32))) (Found!11575 (index!48693 (_ BitVec 32))) (Intermediate!11575 (undefined!12387 Bool) (index!48694 (_ BitVec 32)) (x!130392 (_ BitVec 32))) (Undefined!11575) (MissingVacant!11575 (index!48695 (_ BitVec 32))) )
))
(declare-fun lt!633800 () SeekEntryResult!11575)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98070 0))(
  ( (array!98071 (arr!47323 (Array (_ BitVec 32) (_ BitVec 64))) (size!47873 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98070)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98070 (_ BitVec 32)) SeekEntryResult!11575)

(assert (=> b!1443263 (= res!975393 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47323 a!2862) j!93) a!2862 mask!2687) lt!633800))))

(declare-fun b!1443264 () Bool)

(declare-fun res!975394 () Bool)

(declare-fun e!813322 () Bool)

(assert (=> b!1443264 (=> (not res!975394) (not e!813322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443264 (= res!975394 (validKeyInArray!0 (select (arr!47323 a!2862) j!93)))))

(declare-fun b!1443265 () Bool)

(declare-fun res!975400 () Bool)

(assert (=> b!1443265 (=> (not res!975400) (not e!813322))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443265 (= res!975400 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47873 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47873 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47873 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443266 () Bool)

(declare-fun res!975385 () Bool)

(assert (=> b!1443266 (=> (not res!975385) (not e!813322))))

(assert (=> b!1443266 (= res!975385 (and (= (size!47873 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47873 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47873 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443267 () Bool)

(declare-fun lt!633801 () (_ BitVec 64))

(declare-fun lt!633804 () array!98070)

(declare-fun e!813326 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98070 (_ BitVec 32)) SeekEntryResult!11575)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98070 (_ BitVec 32)) SeekEntryResult!11575)

(assert (=> b!1443267 (= e!813326 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633801 lt!633804 mask!2687) (seekEntryOrOpen!0 lt!633801 lt!633804 mask!2687)))))

(declare-fun b!1443268 () Bool)

(assert (=> b!1443268 (= e!813324 e!813328)))

(declare-fun res!975399 () Bool)

(assert (=> b!1443268 (=> (not res!975399) (not e!813328))))

(declare-fun lt!633803 () SeekEntryResult!11575)

(assert (=> b!1443268 (= res!975399 (= lt!633803 (Intermediate!11575 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443268 (= lt!633803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633801 mask!2687) lt!633801 lt!633804 mask!2687))))

(assert (=> b!1443268 (= lt!633801 (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443269 () Bool)

(declare-fun res!975388 () Bool)

(assert (=> b!1443269 (=> (not res!975388) (not e!813322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98070 (_ BitVec 32)) Bool)

(assert (=> b!1443269 (= res!975388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443270 () Bool)

(declare-fun e!813325 () Bool)

(assert (=> b!1443270 (= e!813325 e!813324)))

(declare-fun res!975386 () Bool)

(assert (=> b!1443270 (=> (not res!975386) (not e!813324))))

(assert (=> b!1443270 (= res!975386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47323 a!2862) j!93) mask!2687) (select (arr!47323 a!2862) j!93) a!2862 mask!2687) lt!633800))))

(assert (=> b!1443270 (= lt!633800 (Intermediate!11575 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443272 () Bool)

(declare-fun res!975389 () Bool)

(assert (=> b!1443272 (=> (not res!975389) (not e!813322))))

(declare-datatypes ((List!33824 0))(
  ( (Nil!33821) (Cons!33820 (h!35170 (_ BitVec 64)) (t!48518 List!33824)) )
))
(declare-fun arrayNoDuplicates!0 (array!98070 (_ BitVec 32) List!33824) Bool)

(assert (=> b!1443272 (= res!975389 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33821))))

(declare-fun b!1443273 () Bool)

(assert (=> b!1443273 (= e!813322 e!813325)))

(declare-fun res!975397 () Bool)

(assert (=> b!1443273 (=> (not res!975397) (not e!813325))))

(assert (=> b!1443273 (= res!975397 (= (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443273 (= lt!633804 (array!98071 (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47873 a!2862)))))

(declare-fun b!1443274 () Bool)

(assert (=> b!1443274 (= e!813326 (= lt!633803 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633801 lt!633804 mask!2687)))))

(declare-fun b!1443275 () Bool)

(declare-fun e!813329 () Bool)

(assert (=> b!1443275 (= e!813329 (validKeyInArray!0 lt!633801))))

(declare-fun b!1443276 () Bool)

(declare-fun res!975391 () Bool)

(declare-fun e!813323 () Bool)

(assert (=> b!1443276 (=> (not res!975391) (not e!813323))))

(assert (=> b!1443276 (= res!975391 (= (seekEntryOrOpen!0 (select (arr!47323 a!2862) j!93) a!2862 mask!2687) (Found!11575 j!93)))))

(declare-fun b!1443277 () Bool)

(declare-fun res!975387 () Bool)

(assert (=> b!1443277 (=> (not res!975387) (not e!813322))))

(assert (=> b!1443277 (= res!975387 (validKeyInArray!0 (select (arr!47323 a!2862) i!1006)))))

(declare-fun b!1443271 () Bool)

(declare-fun res!975395 () Bool)

(assert (=> b!1443271 (=> (not res!975395) (not e!813328))))

(assert (=> b!1443271 (= res!975395 e!813326)))

(declare-fun c!133449 () Bool)

(assert (=> b!1443271 (= c!133449 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!975396 () Bool)

(assert (=> start!124622 (=> (not res!975396) (not e!813322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124622 (= res!975396 (validMask!0 mask!2687))))

(assert (=> start!124622 e!813322))

(assert (=> start!124622 true))

(declare-fun array_inv!36351 (array!98070) Bool)

(assert (=> start!124622 (array_inv!36351 a!2862)))

(declare-fun b!1443278 () Bool)

(assert (=> b!1443278 (= e!813328 (not e!813329))))

(declare-fun res!975392 () Bool)

(assert (=> b!1443278 (=> res!975392 e!813329)))

(assert (=> b!1443278 (= res!975392 (or (not (= (select (arr!47323 a!2862) index!646) (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47323 a!2862) index!646) (select (arr!47323 a!2862) j!93))) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1443278 e!813323))

(declare-fun res!975398 () Bool)

(assert (=> b!1443278 (=> (not res!975398) (not e!813323))))

(assert (=> b!1443278 (= res!975398 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48646 0))(
  ( (Unit!48647) )
))
(declare-fun lt!633802 () Unit!48646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48646)

(assert (=> b!1443278 (= lt!633802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443279 () Bool)

(assert (=> b!1443279 (= e!813323 (or (= (select (arr!47323 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47323 a!2862) intermediateBeforeIndex!19) (select (arr!47323 a!2862) j!93))))))

(assert (= (and start!124622 res!975396) b!1443266))

(assert (= (and b!1443266 res!975385) b!1443277))

(assert (= (and b!1443277 res!975387) b!1443264))

(assert (= (and b!1443264 res!975394) b!1443269))

(assert (= (and b!1443269 res!975388) b!1443272))

(assert (= (and b!1443272 res!975389) b!1443265))

(assert (= (and b!1443265 res!975400) b!1443273))

(assert (= (and b!1443273 res!975397) b!1443270))

(assert (= (and b!1443270 res!975386) b!1443263))

(assert (= (and b!1443263 res!975393) b!1443268))

(assert (= (and b!1443268 res!975399) b!1443271))

(assert (= (and b!1443271 c!133449) b!1443274))

(assert (= (and b!1443271 (not c!133449)) b!1443267))

(assert (= (and b!1443271 res!975395) b!1443262))

(assert (= (and b!1443262 res!975390) b!1443278))

(assert (= (and b!1443278 res!975398) b!1443276))

(assert (= (and b!1443276 res!975391) b!1443279))

(assert (= (and b!1443278 (not res!975392)) b!1443275))

(declare-fun m!1332351 () Bool)

(assert (=> b!1443277 m!1332351))

(assert (=> b!1443277 m!1332351))

(declare-fun m!1332353 () Bool)

(assert (=> b!1443277 m!1332353))

(declare-fun m!1332355 () Bool)

(assert (=> b!1443272 m!1332355))

(declare-fun m!1332357 () Bool)

(assert (=> b!1443278 m!1332357))

(declare-fun m!1332359 () Bool)

(assert (=> b!1443278 m!1332359))

(declare-fun m!1332361 () Bool)

(assert (=> b!1443278 m!1332361))

(declare-fun m!1332363 () Bool)

(assert (=> b!1443278 m!1332363))

(declare-fun m!1332365 () Bool)

(assert (=> b!1443278 m!1332365))

(declare-fun m!1332367 () Bool)

(assert (=> b!1443278 m!1332367))

(declare-fun m!1332369 () Bool)

(assert (=> b!1443268 m!1332369))

(assert (=> b!1443268 m!1332369))

(declare-fun m!1332371 () Bool)

(assert (=> b!1443268 m!1332371))

(assert (=> b!1443268 m!1332359))

(declare-fun m!1332373 () Bool)

(assert (=> b!1443268 m!1332373))

(assert (=> b!1443273 m!1332359))

(declare-fun m!1332375 () Bool)

(assert (=> b!1443273 m!1332375))

(assert (=> b!1443264 m!1332367))

(assert (=> b!1443264 m!1332367))

(declare-fun m!1332377 () Bool)

(assert (=> b!1443264 m!1332377))

(declare-fun m!1332379 () Bool)

(assert (=> b!1443275 m!1332379))

(declare-fun m!1332381 () Bool)

(assert (=> b!1443274 m!1332381))

(assert (=> b!1443276 m!1332367))

(assert (=> b!1443276 m!1332367))

(declare-fun m!1332383 () Bool)

(assert (=> b!1443276 m!1332383))

(declare-fun m!1332385 () Bool)

(assert (=> start!124622 m!1332385))

(declare-fun m!1332387 () Bool)

(assert (=> start!124622 m!1332387))

(declare-fun m!1332389 () Bool)

(assert (=> b!1443269 m!1332389))

(assert (=> b!1443270 m!1332367))

(assert (=> b!1443270 m!1332367))

(declare-fun m!1332391 () Bool)

(assert (=> b!1443270 m!1332391))

(assert (=> b!1443270 m!1332391))

(assert (=> b!1443270 m!1332367))

(declare-fun m!1332393 () Bool)

(assert (=> b!1443270 m!1332393))

(declare-fun m!1332395 () Bool)

(assert (=> b!1443279 m!1332395))

(assert (=> b!1443279 m!1332367))

(assert (=> b!1443263 m!1332367))

(assert (=> b!1443263 m!1332367))

(declare-fun m!1332397 () Bool)

(assert (=> b!1443263 m!1332397))

(declare-fun m!1332399 () Bool)

(assert (=> b!1443267 m!1332399))

(declare-fun m!1332401 () Bool)

(assert (=> b!1443267 m!1332401))

(push 1)

