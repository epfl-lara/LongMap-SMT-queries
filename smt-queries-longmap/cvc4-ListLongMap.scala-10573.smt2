; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124580 () Bool)

(assert start!124580)

(declare-fun b!1442183 () Bool)

(declare-fun res!974444 () Bool)

(declare-fun e!812876 () Bool)

(assert (=> b!1442183 (=> (not res!974444) (not e!812876))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98028 0))(
  ( (array!98029 (arr!47302 (Array (_ BitVec 32) (_ BitVec 64))) (size!47852 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98028)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442183 (= res!974444 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47852 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47852 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47852 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442184 () Bool)

(declare-fun res!974437 () Bool)

(declare-fun e!812878 () Bool)

(assert (=> b!1442184 (=> (not res!974437) (not e!812878))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11554 0))(
  ( (MissingZero!11554 (index!48608 (_ BitVec 32))) (Found!11554 (index!48609 (_ BitVec 32))) (Intermediate!11554 (undefined!12366 Bool) (index!48610 (_ BitVec 32)) (x!130315 (_ BitVec 32))) (Undefined!11554) (MissingVacant!11554 (index!48611 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98028 (_ BitVec 32)) SeekEntryResult!11554)

(assert (=> b!1442184 (= res!974437 (= (seekEntryOrOpen!0 (select (arr!47302 a!2862) j!93) a!2862 mask!2687) (Found!11554 j!93)))))

(declare-fun b!1442185 () Bool)

(declare-fun e!812874 () Bool)

(assert (=> b!1442185 (= e!812874 (not true))))

(assert (=> b!1442185 e!812878))

(declare-fun res!974438 () Bool)

(assert (=> b!1442185 (=> (not res!974438) (not e!812878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98028 (_ BitVec 32)) Bool)

(assert (=> b!1442185 (= res!974438 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48604 0))(
  ( (Unit!48605) )
))
(declare-fun lt!633487 () Unit!48604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48604)

(assert (=> b!1442185 (= lt!633487 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442186 () Bool)

(declare-fun res!974445 () Bool)

(declare-fun e!812877 () Bool)

(assert (=> b!1442186 (=> (not res!974445) (not e!812877))))

(declare-fun lt!633486 () SeekEntryResult!11554)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98028 (_ BitVec 32)) SeekEntryResult!11554)

(assert (=> b!1442186 (= res!974445 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47302 a!2862) j!93) a!2862 mask!2687) lt!633486))))

(declare-fun b!1442187 () Bool)

(declare-fun res!974436 () Bool)

(assert (=> b!1442187 (=> (not res!974436) (not e!812876))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442187 (= res!974436 (and (= (size!47852 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47852 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47852 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442188 () Bool)

(declare-fun res!974433 () Bool)

(assert (=> b!1442188 (=> (not res!974433) (not e!812874))))

(assert (=> b!1442188 (= res!974433 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!633485 () array!98028)

(declare-fun e!812879 () Bool)

(declare-fun lt!633488 () (_ BitVec 64))

(declare-fun lt!633489 () SeekEntryResult!11554)

(declare-fun b!1442190 () Bool)

(assert (=> b!1442190 (= e!812879 (= lt!633489 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633488 lt!633485 mask!2687)))))

(declare-fun b!1442191 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98028 (_ BitVec 32)) SeekEntryResult!11554)

(assert (=> b!1442191 (= e!812879 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633488 lt!633485 mask!2687) (seekEntryOrOpen!0 lt!633488 lt!633485 mask!2687)))))

(declare-fun b!1442192 () Bool)

(declare-fun res!974443 () Bool)

(assert (=> b!1442192 (=> (not res!974443) (not e!812876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442192 (= res!974443 (validKeyInArray!0 (select (arr!47302 a!2862) i!1006)))))

(declare-fun b!1442193 () Bool)

(declare-fun res!974442 () Bool)

(assert (=> b!1442193 (=> (not res!974442) (not e!812874))))

(assert (=> b!1442193 (= res!974442 e!812879)))

(declare-fun c!133386 () Bool)

(assert (=> b!1442193 (= c!133386 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442194 () Bool)

(declare-fun e!812875 () Bool)

(assert (=> b!1442194 (= e!812876 e!812875)))

(declare-fun res!974432 () Bool)

(assert (=> b!1442194 (=> (not res!974432) (not e!812875))))

(assert (=> b!1442194 (= res!974432 (= (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442194 (= lt!633485 (array!98029 (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47852 a!2862)))))

(declare-fun b!1442195 () Bool)

(assert (=> b!1442195 (= e!812875 e!812877)))

(declare-fun res!974441 () Bool)

(assert (=> b!1442195 (=> (not res!974441) (not e!812877))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442195 (= res!974441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47302 a!2862) j!93) mask!2687) (select (arr!47302 a!2862) j!93) a!2862 mask!2687) lt!633486))))

(assert (=> b!1442195 (= lt!633486 (Intermediate!11554 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!974440 () Bool)

(assert (=> start!124580 (=> (not res!974440) (not e!812876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124580 (= res!974440 (validMask!0 mask!2687))))

(assert (=> start!124580 e!812876))

(assert (=> start!124580 true))

(declare-fun array_inv!36330 (array!98028) Bool)

(assert (=> start!124580 (array_inv!36330 a!2862)))

(declare-fun b!1442189 () Bool)

(declare-fun res!974434 () Bool)

(assert (=> b!1442189 (=> (not res!974434) (not e!812876))))

(assert (=> b!1442189 (= res!974434 (validKeyInArray!0 (select (arr!47302 a!2862) j!93)))))

(declare-fun b!1442196 () Bool)

(declare-fun res!974439 () Bool)

(assert (=> b!1442196 (=> (not res!974439) (not e!812876))))

(declare-datatypes ((List!33803 0))(
  ( (Nil!33800) (Cons!33799 (h!35149 (_ BitVec 64)) (t!48497 List!33803)) )
))
(declare-fun arrayNoDuplicates!0 (array!98028 (_ BitVec 32) List!33803) Bool)

(assert (=> b!1442196 (= res!974439 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33800))))

(declare-fun b!1442197 () Bool)

(assert (=> b!1442197 (= e!812878 (or (= (select (arr!47302 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47302 a!2862) intermediateBeforeIndex!19) (select (arr!47302 a!2862) j!93))))))

(declare-fun b!1442198 () Bool)

(declare-fun res!974446 () Bool)

(assert (=> b!1442198 (=> (not res!974446) (not e!812876))))

(assert (=> b!1442198 (= res!974446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442199 () Bool)

(assert (=> b!1442199 (= e!812877 e!812874)))

(declare-fun res!974435 () Bool)

(assert (=> b!1442199 (=> (not res!974435) (not e!812874))))

(assert (=> b!1442199 (= res!974435 (= lt!633489 (Intermediate!11554 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442199 (= lt!633489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633488 mask!2687) lt!633488 lt!633485 mask!2687))))

(assert (=> b!1442199 (= lt!633488 (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124580 res!974440) b!1442187))

(assert (= (and b!1442187 res!974436) b!1442192))

(assert (= (and b!1442192 res!974443) b!1442189))

(assert (= (and b!1442189 res!974434) b!1442198))

(assert (= (and b!1442198 res!974446) b!1442196))

(assert (= (and b!1442196 res!974439) b!1442183))

(assert (= (and b!1442183 res!974444) b!1442194))

(assert (= (and b!1442194 res!974432) b!1442195))

(assert (= (and b!1442195 res!974441) b!1442186))

(assert (= (and b!1442186 res!974445) b!1442199))

(assert (= (and b!1442199 res!974435) b!1442193))

(assert (= (and b!1442193 c!133386) b!1442190))

(assert (= (and b!1442193 (not c!133386)) b!1442191))

(assert (= (and b!1442193 res!974442) b!1442188))

(assert (= (and b!1442188 res!974433) b!1442185))

(assert (= (and b!1442185 res!974438) b!1442184))

(assert (= (and b!1442184 res!974437) b!1442197))

(declare-fun m!1331349 () Bool)

(assert (=> b!1442195 m!1331349))

(assert (=> b!1442195 m!1331349))

(declare-fun m!1331351 () Bool)

(assert (=> b!1442195 m!1331351))

(assert (=> b!1442195 m!1331351))

(assert (=> b!1442195 m!1331349))

(declare-fun m!1331353 () Bool)

(assert (=> b!1442195 m!1331353))

(declare-fun m!1331355 () Bool)

(assert (=> b!1442194 m!1331355))

(declare-fun m!1331357 () Bool)

(assert (=> b!1442194 m!1331357))

(declare-fun m!1331359 () Bool)

(assert (=> start!124580 m!1331359))

(declare-fun m!1331361 () Bool)

(assert (=> start!124580 m!1331361))

(declare-fun m!1331363 () Bool)

(assert (=> b!1442196 m!1331363))

(assert (=> b!1442189 m!1331349))

(assert (=> b!1442189 m!1331349))

(declare-fun m!1331365 () Bool)

(assert (=> b!1442189 m!1331365))

(declare-fun m!1331367 () Bool)

(assert (=> b!1442199 m!1331367))

(assert (=> b!1442199 m!1331367))

(declare-fun m!1331369 () Bool)

(assert (=> b!1442199 m!1331369))

(assert (=> b!1442199 m!1331355))

(declare-fun m!1331371 () Bool)

(assert (=> b!1442199 m!1331371))

(declare-fun m!1331373 () Bool)

(assert (=> b!1442197 m!1331373))

(assert (=> b!1442197 m!1331349))

(assert (=> b!1442186 m!1331349))

(assert (=> b!1442186 m!1331349))

(declare-fun m!1331375 () Bool)

(assert (=> b!1442186 m!1331375))

(declare-fun m!1331377 () Bool)

(assert (=> b!1442192 m!1331377))

(assert (=> b!1442192 m!1331377))

(declare-fun m!1331379 () Bool)

(assert (=> b!1442192 m!1331379))

(declare-fun m!1331381 () Bool)

(assert (=> b!1442198 m!1331381))

(assert (=> b!1442184 m!1331349))

(assert (=> b!1442184 m!1331349))

(declare-fun m!1331383 () Bool)

(assert (=> b!1442184 m!1331383))

(declare-fun m!1331385 () Bool)

(assert (=> b!1442185 m!1331385))

(declare-fun m!1331387 () Bool)

(assert (=> b!1442185 m!1331387))

(declare-fun m!1331389 () Bool)

(assert (=> b!1442191 m!1331389))

(declare-fun m!1331391 () Bool)

(assert (=> b!1442191 m!1331391))

(declare-fun m!1331393 () Bool)

(assert (=> b!1442190 m!1331393))

(push 1)

