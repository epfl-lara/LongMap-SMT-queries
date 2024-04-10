; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125018 () Bool)

(assert start!125018)

(declare-fun b!1454238 () Bool)

(declare-fun e!818441 () Bool)

(declare-fun e!818432 () Bool)

(assert (=> b!1454238 (= e!818441 (not e!818432))))

(declare-fun res!985123 () Bool)

(assert (=> b!1454238 (=> res!985123 e!818432)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98466 0))(
  ( (array!98467 (arr!47521 (Array (_ BitVec 32) (_ BitVec 64))) (size!48071 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98466)

(assert (=> b!1454238 (= res!985123 (or (and (= (select (arr!47521 a!2862) index!646) (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47521 a!2862) index!646) (select (arr!47521 a!2862) j!93))) (= (select (arr!47521 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818433 () Bool)

(assert (=> b!1454238 e!818433))

(declare-fun res!985136 () Bool)

(assert (=> b!1454238 (=> (not res!985136) (not e!818433))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98466 (_ BitVec 32)) Bool)

(assert (=> b!1454238 (= res!985136 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49042 0))(
  ( (Unit!49043) )
))
(declare-fun lt!637518 () Unit!49042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49042)

(assert (=> b!1454238 (= lt!637518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454240 () Bool)

(declare-fun res!985133 () Bool)

(declare-fun e!818440 () Bool)

(assert (=> b!1454240 (=> (not res!985133) (not e!818440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454240 (= res!985133 (validKeyInArray!0 (select (arr!47521 a!2862) i!1006)))))

(declare-fun b!1454241 () Bool)

(declare-fun res!985131 () Bool)

(assert (=> b!1454241 (=> (not res!985131) (not e!818433))))

(declare-datatypes ((SeekEntryResult!11773 0))(
  ( (MissingZero!11773 (index!49484 (_ BitVec 32))) (Found!11773 (index!49485 (_ BitVec 32))) (Intermediate!11773 (undefined!12585 Bool) (index!49486 (_ BitVec 32)) (x!131118 (_ BitVec 32))) (Undefined!11773) (MissingVacant!11773 (index!49487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98466 (_ BitVec 32)) SeekEntryResult!11773)

(assert (=> b!1454241 (= res!985131 (= (seekEntryOrOpen!0 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) (Found!11773 j!93)))))

(declare-fun b!1454242 () Bool)

(declare-fun res!985129 () Bool)

(assert (=> b!1454242 (=> (not res!985129) (not e!818440))))

(assert (=> b!1454242 (= res!985129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454243 () Bool)

(declare-fun res!985122 () Bool)

(declare-fun e!818437 () Bool)

(assert (=> b!1454243 (=> res!985122 e!818437)))

(declare-fun lt!637519 () (_ BitVec 32))

(declare-fun lt!637520 () SeekEntryResult!11773)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98466 (_ BitVec 32)) SeekEntryResult!11773)

(assert (=> b!1454243 (= res!985122 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637519 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637520)))))

(declare-fun b!1454244 () Bool)

(declare-fun res!985137 () Bool)

(assert (=> b!1454244 (=> (not res!985137) (not e!818440))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454244 (= res!985137 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48071 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48071 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48071 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454245 () Bool)

(declare-fun res!985125 () Bool)

(assert (=> b!1454245 (=> (not res!985125) (not e!818441))))

(assert (=> b!1454245 (= res!985125 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454246 () Bool)

(assert (=> b!1454246 (= e!818432 e!818437)))

(declare-fun res!985138 () Bool)

(assert (=> b!1454246 (=> res!985138 e!818437)))

(assert (=> b!1454246 (= res!985138 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637519 #b00000000000000000000000000000000) (bvsge lt!637519 (size!48071 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454246 (= lt!637519 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637514 () (_ BitVec 64))

(declare-fun lt!637515 () SeekEntryResult!11773)

(declare-fun lt!637517 () array!98466)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98466 (_ BitVec 32)) SeekEntryResult!11773)

(assert (=> b!1454246 (= lt!637515 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637514 lt!637517 mask!2687))))

(assert (=> b!1454246 (= lt!637515 (seekEntryOrOpen!0 lt!637514 lt!637517 mask!2687))))

(declare-fun b!1454247 () Bool)

(assert (=> b!1454247 (= e!818433 (and (or (= (select (arr!47521 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47521 a!2862) intermediateBeforeIndex!19) (select (arr!47521 a!2862) j!93))) (let ((bdg!53041 (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47521 a!2862) index!646) bdg!53041) (= (select (arr!47521 a!2862) index!646) (select (arr!47521 a!2862) j!93))) (= (select (arr!47521 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53041 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454248 () Bool)

(declare-fun e!818434 () Bool)

(assert (=> b!1454248 (= e!818434 e!818441)))

(declare-fun res!985127 () Bool)

(assert (=> b!1454248 (=> (not res!985127) (not e!818441))))

(declare-fun lt!637516 () SeekEntryResult!11773)

(assert (=> b!1454248 (= res!985127 (= lt!637516 (Intermediate!11773 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454248 (= lt!637516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637514 mask!2687) lt!637514 lt!637517 mask!2687))))

(assert (=> b!1454248 (= lt!637514 (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!818439 () Bool)

(declare-fun b!1454249 () Bool)

(assert (=> b!1454249 (= e!818439 (not (= lt!637516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637519 lt!637514 lt!637517 mask!2687))))))

(declare-fun e!818436 () Bool)

(declare-fun b!1454250 () Bool)

(assert (=> b!1454250 (= e!818436 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637514 lt!637517 mask!2687) (seekEntryOrOpen!0 lt!637514 lt!637517 mask!2687)))))

(declare-fun b!1454251 () Bool)

(declare-fun res!985130 () Bool)

(assert (=> b!1454251 (=> (not res!985130) (not e!818440))))

(declare-datatypes ((List!34022 0))(
  ( (Nil!34019) (Cons!34018 (h!35368 (_ BitVec 64)) (t!48716 List!34022)) )
))
(declare-fun arrayNoDuplicates!0 (array!98466 (_ BitVec 32) List!34022) Bool)

(assert (=> b!1454251 (= res!985130 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34019))))

(declare-fun b!1454252 () Bool)

(declare-fun res!985132 () Bool)

(assert (=> b!1454252 (=> (not res!985132) (not e!818434))))

(assert (=> b!1454252 (= res!985132 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637520))))

(declare-fun b!1454253 () Bool)

(declare-fun res!985135 () Bool)

(assert (=> b!1454253 (=> (not res!985135) (not e!818440))))

(assert (=> b!1454253 (= res!985135 (validKeyInArray!0 (select (arr!47521 a!2862) j!93)))))

(declare-fun res!985121 () Bool)

(assert (=> start!125018 (=> (not res!985121) (not e!818440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125018 (= res!985121 (validMask!0 mask!2687))))

(assert (=> start!125018 e!818440))

(assert (=> start!125018 true))

(declare-fun array_inv!36549 (array!98466) Bool)

(assert (=> start!125018 (array_inv!36549 a!2862)))

(declare-fun b!1454239 () Bool)

(assert (=> b!1454239 (= e!818437 true)))

(declare-fun lt!637521 () Bool)

(assert (=> b!1454239 (= lt!637521 e!818439)))

(declare-fun c!134070 () Bool)

(assert (=> b!1454239 (= c!134070 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454254 () Bool)

(declare-fun res!985126 () Bool)

(assert (=> b!1454254 (=> (not res!985126) (not e!818440))))

(assert (=> b!1454254 (= res!985126 (and (= (size!48071 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48071 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48071 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454255 () Bool)

(declare-fun e!818435 () Bool)

(assert (=> b!1454255 (= e!818435 e!818434)))

(declare-fun res!985134 () Bool)

(assert (=> b!1454255 (=> (not res!985134) (not e!818434))))

(assert (=> b!1454255 (= res!985134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47521 a!2862) j!93) mask!2687) (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637520))))

(assert (=> b!1454255 (= lt!637520 (Intermediate!11773 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454256 () Bool)

(assert (=> b!1454256 (= e!818440 e!818435)))

(declare-fun res!985128 () Bool)

(assert (=> b!1454256 (=> (not res!985128) (not e!818435))))

(assert (=> b!1454256 (= res!985128 (= (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454256 (= lt!637517 (array!98467 (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48071 a!2862)))))

(declare-fun b!1454257 () Bool)

(declare-fun res!985124 () Bool)

(assert (=> b!1454257 (=> (not res!985124) (not e!818441))))

(assert (=> b!1454257 (= res!985124 e!818436)))

(declare-fun c!134069 () Bool)

(assert (=> b!1454257 (= c!134069 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454258 () Bool)

(assert (=> b!1454258 (= e!818439 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637519 intermediateAfterIndex!19 lt!637514 lt!637517 mask!2687) lt!637515)))))

(declare-fun b!1454259 () Bool)

(assert (=> b!1454259 (= e!818436 (= lt!637516 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637514 lt!637517 mask!2687)))))

(assert (= (and start!125018 res!985121) b!1454254))

(assert (= (and b!1454254 res!985126) b!1454240))

(assert (= (and b!1454240 res!985133) b!1454253))

(assert (= (and b!1454253 res!985135) b!1454242))

(assert (= (and b!1454242 res!985129) b!1454251))

(assert (= (and b!1454251 res!985130) b!1454244))

(assert (= (and b!1454244 res!985137) b!1454256))

(assert (= (and b!1454256 res!985128) b!1454255))

(assert (= (and b!1454255 res!985134) b!1454252))

(assert (= (and b!1454252 res!985132) b!1454248))

(assert (= (and b!1454248 res!985127) b!1454257))

(assert (= (and b!1454257 c!134069) b!1454259))

(assert (= (and b!1454257 (not c!134069)) b!1454250))

(assert (= (and b!1454257 res!985124) b!1454245))

(assert (= (and b!1454245 res!985125) b!1454238))

(assert (= (and b!1454238 res!985136) b!1454241))

(assert (= (and b!1454241 res!985131) b!1454247))

(assert (= (and b!1454238 (not res!985123)) b!1454246))

(assert (= (and b!1454246 (not res!985138)) b!1454243))

(assert (= (and b!1454243 (not res!985122)) b!1454239))

(assert (= (and b!1454239 c!134070) b!1454249))

(assert (= (and b!1454239 (not c!134070)) b!1454258))

(declare-fun m!1342605 () Bool)

(assert (=> b!1454247 m!1342605))

(declare-fun m!1342607 () Bool)

(assert (=> b!1454247 m!1342607))

(declare-fun m!1342609 () Bool)

(assert (=> b!1454247 m!1342609))

(declare-fun m!1342611 () Bool)

(assert (=> b!1454247 m!1342611))

(declare-fun m!1342613 () Bool)

(assert (=> b!1454247 m!1342613))

(declare-fun m!1342615 () Bool)

(assert (=> b!1454259 m!1342615))

(assert (=> b!1454255 m!1342613))

(assert (=> b!1454255 m!1342613))

(declare-fun m!1342617 () Bool)

(assert (=> b!1454255 m!1342617))

(assert (=> b!1454255 m!1342617))

(assert (=> b!1454255 m!1342613))

(declare-fun m!1342619 () Bool)

(assert (=> b!1454255 m!1342619))

(assert (=> b!1454241 m!1342613))

(assert (=> b!1454241 m!1342613))

(declare-fun m!1342621 () Bool)

(assert (=> b!1454241 m!1342621))

(declare-fun m!1342623 () Bool)

(assert (=> b!1454250 m!1342623))

(declare-fun m!1342625 () Bool)

(assert (=> b!1454250 m!1342625))

(assert (=> b!1454253 m!1342613))

(assert (=> b!1454253 m!1342613))

(declare-fun m!1342627 () Bool)

(assert (=> b!1454253 m!1342627))

(declare-fun m!1342629 () Bool)

(assert (=> b!1454246 m!1342629))

(assert (=> b!1454246 m!1342623))

(assert (=> b!1454246 m!1342625))

(declare-fun m!1342631 () Bool)

(assert (=> b!1454249 m!1342631))

(declare-fun m!1342633 () Bool)

(assert (=> b!1454242 m!1342633))

(declare-fun m!1342635 () Bool)

(assert (=> b!1454251 m!1342635))

(declare-fun m!1342637 () Bool)

(assert (=> b!1454248 m!1342637))

(assert (=> b!1454248 m!1342637))

(declare-fun m!1342639 () Bool)

(assert (=> b!1454248 m!1342639))

(assert (=> b!1454248 m!1342605))

(declare-fun m!1342641 () Bool)

(assert (=> b!1454248 m!1342641))

(declare-fun m!1342643 () Bool)

(assert (=> b!1454238 m!1342643))

(assert (=> b!1454238 m!1342605))

(assert (=> b!1454238 m!1342609))

(assert (=> b!1454238 m!1342611))

(declare-fun m!1342645 () Bool)

(assert (=> b!1454238 m!1342645))

(assert (=> b!1454238 m!1342613))

(declare-fun m!1342647 () Bool)

(assert (=> b!1454240 m!1342647))

(assert (=> b!1454240 m!1342647))

(declare-fun m!1342649 () Bool)

(assert (=> b!1454240 m!1342649))

(declare-fun m!1342651 () Bool)

(assert (=> start!125018 m!1342651))

(declare-fun m!1342653 () Bool)

(assert (=> start!125018 m!1342653))

(declare-fun m!1342655 () Bool)

(assert (=> b!1454258 m!1342655))

(assert (=> b!1454243 m!1342613))

(assert (=> b!1454243 m!1342613))

(declare-fun m!1342657 () Bool)

(assert (=> b!1454243 m!1342657))

(assert (=> b!1454256 m!1342605))

(declare-fun m!1342659 () Bool)

(assert (=> b!1454256 m!1342659))

(assert (=> b!1454252 m!1342613))

(assert (=> b!1454252 m!1342613))

(declare-fun m!1342661 () Bool)

(assert (=> b!1454252 m!1342661))

(push 1)

