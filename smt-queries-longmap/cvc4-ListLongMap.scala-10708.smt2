; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125390 () Bool)

(assert start!125390)

(declare-fun b!1466343 () Bool)

(declare-fun e!823820 () Bool)

(declare-fun e!823822 () Bool)

(assert (=> b!1466343 (= e!823820 e!823822)))

(declare-fun res!995076 () Bool)

(assert (=> b!1466343 (=> (not res!995076) (not e!823822))))

(declare-datatypes ((SeekEntryResult!11959 0))(
  ( (MissingZero!11959 (index!50228 (_ BitVec 32))) (Found!11959 (index!50229 (_ BitVec 32))) (Intermediate!11959 (undefined!12771 Bool) (index!50230 (_ BitVec 32)) (x!131800 (_ BitVec 32))) (Undefined!11959) (MissingVacant!11959 (index!50231 (_ BitVec 32))) )
))
(declare-fun lt!641722 () SeekEntryResult!11959)

(declare-datatypes ((array!98838 0))(
  ( (array!98839 (arr!47707 (Array (_ BitVec 32) (_ BitVec 64))) (size!48257 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98838)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98838 (_ BitVec 32)) SeekEntryResult!11959)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466343 (= res!995076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47707 a!2862) j!93) mask!2687) (select (arr!47707 a!2862) j!93) a!2862 mask!2687) lt!641722))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466343 (= lt!641722 (Intermediate!11959 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466344 () Bool)

(declare-fun e!823821 () Bool)

(declare-fun e!823823 () Bool)

(assert (=> b!1466344 (= e!823821 (not e!823823))))

(declare-fun res!995082 () Bool)

(assert (=> b!1466344 (=> res!995082 e!823823)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466344 (= res!995082 (or (and (= (select (arr!47707 a!2862) index!646) (select (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47707 a!2862) index!646) (select (arr!47707 a!2862) j!93))) (= (select (arr!47707 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641724 () SeekEntryResult!11959)

(assert (=> b!1466344 (and (= lt!641724 (Found!11959 j!93)) (or (= (select (arr!47707 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47707 a!2862) intermediateBeforeIndex!19) (select (arr!47707 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98838 (_ BitVec 32)) SeekEntryResult!11959)

(assert (=> b!1466344 (= lt!641724 (seekEntryOrOpen!0 (select (arr!47707 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98838 (_ BitVec 32)) Bool)

(assert (=> b!1466344 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49414 0))(
  ( (Unit!49415) )
))
(declare-fun lt!641717 () Unit!49414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49414)

(assert (=> b!1466344 (= lt!641717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!641723 () (_ BitVec 32))

(declare-fun lt!641718 () (_ BitVec 64))

(declare-fun lt!641721 () array!98838)

(declare-fun e!823816 () Bool)

(declare-fun b!1466345 () Bool)

(declare-fun lt!641719 () SeekEntryResult!11959)

(assert (=> b!1466345 (= e!823816 (not (= lt!641719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641723 lt!641718 lt!641721 mask!2687))))))

(declare-fun b!1466346 () Bool)

(declare-fun e!823819 () Bool)

(assert (=> b!1466346 (= e!823819 e!823820)))

(declare-fun res!995070 () Bool)

(assert (=> b!1466346 (=> (not res!995070) (not e!823820))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466346 (= res!995070 (= (select (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466346 (= lt!641721 (array!98839 (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48257 a!2862)))))

(declare-fun b!1466347 () Bool)

(declare-fun res!995078 () Bool)

(declare-fun e!823818 () Bool)

(assert (=> b!1466347 (=> res!995078 e!823818)))

(assert (=> b!1466347 (= res!995078 e!823816)))

(declare-fun c!135150 () Bool)

(assert (=> b!1466347 (= c!135150 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466348 () Bool)

(declare-fun res!995073 () Bool)

(assert (=> b!1466348 (=> (not res!995073) (not e!823819))))

(assert (=> b!1466348 (= res!995073 (and (= (size!48257 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48257 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48257 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466349 () Bool)

(declare-fun res!995080 () Bool)

(assert (=> b!1466349 (=> (not res!995080) (not e!823819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466349 (= res!995080 (validKeyInArray!0 (select (arr!47707 a!2862) j!93)))))

(declare-fun b!1466350 () Bool)

(assert (=> b!1466350 (= e!823823 e!823818)))

(declare-fun res!995079 () Bool)

(assert (=> b!1466350 (=> res!995079 e!823818)))

(assert (=> b!1466350 (= res!995079 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641723 #b00000000000000000000000000000000) (bvsge lt!641723 (size!48257 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466350 (= lt!641723 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466351 () Bool)

(declare-fun res!995081 () Bool)

(assert (=> b!1466351 (=> (not res!995081) (not e!823819))))

(assert (=> b!1466351 (= res!995081 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48257 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48257 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48257 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466352 () Bool)

(declare-fun res!995083 () Bool)

(assert (=> b!1466352 (=> (not res!995083) (not e!823819))))

(assert (=> b!1466352 (= res!995083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466353 () Bool)

(declare-fun res!995072 () Bool)

(assert (=> b!1466353 (=> (not res!995072) (not e!823819))))

(assert (=> b!1466353 (= res!995072 (validKeyInArray!0 (select (arr!47707 a!2862) i!1006)))))

(declare-fun b!1466354 () Bool)

(declare-fun e!823815 () Bool)

(assert (=> b!1466354 (= e!823815 (= lt!641719 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641718 lt!641721 mask!2687)))))

(declare-fun res!995067 () Bool)

(assert (=> start!125390 (=> (not res!995067) (not e!823819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125390 (= res!995067 (validMask!0 mask!2687))))

(assert (=> start!125390 e!823819))

(assert (=> start!125390 true))

(declare-fun array_inv!36735 (array!98838) Bool)

(assert (=> start!125390 (array_inv!36735 a!2862)))

(declare-fun b!1466355 () Bool)

(declare-fun res!995077 () Bool)

(assert (=> b!1466355 (=> (not res!995077) (not e!823822))))

(assert (=> b!1466355 (= res!995077 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47707 a!2862) j!93) a!2862 mask!2687) lt!641722))))

(declare-fun b!1466356 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98838 (_ BitVec 32)) SeekEntryResult!11959)

(assert (=> b!1466356 (= e!823815 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641718 lt!641721 mask!2687) (seekEntryOrOpen!0 lt!641718 lt!641721 mask!2687)))))

(declare-fun b!1466357 () Bool)

(assert (=> b!1466357 (= e!823822 e!823821)))

(declare-fun res!995074 () Bool)

(assert (=> b!1466357 (=> (not res!995074) (not e!823821))))

(assert (=> b!1466357 (= res!995074 (= lt!641719 (Intermediate!11959 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466357 (= lt!641719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641718 mask!2687) lt!641718 lt!641721 mask!2687))))

(assert (=> b!1466357 (= lt!641718 (select (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466358 () Bool)

(assert (=> b!1466358 (= e!823816 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641723 intermediateAfterIndex!19 lt!641718 lt!641721 mask!2687) (seekEntryOrOpen!0 lt!641718 lt!641721 mask!2687))))))

(declare-fun b!1466359 () Bool)

(declare-fun res!995075 () Bool)

(assert (=> b!1466359 (=> (not res!995075) (not e!823821))))

(assert (=> b!1466359 (= res!995075 e!823815)))

(declare-fun c!135149 () Bool)

(assert (=> b!1466359 (= c!135149 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466360 () Bool)

(declare-fun res!995071 () Bool)

(assert (=> b!1466360 (=> res!995071 e!823818)))

(assert (=> b!1466360 (= res!995071 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641723 (select (arr!47707 a!2862) j!93) a!2862 mask!2687) lt!641722)))))

(declare-fun b!1466361 () Bool)

(assert (=> b!1466361 (= e!823818 true)))

(assert (=> b!1466361 (= lt!641724 (seekEntryOrOpen!0 lt!641718 lt!641721 mask!2687))))

(declare-fun lt!641720 () Unit!49414)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49414)

(assert (=> b!1466361 (= lt!641720 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641723 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466362 () Bool)

(declare-fun res!995066 () Bool)

(assert (=> b!1466362 (=> (not res!995066) (not e!823819))))

(declare-datatypes ((List!34208 0))(
  ( (Nil!34205) (Cons!34204 (h!35554 (_ BitVec 64)) (t!48902 List!34208)) )
))
(declare-fun arrayNoDuplicates!0 (array!98838 (_ BitVec 32) List!34208) Bool)

(assert (=> b!1466362 (= res!995066 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34205))))

(declare-fun b!1466363 () Bool)

(declare-fun res!995069 () Bool)

(assert (=> b!1466363 (=> res!995069 e!823818)))

(assert (=> b!1466363 (= res!995069 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466364 () Bool)

(declare-fun res!995068 () Bool)

(assert (=> b!1466364 (=> (not res!995068) (not e!823821))))

(assert (=> b!1466364 (= res!995068 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125390 res!995067) b!1466348))

(assert (= (and b!1466348 res!995073) b!1466353))

(assert (= (and b!1466353 res!995072) b!1466349))

(assert (= (and b!1466349 res!995080) b!1466352))

(assert (= (and b!1466352 res!995083) b!1466362))

(assert (= (and b!1466362 res!995066) b!1466351))

(assert (= (and b!1466351 res!995081) b!1466346))

(assert (= (and b!1466346 res!995070) b!1466343))

(assert (= (and b!1466343 res!995076) b!1466355))

(assert (= (and b!1466355 res!995077) b!1466357))

(assert (= (and b!1466357 res!995074) b!1466359))

(assert (= (and b!1466359 c!135149) b!1466354))

(assert (= (and b!1466359 (not c!135149)) b!1466356))

(assert (= (and b!1466359 res!995075) b!1466364))

(assert (= (and b!1466364 res!995068) b!1466344))

(assert (= (and b!1466344 (not res!995082)) b!1466350))

(assert (= (and b!1466350 (not res!995079)) b!1466360))

(assert (= (and b!1466360 (not res!995071)) b!1466347))

(assert (= (and b!1466347 c!135150) b!1466345))

(assert (= (and b!1466347 (not c!135150)) b!1466358))

(assert (= (and b!1466347 (not res!995078)) b!1466363))

(assert (= (and b!1466363 (not res!995069)) b!1466361))

(declare-fun m!1353343 () Bool)

(assert (=> b!1466360 m!1353343))

(assert (=> b!1466360 m!1353343))

(declare-fun m!1353345 () Bool)

(assert (=> b!1466360 m!1353345))

(declare-fun m!1353347 () Bool)

(assert (=> b!1466353 m!1353347))

(assert (=> b!1466353 m!1353347))

(declare-fun m!1353349 () Bool)

(assert (=> b!1466353 m!1353349))

(declare-fun m!1353351 () Bool)

(assert (=> b!1466346 m!1353351))

(declare-fun m!1353353 () Bool)

(assert (=> b!1466346 m!1353353))

(declare-fun m!1353355 () Bool)

(assert (=> b!1466358 m!1353355))

(declare-fun m!1353357 () Bool)

(assert (=> b!1466358 m!1353357))

(assert (=> b!1466343 m!1353343))

(assert (=> b!1466343 m!1353343))

(declare-fun m!1353359 () Bool)

(assert (=> b!1466343 m!1353359))

(assert (=> b!1466343 m!1353359))

(assert (=> b!1466343 m!1353343))

(declare-fun m!1353361 () Bool)

(assert (=> b!1466343 m!1353361))

(declare-fun m!1353363 () Bool)

(assert (=> b!1466362 m!1353363))

(declare-fun m!1353365 () Bool)

(assert (=> b!1466344 m!1353365))

(assert (=> b!1466344 m!1353351))

(declare-fun m!1353367 () Bool)

(assert (=> b!1466344 m!1353367))

(declare-fun m!1353369 () Bool)

(assert (=> b!1466344 m!1353369))

(declare-fun m!1353371 () Bool)

(assert (=> b!1466344 m!1353371))

(assert (=> b!1466344 m!1353343))

(declare-fun m!1353373 () Bool)

(assert (=> b!1466344 m!1353373))

(declare-fun m!1353375 () Bool)

(assert (=> b!1466344 m!1353375))

(assert (=> b!1466344 m!1353343))

(declare-fun m!1353377 () Bool)

(assert (=> b!1466356 m!1353377))

(assert (=> b!1466356 m!1353357))

(declare-fun m!1353379 () Bool)

(assert (=> b!1466350 m!1353379))

(declare-fun m!1353381 () Bool)

(assert (=> b!1466352 m!1353381))

(declare-fun m!1353383 () Bool)

(assert (=> b!1466354 m!1353383))

(assert (=> b!1466355 m!1353343))

(assert (=> b!1466355 m!1353343))

(declare-fun m!1353385 () Bool)

(assert (=> b!1466355 m!1353385))

(assert (=> b!1466349 m!1353343))

(assert (=> b!1466349 m!1353343))

(declare-fun m!1353387 () Bool)

(assert (=> b!1466349 m!1353387))

(assert (=> b!1466361 m!1353357))

(declare-fun m!1353389 () Bool)

(assert (=> b!1466361 m!1353389))

(declare-fun m!1353391 () Bool)

(assert (=> b!1466345 m!1353391))

(declare-fun m!1353393 () Bool)

(assert (=> start!125390 m!1353393))

(declare-fun m!1353395 () Bool)

(assert (=> start!125390 m!1353395))

(declare-fun m!1353397 () Bool)

(assert (=> b!1466357 m!1353397))

(assert (=> b!1466357 m!1353397))

(declare-fun m!1353399 () Bool)

(assert (=> b!1466357 m!1353399))

(assert (=> b!1466357 m!1353351))

(declare-fun m!1353401 () Bool)

(assert (=> b!1466357 m!1353401))

(push 1)

