; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124896 () Bool)

(assert start!124896)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1446073 () Bool)

(declare-fun e!814798 () Bool)

(declare-datatypes ((array!98239 0))(
  ( (array!98240 (arr!47404 (Array (_ BitVec 32) (_ BitVec 64))) (size!47955 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98239)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1446073 (= e!814798 (or (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) (select (arr!47404 a!2862) j!93))))))

(declare-datatypes ((SeekEntryResult!11553 0))(
  ( (MissingZero!11553 (index!48604 (_ BitVec 32))) (Found!11553 (index!48605 (_ BitVec 32))) (Intermediate!11553 (undefined!12365 Bool) (index!48606 (_ BitVec 32)) (x!130474 (_ BitVec 32))) (Undefined!11553) (MissingVacant!11553 (index!48607 (_ BitVec 32))) )
))
(declare-fun lt!634773 () SeekEntryResult!11553)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1446074 () Bool)

(declare-fun e!814795 () Bool)

(declare-fun lt!634770 () array!98239)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634772 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98239 (_ BitVec 32)) SeekEntryResult!11553)

(assert (=> b!1446074 (= e!814795 (= lt!634773 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634772 lt!634770 mask!2687)))))

(declare-fun b!1446075 () Bool)

(declare-fun res!977207 () Bool)

(declare-fun e!814797 () Bool)

(assert (=> b!1446075 (=> (not res!977207) (not e!814797))))

(declare-datatypes ((List!33892 0))(
  ( (Nil!33889) (Cons!33888 (h!35249 (_ BitVec 64)) (t!48578 List!33892)) )
))
(declare-fun arrayNoDuplicates!0 (array!98239 (_ BitVec 32) List!33892) Bool)

(assert (=> b!1446075 (= res!977207 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33889))))

(declare-fun b!1446076 () Bool)

(declare-fun e!814794 () Bool)

(declare-fun e!814796 () Bool)

(assert (=> b!1446076 (= e!814794 e!814796)))

(declare-fun res!977209 () Bool)

(assert (=> b!1446076 (=> (not res!977209) (not e!814796))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446076 (= res!977209 (= lt!634773 (Intermediate!11553 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446076 (= lt!634773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634772 mask!2687) lt!634772 lt!634770 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446076 (= lt!634772 (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446077 () Bool)

(declare-fun res!977202 () Bool)

(assert (=> b!1446077 (=> (not res!977202) (not e!814796))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446077 (= res!977202 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446078 () Bool)

(declare-fun res!977213 () Bool)

(assert (=> b!1446078 (=> (not res!977213) (not e!814797))))

(assert (=> b!1446078 (= res!977213 (and (= (size!47955 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47955 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47955 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446079 () Bool)

(declare-fun res!977211 () Bool)

(assert (=> b!1446079 (=> (not res!977211) (not e!814797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446079 (= res!977211 (validKeyInArray!0 (select (arr!47404 a!2862) j!93)))))

(declare-fun b!1446080 () Bool)

(declare-fun res!977204 () Bool)

(assert (=> b!1446080 (=> (not res!977204) (not e!814794))))

(declare-fun lt!634771 () SeekEntryResult!11553)

(assert (=> b!1446080 (= res!977204 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47404 a!2862) j!93) a!2862 mask!2687) lt!634771))))

(declare-fun b!1446081 () Bool)

(declare-fun res!977210 () Bool)

(assert (=> b!1446081 (=> (not res!977210) (not e!814797))))

(assert (=> b!1446081 (= res!977210 (validKeyInArray!0 (select (arr!47404 a!2862) i!1006)))))

(declare-fun b!1446082 () Bool)

(declare-fun e!814800 () Bool)

(assert (=> b!1446082 (= e!814797 e!814800)))

(declare-fun res!977212 () Bool)

(assert (=> b!1446082 (=> (not res!977212) (not e!814800))))

(assert (=> b!1446082 (= res!977212 (= (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446082 (= lt!634770 (array!98240 (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47955 a!2862)))))

(declare-fun b!1446083 () Bool)

(assert (=> b!1446083 (= e!814796 (not (or (and (= (select (arr!47404 a!2862) index!646) (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47404 a!2862) index!646) (select (arr!47404 a!2862) j!93))) (not (= (select (arr!47404 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1446083 e!814798))

(declare-fun res!977205 () Bool)

(assert (=> b!1446083 (=> (not res!977205) (not e!814798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98239 (_ BitVec 32)) Bool)

(assert (=> b!1446083 (= res!977205 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48635 0))(
  ( (Unit!48636) )
))
(declare-fun lt!634774 () Unit!48635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48635)

(assert (=> b!1446083 (= lt!634774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98239 (_ BitVec 32)) SeekEntryResult!11553)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98239 (_ BitVec 32)) SeekEntryResult!11553)

(assert (=> b!1446072 (= e!814795 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634772 lt!634770 mask!2687) (seekEntryOrOpen!0 lt!634772 lt!634770 mask!2687)))))

(declare-fun res!977203 () Bool)

(assert (=> start!124896 (=> (not res!977203) (not e!814797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124896 (= res!977203 (validMask!0 mask!2687))))

(assert (=> start!124896 e!814797))

(assert (=> start!124896 true))

(declare-fun array_inv!36685 (array!98239) Bool)

(assert (=> start!124896 (array_inv!36685 a!2862)))

(declare-fun b!1446084 () Bool)

(declare-fun res!977214 () Bool)

(assert (=> b!1446084 (=> (not res!977214) (not e!814797))))

(assert (=> b!1446084 (= res!977214 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47955 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47955 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47955 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446085 () Bool)

(declare-fun res!977206 () Bool)

(assert (=> b!1446085 (=> (not res!977206) (not e!814796))))

(assert (=> b!1446085 (= res!977206 e!814795)))

(declare-fun c!133954 () Bool)

(assert (=> b!1446085 (= c!133954 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446086 () Bool)

(declare-fun res!977215 () Bool)

(assert (=> b!1446086 (=> (not res!977215) (not e!814798))))

(assert (=> b!1446086 (= res!977215 (= (seekEntryOrOpen!0 (select (arr!47404 a!2862) j!93) a!2862 mask!2687) (Found!11553 j!93)))))

(declare-fun b!1446087 () Bool)

(assert (=> b!1446087 (= e!814800 e!814794)))

(declare-fun res!977208 () Bool)

(assert (=> b!1446087 (=> (not res!977208) (not e!814794))))

(assert (=> b!1446087 (= res!977208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47404 a!2862) j!93) mask!2687) (select (arr!47404 a!2862) j!93) a!2862 mask!2687) lt!634771))))

(assert (=> b!1446087 (= lt!634771 (Intermediate!11553 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446088 () Bool)

(declare-fun res!977216 () Bool)

(assert (=> b!1446088 (=> (not res!977216) (not e!814797))))

(assert (=> b!1446088 (= res!977216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124896 res!977203) b!1446078))

(assert (= (and b!1446078 res!977213) b!1446081))

(assert (= (and b!1446081 res!977210) b!1446079))

(assert (= (and b!1446079 res!977211) b!1446088))

(assert (= (and b!1446088 res!977216) b!1446075))

(assert (= (and b!1446075 res!977207) b!1446084))

(assert (= (and b!1446084 res!977214) b!1446082))

(assert (= (and b!1446082 res!977212) b!1446087))

(assert (= (and b!1446087 res!977208) b!1446080))

(assert (= (and b!1446080 res!977204) b!1446076))

(assert (= (and b!1446076 res!977209) b!1446085))

(assert (= (and b!1446085 c!133954) b!1446074))

(assert (= (and b!1446085 (not c!133954)) b!1446072))

(assert (= (and b!1446085 res!977206) b!1446077))

(assert (= (and b!1446077 res!977202) b!1446083))

(assert (= (and b!1446083 res!977205) b!1446086))

(assert (= (and b!1446086 res!977215) b!1446073))

(declare-fun m!1335187 () Bool)

(assert (=> b!1446082 m!1335187))

(declare-fun m!1335189 () Bool)

(assert (=> b!1446082 m!1335189))

(declare-fun m!1335191 () Bool)

(assert (=> b!1446076 m!1335191))

(assert (=> b!1446076 m!1335191))

(declare-fun m!1335193 () Bool)

(assert (=> b!1446076 m!1335193))

(assert (=> b!1446076 m!1335187))

(declare-fun m!1335195 () Bool)

(assert (=> b!1446076 m!1335195))

(declare-fun m!1335197 () Bool)

(assert (=> b!1446083 m!1335197))

(assert (=> b!1446083 m!1335187))

(declare-fun m!1335199 () Bool)

(assert (=> b!1446083 m!1335199))

(declare-fun m!1335201 () Bool)

(assert (=> b!1446083 m!1335201))

(declare-fun m!1335203 () Bool)

(assert (=> b!1446083 m!1335203))

(declare-fun m!1335205 () Bool)

(assert (=> b!1446083 m!1335205))

(declare-fun m!1335207 () Bool)

(assert (=> b!1446072 m!1335207))

(declare-fun m!1335209 () Bool)

(assert (=> b!1446072 m!1335209))

(declare-fun m!1335211 () Bool)

(assert (=> b!1446088 m!1335211))

(declare-fun m!1335213 () Bool)

(assert (=> start!124896 m!1335213))

(declare-fun m!1335215 () Bool)

(assert (=> start!124896 m!1335215))

(assert (=> b!1446086 m!1335205))

(assert (=> b!1446086 m!1335205))

(declare-fun m!1335217 () Bool)

(assert (=> b!1446086 m!1335217))

(assert (=> b!1446079 m!1335205))

(assert (=> b!1446079 m!1335205))

(declare-fun m!1335219 () Bool)

(assert (=> b!1446079 m!1335219))

(assert (=> b!1446080 m!1335205))

(assert (=> b!1446080 m!1335205))

(declare-fun m!1335221 () Bool)

(assert (=> b!1446080 m!1335221))

(declare-fun m!1335223 () Bool)

(assert (=> b!1446073 m!1335223))

(assert (=> b!1446073 m!1335205))

(declare-fun m!1335225 () Bool)

(assert (=> b!1446081 m!1335225))

(assert (=> b!1446081 m!1335225))

(declare-fun m!1335227 () Bool)

(assert (=> b!1446081 m!1335227))

(declare-fun m!1335229 () Bool)

(assert (=> b!1446074 m!1335229))

(declare-fun m!1335231 () Bool)

(assert (=> b!1446075 m!1335231))

(assert (=> b!1446087 m!1335205))

(assert (=> b!1446087 m!1335205))

(declare-fun m!1335233 () Bool)

(assert (=> b!1446087 m!1335233))

(assert (=> b!1446087 m!1335233))

(assert (=> b!1446087 m!1335205))

(declare-fun m!1335235 () Bool)

(assert (=> b!1446087 m!1335235))

(check-sat (not b!1446076) (not b!1446075) (not b!1446072) (not b!1446087) (not b!1446086) (not start!124896) (not b!1446083) (not b!1446081) (not b!1446074) (not b!1446088) (not b!1446079) (not b!1446080))
(check-sat)
