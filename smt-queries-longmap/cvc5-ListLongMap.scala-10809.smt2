; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126502 () Bool)

(assert start!126502)

(declare-fun b!1483603 () Bool)

(declare-fun res!1008478 () Bool)

(declare-fun e!831886 () Bool)

(assert (=> b!1483603 (=> (not res!1008478) (not e!831886))))

(declare-datatypes ((array!99464 0))(
  ( (array!99465 (arr!48008 (Array (_ BitVec 32) (_ BitVec 64))) (size!48558 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99464)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483603 (= res!1008478 (validKeyInArray!0 (select (arr!48008 a!2862) j!93)))))

(declare-fun res!1008476 () Bool)

(assert (=> start!126502 (=> (not res!1008476) (not e!831886))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126502 (= res!1008476 (validMask!0 mask!2687))))

(assert (=> start!126502 e!831886))

(assert (=> start!126502 true))

(declare-fun array_inv!37036 (array!99464) Bool)

(assert (=> start!126502 (array_inv!37036 a!2862)))

(declare-fun b!1483604 () Bool)

(declare-fun e!831879 () Bool)

(declare-fun e!831882 () Bool)

(assert (=> b!1483604 (= e!831879 e!831882)))

(declare-fun res!1008465 () Bool)

(assert (=> b!1483604 (=> (not res!1008465) (not e!831882))))

(declare-datatypes ((SeekEntryResult!12248 0))(
  ( (MissingZero!12248 (index!51384 (_ BitVec 32))) (Found!12248 (index!51385 (_ BitVec 32))) (Intermediate!12248 (undefined!13060 Bool) (index!51386 (_ BitVec 32)) (x!132972 (_ BitVec 32))) (Undefined!12248) (MissingVacant!12248 (index!51387 (_ BitVec 32))) )
))
(declare-fun lt!647484 () SeekEntryResult!12248)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99464 (_ BitVec 32)) SeekEntryResult!12248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483604 (= res!1008465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48008 a!2862) j!93) mask!2687) (select (arr!48008 a!2862) j!93) a!2862 mask!2687) lt!647484))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483604 (= lt!647484 (Intermediate!12248 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483605 () Bool)

(declare-fun e!831881 () Bool)

(assert (=> b!1483605 (= e!831882 e!831881)))

(declare-fun res!1008475 () Bool)

(assert (=> b!1483605 (=> (not res!1008475) (not e!831881))))

(declare-fun lt!647486 () SeekEntryResult!12248)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483605 (= res!1008475 (= lt!647486 (Intermediate!12248 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647485 () array!99464)

(declare-fun lt!647487 () (_ BitVec 64))

(assert (=> b!1483605 (= lt!647486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647487 mask!2687) lt!647487 lt!647485 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483605 (= lt!647487 (select (store (arr!48008 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483606 () Bool)

(declare-fun res!1008471 () Bool)

(assert (=> b!1483606 (=> (not res!1008471) (not e!831886))))

(assert (=> b!1483606 (= res!1008471 (and (= (size!48558 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48558 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48558 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483607 () Bool)

(declare-fun res!1008470 () Bool)

(assert (=> b!1483607 (=> (not res!1008470) (not e!831881))))

(declare-fun e!831884 () Bool)

(assert (=> b!1483607 (= res!1008470 e!831884)))

(declare-fun c!137094 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1483607 (= c!137094 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483608 () Bool)

(declare-fun res!1008468 () Bool)

(assert (=> b!1483608 (=> (not res!1008468) (not e!831882))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1483608 (= res!1008468 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48008 a!2862) j!93) a!2862 mask!2687) lt!647484))))

(declare-fun b!1483609 () Bool)

(declare-fun res!1008469 () Bool)

(assert (=> b!1483609 (=> (not res!1008469) (not e!831886))))

(assert (=> b!1483609 (= res!1008469 (validKeyInArray!0 (select (arr!48008 a!2862) i!1006)))))

(declare-fun b!1483610 () Bool)

(declare-fun res!1008464 () Bool)

(assert (=> b!1483610 (=> (not res!1008464) (not e!831881))))

(assert (=> b!1483610 (= res!1008464 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483611 () Bool)

(declare-fun e!831883 () Bool)

(assert (=> b!1483611 (= e!831881 (not e!831883))))

(declare-fun res!1008461 () Bool)

(assert (=> b!1483611 (=> res!1008461 e!831883)))

(assert (=> b!1483611 (= res!1008461 (or (and (= (select (arr!48008 a!2862) index!646) (select (store (arr!48008 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48008 a!2862) index!646) (select (arr!48008 a!2862) j!93))) (= (select (arr!48008 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!831887 () Bool)

(assert (=> b!1483611 e!831887))

(declare-fun res!1008467 () Bool)

(assert (=> b!1483611 (=> (not res!1008467) (not e!831887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99464 (_ BitVec 32)) Bool)

(assert (=> b!1483611 (= res!1008467 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49836 0))(
  ( (Unit!49837) )
))
(declare-fun lt!647482 () Unit!49836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49836)

(assert (=> b!1483611 (= lt!647482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483612 () Bool)

(declare-fun res!1008460 () Bool)

(assert (=> b!1483612 (=> (not res!1008460) (not e!831886))))

(assert (=> b!1483612 (= res!1008460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!831878 () Bool)

(declare-fun b!1483613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99464 (_ BitVec 32)) SeekEntryResult!12248)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99464 (_ BitVec 32)) SeekEntryResult!12248)

(assert (=> b!1483613 (= e!831878 (= (seekEntryOrOpen!0 lt!647487 lt!647485 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647487 lt!647485 mask!2687)))))

(declare-fun b!1483614 () Bool)

(declare-fun res!1008473 () Bool)

(assert (=> b!1483614 (=> (not res!1008473) (not e!831887))))

(assert (=> b!1483614 (= res!1008473 (= (seekEntryOrOpen!0 (select (arr!48008 a!2862) j!93) a!2862 mask!2687) (Found!12248 j!93)))))

(declare-fun b!1483615 () Bool)

(assert (=> b!1483615 (= e!831883 true)))

(declare-fun lt!647481 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483615 (= lt!647481 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483616 () Bool)

(declare-fun e!831885 () Bool)

(assert (=> b!1483616 (= e!831887 e!831885)))

(declare-fun res!1008463 () Bool)

(assert (=> b!1483616 (=> res!1008463 e!831885)))

(declare-fun lt!647483 () (_ BitVec 64))

(assert (=> b!1483616 (= res!1008463 (or (and (= (select (arr!48008 a!2862) index!646) lt!647483) (= (select (arr!48008 a!2862) index!646) (select (arr!48008 a!2862) j!93))) (= (select (arr!48008 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483616 (= lt!647483 (select (store (arr!48008 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483617 () Bool)

(declare-fun res!1008472 () Bool)

(assert (=> b!1483617 (=> (not res!1008472) (not e!831886))))

(declare-datatypes ((List!34509 0))(
  ( (Nil!34506) (Cons!34505 (h!35879 (_ BitVec 64)) (t!49203 List!34509)) )
))
(declare-fun arrayNoDuplicates!0 (array!99464 (_ BitVec 32) List!34509) Bool)

(assert (=> b!1483617 (= res!1008472 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34506))))

(declare-fun b!1483618 () Bool)

(assert (=> b!1483618 (= e!831886 e!831879)))

(declare-fun res!1008474 () Bool)

(assert (=> b!1483618 (=> (not res!1008474) (not e!831879))))

(assert (=> b!1483618 (= res!1008474 (= (select (store (arr!48008 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483618 (= lt!647485 (array!99465 (store (arr!48008 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48558 a!2862)))))

(declare-fun b!1483619 () Bool)

(declare-fun res!1008462 () Bool)

(assert (=> b!1483619 (=> (not res!1008462) (not e!831887))))

(assert (=> b!1483619 (= res!1008462 (or (= (select (arr!48008 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48008 a!2862) intermediateBeforeIndex!19) (select (arr!48008 a!2862) j!93))))))

(declare-fun b!1483620 () Bool)

(assert (=> b!1483620 (= e!831884 (= lt!647486 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647487 lt!647485 mask!2687)))))

(declare-fun b!1483621 () Bool)

(assert (=> b!1483621 (= e!831884 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647487 lt!647485 mask!2687) (seekEntryOrOpen!0 lt!647487 lt!647485 mask!2687)))))

(declare-fun b!1483622 () Bool)

(assert (=> b!1483622 (= e!831885 e!831878)))

(declare-fun res!1008466 () Bool)

(assert (=> b!1483622 (=> (not res!1008466) (not e!831878))))

(assert (=> b!1483622 (= res!1008466 (and (= index!646 intermediateAfterIndex!19) (= lt!647483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483623 () Bool)

(declare-fun res!1008477 () Bool)

(assert (=> b!1483623 (=> (not res!1008477) (not e!831886))))

(assert (=> b!1483623 (= res!1008477 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48558 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48558 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48558 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126502 res!1008476) b!1483606))

(assert (= (and b!1483606 res!1008471) b!1483609))

(assert (= (and b!1483609 res!1008469) b!1483603))

(assert (= (and b!1483603 res!1008478) b!1483612))

(assert (= (and b!1483612 res!1008460) b!1483617))

(assert (= (and b!1483617 res!1008472) b!1483623))

(assert (= (and b!1483623 res!1008477) b!1483618))

(assert (= (and b!1483618 res!1008474) b!1483604))

(assert (= (and b!1483604 res!1008465) b!1483608))

(assert (= (and b!1483608 res!1008468) b!1483605))

(assert (= (and b!1483605 res!1008475) b!1483607))

(assert (= (and b!1483607 c!137094) b!1483620))

(assert (= (and b!1483607 (not c!137094)) b!1483621))

(assert (= (and b!1483607 res!1008470) b!1483610))

(assert (= (and b!1483610 res!1008464) b!1483611))

(assert (= (and b!1483611 res!1008467) b!1483614))

(assert (= (and b!1483614 res!1008473) b!1483619))

(assert (= (and b!1483619 res!1008462) b!1483616))

(assert (= (and b!1483616 (not res!1008463)) b!1483622))

(assert (= (and b!1483622 res!1008466) b!1483613))

(assert (= (and b!1483611 (not res!1008461)) b!1483615))

(declare-fun m!1369057 () Bool)

(assert (=> b!1483616 m!1369057))

(declare-fun m!1369059 () Bool)

(assert (=> b!1483616 m!1369059))

(declare-fun m!1369061 () Bool)

(assert (=> b!1483616 m!1369061))

(declare-fun m!1369063 () Bool)

(assert (=> b!1483616 m!1369063))

(declare-fun m!1369065 () Bool)

(assert (=> b!1483617 m!1369065))

(declare-fun m!1369067 () Bool)

(assert (=> b!1483619 m!1369067))

(assert (=> b!1483619 m!1369059))

(declare-fun m!1369069 () Bool)

(assert (=> b!1483612 m!1369069))

(declare-fun m!1369071 () Bool)

(assert (=> b!1483615 m!1369071))

(declare-fun m!1369073 () Bool)

(assert (=> b!1483609 m!1369073))

(assert (=> b!1483609 m!1369073))

(declare-fun m!1369075 () Bool)

(assert (=> b!1483609 m!1369075))

(declare-fun m!1369077 () Bool)

(assert (=> b!1483621 m!1369077))

(declare-fun m!1369079 () Bool)

(assert (=> b!1483621 m!1369079))

(assert (=> b!1483618 m!1369061))

(declare-fun m!1369081 () Bool)

(assert (=> b!1483618 m!1369081))

(assert (=> b!1483603 m!1369059))

(assert (=> b!1483603 m!1369059))

(declare-fun m!1369083 () Bool)

(assert (=> b!1483603 m!1369083))

(assert (=> b!1483604 m!1369059))

(assert (=> b!1483604 m!1369059))

(declare-fun m!1369085 () Bool)

(assert (=> b!1483604 m!1369085))

(assert (=> b!1483604 m!1369085))

(assert (=> b!1483604 m!1369059))

(declare-fun m!1369087 () Bool)

(assert (=> b!1483604 m!1369087))

(declare-fun m!1369089 () Bool)

(assert (=> b!1483611 m!1369089))

(assert (=> b!1483611 m!1369061))

(assert (=> b!1483611 m!1369063))

(assert (=> b!1483611 m!1369057))

(declare-fun m!1369091 () Bool)

(assert (=> b!1483611 m!1369091))

(assert (=> b!1483611 m!1369059))

(declare-fun m!1369093 () Bool)

(assert (=> b!1483620 m!1369093))

(assert (=> b!1483614 m!1369059))

(assert (=> b!1483614 m!1369059))

(declare-fun m!1369095 () Bool)

(assert (=> b!1483614 m!1369095))

(assert (=> b!1483613 m!1369079))

(assert (=> b!1483613 m!1369077))

(declare-fun m!1369097 () Bool)

(assert (=> b!1483605 m!1369097))

(assert (=> b!1483605 m!1369097))

(declare-fun m!1369099 () Bool)

(assert (=> b!1483605 m!1369099))

(assert (=> b!1483605 m!1369061))

(declare-fun m!1369101 () Bool)

(assert (=> b!1483605 m!1369101))

(declare-fun m!1369103 () Bool)

(assert (=> start!126502 m!1369103))

(declare-fun m!1369105 () Bool)

(assert (=> start!126502 m!1369105))

(assert (=> b!1483608 m!1369059))

(assert (=> b!1483608 m!1369059))

(declare-fun m!1369107 () Bool)

(assert (=> b!1483608 m!1369107))

(push 1)

