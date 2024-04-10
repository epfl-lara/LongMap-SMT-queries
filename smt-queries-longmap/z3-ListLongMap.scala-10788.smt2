; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126228 () Bool)

(assert start!126228)

(declare-fun b!1479136 () Bool)

(declare-fun e!829696 () Bool)

(declare-fun e!829693 () Bool)

(assert (=> b!1479136 (= e!829696 e!829693)))

(declare-fun res!1005080 () Bool)

(assert (=> b!1479136 (=> (not res!1005080) (not e!829693))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99334 0))(
  ( (array!99335 (arr!47946 (Array (_ BitVec 32) (_ BitVec 64))) (size!48496 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99334)

(assert (=> b!1479136 (= res!1005080 (= (select (store (arr!47946 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645917 () array!99334)

(assert (=> b!1479136 (= lt!645917 (array!99335 (store (arr!47946 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48496 a!2862)))))

(declare-fun b!1479137 () Bool)

(declare-fun e!829699 () Bool)

(declare-fun e!829698 () Bool)

(assert (=> b!1479137 (= e!829699 e!829698)))

(declare-fun res!1005074 () Bool)

(assert (=> b!1479137 (=> (not res!1005074) (not e!829698))))

(declare-datatypes ((SeekEntryResult!12186 0))(
  ( (MissingZero!12186 (index!51136 (_ BitVec 32))) (Found!12186 (index!51137 (_ BitVec 32))) (Intermediate!12186 (undefined!12998 Bool) (index!51138 (_ BitVec 32)) (x!132721 (_ BitVec 32))) (Undefined!12186) (MissingVacant!12186 (index!51139 (_ BitVec 32))) )
))
(declare-fun lt!645915 () SeekEntryResult!12186)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479137 (= res!1005074 (= lt!645915 (Intermediate!12186 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645913 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99334 (_ BitVec 32)) SeekEntryResult!12186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479137 (= lt!645915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645913 mask!2687) lt!645913 lt!645917 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479137 (= lt!645913 (select (store (arr!47946 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479138 () Bool)

(declare-fun e!829697 () Bool)

(declare-fun e!829700 () Bool)

(assert (=> b!1479138 (= e!829697 e!829700)))

(declare-fun res!1005084 () Bool)

(assert (=> b!1479138 (=> res!1005084 e!829700)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479138 (= res!1005084 (or (and (= (select (arr!47946 a!2862) index!646) (select (store (arr!47946 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47946 a!2862) index!646) (select (arr!47946 a!2862) j!93))) (not (= (select (arr!47946 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479139 () Bool)

(declare-fun res!1005085 () Bool)

(assert (=> b!1479139 (=> (not res!1005085) (not e!829696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479139 (= res!1005085 (validKeyInArray!0 (select (arr!47946 a!2862) i!1006)))))

(declare-fun b!1479140 () Bool)

(declare-fun res!1005077 () Bool)

(assert (=> b!1479140 (=> (not res!1005077) (not e!829699))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!645916 () SeekEntryResult!12186)

(assert (=> b!1479140 (= res!1005077 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47946 a!2862) j!93) a!2862 mask!2687) lt!645916))))

(declare-fun b!1479141 () Bool)

(declare-fun res!1005075 () Bool)

(assert (=> b!1479141 (=> (not res!1005075) (not e!829696))))

(assert (=> b!1479141 (= res!1005075 (validKeyInArray!0 (select (arr!47946 a!2862) j!93)))))

(declare-fun b!1479142 () Bool)

(declare-fun e!829694 () Bool)

(assert (=> b!1479142 (= e!829700 e!829694)))

(declare-fun res!1005088 () Bool)

(assert (=> b!1479142 (=> (not res!1005088) (not e!829694))))

(declare-fun lt!645918 () SeekEntryResult!12186)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99334 (_ BitVec 32)) SeekEntryResult!12186)

(assert (=> b!1479142 (= res!1005088 (= lt!645918 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47946 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479143 () Bool)

(declare-fun res!1005073 () Bool)

(assert (=> b!1479143 (=> (not res!1005073) (not e!829696))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479143 (= res!1005073 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48496 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48496 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48496 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479144 () Bool)

(declare-fun res!1005081 () Bool)

(assert (=> b!1479144 (=> (not res!1005081) (not e!829696))))

(assert (=> b!1479144 (= res!1005081 (and (= (size!48496 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48496 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48496 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479145 () Bool)

(assert (=> b!1479145 (= e!829694 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!1005079 () Bool)

(assert (=> start!126228 (=> (not res!1005079) (not e!829696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126228 (= res!1005079 (validMask!0 mask!2687))))

(assert (=> start!126228 e!829696))

(assert (=> start!126228 true))

(declare-fun array_inv!36974 (array!99334) Bool)

(assert (=> start!126228 (array_inv!36974 a!2862)))

(declare-fun b!1479146 () Bool)

(assert (=> b!1479146 (= e!829693 e!829699)))

(declare-fun res!1005086 () Bool)

(assert (=> b!1479146 (=> (not res!1005086) (not e!829699))))

(assert (=> b!1479146 (= res!1005086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47946 a!2862) j!93) mask!2687) (select (arr!47946 a!2862) j!93) a!2862 mask!2687) lt!645916))))

(assert (=> b!1479146 (= lt!645916 (Intermediate!12186 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479147 () Bool)

(declare-fun res!1005083 () Bool)

(assert (=> b!1479147 (=> (not res!1005083) (not e!829696))))

(declare-datatypes ((List!34447 0))(
  ( (Nil!34444) (Cons!34443 (h!35811 (_ BitVec 64)) (t!49141 List!34447)) )
))
(declare-fun arrayNoDuplicates!0 (array!99334 (_ BitVec 32) List!34447) Bool)

(assert (=> b!1479147 (= res!1005083 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34444))))

(declare-fun b!1479148 () Bool)

(declare-fun res!1005078 () Bool)

(assert (=> b!1479148 (=> (not res!1005078) (not e!829698))))

(declare-fun e!829692 () Bool)

(assert (=> b!1479148 (= res!1005078 e!829692)))

(declare-fun c!136551 () Bool)

(assert (=> b!1479148 (= c!136551 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479149 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99334 (_ BitVec 32)) SeekEntryResult!12186)

(assert (=> b!1479149 (= e!829692 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645913 lt!645917 mask!2687) (seekEntryOrOpen!0 lt!645913 lt!645917 mask!2687)))))

(declare-fun b!1479150 () Bool)

(declare-fun res!1005087 () Bool)

(assert (=> b!1479150 (=> (not res!1005087) (not e!829698))))

(assert (=> b!1479150 (= res!1005087 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479151 () Bool)

(declare-fun res!1005076 () Bool)

(assert (=> b!1479151 (=> (not res!1005076) (not e!829696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99334 (_ BitVec 32)) Bool)

(assert (=> b!1479151 (= res!1005076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479152 () Bool)

(assert (=> b!1479152 (= e!829692 (= lt!645915 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645913 lt!645917 mask!2687)))))

(declare-fun b!1479153 () Bool)

(assert (=> b!1479153 (= e!829698 (not true))))

(assert (=> b!1479153 e!829697))

(declare-fun res!1005082 () Bool)

(assert (=> b!1479153 (=> (not res!1005082) (not e!829697))))

(assert (=> b!1479153 (= res!1005082 (and (= lt!645918 (Found!12186 j!93)) (or (= (select (arr!47946 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47946 a!2862) intermediateBeforeIndex!19) (select (arr!47946 a!2862) j!93)))))))

(assert (=> b!1479153 (= lt!645918 (seekEntryOrOpen!0 (select (arr!47946 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479153 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49712 0))(
  ( (Unit!49713) )
))
(declare-fun lt!645914 () Unit!49712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49712)

(assert (=> b!1479153 (= lt!645914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126228 res!1005079) b!1479144))

(assert (= (and b!1479144 res!1005081) b!1479139))

(assert (= (and b!1479139 res!1005085) b!1479141))

(assert (= (and b!1479141 res!1005075) b!1479151))

(assert (= (and b!1479151 res!1005076) b!1479147))

(assert (= (and b!1479147 res!1005083) b!1479143))

(assert (= (and b!1479143 res!1005073) b!1479136))

(assert (= (and b!1479136 res!1005080) b!1479146))

(assert (= (and b!1479146 res!1005086) b!1479140))

(assert (= (and b!1479140 res!1005077) b!1479137))

(assert (= (and b!1479137 res!1005074) b!1479148))

(assert (= (and b!1479148 c!136551) b!1479152))

(assert (= (and b!1479148 (not c!136551)) b!1479149))

(assert (= (and b!1479148 res!1005078) b!1479150))

(assert (= (and b!1479150 res!1005087) b!1479153))

(assert (= (and b!1479153 res!1005082) b!1479138))

(assert (= (and b!1479138 (not res!1005084)) b!1479142))

(assert (= (and b!1479142 res!1005088) b!1479145))

(declare-fun m!1365023 () Bool)

(assert (=> b!1479153 m!1365023))

(declare-fun m!1365025 () Bool)

(assert (=> b!1479153 m!1365025))

(declare-fun m!1365027 () Bool)

(assert (=> b!1479153 m!1365027))

(declare-fun m!1365029 () Bool)

(assert (=> b!1479153 m!1365029))

(declare-fun m!1365031 () Bool)

(assert (=> b!1479153 m!1365031))

(assert (=> b!1479153 m!1365027))

(declare-fun m!1365033 () Bool)

(assert (=> b!1479136 m!1365033))

(declare-fun m!1365035 () Bool)

(assert (=> b!1479136 m!1365035))

(declare-fun m!1365037 () Bool)

(assert (=> b!1479138 m!1365037))

(assert (=> b!1479138 m!1365033))

(declare-fun m!1365039 () Bool)

(assert (=> b!1479138 m!1365039))

(assert (=> b!1479138 m!1365027))

(declare-fun m!1365041 () Bool)

(assert (=> b!1479137 m!1365041))

(assert (=> b!1479137 m!1365041))

(declare-fun m!1365043 () Bool)

(assert (=> b!1479137 m!1365043))

(assert (=> b!1479137 m!1365033))

(declare-fun m!1365045 () Bool)

(assert (=> b!1479137 m!1365045))

(assert (=> b!1479142 m!1365027))

(assert (=> b!1479142 m!1365027))

(declare-fun m!1365047 () Bool)

(assert (=> b!1479142 m!1365047))

(assert (=> b!1479140 m!1365027))

(assert (=> b!1479140 m!1365027))

(declare-fun m!1365049 () Bool)

(assert (=> b!1479140 m!1365049))

(assert (=> b!1479146 m!1365027))

(assert (=> b!1479146 m!1365027))

(declare-fun m!1365051 () Bool)

(assert (=> b!1479146 m!1365051))

(assert (=> b!1479146 m!1365051))

(assert (=> b!1479146 m!1365027))

(declare-fun m!1365053 () Bool)

(assert (=> b!1479146 m!1365053))

(declare-fun m!1365055 () Bool)

(assert (=> b!1479147 m!1365055))

(declare-fun m!1365057 () Bool)

(assert (=> b!1479152 m!1365057))

(declare-fun m!1365059 () Bool)

(assert (=> b!1479151 m!1365059))

(assert (=> b!1479141 m!1365027))

(assert (=> b!1479141 m!1365027))

(declare-fun m!1365061 () Bool)

(assert (=> b!1479141 m!1365061))

(declare-fun m!1365063 () Bool)

(assert (=> b!1479149 m!1365063))

(declare-fun m!1365065 () Bool)

(assert (=> b!1479149 m!1365065))

(declare-fun m!1365067 () Bool)

(assert (=> start!126228 m!1365067))

(declare-fun m!1365069 () Bool)

(assert (=> start!126228 m!1365069))

(declare-fun m!1365071 () Bool)

(assert (=> b!1479139 m!1365071))

(assert (=> b!1479139 m!1365071))

(declare-fun m!1365073 () Bool)

(assert (=> b!1479139 m!1365073))

(check-sat (not b!1479137) (not b!1479149) (not b!1479142) (not b!1479140) (not b!1479139) (not b!1479152) (not b!1479146) (not b!1479141) (not start!126228) (not b!1479147) (not b!1479151) (not b!1479153))
(check-sat)
