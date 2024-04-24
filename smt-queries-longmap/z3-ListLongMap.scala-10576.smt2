; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124812 () Bool)

(assert start!124812)

(declare-fun b!1443867 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98155 0))(
  ( (array!98156 (arr!47362 (Array (_ BitVec 32) (_ BitVec 64))) (size!47913 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98155)

(declare-fun e!813858 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443867 (= e!813858 (or (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) (select (arr!47362 a!2862) j!93))))))

(declare-fun b!1443868 () Bool)

(declare-fun res!975263 () Bool)

(assert (=> b!1443868 (=> (not res!975263) (not e!813858))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11511 0))(
  ( (MissingZero!11511 (index!48436 (_ BitVec 32))) (Found!11511 (index!48437 (_ BitVec 32))) (Intermediate!11511 (undefined!12323 Bool) (index!48438 (_ BitVec 32)) (x!130320 (_ BitVec 32))) (Undefined!11511) (MissingVacant!11511 (index!48439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98155 (_ BitVec 32)) SeekEntryResult!11511)

(assert (=> b!1443868 (= res!975263 (= (seekEntryOrOpen!0 (select (arr!47362 a!2862) j!93) a!2862 mask!2687) (Found!11511 j!93)))))

(declare-fun res!975255 () Bool)

(declare-fun e!813860 () Bool)

(assert (=> start!124812 (=> (not res!975255) (not e!813860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124812 (= res!975255 (validMask!0 mask!2687))))

(assert (=> start!124812 e!813860))

(assert (=> start!124812 true))

(declare-fun array_inv!36643 (array!98155) Bool)

(assert (=> start!124812 (array_inv!36643 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634068 () array!98155)

(declare-fun lt!634072 () (_ BitVec 64))

(declare-fun b!1443869 () Bool)

(declare-fun e!813861 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98155 (_ BitVec 32)) SeekEntryResult!11511)

(assert (=> b!1443869 (= e!813861 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634072 lt!634068 mask!2687) (seekEntryOrOpen!0 lt!634072 lt!634068 mask!2687)))))

(declare-fun b!1443870 () Bool)

(declare-fun res!975257 () Bool)

(declare-fun e!813864 () Bool)

(assert (=> b!1443870 (=> (not res!975257) (not e!813864))))

(declare-fun lt!634069 () SeekEntryResult!11511)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98155 (_ BitVec 32)) SeekEntryResult!11511)

(assert (=> b!1443870 (= res!975257 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47362 a!2862) j!93) a!2862 mask!2687) lt!634069))))

(declare-fun b!1443871 () Bool)

(declare-fun e!813862 () Bool)

(assert (=> b!1443871 (= e!813862 e!813864)))

(declare-fun res!975249 () Bool)

(assert (=> b!1443871 (=> (not res!975249) (not e!813864))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443871 (= res!975249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47362 a!2862) j!93) mask!2687) (select (arr!47362 a!2862) j!93) a!2862 mask!2687) lt!634069))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443871 (= lt!634069 (Intermediate!11511 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443872 () Bool)

(declare-fun res!975261 () Bool)

(assert (=> b!1443872 (=> (not res!975261) (not e!813860))))

(declare-datatypes ((List!33850 0))(
  ( (Nil!33847) (Cons!33846 (h!35207 (_ BitVec 64)) (t!48536 List!33850)) )
))
(declare-fun arrayNoDuplicates!0 (array!98155 (_ BitVec 32) List!33850) Bool)

(assert (=> b!1443872 (= res!975261 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33847))))

(declare-fun b!1443873 () Bool)

(declare-fun res!975250 () Bool)

(declare-fun e!813859 () Bool)

(assert (=> b!1443873 (=> (not res!975250) (not e!813859))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443873 (= res!975250 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443874 () Bool)

(assert (=> b!1443874 (= e!813860 e!813862)))

(declare-fun res!975259 () Bool)

(assert (=> b!1443874 (=> (not res!975259) (not e!813862))))

(assert (=> b!1443874 (= res!975259 (= (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443874 (= lt!634068 (array!98156 (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47913 a!2862)))))

(declare-fun b!1443875 () Bool)

(declare-fun res!975260 () Bool)

(assert (=> b!1443875 (=> (not res!975260) (not e!813860))))

(assert (=> b!1443875 (= res!975260 (and (= (size!47913 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47913 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47913 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443876 () Bool)

(declare-fun res!975254 () Bool)

(assert (=> b!1443876 (=> (not res!975254) (not e!813859))))

(assert (=> b!1443876 (= res!975254 e!813861)))

(declare-fun c!133828 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443876 (= c!133828 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443877 () Bool)

(declare-fun res!975258 () Bool)

(assert (=> b!1443877 (=> (not res!975258) (not e!813860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443877 (= res!975258 (validKeyInArray!0 (select (arr!47362 a!2862) i!1006)))))

(declare-fun b!1443878 () Bool)

(assert (=> b!1443878 (= e!813864 e!813859)))

(declare-fun res!975256 () Bool)

(assert (=> b!1443878 (=> (not res!975256) (not e!813859))))

(declare-fun lt!634071 () SeekEntryResult!11511)

(assert (=> b!1443878 (= res!975256 (= lt!634071 (Intermediate!11511 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443878 (= lt!634071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634072 mask!2687) lt!634072 lt!634068 mask!2687))))

(assert (=> b!1443878 (= lt!634072 (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443879 () Bool)

(declare-fun res!975252 () Bool)

(assert (=> b!1443879 (=> (not res!975252) (not e!813860))))

(assert (=> b!1443879 (= res!975252 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47913 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47913 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47913 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443880 () Bool)

(assert (=> b!1443880 (= e!813859 (not true))))

(assert (=> b!1443880 e!813858))

(declare-fun res!975253 () Bool)

(assert (=> b!1443880 (=> (not res!975253) (not e!813858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98155 (_ BitVec 32)) Bool)

(assert (=> b!1443880 (= res!975253 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48551 0))(
  ( (Unit!48552) )
))
(declare-fun lt!634070 () Unit!48551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48551)

(assert (=> b!1443880 (= lt!634070 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443881 () Bool)

(declare-fun res!975251 () Bool)

(assert (=> b!1443881 (=> (not res!975251) (not e!813860))))

(assert (=> b!1443881 (= res!975251 (validKeyInArray!0 (select (arr!47362 a!2862) j!93)))))

(declare-fun b!1443882 () Bool)

(declare-fun res!975262 () Bool)

(assert (=> b!1443882 (=> (not res!975262) (not e!813860))))

(assert (=> b!1443882 (= res!975262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443883 () Bool)

(assert (=> b!1443883 (= e!813861 (= lt!634071 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634072 lt!634068 mask!2687)))))

(assert (= (and start!124812 res!975255) b!1443875))

(assert (= (and b!1443875 res!975260) b!1443877))

(assert (= (and b!1443877 res!975258) b!1443881))

(assert (= (and b!1443881 res!975251) b!1443882))

(assert (= (and b!1443882 res!975262) b!1443872))

(assert (= (and b!1443872 res!975261) b!1443879))

(assert (= (and b!1443879 res!975252) b!1443874))

(assert (= (and b!1443874 res!975259) b!1443871))

(assert (= (and b!1443871 res!975249) b!1443870))

(assert (= (and b!1443870 res!975257) b!1443878))

(assert (= (and b!1443878 res!975256) b!1443876))

(assert (= (and b!1443876 c!133828) b!1443883))

(assert (= (and b!1443876 (not c!133828)) b!1443869))

(assert (= (and b!1443876 res!975254) b!1443873))

(assert (= (and b!1443873 res!975250) b!1443880))

(assert (= (and b!1443880 res!975253) b!1443868))

(assert (= (and b!1443868 res!975263) b!1443867))

(declare-fun m!1333123 () Bool)

(assert (=> b!1443868 m!1333123))

(assert (=> b!1443868 m!1333123))

(declare-fun m!1333125 () Bool)

(assert (=> b!1443868 m!1333125))

(declare-fun m!1333127 () Bool)

(assert (=> b!1443882 m!1333127))

(assert (=> b!1443881 m!1333123))

(assert (=> b!1443881 m!1333123))

(declare-fun m!1333129 () Bool)

(assert (=> b!1443881 m!1333129))

(declare-fun m!1333131 () Bool)

(assert (=> b!1443878 m!1333131))

(assert (=> b!1443878 m!1333131))

(declare-fun m!1333133 () Bool)

(assert (=> b!1443878 m!1333133))

(declare-fun m!1333135 () Bool)

(assert (=> b!1443878 m!1333135))

(declare-fun m!1333137 () Bool)

(assert (=> b!1443878 m!1333137))

(declare-fun m!1333139 () Bool)

(assert (=> b!1443867 m!1333139))

(assert (=> b!1443867 m!1333123))

(assert (=> b!1443870 m!1333123))

(assert (=> b!1443870 m!1333123))

(declare-fun m!1333141 () Bool)

(assert (=> b!1443870 m!1333141))

(assert (=> b!1443871 m!1333123))

(assert (=> b!1443871 m!1333123))

(declare-fun m!1333143 () Bool)

(assert (=> b!1443871 m!1333143))

(assert (=> b!1443871 m!1333143))

(assert (=> b!1443871 m!1333123))

(declare-fun m!1333145 () Bool)

(assert (=> b!1443871 m!1333145))

(declare-fun m!1333147 () Bool)

(assert (=> b!1443880 m!1333147))

(declare-fun m!1333149 () Bool)

(assert (=> b!1443880 m!1333149))

(assert (=> b!1443874 m!1333135))

(declare-fun m!1333151 () Bool)

(assert (=> b!1443874 m!1333151))

(declare-fun m!1333153 () Bool)

(assert (=> b!1443877 m!1333153))

(assert (=> b!1443877 m!1333153))

(declare-fun m!1333155 () Bool)

(assert (=> b!1443877 m!1333155))

(declare-fun m!1333157 () Bool)

(assert (=> b!1443869 m!1333157))

(declare-fun m!1333159 () Bool)

(assert (=> b!1443869 m!1333159))

(declare-fun m!1333161 () Bool)

(assert (=> b!1443883 m!1333161))

(declare-fun m!1333163 () Bool)

(assert (=> b!1443872 m!1333163))

(declare-fun m!1333165 () Bool)

(assert (=> start!124812 m!1333165))

(declare-fun m!1333167 () Bool)

(assert (=> start!124812 m!1333167))

(check-sat (not b!1443868) (not b!1443871) (not b!1443878) (not b!1443870) (not b!1443877) (not b!1443880) (not start!124812) (not b!1443881) (not b!1443882) (not b!1443872) (not b!1443883) (not b!1443869))
(check-sat)
