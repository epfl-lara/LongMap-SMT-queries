; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124652 () Bool)

(assert start!124652)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1444063 () Bool)

(declare-fun e!813675 () Bool)

(declare-datatypes ((array!98100 0))(
  ( (array!98101 (arr!47338 (Array (_ BitVec 32) (_ BitVec 64))) (size!47888 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98100)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444063 (= e!813675 (or (= (select (arr!47338 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47338 a!2862) intermediateBeforeIndex!19) (select (arr!47338 a!2862) j!93))))))

(declare-fun b!1444064 () Bool)

(declare-fun res!976106 () Bool)

(declare-fun e!813677 () Bool)

(assert (=> b!1444064 (=> (not res!976106) (not e!813677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444064 (= res!976106 (validKeyInArray!0 (select (arr!47338 a!2862) j!93)))))

(declare-fun b!1444065 () Bool)

(declare-fun e!813680 () Bool)

(declare-fun e!813678 () Bool)

(assert (=> b!1444065 (= e!813680 e!813678)))

(declare-fun res!976108 () Bool)

(assert (=> b!1444065 (=> (not res!976108) (not e!813678))))

(declare-datatypes ((SeekEntryResult!11590 0))(
  ( (MissingZero!11590 (index!48752 (_ BitVec 32))) (Found!11590 (index!48753 (_ BitVec 32))) (Intermediate!11590 (undefined!12402 Bool) (index!48754 (_ BitVec 32)) (x!130447 (_ BitVec 32))) (Undefined!11590) (MissingVacant!11590 (index!48755 (_ BitVec 32))) )
))
(declare-fun lt!634069 () SeekEntryResult!11590)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98100 (_ BitVec 32)) SeekEntryResult!11590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444065 (= res!976108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47338 a!2862) j!93) mask!2687) (select (arr!47338 a!2862) j!93) a!2862 mask!2687) lt!634069))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444065 (= lt!634069 (Intermediate!11590 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444066 () Bool)

(declare-fun res!976111 () Bool)

(assert (=> b!1444066 (=> (not res!976111) (not e!813677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98100 (_ BitVec 32)) Bool)

(assert (=> b!1444066 (= res!976111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444067 () Bool)

(declare-fun res!976101 () Bool)

(assert (=> b!1444067 (=> (not res!976101) (not e!813675))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98100 (_ BitVec 32)) SeekEntryResult!11590)

(assert (=> b!1444067 (= res!976101 (= (seekEntryOrOpen!0 (select (arr!47338 a!2862) j!93) a!2862 mask!2687) (Found!11590 j!93)))))

(declare-fun b!1444068 () Bool)

(assert (=> b!1444068 (= e!813677 e!813680)))

(declare-fun res!976098 () Bool)

(assert (=> b!1444068 (=> (not res!976098) (not e!813680))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444068 (= res!976098 (= (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634072 () array!98100)

(assert (=> b!1444068 (= lt!634072 (array!98101 (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47888 a!2862)))))

(declare-fun b!1444069 () Bool)

(declare-fun res!976099 () Bool)

(assert (=> b!1444069 (=> (not res!976099) (not e!813677))))

(assert (=> b!1444069 (= res!976099 (validKeyInArray!0 (select (arr!47338 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1444070 () Bool)

(declare-fun e!813679 () Bool)

(declare-fun lt!634071 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98100 (_ BitVec 32)) SeekEntryResult!11590)

(assert (=> b!1444070 (= e!813679 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634071 lt!634072 mask!2687) (seekEntryOrOpen!0 lt!634071 lt!634072 mask!2687)))))

(declare-fun b!1444071 () Bool)

(declare-fun res!976104 () Bool)

(assert (=> b!1444071 (=> (not res!976104) (not e!813677))))

(assert (=> b!1444071 (= res!976104 (and (= (size!47888 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47888 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47888 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!976097 () Bool)

(assert (=> start!124652 (=> (not res!976097) (not e!813677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124652 (= res!976097 (validMask!0 mask!2687))))

(assert (=> start!124652 e!813677))

(assert (=> start!124652 true))

(declare-fun array_inv!36366 (array!98100) Bool)

(assert (=> start!124652 (array_inv!36366 a!2862)))

(declare-fun b!1444072 () Bool)

(declare-fun res!976105 () Bool)

(declare-fun e!813676 () Bool)

(assert (=> b!1444072 (=> (not res!976105) (not e!813676))))

(assert (=> b!1444072 (= res!976105 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444073 () Bool)

(declare-fun e!813674 () Bool)

(assert (=> b!1444073 (= e!813674 true)))

(declare-fun lt!634074 () SeekEntryResult!11590)

(assert (=> b!1444073 (= lt!634074 (seekEntryOrOpen!0 lt!634071 lt!634072 mask!2687))))

(declare-fun b!1444074 () Bool)

(assert (=> b!1444074 (= e!813678 e!813676)))

(declare-fun res!976096 () Bool)

(assert (=> b!1444074 (=> (not res!976096) (not e!813676))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!634070 () SeekEntryResult!11590)

(assert (=> b!1444074 (= res!976096 (= lt!634070 (Intermediate!11590 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444074 (= lt!634070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634071 mask!2687) lt!634071 lt!634072 mask!2687))))

(assert (=> b!1444074 (= lt!634071 (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444075 () Bool)

(declare-fun res!976100 () Bool)

(assert (=> b!1444075 (=> (not res!976100) (not e!813677))))

(declare-datatypes ((List!33839 0))(
  ( (Nil!33836) (Cons!33835 (h!35185 (_ BitVec 64)) (t!48533 List!33839)) )
))
(declare-fun arrayNoDuplicates!0 (array!98100 (_ BitVec 32) List!33839) Bool)

(assert (=> b!1444075 (= res!976100 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33836))))

(declare-fun b!1444076 () Bool)

(assert (=> b!1444076 (= e!813679 (= lt!634070 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634071 lt!634072 mask!2687)))))

(declare-fun b!1444077 () Bool)

(declare-fun res!976103 () Bool)

(assert (=> b!1444077 (=> (not res!976103) (not e!813677))))

(assert (=> b!1444077 (= res!976103 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47888 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47888 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47888 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444078 () Bool)

(declare-fun res!976110 () Bool)

(assert (=> b!1444078 (=> (not res!976110) (not e!813676))))

(assert (=> b!1444078 (= res!976110 e!813679)))

(declare-fun c!133494 () Bool)

(assert (=> b!1444078 (= c!133494 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444079 () Bool)

(declare-fun res!976107 () Bool)

(assert (=> b!1444079 (=> (not res!976107) (not e!813678))))

(assert (=> b!1444079 (= res!976107 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47338 a!2862) j!93) a!2862 mask!2687) lt!634069))))

(declare-fun b!1444080 () Bool)

(assert (=> b!1444080 (= e!813676 (not e!813674))))

(declare-fun res!976109 () Bool)

(assert (=> b!1444080 (=> res!976109 e!813674)))

(assert (=> b!1444080 (= res!976109 (or (not (= (select (arr!47338 a!2862) index!646) (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47338 a!2862) index!646) (select (arr!47338 a!2862) j!93)))))))

(assert (=> b!1444080 e!813675))

(declare-fun res!976102 () Bool)

(assert (=> b!1444080 (=> (not res!976102) (not e!813675))))

(assert (=> b!1444080 (= res!976102 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48676 0))(
  ( (Unit!48677) )
))
(declare-fun lt!634073 () Unit!48676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48676)

(assert (=> b!1444080 (= lt!634073 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124652 res!976097) b!1444071))

(assert (= (and b!1444071 res!976104) b!1444069))

(assert (= (and b!1444069 res!976099) b!1444064))

(assert (= (and b!1444064 res!976106) b!1444066))

(assert (= (and b!1444066 res!976111) b!1444075))

(assert (= (and b!1444075 res!976100) b!1444077))

(assert (= (and b!1444077 res!976103) b!1444068))

(assert (= (and b!1444068 res!976098) b!1444065))

(assert (= (and b!1444065 res!976108) b!1444079))

(assert (= (and b!1444079 res!976107) b!1444074))

(assert (= (and b!1444074 res!976096) b!1444078))

(assert (= (and b!1444078 c!133494) b!1444076))

(assert (= (and b!1444078 (not c!133494)) b!1444070))

(assert (= (and b!1444078 res!976110) b!1444072))

(assert (= (and b!1444072 res!976105) b!1444080))

(assert (= (and b!1444080 res!976102) b!1444067))

(assert (= (and b!1444067 res!976101) b!1444063))

(assert (= (and b!1444080 (not res!976109)) b!1444073))

(declare-fun m!1333103 () Bool)

(assert (=> b!1444068 m!1333103))

(declare-fun m!1333105 () Bool)

(assert (=> b!1444068 m!1333105))

(declare-fun m!1333107 () Bool)

(assert (=> b!1444066 m!1333107))

(declare-fun m!1333109 () Bool)

(assert (=> b!1444073 m!1333109))

(declare-fun m!1333111 () Bool)

(assert (=> b!1444067 m!1333111))

(assert (=> b!1444067 m!1333111))

(declare-fun m!1333113 () Bool)

(assert (=> b!1444067 m!1333113))

(declare-fun m!1333115 () Bool)

(assert (=> b!1444080 m!1333115))

(assert (=> b!1444080 m!1333103))

(declare-fun m!1333117 () Bool)

(assert (=> b!1444080 m!1333117))

(declare-fun m!1333119 () Bool)

(assert (=> b!1444080 m!1333119))

(declare-fun m!1333121 () Bool)

(assert (=> b!1444080 m!1333121))

(assert (=> b!1444080 m!1333111))

(assert (=> b!1444065 m!1333111))

(assert (=> b!1444065 m!1333111))

(declare-fun m!1333123 () Bool)

(assert (=> b!1444065 m!1333123))

(assert (=> b!1444065 m!1333123))

(assert (=> b!1444065 m!1333111))

(declare-fun m!1333125 () Bool)

(assert (=> b!1444065 m!1333125))

(assert (=> b!1444064 m!1333111))

(assert (=> b!1444064 m!1333111))

(declare-fun m!1333127 () Bool)

(assert (=> b!1444064 m!1333127))

(declare-fun m!1333129 () Bool)

(assert (=> b!1444074 m!1333129))

(assert (=> b!1444074 m!1333129))

(declare-fun m!1333131 () Bool)

(assert (=> b!1444074 m!1333131))

(assert (=> b!1444074 m!1333103))

(declare-fun m!1333133 () Bool)

(assert (=> b!1444074 m!1333133))

(declare-fun m!1333135 () Bool)

(assert (=> b!1444070 m!1333135))

(assert (=> b!1444070 m!1333109))

(assert (=> b!1444079 m!1333111))

(assert (=> b!1444079 m!1333111))

(declare-fun m!1333137 () Bool)

(assert (=> b!1444079 m!1333137))

(declare-fun m!1333139 () Bool)

(assert (=> b!1444063 m!1333139))

(assert (=> b!1444063 m!1333111))

(declare-fun m!1333141 () Bool)

(assert (=> b!1444076 m!1333141))

(declare-fun m!1333143 () Bool)

(assert (=> start!124652 m!1333143))

(declare-fun m!1333145 () Bool)

(assert (=> start!124652 m!1333145))

(declare-fun m!1333147 () Bool)

(assert (=> b!1444069 m!1333147))

(assert (=> b!1444069 m!1333147))

(declare-fun m!1333149 () Bool)

(assert (=> b!1444069 m!1333149))

(declare-fun m!1333151 () Bool)

(assert (=> b!1444075 m!1333151))

(push 1)

