; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126904 () Bool)

(assert start!126904)

(declare-fun b!1491220 () Bool)

(declare-fun res!1014425 () Bool)

(declare-fun e!835531 () Bool)

(assert (=> b!1491220 (=> (not res!1014425) (not e!835531))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491220 (= res!1014425 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491221 () Bool)

(declare-fun res!1014424 () Bool)

(assert (=> b!1491221 (=> (not res!1014424) (not e!835531))))

(declare-fun e!835528 () Bool)

(assert (=> b!1491221 (= res!1014424 e!835528)))

(declare-fun c!137931 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491221 (= c!137931 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491222 () Bool)

(declare-fun e!835535 () Bool)

(assert (=> b!1491222 (= e!835531 (not e!835535))))

(declare-fun res!1014414 () Bool)

(assert (=> b!1491222 (=> res!1014414 e!835535)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99677 0))(
  ( (array!99678 (arr!48110 (Array (_ BitVec 32) (_ BitVec 64))) (size!48660 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99677)

(assert (=> b!1491222 (= res!1014414 (or (and (= (select (arr!48110 a!2862) index!646) (select (store (arr!48110 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48110 a!2862) index!646) (select (arr!48110 a!2862) j!93))) (= (select (arr!48110 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835533 () Bool)

(assert (=> b!1491222 e!835533))

(declare-fun res!1014418 () Bool)

(assert (=> b!1491222 (=> (not res!1014418) (not e!835533))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99677 (_ BitVec 32)) Bool)

(assert (=> b!1491222 (= res!1014418 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50040 0))(
  ( (Unit!50041) )
))
(declare-fun lt!650208 () Unit!50040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50040)

(assert (=> b!1491222 (= lt!650208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491223 () Bool)

(declare-fun res!1014413 () Bool)

(declare-fun e!835530 () Bool)

(assert (=> b!1491223 (=> (not res!1014413) (not e!835530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491223 (= res!1014413 (validKeyInArray!0 (select (arr!48110 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1491224 () Bool)

(assert (=> b!1491224 (= e!835533 (or (= (select (arr!48110 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48110 a!2862) intermediateBeforeIndex!19) (select (arr!48110 a!2862) j!93))))))

(declare-fun b!1491225 () Bool)

(declare-fun res!1014417 () Bool)

(declare-fun e!835532 () Bool)

(assert (=> b!1491225 (=> (not res!1014417) (not e!835532))))

(declare-datatypes ((SeekEntryResult!12350 0))(
  ( (MissingZero!12350 (index!51792 (_ BitVec 32))) (Found!12350 (index!51793 (_ BitVec 32))) (Intermediate!12350 (undefined!13162 Bool) (index!51794 (_ BitVec 32)) (x!133382 (_ BitVec 32))) (Undefined!12350) (MissingVacant!12350 (index!51795 (_ BitVec 32))) )
))
(declare-fun lt!650207 () SeekEntryResult!12350)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99677 (_ BitVec 32)) SeekEntryResult!12350)

(assert (=> b!1491225 (= res!1014417 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48110 a!2862) j!93) a!2862 mask!2687) lt!650207))))

(declare-fun b!1491226 () Bool)

(declare-fun res!1014415 () Bool)

(assert (=> b!1491226 (=> (not res!1014415) (not e!835530))))

(declare-datatypes ((List!34611 0))(
  ( (Nil!34608) (Cons!34607 (h!35990 (_ BitVec 64)) (t!49305 List!34611)) )
))
(declare-fun arrayNoDuplicates!0 (array!99677 (_ BitVec 32) List!34611) Bool)

(assert (=> b!1491226 (= res!1014415 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34608))))

(declare-fun b!1491227 () Bool)

(assert (=> b!1491227 (= e!835532 e!835531)))

(declare-fun res!1014416 () Bool)

(assert (=> b!1491227 (=> (not res!1014416) (not e!835531))))

(declare-fun lt!650205 () SeekEntryResult!12350)

(assert (=> b!1491227 (= res!1014416 (= lt!650205 (Intermediate!12350 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650204 () array!99677)

(declare-fun lt!650206 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491227 (= lt!650205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650206 mask!2687) lt!650206 lt!650204 mask!2687))))

(assert (=> b!1491227 (= lt!650206 (select (store (arr!48110 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491228 () Bool)

(declare-fun e!835534 () Bool)

(assert (=> b!1491228 (= e!835534 e!835532)))

(declare-fun res!1014412 () Bool)

(assert (=> b!1491228 (=> (not res!1014412) (not e!835532))))

(assert (=> b!1491228 (= res!1014412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48110 a!2862) j!93) mask!2687) (select (arr!48110 a!2862) j!93) a!2862 mask!2687) lt!650207))))

(assert (=> b!1491228 (= lt!650207 (Intermediate!12350 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491229 () Bool)

(assert (=> b!1491229 (= e!835528 (= lt!650205 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650206 lt!650204 mask!2687)))))

(declare-fun b!1491231 () Bool)

(assert (=> b!1491231 (= e!835535 true)))

(declare-fun lt!650203 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491231 (= lt!650203 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491232 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99677 (_ BitVec 32)) SeekEntryResult!12350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99677 (_ BitVec 32)) SeekEntryResult!12350)

(assert (=> b!1491232 (= e!835528 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650206 lt!650204 mask!2687) (seekEntryOrOpen!0 lt!650206 lt!650204 mask!2687)))))

(declare-fun b!1491233 () Bool)

(declare-fun res!1014421 () Bool)

(assert (=> b!1491233 (=> (not res!1014421) (not e!835530))))

(assert (=> b!1491233 (= res!1014421 (validKeyInArray!0 (select (arr!48110 a!2862) i!1006)))))

(declare-fun b!1491234 () Bool)

(declare-fun res!1014422 () Bool)

(assert (=> b!1491234 (=> (not res!1014422) (not e!835530))))

(assert (=> b!1491234 (= res!1014422 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48660 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48660 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48660 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491235 () Bool)

(declare-fun res!1014420 () Bool)

(assert (=> b!1491235 (=> (not res!1014420) (not e!835530))))

(assert (=> b!1491235 (= res!1014420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491236 () Bool)

(assert (=> b!1491236 (= e!835530 e!835534)))

(declare-fun res!1014419 () Bool)

(assert (=> b!1491236 (=> (not res!1014419) (not e!835534))))

(assert (=> b!1491236 (= res!1014419 (= (select (store (arr!48110 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491236 (= lt!650204 (array!99678 (store (arr!48110 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48660 a!2862)))))

(declare-fun b!1491237 () Bool)

(declare-fun res!1014423 () Bool)

(assert (=> b!1491237 (=> (not res!1014423) (not e!835533))))

(assert (=> b!1491237 (= res!1014423 (= (seekEntryOrOpen!0 (select (arr!48110 a!2862) j!93) a!2862 mask!2687) (Found!12350 j!93)))))

(declare-fun res!1014426 () Bool)

(assert (=> start!126904 (=> (not res!1014426) (not e!835530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126904 (= res!1014426 (validMask!0 mask!2687))))

(assert (=> start!126904 e!835530))

(assert (=> start!126904 true))

(declare-fun array_inv!37138 (array!99677) Bool)

(assert (=> start!126904 (array_inv!37138 a!2862)))

(declare-fun b!1491230 () Bool)

(declare-fun res!1014427 () Bool)

(assert (=> b!1491230 (=> (not res!1014427) (not e!835530))))

(assert (=> b!1491230 (= res!1014427 (and (= (size!48660 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48660 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48660 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126904 res!1014426) b!1491230))

(assert (= (and b!1491230 res!1014427) b!1491233))

(assert (= (and b!1491233 res!1014421) b!1491223))

(assert (= (and b!1491223 res!1014413) b!1491235))

(assert (= (and b!1491235 res!1014420) b!1491226))

(assert (= (and b!1491226 res!1014415) b!1491234))

(assert (= (and b!1491234 res!1014422) b!1491236))

(assert (= (and b!1491236 res!1014419) b!1491228))

(assert (= (and b!1491228 res!1014412) b!1491225))

(assert (= (and b!1491225 res!1014417) b!1491227))

(assert (= (and b!1491227 res!1014416) b!1491221))

(assert (= (and b!1491221 c!137931) b!1491229))

(assert (= (and b!1491221 (not c!137931)) b!1491232))

(assert (= (and b!1491221 res!1014424) b!1491220))

(assert (= (and b!1491220 res!1014425) b!1491222))

(assert (= (and b!1491222 res!1014418) b!1491237))

(assert (= (and b!1491237 res!1014423) b!1491224))

(assert (= (and b!1491222 (not res!1014414)) b!1491231))

(declare-fun m!1375351 () Bool)

(assert (=> b!1491233 m!1375351))

(assert (=> b!1491233 m!1375351))

(declare-fun m!1375353 () Bool)

(assert (=> b!1491233 m!1375353))

(declare-fun m!1375355 () Bool)

(assert (=> b!1491223 m!1375355))

(assert (=> b!1491223 m!1375355))

(declare-fun m!1375357 () Bool)

(assert (=> b!1491223 m!1375357))

(declare-fun m!1375359 () Bool)

(assert (=> b!1491227 m!1375359))

(assert (=> b!1491227 m!1375359))

(declare-fun m!1375361 () Bool)

(assert (=> b!1491227 m!1375361))

(declare-fun m!1375363 () Bool)

(assert (=> b!1491227 m!1375363))

(declare-fun m!1375365 () Bool)

(assert (=> b!1491227 m!1375365))

(declare-fun m!1375367 () Bool)

(assert (=> b!1491231 m!1375367))

(declare-fun m!1375369 () Bool)

(assert (=> start!126904 m!1375369))

(declare-fun m!1375371 () Bool)

(assert (=> start!126904 m!1375371))

(assert (=> b!1491236 m!1375363))

(declare-fun m!1375373 () Bool)

(assert (=> b!1491236 m!1375373))

(declare-fun m!1375375 () Bool)

(assert (=> b!1491222 m!1375375))

(assert (=> b!1491222 m!1375363))

(declare-fun m!1375377 () Bool)

(assert (=> b!1491222 m!1375377))

(declare-fun m!1375379 () Bool)

(assert (=> b!1491222 m!1375379))

(declare-fun m!1375381 () Bool)

(assert (=> b!1491222 m!1375381))

(assert (=> b!1491222 m!1375355))

(declare-fun m!1375383 () Bool)

(assert (=> b!1491232 m!1375383))

(declare-fun m!1375385 () Bool)

(assert (=> b!1491232 m!1375385))

(declare-fun m!1375387 () Bool)

(assert (=> b!1491226 m!1375387))

(assert (=> b!1491225 m!1375355))

(assert (=> b!1491225 m!1375355))

(declare-fun m!1375389 () Bool)

(assert (=> b!1491225 m!1375389))

(assert (=> b!1491228 m!1375355))

(assert (=> b!1491228 m!1375355))

(declare-fun m!1375391 () Bool)

(assert (=> b!1491228 m!1375391))

(assert (=> b!1491228 m!1375391))

(assert (=> b!1491228 m!1375355))

(declare-fun m!1375393 () Bool)

(assert (=> b!1491228 m!1375393))

(assert (=> b!1491237 m!1375355))

(assert (=> b!1491237 m!1375355))

(declare-fun m!1375395 () Bool)

(assert (=> b!1491237 m!1375395))

(declare-fun m!1375397 () Bool)

(assert (=> b!1491229 m!1375397))

(declare-fun m!1375399 () Bool)

(assert (=> b!1491224 m!1375399))

(assert (=> b!1491224 m!1375355))

(declare-fun m!1375401 () Bool)

(assert (=> b!1491235 m!1375401))

(push 1)

