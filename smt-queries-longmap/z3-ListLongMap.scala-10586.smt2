; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124656 () Bool)

(assert start!124656)

(declare-fun b!1444166 () Bool)

(declare-fun e!813721 () Bool)

(declare-fun e!813716 () Bool)

(assert (=> b!1444166 (= e!813721 e!813716)))

(declare-fun res!976192 () Bool)

(assert (=> b!1444166 (=> (not res!976192) (not e!813716))))

(declare-datatypes ((array!98104 0))(
  ( (array!98105 (arr!47340 (Array (_ BitVec 32) (_ BitVec 64))) (size!47890 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98104)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11592 0))(
  ( (MissingZero!11592 (index!48760 (_ BitVec 32))) (Found!11592 (index!48761 (_ BitVec 32))) (Intermediate!11592 (undefined!12404 Bool) (index!48762 (_ BitVec 32)) (x!130457 (_ BitVec 32))) (Undefined!11592) (MissingVacant!11592 (index!48763 (_ BitVec 32))) )
))
(declare-fun lt!634108 () SeekEntryResult!11592)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98104 (_ BitVec 32)) SeekEntryResult!11592)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444166 (= res!976192 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47340 a!2862) j!93) mask!2687) (select (arr!47340 a!2862) j!93) a!2862 mask!2687) lt!634108))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444166 (= lt!634108 (Intermediate!11592 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444167 () Bool)

(declare-fun res!976200 () Bool)

(declare-fun e!813718 () Bool)

(assert (=> b!1444167 (=> (not res!976200) (not e!813718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98104 (_ BitVec 32)) Bool)

(assert (=> b!1444167 (= res!976200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444168 () Bool)

(declare-fun res!976196 () Bool)

(assert (=> b!1444168 (=> (not res!976196) (not e!813718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444168 (= res!976196 (validKeyInArray!0 (select (arr!47340 a!2862) j!93)))))

(declare-fun b!1444169 () Bool)

(declare-fun res!976191 () Bool)

(assert (=> b!1444169 (=> (not res!976191) (not e!813718))))

(declare-datatypes ((List!33841 0))(
  ( (Nil!33838) (Cons!33837 (h!35187 (_ BitVec 64)) (t!48535 List!33841)) )
))
(declare-fun arrayNoDuplicates!0 (array!98104 (_ BitVec 32) List!33841) Bool)

(assert (=> b!1444169 (= res!976191 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33838))))

(declare-fun b!1444170 () Bool)

(declare-fun res!976195 () Bool)

(declare-fun e!813717 () Bool)

(assert (=> b!1444170 (=> (not res!976195) (not e!813717))))

(declare-fun e!813720 () Bool)

(assert (=> b!1444170 (= res!976195 e!813720)))

(declare-fun c!133500 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444170 (= c!133500 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444171 () Bool)

(declare-fun res!976188 () Bool)

(assert (=> b!1444171 (=> (not res!976188) (not e!813717))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444171 (= res!976188 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444172 () Bool)

(declare-fun res!976187 () Bool)

(assert (=> b!1444172 (=> (not res!976187) (not e!813718))))

(assert (=> b!1444172 (= res!976187 (and (= (size!47890 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47890 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47890 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444173 () Bool)

(declare-fun res!976190 () Bool)

(declare-fun e!813722 () Bool)

(assert (=> b!1444173 (=> res!976190 e!813722)))

(declare-fun lt!634110 () (_ BitVec 64))

(declare-fun lt!634109 () array!98104)

(declare-fun lt!634107 () SeekEntryResult!11592)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98104 (_ BitVec 32)) SeekEntryResult!11592)

(assert (=> b!1444173 (= res!976190 (not (= lt!634107 (seekEntryOrOpen!0 lt!634110 lt!634109 mask!2687))))))

(declare-fun b!1444174 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98104 (_ BitVec 32)) SeekEntryResult!11592)

(assert (=> b!1444174 (= e!813720 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634110 lt!634109 mask!2687) (seekEntryOrOpen!0 lt!634110 lt!634109 mask!2687)))))

(declare-fun b!1444175 () Bool)

(declare-fun res!976199 () Bool)

(assert (=> b!1444175 (=> (not res!976199) (not e!813718))))

(assert (=> b!1444175 (= res!976199 (validKeyInArray!0 (select (arr!47340 a!2862) i!1006)))))

(declare-fun b!1444176 () Bool)

(assert (=> b!1444176 (= e!813716 e!813717)))

(declare-fun res!976194 () Bool)

(assert (=> b!1444176 (=> (not res!976194) (not e!813717))))

(declare-fun lt!634106 () SeekEntryResult!11592)

(assert (=> b!1444176 (= res!976194 (= lt!634106 (Intermediate!11592 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444176 (= lt!634106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634110 mask!2687) lt!634110 lt!634109 mask!2687))))

(assert (=> b!1444176 (= lt!634110 (select (store (arr!47340 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444177 () Bool)

(assert (=> b!1444177 (= e!813722 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun res!976189 () Bool)

(assert (=> start!124656 (=> (not res!976189) (not e!813718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124656 (= res!976189 (validMask!0 mask!2687))))

(assert (=> start!124656 e!813718))

(assert (=> start!124656 true))

(declare-fun array_inv!36368 (array!98104) Bool)

(assert (=> start!124656 (array_inv!36368 a!2862)))

(declare-fun b!1444178 () Bool)

(declare-fun res!976198 () Bool)

(assert (=> b!1444178 (=> (not res!976198) (not e!813718))))

(assert (=> b!1444178 (= res!976198 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47890 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47890 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47890 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444179 () Bool)

(assert (=> b!1444179 (= e!813717 (not e!813722))))

(declare-fun res!976201 () Bool)

(assert (=> b!1444179 (=> res!976201 e!813722)))

(assert (=> b!1444179 (= res!976201 (or (not (= (select (arr!47340 a!2862) index!646) (select (store (arr!47340 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47340 a!2862) index!646) (select (arr!47340 a!2862) j!93)))))))

(assert (=> b!1444179 (and (= lt!634107 (Found!11592 j!93)) (or (= (select (arr!47340 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47340 a!2862) intermediateBeforeIndex!19) (select (arr!47340 a!2862) j!93))))))

(assert (=> b!1444179 (= lt!634107 (seekEntryOrOpen!0 (select (arr!47340 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1444179 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48680 0))(
  ( (Unit!48681) )
))
(declare-fun lt!634105 () Unit!48680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48680)

(assert (=> b!1444179 (= lt!634105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444180 () Bool)

(assert (=> b!1444180 (= e!813718 e!813721)))

(declare-fun res!976193 () Bool)

(assert (=> b!1444180 (=> (not res!976193) (not e!813721))))

(assert (=> b!1444180 (= res!976193 (= (select (store (arr!47340 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444180 (= lt!634109 (array!98105 (store (arr!47340 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47890 a!2862)))))

(declare-fun b!1444181 () Bool)

(declare-fun res!976197 () Bool)

(assert (=> b!1444181 (=> (not res!976197) (not e!813716))))

(assert (=> b!1444181 (= res!976197 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47340 a!2862) j!93) a!2862 mask!2687) lt!634108))))

(declare-fun b!1444182 () Bool)

(assert (=> b!1444182 (= e!813720 (= lt!634106 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634110 lt!634109 mask!2687)))))

(assert (= (and start!124656 res!976189) b!1444172))

(assert (= (and b!1444172 res!976187) b!1444175))

(assert (= (and b!1444175 res!976199) b!1444168))

(assert (= (and b!1444168 res!976196) b!1444167))

(assert (= (and b!1444167 res!976200) b!1444169))

(assert (= (and b!1444169 res!976191) b!1444178))

(assert (= (and b!1444178 res!976198) b!1444180))

(assert (= (and b!1444180 res!976193) b!1444166))

(assert (= (and b!1444166 res!976192) b!1444181))

(assert (= (and b!1444181 res!976197) b!1444176))

(assert (= (and b!1444176 res!976194) b!1444170))

(assert (= (and b!1444170 c!133500) b!1444182))

(assert (= (and b!1444170 (not c!133500)) b!1444174))

(assert (= (and b!1444170 res!976195) b!1444171))

(assert (= (and b!1444171 res!976188) b!1444179))

(assert (= (and b!1444179 (not res!976201)) b!1444173))

(assert (= (and b!1444173 (not res!976190)) b!1444177))

(declare-fun m!1333203 () Bool)

(assert (=> b!1444181 m!1333203))

(assert (=> b!1444181 m!1333203))

(declare-fun m!1333205 () Bool)

(assert (=> b!1444181 m!1333205))

(declare-fun m!1333207 () Bool)

(assert (=> b!1444167 m!1333207))

(declare-fun m!1333209 () Bool)

(assert (=> start!124656 m!1333209))

(declare-fun m!1333211 () Bool)

(assert (=> start!124656 m!1333211))

(declare-fun m!1333213 () Bool)

(assert (=> b!1444169 m!1333213))

(declare-fun m!1333215 () Bool)

(assert (=> b!1444176 m!1333215))

(assert (=> b!1444176 m!1333215))

(declare-fun m!1333217 () Bool)

(assert (=> b!1444176 m!1333217))

(declare-fun m!1333219 () Bool)

(assert (=> b!1444176 m!1333219))

(declare-fun m!1333221 () Bool)

(assert (=> b!1444176 m!1333221))

(declare-fun m!1333223 () Bool)

(assert (=> b!1444174 m!1333223))

(declare-fun m!1333225 () Bool)

(assert (=> b!1444174 m!1333225))

(declare-fun m!1333227 () Bool)

(assert (=> b!1444175 m!1333227))

(assert (=> b!1444175 m!1333227))

(declare-fun m!1333229 () Bool)

(assert (=> b!1444175 m!1333229))

(declare-fun m!1333231 () Bool)

(assert (=> b!1444179 m!1333231))

(assert (=> b!1444179 m!1333219))

(declare-fun m!1333233 () Bool)

(assert (=> b!1444179 m!1333233))

(declare-fun m!1333235 () Bool)

(assert (=> b!1444179 m!1333235))

(declare-fun m!1333237 () Bool)

(assert (=> b!1444179 m!1333237))

(assert (=> b!1444179 m!1333203))

(declare-fun m!1333239 () Bool)

(assert (=> b!1444179 m!1333239))

(declare-fun m!1333241 () Bool)

(assert (=> b!1444179 m!1333241))

(assert (=> b!1444179 m!1333203))

(assert (=> b!1444168 m!1333203))

(assert (=> b!1444168 m!1333203))

(declare-fun m!1333243 () Bool)

(assert (=> b!1444168 m!1333243))

(assert (=> b!1444180 m!1333219))

(declare-fun m!1333245 () Bool)

(assert (=> b!1444180 m!1333245))

(declare-fun m!1333247 () Bool)

(assert (=> b!1444182 m!1333247))

(assert (=> b!1444173 m!1333225))

(assert (=> b!1444166 m!1333203))

(assert (=> b!1444166 m!1333203))

(declare-fun m!1333249 () Bool)

(assert (=> b!1444166 m!1333249))

(assert (=> b!1444166 m!1333249))

(assert (=> b!1444166 m!1333203))

(declare-fun m!1333251 () Bool)

(assert (=> b!1444166 m!1333251))

(check-sat (not b!1444167) (not b!1444174) (not b!1444166) (not b!1444176) (not b!1444169) (not b!1444168) (not b!1444173) (not b!1444175) (not b!1444181) (not b!1444179) (not b!1444182) (not start!124656))
(check-sat)
