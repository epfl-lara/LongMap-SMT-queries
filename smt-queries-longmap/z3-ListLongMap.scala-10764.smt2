; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125904 () Bool)

(assert start!125904)

(declare-fun b!1474105 () Bool)

(declare-fun res!1001357 () Bool)

(declare-fun e!827132 () Bool)

(assert (=> b!1474105 (=> (not res!1001357) (not e!827132))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474105 (= res!1001357 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1474106 () Bool)

(declare-fun e!827137 () Bool)

(declare-datatypes ((array!99181 0))(
  ( (array!99182 (arr!47874 (Array (_ BitVec 32) (_ BitVec 64))) (size!48424 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99181)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1474106 (= e!827137 (or (= (select (arr!47874 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47874 a!2862) intermediateBeforeIndex!19) (select (arr!47874 a!2862) j!93))))))

(declare-fun b!1474107 () Bool)

(declare-fun res!1001347 () Bool)

(assert (=> b!1474107 (=> (not res!1001347) (not e!827132))))

(declare-fun e!827138 () Bool)

(assert (=> b!1474107 (= res!1001347 e!827138)))

(declare-fun c!135894 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474107 (= c!135894 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474108 () Bool)

(declare-fun res!1001349 () Bool)

(declare-fun e!827135 () Bool)

(assert (=> b!1474108 (=> (not res!1001349) (not e!827135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474108 (= res!1001349 (validKeyInArray!0 (select (arr!47874 a!2862) i!1006)))))

(declare-fun b!1474109 () Bool)

(declare-fun res!1001359 () Bool)

(assert (=> b!1474109 (=> (not res!1001359) (not e!827135))))

(assert (=> b!1474109 (= res!1001359 (validKeyInArray!0 (select (arr!47874 a!2862) j!93)))))

(declare-fun b!1474110 () Bool)

(declare-fun e!827133 () Bool)

(declare-fun e!827131 () Bool)

(assert (=> b!1474110 (= e!827133 e!827131)))

(declare-fun res!1001361 () Bool)

(assert (=> b!1474110 (=> (not res!1001361) (not e!827131))))

(declare-datatypes ((SeekEntryResult!12114 0))(
  ( (MissingZero!12114 (index!50848 (_ BitVec 32))) (Found!12114 (index!50849 (_ BitVec 32))) (Intermediate!12114 (undefined!12926 Bool) (index!50850 (_ BitVec 32)) (x!132430 (_ BitVec 32))) (Undefined!12114) (MissingVacant!12114 (index!50851 (_ BitVec 32))) )
))
(declare-fun lt!644150 () SeekEntryResult!12114)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99181 (_ BitVec 32)) SeekEntryResult!12114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474110 (= res!1001361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47874 a!2862) j!93) mask!2687) (select (arr!47874 a!2862) j!93) a!2862 mask!2687) lt!644150))))

(assert (=> b!1474110 (= lt!644150 (Intermediate!12114 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474111 () Bool)

(declare-fun lt!644153 () array!99181)

(declare-fun lt!644152 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99181 (_ BitVec 32)) SeekEntryResult!12114)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99181 (_ BitVec 32)) SeekEntryResult!12114)

(assert (=> b!1474111 (= e!827138 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644152 lt!644153 mask!2687) (seekEntryOrOpen!0 lt!644152 lt!644153 mask!2687)))))

(declare-fun b!1474112 () Bool)

(declare-fun res!1001354 () Bool)

(assert (=> b!1474112 (=> (not res!1001354) (not e!827135))))

(declare-datatypes ((List!34375 0))(
  ( (Nil!34372) (Cons!34371 (h!35730 (_ BitVec 64)) (t!49069 List!34375)) )
))
(declare-fun arrayNoDuplicates!0 (array!99181 (_ BitVec 32) List!34375) Bool)

(assert (=> b!1474112 (= res!1001354 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34372))))

(declare-fun res!1001350 () Bool)

(assert (=> start!125904 (=> (not res!1001350) (not e!827135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125904 (= res!1001350 (validMask!0 mask!2687))))

(assert (=> start!125904 e!827135))

(assert (=> start!125904 true))

(declare-fun array_inv!36902 (array!99181) Bool)

(assert (=> start!125904 (array_inv!36902 a!2862)))

(declare-fun b!1474113 () Bool)

(declare-fun e!827134 () Bool)

(assert (=> b!1474113 (= e!827134 true)))

(declare-fun lt!644149 () SeekEntryResult!12114)

(assert (=> b!1474113 (= lt!644149 (seekEntryOrOpen!0 lt!644152 lt!644153 mask!2687))))

(declare-fun b!1474114 () Bool)

(declare-fun res!1001355 () Bool)

(assert (=> b!1474114 (=> (not res!1001355) (not e!827137))))

(assert (=> b!1474114 (= res!1001355 (= (seekEntryOrOpen!0 (select (arr!47874 a!2862) j!93) a!2862 mask!2687) (Found!12114 j!93)))))

(declare-fun b!1474115 () Bool)

(declare-fun res!1001348 () Bool)

(assert (=> b!1474115 (=> (not res!1001348) (not e!827135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99181 (_ BitVec 32)) Bool)

(assert (=> b!1474115 (= res!1001348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474116 () Bool)

(declare-fun res!1001353 () Bool)

(assert (=> b!1474116 (=> (not res!1001353) (not e!827135))))

(assert (=> b!1474116 (= res!1001353 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48424 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48424 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48424 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!644151 () SeekEntryResult!12114)

(declare-fun b!1474117 () Bool)

(assert (=> b!1474117 (= e!827138 (= lt!644151 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644152 lt!644153 mask!2687)))))

(declare-fun b!1474118 () Bool)

(assert (=> b!1474118 (= e!827132 (not e!827134))))

(declare-fun res!1001362 () Bool)

(assert (=> b!1474118 (=> res!1001362 e!827134)))

(assert (=> b!1474118 (= res!1001362 (or (not (= (select (arr!47874 a!2862) index!646) (select (store (arr!47874 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47874 a!2862) index!646) (select (arr!47874 a!2862) j!93)))))))

(assert (=> b!1474118 e!827137))

(declare-fun res!1001360 () Bool)

(assert (=> b!1474118 (=> (not res!1001360) (not e!827137))))

(assert (=> b!1474118 (= res!1001360 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49568 0))(
  ( (Unit!49569) )
))
(declare-fun lt!644154 () Unit!49568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49568)

(assert (=> b!1474118 (= lt!644154 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474119 () Bool)

(assert (=> b!1474119 (= e!827135 e!827133)))

(declare-fun res!1001351 () Bool)

(assert (=> b!1474119 (=> (not res!1001351) (not e!827133))))

(assert (=> b!1474119 (= res!1001351 (= (select (store (arr!47874 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474119 (= lt!644153 (array!99182 (store (arr!47874 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48424 a!2862)))))

(declare-fun b!1474120 () Bool)

(declare-fun res!1001352 () Bool)

(assert (=> b!1474120 (=> (not res!1001352) (not e!827135))))

(assert (=> b!1474120 (= res!1001352 (and (= (size!48424 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48424 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48424 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474121 () Bool)

(assert (=> b!1474121 (= e!827131 e!827132)))

(declare-fun res!1001358 () Bool)

(assert (=> b!1474121 (=> (not res!1001358) (not e!827132))))

(assert (=> b!1474121 (= res!1001358 (= lt!644151 (Intermediate!12114 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474121 (= lt!644151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644152 mask!2687) lt!644152 lt!644153 mask!2687))))

(assert (=> b!1474121 (= lt!644152 (select (store (arr!47874 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474122 () Bool)

(declare-fun res!1001356 () Bool)

(assert (=> b!1474122 (=> (not res!1001356) (not e!827131))))

(assert (=> b!1474122 (= res!1001356 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47874 a!2862) j!93) a!2862 mask!2687) lt!644150))))

(assert (= (and start!125904 res!1001350) b!1474120))

(assert (= (and b!1474120 res!1001352) b!1474108))

(assert (= (and b!1474108 res!1001349) b!1474109))

(assert (= (and b!1474109 res!1001359) b!1474115))

(assert (= (and b!1474115 res!1001348) b!1474112))

(assert (= (and b!1474112 res!1001354) b!1474116))

(assert (= (and b!1474116 res!1001353) b!1474119))

(assert (= (and b!1474119 res!1001351) b!1474110))

(assert (= (and b!1474110 res!1001361) b!1474122))

(assert (= (and b!1474122 res!1001356) b!1474121))

(assert (= (and b!1474121 res!1001358) b!1474107))

(assert (= (and b!1474107 c!135894) b!1474117))

(assert (= (and b!1474107 (not c!135894)) b!1474111))

(assert (= (and b!1474107 res!1001347) b!1474105))

(assert (= (and b!1474105 res!1001357) b!1474118))

(assert (= (and b!1474118 res!1001360) b!1474114))

(assert (= (and b!1474114 res!1001355) b!1474106))

(assert (= (and b!1474118 (not res!1001362)) b!1474113))

(declare-fun m!1360581 () Bool)

(assert (=> b!1474109 m!1360581))

(assert (=> b!1474109 m!1360581))

(declare-fun m!1360583 () Bool)

(assert (=> b!1474109 m!1360583))

(assert (=> b!1474114 m!1360581))

(assert (=> b!1474114 m!1360581))

(declare-fun m!1360585 () Bool)

(assert (=> b!1474114 m!1360585))

(declare-fun m!1360587 () Bool)

(assert (=> b!1474117 m!1360587))

(declare-fun m!1360589 () Bool)

(assert (=> b!1474115 m!1360589))

(assert (=> b!1474122 m!1360581))

(assert (=> b!1474122 m!1360581))

(declare-fun m!1360591 () Bool)

(assert (=> b!1474122 m!1360591))

(declare-fun m!1360593 () Bool)

(assert (=> b!1474108 m!1360593))

(assert (=> b!1474108 m!1360593))

(declare-fun m!1360595 () Bool)

(assert (=> b!1474108 m!1360595))

(declare-fun m!1360597 () Bool)

(assert (=> b!1474111 m!1360597))

(declare-fun m!1360599 () Bool)

(assert (=> b!1474111 m!1360599))

(declare-fun m!1360601 () Bool)

(assert (=> b!1474118 m!1360601))

(declare-fun m!1360603 () Bool)

(assert (=> b!1474118 m!1360603))

(declare-fun m!1360605 () Bool)

(assert (=> b!1474118 m!1360605))

(declare-fun m!1360607 () Bool)

(assert (=> b!1474118 m!1360607))

(declare-fun m!1360609 () Bool)

(assert (=> b!1474118 m!1360609))

(assert (=> b!1474118 m!1360581))

(declare-fun m!1360611 () Bool)

(assert (=> b!1474121 m!1360611))

(assert (=> b!1474121 m!1360611))

(declare-fun m!1360613 () Bool)

(assert (=> b!1474121 m!1360613))

(assert (=> b!1474121 m!1360603))

(declare-fun m!1360615 () Bool)

(assert (=> b!1474121 m!1360615))

(assert (=> b!1474119 m!1360603))

(declare-fun m!1360617 () Bool)

(assert (=> b!1474119 m!1360617))

(assert (=> b!1474113 m!1360599))

(declare-fun m!1360619 () Bool)

(assert (=> b!1474112 m!1360619))

(declare-fun m!1360621 () Bool)

(assert (=> start!125904 m!1360621))

(declare-fun m!1360623 () Bool)

(assert (=> start!125904 m!1360623))

(declare-fun m!1360625 () Bool)

(assert (=> b!1474106 m!1360625))

(assert (=> b!1474106 m!1360581))

(assert (=> b!1474110 m!1360581))

(assert (=> b!1474110 m!1360581))

(declare-fun m!1360627 () Bool)

(assert (=> b!1474110 m!1360627))

(assert (=> b!1474110 m!1360627))

(assert (=> b!1474110 m!1360581))

(declare-fun m!1360629 () Bool)

(assert (=> b!1474110 m!1360629))

(check-sat (not b!1474115) (not b!1474112) (not b!1474109) (not b!1474113) (not b!1474118) (not b!1474117) (not b!1474108) (not b!1474122) (not b!1474111) (not b!1474114) (not b!1474121) (not b!1474110) (not start!125904))
(check-sat)
