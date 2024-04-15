; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126148 () Bool)

(assert start!126148)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1477591 () Bool)

(declare-fun e!828902 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1477591 (= e!828902 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477592 () Bool)

(declare-fun res!1003807 () Bool)

(declare-fun e!828903 () Bool)

(assert (=> b!1477592 (=> (not res!1003807) (not e!828903))))

(declare-datatypes ((array!99232 0))(
  ( (array!99233 (arr!47896 (Array (_ BitVec 32) (_ BitVec 64))) (size!48448 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99232)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99232 (_ BitVec 32)) Bool)

(assert (=> b!1477592 (= res!1003807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1003801 () Bool)

(assert (=> start!126148 (=> (not res!1003801) (not e!828903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126148 (= res!1003801 (validMask!0 mask!2687))))

(assert (=> start!126148 e!828903))

(assert (=> start!126148 true))

(declare-fun array_inv!37129 (array!99232) Bool)

(assert (=> start!126148 (array_inv!37129 a!2862)))

(declare-fun b!1477593 () Bool)

(declare-fun res!1003799 () Bool)

(assert (=> b!1477593 (=> (not res!1003799) (not e!828903))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477593 (= res!1003799 (validKeyInArray!0 (select (arr!47896 a!2862) i!1006)))))

(declare-fun b!1477594 () Bool)

(declare-fun res!1003798 () Bool)

(assert (=> b!1477594 (=> (not res!1003798) (not e!828903))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477594 (= res!1003798 (validKeyInArray!0 (select (arr!47896 a!2862) j!93)))))

(declare-fun b!1477595 () Bool)

(declare-fun res!1003808 () Bool)

(assert (=> b!1477595 (=> (not res!1003808) (not e!828903))))

(assert (=> b!1477595 (= res!1003808 (and (= (size!48448 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48448 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48448 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477596 () Bool)

(declare-fun res!1003797 () Bool)

(assert (=> b!1477596 (=> (not res!1003797) (not e!828903))))

(declare-datatypes ((List!34475 0))(
  ( (Nil!34472) (Cons!34471 (h!35839 (_ BitVec 64)) (t!49161 List!34475)) )
))
(declare-fun arrayNoDuplicates!0 (array!99232 (_ BitVec 32) List!34475) Bool)

(assert (=> b!1477596 (= res!1003797 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34472))))

(declare-fun b!1477597 () Bool)

(declare-fun e!828908 () Bool)

(declare-fun e!828904 () Bool)

(assert (=> b!1477597 (= e!828908 e!828904)))

(declare-fun res!1003800 () Bool)

(assert (=> b!1477597 (=> (not res!1003800) (not e!828904))))

(declare-datatypes ((SeekEntryResult!12161 0))(
  ( (MissingZero!12161 (index!51036 (_ BitVec 32))) (Found!12161 (index!51037 (_ BitVec 32))) (Intermediate!12161 (undefined!12973 Bool) (index!51038 (_ BitVec 32)) (x!132627 (_ BitVec 32))) (Undefined!12161) (MissingVacant!12161 (index!51039 (_ BitVec 32))) )
))
(declare-fun lt!645232 () SeekEntryResult!12161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477597 (= res!1003800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47896 a!2862) j!93) mask!2687) (select (arr!47896 a!2862) j!93) a!2862 mask!2687) lt!645232))))

(assert (=> b!1477597 (= lt!645232 (Intermediate!12161 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477598 () Bool)

(assert (=> b!1477598 (= e!828903 e!828908)))

(declare-fun res!1003803 () Bool)

(assert (=> b!1477598 (=> (not res!1003803) (not e!828908))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477598 (= res!1003803 (= (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645229 () array!99232)

(assert (=> b!1477598 (= lt!645229 (array!99233 (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48448 a!2862)))))

(declare-fun b!1477599 () Bool)

(declare-fun res!1003810 () Bool)

(declare-fun e!828906 () Bool)

(assert (=> b!1477599 (=> (not res!1003810) (not e!828906))))

(declare-fun e!828905 () Bool)

(assert (=> b!1477599 (= res!1003810 e!828905)))

(declare-fun c!136420 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477599 (= c!136420 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477600 () Bool)

(declare-fun e!828909 () Bool)

(assert (=> b!1477600 (= e!828909 e!828902)))

(declare-fun res!1003796 () Bool)

(assert (=> b!1477600 (=> (not res!1003796) (not e!828902))))

(declare-fun lt!645231 () SeekEntryResult!12161)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12161)

(assert (=> b!1477600 (= res!1003796 (= lt!645231 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47896 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477601 () Bool)

(declare-fun res!1003805 () Bool)

(assert (=> b!1477601 (=> (not res!1003805) (not e!828906))))

(assert (=> b!1477601 (= res!1003805 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477602 () Bool)

(declare-fun res!1003802 () Bool)

(assert (=> b!1477602 (=> (not res!1003802) (not e!828903))))

(assert (=> b!1477602 (= res!1003802 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48448 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48448 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48448 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477603 () Bool)

(declare-fun lt!645234 () SeekEntryResult!12161)

(declare-fun lt!645230 () (_ BitVec 64))

(assert (=> b!1477603 (= e!828905 (= lt!645234 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645230 lt!645229 mask!2687)))))

(declare-fun b!1477604 () Bool)

(declare-fun res!1003806 () Bool)

(assert (=> b!1477604 (=> (not res!1003806) (not e!828904))))

(assert (=> b!1477604 (= res!1003806 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47896 a!2862) j!93) a!2862 mask!2687) lt!645232))))

(declare-fun b!1477605 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12161)

(assert (=> b!1477605 (= e!828905 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645230 lt!645229 mask!2687) (seekEntryOrOpen!0 lt!645230 lt!645229 mask!2687)))))

(declare-fun b!1477606 () Bool)

(assert (=> b!1477606 (= e!828906 (not true))))

(declare-fun e!828907 () Bool)

(assert (=> b!1477606 e!828907))

(declare-fun res!1003795 () Bool)

(assert (=> b!1477606 (=> (not res!1003795) (not e!828907))))

(assert (=> b!1477606 (= res!1003795 (and (= lt!645231 (Found!12161 j!93)) (or (= (select (arr!47896 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47896 a!2862) intermediateBeforeIndex!19) (select (arr!47896 a!2862) j!93)))))))

(assert (=> b!1477606 (= lt!645231 (seekEntryOrOpen!0 (select (arr!47896 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477606 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49503 0))(
  ( (Unit!49504) )
))
(declare-fun lt!645233 () Unit!49503)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49503)

(assert (=> b!1477606 (= lt!645233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477607 () Bool)

(assert (=> b!1477607 (= e!828907 e!828909)))

(declare-fun res!1003809 () Bool)

(assert (=> b!1477607 (=> res!1003809 e!828909)))

(assert (=> b!1477607 (= res!1003809 (or (and (= (select (arr!47896 a!2862) index!646) (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47896 a!2862) index!646) (select (arr!47896 a!2862) j!93))) (not (= (select (arr!47896 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477608 () Bool)

(assert (=> b!1477608 (= e!828904 e!828906)))

(declare-fun res!1003804 () Bool)

(assert (=> b!1477608 (=> (not res!1003804) (not e!828906))))

(assert (=> b!1477608 (= res!1003804 (= lt!645234 (Intermediate!12161 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477608 (= lt!645234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645230 mask!2687) lt!645230 lt!645229 mask!2687))))

(assert (=> b!1477608 (= lt!645230 (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126148 res!1003801) b!1477595))

(assert (= (and b!1477595 res!1003808) b!1477593))

(assert (= (and b!1477593 res!1003799) b!1477594))

(assert (= (and b!1477594 res!1003798) b!1477592))

(assert (= (and b!1477592 res!1003807) b!1477596))

(assert (= (and b!1477596 res!1003797) b!1477602))

(assert (= (and b!1477602 res!1003802) b!1477598))

(assert (= (and b!1477598 res!1003803) b!1477597))

(assert (= (and b!1477597 res!1003800) b!1477604))

(assert (= (and b!1477604 res!1003806) b!1477608))

(assert (= (and b!1477608 res!1003804) b!1477599))

(assert (= (and b!1477599 c!136420) b!1477603))

(assert (= (and b!1477599 (not c!136420)) b!1477605))

(assert (= (and b!1477599 res!1003810) b!1477601))

(assert (= (and b!1477601 res!1003805) b!1477606))

(assert (= (and b!1477606 res!1003795) b!1477607))

(assert (= (and b!1477607 (not res!1003809)) b!1477600))

(assert (= (and b!1477600 res!1003796) b!1477591))

(declare-fun m!1363047 () Bool)

(assert (=> b!1477604 m!1363047))

(assert (=> b!1477604 m!1363047))

(declare-fun m!1363049 () Bool)

(assert (=> b!1477604 m!1363049))

(declare-fun m!1363051 () Bool)

(assert (=> b!1477593 m!1363051))

(assert (=> b!1477593 m!1363051))

(declare-fun m!1363053 () Bool)

(assert (=> b!1477593 m!1363053))

(declare-fun m!1363055 () Bool)

(assert (=> b!1477603 m!1363055))

(declare-fun m!1363057 () Bool)

(assert (=> start!126148 m!1363057))

(declare-fun m!1363059 () Bool)

(assert (=> start!126148 m!1363059))

(declare-fun m!1363061 () Bool)

(assert (=> b!1477596 m!1363061))

(assert (=> b!1477600 m!1363047))

(assert (=> b!1477600 m!1363047))

(declare-fun m!1363063 () Bool)

(assert (=> b!1477600 m!1363063))

(declare-fun m!1363065 () Bool)

(assert (=> b!1477607 m!1363065))

(declare-fun m!1363067 () Bool)

(assert (=> b!1477607 m!1363067))

(declare-fun m!1363069 () Bool)

(assert (=> b!1477607 m!1363069))

(assert (=> b!1477607 m!1363047))

(declare-fun m!1363071 () Bool)

(assert (=> b!1477608 m!1363071))

(assert (=> b!1477608 m!1363071))

(declare-fun m!1363073 () Bool)

(assert (=> b!1477608 m!1363073))

(assert (=> b!1477608 m!1363067))

(declare-fun m!1363075 () Bool)

(assert (=> b!1477608 m!1363075))

(assert (=> b!1477598 m!1363067))

(declare-fun m!1363077 () Bool)

(assert (=> b!1477598 m!1363077))

(assert (=> b!1477597 m!1363047))

(assert (=> b!1477597 m!1363047))

(declare-fun m!1363079 () Bool)

(assert (=> b!1477597 m!1363079))

(assert (=> b!1477597 m!1363079))

(assert (=> b!1477597 m!1363047))

(declare-fun m!1363081 () Bool)

(assert (=> b!1477597 m!1363081))

(declare-fun m!1363083 () Bool)

(assert (=> b!1477606 m!1363083))

(declare-fun m!1363085 () Bool)

(assert (=> b!1477606 m!1363085))

(assert (=> b!1477606 m!1363047))

(declare-fun m!1363087 () Bool)

(assert (=> b!1477606 m!1363087))

(declare-fun m!1363089 () Bool)

(assert (=> b!1477606 m!1363089))

(assert (=> b!1477606 m!1363047))

(declare-fun m!1363091 () Bool)

(assert (=> b!1477592 m!1363091))

(assert (=> b!1477594 m!1363047))

(assert (=> b!1477594 m!1363047))

(declare-fun m!1363093 () Bool)

(assert (=> b!1477594 m!1363093))

(declare-fun m!1363095 () Bool)

(assert (=> b!1477605 m!1363095))

(declare-fun m!1363097 () Bool)

(assert (=> b!1477605 m!1363097))

(check-sat (not b!1477596) (not b!1477605) (not b!1477592) (not b!1477594) (not b!1477606) (not b!1477603) (not start!126148) (not b!1477597) (not b!1477608) (not b!1477604) (not b!1477600) (not b!1477593))
(check-sat)
