; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124962 () Bool)

(assert start!124962)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11745 0))(
  ( (MissingZero!11745 (index!49372 (_ BitVec 32))) (Found!11745 (index!49373 (_ BitVec 32))) (Intermediate!11745 (undefined!12557 Bool) (index!49374 (_ BitVec 32)) (x!131018 (_ BitVec 32))) (Undefined!11745) (MissingVacant!11745 (index!49375 (_ BitVec 32))) )
))
(declare-fun lt!636981 () SeekEntryResult!11745)

(declare-fun lt!636984 () (_ BitVec 64))

(declare-datatypes ((array!98410 0))(
  ( (array!98411 (arr!47493 (Array (_ BitVec 32) (_ BitVec 64))) (size!48043 (_ BitVec 32))) )
))
(declare-fun lt!636983 () array!98410)

(declare-fun b!1452563 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!817685 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98410 (_ BitVec 32)) SeekEntryResult!11745)

(assert (=> b!1452563 (= e!817685 (= lt!636981 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636984 lt!636983 mask!2687)))))

(declare-fun b!1452564 () Bool)

(declare-fun res!983675 () Bool)

(declare-fun e!817688 () Bool)

(assert (=> b!1452564 (=> (not res!983675) (not e!817688))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!98410)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452564 (= res!983675 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48043 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48043 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48043 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452565 () Bool)

(declare-fun e!817687 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452565 (= e!817687 (and (or (= (select (arr!47493 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47493 a!2862) intermediateBeforeIndex!19) (select (arr!47493 a!2862) j!93))) (or (and (= (select (arr!47493 a!2862) index!646) (select (store (arr!47493 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47493 a!2862) index!646) (select (arr!47493 a!2862) j!93))) (= (select (arr!47493 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47493 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452566 () Bool)

(declare-fun res!983672 () Bool)

(assert (=> b!1452566 (=> (not res!983672) (not e!817688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452566 (= res!983672 (validKeyInArray!0 (select (arr!47493 a!2862) j!93)))))

(declare-fun e!817691 () Bool)

(declare-fun b!1452567 () Bool)

(assert (=> b!1452567 (= e!817691 (not (or (and (= (select (arr!47493 a!2862) index!646) (select (store (arr!47493 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47493 a!2862) index!646) (select (arr!47493 a!2862) j!93))) (= (select (arr!47493 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1452567 e!817687))

(declare-fun res!983678 () Bool)

(assert (=> b!1452567 (=> (not res!983678) (not e!817687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98410 (_ BitVec 32)) Bool)

(assert (=> b!1452567 (= res!983678 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48986 0))(
  ( (Unit!48987) )
))
(declare-fun lt!636982 () Unit!48986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48986)

(assert (=> b!1452567 (= lt!636982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452568 () Bool)

(declare-fun res!983668 () Bool)

(assert (=> b!1452568 (=> (not res!983668) (not e!817688))))

(assert (=> b!1452568 (= res!983668 (and (= (size!48043 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48043 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48043 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452569 () Bool)

(declare-fun e!817689 () Bool)

(declare-fun e!817686 () Bool)

(assert (=> b!1452569 (= e!817689 e!817686)))

(declare-fun res!983680 () Bool)

(assert (=> b!1452569 (=> (not res!983680) (not e!817686))))

(declare-fun lt!636980 () SeekEntryResult!11745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452569 (= res!983680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47493 a!2862) j!93) mask!2687) (select (arr!47493 a!2862) j!93) a!2862 mask!2687) lt!636980))))

(assert (=> b!1452569 (= lt!636980 (Intermediate!11745 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452571 () Bool)

(assert (=> b!1452571 (= e!817686 e!817691)))

(declare-fun res!983679 () Bool)

(assert (=> b!1452571 (=> (not res!983679) (not e!817691))))

(assert (=> b!1452571 (= res!983679 (= lt!636981 (Intermediate!11745 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452571 (= lt!636981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636984 mask!2687) lt!636984 lt!636983 mask!2687))))

(assert (=> b!1452571 (= lt!636984 (select (store (arr!47493 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452572 () Bool)

(declare-fun res!983674 () Bool)

(assert (=> b!1452572 (=> (not res!983674) (not e!817688))))

(declare-datatypes ((List!33994 0))(
  ( (Nil!33991) (Cons!33990 (h!35340 (_ BitVec 64)) (t!48688 List!33994)) )
))
(declare-fun arrayNoDuplicates!0 (array!98410 (_ BitVec 32) List!33994) Bool)

(assert (=> b!1452572 (= res!983674 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33991))))

(declare-fun b!1452573 () Bool)

(assert (=> b!1452573 (= e!817688 e!817689)))

(declare-fun res!983671 () Bool)

(assert (=> b!1452573 (=> (not res!983671) (not e!817689))))

(assert (=> b!1452573 (= res!983671 (= (select (store (arr!47493 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452573 (= lt!636983 (array!98411 (store (arr!47493 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48043 a!2862)))))

(declare-fun b!1452574 () Bool)

(declare-fun res!983673 () Bool)

(assert (=> b!1452574 (=> (not res!983673) (not e!817687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98410 (_ BitVec 32)) SeekEntryResult!11745)

(assert (=> b!1452574 (= res!983673 (= (seekEntryOrOpen!0 (select (arr!47493 a!2862) j!93) a!2862 mask!2687) (Found!11745 j!93)))))

(declare-fun b!1452575 () Bool)

(declare-fun res!983666 () Bool)

(assert (=> b!1452575 (=> (not res!983666) (not e!817691))))

(assert (=> b!1452575 (= res!983666 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!983676 () Bool)

(assert (=> start!124962 (=> (not res!983676) (not e!817688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124962 (= res!983676 (validMask!0 mask!2687))))

(assert (=> start!124962 e!817688))

(assert (=> start!124962 true))

(declare-fun array_inv!36521 (array!98410) Bool)

(assert (=> start!124962 (array_inv!36521 a!2862)))

(declare-fun b!1452570 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98410 (_ BitVec 32)) SeekEntryResult!11745)

(assert (=> b!1452570 (= e!817685 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636984 lt!636983 mask!2687) (seekEntryOrOpen!0 lt!636984 lt!636983 mask!2687)))))

(declare-fun b!1452576 () Bool)

(declare-fun res!983670 () Bool)

(assert (=> b!1452576 (=> (not res!983670) (not e!817686))))

(assert (=> b!1452576 (= res!983670 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47493 a!2862) j!93) a!2862 mask!2687) lt!636980))))

(declare-fun b!1452577 () Bool)

(declare-fun res!983667 () Bool)

(assert (=> b!1452577 (=> (not res!983667) (not e!817688))))

(assert (=> b!1452577 (= res!983667 (validKeyInArray!0 (select (arr!47493 a!2862) i!1006)))))

(declare-fun b!1452578 () Bool)

(declare-fun res!983677 () Bool)

(assert (=> b!1452578 (=> (not res!983677) (not e!817691))))

(assert (=> b!1452578 (= res!983677 e!817685)))

(declare-fun c!133959 () Bool)

(assert (=> b!1452578 (= c!133959 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452579 () Bool)

(declare-fun res!983669 () Bool)

(assert (=> b!1452579 (=> (not res!983669) (not e!817688))))

(assert (=> b!1452579 (= res!983669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124962 res!983676) b!1452568))

(assert (= (and b!1452568 res!983668) b!1452577))

(assert (= (and b!1452577 res!983667) b!1452566))

(assert (= (and b!1452566 res!983672) b!1452579))

(assert (= (and b!1452579 res!983669) b!1452572))

(assert (= (and b!1452572 res!983674) b!1452564))

(assert (= (and b!1452564 res!983675) b!1452573))

(assert (= (and b!1452573 res!983671) b!1452569))

(assert (= (and b!1452569 res!983680) b!1452576))

(assert (= (and b!1452576 res!983670) b!1452571))

(assert (= (and b!1452571 res!983679) b!1452578))

(assert (= (and b!1452578 c!133959) b!1452563))

(assert (= (and b!1452578 (not c!133959)) b!1452570))

(assert (= (and b!1452578 res!983677) b!1452575))

(assert (= (and b!1452575 res!983666) b!1452567))

(assert (= (and b!1452567 res!983678) b!1452574))

(assert (= (and b!1452574 res!983673) b!1452565))

(declare-fun m!1341135 () Bool)

(assert (=> b!1452566 m!1341135))

(assert (=> b!1452566 m!1341135))

(declare-fun m!1341137 () Bool)

(assert (=> b!1452566 m!1341137))

(declare-fun m!1341139 () Bool)

(assert (=> b!1452565 m!1341139))

(declare-fun m!1341141 () Bool)

(assert (=> b!1452565 m!1341141))

(declare-fun m!1341143 () Bool)

(assert (=> b!1452565 m!1341143))

(declare-fun m!1341145 () Bool)

(assert (=> b!1452565 m!1341145))

(assert (=> b!1452565 m!1341135))

(assert (=> b!1452569 m!1341135))

(assert (=> b!1452569 m!1341135))

(declare-fun m!1341147 () Bool)

(assert (=> b!1452569 m!1341147))

(assert (=> b!1452569 m!1341147))

(assert (=> b!1452569 m!1341135))

(declare-fun m!1341149 () Bool)

(assert (=> b!1452569 m!1341149))

(declare-fun m!1341151 () Bool)

(assert (=> b!1452570 m!1341151))

(declare-fun m!1341153 () Bool)

(assert (=> b!1452570 m!1341153))

(assert (=> b!1452574 m!1341135))

(assert (=> b!1452574 m!1341135))

(declare-fun m!1341155 () Bool)

(assert (=> b!1452574 m!1341155))

(declare-fun m!1341157 () Bool)

(assert (=> b!1452563 m!1341157))

(declare-fun m!1341159 () Bool)

(assert (=> b!1452577 m!1341159))

(assert (=> b!1452577 m!1341159))

(declare-fun m!1341161 () Bool)

(assert (=> b!1452577 m!1341161))

(assert (=> b!1452573 m!1341139))

(declare-fun m!1341163 () Bool)

(assert (=> b!1452573 m!1341163))

(declare-fun m!1341165 () Bool)

(assert (=> b!1452571 m!1341165))

(assert (=> b!1452571 m!1341165))

(declare-fun m!1341167 () Bool)

(assert (=> b!1452571 m!1341167))

(assert (=> b!1452571 m!1341139))

(declare-fun m!1341169 () Bool)

(assert (=> b!1452571 m!1341169))

(declare-fun m!1341171 () Bool)

(assert (=> b!1452579 m!1341171))

(declare-fun m!1341173 () Bool)

(assert (=> b!1452567 m!1341173))

(assert (=> b!1452567 m!1341139))

(assert (=> b!1452567 m!1341143))

(assert (=> b!1452567 m!1341145))

(declare-fun m!1341175 () Bool)

(assert (=> b!1452567 m!1341175))

(assert (=> b!1452567 m!1341135))

(assert (=> b!1452576 m!1341135))

(assert (=> b!1452576 m!1341135))

(declare-fun m!1341177 () Bool)

(assert (=> b!1452576 m!1341177))

(declare-fun m!1341179 () Bool)

(assert (=> start!124962 m!1341179))

(declare-fun m!1341181 () Bool)

(assert (=> start!124962 m!1341181))

(declare-fun m!1341183 () Bool)

(assert (=> b!1452572 m!1341183))

(check-sat (not b!1452563) (not b!1452570) (not b!1452577) (not b!1452571) (not start!124962) (not b!1452574) (not b!1452566) (not b!1452569) (not b!1452579) (not b!1452576) (not b!1452572) (not b!1452567))
(check-sat)
