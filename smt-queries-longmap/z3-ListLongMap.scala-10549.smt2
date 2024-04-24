; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124650 () Bool)

(assert start!124650)

(declare-fun b!1440955 () Bool)

(declare-fun res!972565 () Bool)

(declare-fun e!812771 () Bool)

(assert (=> b!1440955 (=> (not res!972565) (not e!812771))))

(declare-datatypes ((array!97993 0))(
  ( (array!97994 (arr!47281 (Array (_ BitVec 32) (_ BitVec 64))) (size!47832 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97993)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440955 (= res!972565 (validKeyInArray!0 (select (arr!47281 a!2862) j!93)))))

(declare-fun b!1440956 () Bool)

(declare-fun res!972564 () Bool)

(assert (=> b!1440956 (=> (not res!972564) (not e!812771))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440956 (= res!972564 (validKeyInArray!0 (select (arr!47281 a!2862) i!1006)))))

(declare-fun b!1440957 () Bool)

(declare-fun res!972560 () Bool)

(declare-fun e!812772 () Bool)

(assert (=> b!1440957 (=> (not res!972560) (not e!812772))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11430 0))(
  ( (MissingZero!11430 (index!48112 (_ BitVec 32))) (Found!11430 (index!48113 (_ BitVec 32))) (Intermediate!11430 (undefined!12242 Bool) (index!48114 (_ BitVec 32)) (x!130023 (_ BitVec 32))) (Undefined!11430) (MissingVacant!11430 (index!48115 (_ BitVec 32))) )
))
(declare-fun lt!633322 () SeekEntryResult!11430)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97993 (_ BitVec 32)) SeekEntryResult!11430)

(assert (=> b!1440957 (= res!972560 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47281 a!2862) j!93) a!2862 mask!2687) lt!633322))))

(declare-fun b!1440958 () Bool)

(assert (=> b!1440958 (= e!812771 e!812772)))

(declare-fun res!972563 () Bool)

(assert (=> b!1440958 (=> (not res!972563) (not e!812772))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440958 (= res!972563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47281 a!2862) j!93) mask!2687) (select (arr!47281 a!2862) j!93) a!2862 mask!2687) lt!633322))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440958 (= lt!633322 (Intermediate!11430 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440959 () Bool)

(declare-fun res!972561 () Bool)

(assert (=> b!1440959 (=> (not res!972561) (not e!812771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97993 (_ BitVec 32)) Bool)

(assert (=> b!1440959 (= res!972561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440960 () Bool)

(declare-fun res!972562 () Bool)

(assert (=> b!1440960 (=> (not res!972562) (not e!812771))))

(declare-datatypes ((List!33769 0))(
  ( (Nil!33766) (Cons!33765 (h!35126 (_ BitVec 64)) (t!48455 List!33769)) )
))
(declare-fun arrayNoDuplicates!0 (array!97993 (_ BitVec 32) List!33769) Bool)

(assert (=> b!1440960 (= res!972562 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33766))))

(declare-fun b!1440961 () Bool)

(declare-fun res!972557 () Bool)

(assert (=> b!1440961 (=> (not res!972557) (not e!812771))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440961 (= res!972557 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47832 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47832 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47832 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972558 () Bool)

(assert (=> start!124650 (=> (not res!972558) (not e!812771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124650 (= res!972558 (validMask!0 mask!2687))))

(assert (=> start!124650 e!812771))

(assert (=> start!124650 true))

(declare-fun array_inv!36562 (array!97993) Bool)

(assert (=> start!124650 (array_inv!36562 a!2862)))

(declare-fun b!1440962 () Bool)

(assert (=> b!1440962 (= e!812772 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440963 () Bool)

(declare-fun res!972566 () Bool)

(assert (=> b!1440963 (=> (not res!972566) (not e!812772))))

(assert (=> b!1440963 (= res!972566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97994 (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47832 a!2862)) mask!2687) (Intermediate!11430 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440964 () Bool)

(declare-fun res!972559 () Bool)

(assert (=> b!1440964 (=> (not res!972559) (not e!812771))))

(assert (=> b!1440964 (= res!972559 (and (= (size!47832 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47832 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47832 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124650 res!972558) b!1440964))

(assert (= (and b!1440964 res!972559) b!1440956))

(assert (= (and b!1440956 res!972564) b!1440955))

(assert (= (and b!1440955 res!972565) b!1440959))

(assert (= (and b!1440959 res!972561) b!1440960))

(assert (= (and b!1440960 res!972562) b!1440961))

(assert (= (and b!1440961 res!972557) b!1440958))

(assert (= (and b!1440958 res!972563) b!1440957))

(assert (= (and b!1440957 res!972560) b!1440963))

(assert (= (and b!1440963 res!972566) b!1440962))

(declare-fun m!1330165 () Bool)

(assert (=> b!1440959 m!1330165))

(declare-fun m!1330167 () Bool)

(assert (=> b!1440963 m!1330167))

(declare-fun m!1330169 () Bool)

(assert (=> b!1440963 m!1330169))

(assert (=> b!1440963 m!1330169))

(declare-fun m!1330171 () Bool)

(assert (=> b!1440963 m!1330171))

(assert (=> b!1440963 m!1330171))

(assert (=> b!1440963 m!1330169))

(declare-fun m!1330173 () Bool)

(assert (=> b!1440963 m!1330173))

(declare-fun m!1330175 () Bool)

(assert (=> b!1440958 m!1330175))

(assert (=> b!1440958 m!1330175))

(declare-fun m!1330177 () Bool)

(assert (=> b!1440958 m!1330177))

(assert (=> b!1440958 m!1330177))

(assert (=> b!1440958 m!1330175))

(declare-fun m!1330179 () Bool)

(assert (=> b!1440958 m!1330179))

(declare-fun m!1330181 () Bool)

(assert (=> b!1440956 m!1330181))

(assert (=> b!1440956 m!1330181))

(declare-fun m!1330183 () Bool)

(assert (=> b!1440956 m!1330183))

(declare-fun m!1330185 () Bool)

(assert (=> start!124650 m!1330185))

(declare-fun m!1330187 () Bool)

(assert (=> start!124650 m!1330187))

(assert (=> b!1440955 m!1330175))

(assert (=> b!1440955 m!1330175))

(declare-fun m!1330189 () Bool)

(assert (=> b!1440955 m!1330189))

(declare-fun m!1330191 () Bool)

(assert (=> b!1440960 m!1330191))

(assert (=> b!1440961 m!1330167))

(declare-fun m!1330193 () Bool)

(assert (=> b!1440961 m!1330193))

(assert (=> b!1440957 m!1330175))

(assert (=> b!1440957 m!1330175))

(declare-fun m!1330195 () Bool)

(assert (=> b!1440957 m!1330195))

(check-sat (not b!1440958) (not b!1440955) (not b!1440956) (not b!1440957) (not b!1440959) (not b!1440960) (not b!1440963) (not start!124650))
(check-sat)
