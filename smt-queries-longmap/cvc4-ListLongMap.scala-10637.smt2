; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124964 () Bool)

(assert start!124964)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817707 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98412 0))(
  ( (array!98413 (arr!47494 (Array (_ BitVec 32) (_ BitVec 64))) (size!48044 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98412)

(declare-fun b!1452614 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452614 (= e!817707 (not (or (and (= (select (arr!47494 a!2862) index!646) (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47494 a!2862) index!646) (select (arr!47494 a!2862) j!93))) (= (select (arr!47494 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!817712 () Bool)

(assert (=> b!1452614 e!817712))

(declare-fun res!983721 () Bool)

(assert (=> b!1452614 (=> (not res!983721) (not e!817712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98412 (_ BitVec 32)) Bool)

(assert (=> b!1452614 (= res!983721 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48988 0))(
  ( (Unit!48989) )
))
(declare-fun lt!636999 () Unit!48988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48988)

(assert (=> b!1452614 (= lt!636999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1452615 () Bool)

(assert (=> b!1452615 (= e!817712 (and (or (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) (select (arr!47494 a!2862) j!93))) (or (and (= (select (arr!47494 a!2862) index!646) (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47494 a!2862) index!646) (select (arr!47494 a!2862) j!93))) (= (select (arr!47494 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!636995 () (_ BitVec 64))

(declare-fun lt!636997 () array!98412)

(declare-fun b!1452616 () Bool)

(declare-fun e!817706 () Bool)

(declare-datatypes ((SeekEntryResult!11746 0))(
  ( (MissingZero!11746 (index!49376 (_ BitVec 32))) (Found!11746 (index!49377 (_ BitVec 32))) (Intermediate!11746 (undefined!12558 Bool) (index!49378 (_ BitVec 32)) (x!131019 (_ BitVec 32))) (Undefined!11746) (MissingVacant!11746 (index!49379 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98412 (_ BitVec 32)) SeekEntryResult!11746)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98412 (_ BitVec 32)) SeekEntryResult!11746)

(assert (=> b!1452616 (= e!817706 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636995 lt!636997 mask!2687) (seekEntryOrOpen!0 lt!636995 lt!636997 mask!2687)))))

(declare-fun b!1452617 () Bool)

(declare-fun res!983723 () Bool)

(assert (=> b!1452617 (=> (not res!983723) (not e!817707))))

(assert (=> b!1452617 (= res!983723 e!817706)))

(declare-fun c!133962 () Bool)

(assert (=> b!1452617 (= c!133962 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452618 () Bool)

(declare-fun e!817710 () Bool)

(assert (=> b!1452618 (= e!817710 e!817707)))

(declare-fun res!983720 () Bool)

(assert (=> b!1452618 (=> (not res!983720) (not e!817707))))

(declare-fun lt!636998 () SeekEntryResult!11746)

(assert (=> b!1452618 (= res!983720 (= lt!636998 (Intermediate!11746 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98412 (_ BitVec 32)) SeekEntryResult!11746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452618 (= lt!636998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636995 mask!2687) lt!636995 lt!636997 mask!2687))))

(assert (=> b!1452618 (= lt!636995 (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452619 () Bool)

(declare-fun res!983716 () Bool)

(assert (=> b!1452619 (=> (not res!983716) (not e!817712))))

(assert (=> b!1452619 (= res!983716 (= (seekEntryOrOpen!0 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) (Found!11746 j!93)))))

(declare-fun res!983712 () Bool)

(declare-fun e!817709 () Bool)

(assert (=> start!124964 (=> (not res!983712) (not e!817709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124964 (= res!983712 (validMask!0 mask!2687))))

(assert (=> start!124964 e!817709))

(assert (=> start!124964 true))

(declare-fun array_inv!36522 (array!98412) Bool)

(assert (=> start!124964 (array_inv!36522 a!2862)))

(declare-fun b!1452620 () Bool)

(declare-fun res!983725 () Bool)

(assert (=> b!1452620 (=> (not res!983725) (not e!817707))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452620 (= res!983725 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452621 () Bool)

(declare-fun res!983711 () Bool)

(assert (=> b!1452621 (=> (not res!983711) (not e!817709))))

(declare-datatypes ((List!33995 0))(
  ( (Nil!33992) (Cons!33991 (h!35341 (_ BitVec 64)) (t!48689 List!33995)) )
))
(declare-fun arrayNoDuplicates!0 (array!98412 (_ BitVec 32) List!33995) Bool)

(assert (=> b!1452621 (= res!983711 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33992))))

(declare-fun b!1452622 () Bool)

(declare-fun res!983717 () Bool)

(assert (=> b!1452622 (=> (not res!983717) (not e!817709))))

(assert (=> b!1452622 (= res!983717 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48044 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48044 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48044 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452623 () Bool)

(declare-fun res!983714 () Bool)

(assert (=> b!1452623 (=> (not res!983714) (not e!817709))))

(assert (=> b!1452623 (= res!983714 (and (= (size!48044 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48044 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48044 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452624 () Bool)

(declare-fun e!817711 () Bool)

(assert (=> b!1452624 (= e!817709 e!817711)))

(declare-fun res!983718 () Bool)

(assert (=> b!1452624 (=> (not res!983718) (not e!817711))))

(assert (=> b!1452624 (= res!983718 (= (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452624 (= lt!636997 (array!98413 (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48044 a!2862)))))

(declare-fun b!1452625 () Bool)

(assert (=> b!1452625 (= e!817706 (= lt!636998 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636995 lt!636997 mask!2687)))))

(declare-fun b!1452626 () Bool)

(declare-fun res!983715 () Bool)

(assert (=> b!1452626 (=> (not res!983715) (not e!817709))))

(assert (=> b!1452626 (= res!983715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452627 () Bool)

(declare-fun res!983722 () Bool)

(assert (=> b!1452627 (=> (not res!983722) (not e!817709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452627 (= res!983722 (validKeyInArray!0 (select (arr!47494 a!2862) i!1006)))))

(declare-fun b!1452628 () Bool)

(declare-fun res!983713 () Bool)

(assert (=> b!1452628 (=> (not res!983713) (not e!817709))))

(assert (=> b!1452628 (= res!983713 (validKeyInArray!0 (select (arr!47494 a!2862) j!93)))))

(declare-fun b!1452629 () Bool)

(declare-fun res!983724 () Bool)

(assert (=> b!1452629 (=> (not res!983724) (not e!817710))))

(declare-fun lt!636996 () SeekEntryResult!11746)

(assert (=> b!1452629 (= res!983724 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!636996))))

(declare-fun b!1452630 () Bool)

(assert (=> b!1452630 (= e!817711 e!817710)))

(declare-fun res!983719 () Bool)

(assert (=> b!1452630 (=> (not res!983719) (not e!817710))))

(assert (=> b!1452630 (= res!983719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47494 a!2862) j!93) mask!2687) (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!636996))))

(assert (=> b!1452630 (= lt!636996 (Intermediate!11746 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124964 res!983712) b!1452623))

(assert (= (and b!1452623 res!983714) b!1452627))

(assert (= (and b!1452627 res!983722) b!1452628))

(assert (= (and b!1452628 res!983713) b!1452626))

(assert (= (and b!1452626 res!983715) b!1452621))

(assert (= (and b!1452621 res!983711) b!1452622))

(assert (= (and b!1452622 res!983717) b!1452624))

(assert (= (and b!1452624 res!983718) b!1452630))

(assert (= (and b!1452630 res!983719) b!1452629))

(assert (= (and b!1452629 res!983724) b!1452618))

(assert (= (and b!1452618 res!983720) b!1452617))

(assert (= (and b!1452617 c!133962) b!1452625))

(assert (= (and b!1452617 (not c!133962)) b!1452616))

(assert (= (and b!1452617 res!983723) b!1452620))

(assert (= (and b!1452620 res!983725) b!1452614))

(assert (= (and b!1452614 res!983721) b!1452619))

(assert (= (and b!1452619 res!983716) b!1452615))

(declare-fun m!1341185 () Bool)

(assert (=> b!1452614 m!1341185))

(declare-fun m!1341187 () Bool)

(assert (=> b!1452614 m!1341187))

(declare-fun m!1341189 () Bool)

(assert (=> b!1452614 m!1341189))

(declare-fun m!1341191 () Bool)

(assert (=> b!1452614 m!1341191))

(declare-fun m!1341193 () Bool)

(assert (=> b!1452614 m!1341193))

(declare-fun m!1341195 () Bool)

(assert (=> b!1452614 m!1341195))

(declare-fun m!1341197 () Bool)

(assert (=> b!1452626 m!1341197))

(declare-fun m!1341199 () Bool)

(assert (=> start!124964 m!1341199))

(declare-fun m!1341201 () Bool)

(assert (=> start!124964 m!1341201))

(declare-fun m!1341203 () Bool)

(assert (=> b!1452616 m!1341203))

(declare-fun m!1341205 () Bool)

(assert (=> b!1452616 m!1341205))

(declare-fun m!1341207 () Bool)

(assert (=> b!1452621 m!1341207))

(assert (=> b!1452629 m!1341195))

(assert (=> b!1452629 m!1341195))

(declare-fun m!1341209 () Bool)

(assert (=> b!1452629 m!1341209))

(assert (=> b!1452628 m!1341195))

(assert (=> b!1452628 m!1341195))

(declare-fun m!1341211 () Bool)

(assert (=> b!1452628 m!1341211))

(assert (=> b!1452615 m!1341187))

(declare-fun m!1341213 () Bool)

(assert (=> b!1452615 m!1341213))

(assert (=> b!1452615 m!1341189))

(assert (=> b!1452615 m!1341191))

(assert (=> b!1452615 m!1341195))

(declare-fun m!1341215 () Bool)

(assert (=> b!1452625 m!1341215))

(assert (=> b!1452624 m!1341187))

(declare-fun m!1341217 () Bool)

(assert (=> b!1452624 m!1341217))

(assert (=> b!1452630 m!1341195))

(assert (=> b!1452630 m!1341195))

(declare-fun m!1341219 () Bool)

(assert (=> b!1452630 m!1341219))

(assert (=> b!1452630 m!1341219))

(assert (=> b!1452630 m!1341195))

(declare-fun m!1341221 () Bool)

(assert (=> b!1452630 m!1341221))

(declare-fun m!1341223 () Bool)

(assert (=> b!1452627 m!1341223))

(assert (=> b!1452627 m!1341223))

(declare-fun m!1341225 () Bool)

(assert (=> b!1452627 m!1341225))

(declare-fun m!1341227 () Bool)

(assert (=> b!1452618 m!1341227))

(assert (=> b!1452618 m!1341227))

(declare-fun m!1341229 () Bool)

(assert (=> b!1452618 m!1341229))

(assert (=> b!1452618 m!1341187))

(declare-fun m!1341231 () Bool)

(assert (=> b!1452618 m!1341231))

(assert (=> b!1452619 m!1341195))

(assert (=> b!1452619 m!1341195))

(declare-fun m!1341233 () Bool)

(assert (=> b!1452619 m!1341233))

(push 1)

(assert (not b!1452630))

(assert (not b!1452626))

(assert (not start!124964))

(assert (not b!1452627))

(assert (not b!1452621))

(assert (not b!1452629))

(assert (not b!1452616))

(assert (not b!1452619))

(assert (not b!1452618))

(assert (not b!1452625))

(assert (not b!1452628))

(assert (not b!1452614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

