; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124240 () Bool)

(assert start!124240)

(declare-fun b!1437874 () Bool)

(declare-fun res!970666 () Bool)

(declare-fun e!811162 () Bool)

(assert (=> b!1437874 (=> (not res!970666) (not e!811162))))

(declare-datatypes ((array!97744 0))(
  ( (array!97745 (arr!47164 (Array (_ BitVec 32) (_ BitVec 64))) (size!47716 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97744)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437874 (= res!970666 (validKeyInArray!0 (select (arr!47164 a!2862) i!1006)))))

(declare-fun b!1437875 () Bool)

(declare-fun e!811163 () Bool)

(assert (=> b!1437875 (= e!811163 false)))

(declare-fun lt!632253 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437875 (= lt!632253 (toIndex!0 (select (store (arr!47164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437876 () Bool)

(assert (=> b!1437876 (= e!811162 e!811163)))

(declare-fun res!970671 () Bool)

(assert (=> b!1437876 (=> (not res!970671) (not e!811163))))

(declare-datatypes ((SeekEntryResult!11441 0))(
  ( (MissingZero!11441 (index!48156 (_ BitVec 32))) (Found!11441 (index!48157 (_ BitVec 32))) (Intermediate!11441 (undefined!12253 Bool) (index!48158 (_ BitVec 32)) (x!129889 (_ BitVec 32))) (Undefined!11441) (MissingVacant!11441 (index!48159 (_ BitVec 32))) )
))
(declare-fun lt!632252 () SeekEntryResult!11441)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97744 (_ BitVec 32)) SeekEntryResult!11441)

(assert (=> b!1437876 (= res!970671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47164 a!2862) j!93) mask!2687) (select (arr!47164 a!2862) j!93) a!2862 mask!2687) lt!632252))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437876 (= lt!632252 (Intermediate!11441 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437877 () Bool)

(declare-fun res!970665 () Bool)

(assert (=> b!1437877 (=> (not res!970665) (not e!811162))))

(assert (=> b!1437877 (= res!970665 (validKeyInArray!0 (select (arr!47164 a!2862) j!93)))))

(declare-fun b!1437878 () Bool)

(declare-fun res!970667 () Bool)

(assert (=> b!1437878 (=> (not res!970667) (not e!811162))))

(declare-datatypes ((List!33743 0))(
  ( (Nil!33740) (Cons!33739 (h!35083 (_ BitVec 64)) (t!48429 List!33743)) )
))
(declare-fun arrayNoDuplicates!0 (array!97744 (_ BitVec 32) List!33743) Bool)

(assert (=> b!1437878 (= res!970667 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33740))))

(declare-fun b!1437879 () Bool)

(declare-fun res!970668 () Bool)

(assert (=> b!1437879 (=> (not res!970668) (not e!811162))))

(assert (=> b!1437879 (= res!970668 (and (= (size!47716 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47716 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47716 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437880 () Bool)

(declare-fun res!970672 () Bool)

(assert (=> b!1437880 (=> (not res!970672) (not e!811162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97744 (_ BitVec 32)) Bool)

(assert (=> b!1437880 (= res!970672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437881 () Bool)

(declare-fun res!970664 () Bool)

(assert (=> b!1437881 (=> (not res!970664) (not e!811162))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437881 (= res!970664 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47716 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47716 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47716 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970670 () Bool)

(assert (=> start!124240 (=> (not res!970670) (not e!811162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124240 (= res!970670 (validMask!0 mask!2687))))

(assert (=> start!124240 e!811162))

(assert (=> start!124240 true))

(declare-fun array_inv!36397 (array!97744) Bool)

(assert (=> start!124240 (array_inv!36397 a!2862)))

(declare-fun b!1437882 () Bool)

(declare-fun res!970669 () Bool)

(assert (=> b!1437882 (=> (not res!970669) (not e!811163))))

(assert (=> b!1437882 (= res!970669 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47164 a!2862) j!93) a!2862 mask!2687) lt!632252))))

(assert (= (and start!124240 res!970670) b!1437879))

(assert (= (and b!1437879 res!970668) b!1437874))

(assert (= (and b!1437874 res!970666) b!1437877))

(assert (= (and b!1437877 res!970665) b!1437880))

(assert (= (and b!1437880 res!970672) b!1437878))

(assert (= (and b!1437878 res!970667) b!1437881))

(assert (= (and b!1437881 res!970664) b!1437876))

(assert (= (and b!1437876 res!970671) b!1437882))

(assert (= (and b!1437882 res!970669) b!1437875))

(declare-fun m!1326561 () Bool)

(assert (=> b!1437874 m!1326561))

(assert (=> b!1437874 m!1326561))

(declare-fun m!1326563 () Bool)

(assert (=> b!1437874 m!1326563))

(declare-fun m!1326565 () Bool)

(assert (=> b!1437880 m!1326565))

(declare-fun m!1326567 () Bool)

(assert (=> b!1437881 m!1326567))

(declare-fun m!1326569 () Bool)

(assert (=> b!1437881 m!1326569))

(declare-fun m!1326571 () Bool)

(assert (=> b!1437876 m!1326571))

(assert (=> b!1437876 m!1326571))

(declare-fun m!1326573 () Bool)

(assert (=> b!1437876 m!1326573))

(assert (=> b!1437876 m!1326573))

(assert (=> b!1437876 m!1326571))

(declare-fun m!1326575 () Bool)

(assert (=> b!1437876 m!1326575))

(assert (=> b!1437882 m!1326571))

(assert (=> b!1437882 m!1326571))

(declare-fun m!1326577 () Bool)

(assert (=> b!1437882 m!1326577))

(assert (=> b!1437877 m!1326571))

(assert (=> b!1437877 m!1326571))

(declare-fun m!1326579 () Bool)

(assert (=> b!1437877 m!1326579))

(assert (=> b!1437875 m!1326567))

(declare-fun m!1326581 () Bool)

(assert (=> b!1437875 m!1326581))

(assert (=> b!1437875 m!1326581))

(declare-fun m!1326583 () Bool)

(assert (=> b!1437875 m!1326583))

(declare-fun m!1326585 () Bool)

(assert (=> start!124240 m!1326585))

(declare-fun m!1326587 () Bool)

(assert (=> start!124240 m!1326587))

(declare-fun m!1326589 () Bool)

(assert (=> b!1437878 m!1326589))

(check-sat (not start!124240) (not b!1437876) (not b!1437882) (not b!1437878) (not b!1437877) (not b!1437874) (not b!1437880) (not b!1437875))
(check-sat)
