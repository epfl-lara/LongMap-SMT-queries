; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126862 () Bool)

(assert start!126862)

(declare-fun b!1490058 () Bool)

(declare-fun res!1013405 () Bool)

(declare-fun e!835018 () Bool)

(assert (=> b!1490058 (=> res!1013405 e!835018)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490058 (= res!1013405 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1490059 () Bool)

(assert (=> b!1490059 (= e!835018 true)))

(declare-datatypes ((SeekEntryResult!12329 0))(
  ( (MissingZero!12329 (index!51708 (_ BitVec 32))) (Found!12329 (index!51709 (_ BitVec 32))) (Intermediate!12329 (undefined!13141 Bool) (index!51710 (_ BitVec 32)) (x!133305 (_ BitVec 32))) (Undefined!12329) (MissingVacant!12329 (index!51711 (_ BitVec 32))) )
))
(declare-fun lt!649804 () SeekEntryResult!12329)

(declare-fun lt!649812 () SeekEntryResult!12329)

(assert (=> b!1490059 (= lt!649804 lt!649812)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49998 0))(
  ( (Unit!49999) )
))
(declare-fun lt!649809 () Unit!49998)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99635 0))(
  ( (array!99636 (arr!48089 (Array (_ BitVec 32) (_ BitVec 64))) (size!48639 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99635)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!649807 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49998)

(assert (=> b!1490059 (= lt!649809 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649807 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1490060 () Bool)

(declare-fun res!1013406 () Bool)

(declare-fun e!835021 () Bool)

(assert (=> b!1490060 (=> (not res!1013406) (not e!835021))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1490060 (= res!1013406 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48639 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48639 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48639 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490061 () Bool)

(declare-fun e!835023 () Bool)

(declare-fun e!835019 () Bool)

(assert (=> b!1490061 (= e!835023 (not e!835019))))

(declare-fun res!1013397 () Bool)

(assert (=> b!1490061 (=> res!1013397 e!835019)))

(assert (=> b!1490061 (= res!1013397 (or (and (= (select (arr!48089 a!2862) index!646) (select (store (arr!48089 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48089 a!2862) index!646) (select (arr!48089 a!2862) j!93))) (= (select (arr!48089 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1490061 (and (= lt!649804 (Found!12329 j!93)) (or (= (select (arr!48089 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48089 a!2862) intermediateBeforeIndex!19) (select (arr!48089 a!2862) j!93))) (let ((bdg!54770 (select (store (arr!48089 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48089 a!2862) index!646) bdg!54770) (= (select (arr!48089 a!2862) index!646) (select (arr!48089 a!2862) j!93))) (= (select (arr!48089 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54770 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99635 (_ BitVec 32)) SeekEntryResult!12329)

(assert (=> b!1490061 (= lt!649804 (seekEntryOrOpen!0 (select (arr!48089 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99635 (_ BitVec 32)) Bool)

(assert (=> b!1490061 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649805 () Unit!49998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49998)

(assert (=> b!1490061 (= lt!649805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490062 () Bool)

(declare-fun res!1013402 () Bool)

(assert (=> b!1490062 (=> (not res!1013402) (not e!835021))))

(assert (=> b!1490062 (= res!1013402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490063 () Bool)

(declare-fun lt!649806 () (_ BitVec 64))

(declare-fun lt!649808 () array!99635)

(declare-fun e!835024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99635 (_ BitVec 32)) SeekEntryResult!12329)

(assert (=> b!1490063 (= e!835024 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649806 lt!649808 mask!2687) (seekEntryOrOpen!0 lt!649806 lt!649808 mask!2687)))))

(declare-fun b!1490064 () Bool)

(declare-fun res!1013391 () Bool)

(assert (=> b!1490064 (=> (not res!1013391) (not e!835023))))

(assert (=> b!1490064 (= res!1013391 e!835024)))

(declare-fun c!137862 () Bool)

(assert (=> b!1490064 (= c!137862 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490065 () Bool)

(declare-fun res!1013400 () Bool)

(assert (=> b!1490065 (=> (not res!1013400) (not e!835021))))

(assert (=> b!1490065 (= res!1013400 (and (= (size!48639 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48639 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48639 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490066 () Bool)

(declare-fun e!835020 () Bool)

(assert (=> b!1490066 (= e!835020 e!835023)))

(declare-fun res!1013390 () Bool)

(assert (=> b!1490066 (=> (not res!1013390) (not e!835023))))

(declare-fun lt!649810 () SeekEntryResult!12329)

(assert (=> b!1490066 (= res!1013390 (= lt!649810 (Intermediate!12329 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99635 (_ BitVec 32)) SeekEntryResult!12329)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490066 (= lt!649810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649806 mask!2687) lt!649806 lt!649808 mask!2687))))

(assert (=> b!1490066 (= lt!649806 (select (store (arr!48089 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490067 () Bool)

(declare-fun res!1013399 () Bool)

(assert (=> b!1490067 (=> (not res!1013399) (not e!835021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490067 (= res!1013399 (validKeyInArray!0 (select (arr!48089 a!2862) j!93)))))

(declare-fun b!1490068 () Bool)

(declare-fun e!835022 () Bool)

(assert (=> b!1490068 (= e!835022 (not (= lt!649810 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649807 lt!649806 lt!649808 mask!2687))))))

(declare-fun b!1490069 () Bool)

(declare-fun e!835017 () Bool)

(assert (=> b!1490069 (= e!835017 e!835020)))

(declare-fun res!1013404 () Bool)

(assert (=> b!1490069 (=> (not res!1013404) (not e!835020))))

(declare-fun lt!649811 () SeekEntryResult!12329)

(assert (=> b!1490069 (= res!1013404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48089 a!2862) j!93) mask!2687) (select (arr!48089 a!2862) j!93) a!2862 mask!2687) lt!649811))))

(assert (=> b!1490069 (= lt!649811 (Intermediate!12329 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490070 () Bool)

(assert (=> b!1490070 (= e!835019 e!835018)))

(declare-fun res!1013396 () Bool)

(assert (=> b!1490070 (=> res!1013396 e!835018)))

(assert (=> b!1490070 (= res!1013396 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649807 #b00000000000000000000000000000000) (bvsge lt!649807 (size!48639 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490070 (= lt!649807 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1490070 (= lt!649812 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649806 lt!649808 mask!2687))))

(assert (=> b!1490070 (= lt!649812 (seekEntryOrOpen!0 lt!649806 lt!649808 mask!2687))))

(declare-fun b!1490071 () Bool)

(declare-fun res!1013407 () Bool)

(assert (=> b!1490071 (=> (not res!1013407) (not e!835021))))

(assert (=> b!1490071 (= res!1013407 (validKeyInArray!0 (select (arr!48089 a!2862) i!1006)))))

(declare-fun b!1490072 () Bool)

(declare-fun res!1013394 () Bool)

(assert (=> b!1490072 (=> res!1013394 e!835018)))

(assert (=> b!1490072 (= res!1013394 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649807 (select (arr!48089 a!2862) j!93) a!2862 mask!2687) lt!649811)))))

(declare-fun b!1490073 () Bool)

(declare-fun res!1013393 () Bool)

(assert (=> b!1490073 (=> (not res!1013393) (not e!835023))))

(assert (=> b!1490073 (= res!1013393 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490074 () Bool)

(assert (=> b!1490074 (= e!835021 e!835017)))

(declare-fun res!1013398 () Bool)

(assert (=> b!1490074 (=> (not res!1013398) (not e!835017))))

(assert (=> b!1490074 (= res!1013398 (= (select (store (arr!48089 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490074 (= lt!649808 (array!99636 (store (arr!48089 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48639 a!2862)))))

(declare-fun res!1013401 () Bool)

(assert (=> start!126862 (=> (not res!1013401) (not e!835021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126862 (= res!1013401 (validMask!0 mask!2687))))

(assert (=> start!126862 e!835021))

(assert (=> start!126862 true))

(declare-fun array_inv!37117 (array!99635) Bool)

(assert (=> start!126862 (array_inv!37117 a!2862)))

(declare-fun b!1490075 () Bool)

(declare-fun res!1013392 () Bool)

(assert (=> b!1490075 (=> res!1013392 e!835018)))

(assert (=> b!1490075 (= res!1013392 e!835022)))

(declare-fun c!137861 () Bool)

(assert (=> b!1490075 (= c!137861 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490076 () Bool)

(declare-fun res!1013395 () Bool)

(assert (=> b!1490076 (=> (not res!1013395) (not e!835021))))

(declare-datatypes ((List!34590 0))(
  ( (Nil!34587) (Cons!34586 (h!35969 (_ BitVec 64)) (t!49284 List!34590)) )
))
(declare-fun arrayNoDuplicates!0 (array!99635 (_ BitVec 32) List!34590) Bool)

(assert (=> b!1490076 (= res!1013395 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34587))))

(declare-fun b!1490077 () Bool)

(assert (=> b!1490077 (= e!835024 (= lt!649810 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649806 lt!649808 mask!2687)))))

(declare-fun b!1490078 () Bool)

(assert (=> b!1490078 (= e!835022 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649807 intermediateAfterIndex!19 lt!649806 lt!649808 mask!2687) lt!649812)))))

(declare-fun b!1490079 () Bool)

(declare-fun res!1013403 () Bool)

(assert (=> b!1490079 (=> (not res!1013403) (not e!835020))))

(assert (=> b!1490079 (= res!1013403 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48089 a!2862) j!93) a!2862 mask!2687) lt!649811))))

(assert (= (and start!126862 res!1013401) b!1490065))

(assert (= (and b!1490065 res!1013400) b!1490071))

(assert (= (and b!1490071 res!1013407) b!1490067))

(assert (= (and b!1490067 res!1013399) b!1490062))

(assert (= (and b!1490062 res!1013402) b!1490076))

(assert (= (and b!1490076 res!1013395) b!1490060))

(assert (= (and b!1490060 res!1013406) b!1490074))

(assert (= (and b!1490074 res!1013398) b!1490069))

(assert (= (and b!1490069 res!1013404) b!1490079))

(assert (= (and b!1490079 res!1013403) b!1490066))

(assert (= (and b!1490066 res!1013390) b!1490064))

(assert (= (and b!1490064 c!137862) b!1490077))

(assert (= (and b!1490064 (not c!137862)) b!1490063))

(assert (= (and b!1490064 res!1013391) b!1490073))

(assert (= (and b!1490073 res!1013393) b!1490061))

(assert (= (and b!1490061 (not res!1013397)) b!1490070))

(assert (= (and b!1490070 (not res!1013396)) b!1490072))

(assert (= (and b!1490072 (not res!1013394)) b!1490075))

(assert (= (and b!1490075 c!137861) b!1490068))

(assert (= (and b!1490075 (not c!137861)) b!1490078))

(assert (= (and b!1490075 (not res!1013392)) b!1490058))

(assert (= (and b!1490058 (not res!1013405)) b!1490059))

(declare-fun m!1374235 () Bool)

(assert (=> b!1490072 m!1374235))

(assert (=> b!1490072 m!1374235))

(declare-fun m!1374237 () Bool)

(assert (=> b!1490072 m!1374237))

(declare-fun m!1374239 () Bool)

(assert (=> b!1490076 m!1374239))

(declare-fun m!1374241 () Bool)

(assert (=> b!1490059 m!1374241))

(declare-fun m!1374243 () Bool)

(assert (=> b!1490070 m!1374243))

(declare-fun m!1374245 () Bool)

(assert (=> b!1490070 m!1374245))

(declare-fun m!1374247 () Bool)

(assert (=> b!1490070 m!1374247))

(declare-fun m!1374249 () Bool)

(assert (=> b!1490068 m!1374249))

(declare-fun m!1374251 () Bool)

(assert (=> b!1490062 m!1374251))

(declare-fun m!1374253 () Bool)

(assert (=> start!126862 m!1374253))

(declare-fun m!1374255 () Bool)

(assert (=> start!126862 m!1374255))

(declare-fun m!1374257 () Bool)

(assert (=> b!1490074 m!1374257))

(declare-fun m!1374259 () Bool)

(assert (=> b!1490074 m!1374259))

(assert (=> b!1490063 m!1374245))

(assert (=> b!1490063 m!1374247))

(declare-fun m!1374261 () Bool)

(assert (=> b!1490066 m!1374261))

(assert (=> b!1490066 m!1374261))

(declare-fun m!1374263 () Bool)

(assert (=> b!1490066 m!1374263))

(assert (=> b!1490066 m!1374257))

(declare-fun m!1374265 () Bool)

(assert (=> b!1490066 m!1374265))

(assert (=> b!1490069 m!1374235))

(assert (=> b!1490069 m!1374235))

(declare-fun m!1374267 () Bool)

(assert (=> b!1490069 m!1374267))

(assert (=> b!1490069 m!1374267))

(assert (=> b!1490069 m!1374235))

(declare-fun m!1374269 () Bool)

(assert (=> b!1490069 m!1374269))

(declare-fun m!1374271 () Bool)

(assert (=> b!1490071 m!1374271))

(assert (=> b!1490071 m!1374271))

(declare-fun m!1374273 () Bool)

(assert (=> b!1490071 m!1374273))

(declare-fun m!1374275 () Bool)

(assert (=> b!1490061 m!1374275))

(assert (=> b!1490061 m!1374257))

(declare-fun m!1374277 () Bool)

(assert (=> b!1490061 m!1374277))

(declare-fun m!1374279 () Bool)

(assert (=> b!1490061 m!1374279))

(declare-fun m!1374281 () Bool)

(assert (=> b!1490061 m!1374281))

(assert (=> b!1490061 m!1374235))

(declare-fun m!1374283 () Bool)

(assert (=> b!1490061 m!1374283))

(declare-fun m!1374285 () Bool)

(assert (=> b!1490061 m!1374285))

(assert (=> b!1490061 m!1374235))

(declare-fun m!1374287 () Bool)

(assert (=> b!1490077 m!1374287))

(assert (=> b!1490079 m!1374235))

(assert (=> b!1490079 m!1374235))

(declare-fun m!1374289 () Bool)

(assert (=> b!1490079 m!1374289))

(assert (=> b!1490067 m!1374235))

(assert (=> b!1490067 m!1374235))

(declare-fun m!1374291 () Bool)

(assert (=> b!1490067 m!1374291))

(declare-fun m!1374293 () Bool)

(assert (=> b!1490078 m!1374293))

(push 1)

