; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124554 () Bool)

(assert start!124554)

(declare-fun b!1439963 () Bool)

(declare-fun res!971689 () Bool)

(declare-fun e!812371 () Bool)

(assert (=> b!1439963 (=> (not res!971689) (not e!812371))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97936 0))(
  ( (array!97937 (arr!47254 (Array (_ BitVec 32) (_ BitVec 64))) (size!47805 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97936)

(assert (=> b!1439963 (= res!971689 (and (= (size!47805 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47805 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47805 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439964 () Bool)

(declare-fun res!971694 () Bool)

(assert (=> b!1439964 (=> (not res!971694) (not e!812371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97936 (_ BitVec 32)) Bool)

(assert (=> b!1439964 (= res!971694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439965 () Bool)

(declare-fun res!971691 () Bool)

(assert (=> b!1439965 (=> (not res!971691) (not e!812371))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1439965 (= res!971691 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47805 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47805 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47805 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439966 () Bool)

(declare-fun res!971693 () Bool)

(assert (=> b!1439966 (=> (not res!971693) (not e!812371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439966 (= res!971693 (validKeyInArray!0 (select (arr!47254 a!2862) i!1006)))))

(declare-fun b!1439967 () Bool)

(declare-fun res!971688 () Bool)

(declare-fun e!812373 () Bool)

(assert (=> b!1439967 (=> (not res!971688) (not e!812373))))

(declare-datatypes ((SeekEntryResult!11403 0))(
  ( (MissingZero!11403 (index!48004 (_ BitVec 32))) (Found!11403 (index!48005 (_ BitVec 32))) (Intermediate!11403 (undefined!12215 Bool) (index!48006 (_ BitVec 32)) (x!129918 (_ BitVec 32))) (Undefined!11403) (MissingVacant!11403 (index!48007 (_ BitVec 32))) )
))
(declare-fun lt!633100 () SeekEntryResult!11403)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97936 (_ BitVec 32)) SeekEntryResult!11403)

(assert (=> b!1439967 (= res!971688 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47254 a!2862) j!93) a!2862 mask!2687) lt!633100))))

(declare-fun b!1439968 () Bool)

(assert (=> b!1439968 (= e!812371 e!812373)))

(declare-fun res!971695 () Bool)

(assert (=> b!1439968 (=> (not res!971695) (not e!812373))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439968 (= res!971695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47254 a!2862) j!93) mask!2687) (select (arr!47254 a!2862) j!93) a!2862 mask!2687) lt!633100))))

(assert (=> b!1439968 (= lt!633100 (Intermediate!11403 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439969 () Bool)

(assert (=> b!1439969 (= e!812373 false)))

(declare-fun lt!633099 () SeekEntryResult!11403)

(assert (=> b!1439969 (= lt!633099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97937 (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47805 a!2862)) mask!2687))))

(declare-fun b!1439970 () Bool)

(declare-fun res!971696 () Bool)

(assert (=> b!1439970 (=> (not res!971696) (not e!812371))))

(assert (=> b!1439970 (= res!971696 (validKeyInArray!0 (select (arr!47254 a!2862) j!93)))))

(declare-fun b!1439971 () Bool)

(declare-fun res!971692 () Bool)

(assert (=> b!1439971 (=> (not res!971692) (not e!812371))))

(declare-datatypes ((List!33742 0))(
  ( (Nil!33739) (Cons!33738 (h!35096 (_ BitVec 64)) (t!48428 List!33742)) )
))
(declare-fun arrayNoDuplicates!0 (array!97936 (_ BitVec 32) List!33742) Bool)

(assert (=> b!1439971 (= res!971692 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33739))))

(declare-fun res!971690 () Bool)

(assert (=> start!124554 (=> (not res!971690) (not e!812371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124554 (= res!971690 (validMask!0 mask!2687))))

(assert (=> start!124554 e!812371))

(assert (=> start!124554 true))

(declare-fun array_inv!36535 (array!97936) Bool)

(assert (=> start!124554 (array_inv!36535 a!2862)))

(assert (= (and start!124554 res!971690) b!1439963))

(assert (= (and b!1439963 res!971689) b!1439966))

(assert (= (and b!1439966 res!971693) b!1439970))

(assert (= (and b!1439970 res!971696) b!1439964))

(assert (= (and b!1439964 res!971694) b!1439971))

(assert (= (and b!1439971 res!971692) b!1439965))

(assert (= (and b!1439965 res!971691) b!1439968))

(assert (= (and b!1439968 res!971695) b!1439967))

(assert (= (and b!1439967 res!971688) b!1439969))

(declare-fun m!1329175 () Bool)

(assert (=> b!1439968 m!1329175))

(assert (=> b!1439968 m!1329175))

(declare-fun m!1329177 () Bool)

(assert (=> b!1439968 m!1329177))

(assert (=> b!1439968 m!1329177))

(assert (=> b!1439968 m!1329175))

(declare-fun m!1329179 () Bool)

(assert (=> b!1439968 m!1329179))

(assert (=> b!1439967 m!1329175))

(assert (=> b!1439967 m!1329175))

(declare-fun m!1329181 () Bool)

(assert (=> b!1439967 m!1329181))

(declare-fun m!1329183 () Bool)

(assert (=> b!1439964 m!1329183))

(declare-fun m!1329185 () Bool)

(assert (=> b!1439966 m!1329185))

(assert (=> b!1439966 m!1329185))

(declare-fun m!1329187 () Bool)

(assert (=> b!1439966 m!1329187))

(declare-fun m!1329189 () Bool)

(assert (=> b!1439971 m!1329189))

(declare-fun m!1329191 () Bool)

(assert (=> start!124554 m!1329191))

(declare-fun m!1329193 () Bool)

(assert (=> start!124554 m!1329193))

(assert (=> b!1439970 m!1329175))

(assert (=> b!1439970 m!1329175))

(declare-fun m!1329195 () Bool)

(assert (=> b!1439970 m!1329195))

(declare-fun m!1329197 () Bool)

(assert (=> b!1439965 m!1329197))

(declare-fun m!1329199 () Bool)

(assert (=> b!1439965 m!1329199))

(assert (=> b!1439969 m!1329197))

(declare-fun m!1329201 () Bool)

(assert (=> b!1439969 m!1329201))

(assert (=> b!1439969 m!1329201))

(declare-fun m!1329203 () Bool)

(assert (=> b!1439969 m!1329203))

(assert (=> b!1439969 m!1329203))

(assert (=> b!1439969 m!1329201))

(declare-fun m!1329205 () Bool)

(assert (=> b!1439969 m!1329205))

(check-sat (not b!1439966) (not b!1439970) (not start!124554) (not b!1439971) (not b!1439969) (not b!1439968) (not b!1439964) (not b!1439967))
(check-sat)
