; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124912 () Bool)

(assert start!124912)

(declare-fun b!1451279 () Bool)

(declare-fun res!982532 () Bool)

(declare-fun e!817157 () Bool)

(assert (=> b!1451279 (=> (not res!982532) (not e!817157))))

(declare-datatypes ((array!98360 0))(
  ( (array!98361 (arr!47468 (Array (_ BitVec 32) (_ BitVec 64))) (size!48018 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98360)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451279 (= res!982532 (validKeyInArray!0 (select (arr!47468 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1451280 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!817152 () Bool)

(assert (=> b!1451280 (= e!817152 (not (or (and (= (select (arr!47468 a!2862) index!646) (select (store (arr!47468 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47468 a!2862) index!646) (select (arr!47468 a!2862) j!93))) (= (select (arr!47468 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817151 () Bool)

(assert (=> b!1451280 e!817151))

(declare-fun res!982545 () Bool)

(assert (=> b!1451280 (=> (not res!982545) (not e!817151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98360 (_ BitVec 32)) Bool)

(assert (=> b!1451280 (= res!982545 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48936 0))(
  ( (Unit!48937) )
))
(declare-fun lt!636609 () Unit!48936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48936)

(assert (=> b!1451280 (= lt!636609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451281 () Bool)

(declare-fun res!982543 () Bool)

(assert (=> b!1451281 (=> (not res!982543) (not e!817152))))

(declare-fun e!817155 () Bool)

(assert (=> b!1451281 (= res!982543 e!817155)))

(declare-fun c!133884 () Bool)

(assert (=> b!1451281 (= c!133884 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1451282 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451282 (= e!817151 (and (or (= (select (arr!47468 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47468 a!2862) intermediateBeforeIndex!19) (select (arr!47468 a!2862) j!93))) (or (and (= (select (arr!47468 a!2862) index!646) (select (store (arr!47468 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47468 a!2862) index!646) (select (arr!47468 a!2862) j!93))) (= (select (arr!47468 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47468 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451283 () Bool)

(declare-fun e!817153 () Bool)

(assert (=> b!1451283 (= e!817157 e!817153)))

(declare-fun res!982539 () Bool)

(assert (=> b!1451283 (=> (not res!982539) (not e!817153))))

(assert (=> b!1451283 (= res!982539 (= (select (store (arr!47468 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636608 () array!98360)

(assert (=> b!1451283 (= lt!636608 (array!98361 (store (arr!47468 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48018 a!2862)))))

(declare-fun b!1451284 () Bool)

(declare-fun res!982534 () Bool)

(assert (=> b!1451284 (=> (not res!982534) (not e!817157))))

(assert (=> b!1451284 (= res!982534 (and (= (size!48018 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48018 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48018 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451285 () Bool)

(declare-fun res!982535 () Bool)

(assert (=> b!1451285 (=> (not res!982535) (not e!817157))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451285 (= res!982535 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48018 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48018 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48018 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451286 () Bool)

(declare-fun e!817156 () Bool)

(assert (=> b!1451286 (= e!817153 e!817156)))

(declare-fun res!982546 () Bool)

(assert (=> b!1451286 (=> (not res!982546) (not e!817156))))

(declare-datatypes ((SeekEntryResult!11720 0))(
  ( (MissingZero!11720 (index!49272 (_ BitVec 32))) (Found!11720 (index!49273 (_ BitVec 32))) (Intermediate!11720 (undefined!12532 Bool) (index!49274 (_ BitVec 32)) (x!130929 (_ BitVec 32))) (Undefined!11720) (MissingVacant!11720 (index!49275 (_ BitVec 32))) )
))
(declare-fun lt!636607 () SeekEntryResult!11720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98360 (_ BitVec 32)) SeekEntryResult!11720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451286 (= res!982546 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47468 a!2862) j!93) mask!2687) (select (arr!47468 a!2862) j!93) a!2862 mask!2687) lt!636607))))

(assert (=> b!1451286 (= lt!636607 (Intermediate!11720 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!636605 () (_ BitVec 64))

(declare-fun b!1451287 () Bool)

(declare-fun lt!636606 () SeekEntryResult!11720)

(assert (=> b!1451287 (= e!817155 (= lt!636606 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636605 lt!636608 mask!2687)))))

(declare-fun res!982537 () Bool)

(assert (=> start!124912 (=> (not res!982537) (not e!817157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124912 (= res!982537 (validMask!0 mask!2687))))

(assert (=> start!124912 e!817157))

(assert (=> start!124912 true))

(declare-fun array_inv!36496 (array!98360) Bool)

(assert (=> start!124912 (array_inv!36496 a!2862)))

(declare-fun b!1451288 () Bool)

(assert (=> b!1451288 (= e!817156 e!817152)))

(declare-fun res!982542 () Bool)

(assert (=> b!1451288 (=> (not res!982542) (not e!817152))))

(assert (=> b!1451288 (= res!982542 (= lt!636606 (Intermediate!11720 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451288 (= lt!636606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636605 mask!2687) lt!636605 lt!636608 mask!2687))))

(assert (=> b!1451288 (= lt!636605 (select (store (arr!47468 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451289 () Bool)

(declare-fun res!982541 () Bool)

(assert (=> b!1451289 (=> (not res!982541) (not e!817157))))

(assert (=> b!1451289 (= res!982541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451290 () Bool)

(declare-fun res!982538 () Bool)

(assert (=> b!1451290 (=> (not res!982538) (not e!817151))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98360 (_ BitVec 32)) SeekEntryResult!11720)

(assert (=> b!1451290 (= res!982538 (= (seekEntryOrOpen!0 (select (arr!47468 a!2862) j!93) a!2862 mask!2687) (Found!11720 j!93)))))

(declare-fun b!1451291 () Bool)

(declare-fun res!982540 () Bool)

(assert (=> b!1451291 (=> (not res!982540) (not e!817156))))

(assert (=> b!1451291 (= res!982540 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47468 a!2862) j!93) a!2862 mask!2687) lt!636607))))

(declare-fun b!1451292 () Bool)

(declare-fun res!982536 () Bool)

(assert (=> b!1451292 (=> (not res!982536) (not e!817157))))

(assert (=> b!1451292 (= res!982536 (validKeyInArray!0 (select (arr!47468 a!2862) j!93)))))

(declare-fun b!1451293 () Bool)

(declare-fun res!982533 () Bool)

(assert (=> b!1451293 (=> (not res!982533) (not e!817152))))

(assert (=> b!1451293 (= res!982533 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451294 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98360 (_ BitVec 32)) SeekEntryResult!11720)

(assert (=> b!1451294 (= e!817155 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636605 lt!636608 mask!2687) (seekEntryOrOpen!0 lt!636605 lt!636608 mask!2687)))))

(declare-fun b!1451295 () Bool)

(declare-fun res!982544 () Bool)

(assert (=> b!1451295 (=> (not res!982544) (not e!817157))))

(declare-datatypes ((List!33969 0))(
  ( (Nil!33966) (Cons!33965 (h!35315 (_ BitVec 64)) (t!48663 List!33969)) )
))
(declare-fun arrayNoDuplicates!0 (array!98360 (_ BitVec 32) List!33969) Bool)

(assert (=> b!1451295 (= res!982544 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33966))))

(assert (= (and start!124912 res!982537) b!1451284))

(assert (= (and b!1451284 res!982534) b!1451279))

(assert (= (and b!1451279 res!982532) b!1451292))

(assert (= (and b!1451292 res!982536) b!1451289))

(assert (= (and b!1451289 res!982541) b!1451295))

(assert (= (and b!1451295 res!982544) b!1451285))

(assert (= (and b!1451285 res!982535) b!1451283))

(assert (= (and b!1451283 res!982539) b!1451286))

(assert (= (and b!1451286 res!982546) b!1451291))

(assert (= (and b!1451291 res!982540) b!1451288))

(assert (= (and b!1451288 res!982542) b!1451281))

(assert (= (and b!1451281 c!133884) b!1451287))

(assert (= (and b!1451281 (not c!133884)) b!1451294))

(assert (= (and b!1451281 res!982543) b!1451293))

(assert (= (and b!1451293 res!982533) b!1451280))

(assert (= (and b!1451280 res!982545) b!1451290))

(assert (= (and b!1451290 res!982538) b!1451282))

(declare-fun m!1339879 () Bool)

(assert (=> b!1451287 m!1339879))

(declare-fun m!1339881 () Bool)

(assert (=> b!1451288 m!1339881))

(assert (=> b!1451288 m!1339881))

(declare-fun m!1339883 () Bool)

(assert (=> b!1451288 m!1339883))

(declare-fun m!1339885 () Bool)

(assert (=> b!1451288 m!1339885))

(declare-fun m!1339887 () Bool)

(assert (=> b!1451288 m!1339887))

(declare-fun m!1339889 () Bool)

(assert (=> b!1451290 m!1339889))

(assert (=> b!1451290 m!1339889))

(declare-fun m!1339891 () Bool)

(assert (=> b!1451290 m!1339891))

(assert (=> b!1451291 m!1339889))

(assert (=> b!1451291 m!1339889))

(declare-fun m!1339893 () Bool)

(assert (=> b!1451291 m!1339893))

(assert (=> b!1451286 m!1339889))

(assert (=> b!1451286 m!1339889))

(declare-fun m!1339895 () Bool)

(assert (=> b!1451286 m!1339895))

(assert (=> b!1451286 m!1339895))

(assert (=> b!1451286 m!1339889))

(declare-fun m!1339897 () Bool)

(assert (=> b!1451286 m!1339897))

(declare-fun m!1339899 () Bool)

(assert (=> b!1451289 m!1339899))

(declare-fun m!1339901 () Bool)

(assert (=> b!1451294 m!1339901))

(declare-fun m!1339903 () Bool)

(assert (=> b!1451294 m!1339903))

(declare-fun m!1339905 () Bool)

(assert (=> b!1451295 m!1339905))

(assert (=> b!1451283 m!1339885))

(declare-fun m!1339907 () Bool)

(assert (=> b!1451283 m!1339907))

(assert (=> b!1451292 m!1339889))

(assert (=> b!1451292 m!1339889))

(declare-fun m!1339909 () Bool)

(assert (=> b!1451292 m!1339909))

(declare-fun m!1339911 () Bool)

(assert (=> b!1451280 m!1339911))

(assert (=> b!1451280 m!1339885))

(declare-fun m!1339913 () Bool)

(assert (=> b!1451280 m!1339913))

(declare-fun m!1339915 () Bool)

(assert (=> b!1451280 m!1339915))

(declare-fun m!1339917 () Bool)

(assert (=> b!1451280 m!1339917))

(assert (=> b!1451280 m!1339889))

(declare-fun m!1339919 () Bool)

(assert (=> start!124912 m!1339919))

(declare-fun m!1339921 () Bool)

(assert (=> start!124912 m!1339921))

(assert (=> b!1451282 m!1339885))

(declare-fun m!1339923 () Bool)

(assert (=> b!1451282 m!1339923))

(assert (=> b!1451282 m!1339913))

(assert (=> b!1451282 m!1339915))

(assert (=> b!1451282 m!1339889))

(declare-fun m!1339925 () Bool)

(assert (=> b!1451279 m!1339925))

(assert (=> b!1451279 m!1339925))

(declare-fun m!1339927 () Bool)

(assert (=> b!1451279 m!1339927))

(push 1)

