; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126184 () Bool)

(assert start!126184)

(declare-fun b!1478563 () Bool)

(declare-fun res!1004668 () Bool)

(declare-fun e!829389 () Bool)

(assert (=> b!1478563 (=> (not res!1004668) (not e!829389))))

(declare-datatypes ((SeekEntryResult!12179 0))(
  ( (MissingZero!12179 (index!51108 (_ BitVec 32))) (Found!12179 (index!51109 (_ BitVec 32))) (Intermediate!12179 (undefined!12991 Bool) (index!51110 (_ BitVec 32)) (x!132693 (_ BitVec 32))) (Undefined!12179) (MissingVacant!12179 (index!51111 (_ BitVec 32))) )
))
(declare-fun lt!645553 () SeekEntryResult!12179)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99268 0))(
  ( (array!99269 (arr!47914 (Array (_ BitVec 32) (_ BitVec 64))) (size!48466 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99268)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99268 (_ BitVec 32)) SeekEntryResult!12179)

(assert (=> b!1478563 (= res!1004668 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47914 a!2862) j!93) a!2862 mask!2687) lt!645553))))

(declare-fun res!1004674 () Bool)

(declare-fun e!829387 () Bool)

(assert (=> start!126184 (=> (not res!1004674) (not e!829387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126184 (= res!1004674 (validMask!0 mask!2687))))

(assert (=> start!126184 e!829387))

(assert (=> start!126184 true))

(declare-fun array_inv!37147 (array!99268) Bool)

(assert (=> start!126184 (array_inv!37147 a!2862)))

(declare-fun b!1478564 () Bool)

(declare-fun e!829392 () Bool)

(assert (=> b!1478564 (= e!829387 e!829392)))

(declare-fun res!1004663 () Bool)

(assert (=> b!1478564 (=> (not res!1004663) (not e!829392))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478564 (= res!1004663 (= (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645557 () array!99268)

(assert (=> b!1478564 (= lt!645557 (array!99269 (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48466 a!2862)))))

(declare-fun b!1478565 () Bool)

(declare-fun e!829390 () Bool)

(assert (=> b!1478565 (= e!829389 e!829390)))

(declare-fun res!1004660 () Bool)

(assert (=> b!1478565 (=> (not res!1004660) (not e!829390))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645555 () SeekEntryResult!12179)

(assert (=> b!1478565 (= res!1004660 (= lt!645555 (Intermediate!12179 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645556 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478565 (= lt!645555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645556 mask!2687) lt!645556 lt!645557 mask!2687))))

(assert (=> b!1478565 (= lt!645556 (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!829393 () Bool)

(declare-fun b!1478566 () Bool)

(assert (=> b!1478566 (= e!829393 (= lt!645555 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645556 lt!645557 mask!2687)))))

(declare-fun b!1478567 () Bool)

(declare-fun res!1004670 () Bool)

(assert (=> b!1478567 (=> (not res!1004670) (not e!829387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99268 (_ BitVec 32)) Bool)

(assert (=> b!1478567 (= res!1004670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478568 () Bool)

(assert (=> b!1478568 (= e!829390 (not true))))

(declare-fun e!829395 () Bool)

(assert (=> b!1478568 e!829395))

(declare-fun res!1004664 () Bool)

(assert (=> b!1478568 (=> (not res!1004664) (not e!829395))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!645558 () SeekEntryResult!12179)

(assert (=> b!1478568 (= res!1004664 (and (= lt!645558 (Found!12179 j!93)) (or (= (select (arr!47914 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47914 a!2862) intermediateBeforeIndex!19) (select (arr!47914 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99268 (_ BitVec 32)) SeekEntryResult!12179)

(assert (=> b!1478568 (= lt!645558 (seekEntryOrOpen!0 (select (arr!47914 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478568 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49539 0))(
  ( (Unit!49540) )
))
(declare-fun lt!645554 () Unit!49539)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49539)

(assert (=> b!1478568 (= lt!645554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!829388 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1478569 () Bool)

(assert (=> b!1478569 (= e!829388 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478570 () Bool)

(declare-fun res!1004662 () Bool)

(assert (=> b!1478570 (=> (not res!1004662) (not e!829387))))

(declare-datatypes ((List!34493 0))(
  ( (Nil!34490) (Cons!34489 (h!35857 (_ BitVec 64)) (t!49179 List!34493)) )
))
(declare-fun arrayNoDuplicates!0 (array!99268 (_ BitVec 32) List!34493) Bool)

(assert (=> b!1478570 (= res!1004662 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34490))))

(declare-fun b!1478571 () Bool)

(declare-fun e!829391 () Bool)

(assert (=> b!1478571 (= e!829395 e!829391)))

(declare-fun res!1004665 () Bool)

(assert (=> b!1478571 (=> res!1004665 e!829391)))

(assert (=> b!1478571 (= res!1004665 (or (and (= (select (arr!47914 a!2862) index!646) (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47914 a!2862) index!646) (select (arr!47914 a!2862) j!93))) (not (= (select (arr!47914 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478572 () Bool)

(declare-fun res!1004673 () Bool)

(assert (=> b!1478572 (=> (not res!1004673) (not e!829387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478572 (= res!1004673 (validKeyInArray!0 (select (arr!47914 a!2862) j!93)))))

(declare-fun b!1478573 () Bool)

(assert (=> b!1478573 (= e!829391 e!829388)))

(declare-fun res!1004671 () Bool)

(assert (=> b!1478573 (=> (not res!1004671) (not e!829388))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99268 (_ BitVec 32)) SeekEntryResult!12179)

(assert (=> b!1478573 (= res!1004671 (= lt!645558 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47914 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478574 () Bool)

(assert (=> b!1478574 (= e!829393 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645556 lt!645557 mask!2687) (seekEntryOrOpen!0 lt!645556 lt!645557 mask!2687)))))

(declare-fun b!1478575 () Bool)

(declare-fun res!1004669 () Bool)

(assert (=> b!1478575 (=> (not res!1004669) (not e!829390))))

(assert (=> b!1478575 (= res!1004669 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478576 () Bool)

(assert (=> b!1478576 (= e!829392 e!829389)))

(declare-fun res!1004661 () Bool)

(assert (=> b!1478576 (=> (not res!1004661) (not e!829389))))

(assert (=> b!1478576 (= res!1004661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47914 a!2862) j!93) mask!2687) (select (arr!47914 a!2862) j!93) a!2862 mask!2687) lt!645553))))

(assert (=> b!1478576 (= lt!645553 (Intermediate!12179 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478577 () Bool)

(declare-fun res!1004666 () Bool)

(assert (=> b!1478577 (=> (not res!1004666) (not e!829387))))

(assert (=> b!1478577 (= res!1004666 (validKeyInArray!0 (select (arr!47914 a!2862) i!1006)))))

(declare-fun b!1478578 () Bool)

(declare-fun res!1004667 () Bool)

(assert (=> b!1478578 (=> (not res!1004667) (not e!829390))))

(assert (=> b!1478578 (= res!1004667 e!829393)))

(declare-fun c!136474 () Bool)

(assert (=> b!1478578 (= c!136474 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478579 () Bool)

(declare-fun res!1004659 () Bool)

(assert (=> b!1478579 (=> (not res!1004659) (not e!829387))))

(assert (=> b!1478579 (= res!1004659 (and (= (size!48466 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48466 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48466 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478580 () Bool)

(declare-fun res!1004672 () Bool)

(assert (=> b!1478580 (=> (not res!1004672) (not e!829387))))

(assert (=> b!1478580 (= res!1004672 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48466 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48466 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48466 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126184 res!1004674) b!1478579))

(assert (= (and b!1478579 res!1004659) b!1478577))

(assert (= (and b!1478577 res!1004666) b!1478572))

(assert (= (and b!1478572 res!1004673) b!1478567))

(assert (= (and b!1478567 res!1004670) b!1478570))

(assert (= (and b!1478570 res!1004662) b!1478580))

(assert (= (and b!1478580 res!1004672) b!1478564))

(assert (= (and b!1478564 res!1004663) b!1478576))

(assert (= (and b!1478576 res!1004661) b!1478563))

(assert (= (and b!1478563 res!1004668) b!1478565))

(assert (= (and b!1478565 res!1004660) b!1478578))

(assert (= (and b!1478578 c!136474) b!1478566))

(assert (= (and b!1478578 (not c!136474)) b!1478574))

(assert (= (and b!1478578 res!1004667) b!1478575))

(assert (= (and b!1478575 res!1004669) b!1478568))

(assert (= (and b!1478568 res!1004664) b!1478571))

(assert (= (and b!1478571 (not res!1004665)) b!1478573))

(assert (= (and b!1478573 res!1004671) b!1478569))

(declare-fun m!1363983 () Bool)

(assert (=> b!1478567 m!1363983))

(declare-fun m!1363985 () Bool)

(assert (=> b!1478573 m!1363985))

(assert (=> b!1478573 m!1363985))

(declare-fun m!1363987 () Bool)

(assert (=> b!1478573 m!1363987))

(assert (=> b!1478572 m!1363985))

(assert (=> b!1478572 m!1363985))

(declare-fun m!1363989 () Bool)

(assert (=> b!1478572 m!1363989))

(assert (=> b!1478576 m!1363985))

(assert (=> b!1478576 m!1363985))

(declare-fun m!1363991 () Bool)

(assert (=> b!1478576 m!1363991))

(assert (=> b!1478576 m!1363991))

(assert (=> b!1478576 m!1363985))

(declare-fun m!1363993 () Bool)

(assert (=> b!1478576 m!1363993))

(declare-fun m!1363995 () Bool)

(assert (=> start!126184 m!1363995))

(declare-fun m!1363997 () Bool)

(assert (=> start!126184 m!1363997))

(declare-fun m!1363999 () Bool)

(assert (=> b!1478566 m!1363999))

(declare-fun m!1364001 () Bool)

(assert (=> b!1478570 m!1364001))

(declare-fun m!1364003 () Bool)

(assert (=> b!1478571 m!1364003))

(declare-fun m!1364005 () Bool)

(assert (=> b!1478571 m!1364005))

(declare-fun m!1364007 () Bool)

(assert (=> b!1478571 m!1364007))

(assert (=> b!1478571 m!1363985))

(declare-fun m!1364009 () Bool)

(assert (=> b!1478577 m!1364009))

(assert (=> b!1478577 m!1364009))

(declare-fun m!1364011 () Bool)

(assert (=> b!1478577 m!1364011))

(assert (=> b!1478563 m!1363985))

(assert (=> b!1478563 m!1363985))

(declare-fun m!1364013 () Bool)

(assert (=> b!1478563 m!1364013))

(declare-fun m!1364015 () Bool)

(assert (=> b!1478565 m!1364015))

(assert (=> b!1478565 m!1364015))

(declare-fun m!1364017 () Bool)

(assert (=> b!1478565 m!1364017))

(assert (=> b!1478565 m!1364005))

(declare-fun m!1364019 () Bool)

(assert (=> b!1478565 m!1364019))

(declare-fun m!1364021 () Bool)

(assert (=> b!1478574 m!1364021))

(declare-fun m!1364023 () Bool)

(assert (=> b!1478574 m!1364023))

(declare-fun m!1364025 () Bool)

(assert (=> b!1478568 m!1364025))

(declare-fun m!1364027 () Bool)

(assert (=> b!1478568 m!1364027))

(assert (=> b!1478568 m!1363985))

(declare-fun m!1364029 () Bool)

(assert (=> b!1478568 m!1364029))

(declare-fun m!1364031 () Bool)

(assert (=> b!1478568 m!1364031))

(assert (=> b!1478568 m!1363985))

(assert (=> b!1478564 m!1364005))

(declare-fun m!1364033 () Bool)

(assert (=> b!1478564 m!1364033))

(check-sat (not b!1478577) (not b!1478565) (not b!1478570) (not b!1478563) (not b!1478568) (not b!1478572) (not b!1478567) (not b!1478574) (not b!1478576) (not b!1478573) (not b!1478566) (not start!126184))
(check-sat)
