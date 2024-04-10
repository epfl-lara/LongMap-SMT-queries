; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126672 () Bool)

(assert start!126672)

(declare-fun e!833678 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99571 0))(
  ( (array!99572 (arr!48060 (Array (_ BitVec 32) (_ BitVec 64))) (size!48610 (_ BitVec 32))) )
))
(declare-fun lt!648742 () array!99571)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1487265 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!648744 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12300 0))(
  ( (MissingZero!12300 (index!51592 (_ BitVec 32))) (Found!12300 (index!51593 (_ BitVec 32))) (Intermediate!12300 (undefined!13112 Bool) (index!51594 (_ BitVec 32)) (x!133172 (_ BitVec 32))) (Undefined!12300) (MissingVacant!12300 (index!51595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99571 (_ BitVec 32)) SeekEntryResult!12300)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99571 (_ BitVec 32)) SeekEntryResult!12300)

(assert (=> b!1487265 (= e!833678 (= (seekEntryOrOpen!0 lt!648744 lt!648742 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648744 lt!648742 mask!2687)))))

(declare-fun b!1487266 () Bool)

(declare-fun res!1011551 () Bool)

(declare-fun e!833673 () Bool)

(assert (=> b!1487266 (=> (not res!1011551) (not e!833673))))

(declare-fun a!2862 () array!99571)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1487266 (= res!1011551 (= (seekEntryOrOpen!0 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) (Found!12300 j!93)))))

(declare-fun b!1487267 () Bool)

(declare-fun res!1011543 () Bool)

(declare-fun e!833676 () Bool)

(assert (=> b!1487267 (=> (not res!1011543) (not e!833676))))

(declare-datatypes ((List!34561 0))(
  ( (Nil!34558) (Cons!34557 (h!35934 (_ BitVec 64)) (t!49255 List!34561)) )
))
(declare-fun arrayNoDuplicates!0 (array!99571 (_ BitVec 32) List!34561) Bool)

(assert (=> b!1487267 (= res!1011543 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34558))))

(declare-fun b!1487268 () Bool)

(declare-fun res!1011547 () Bool)

(declare-fun e!833672 () Bool)

(assert (=> b!1487268 (=> (not res!1011547) (not e!833672))))

(declare-fun e!833668 () Bool)

(assert (=> b!1487268 (= res!1011547 e!833668)))

(declare-fun c!137388 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1487268 (= c!137388 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487269 () Bool)

(declare-fun res!1011548 () Bool)

(assert (=> b!1487269 (=> (not res!1011548) (not e!833676))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487269 (= res!1011548 (validKeyInArray!0 (select (arr!48060 a!2862) i!1006)))))

(declare-fun b!1487270 () Bool)

(assert (=> b!1487270 (= e!833668 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648744 lt!648742 mask!2687) (seekEntryOrOpen!0 lt!648744 lt!648742 mask!2687)))))

(declare-fun b!1487271 () Bool)

(declare-fun res!1011541 () Bool)

(assert (=> b!1487271 (=> (not res!1011541) (not e!833672))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487271 (= res!1011541 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487272 () Bool)

(declare-fun res!1011538 () Bool)

(assert (=> b!1487272 (=> (not res!1011538) (not e!833676))))

(assert (=> b!1487272 (= res!1011538 (validKeyInArray!0 (select (arr!48060 a!2862) j!93)))))

(declare-fun res!1011537 () Bool)

(assert (=> start!126672 (=> (not res!1011537) (not e!833676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126672 (= res!1011537 (validMask!0 mask!2687))))

(assert (=> start!126672 e!833676))

(assert (=> start!126672 true))

(declare-fun array_inv!37088 (array!99571) Bool)

(assert (=> start!126672 (array_inv!37088 a!2862)))

(declare-fun b!1487273 () Bool)

(declare-fun e!833671 () Bool)

(assert (=> b!1487273 (= e!833671 e!833672)))

(declare-fun res!1011550 () Bool)

(assert (=> b!1487273 (=> (not res!1011550) (not e!833672))))

(declare-fun lt!648746 () SeekEntryResult!12300)

(assert (=> b!1487273 (= res!1011550 (= lt!648746 (Intermediate!12300 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99571 (_ BitVec 32)) SeekEntryResult!12300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487273 (= lt!648746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648744 mask!2687) lt!648744 lt!648742 mask!2687))))

(assert (=> b!1487273 (= lt!648744 (select (store (arr!48060 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487274 () Bool)

(declare-fun res!1011554 () Bool)

(assert (=> b!1487274 (=> (not res!1011554) (not e!833676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99571 (_ BitVec 32)) Bool)

(assert (=> b!1487274 (= res!1011554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487275 () Bool)

(declare-fun res!1011544 () Bool)

(assert (=> b!1487275 (=> (not res!1011544) (not e!833673))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1487275 (= res!1011544 (or (= (select (arr!48060 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48060 a!2862) intermediateBeforeIndex!19) (select (arr!48060 a!2862) j!93))))))

(declare-fun b!1487276 () Bool)

(declare-fun res!1011545 () Bool)

(assert (=> b!1487276 (=> (not res!1011545) (not e!833671))))

(declare-fun lt!648745 () SeekEntryResult!12300)

(assert (=> b!1487276 (= res!1011545 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648745))))

(declare-fun b!1487277 () Bool)

(declare-fun e!833674 () Bool)

(assert (=> b!1487277 (= e!833674 e!833678)))

(declare-fun res!1011539 () Bool)

(assert (=> b!1487277 (=> (not res!1011539) (not e!833678))))

(declare-fun lt!648747 () (_ BitVec 64))

(assert (=> b!1487277 (= res!1011539 (and (= index!646 intermediateAfterIndex!19) (= lt!648747 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487278 () Bool)

(declare-fun e!833675 () Bool)

(declare-fun e!833669 () Bool)

(assert (=> b!1487278 (= e!833675 e!833669)))

(declare-fun res!1011553 () Bool)

(assert (=> b!1487278 (=> res!1011553 e!833669)))

(declare-fun lt!648743 () (_ BitVec 32))

(assert (=> b!1487278 (= res!1011553 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648743 #b00000000000000000000000000000000) (bvsge lt!648743 (size!48610 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487278 (= lt!648743 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487279 () Bool)

(declare-fun e!833677 () Bool)

(assert (=> b!1487279 (= e!833677 e!833671)))

(declare-fun res!1011556 () Bool)

(assert (=> b!1487279 (=> (not res!1011556) (not e!833671))))

(assert (=> b!1487279 (= res!1011556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648745))))

(assert (=> b!1487279 (= lt!648745 (Intermediate!12300 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487280 () Bool)

(declare-fun res!1011552 () Bool)

(assert (=> b!1487280 (=> (not res!1011552) (not e!833676))))

(assert (=> b!1487280 (= res!1011552 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48610 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48610 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48610 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487281 () Bool)

(assert (=> b!1487281 (= e!833669 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648743 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648745))))

(declare-fun b!1487282 () Bool)

(declare-fun res!1011540 () Bool)

(assert (=> b!1487282 (=> (not res!1011540) (not e!833676))))

(assert (=> b!1487282 (= res!1011540 (and (= (size!48610 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48610 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48610 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487283 () Bool)

(assert (=> b!1487283 (= e!833676 e!833677)))

(declare-fun res!1011549 () Bool)

(assert (=> b!1487283 (=> (not res!1011549) (not e!833677))))

(assert (=> b!1487283 (= res!1011549 (= (select (store (arr!48060 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487283 (= lt!648742 (array!99572 (store (arr!48060 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48610 a!2862)))))

(declare-fun b!1487284 () Bool)

(assert (=> b!1487284 (= e!833668 (= lt!648746 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648744 lt!648742 mask!2687)))))

(declare-fun b!1487285 () Bool)

(assert (=> b!1487285 (= e!833673 e!833674)))

(declare-fun res!1011542 () Bool)

(assert (=> b!1487285 (=> res!1011542 e!833674)))

(assert (=> b!1487285 (= res!1011542 (or (and (= (select (arr!48060 a!2862) index!646) lt!648747) (= (select (arr!48060 a!2862) index!646) (select (arr!48060 a!2862) j!93))) (= (select (arr!48060 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487285 (= lt!648747 (select (store (arr!48060 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487286 () Bool)

(assert (=> b!1487286 (= e!833672 (not e!833675))))

(declare-fun res!1011555 () Bool)

(assert (=> b!1487286 (=> res!1011555 e!833675)))

(assert (=> b!1487286 (= res!1011555 (or (and (= (select (arr!48060 a!2862) index!646) (select (store (arr!48060 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48060 a!2862) index!646) (select (arr!48060 a!2862) j!93))) (= (select (arr!48060 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487286 e!833673))

(declare-fun res!1011546 () Bool)

(assert (=> b!1487286 (=> (not res!1011546) (not e!833673))))

(assert (=> b!1487286 (= res!1011546 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49940 0))(
  ( (Unit!49941) )
))
(declare-fun lt!648741 () Unit!49940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49940)

(assert (=> b!1487286 (= lt!648741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126672 res!1011537) b!1487282))

(assert (= (and b!1487282 res!1011540) b!1487269))

(assert (= (and b!1487269 res!1011548) b!1487272))

(assert (= (and b!1487272 res!1011538) b!1487274))

(assert (= (and b!1487274 res!1011554) b!1487267))

(assert (= (and b!1487267 res!1011543) b!1487280))

(assert (= (and b!1487280 res!1011552) b!1487283))

(assert (= (and b!1487283 res!1011549) b!1487279))

(assert (= (and b!1487279 res!1011556) b!1487276))

(assert (= (and b!1487276 res!1011545) b!1487273))

(assert (= (and b!1487273 res!1011550) b!1487268))

(assert (= (and b!1487268 c!137388) b!1487284))

(assert (= (and b!1487268 (not c!137388)) b!1487270))

(assert (= (and b!1487268 res!1011547) b!1487271))

(assert (= (and b!1487271 res!1011541) b!1487286))

(assert (= (and b!1487286 res!1011546) b!1487266))

(assert (= (and b!1487266 res!1011551) b!1487275))

(assert (= (and b!1487275 res!1011544) b!1487285))

(assert (= (and b!1487285 (not res!1011542)) b!1487277))

(assert (= (and b!1487277 res!1011539) b!1487265))

(assert (= (and b!1487286 (not res!1011555)) b!1487278))

(assert (= (and b!1487278 (not res!1011553)) b!1487281))

(declare-fun m!1371997 () Bool)

(assert (=> b!1487269 m!1371997))

(assert (=> b!1487269 m!1371997))

(declare-fun m!1371999 () Bool)

(assert (=> b!1487269 m!1371999))

(declare-fun m!1372001 () Bool)

(assert (=> b!1487273 m!1372001))

(assert (=> b!1487273 m!1372001))

(declare-fun m!1372003 () Bool)

(assert (=> b!1487273 m!1372003))

(declare-fun m!1372005 () Bool)

(assert (=> b!1487273 m!1372005))

(declare-fun m!1372007 () Bool)

(assert (=> b!1487273 m!1372007))

(declare-fun m!1372009 () Bool)

(assert (=> b!1487272 m!1372009))

(assert (=> b!1487272 m!1372009))

(declare-fun m!1372011 () Bool)

(assert (=> b!1487272 m!1372011))

(declare-fun m!1372013 () Bool)

(assert (=> b!1487284 m!1372013))

(declare-fun m!1372015 () Bool)

(assert (=> b!1487285 m!1372015))

(assert (=> b!1487285 m!1372009))

(assert (=> b!1487285 m!1372005))

(declare-fun m!1372017 () Bool)

(assert (=> b!1487285 m!1372017))

(assert (=> b!1487276 m!1372009))

(assert (=> b!1487276 m!1372009))

(declare-fun m!1372019 () Bool)

(assert (=> b!1487276 m!1372019))

(declare-fun m!1372021 () Bool)

(assert (=> b!1487278 m!1372021))

(declare-fun m!1372023 () Bool)

(assert (=> b!1487267 m!1372023))

(assert (=> b!1487281 m!1372009))

(assert (=> b!1487281 m!1372009))

(declare-fun m!1372025 () Bool)

(assert (=> b!1487281 m!1372025))

(declare-fun m!1372027 () Bool)

(assert (=> b!1487274 m!1372027))

(declare-fun m!1372029 () Bool)

(assert (=> b!1487270 m!1372029))

(declare-fun m!1372031 () Bool)

(assert (=> b!1487270 m!1372031))

(assert (=> b!1487283 m!1372005))

(declare-fun m!1372033 () Bool)

(assert (=> b!1487283 m!1372033))

(declare-fun m!1372035 () Bool)

(assert (=> b!1487275 m!1372035))

(assert (=> b!1487275 m!1372009))

(assert (=> b!1487266 m!1372009))

(assert (=> b!1487266 m!1372009))

(declare-fun m!1372037 () Bool)

(assert (=> b!1487266 m!1372037))

(declare-fun m!1372039 () Bool)

(assert (=> b!1487286 m!1372039))

(assert (=> b!1487286 m!1372005))

(assert (=> b!1487286 m!1372017))

(assert (=> b!1487286 m!1372015))

(declare-fun m!1372041 () Bool)

(assert (=> b!1487286 m!1372041))

(assert (=> b!1487286 m!1372009))

(assert (=> b!1487265 m!1372031))

(assert (=> b!1487265 m!1372029))

(assert (=> b!1487279 m!1372009))

(assert (=> b!1487279 m!1372009))

(declare-fun m!1372043 () Bool)

(assert (=> b!1487279 m!1372043))

(assert (=> b!1487279 m!1372043))

(assert (=> b!1487279 m!1372009))

(declare-fun m!1372045 () Bool)

(assert (=> b!1487279 m!1372045))

(declare-fun m!1372047 () Bool)

(assert (=> start!126672 m!1372047))

(declare-fun m!1372049 () Bool)

(assert (=> start!126672 m!1372049))

(check-sat (not b!1487279) (not b!1487281) (not b!1487284) (not b!1487270) (not b!1487274) (not b!1487286) (not start!126672) (not b!1487278) (not b!1487266) (not b!1487265) (not b!1487276) (not b!1487267) (not b!1487269) (not b!1487273) (not b!1487272))
(check-sat)
(get-model)

(declare-fun b!1487361 () Bool)

(declare-fun e!833719 () Bool)

(declare-fun call!67897 () Bool)

(assert (=> b!1487361 (= e!833719 call!67897)))

(declare-fun bm!67894 () Bool)

(assert (=> bm!67894 (= call!67897 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1487363 () Bool)

(declare-fun e!833718 () Bool)

(assert (=> b!1487363 (= e!833719 e!833718)))

(declare-fun lt!648775 () (_ BitVec 64))

(assert (=> b!1487363 (= lt!648775 (select (arr!48060 a!2862) j!93))))

(declare-fun lt!648776 () Unit!49940)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99571 (_ BitVec 64) (_ BitVec 32)) Unit!49940)

(assert (=> b!1487363 (= lt!648776 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648775 j!93))))

(declare-fun arrayContainsKey!0 (array!99571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1487363 (arrayContainsKey!0 a!2862 lt!648775 #b00000000000000000000000000000000)))

(declare-fun lt!648777 () Unit!49940)

(assert (=> b!1487363 (= lt!648777 lt!648776)))

(declare-fun res!1011621 () Bool)

(assert (=> b!1487363 (= res!1011621 (= (seekEntryOrOpen!0 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) (Found!12300 j!93)))))

(assert (=> b!1487363 (=> (not res!1011621) (not e!833718))))

(declare-fun b!1487364 () Bool)

(assert (=> b!1487364 (= e!833718 call!67897)))

(declare-fun d!156541 () Bool)

(declare-fun res!1011622 () Bool)

(declare-fun e!833720 () Bool)

(assert (=> d!156541 (=> res!1011622 e!833720)))

(assert (=> d!156541 (= res!1011622 (bvsge j!93 (size!48610 a!2862)))))

(assert (=> d!156541 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833720)))

(declare-fun b!1487362 () Bool)

(assert (=> b!1487362 (= e!833720 e!833719)))

(declare-fun c!137394 () Bool)

(assert (=> b!1487362 (= c!137394 (validKeyInArray!0 (select (arr!48060 a!2862) j!93)))))

(assert (= (and d!156541 (not res!1011622)) b!1487362))

(assert (= (and b!1487362 c!137394) b!1487363))

(assert (= (and b!1487362 (not c!137394)) b!1487361))

(assert (= (and b!1487363 res!1011621) b!1487364))

(assert (= (or b!1487364 b!1487361) bm!67894))

(declare-fun m!1372105 () Bool)

(assert (=> bm!67894 m!1372105))

(assert (=> b!1487363 m!1372009))

(declare-fun m!1372107 () Bool)

(assert (=> b!1487363 m!1372107))

(declare-fun m!1372109 () Bool)

(assert (=> b!1487363 m!1372109))

(assert (=> b!1487363 m!1372009))

(assert (=> b!1487363 m!1372037))

(assert (=> b!1487362 m!1372009))

(assert (=> b!1487362 m!1372009))

(assert (=> b!1487362 m!1372011))

(assert (=> b!1487286 d!156541))

(declare-fun d!156543 () Bool)

(assert (=> d!156543 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648780 () Unit!49940)

(declare-fun choose!38 (array!99571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49940)

(assert (=> d!156543 (= lt!648780 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156543 (validMask!0 mask!2687)))

(assert (=> d!156543 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648780)))

(declare-fun bs!42782 () Bool)

(assert (= bs!42782 d!156543))

(assert (=> bs!42782 m!1372041))

(declare-fun m!1372111 () Bool)

(assert (=> bs!42782 m!1372111))

(assert (=> bs!42782 m!1372047))

(assert (=> b!1487286 d!156543))

(declare-fun b!1487377 () Bool)

(declare-fun e!833729 () SeekEntryResult!12300)

(assert (=> b!1487377 (= e!833729 Undefined!12300)))

(declare-fun e!833727 () SeekEntryResult!12300)

(declare-fun lt!648788 () SeekEntryResult!12300)

(declare-fun b!1487379 () Bool)

(assert (=> b!1487379 (= e!833727 (seekKeyOrZeroReturnVacant!0 (x!133172 lt!648788) (index!51594 lt!648788) (index!51594 lt!648788) lt!648744 lt!648742 mask!2687))))

(declare-fun b!1487380 () Bool)

(declare-fun e!833728 () SeekEntryResult!12300)

(assert (=> b!1487380 (= e!833728 (Found!12300 (index!51594 lt!648788)))))

(declare-fun d!156545 () Bool)

(declare-fun lt!648787 () SeekEntryResult!12300)

(get-info :version)

(assert (=> d!156545 (and (or ((_ is Undefined!12300) lt!648787) (not ((_ is Found!12300) lt!648787)) (and (bvsge (index!51593 lt!648787) #b00000000000000000000000000000000) (bvslt (index!51593 lt!648787) (size!48610 lt!648742)))) (or ((_ is Undefined!12300) lt!648787) ((_ is Found!12300) lt!648787) (not ((_ is MissingZero!12300) lt!648787)) (and (bvsge (index!51592 lt!648787) #b00000000000000000000000000000000) (bvslt (index!51592 lt!648787) (size!48610 lt!648742)))) (or ((_ is Undefined!12300) lt!648787) ((_ is Found!12300) lt!648787) ((_ is MissingZero!12300) lt!648787) (not ((_ is MissingVacant!12300) lt!648787)) (and (bvsge (index!51595 lt!648787) #b00000000000000000000000000000000) (bvslt (index!51595 lt!648787) (size!48610 lt!648742)))) (or ((_ is Undefined!12300) lt!648787) (ite ((_ is Found!12300) lt!648787) (= (select (arr!48060 lt!648742) (index!51593 lt!648787)) lt!648744) (ite ((_ is MissingZero!12300) lt!648787) (= (select (arr!48060 lt!648742) (index!51592 lt!648787)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12300) lt!648787) (= (select (arr!48060 lt!648742) (index!51595 lt!648787)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156545 (= lt!648787 e!833729)))

(declare-fun c!137402 () Bool)

(assert (=> d!156545 (= c!137402 (and ((_ is Intermediate!12300) lt!648788) (undefined!13112 lt!648788)))))

(assert (=> d!156545 (= lt!648788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648744 mask!2687) lt!648744 lt!648742 mask!2687))))

(assert (=> d!156545 (validMask!0 mask!2687)))

(assert (=> d!156545 (= (seekEntryOrOpen!0 lt!648744 lt!648742 mask!2687) lt!648787)))

(declare-fun b!1487378 () Bool)

(declare-fun c!137403 () Bool)

(declare-fun lt!648789 () (_ BitVec 64))

(assert (=> b!1487378 (= c!137403 (= lt!648789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487378 (= e!833728 e!833727)))

(declare-fun b!1487381 () Bool)

(assert (=> b!1487381 (= e!833727 (MissingZero!12300 (index!51594 lt!648788)))))

(declare-fun b!1487382 () Bool)

(assert (=> b!1487382 (= e!833729 e!833728)))

(assert (=> b!1487382 (= lt!648789 (select (arr!48060 lt!648742) (index!51594 lt!648788)))))

(declare-fun c!137401 () Bool)

(assert (=> b!1487382 (= c!137401 (= lt!648789 lt!648744))))

(assert (= (and d!156545 c!137402) b!1487377))

(assert (= (and d!156545 (not c!137402)) b!1487382))

(assert (= (and b!1487382 c!137401) b!1487380))

(assert (= (and b!1487382 (not c!137401)) b!1487378))

(assert (= (and b!1487378 c!137403) b!1487381))

(assert (= (and b!1487378 (not c!137403)) b!1487379))

(declare-fun m!1372113 () Bool)

(assert (=> b!1487379 m!1372113))

(assert (=> d!156545 m!1372047))

(assert (=> d!156545 m!1372001))

(declare-fun m!1372115 () Bool)

(assert (=> d!156545 m!1372115))

(declare-fun m!1372117 () Bool)

(assert (=> d!156545 m!1372117))

(declare-fun m!1372119 () Bool)

(assert (=> d!156545 m!1372119))

(assert (=> d!156545 m!1372001))

(assert (=> d!156545 m!1372003))

(declare-fun m!1372121 () Bool)

(assert (=> b!1487382 m!1372121))

(assert (=> b!1487265 d!156545))

(declare-fun b!1487395 () Bool)

(declare-fun e!833737 () SeekEntryResult!12300)

(assert (=> b!1487395 (= e!833737 Undefined!12300)))

(declare-fun lt!648794 () SeekEntryResult!12300)

(declare-fun d!156547 () Bool)

(assert (=> d!156547 (and (or ((_ is Undefined!12300) lt!648794) (not ((_ is Found!12300) lt!648794)) (and (bvsge (index!51593 lt!648794) #b00000000000000000000000000000000) (bvslt (index!51593 lt!648794) (size!48610 lt!648742)))) (or ((_ is Undefined!12300) lt!648794) ((_ is Found!12300) lt!648794) (not ((_ is MissingVacant!12300) lt!648794)) (not (= (index!51595 lt!648794) intermediateAfterIndex!19)) (and (bvsge (index!51595 lt!648794) #b00000000000000000000000000000000) (bvslt (index!51595 lt!648794) (size!48610 lt!648742)))) (or ((_ is Undefined!12300) lt!648794) (ite ((_ is Found!12300) lt!648794) (= (select (arr!48060 lt!648742) (index!51593 lt!648794)) lt!648744) (and ((_ is MissingVacant!12300) lt!648794) (= (index!51595 lt!648794) intermediateAfterIndex!19) (= (select (arr!48060 lt!648742) (index!51595 lt!648794)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156547 (= lt!648794 e!833737)))

(declare-fun c!137412 () Bool)

(assert (=> d!156547 (= c!137412 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648795 () (_ BitVec 64))

(assert (=> d!156547 (= lt!648795 (select (arr!48060 lt!648742) index!646))))

(assert (=> d!156547 (validMask!0 mask!2687)))

(assert (=> d!156547 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648744 lt!648742 mask!2687) lt!648794)))

(declare-fun b!1487396 () Bool)

(declare-fun e!833736 () SeekEntryResult!12300)

(assert (=> b!1487396 (= e!833736 (MissingVacant!12300 intermediateAfterIndex!19))))

(declare-fun b!1487397 () Bool)

(declare-fun c!137410 () Bool)

(assert (=> b!1487397 (= c!137410 (= lt!648795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833738 () SeekEntryResult!12300)

(assert (=> b!1487397 (= e!833738 e!833736)))

(declare-fun b!1487398 () Bool)

(assert (=> b!1487398 (= e!833738 (Found!12300 index!646))))

(declare-fun b!1487399 () Bool)

(assert (=> b!1487399 (= e!833737 e!833738)))

(declare-fun c!137411 () Bool)

(assert (=> b!1487399 (= c!137411 (= lt!648795 lt!648744))))

(declare-fun b!1487400 () Bool)

(assert (=> b!1487400 (= e!833736 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648744 lt!648742 mask!2687))))

(assert (= (and d!156547 c!137412) b!1487395))

(assert (= (and d!156547 (not c!137412)) b!1487399))

(assert (= (and b!1487399 c!137411) b!1487398))

(assert (= (and b!1487399 (not c!137411)) b!1487397))

(assert (= (and b!1487397 c!137410) b!1487396))

(assert (= (and b!1487397 (not c!137410)) b!1487400))

(declare-fun m!1372123 () Bool)

(assert (=> d!156547 m!1372123))

(declare-fun m!1372125 () Bool)

(assert (=> d!156547 m!1372125))

(declare-fun m!1372127 () Bool)

(assert (=> d!156547 m!1372127))

(assert (=> d!156547 m!1372047))

(assert (=> b!1487400 m!1372021))

(assert (=> b!1487400 m!1372021))

(declare-fun m!1372129 () Bool)

(assert (=> b!1487400 m!1372129))

(assert (=> b!1487265 d!156547))

(declare-fun b!1487442 () Bool)

(declare-fun lt!648809 () SeekEntryResult!12300)

(assert (=> b!1487442 (and (bvsge (index!51594 lt!648809) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648809) (size!48610 a!2862)))))

(declare-fun res!1011642 () Bool)

(assert (=> b!1487442 (= res!1011642 (= (select (arr!48060 a!2862) (index!51594 lt!648809)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833770 () Bool)

(assert (=> b!1487442 (=> res!1011642 e!833770)))

(declare-fun b!1487443 () Bool)

(assert (=> b!1487443 (and (bvsge (index!51594 lt!648809) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648809) (size!48610 a!2862)))))

(assert (=> b!1487443 (= e!833770 (= (select (arr!48060 a!2862) (index!51594 lt!648809)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156549 () Bool)

(declare-fun e!833769 () Bool)

(assert (=> d!156549 e!833769))

(declare-fun c!137424 () Bool)

(assert (=> d!156549 (= c!137424 (and ((_ is Intermediate!12300) lt!648809) (undefined!13112 lt!648809)))))

(declare-fun e!833768 () SeekEntryResult!12300)

(assert (=> d!156549 (= lt!648809 e!833768)))

(declare-fun c!137425 () Bool)

(assert (=> d!156549 (= c!137425 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648810 () (_ BitVec 64))

(assert (=> d!156549 (= lt!648810 (select (arr!48060 a!2862) index!646))))

(assert (=> d!156549 (validMask!0 mask!2687)))

(assert (=> d!156549 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648809)))

(declare-fun b!1487444 () Bool)

(assert (=> b!1487444 (and (bvsge (index!51594 lt!648809) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648809) (size!48610 a!2862)))))

(declare-fun res!1011644 () Bool)

(assert (=> b!1487444 (= res!1011644 (= (select (arr!48060 a!2862) (index!51594 lt!648809)) (select (arr!48060 a!2862) j!93)))))

(assert (=> b!1487444 (=> res!1011644 e!833770)))

(declare-fun e!833767 () Bool)

(assert (=> b!1487444 (= e!833767 e!833770)))

(declare-fun b!1487445 () Bool)

(declare-fun e!833771 () SeekEntryResult!12300)

(assert (=> b!1487445 (= e!833768 e!833771)))

(declare-fun c!137426 () Bool)

(assert (=> b!1487445 (= c!137426 (or (= lt!648810 (select (arr!48060 a!2862) j!93)) (= (bvadd lt!648810 lt!648810) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487446 () Bool)

(assert (=> b!1487446 (= e!833769 (bvsge (x!133172 lt!648809) #b01111111111111111111111111111110))))

(declare-fun b!1487447 () Bool)

(assert (=> b!1487447 (= e!833771 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48060 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487448 () Bool)

(assert (=> b!1487448 (= e!833771 (Intermediate!12300 false index!646 x!665))))

(declare-fun b!1487449 () Bool)

(assert (=> b!1487449 (= e!833769 e!833767)))

(declare-fun res!1011643 () Bool)

(assert (=> b!1487449 (= res!1011643 (and ((_ is Intermediate!12300) lt!648809) (not (undefined!13112 lt!648809)) (bvslt (x!133172 lt!648809) #b01111111111111111111111111111110) (bvsge (x!133172 lt!648809) #b00000000000000000000000000000000) (bvsge (x!133172 lt!648809) x!665)))))

(assert (=> b!1487449 (=> (not res!1011643) (not e!833767))))

(declare-fun b!1487450 () Bool)

(assert (=> b!1487450 (= e!833768 (Intermediate!12300 true index!646 x!665))))

(assert (= (and d!156549 c!137425) b!1487450))

(assert (= (and d!156549 (not c!137425)) b!1487445))

(assert (= (and b!1487445 c!137426) b!1487448))

(assert (= (and b!1487445 (not c!137426)) b!1487447))

(assert (= (and d!156549 c!137424) b!1487446))

(assert (= (and d!156549 (not c!137424)) b!1487449))

(assert (= (and b!1487449 res!1011643) b!1487444))

(assert (= (and b!1487444 (not res!1011644)) b!1487442))

(assert (= (and b!1487442 (not res!1011642)) b!1487443))

(assert (=> d!156549 m!1372015))

(assert (=> d!156549 m!1372047))

(assert (=> b!1487447 m!1372021))

(assert (=> b!1487447 m!1372021))

(assert (=> b!1487447 m!1372009))

(declare-fun m!1372141 () Bool)

(assert (=> b!1487447 m!1372141))

(declare-fun m!1372143 () Bool)

(assert (=> b!1487442 m!1372143))

(assert (=> b!1487443 m!1372143))

(assert (=> b!1487444 m!1372143))

(assert (=> b!1487276 d!156549))

(declare-fun b!1487455 () Bool)

(declare-fun e!833777 () SeekEntryResult!12300)

(assert (=> b!1487455 (= e!833777 Undefined!12300)))

(declare-fun lt!648815 () SeekEntryResult!12300)

(declare-fun b!1487457 () Bool)

(declare-fun e!833775 () SeekEntryResult!12300)

(assert (=> b!1487457 (= e!833775 (seekKeyOrZeroReturnVacant!0 (x!133172 lt!648815) (index!51594 lt!648815) (index!51594 lt!648815) (select (arr!48060 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487458 () Bool)

(declare-fun e!833776 () SeekEntryResult!12300)

(assert (=> b!1487458 (= e!833776 (Found!12300 (index!51594 lt!648815)))))

(declare-fun d!156561 () Bool)

(declare-fun lt!648814 () SeekEntryResult!12300)

(assert (=> d!156561 (and (or ((_ is Undefined!12300) lt!648814) (not ((_ is Found!12300) lt!648814)) (and (bvsge (index!51593 lt!648814) #b00000000000000000000000000000000) (bvslt (index!51593 lt!648814) (size!48610 a!2862)))) (or ((_ is Undefined!12300) lt!648814) ((_ is Found!12300) lt!648814) (not ((_ is MissingZero!12300) lt!648814)) (and (bvsge (index!51592 lt!648814) #b00000000000000000000000000000000) (bvslt (index!51592 lt!648814) (size!48610 a!2862)))) (or ((_ is Undefined!12300) lt!648814) ((_ is Found!12300) lt!648814) ((_ is MissingZero!12300) lt!648814) (not ((_ is MissingVacant!12300) lt!648814)) (and (bvsge (index!51595 lt!648814) #b00000000000000000000000000000000) (bvslt (index!51595 lt!648814) (size!48610 a!2862)))) (or ((_ is Undefined!12300) lt!648814) (ite ((_ is Found!12300) lt!648814) (= (select (arr!48060 a!2862) (index!51593 lt!648814)) (select (arr!48060 a!2862) j!93)) (ite ((_ is MissingZero!12300) lt!648814) (= (select (arr!48060 a!2862) (index!51592 lt!648814)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12300) lt!648814) (= (select (arr!48060 a!2862) (index!51595 lt!648814)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156561 (= lt!648814 e!833777)))

(declare-fun c!137429 () Bool)

(assert (=> d!156561 (= c!137429 (and ((_ is Intermediate!12300) lt!648815) (undefined!13112 lt!648815)))))

(assert (=> d!156561 (= lt!648815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) (select (arr!48060 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156561 (validMask!0 mask!2687)))

(assert (=> d!156561 (= (seekEntryOrOpen!0 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648814)))

(declare-fun b!1487456 () Bool)

(declare-fun c!137430 () Bool)

(declare-fun lt!648816 () (_ BitVec 64))

(assert (=> b!1487456 (= c!137430 (= lt!648816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487456 (= e!833776 e!833775)))

(declare-fun b!1487459 () Bool)

(assert (=> b!1487459 (= e!833775 (MissingZero!12300 (index!51594 lt!648815)))))

(declare-fun b!1487460 () Bool)

(assert (=> b!1487460 (= e!833777 e!833776)))

(assert (=> b!1487460 (= lt!648816 (select (arr!48060 a!2862) (index!51594 lt!648815)))))

(declare-fun c!137428 () Bool)

(assert (=> b!1487460 (= c!137428 (= lt!648816 (select (arr!48060 a!2862) j!93)))))

(assert (= (and d!156561 c!137429) b!1487455))

(assert (= (and d!156561 (not c!137429)) b!1487460))

(assert (= (and b!1487460 c!137428) b!1487458))

(assert (= (and b!1487460 (not c!137428)) b!1487456))

(assert (= (and b!1487456 c!137430) b!1487459))

(assert (= (and b!1487456 (not c!137430)) b!1487457))

(assert (=> b!1487457 m!1372009))

(declare-fun m!1372151 () Bool)

(assert (=> b!1487457 m!1372151))

(assert (=> d!156561 m!1372047))

(assert (=> d!156561 m!1372009))

(assert (=> d!156561 m!1372043))

(declare-fun m!1372153 () Bool)

(assert (=> d!156561 m!1372153))

(declare-fun m!1372155 () Bool)

(assert (=> d!156561 m!1372155))

(declare-fun m!1372157 () Bool)

(assert (=> d!156561 m!1372157))

(assert (=> d!156561 m!1372043))

(assert (=> d!156561 m!1372009))

(assert (=> d!156561 m!1372045))

(declare-fun m!1372159 () Bool)

(assert (=> b!1487460 m!1372159))

(assert (=> b!1487266 d!156561))

(declare-fun d!156565 () Bool)

(assert (=> d!156565 (= (validKeyInArray!0 (select (arr!48060 a!2862) j!93)) (and (not (= (select (arr!48060 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48060 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487272 d!156565))

(declare-fun b!1487461 () Bool)

(declare-fun lt!648817 () SeekEntryResult!12300)

(assert (=> b!1487461 (and (bvsge (index!51594 lt!648817) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648817) (size!48610 lt!648742)))))

(declare-fun res!1011647 () Bool)

(assert (=> b!1487461 (= res!1011647 (= (select (arr!48060 lt!648742) (index!51594 lt!648817)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833781 () Bool)

(assert (=> b!1487461 (=> res!1011647 e!833781)))

(declare-fun b!1487462 () Bool)

(assert (=> b!1487462 (and (bvsge (index!51594 lt!648817) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648817) (size!48610 lt!648742)))))

(assert (=> b!1487462 (= e!833781 (= (select (arr!48060 lt!648742) (index!51594 lt!648817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156567 () Bool)

(declare-fun e!833780 () Bool)

(assert (=> d!156567 e!833780))

(declare-fun c!137431 () Bool)

(assert (=> d!156567 (= c!137431 (and ((_ is Intermediate!12300) lt!648817) (undefined!13112 lt!648817)))))

(declare-fun e!833779 () SeekEntryResult!12300)

(assert (=> d!156567 (= lt!648817 e!833779)))

(declare-fun c!137432 () Bool)

(assert (=> d!156567 (= c!137432 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648818 () (_ BitVec 64))

(assert (=> d!156567 (= lt!648818 (select (arr!48060 lt!648742) (toIndex!0 lt!648744 mask!2687)))))

(assert (=> d!156567 (validMask!0 mask!2687)))

(assert (=> d!156567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648744 mask!2687) lt!648744 lt!648742 mask!2687) lt!648817)))

(declare-fun b!1487463 () Bool)

(assert (=> b!1487463 (and (bvsge (index!51594 lt!648817) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648817) (size!48610 lt!648742)))))

(declare-fun res!1011649 () Bool)

(assert (=> b!1487463 (= res!1011649 (= (select (arr!48060 lt!648742) (index!51594 lt!648817)) lt!648744))))

(assert (=> b!1487463 (=> res!1011649 e!833781)))

(declare-fun e!833778 () Bool)

(assert (=> b!1487463 (= e!833778 e!833781)))

(declare-fun b!1487464 () Bool)

(declare-fun e!833782 () SeekEntryResult!12300)

(assert (=> b!1487464 (= e!833779 e!833782)))

(declare-fun c!137433 () Bool)

(assert (=> b!1487464 (= c!137433 (or (= lt!648818 lt!648744) (= (bvadd lt!648818 lt!648818) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487465 () Bool)

(assert (=> b!1487465 (= e!833780 (bvsge (x!133172 lt!648817) #b01111111111111111111111111111110))))

(declare-fun b!1487466 () Bool)

(assert (=> b!1487466 (= e!833782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648744 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648744 lt!648742 mask!2687))))

(declare-fun b!1487467 () Bool)

(assert (=> b!1487467 (= e!833782 (Intermediate!12300 false (toIndex!0 lt!648744 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487468 () Bool)

(assert (=> b!1487468 (= e!833780 e!833778)))

(declare-fun res!1011648 () Bool)

(assert (=> b!1487468 (= res!1011648 (and ((_ is Intermediate!12300) lt!648817) (not (undefined!13112 lt!648817)) (bvslt (x!133172 lt!648817) #b01111111111111111111111111111110) (bvsge (x!133172 lt!648817) #b00000000000000000000000000000000) (bvsge (x!133172 lt!648817) #b00000000000000000000000000000000)))))

(assert (=> b!1487468 (=> (not res!1011648) (not e!833778))))

(declare-fun b!1487469 () Bool)

(assert (=> b!1487469 (= e!833779 (Intermediate!12300 true (toIndex!0 lt!648744 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156567 c!137432) b!1487469))

(assert (= (and d!156567 (not c!137432)) b!1487464))

(assert (= (and b!1487464 c!137433) b!1487467))

(assert (= (and b!1487464 (not c!137433)) b!1487466))

(assert (= (and d!156567 c!137431) b!1487465))

(assert (= (and d!156567 (not c!137431)) b!1487468))

(assert (= (and b!1487468 res!1011648) b!1487463))

(assert (= (and b!1487463 (not res!1011649)) b!1487461))

(assert (= (and b!1487461 (not res!1011647)) b!1487462))

(assert (=> d!156567 m!1372001))

(declare-fun m!1372161 () Bool)

(assert (=> d!156567 m!1372161))

(assert (=> d!156567 m!1372047))

(assert (=> b!1487466 m!1372001))

(declare-fun m!1372163 () Bool)

(assert (=> b!1487466 m!1372163))

(assert (=> b!1487466 m!1372163))

(declare-fun m!1372165 () Bool)

(assert (=> b!1487466 m!1372165))

(declare-fun m!1372167 () Bool)

(assert (=> b!1487461 m!1372167))

(assert (=> b!1487462 m!1372167))

(assert (=> b!1487463 m!1372167))

(assert (=> b!1487273 d!156567))

(declare-fun d!156569 () Bool)

(declare-fun lt!648834 () (_ BitVec 32))

(declare-fun lt!648833 () (_ BitVec 32))

(assert (=> d!156569 (= lt!648834 (bvmul (bvxor lt!648833 (bvlshr lt!648833 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156569 (= lt!648833 ((_ extract 31 0) (bvand (bvxor lt!648744 (bvlshr lt!648744 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156569 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011650 (let ((h!35936 ((_ extract 31 0) (bvand (bvxor lt!648744 (bvlshr lt!648744 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133177 (bvmul (bvxor h!35936 (bvlshr h!35936 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133177 (bvlshr x!133177 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011650 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011650 #b00000000000000000000000000000000))))))

(assert (=> d!156569 (= (toIndex!0 lt!648744 mask!2687) (bvand (bvxor lt!648834 (bvlshr lt!648834 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487273 d!156569))

(declare-fun b!1487486 () Bool)

(declare-fun lt!648835 () SeekEntryResult!12300)

(assert (=> b!1487486 (and (bvsge (index!51594 lt!648835) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648835) (size!48610 lt!648742)))))

(declare-fun res!1011653 () Bool)

(assert (=> b!1487486 (= res!1011653 (= (select (arr!48060 lt!648742) (index!51594 lt!648835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833795 () Bool)

(assert (=> b!1487486 (=> res!1011653 e!833795)))

(declare-fun b!1487487 () Bool)

(assert (=> b!1487487 (and (bvsge (index!51594 lt!648835) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648835) (size!48610 lt!648742)))))

(assert (=> b!1487487 (= e!833795 (= (select (arr!48060 lt!648742) (index!51594 lt!648835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156577 () Bool)

(declare-fun e!833794 () Bool)

(assert (=> d!156577 e!833794))

(declare-fun c!137441 () Bool)

(assert (=> d!156577 (= c!137441 (and ((_ is Intermediate!12300) lt!648835) (undefined!13112 lt!648835)))))

(declare-fun e!833793 () SeekEntryResult!12300)

(assert (=> d!156577 (= lt!648835 e!833793)))

(declare-fun c!137442 () Bool)

(assert (=> d!156577 (= c!137442 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648836 () (_ BitVec 64))

(assert (=> d!156577 (= lt!648836 (select (arr!48060 lt!648742) index!646))))

(assert (=> d!156577 (validMask!0 mask!2687)))

(assert (=> d!156577 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648744 lt!648742 mask!2687) lt!648835)))

(declare-fun b!1487488 () Bool)

(assert (=> b!1487488 (and (bvsge (index!51594 lt!648835) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648835) (size!48610 lt!648742)))))

(declare-fun res!1011655 () Bool)

(assert (=> b!1487488 (= res!1011655 (= (select (arr!48060 lt!648742) (index!51594 lt!648835)) lt!648744))))

(assert (=> b!1487488 (=> res!1011655 e!833795)))

(declare-fun e!833792 () Bool)

(assert (=> b!1487488 (= e!833792 e!833795)))

(declare-fun b!1487489 () Bool)

(declare-fun e!833796 () SeekEntryResult!12300)

(assert (=> b!1487489 (= e!833793 e!833796)))

(declare-fun c!137443 () Bool)

(assert (=> b!1487489 (= c!137443 (or (= lt!648836 lt!648744) (= (bvadd lt!648836 lt!648836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487490 () Bool)

(assert (=> b!1487490 (= e!833794 (bvsge (x!133172 lt!648835) #b01111111111111111111111111111110))))

(declare-fun b!1487491 () Bool)

(assert (=> b!1487491 (= e!833796 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648744 lt!648742 mask!2687))))

(declare-fun b!1487492 () Bool)

(assert (=> b!1487492 (= e!833796 (Intermediate!12300 false index!646 x!665))))

(declare-fun b!1487493 () Bool)

(assert (=> b!1487493 (= e!833794 e!833792)))

(declare-fun res!1011654 () Bool)

(assert (=> b!1487493 (= res!1011654 (and ((_ is Intermediate!12300) lt!648835) (not (undefined!13112 lt!648835)) (bvslt (x!133172 lt!648835) #b01111111111111111111111111111110) (bvsge (x!133172 lt!648835) #b00000000000000000000000000000000) (bvsge (x!133172 lt!648835) x!665)))))

(assert (=> b!1487493 (=> (not res!1011654) (not e!833792))))

(declare-fun b!1487494 () Bool)

(assert (=> b!1487494 (= e!833793 (Intermediate!12300 true index!646 x!665))))

(assert (= (and d!156577 c!137442) b!1487494))

(assert (= (and d!156577 (not c!137442)) b!1487489))

(assert (= (and b!1487489 c!137443) b!1487492))

(assert (= (and b!1487489 (not c!137443)) b!1487491))

(assert (= (and d!156577 c!137441) b!1487490))

(assert (= (and d!156577 (not c!137441)) b!1487493))

(assert (= (and b!1487493 res!1011654) b!1487488))

(assert (= (and b!1487488 (not res!1011655)) b!1487486))

(assert (= (and b!1487486 (not res!1011653)) b!1487487))

(assert (=> d!156577 m!1372127))

(assert (=> d!156577 m!1372047))

(assert (=> b!1487491 m!1372021))

(assert (=> b!1487491 m!1372021))

(declare-fun m!1372183 () Bool)

(assert (=> b!1487491 m!1372183))

(declare-fun m!1372185 () Bool)

(assert (=> b!1487486 m!1372185))

(assert (=> b!1487487 m!1372185))

(assert (=> b!1487488 m!1372185))

(assert (=> b!1487284 d!156577))

(declare-fun b!1487501 () Bool)

(declare-fun e!833802 () Bool)

(declare-fun call!67905 () Bool)

(assert (=> b!1487501 (= e!833802 call!67905)))

(declare-fun bm!67902 () Bool)

(assert (=> bm!67902 (= call!67905 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1487503 () Bool)

(declare-fun e!833801 () Bool)

(assert (=> b!1487503 (= e!833802 e!833801)))

(declare-fun lt!648837 () (_ BitVec 64))

(assert (=> b!1487503 (= lt!648837 (select (arr!48060 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648838 () Unit!49940)

(assert (=> b!1487503 (= lt!648838 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648837 #b00000000000000000000000000000000))))

(assert (=> b!1487503 (arrayContainsKey!0 a!2862 lt!648837 #b00000000000000000000000000000000)))

(declare-fun lt!648839 () Unit!49940)

(assert (=> b!1487503 (= lt!648839 lt!648838)))

(declare-fun res!1011662 () Bool)

(assert (=> b!1487503 (= res!1011662 (= (seekEntryOrOpen!0 (select (arr!48060 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12300 #b00000000000000000000000000000000)))))

(assert (=> b!1487503 (=> (not res!1011662) (not e!833801))))

(declare-fun b!1487504 () Bool)

(assert (=> b!1487504 (= e!833801 call!67905)))

(declare-fun d!156579 () Bool)

(declare-fun res!1011663 () Bool)

(declare-fun e!833803 () Bool)

(assert (=> d!156579 (=> res!1011663 e!833803)))

(assert (=> d!156579 (= res!1011663 (bvsge #b00000000000000000000000000000000 (size!48610 a!2862)))))

(assert (=> d!156579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!833803)))

(declare-fun b!1487502 () Bool)

(assert (=> b!1487502 (= e!833803 e!833802)))

(declare-fun c!137444 () Bool)

(assert (=> b!1487502 (= c!137444 (validKeyInArray!0 (select (arr!48060 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156579 (not res!1011663)) b!1487502))

(assert (= (and b!1487502 c!137444) b!1487503))

(assert (= (and b!1487502 (not c!137444)) b!1487501))

(assert (= (and b!1487503 res!1011662) b!1487504))

(assert (= (or b!1487504 b!1487501) bm!67902))

(declare-fun m!1372187 () Bool)

(assert (=> bm!67902 m!1372187))

(declare-fun m!1372189 () Bool)

(assert (=> b!1487503 m!1372189))

(declare-fun m!1372191 () Bool)

(assert (=> b!1487503 m!1372191))

(declare-fun m!1372193 () Bool)

(assert (=> b!1487503 m!1372193))

(assert (=> b!1487503 m!1372189))

(declare-fun m!1372195 () Bool)

(assert (=> b!1487503 m!1372195))

(assert (=> b!1487502 m!1372189))

(assert (=> b!1487502 m!1372189))

(declare-fun m!1372197 () Bool)

(assert (=> b!1487502 m!1372197))

(assert (=> b!1487274 d!156579))

(declare-fun d!156581 () Bool)

(assert (=> d!156581 (= (validKeyInArray!0 (select (arr!48060 a!2862) i!1006)) (and (not (= (select (arr!48060 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48060 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487269 d!156581))

(assert (=> b!1487270 d!156547))

(assert (=> b!1487270 d!156545))

(declare-fun b!1487505 () Bool)

(declare-fun lt!648840 () SeekEntryResult!12300)

(assert (=> b!1487505 (and (bvsge (index!51594 lt!648840) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648840) (size!48610 a!2862)))))

(declare-fun res!1011664 () Bool)

(assert (=> b!1487505 (= res!1011664 (= (select (arr!48060 a!2862) (index!51594 lt!648840)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833807 () Bool)

(assert (=> b!1487505 (=> res!1011664 e!833807)))

(declare-fun b!1487506 () Bool)

(assert (=> b!1487506 (and (bvsge (index!51594 lt!648840) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648840) (size!48610 a!2862)))))

(assert (=> b!1487506 (= e!833807 (= (select (arr!48060 a!2862) (index!51594 lt!648840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156583 () Bool)

(declare-fun e!833806 () Bool)

(assert (=> d!156583 e!833806))

(declare-fun c!137445 () Bool)

(assert (=> d!156583 (= c!137445 (and ((_ is Intermediate!12300) lt!648840) (undefined!13112 lt!648840)))))

(declare-fun e!833805 () SeekEntryResult!12300)

(assert (=> d!156583 (= lt!648840 e!833805)))

(declare-fun c!137446 () Bool)

(assert (=> d!156583 (= c!137446 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!648841 () (_ BitVec 64))

(assert (=> d!156583 (= lt!648841 (select (arr!48060 a!2862) lt!648743))))

(assert (=> d!156583 (validMask!0 mask!2687)))

(assert (=> d!156583 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648743 (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648840)))

(declare-fun b!1487507 () Bool)

(assert (=> b!1487507 (and (bvsge (index!51594 lt!648840) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648840) (size!48610 a!2862)))))

(declare-fun res!1011666 () Bool)

(assert (=> b!1487507 (= res!1011666 (= (select (arr!48060 a!2862) (index!51594 lt!648840)) (select (arr!48060 a!2862) j!93)))))

(assert (=> b!1487507 (=> res!1011666 e!833807)))

(declare-fun e!833804 () Bool)

(assert (=> b!1487507 (= e!833804 e!833807)))

(declare-fun b!1487508 () Bool)

(declare-fun e!833808 () SeekEntryResult!12300)

(assert (=> b!1487508 (= e!833805 e!833808)))

(declare-fun c!137447 () Bool)

(assert (=> b!1487508 (= c!137447 (or (= lt!648841 (select (arr!48060 a!2862) j!93)) (= (bvadd lt!648841 lt!648841) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487509 () Bool)

(assert (=> b!1487509 (= e!833806 (bvsge (x!133172 lt!648840) #b01111111111111111111111111111110))))

(declare-fun b!1487510 () Bool)

(assert (=> b!1487510 (= e!833808 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648743 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48060 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487511 () Bool)

(assert (=> b!1487511 (= e!833808 (Intermediate!12300 false lt!648743 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487512 () Bool)

(assert (=> b!1487512 (= e!833806 e!833804)))

(declare-fun res!1011665 () Bool)

(assert (=> b!1487512 (= res!1011665 (and ((_ is Intermediate!12300) lt!648840) (not (undefined!13112 lt!648840)) (bvslt (x!133172 lt!648840) #b01111111111111111111111111111110) (bvsge (x!133172 lt!648840) #b00000000000000000000000000000000) (bvsge (x!133172 lt!648840) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1487512 (=> (not res!1011665) (not e!833804))))

(declare-fun b!1487513 () Bool)

(assert (=> b!1487513 (= e!833805 (Intermediate!12300 true lt!648743 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!156583 c!137446) b!1487513))

(assert (= (and d!156583 (not c!137446)) b!1487508))

(assert (= (and b!1487508 c!137447) b!1487511))

(assert (= (and b!1487508 (not c!137447)) b!1487510))

(assert (= (and d!156583 c!137445) b!1487509))

(assert (= (and d!156583 (not c!137445)) b!1487512))

(assert (= (and b!1487512 res!1011665) b!1487507))

(assert (= (and b!1487507 (not res!1011666)) b!1487505))

(assert (= (and b!1487505 (not res!1011664)) b!1487506))

(declare-fun m!1372199 () Bool)

(assert (=> d!156583 m!1372199))

(assert (=> d!156583 m!1372047))

(declare-fun m!1372201 () Bool)

(assert (=> b!1487510 m!1372201))

(assert (=> b!1487510 m!1372201))

(assert (=> b!1487510 m!1372009))

(declare-fun m!1372203 () Bool)

(assert (=> b!1487510 m!1372203))

(declare-fun m!1372205 () Bool)

(assert (=> b!1487505 m!1372205))

(assert (=> b!1487506 m!1372205))

(assert (=> b!1487507 m!1372205))

(assert (=> b!1487281 d!156583))

(declare-fun d!156585 () Bool)

(assert (=> d!156585 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126672 d!156585))

(declare-fun d!156597 () Bool)

(assert (=> d!156597 (= (array_inv!37088 a!2862) (bvsge (size!48610 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126672 d!156597))

(declare-fun b!1487586 () Bool)

(declare-fun e!833855 () Bool)

(declare-fun call!67910 () Bool)

(assert (=> b!1487586 (= e!833855 call!67910)))

(declare-fun bm!67907 () Bool)

(declare-fun c!137470 () Bool)

(assert (=> bm!67907 (= call!67910 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137470 (Cons!34557 (select (arr!48060 a!2862) #b00000000000000000000000000000000) Nil!34558) Nil!34558)))))

(declare-fun b!1487587 () Bool)

(declare-fun e!833854 () Bool)

(declare-fun e!833853 () Bool)

(assert (=> b!1487587 (= e!833854 e!833853)))

(declare-fun res!1011697 () Bool)

(assert (=> b!1487587 (=> (not res!1011697) (not e!833853))))

(declare-fun e!833856 () Bool)

(assert (=> b!1487587 (= res!1011697 (not e!833856))))

(declare-fun res!1011696 () Bool)

(assert (=> b!1487587 (=> (not res!1011696) (not e!833856))))

(assert (=> b!1487587 (= res!1011696 (validKeyInArray!0 (select (arr!48060 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487588 () Bool)

(assert (=> b!1487588 (= e!833853 e!833855)))

(assert (=> b!1487588 (= c!137470 (validKeyInArray!0 (select (arr!48060 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156599 () Bool)

(declare-fun res!1011698 () Bool)

(assert (=> d!156599 (=> res!1011698 e!833854)))

(assert (=> d!156599 (= res!1011698 (bvsge #b00000000000000000000000000000000 (size!48610 a!2862)))))

(assert (=> d!156599 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34558) e!833854)))

(declare-fun b!1487589 () Bool)

(declare-fun contains!9920 (List!34561 (_ BitVec 64)) Bool)

(assert (=> b!1487589 (= e!833856 (contains!9920 Nil!34558 (select (arr!48060 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487590 () Bool)

(assert (=> b!1487590 (= e!833855 call!67910)))

(assert (= (and d!156599 (not res!1011698)) b!1487587))

(assert (= (and b!1487587 res!1011696) b!1487589))

(assert (= (and b!1487587 res!1011697) b!1487588))

(assert (= (and b!1487588 c!137470) b!1487590))

(assert (= (and b!1487588 (not c!137470)) b!1487586))

(assert (= (or b!1487590 b!1487586) bm!67907))

(assert (=> bm!67907 m!1372189))

(declare-fun m!1372237 () Bool)

(assert (=> bm!67907 m!1372237))

(assert (=> b!1487587 m!1372189))

(assert (=> b!1487587 m!1372189))

(assert (=> b!1487587 m!1372197))

(assert (=> b!1487588 m!1372189))

(assert (=> b!1487588 m!1372189))

(assert (=> b!1487588 m!1372197))

(assert (=> b!1487589 m!1372189))

(assert (=> b!1487589 m!1372189))

(declare-fun m!1372239 () Bool)

(assert (=> b!1487589 m!1372239))

(assert (=> b!1487267 d!156599))

(declare-fun d!156603 () Bool)

(declare-fun lt!648873 () (_ BitVec 32))

(assert (=> d!156603 (and (bvsge lt!648873 #b00000000000000000000000000000000) (bvslt lt!648873 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156603 (= lt!648873 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156603 (validMask!0 mask!2687)))

(assert (=> d!156603 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648873)))

(declare-fun bs!42785 () Bool)

(assert (= bs!42785 d!156603))

(declare-fun m!1372249 () Bool)

(assert (=> bs!42785 m!1372249))

(assert (=> bs!42785 m!1372047))

(assert (=> b!1487278 d!156603))

(declare-fun b!1487595 () Bool)

(declare-fun lt!648874 () SeekEntryResult!12300)

(assert (=> b!1487595 (and (bvsge (index!51594 lt!648874) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648874) (size!48610 a!2862)))))

(declare-fun res!1011702 () Bool)

(assert (=> b!1487595 (= res!1011702 (= (select (arr!48060 a!2862) (index!51594 lt!648874)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833863 () Bool)

(assert (=> b!1487595 (=> res!1011702 e!833863)))

(declare-fun b!1487596 () Bool)

(assert (=> b!1487596 (and (bvsge (index!51594 lt!648874) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648874) (size!48610 a!2862)))))

(assert (=> b!1487596 (= e!833863 (= (select (arr!48060 a!2862) (index!51594 lt!648874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156607 () Bool)

(declare-fun e!833862 () Bool)

(assert (=> d!156607 e!833862))

(declare-fun c!137472 () Bool)

(assert (=> d!156607 (= c!137472 (and ((_ is Intermediate!12300) lt!648874) (undefined!13112 lt!648874)))))

(declare-fun e!833861 () SeekEntryResult!12300)

(assert (=> d!156607 (= lt!648874 e!833861)))

(declare-fun c!137473 () Bool)

(assert (=> d!156607 (= c!137473 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648875 () (_ BitVec 64))

(assert (=> d!156607 (= lt!648875 (select (arr!48060 a!2862) (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687)))))

(assert (=> d!156607 (validMask!0 mask!2687)))

(assert (=> d!156607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) (select (arr!48060 a!2862) j!93) a!2862 mask!2687) lt!648874)))

(declare-fun b!1487597 () Bool)

(assert (=> b!1487597 (and (bvsge (index!51594 lt!648874) #b00000000000000000000000000000000) (bvslt (index!51594 lt!648874) (size!48610 a!2862)))))

(declare-fun res!1011704 () Bool)

(assert (=> b!1487597 (= res!1011704 (= (select (arr!48060 a!2862) (index!51594 lt!648874)) (select (arr!48060 a!2862) j!93)))))

(assert (=> b!1487597 (=> res!1011704 e!833863)))

(declare-fun e!833860 () Bool)

(assert (=> b!1487597 (= e!833860 e!833863)))

(declare-fun b!1487598 () Bool)

(declare-fun e!833864 () SeekEntryResult!12300)

(assert (=> b!1487598 (= e!833861 e!833864)))

(declare-fun c!137474 () Bool)

(assert (=> b!1487598 (= c!137474 (or (= lt!648875 (select (arr!48060 a!2862) j!93)) (= (bvadd lt!648875 lt!648875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487599 () Bool)

(assert (=> b!1487599 (= e!833862 (bvsge (x!133172 lt!648874) #b01111111111111111111111111111110))))

(declare-fun b!1487600 () Bool)

(assert (=> b!1487600 (= e!833864 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48060 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487601 () Bool)

(assert (=> b!1487601 (= e!833864 (Intermediate!12300 false (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487602 () Bool)

(assert (=> b!1487602 (= e!833862 e!833860)))

(declare-fun res!1011703 () Bool)

(assert (=> b!1487602 (= res!1011703 (and ((_ is Intermediate!12300) lt!648874) (not (undefined!13112 lt!648874)) (bvslt (x!133172 lt!648874) #b01111111111111111111111111111110) (bvsge (x!133172 lt!648874) #b00000000000000000000000000000000) (bvsge (x!133172 lt!648874) #b00000000000000000000000000000000)))))

(assert (=> b!1487602 (=> (not res!1011703) (not e!833860))))

(declare-fun b!1487603 () Bool)

(assert (=> b!1487603 (= e!833861 (Intermediate!12300 true (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156607 c!137473) b!1487603))

(assert (= (and d!156607 (not c!137473)) b!1487598))

(assert (= (and b!1487598 c!137474) b!1487601))

(assert (= (and b!1487598 (not c!137474)) b!1487600))

(assert (= (and d!156607 c!137472) b!1487599))

(assert (= (and d!156607 (not c!137472)) b!1487602))

(assert (= (and b!1487602 res!1011703) b!1487597))

(assert (= (and b!1487597 (not res!1011704)) b!1487595))

(assert (= (and b!1487595 (not res!1011702)) b!1487596))

(assert (=> d!156607 m!1372043))

(declare-fun m!1372251 () Bool)

(assert (=> d!156607 m!1372251))

(assert (=> d!156607 m!1372047))

(assert (=> b!1487600 m!1372043))

(declare-fun m!1372253 () Bool)

(assert (=> b!1487600 m!1372253))

(assert (=> b!1487600 m!1372253))

(assert (=> b!1487600 m!1372009))

(declare-fun m!1372255 () Bool)

(assert (=> b!1487600 m!1372255))

(declare-fun m!1372257 () Bool)

(assert (=> b!1487595 m!1372257))

(assert (=> b!1487596 m!1372257))

(assert (=> b!1487597 m!1372257))

(assert (=> b!1487279 d!156607))

(declare-fun d!156611 () Bool)

(declare-fun lt!648883 () (_ BitVec 32))

(declare-fun lt!648882 () (_ BitVec 32))

(assert (=> d!156611 (= lt!648883 (bvmul (bvxor lt!648882 (bvlshr lt!648882 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156611 (= lt!648882 ((_ extract 31 0) (bvand (bvxor (select (arr!48060 a!2862) j!93) (bvlshr (select (arr!48060 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156611 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011650 (let ((h!35936 ((_ extract 31 0) (bvand (bvxor (select (arr!48060 a!2862) j!93) (bvlshr (select (arr!48060 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133177 (bvmul (bvxor h!35936 (bvlshr h!35936 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133177 (bvlshr x!133177 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011650 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011650 #b00000000000000000000000000000000))))))

(assert (=> d!156611 (= (toIndex!0 (select (arr!48060 a!2862) j!93) mask!2687) (bvand (bvxor lt!648883 (bvlshr lt!648883 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487279 d!156611))

(check-sat (not b!1487588) (not b!1487491) (not d!156547) (not b!1487502) (not b!1487379) (not b!1487587) (not d!156577) (not d!156549) (not d!156567) (not b!1487457) (not d!156543) (not bm!67907) (not d!156583) (not b!1487589) (not d!156607) (not bm!67894) (not d!156545) (not b!1487447) (not d!156561) (not b!1487466) (not b!1487363) (not bm!67902) (not b!1487600) (not b!1487362) (not b!1487503) (not b!1487510) (not b!1487400) (not d!156603))
(check-sat)
