; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126420 () Bool)

(assert start!126420)

(declare-fun b!1482541 () Bool)

(declare-fun e!831334 () Bool)

(declare-fun e!831336 () Bool)

(assert (=> b!1482541 (= e!831334 e!831336)))

(declare-fun res!1007740 () Bool)

(assert (=> b!1482541 (=> (not res!1007740) (not e!831336))))

(declare-datatypes ((array!99439 0))(
  ( (array!99440 (arr!47997 (Array (_ BitVec 32) (_ BitVec 64))) (size!48547 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99439)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12237 0))(
  ( (MissingZero!12237 (index!51340 (_ BitVec 32))) (Found!12237 (index!51341 (_ BitVec 32))) (Intermediate!12237 (undefined!13049 Bool) (index!51342 (_ BitVec 32)) (x!132920 (_ BitVec 32))) (Undefined!12237) (MissingVacant!12237 (index!51343 (_ BitVec 32))) )
))
(declare-fun lt!647102 () SeekEntryResult!12237)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99439 (_ BitVec 32)) SeekEntryResult!12237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482541 (= res!1007740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) (select (arr!47997 a!2862) j!93) a!2862 mask!2687) lt!647102))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482541 (= lt!647102 (Intermediate!12237 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482542 () Bool)

(declare-fun res!1007746 () Bool)

(declare-fun e!831333 () Bool)

(assert (=> b!1482542 (=> (not res!1007746) (not e!831333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482542 (= res!1007746 (validKeyInArray!0 (select (arr!47997 a!2862) j!93)))))

(declare-fun b!1482543 () Bool)

(assert (=> b!1482543 (= e!831333 e!831334)))

(declare-fun res!1007749 () Bool)

(assert (=> b!1482543 (=> (not res!1007749) (not e!831334))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482543 (= res!1007749 (= (select (store (arr!47997 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647101 () array!99439)

(assert (=> b!1482543 (= lt!647101 (array!99440 (store (arr!47997 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48547 a!2862)))))

(declare-fun b!1482544 () Bool)

(declare-fun res!1007745 () Bool)

(declare-fun e!831335 () Bool)

(assert (=> b!1482544 (=> (not res!1007745) (not e!831335))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1482544 (= res!1007745 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482545 () Bool)

(declare-fun res!1007744 () Bool)

(assert (=> b!1482545 (=> (not res!1007744) (not e!831336))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1482545 (= res!1007744 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47997 a!2862) j!93) a!2862 mask!2687) lt!647102))))

(declare-fun e!831338 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1482546 () Bool)

(assert (=> b!1482546 (= e!831338 (and (or (= (select (arr!47997 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47997 a!2862) intermediateBeforeIndex!19) (select (arr!47997 a!2862) j!93))) (let ((bdg!54269 (select (store (arr!47997 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47997 a!2862) index!646) bdg!54269) (= (select (arr!47997 a!2862) index!646) (select (arr!47997 a!2862) j!93))) (= (select (arr!47997 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54269 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!831332 () Bool)

(declare-fun b!1482547 () Bool)

(declare-fun lt!647100 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99439 (_ BitVec 32)) SeekEntryResult!12237)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99439 (_ BitVec 32)) SeekEntryResult!12237)

(assert (=> b!1482547 (= e!831332 (= (seekEntryOrOpen!0 lt!647100 lt!647101 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647100 lt!647101 mask!2687)))))

(declare-fun b!1482548 () Bool)

(assert (=> b!1482548 (= e!831335 (not e!831332))))

(declare-fun res!1007737 () Bool)

(assert (=> b!1482548 (=> res!1007737 e!831332)))

(assert (=> b!1482548 (= res!1007737 (or (and (= (select (arr!47997 a!2862) index!646) (select (store (arr!47997 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47997 a!2862) index!646) (select (arr!47997 a!2862) j!93))) (= (select (arr!47997 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1482548 e!831338))

(declare-fun res!1007742 () Bool)

(assert (=> b!1482548 (=> (not res!1007742) (not e!831338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99439 (_ BitVec 32)) Bool)

(assert (=> b!1482548 (= res!1007742 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49814 0))(
  ( (Unit!49815) )
))
(declare-fun lt!647103 () Unit!49814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49814)

(assert (=> b!1482548 (= lt!647103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482549 () Bool)

(declare-fun res!1007748 () Bool)

(assert (=> b!1482549 (=> (not res!1007748) (not e!831333))))

(assert (=> b!1482549 (= res!1007748 (validKeyInArray!0 (select (arr!47997 a!2862) i!1006)))))

(declare-fun b!1482550 () Bool)

(declare-fun res!1007743 () Bool)

(assert (=> b!1482550 (=> (not res!1007743) (not e!831338))))

(assert (=> b!1482550 (= res!1007743 (= (seekEntryOrOpen!0 (select (arr!47997 a!2862) j!93) a!2862 mask!2687) (Found!12237 j!93)))))

(declare-fun b!1482551 () Bool)

(declare-fun res!1007738 () Bool)

(assert (=> b!1482551 (=> (not res!1007738) (not e!831333))))

(assert (=> b!1482551 (= res!1007738 (and (= (size!48547 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48547 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48547 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482552 () Bool)

(declare-fun res!1007750 () Bool)

(assert (=> b!1482552 (=> (not res!1007750) (not e!831333))))

(assert (=> b!1482552 (= res!1007750 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48547 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48547 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48547 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1007747 () Bool)

(assert (=> start!126420 (=> (not res!1007747) (not e!831333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126420 (= res!1007747 (validMask!0 mask!2687))))

(assert (=> start!126420 e!831333))

(assert (=> start!126420 true))

(declare-fun array_inv!37025 (array!99439) Bool)

(assert (=> start!126420 (array_inv!37025 a!2862)))

(declare-fun e!831331 () Bool)

(declare-fun lt!647099 () SeekEntryResult!12237)

(declare-fun b!1482553 () Bool)

(assert (=> b!1482553 (= e!831331 (= lt!647099 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647100 lt!647101 mask!2687)))))

(declare-fun b!1482554 () Bool)

(declare-fun res!1007752 () Bool)

(assert (=> b!1482554 (=> (not res!1007752) (not e!831335))))

(assert (=> b!1482554 (= res!1007752 e!831331)))

(declare-fun c!136923 () Bool)

(assert (=> b!1482554 (= c!136923 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482555 () Bool)

(declare-fun res!1007751 () Bool)

(assert (=> b!1482555 (=> (not res!1007751) (not e!831333))))

(assert (=> b!1482555 (= res!1007751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482556 () Bool)

(assert (=> b!1482556 (= e!831336 e!831335)))

(declare-fun res!1007739 () Bool)

(assert (=> b!1482556 (=> (not res!1007739) (not e!831335))))

(assert (=> b!1482556 (= res!1007739 (= lt!647099 (Intermediate!12237 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482556 (= lt!647099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647100 mask!2687) lt!647100 lt!647101 mask!2687))))

(assert (=> b!1482556 (= lt!647100 (select (store (arr!47997 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482557 () Bool)

(assert (=> b!1482557 (= e!831331 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647100 lt!647101 mask!2687) (seekEntryOrOpen!0 lt!647100 lt!647101 mask!2687)))))

(declare-fun b!1482558 () Bool)

(declare-fun res!1007741 () Bool)

(assert (=> b!1482558 (=> (not res!1007741) (not e!831333))))

(declare-datatypes ((List!34498 0))(
  ( (Nil!34495) (Cons!34494 (h!35865 (_ BitVec 64)) (t!49192 List!34498)) )
))
(declare-fun arrayNoDuplicates!0 (array!99439 (_ BitVec 32) List!34498) Bool)

(assert (=> b!1482558 (= res!1007741 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34495))))

(assert (= (and start!126420 res!1007747) b!1482551))

(assert (= (and b!1482551 res!1007738) b!1482549))

(assert (= (and b!1482549 res!1007748) b!1482542))

(assert (= (and b!1482542 res!1007746) b!1482555))

(assert (= (and b!1482555 res!1007751) b!1482558))

(assert (= (and b!1482558 res!1007741) b!1482552))

(assert (= (and b!1482552 res!1007750) b!1482543))

(assert (= (and b!1482543 res!1007749) b!1482541))

(assert (= (and b!1482541 res!1007740) b!1482545))

(assert (= (and b!1482545 res!1007744) b!1482556))

(assert (= (and b!1482556 res!1007739) b!1482554))

(assert (= (and b!1482554 c!136923) b!1482553))

(assert (= (and b!1482554 (not c!136923)) b!1482557))

(assert (= (and b!1482554 res!1007752) b!1482544))

(assert (= (and b!1482544 res!1007745) b!1482548))

(assert (= (and b!1482548 res!1007742) b!1482550))

(assert (= (and b!1482550 res!1007743) b!1482546))

(assert (= (and b!1482548 (not res!1007737)) b!1482547))

(declare-fun m!1368255 () Bool)

(assert (=> b!1482558 m!1368255))

(declare-fun m!1368257 () Bool)

(assert (=> b!1482557 m!1368257))

(declare-fun m!1368259 () Bool)

(assert (=> b!1482557 m!1368259))

(declare-fun m!1368261 () Bool)

(assert (=> b!1482553 m!1368261))

(declare-fun m!1368263 () Bool)

(assert (=> b!1482542 m!1368263))

(assert (=> b!1482542 m!1368263))

(declare-fun m!1368265 () Bool)

(assert (=> b!1482542 m!1368265))

(declare-fun m!1368267 () Bool)

(assert (=> b!1482555 m!1368267))

(declare-fun m!1368269 () Bool)

(assert (=> b!1482548 m!1368269))

(declare-fun m!1368271 () Bool)

(assert (=> b!1482548 m!1368271))

(declare-fun m!1368273 () Bool)

(assert (=> b!1482548 m!1368273))

(declare-fun m!1368275 () Bool)

(assert (=> b!1482548 m!1368275))

(declare-fun m!1368277 () Bool)

(assert (=> b!1482548 m!1368277))

(assert (=> b!1482548 m!1368263))

(assert (=> b!1482547 m!1368259))

(assert (=> b!1482547 m!1368257))

(declare-fun m!1368279 () Bool)

(assert (=> b!1482549 m!1368279))

(assert (=> b!1482549 m!1368279))

(declare-fun m!1368281 () Bool)

(assert (=> b!1482549 m!1368281))

(assert (=> b!1482545 m!1368263))

(assert (=> b!1482545 m!1368263))

(declare-fun m!1368283 () Bool)

(assert (=> b!1482545 m!1368283))

(declare-fun m!1368285 () Bool)

(assert (=> start!126420 m!1368285))

(declare-fun m!1368287 () Bool)

(assert (=> start!126420 m!1368287))

(assert (=> b!1482550 m!1368263))

(assert (=> b!1482550 m!1368263))

(declare-fun m!1368289 () Bool)

(assert (=> b!1482550 m!1368289))

(assert (=> b!1482546 m!1368271))

(declare-fun m!1368291 () Bool)

(assert (=> b!1482546 m!1368291))

(assert (=> b!1482546 m!1368273))

(assert (=> b!1482546 m!1368275))

(assert (=> b!1482546 m!1368263))

(assert (=> b!1482543 m!1368271))

(declare-fun m!1368293 () Bool)

(assert (=> b!1482543 m!1368293))

(assert (=> b!1482541 m!1368263))

(assert (=> b!1482541 m!1368263))

(declare-fun m!1368295 () Bool)

(assert (=> b!1482541 m!1368295))

(assert (=> b!1482541 m!1368295))

(assert (=> b!1482541 m!1368263))

(declare-fun m!1368297 () Bool)

(assert (=> b!1482541 m!1368297))

(declare-fun m!1368299 () Bool)

(assert (=> b!1482556 m!1368299))

(assert (=> b!1482556 m!1368299))

(declare-fun m!1368301 () Bool)

(assert (=> b!1482556 m!1368301))

(assert (=> b!1482556 m!1368271))

(declare-fun m!1368303 () Bool)

(assert (=> b!1482556 m!1368303))

(check-sat (not b!1482556) (not b!1482547) (not b!1482541) (not b!1482545) (not b!1482549) (not b!1482555) (not b!1482558) (not b!1482548) (not b!1482550) (not b!1482542) (not b!1482553) (not b!1482557) (not start!126420))
(check-sat)
(get-model)

(declare-fun b!1482625 () Bool)

(declare-fun e!831369 () SeekEntryResult!12237)

(assert (=> b!1482625 (= e!831369 Undefined!12237)))

(declare-fun b!1482626 () Bool)

(declare-fun e!831370 () SeekEntryResult!12237)

(declare-fun lt!647127 () SeekEntryResult!12237)

(assert (=> b!1482626 (= e!831370 (MissingZero!12237 (index!51342 lt!647127)))))

(declare-fun b!1482627 () Bool)

(assert (=> b!1482627 (= e!831370 (seekKeyOrZeroReturnVacant!0 (x!132920 lt!647127) (index!51342 lt!647127) (index!51342 lt!647127) lt!647100 lt!647101 mask!2687))))

(declare-fun d!156289 () Bool)

(declare-fun lt!647125 () SeekEntryResult!12237)

(get-info :version)

(assert (=> d!156289 (and (or ((_ is Undefined!12237) lt!647125) (not ((_ is Found!12237) lt!647125)) (and (bvsge (index!51341 lt!647125) #b00000000000000000000000000000000) (bvslt (index!51341 lt!647125) (size!48547 lt!647101)))) (or ((_ is Undefined!12237) lt!647125) ((_ is Found!12237) lt!647125) (not ((_ is MissingZero!12237) lt!647125)) (and (bvsge (index!51340 lt!647125) #b00000000000000000000000000000000) (bvslt (index!51340 lt!647125) (size!48547 lt!647101)))) (or ((_ is Undefined!12237) lt!647125) ((_ is Found!12237) lt!647125) ((_ is MissingZero!12237) lt!647125) (not ((_ is MissingVacant!12237) lt!647125)) (and (bvsge (index!51343 lt!647125) #b00000000000000000000000000000000) (bvslt (index!51343 lt!647125) (size!48547 lt!647101)))) (or ((_ is Undefined!12237) lt!647125) (ite ((_ is Found!12237) lt!647125) (= (select (arr!47997 lt!647101) (index!51341 lt!647125)) lt!647100) (ite ((_ is MissingZero!12237) lt!647125) (= (select (arr!47997 lt!647101) (index!51340 lt!647125)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12237) lt!647125) (= (select (arr!47997 lt!647101) (index!51343 lt!647125)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156289 (= lt!647125 e!831369)))

(declare-fun c!136934 () Bool)

(assert (=> d!156289 (= c!136934 (and ((_ is Intermediate!12237) lt!647127) (undefined!13049 lt!647127)))))

(assert (=> d!156289 (= lt!647127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647100 mask!2687) lt!647100 lt!647101 mask!2687))))

(assert (=> d!156289 (validMask!0 mask!2687)))

(assert (=> d!156289 (= (seekEntryOrOpen!0 lt!647100 lt!647101 mask!2687) lt!647125)))

(declare-fun b!1482628 () Bool)

(declare-fun c!136933 () Bool)

(declare-fun lt!647126 () (_ BitVec 64))

(assert (=> b!1482628 (= c!136933 (= lt!647126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831371 () SeekEntryResult!12237)

(assert (=> b!1482628 (= e!831371 e!831370)))

(declare-fun b!1482629 () Bool)

(assert (=> b!1482629 (= e!831369 e!831371)))

(assert (=> b!1482629 (= lt!647126 (select (arr!47997 lt!647101) (index!51342 lt!647127)))))

(declare-fun c!136935 () Bool)

(assert (=> b!1482629 (= c!136935 (= lt!647126 lt!647100))))

(declare-fun b!1482630 () Bool)

(assert (=> b!1482630 (= e!831371 (Found!12237 (index!51342 lt!647127)))))

(assert (= (and d!156289 c!136934) b!1482625))

(assert (= (and d!156289 (not c!136934)) b!1482629))

(assert (= (and b!1482629 c!136935) b!1482630))

(assert (= (and b!1482629 (not c!136935)) b!1482628))

(assert (= (and b!1482628 c!136933) b!1482626))

(assert (= (and b!1482628 (not c!136933)) b!1482627))

(declare-fun m!1368355 () Bool)

(assert (=> b!1482627 m!1368355))

(declare-fun m!1368357 () Bool)

(assert (=> d!156289 m!1368357))

(declare-fun m!1368359 () Bool)

(assert (=> d!156289 m!1368359))

(assert (=> d!156289 m!1368299))

(assert (=> d!156289 m!1368301))

(assert (=> d!156289 m!1368299))

(assert (=> d!156289 m!1368285))

(declare-fun m!1368361 () Bool)

(assert (=> d!156289 m!1368361))

(declare-fun m!1368363 () Bool)

(assert (=> b!1482629 m!1368363))

(assert (=> b!1482547 d!156289))

(declare-fun b!1482643 () Bool)

(declare-fun c!136943 () Bool)

(declare-fun lt!647133 () (_ BitVec 64))

(assert (=> b!1482643 (= c!136943 (= lt!647133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831378 () SeekEntryResult!12237)

(declare-fun e!831380 () SeekEntryResult!12237)

(assert (=> b!1482643 (= e!831378 e!831380)))

(declare-fun b!1482644 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482644 (= e!831380 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!647100 lt!647101 mask!2687))))

(declare-fun b!1482645 () Bool)

(assert (=> b!1482645 (= e!831378 (Found!12237 index!646))))

(declare-fun d!156291 () Bool)

(declare-fun lt!647132 () SeekEntryResult!12237)

(assert (=> d!156291 (and (or ((_ is Undefined!12237) lt!647132) (not ((_ is Found!12237) lt!647132)) (and (bvsge (index!51341 lt!647132) #b00000000000000000000000000000000) (bvslt (index!51341 lt!647132) (size!48547 lt!647101)))) (or ((_ is Undefined!12237) lt!647132) ((_ is Found!12237) lt!647132) (not ((_ is MissingVacant!12237) lt!647132)) (not (= (index!51343 lt!647132) intermediateAfterIndex!19)) (and (bvsge (index!51343 lt!647132) #b00000000000000000000000000000000) (bvslt (index!51343 lt!647132) (size!48547 lt!647101)))) (or ((_ is Undefined!12237) lt!647132) (ite ((_ is Found!12237) lt!647132) (= (select (arr!47997 lt!647101) (index!51341 lt!647132)) lt!647100) (and ((_ is MissingVacant!12237) lt!647132) (= (index!51343 lt!647132) intermediateAfterIndex!19) (= (select (arr!47997 lt!647101) (index!51343 lt!647132)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!831379 () SeekEntryResult!12237)

(assert (=> d!156291 (= lt!647132 e!831379)))

(declare-fun c!136944 () Bool)

(assert (=> d!156291 (= c!136944 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156291 (= lt!647133 (select (arr!47997 lt!647101) index!646))))

(assert (=> d!156291 (validMask!0 mask!2687)))

(assert (=> d!156291 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647100 lt!647101 mask!2687) lt!647132)))

(declare-fun b!1482646 () Bool)

(assert (=> b!1482646 (= e!831380 (MissingVacant!12237 intermediateAfterIndex!19))))

(declare-fun b!1482647 () Bool)

(assert (=> b!1482647 (= e!831379 e!831378)))

(declare-fun c!136942 () Bool)

(assert (=> b!1482647 (= c!136942 (= lt!647133 lt!647100))))

(declare-fun b!1482648 () Bool)

(assert (=> b!1482648 (= e!831379 Undefined!12237)))

(assert (= (and d!156291 c!136944) b!1482648))

(assert (= (and d!156291 (not c!136944)) b!1482647))

(assert (= (and b!1482647 c!136942) b!1482645))

(assert (= (and b!1482647 (not c!136942)) b!1482643))

(assert (= (and b!1482643 c!136943) b!1482646))

(assert (= (and b!1482643 (not c!136943)) b!1482644))

(declare-fun m!1368365 () Bool)

(assert (=> b!1482644 m!1368365))

(assert (=> b!1482644 m!1368365))

(declare-fun m!1368367 () Bool)

(assert (=> b!1482644 m!1368367))

(declare-fun m!1368369 () Bool)

(assert (=> d!156291 m!1368369))

(declare-fun m!1368371 () Bool)

(assert (=> d!156291 m!1368371))

(declare-fun m!1368373 () Bool)

(assert (=> d!156291 m!1368373))

(assert (=> d!156291 m!1368285))

(assert (=> b!1482547 d!156291))

(declare-fun b!1482659 () Bool)

(declare-fun e!831390 () Bool)

(declare-fun call!67855 () Bool)

(assert (=> b!1482659 (= e!831390 call!67855)))

(declare-fun d!156293 () Bool)

(declare-fun res!1007807 () Bool)

(declare-fun e!831391 () Bool)

(assert (=> d!156293 (=> res!1007807 e!831391)))

(assert (=> d!156293 (= res!1007807 (bvsge #b00000000000000000000000000000000 (size!48547 a!2862)))))

(assert (=> d!156293 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34495) e!831391)))

(declare-fun b!1482660 () Bool)

(declare-fun e!831389 () Bool)

(declare-fun contains!9913 (List!34498 (_ BitVec 64)) Bool)

(assert (=> b!1482660 (= e!831389 (contains!9913 Nil!34495 (select (arr!47997 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482661 () Bool)

(assert (=> b!1482661 (= e!831390 call!67855)))

(declare-fun bm!67852 () Bool)

(declare-fun c!136947 () Bool)

(assert (=> bm!67852 (= call!67855 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136947 (Cons!34494 (select (arr!47997 a!2862) #b00000000000000000000000000000000) Nil!34495) Nil!34495)))))

(declare-fun b!1482662 () Bool)

(declare-fun e!831392 () Bool)

(assert (=> b!1482662 (= e!831391 e!831392)))

(declare-fun res!1007808 () Bool)

(assert (=> b!1482662 (=> (not res!1007808) (not e!831392))))

(assert (=> b!1482662 (= res!1007808 (not e!831389))))

(declare-fun res!1007809 () Bool)

(assert (=> b!1482662 (=> (not res!1007809) (not e!831389))))

(assert (=> b!1482662 (= res!1007809 (validKeyInArray!0 (select (arr!47997 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482663 () Bool)

(assert (=> b!1482663 (= e!831392 e!831390)))

(assert (=> b!1482663 (= c!136947 (validKeyInArray!0 (select (arr!47997 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156293 (not res!1007807)) b!1482662))

(assert (= (and b!1482662 res!1007809) b!1482660))

(assert (= (and b!1482662 res!1007808) b!1482663))

(assert (= (and b!1482663 c!136947) b!1482659))

(assert (= (and b!1482663 (not c!136947)) b!1482661))

(assert (= (or b!1482659 b!1482661) bm!67852))

(declare-fun m!1368375 () Bool)

(assert (=> b!1482660 m!1368375))

(assert (=> b!1482660 m!1368375))

(declare-fun m!1368377 () Bool)

(assert (=> b!1482660 m!1368377))

(assert (=> bm!67852 m!1368375))

(declare-fun m!1368379 () Bool)

(assert (=> bm!67852 m!1368379))

(assert (=> b!1482662 m!1368375))

(assert (=> b!1482662 m!1368375))

(declare-fun m!1368381 () Bool)

(assert (=> b!1482662 m!1368381))

(assert (=> b!1482663 m!1368375))

(assert (=> b!1482663 m!1368375))

(assert (=> b!1482663 m!1368381))

(assert (=> b!1482558 d!156293))

(declare-fun b!1482682 () Bool)

(declare-fun lt!647138 () SeekEntryResult!12237)

(assert (=> b!1482682 (and (bvsge (index!51342 lt!647138) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647138) (size!48547 lt!647101)))))

(declare-fun e!831407 () Bool)

(assert (=> b!1482682 (= e!831407 (= (select (arr!47997 lt!647101) (index!51342 lt!647138)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156295 () Bool)

(declare-fun e!831404 () Bool)

(assert (=> d!156295 e!831404))

(declare-fun c!136955 () Bool)

(assert (=> d!156295 (= c!136955 (and ((_ is Intermediate!12237) lt!647138) (undefined!13049 lt!647138)))))

(declare-fun e!831406 () SeekEntryResult!12237)

(assert (=> d!156295 (= lt!647138 e!831406)))

(declare-fun c!136956 () Bool)

(assert (=> d!156295 (= c!136956 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!647139 () (_ BitVec 64))

(assert (=> d!156295 (= lt!647139 (select (arr!47997 lt!647101) (toIndex!0 lt!647100 mask!2687)))))

(assert (=> d!156295 (validMask!0 mask!2687)))

(assert (=> d!156295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647100 mask!2687) lt!647100 lt!647101 mask!2687) lt!647138)))

(declare-fun e!831405 () SeekEntryResult!12237)

(declare-fun b!1482683 () Bool)

(assert (=> b!1482683 (= e!831405 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!647100 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!647100 lt!647101 mask!2687))))

(declare-fun b!1482684 () Bool)

(assert (=> b!1482684 (= e!831405 (Intermediate!12237 false (toIndex!0 lt!647100 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482685 () Bool)

(declare-fun e!831403 () Bool)

(assert (=> b!1482685 (= e!831404 e!831403)))

(declare-fun res!1007816 () Bool)

(assert (=> b!1482685 (= res!1007816 (and ((_ is Intermediate!12237) lt!647138) (not (undefined!13049 lt!647138)) (bvslt (x!132920 lt!647138) #b01111111111111111111111111111110) (bvsge (x!132920 lt!647138) #b00000000000000000000000000000000) (bvsge (x!132920 lt!647138) #b00000000000000000000000000000000)))))

(assert (=> b!1482685 (=> (not res!1007816) (not e!831403))))

(declare-fun b!1482686 () Bool)

(assert (=> b!1482686 (= e!831406 (Intermediate!12237 true (toIndex!0 lt!647100 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482687 () Bool)

(assert (=> b!1482687 (= e!831404 (bvsge (x!132920 lt!647138) #b01111111111111111111111111111110))))

(declare-fun b!1482688 () Bool)

(assert (=> b!1482688 (and (bvsge (index!51342 lt!647138) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647138) (size!48547 lt!647101)))))

(declare-fun res!1007817 () Bool)

(assert (=> b!1482688 (= res!1007817 (= (select (arr!47997 lt!647101) (index!51342 lt!647138)) lt!647100))))

(assert (=> b!1482688 (=> res!1007817 e!831407)))

(assert (=> b!1482688 (= e!831403 e!831407)))

(declare-fun b!1482689 () Bool)

(assert (=> b!1482689 (= e!831406 e!831405)))

(declare-fun c!136954 () Bool)

(assert (=> b!1482689 (= c!136954 (or (= lt!647139 lt!647100) (= (bvadd lt!647139 lt!647139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482690 () Bool)

(assert (=> b!1482690 (and (bvsge (index!51342 lt!647138) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647138) (size!48547 lt!647101)))))

(declare-fun res!1007818 () Bool)

(assert (=> b!1482690 (= res!1007818 (= (select (arr!47997 lt!647101) (index!51342 lt!647138)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482690 (=> res!1007818 e!831407)))

(assert (= (and d!156295 c!136956) b!1482686))

(assert (= (and d!156295 (not c!136956)) b!1482689))

(assert (= (and b!1482689 c!136954) b!1482684))

(assert (= (and b!1482689 (not c!136954)) b!1482683))

(assert (= (and d!156295 c!136955) b!1482687))

(assert (= (and d!156295 (not c!136955)) b!1482685))

(assert (= (and b!1482685 res!1007816) b!1482688))

(assert (= (and b!1482688 (not res!1007817)) b!1482690))

(assert (= (and b!1482690 (not res!1007818)) b!1482682))

(declare-fun m!1368383 () Bool)

(assert (=> b!1482690 m!1368383))

(assert (=> d!156295 m!1368299))

(declare-fun m!1368385 () Bool)

(assert (=> d!156295 m!1368385))

(assert (=> d!156295 m!1368285))

(assert (=> b!1482683 m!1368299))

(declare-fun m!1368387 () Bool)

(assert (=> b!1482683 m!1368387))

(assert (=> b!1482683 m!1368387))

(declare-fun m!1368389 () Bool)

(assert (=> b!1482683 m!1368389))

(assert (=> b!1482688 m!1368383))

(assert (=> b!1482682 m!1368383))

(assert (=> b!1482556 d!156295))

(declare-fun d!156303 () Bool)

(declare-fun lt!647153 () (_ BitVec 32))

(declare-fun lt!647152 () (_ BitVec 32))

(assert (=> d!156303 (= lt!647153 (bvmul (bvxor lt!647152 (bvlshr lt!647152 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156303 (= lt!647152 ((_ extract 31 0) (bvand (bvxor lt!647100 (bvlshr lt!647100 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156303 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007819 (let ((h!35867 ((_ extract 31 0) (bvand (bvxor lt!647100 (bvlshr lt!647100 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132924 (bvmul (bvxor h!35867 (bvlshr h!35867 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132924 (bvlshr x!132924 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007819 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007819 #b00000000000000000000000000000000))))))

(assert (=> d!156303 (= (toIndex!0 lt!647100 mask!2687) (bvand (bvxor lt!647153 (bvlshr lt!647153 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482556 d!156303))

(assert (=> b!1482557 d!156291))

(assert (=> b!1482557 d!156289))

(declare-fun b!1482736 () Bool)

(declare-fun e!831434 () Bool)

(declare-fun e!831432 () Bool)

(assert (=> b!1482736 (= e!831434 e!831432)))

(declare-fun c!136977 () Bool)

(assert (=> b!1482736 (= c!136977 (validKeyInArray!0 (select (arr!47997 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482737 () Bool)

(declare-fun e!831433 () Bool)

(declare-fun call!67858 () Bool)

(assert (=> b!1482737 (= e!831433 call!67858)))

(declare-fun bm!67855 () Bool)

(assert (=> bm!67855 (= call!67858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482738 () Bool)

(assert (=> b!1482738 (= e!831432 e!831433)))

(declare-fun lt!647165 () (_ BitVec 64))

(assert (=> b!1482738 (= lt!647165 (select (arr!47997 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!647164 () Unit!49814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99439 (_ BitVec 64) (_ BitVec 32)) Unit!49814)

(assert (=> b!1482738 (= lt!647164 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647165 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1482738 (arrayContainsKey!0 a!2862 lt!647165 #b00000000000000000000000000000000)))

(declare-fun lt!647166 () Unit!49814)

(assert (=> b!1482738 (= lt!647166 lt!647164)))

(declare-fun res!1007825 () Bool)

(assert (=> b!1482738 (= res!1007825 (= (seekEntryOrOpen!0 (select (arr!47997 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12237 #b00000000000000000000000000000000)))))

(assert (=> b!1482738 (=> (not res!1007825) (not e!831433))))

(declare-fun b!1482735 () Bool)

(assert (=> b!1482735 (= e!831432 call!67858)))

(declare-fun d!156305 () Bool)

(declare-fun res!1007824 () Bool)

(assert (=> d!156305 (=> res!1007824 e!831434)))

(assert (=> d!156305 (= res!1007824 (bvsge #b00000000000000000000000000000000 (size!48547 a!2862)))))

(assert (=> d!156305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!831434)))

(assert (= (and d!156305 (not res!1007824)) b!1482736))

(assert (= (and b!1482736 c!136977) b!1482738))

(assert (= (and b!1482736 (not c!136977)) b!1482735))

(assert (= (and b!1482738 res!1007825) b!1482737))

(assert (= (or b!1482737 b!1482735) bm!67855))

(assert (=> b!1482736 m!1368375))

(assert (=> b!1482736 m!1368375))

(assert (=> b!1482736 m!1368381))

(declare-fun m!1368411 () Bool)

(assert (=> bm!67855 m!1368411))

(assert (=> b!1482738 m!1368375))

(declare-fun m!1368413 () Bool)

(assert (=> b!1482738 m!1368413))

(declare-fun m!1368415 () Bool)

(assert (=> b!1482738 m!1368415))

(assert (=> b!1482738 m!1368375))

(declare-fun m!1368417 () Bool)

(assert (=> b!1482738 m!1368417))

(assert (=> b!1482555 d!156305))

(declare-fun b!1482739 () Bool)

(declare-fun lt!647167 () SeekEntryResult!12237)

(assert (=> b!1482739 (and (bvsge (index!51342 lt!647167) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647167) (size!48547 a!2862)))))

(declare-fun e!831439 () Bool)

(assert (=> b!1482739 (= e!831439 (= (select (arr!47997 a!2862) (index!51342 lt!647167)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156311 () Bool)

(declare-fun e!831436 () Bool)

(assert (=> d!156311 e!831436))

(declare-fun c!136979 () Bool)

(assert (=> d!156311 (= c!136979 (and ((_ is Intermediate!12237) lt!647167) (undefined!13049 lt!647167)))))

(declare-fun e!831438 () SeekEntryResult!12237)

(assert (=> d!156311 (= lt!647167 e!831438)))

(declare-fun c!136980 () Bool)

(assert (=> d!156311 (= c!136980 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!647168 () (_ BitVec 64))

(assert (=> d!156311 (= lt!647168 (select (arr!47997 a!2862) index!646))))

(assert (=> d!156311 (validMask!0 mask!2687)))

(assert (=> d!156311 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47997 a!2862) j!93) a!2862 mask!2687) lt!647167)))

(declare-fun e!831437 () SeekEntryResult!12237)

(declare-fun b!1482740 () Bool)

(assert (=> b!1482740 (= e!831437 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47997 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482741 () Bool)

(assert (=> b!1482741 (= e!831437 (Intermediate!12237 false index!646 x!665))))

(declare-fun b!1482742 () Bool)

(declare-fun e!831435 () Bool)

(assert (=> b!1482742 (= e!831436 e!831435)))

(declare-fun res!1007826 () Bool)

(assert (=> b!1482742 (= res!1007826 (and ((_ is Intermediate!12237) lt!647167) (not (undefined!13049 lt!647167)) (bvslt (x!132920 lt!647167) #b01111111111111111111111111111110) (bvsge (x!132920 lt!647167) #b00000000000000000000000000000000) (bvsge (x!132920 lt!647167) x!665)))))

(assert (=> b!1482742 (=> (not res!1007826) (not e!831435))))

(declare-fun b!1482743 () Bool)

(assert (=> b!1482743 (= e!831438 (Intermediate!12237 true index!646 x!665))))

(declare-fun b!1482744 () Bool)

(assert (=> b!1482744 (= e!831436 (bvsge (x!132920 lt!647167) #b01111111111111111111111111111110))))

(declare-fun b!1482745 () Bool)

(assert (=> b!1482745 (and (bvsge (index!51342 lt!647167) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647167) (size!48547 a!2862)))))

(declare-fun res!1007827 () Bool)

(assert (=> b!1482745 (= res!1007827 (= (select (arr!47997 a!2862) (index!51342 lt!647167)) (select (arr!47997 a!2862) j!93)))))

(assert (=> b!1482745 (=> res!1007827 e!831439)))

(assert (=> b!1482745 (= e!831435 e!831439)))

(declare-fun b!1482746 () Bool)

(assert (=> b!1482746 (= e!831438 e!831437)))

(declare-fun c!136978 () Bool)

(assert (=> b!1482746 (= c!136978 (or (= lt!647168 (select (arr!47997 a!2862) j!93)) (= (bvadd lt!647168 lt!647168) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482747 () Bool)

(assert (=> b!1482747 (and (bvsge (index!51342 lt!647167) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647167) (size!48547 a!2862)))))

(declare-fun res!1007828 () Bool)

(assert (=> b!1482747 (= res!1007828 (= (select (arr!47997 a!2862) (index!51342 lt!647167)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482747 (=> res!1007828 e!831439)))

(assert (= (and d!156311 c!136980) b!1482743))

(assert (= (and d!156311 (not c!136980)) b!1482746))

(assert (= (and b!1482746 c!136978) b!1482741))

(assert (= (and b!1482746 (not c!136978)) b!1482740))

(assert (= (and d!156311 c!136979) b!1482744))

(assert (= (and d!156311 (not c!136979)) b!1482742))

(assert (= (and b!1482742 res!1007826) b!1482745))

(assert (= (and b!1482745 (not res!1007827)) b!1482747))

(assert (= (and b!1482747 (not res!1007828)) b!1482739))

(declare-fun m!1368419 () Bool)

(assert (=> b!1482747 m!1368419))

(assert (=> d!156311 m!1368275))

(assert (=> d!156311 m!1368285))

(assert (=> b!1482740 m!1368365))

(assert (=> b!1482740 m!1368365))

(assert (=> b!1482740 m!1368263))

(declare-fun m!1368421 () Bool)

(assert (=> b!1482740 m!1368421))

(assert (=> b!1482745 m!1368419))

(assert (=> b!1482739 m!1368419))

(assert (=> b!1482545 d!156311))

(declare-fun d!156313 () Bool)

(assert (=> d!156313 (= (validKeyInArray!0 (select (arr!47997 a!2862) j!93)) (and (not (= (select (arr!47997 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47997 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482542 d!156313))

(declare-fun b!1482748 () Bool)

(declare-fun lt!647169 () SeekEntryResult!12237)

(assert (=> b!1482748 (and (bvsge (index!51342 lt!647169) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647169) (size!48547 lt!647101)))))

(declare-fun e!831444 () Bool)

(assert (=> b!1482748 (= e!831444 (= (select (arr!47997 lt!647101) (index!51342 lt!647169)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156315 () Bool)

(declare-fun e!831441 () Bool)

(assert (=> d!156315 e!831441))

(declare-fun c!136982 () Bool)

(assert (=> d!156315 (= c!136982 (and ((_ is Intermediate!12237) lt!647169) (undefined!13049 lt!647169)))))

(declare-fun e!831443 () SeekEntryResult!12237)

(assert (=> d!156315 (= lt!647169 e!831443)))

(declare-fun c!136983 () Bool)

(assert (=> d!156315 (= c!136983 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!647170 () (_ BitVec 64))

(assert (=> d!156315 (= lt!647170 (select (arr!47997 lt!647101) index!646))))

(assert (=> d!156315 (validMask!0 mask!2687)))

(assert (=> d!156315 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647100 lt!647101 mask!2687) lt!647169)))

(declare-fun e!831442 () SeekEntryResult!12237)

(declare-fun b!1482749 () Bool)

(assert (=> b!1482749 (= e!831442 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!647100 lt!647101 mask!2687))))

(declare-fun b!1482750 () Bool)

(assert (=> b!1482750 (= e!831442 (Intermediate!12237 false index!646 x!665))))

(declare-fun b!1482751 () Bool)

(declare-fun e!831440 () Bool)

(assert (=> b!1482751 (= e!831441 e!831440)))

(declare-fun res!1007829 () Bool)

(assert (=> b!1482751 (= res!1007829 (and ((_ is Intermediate!12237) lt!647169) (not (undefined!13049 lt!647169)) (bvslt (x!132920 lt!647169) #b01111111111111111111111111111110) (bvsge (x!132920 lt!647169) #b00000000000000000000000000000000) (bvsge (x!132920 lt!647169) x!665)))))

(assert (=> b!1482751 (=> (not res!1007829) (not e!831440))))

(declare-fun b!1482752 () Bool)

(assert (=> b!1482752 (= e!831443 (Intermediate!12237 true index!646 x!665))))

(declare-fun b!1482753 () Bool)

(assert (=> b!1482753 (= e!831441 (bvsge (x!132920 lt!647169) #b01111111111111111111111111111110))))

(declare-fun b!1482754 () Bool)

(assert (=> b!1482754 (and (bvsge (index!51342 lt!647169) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647169) (size!48547 lt!647101)))))

(declare-fun res!1007830 () Bool)

(assert (=> b!1482754 (= res!1007830 (= (select (arr!47997 lt!647101) (index!51342 lt!647169)) lt!647100))))

(assert (=> b!1482754 (=> res!1007830 e!831444)))

(assert (=> b!1482754 (= e!831440 e!831444)))

(declare-fun b!1482755 () Bool)

(assert (=> b!1482755 (= e!831443 e!831442)))

(declare-fun c!136981 () Bool)

(assert (=> b!1482755 (= c!136981 (or (= lt!647170 lt!647100) (= (bvadd lt!647170 lt!647170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482756 () Bool)

(assert (=> b!1482756 (and (bvsge (index!51342 lt!647169) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647169) (size!48547 lt!647101)))))

(declare-fun res!1007831 () Bool)

(assert (=> b!1482756 (= res!1007831 (= (select (arr!47997 lt!647101) (index!51342 lt!647169)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482756 (=> res!1007831 e!831444)))

(assert (= (and d!156315 c!136983) b!1482752))

(assert (= (and d!156315 (not c!136983)) b!1482755))

(assert (= (and b!1482755 c!136981) b!1482750))

(assert (= (and b!1482755 (not c!136981)) b!1482749))

(assert (= (and d!156315 c!136982) b!1482753))

(assert (= (and d!156315 (not c!136982)) b!1482751))

(assert (= (and b!1482751 res!1007829) b!1482754))

(assert (= (and b!1482754 (not res!1007830)) b!1482756))

(assert (= (and b!1482756 (not res!1007831)) b!1482748))

(declare-fun m!1368423 () Bool)

(assert (=> b!1482756 m!1368423))

(assert (=> d!156315 m!1368373))

(assert (=> d!156315 m!1368285))

(assert (=> b!1482749 m!1368365))

(assert (=> b!1482749 m!1368365))

(declare-fun m!1368425 () Bool)

(assert (=> b!1482749 m!1368425))

(assert (=> b!1482754 m!1368423))

(assert (=> b!1482748 m!1368423))

(assert (=> b!1482553 d!156315))

(declare-fun b!1482757 () Bool)

(declare-fun lt!647171 () SeekEntryResult!12237)

(assert (=> b!1482757 (and (bvsge (index!51342 lt!647171) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647171) (size!48547 a!2862)))))

(declare-fun e!831449 () Bool)

(assert (=> b!1482757 (= e!831449 (= (select (arr!47997 a!2862) (index!51342 lt!647171)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156317 () Bool)

(declare-fun e!831446 () Bool)

(assert (=> d!156317 e!831446))

(declare-fun c!136985 () Bool)

(assert (=> d!156317 (= c!136985 (and ((_ is Intermediate!12237) lt!647171) (undefined!13049 lt!647171)))))

(declare-fun e!831448 () SeekEntryResult!12237)

(assert (=> d!156317 (= lt!647171 e!831448)))

(declare-fun c!136986 () Bool)

(assert (=> d!156317 (= c!136986 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!647172 () (_ BitVec 64))

(assert (=> d!156317 (= lt!647172 (select (arr!47997 a!2862) (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687)))))

(assert (=> d!156317 (validMask!0 mask!2687)))

(assert (=> d!156317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) (select (arr!47997 a!2862) j!93) a!2862 mask!2687) lt!647171)))

(declare-fun e!831447 () SeekEntryResult!12237)

(declare-fun b!1482758 () Bool)

(assert (=> b!1482758 (= e!831447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47997 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482759 () Bool)

(assert (=> b!1482759 (= e!831447 (Intermediate!12237 false (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482760 () Bool)

(declare-fun e!831445 () Bool)

(assert (=> b!1482760 (= e!831446 e!831445)))

(declare-fun res!1007832 () Bool)

(assert (=> b!1482760 (= res!1007832 (and ((_ is Intermediate!12237) lt!647171) (not (undefined!13049 lt!647171)) (bvslt (x!132920 lt!647171) #b01111111111111111111111111111110) (bvsge (x!132920 lt!647171) #b00000000000000000000000000000000) (bvsge (x!132920 lt!647171) #b00000000000000000000000000000000)))))

(assert (=> b!1482760 (=> (not res!1007832) (not e!831445))))

(declare-fun b!1482761 () Bool)

(assert (=> b!1482761 (= e!831448 (Intermediate!12237 true (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482762 () Bool)

(assert (=> b!1482762 (= e!831446 (bvsge (x!132920 lt!647171) #b01111111111111111111111111111110))))

(declare-fun b!1482763 () Bool)

(assert (=> b!1482763 (and (bvsge (index!51342 lt!647171) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647171) (size!48547 a!2862)))))

(declare-fun res!1007833 () Bool)

(assert (=> b!1482763 (= res!1007833 (= (select (arr!47997 a!2862) (index!51342 lt!647171)) (select (arr!47997 a!2862) j!93)))))

(assert (=> b!1482763 (=> res!1007833 e!831449)))

(assert (=> b!1482763 (= e!831445 e!831449)))

(declare-fun b!1482764 () Bool)

(assert (=> b!1482764 (= e!831448 e!831447)))

(declare-fun c!136984 () Bool)

(assert (=> b!1482764 (= c!136984 (or (= lt!647172 (select (arr!47997 a!2862) j!93)) (= (bvadd lt!647172 lt!647172) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482765 () Bool)

(assert (=> b!1482765 (and (bvsge (index!51342 lt!647171) #b00000000000000000000000000000000) (bvslt (index!51342 lt!647171) (size!48547 a!2862)))))

(declare-fun res!1007834 () Bool)

(assert (=> b!1482765 (= res!1007834 (= (select (arr!47997 a!2862) (index!51342 lt!647171)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482765 (=> res!1007834 e!831449)))

(assert (= (and d!156317 c!136986) b!1482761))

(assert (= (and d!156317 (not c!136986)) b!1482764))

(assert (= (and b!1482764 c!136984) b!1482759))

(assert (= (and b!1482764 (not c!136984)) b!1482758))

(assert (= (and d!156317 c!136985) b!1482762))

(assert (= (and d!156317 (not c!136985)) b!1482760))

(assert (= (and b!1482760 res!1007832) b!1482763))

(assert (= (and b!1482763 (not res!1007833)) b!1482765))

(assert (= (and b!1482765 (not res!1007834)) b!1482757))

(declare-fun m!1368427 () Bool)

(assert (=> b!1482765 m!1368427))

(assert (=> d!156317 m!1368295))

(declare-fun m!1368429 () Bool)

(assert (=> d!156317 m!1368429))

(assert (=> d!156317 m!1368285))

(assert (=> b!1482758 m!1368295))

(declare-fun m!1368431 () Bool)

(assert (=> b!1482758 m!1368431))

(assert (=> b!1482758 m!1368431))

(assert (=> b!1482758 m!1368263))

(declare-fun m!1368433 () Bool)

(assert (=> b!1482758 m!1368433))

(assert (=> b!1482763 m!1368427))

(assert (=> b!1482757 m!1368427))

(assert (=> b!1482541 d!156317))

(declare-fun d!156319 () Bool)

(declare-fun lt!647174 () (_ BitVec 32))

(declare-fun lt!647173 () (_ BitVec 32))

(assert (=> d!156319 (= lt!647174 (bvmul (bvxor lt!647173 (bvlshr lt!647173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156319 (= lt!647173 ((_ extract 31 0) (bvand (bvxor (select (arr!47997 a!2862) j!93) (bvlshr (select (arr!47997 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156319 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007819 (let ((h!35867 ((_ extract 31 0) (bvand (bvxor (select (arr!47997 a!2862) j!93) (bvlshr (select (arr!47997 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132924 (bvmul (bvxor h!35867 (bvlshr h!35867 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132924 (bvlshr x!132924 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007819 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007819 #b00000000000000000000000000000000))))))

(assert (=> d!156319 (= (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) (bvand (bvxor lt!647174 (bvlshr lt!647174 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482541 d!156319))

(declare-fun d!156321 () Bool)

(assert (=> d!156321 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126420 d!156321))

(declare-fun d!156327 () Bool)

(assert (=> d!156327 (= (array_inv!37025 a!2862) (bvsge (size!48547 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126420 d!156327))

(declare-fun b!1482802 () Bool)

(declare-fun e!831468 () SeekEntryResult!12237)

(assert (=> b!1482802 (= e!831468 Undefined!12237)))

(declare-fun b!1482803 () Bool)

(declare-fun e!831469 () SeekEntryResult!12237)

(declare-fun lt!647195 () SeekEntryResult!12237)

(assert (=> b!1482803 (= e!831469 (MissingZero!12237 (index!51342 lt!647195)))))

(declare-fun b!1482804 () Bool)

(assert (=> b!1482804 (= e!831469 (seekKeyOrZeroReturnVacant!0 (x!132920 lt!647195) (index!51342 lt!647195) (index!51342 lt!647195) (select (arr!47997 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156329 () Bool)

(declare-fun lt!647193 () SeekEntryResult!12237)

(assert (=> d!156329 (and (or ((_ is Undefined!12237) lt!647193) (not ((_ is Found!12237) lt!647193)) (and (bvsge (index!51341 lt!647193) #b00000000000000000000000000000000) (bvslt (index!51341 lt!647193) (size!48547 a!2862)))) (or ((_ is Undefined!12237) lt!647193) ((_ is Found!12237) lt!647193) (not ((_ is MissingZero!12237) lt!647193)) (and (bvsge (index!51340 lt!647193) #b00000000000000000000000000000000) (bvslt (index!51340 lt!647193) (size!48547 a!2862)))) (or ((_ is Undefined!12237) lt!647193) ((_ is Found!12237) lt!647193) ((_ is MissingZero!12237) lt!647193) (not ((_ is MissingVacant!12237) lt!647193)) (and (bvsge (index!51343 lt!647193) #b00000000000000000000000000000000) (bvslt (index!51343 lt!647193) (size!48547 a!2862)))) (or ((_ is Undefined!12237) lt!647193) (ite ((_ is Found!12237) lt!647193) (= (select (arr!47997 a!2862) (index!51341 lt!647193)) (select (arr!47997 a!2862) j!93)) (ite ((_ is MissingZero!12237) lt!647193) (= (select (arr!47997 a!2862) (index!51340 lt!647193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12237) lt!647193) (= (select (arr!47997 a!2862) (index!51343 lt!647193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156329 (= lt!647193 e!831468)))

(declare-fun c!137006 () Bool)

(assert (=> d!156329 (= c!137006 (and ((_ is Intermediate!12237) lt!647195) (undefined!13049 lt!647195)))))

(assert (=> d!156329 (= lt!647195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47997 a!2862) j!93) mask!2687) (select (arr!47997 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156329 (validMask!0 mask!2687)))

(assert (=> d!156329 (= (seekEntryOrOpen!0 (select (arr!47997 a!2862) j!93) a!2862 mask!2687) lt!647193)))

(declare-fun b!1482805 () Bool)

(declare-fun c!137005 () Bool)

(declare-fun lt!647194 () (_ BitVec 64))

(assert (=> b!1482805 (= c!137005 (= lt!647194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831470 () SeekEntryResult!12237)

(assert (=> b!1482805 (= e!831470 e!831469)))

(declare-fun b!1482806 () Bool)

(assert (=> b!1482806 (= e!831468 e!831470)))

(assert (=> b!1482806 (= lt!647194 (select (arr!47997 a!2862) (index!51342 lt!647195)))))

(declare-fun c!137007 () Bool)

(assert (=> b!1482806 (= c!137007 (= lt!647194 (select (arr!47997 a!2862) j!93)))))

(declare-fun b!1482807 () Bool)

(assert (=> b!1482807 (= e!831470 (Found!12237 (index!51342 lt!647195)))))

(assert (= (and d!156329 c!137006) b!1482802))

(assert (= (and d!156329 (not c!137006)) b!1482806))

(assert (= (and b!1482806 c!137007) b!1482807))

(assert (= (and b!1482806 (not c!137007)) b!1482805))

(assert (= (and b!1482805 c!137005) b!1482803))

(assert (= (and b!1482805 (not c!137005)) b!1482804))

(assert (=> b!1482804 m!1368263))

(declare-fun m!1368455 () Bool)

(assert (=> b!1482804 m!1368455))

(declare-fun m!1368457 () Bool)

(assert (=> d!156329 m!1368457))

(declare-fun m!1368459 () Bool)

(assert (=> d!156329 m!1368459))

(assert (=> d!156329 m!1368295))

(assert (=> d!156329 m!1368263))

(assert (=> d!156329 m!1368297))

(assert (=> d!156329 m!1368263))

(assert (=> d!156329 m!1368295))

(assert (=> d!156329 m!1368285))

(declare-fun m!1368461 () Bool)

(assert (=> d!156329 m!1368461))

(declare-fun m!1368463 () Bool)

(assert (=> b!1482806 m!1368463))

(assert (=> b!1482550 d!156329))

(declare-fun b!1482809 () Bool)

(declare-fun e!831473 () Bool)

(declare-fun e!831471 () Bool)

(assert (=> b!1482809 (= e!831473 e!831471)))

(declare-fun c!137008 () Bool)

(assert (=> b!1482809 (= c!137008 (validKeyInArray!0 (select (arr!47997 a!2862) j!93)))))

(declare-fun b!1482810 () Bool)

(declare-fun e!831472 () Bool)

(declare-fun call!67859 () Bool)

(assert (=> b!1482810 (= e!831472 call!67859)))

(declare-fun bm!67856 () Bool)

(assert (=> bm!67856 (= call!67859 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482811 () Bool)

(assert (=> b!1482811 (= e!831471 e!831472)))

(declare-fun lt!647197 () (_ BitVec 64))

(assert (=> b!1482811 (= lt!647197 (select (arr!47997 a!2862) j!93))))

(declare-fun lt!647196 () Unit!49814)

(assert (=> b!1482811 (= lt!647196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647197 j!93))))

(assert (=> b!1482811 (arrayContainsKey!0 a!2862 lt!647197 #b00000000000000000000000000000000)))

(declare-fun lt!647198 () Unit!49814)

(assert (=> b!1482811 (= lt!647198 lt!647196)))

(declare-fun res!1007836 () Bool)

(assert (=> b!1482811 (= res!1007836 (= (seekEntryOrOpen!0 (select (arr!47997 a!2862) j!93) a!2862 mask!2687) (Found!12237 j!93)))))

(assert (=> b!1482811 (=> (not res!1007836) (not e!831472))))

(declare-fun b!1482808 () Bool)

(assert (=> b!1482808 (= e!831471 call!67859)))

(declare-fun d!156333 () Bool)

(declare-fun res!1007835 () Bool)

(assert (=> d!156333 (=> res!1007835 e!831473)))

(assert (=> d!156333 (= res!1007835 (bvsge j!93 (size!48547 a!2862)))))

(assert (=> d!156333 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!831473)))

(assert (= (and d!156333 (not res!1007835)) b!1482809))

(assert (= (and b!1482809 c!137008) b!1482811))

(assert (= (and b!1482809 (not c!137008)) b!1482808))

(assert (= (and b!1482811 res!1007836) b!1482810))

(assert (= (or b!1482810 b!1482808) bm!67856))

(assert (=> b!1482809 m!1368263))

(assert (=> b!1482809 m!1368263))

(assert (=> b!1482809 m!1368265))

(declare-fun m!1368465 () Bool)

(assert (=> bm!67856 m!1368465))

(assert (=> b!1482811 m!1368263))

(declare-fun m!1368467 () Bool)

(assert (=> b!1482811 m!1368467))

(declare-fun m!1368469 () Bool)

(assert (=> b!1482811 m!1368469))

(assert (=> b!1482811 m!1368263))

(assert (=> b!1482811 m!1368289))

(assert (=> b!1482548 d!156333))

(declare-fun d!156335 () Bool)

(assert (=> d!156335 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!647201 () Unit!49814)

(declare-fun choose!38 (array!99439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49814)

(assert (=> d!156335 (= lt!647201 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156335 (validMask!0 mask!2687)))

(assert (=> d!156335 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!647201)))

(declare-fun bs!42710 () Bool)

(assert (= bs!42710 d!156335))

(assert (=> bs!42710 m!1368277))

(declare-fun m!1368471 () Bool)

(assert (=> bs!42710 m!1368471))

(assert (=> bs!42710 m!1368285))

(assert (=> b!1482548 d!156335))

(declare-fun d!156337 () Bool)

(assert (=> d!156337 (= (validKeyInArray!0 (select (arr!47997 a!2862) i!1006)) (and (not (= (select (arr!47997 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47997 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482549 d!156337))

(check-sat (not b!1482749) (not bm!67855) (not b!1482662) (not d!156335) (not b!1482758) (not b!1482809) (not bm!67852) (not b!1482736) (not d!156329) (not d!156311) (not b!1482804) (not b!1482627) (not b!1482660) (not d!156317) (not b!1482644) (not b!1482663) (not d!156315) (not d!156291) (not b!1482740) (not b!1482811) (not b!1482738) (not bm!67856) (not d!156289) (not d!156295) (not b!1482683))
(check-sat)
