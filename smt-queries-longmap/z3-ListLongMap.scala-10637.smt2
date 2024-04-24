; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125178 () Bool)

(assert start!125178)

(declare-fun b!1453839 () Bool)

(declare-fun res!984128 () Bool)

(declare-fun e!818503 () Bool)

(assert (=> b!1453839 (=> (not res!984128) (not e!818503))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98521 0))(
  ( (array!98522 (arr!47545 (Array (_ BitVec 32) (_ BitVec 64))) (size!48096 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98521)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453839 (= res!984128 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48096 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48096 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48096 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453840 () Bool)

(declare-fun res!984137 () Bool)

(assert (=> b!1453840 (=> (not res!984137) (not e!818503))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98521 (_ BitVec 32)) Bool)

(assert (=> b!1453840 (= res!984137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453841 () Bool)

(declare-fun res!984131 () Bool)

(declare-fun e!818502 () Bool)

(assert (=> b!1453841 (=> (not res!984131) (not e!818502))))

(declare-datatypes ((SeekEntryResult!11694 0))(
  ( (MissingZero!11694 (index!49168 (_ BitVec 32))) (Found!11694 (index!49169 (_ BitVec 32))) (Intermediate!11694 (undefined!12506 Bool) (index!49170 (_ BitVec 32)) (x!130991 (_ BitVec 32))) (Undefined!11694) (MissingVacant!11694 (index!49171 (_ BitVec 32))) )
))
(declare-fun lt!637443 () SeekEntryResult!11694)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98521 (_ BitVec 32)) SeekEntryResult!11694)

(assert (=> b!1453841 (= res!984131 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!637443))))

(declare-fun res!984123 () Bool)

(assert (=> start!125178 (=> (not res!984123) (not e!818503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125178 (= res!984123 (validMask!0 mask!2687))))

(assert (=> start!125178 e!818503))

(assert (=> start!125178 true))

(declare-fun array_inv!36826 (array!98521) Bool)

(assert (=> start!125178 (array_inv!36826 a!2862)))

(declare-fun b!1453842 () Bool)

(declare-fun res!984132 () Bool)

(declare-fun e!818506 () Bool)

(assert (=> b!1453842 (=> (not res!984132) (not e!818506))))

(declare-fun e!818507 () Bool)

(assert (=> b!1453842 (= res!984132 e!818507)))

(declare-fun c!134377 () Bool)

(assert (=> b!1453842 (= c!134377 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453843 () Bool)

(declare-fun res!984136 () Bool)

(assert (=> b!1453843 (=> (not res!984136) (not e!818506))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453843 (= res!984136 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!637445 () array!98521)

(declare-fun lt!637447 () (_ BitVec 64))

(declare-fun b!1453844 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98521 (_ BitVec 32)) SeekEntryResult!11694)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98521 (_ BitVec 32)) SeekEntryResult!11694)

(assert (=> b!1453844 (= e!818507 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637447 lt!637445 mask!2687) (seekEntryOrOpen!0 lt!637447 lt!637445 mask!2687)))))

(declare-fun e!818504 () Bool)

(declare-fun b!1453845 () Bool)

(assert (=> b!1453845 (= e!818504 (and (or (= (select (arr!47545 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47545 a!2862) intermediateBeforeIndex!19) (select (arr!47545 a!2862) j!93))) (or (and (= (select (arr!47545 a!2862) index!646) (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47545 a!2862) index!646) (select (arr!47545 a!2862) j!93))) (= (select (arr!47545 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1453846 () Bool)

(assert (=> b!1453846 (= e!818506 (not (or (and (= (select (arr!47545 a!2862) index!646) (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47545 a!2862) index!646) (select (arr!47545 a!2862) j!93))) (= (select (arr!47545 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1453846 e!818504))

(declare-fun res!984129 () Bool)

(assert (=> b!1453846 (=> (not res!984129) (not e!818504))))

(assert (=> b!1453846 (= res!984129 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48917 0))(
  ( (Unit!48918) )
))
(declare-fun lt!637444 () Unit!48917)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48917)

(assert (=> b!1453846 (= lt!637444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453847 () Bool)

(assert (=> b!1453847 (= e!818502 e!818506)))

(declare-fun res!984125 () Bool)

(assert (=> b!1453847 (=> (not res!984125) (not e!818506))))

(declare-fun lt!637446 () SeekEntryResult!11694)

(assert (=> b!1453847 (= res!984125 (= lt!637446 (Intermediate!11694 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453847 (= lt!637446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637447 mask!2687) lt!637447 lt!637445 mask!2687))))

(assert (=> b!1453847 (= lt!637447 (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453848 () Bool)

(declare-fun res!984135 () Bool)

(assert (=> b!1453848 (=> (not res!984135) (not e!818504))))

(assert (=> b!1453848 (= res!984135 (= (seekEntryOrOpen!0 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) (Found!11694 j!93)))))

(declare-fun b!1453849 () Bool)

(declare-fun res!984127 () Bool)

(assert (=> b!1453849 (=> (not res!984127) (not e!818503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453849 (= res!984127 (validKeyInArray!0 (select (arr!47545 a!2862) i!1006)))))

(declare-fun b!1453850 () Bool)

(declare-fun res!984133 () Bool)

(assert (=> b!1453850 (=> (not res!984133) (not e!818503))))

(assert (=> b!1453850 (= res!984133 (and (= (size!48096 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48096 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48096 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453851 () Bool)

(declare-fun res!984134 () Bool)

(assert (=> b!1453851 (=> (not res!984134) (not e!818503))))

(declare-datatypes ((List!34033 0))(
  ( (Nil!34030) (Cons!34029 (h!35390 (_ BitVec 64)) (t!48719 List!34033)) )
))
(declare-fun arrayNoDuplicates!0 (array!98521 (_ BitVec 32) List!34033) Bool)

(assert (=> b!1453851 (= res!984134 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34030))))

(declare-fun b!1453852 () Bool)

(declare-fun e!818505 () Bool)

(assert (=> b!1453852 (= e!818505 e!818502)))

(declare-fun res!984124 () Bool)

(assert (=> b!1453852 (=> (not res!984124) (not e!818502))))

(assert (=> b!1453852 (= res!984124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47545 a!2862) j!93) mask!2687) (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!637443))))

(assert (=> b!1453852 (= lt!637443 (Intermediate!11694 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453853 () Bool)

(assert (=> b!1453853 (= e!818503 e!818505)))

(declare-fun res!984126 () Bool)

(assert (=> b!1453853 (=> (not res!984126) (not e!818505))))

(assert (=> b!1453853 (= res!984126 (= (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453853 (= lt!637445 (array!98522 (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48096 a!2862)))))

(declare-fun b!1453854 () Bool)

(declare-fun res!984130 () Bool)

(assert (=> b!1453854 (=> (not res!984130) (not e!818503))))

(assert (=> b!1453854 (= res!984130 (validKeyInArray!0 (select (arr!47545 a!2862) j!93)))))

(declare-fun b!1453855 () Bool)

(assert (=> b!1453855 (= e!818507 (= lt!637446 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637447 lt!637445 mask!2687)))))

(assert (= (and start!125178 res!984123) b!1453850))

(assert (= (and b!1453850 res!984133) b!1453849))

(assert (= (and b!1453849 res!984127) b!1453854))

(assert (= (and b!1453854 res!984130) b!1453840))

(assert (= (and b!1453840 res!984137) b!1453851))

(assert (= (and b!1453851 res!984134) b!1453839))

(assert (= (and b!1453839 res!984128) b!1453853))

(assert (= (and b!1453853 res!984126) b!1453852))

(assert (= (and b!1453852 res!984124) b!1453841))

(assert (= (and b!1453841 res!984131) b!1453847))

(assert (= (and b!1453847 res!984125) b!1453842))

(assert (= (and b!1453842 c!134377) b!1453855))

(assert (= (and b!1453842 (not c!134377)) b!1453844))

(assert (= (and b!1453842 res!984132) b!1453843))

(assert (= (and b!1453843 res!984136) b!1453846))

(assert (= (and b!1453846 res!984129) b!1453848))

(assert (= (and b!1453848 res!984135) b!1453845))

(declare-fun m!1342525 () Bool)

(assert (=> b!1453853 m!1342525))

(declare-fun m!1342527 () Bool)

(assert (=> b!1453853 m!1342527))

(declare-fun m!1342529 () Bool)

(assert (=> b!1453852 m!1342529))

(assert (=> b!1453852 m!1342529))

(declare-fun m!1342531 () Bool)

(assert (=> b!1453852 m!1342531))

(assert (=> b!1453852 m!1342531))

(assert (=> b!1453852 m!1342529))

(declare-fun m!1342533 () Bool)

(assert (=> b!1453852 m!1342533))

(declare-fun m!1342535 () Bool)

(assert (=> b!1453849 m!1342535))

(assert (=> b!1453849 m!1342535))

(declare-fun m!1342537 () Bool)

(assert (=> b!1453849 m!1342537))

(declare-fun m!1342539 () Bool)

(assert (=> b!1453844 m!1342539))

(declare-fun m!1342541 () Bool)

(assert (=> b!1453844 m!1342541))

(declare-fun m!1342543 () Bool)

(assert (=> b!1453851 m!1342543))

(declare-fun m!1342545 () Bool)

(assert (=> start!125178 m!1342545))

(declare-fun m!1342547 () Bool)

(assert (=> start!125178 m!1342547))

(assert (=> b!1453854 m!1342529))

(assert (=> b!1453854 m!1342529))

(declare-fun m!1342549 () Bool)

(assert (=> b!1453854 m!1342549))

(declare-fun m!1342551 () Bool)

(assert (=> b!1453840 m!1342551))

(declare-fun m!1342553 () Bool)

(assert (=> b!1453855 m!1342553))

(assert (=> b!1453841 m!1342529))

(assert (=> b!1453841 m!1342529))

(declare-fun m!1342555 () Bool)

(assert (=> b!1453841 m!1342555))

(declare-fun m!1342557 () Bool)

(assert (=> b!1453847 m!1342557))

(assert (=> b!1453847 m!1342557))

(declare-fun m!1342559 () Bool)

(assert (=> b!1453847 m!1342559))

(assert (=> b!1453847 m!1342525))

(declare-fun m!1342561 () Bool)

(assert (=> b!1453847 m!1342561))

(assert (=> b!1453848 m!1342529))

(assert (=> b!1453848 m!1342529))

(declare-fun m!1342563 () Bool)

(assert (=> b!1453848 m!1342563))

(declare-fun m!1342565 () Bool)

(assert (=> b!1453846 m!1342565))

(assert (=> b!1453846 m!1342525))

(declare-fun m!1342567 () Bool)

(assert (=> b!1453846 m!1342567))

(declare-fun m!1342569 () Bool)

(assert (=> b!1453846 m!1342569))

(declare-fun m!1342571 () Bool)

(assert (=> b!1453846 m!1342571))

(assert (=> b!1453846 m!1342529))

(assert (=> b!1453845 m!1342525))

(declare-fun m!1342573 () Bool)

(assert (=> b!1453845 m!1342573))

(assert (=> b!1453845 m!1342567))

(assert (=> b!1453845 m!1342569))

(assert (=> b!1453845 m!1342529))

(check-sat (not start!125178) (not b!1453849) (not b!1453855) (not b!1453851) (not b!1453847) (not b!1453841) (not b!1453840) (not b!1453852) (not b!1453848) (not b!1453846) (not b!1453854) (not b!1453844))
(check-sat)
