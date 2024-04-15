; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126494 () Bool)

(assert start!126494)

(declare-fun b!1484557 () Bool)

(declare-fun res!1009531 () Bool)

(declare-fun e!832282 () Bool)

(assert (=> b!1484557 (=> (not res!1009531) (not e!832282))))

(declare-datatypes ((array!99454 0))(
  ( (array!99455 (arr!48004 (Array (_ BitVec 32) (_ BitVec 64))) (size!48556 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99454)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99454 (_ BitVec 32)) Bool)

(assert (=> b!1484557 (= res!1009531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-datatypes ((SeekEntryResult!12269 0))(
  ( (MissingZero!12269 (index!51468 (_ BitVec 32))) (Found!12269 (index!51469 (_ BitVec 32))) (Intermediate!12269 (undefined!13081 Bool) (index!51470 (_ BitVec 32)) (x!133042 (_ BitVec 32))) (Undefined!12269) (MissingVacant!12269 (index!51471 (_ BitVec 32))) )
))
(declare-fun lt!647618 () SeekEntryResult!12269)

(declare-fun e!832281 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647624 () (_ BitVec 64))

(declare-fun b!1484558 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647621 () array!99454)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12269)

(assert (=> b!1484558 (= e!832281 (= lt!647618 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647624 lt!647621 mask!2687)))))

(declare-fun b!1484559 () Bool)

(declare-fun e!832289 () Bool)

(assert (=> b!1484559 (= e!832282 e!832289)))

(declare-fun res!1009528 () Bool)

(assert (=> b!1484559 (=> (not res!1009528) (not e!832289))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484559 (= res!1009528 (= (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484559 (= lt!647621 (array!99455 (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48556 a!2862)))))

(declare-fun b!1484560 () Bool)

(declare-fun e!832280 () Bool)

(declare-fun e!832283 () Bool)

(assert (=> b!1484560 (= e!832280 e!832283)))

(declare-fun res!1009527 () Bool)

(assert (=> b!1484560 (=> (not res!1009527) (not e!832283))))

(declare-fun lt!647623 () (_ BitVec 64))

(assert (=> b!1484560 (= res!1009527 (and (= index!646 intermediateAfterIndex!19) (= lt!647623 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484561 () Bool)

(declare-fun res!1009520 () Bool)

(assert (=> b!1484561 (=> (not res!1009520) (not e!832282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484561 (= res!1009520 (validKeyInArray!0 (select (arr!48004 a!2862) i!1006)))))

(declare-fun b!1484562 () Bool)

(declare-fun e!832287 () Bool)

(assert (=> b!1484562 (= e!832287 true)))

(declare-fun lt!647622 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484562 (= lt!647622 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484563 () Bool)

(declare-fun res!1009525 () Bool)

(declare-fun e!832286 () Bool)

(assert (=> b!1484563 (=> (not res!1009525) (not e!832286))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!647620 () SeekEntryResult!12269)

(assert (=> b!1484563 (= res!1009525 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!647620))))

(declare-fun b!1484564 () Bool)

(declare-fun res!1009521 () Bool)

(assert (=> b!1484564 (=> (not res!1009521) (not e!832282))))

(assert (=> b!1484564 (= res!1009521 (and (= (size!48556 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48556 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48556 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484565 () Bool)

(declare-fun res!1009515 () Bool)

(declare-fun e!832288 () Bool)

(assert (=> b!1484565 (=> (not res!1009515) (not e!832288))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484565 (= res!1009515 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484566 () Bool)

(declare-fun res!1009522 () Bool)

(declare-fun e!832285 () Bool)

(assert (=> b!1484566 (=> (not res!1009522) (not e!832285))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12269)

(assert (=> b!1484566 (= res!1009522 (= (seekEntryOrOpen!0 (select (arr!48004 a!2862) j!93) a!2862 mask!2687) (Found!12269 j!93)))))

(declare-fun b!1484567 () Bool)

(declare-fun res!1009529 () Bool)

(assert (=> b!1484567 (=> (not res!1009529) (not e!832282))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1484567 (= res!1009529 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48556 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48556 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48556 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484568 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12269)

(assert (=> b!1484568 (= e!832283 (= (seekEntryOrOpen!0 lt!647624 lt!647621 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647624 lt!647621 mask!2687)))))

(declare-fun b!1484569 () Bool)

(assert (=> b!1484569 (= e!832286 e!832288)))

(declare-fun res!1009519 () Bool)

(assert (=> b!1484569 (=> (not res!1009519) (not e!832288))))

(assert (=> b!1484569 (= res!1009519 (= lt!647618 (Intermediate!12269 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484569 (= lt!647618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647624 mask!2687) lt!647624 lt!647621 mask!2687))))

(assert (=> b!1484569 (= lt!647624 (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484570 () Bool)

(declare-fun res!1009524 () Bool)

(assert (=> b!1484570 (=> (not res!1009524) (not e!832282))))

(declare-datatypes ((List!34583 0))(
  ( (Nil!34580) (Cons!34579 (h!35953 (_ BitVec 64)) (t!49269 List!34583)) )
))
(declare-fun arrayNoDuplicates!0 (array!99454 (_ BitVec 32) List!34583) Bool)

(assert (=> b!1484570 (= res!1009524 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34580))))

(declare-fun b!1484571 () Bool)

(assert (=> b!1484571 (= e!832288 (not e!832287))))

(declare-fun res!1009516 () Bool)

(assert (=> b!1484571 (=> res!1009516 e!832287)))

(assert (=> b!1484571 (= res!1009516 (or (and (= (select (arr!48004 a!2862) index!646) (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48004 a!2862) index!646) (select (arr!48004 a!2862) j!93))) (= (select (arr!48004 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484571 e!832285))

(declare-fun res!1009518 () Bool)

(assert (=> b!1484571 (=> (not res!1009518) (not e!832285))))

(assert (=> b!1484571 (= res!1009518 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49719 0))(
  ( (Unit!49720) )
))
(declare-fun lt!647619 () Unit!49719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49719)

(assert (=> b!1484571 (= lt!647619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484572 () Bool)

(declare-fun res!1009523 () Bool)

(assert (=> b!1484572 (=> (not res!1009523) (not e!832288))))

(assert (=> b!1484572 (= res!1009523 e!832281)))

(declare-fun c!137047 () Bool)

(assert (=> b!1484572 (= c!137047 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484573 () Bool)

(assert (=> b!1484573 (= e!832289 e!832286)))

(declare-fun res!1009517 () Bool)

(assert (=> b!1484573 (=> (not res!1009517) (not e!832286))))

(assert (=> b!1484573 (= res!1009517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48004 a!2862) j!93) mask!2687) (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!647620))))

(assert (=> b!1484573 (= lt!647620 (Intermediate!12269 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484574 () Bool)

(declare-fun res!1009530 () Bool)

(assert (=> b!1484574 (=> (not res!1009530) (not e!832282))))

(assert (=> b!1484574 (= res!1009530 (validKeyInArray!0 (select (arr!48004 a!2862) j!93)))))

(declare-fun b!1484575 () Bool)

(assert (=> b!1484575 (= e!832285 e!832280)))

(declare-fun res!1009514 () Bool)

(assert (=> b!1484575 (=> res!1009514 e!832280)))

(assert (=> b!1484575 (= res!1009514 (or (and (= (select (arr!48004 a!2862) index!646) lt!647623) (= (select (arr!48004 a!2862) index!646) (select (arr!48004 a!2862) j!93))) (= (select (arr!48004 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484575 (= lt!647623 (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484576 () Bool)

(assert (=> b!1484576 (= e!832281 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647624 lt!647621 mask!2687) (seekEntryOrOpen!0 lt!647624 lt!647621 mask!2687)))))

(declare-fun res!1009526 () Bool)

(assert (=> start!126494 (=> (not res!1009526) (not e!832282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126494 (= res!1009526 (validMask!0 mask!2687))))

(assert (=> start!126494 e!832282))

(assert (=> start!126494 true))

(declare-fun array_inv!37237 (array!99454) Bool)

(assert (=> start!126494 (array_inv!37237 a!2862)))

(declare-fun b!1484577 () Bool)

(declare-fun res!1009513 () Bool)

(assert (=> b!1484577 (=> (not res!1009513) (not e!832285))))

(assert (=> b!1484577 (= res!1009513 (or (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) (select (arr!48004 a!2862) j!93))))))

(assert (= (and start!126494 res!1009526) b!1484564))

(assert (= (and b!1484564 res!1009521) b!1484561))

(assert (= (and b!1484561 res!1009520) b!1484574))

(assert (= (and b!1484574 res!1009530) b!1484557))

(assert (= (and b!1484557 res!1009531) b!1484570))

(assert (= (and b!1484570 res!1009524) b!1484567))

(assert (= (and b!1484567 res!1009529) b!1484559))

(assert (= (and b!1484559 res!1009528) b!1484573))

(assert (= (and b!1484573 res!1009517) b!1484563))

(assert (= (and b!1484563 res!1009525) b!1484569))

(assert (= (and b!1484569 res!1009519) b!1484572))

(assert (= (and b!1484572 c!137047) b!1484558))

(assert (= (and b!1484572 (not c!137047)) b!1484576))

(assert (= (and b!1484572 res!1009523) b!1484565))

(assert (= (and b!1484565 res!1009515) b!1484571))

(assert (= (and b!1484571 res!1009518) b!1484566))

(assert (= (and b!1484566 res!1009522) b!1484577))

(assert (= (and b!1484577 res!1009513) b!1484575))

(assert (= (and b!1484575 (not res!1009514)) b!1484560))

(assert (= (and b!1484560 res!1009527) b!1484568))

(assert (= (and b!1484571 (not res!1009516)) b!1484562))

(declare-fun m!1369245 () Bool)

(assert (=> b!1484561 m!1369245))

(assert (=> b!1484561 m!1369245))

(declare-fun m!1369247 () Bool)

(assert (=> b!1484561 m!1369247))

(declare-fun m!1369249 () Bool)

(assert (=> b!1484577 m!1369249))

(declare-fun m!1369251 () Bool)

(assert (=> b!1484577 m!1369251))

(declare-fun m!1369253 () Bool)

(assert (=> b!1484570 m!1369253))

(assert (=> b!1484566 m!1369251))

(assert (=> b!1484566 m!1369251))

(declare-fun m!1369255 () Bool)

(assert (=> b!1484566 m!1369255))

(declare-fun m!1369257 () Bool)

(assert (=> b!1484571 m!1369257))

(declare-fun m!1369259 () Bool)

(assert (=> b!1484571 m!1369259))

(declare-fun m!1369261 () Bool)

(assert (=> b!1484571 m!1369261))

(declare-fun m!1369263 () Bool)

(assert (=> b!1484571 m!1369263))

(declare-fun m!1369265 () Bool)

(assert (=> b!1484571 m!1369265))

(assert (=> b!1484571 m!1369251))

(declare-fun m!1369267 () Bool)

(assert (=> b!1484569 m!1369267))

(assert (=> b!1484569 m!1369267))

(declare-fun m!1369269 () Bool)

(assert (=> b!1484569 m!1369269))

(assert (=> b!1484569 m!1369259))

(declare-fun m!1369271 () Bool)

(assert (=> b!1484569 m!1369271))

(declare-fun m!1369273 () Bool)

(assert (=> b!1484562 m!1369273))

(declare-fun m!1369275 () Bool)

(assert (=> b!1484568 m!1369275))

(declare-fun m!1369277 () Bool)

(assert (=> b!1484568 m!1369277))

(declare-fun m!1369279 () Bool)

(assert (=> b!1484558 m!1369279))

(assert (=> b!1484576 m!1369277))

(assert (=> b!1484576 m!1369275))

(declare-fun m!1369281 () Bool)

(assert (=> start!126494 m!1369281))

(declare-fun m!1369283 () Bool)

(assert (=> start!126494 m!1369283))

(assert (=> b!1484559 m!1369259))

(declare-fun m!1369285 () Bool)

(assert (=> b!1484559 m!1369285))

(assert (=> b!1484574 m!1369251))

(assert (=> b!1484574 m!1369251))

(declare-fun m!1369287 () Bool)

(assert (=> b!1484574 m!1369287))

(assert (=> b!1484575 m!1369263))

(assert (=> b!1484575 m!1369251))

(assert (=> b!1484575 m!1369259))

(assert (=> b!1484575 m!1369261))

(assert (=> b!1484573 m!1369251))

(assert (=> b!1484573 m!1369251))

(declare-fun m!1369289 () Bool)

(assert (=> b!1484573 m!1369289))

(assert (=> b!1484573 m!1369289))

(assert (=> b!1484573 m!1369251))

(declare-fun m!1369291 () Bool)

(assert (=> b!1484573 m!1369291))

(assert (=> b!1484563 m!1369251))

(assert (=> b!1484563 m!1369251))

(declare-fun m!1369293 () Bool)

(assert (=> b!1484563 m!1369293))

(declare-fun m!1369295 () Bool)

(assert (=> b!1484557 m!1369295))

(check-sat (not b!1484562) (not b!1484568) (not b!1484566) (not b!1484571) (not b!1484563) (not b!1484561) (not b!1484573) (not b!1484557) (not b!1484570) (not b!1484576) (not start!126494) (not b!1484558) (not b!1484569) (not b!1484574))
(check-sat)
