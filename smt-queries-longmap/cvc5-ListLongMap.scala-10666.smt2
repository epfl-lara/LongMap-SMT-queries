; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125134 () Bool)

(assert start!125134)

(declare-fun b!1458066 () Bool)

(declare-fun e!820173 () Bool)

(declare-fun e!820176 () Bool)

(assert (=> b!1458066 (= e!820173 e!820176)))

(declare-fun res!988269 () Bool)

(assert (=> b!1458066 (=> res!988269 e!820176)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638912 () (_ BitVec 32))

(declare-datatypes ((array!98582 0))(
  ( (array!98583 (arr!47579 (Array (_ BitVec 32) (_ BitVec 64))) (size!48129 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98582)

(assert (=> b!1458066 (= res!988269 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638912 #b00000000000000000000000000000000) (bvsge lt!638912 (size!48129 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458066 (= lt!638912 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-datatypes ((SeekEntryResult!11831 0))(
  ( (MissingZero!11831 (index!49716 (_ BitVec 32))) (Found!11831 (index!49717 (_ BitVec 32))) (Intermediate!11831 (undefined!12643 Bool) (index!49718 (_ BitVec 32)) (x!131336 (_ BitVec 32))) (Undefined!11831) (MissingVacant!11831 (index!49719 (_ BitVec 32))) )
))
(declare-fun lt!638906 () SeekEntryResult!11831)

(declare-fun lt!638909 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!638911 () array!98582)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98582 (_ BitVec 32)) SeekEntryResult!11831)

(assert (=> b!1458066 (= lt!638906 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638909 lt!638911 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98582 (_ BitVec 32)) SeekEntryResult!11831)

(assert (=> b!1458066 (= lt!638906 (seekEntryOrOpen!0 lt!638909 lt!638911 mask!2687))))

(declare-fun b!1458067 () Bool)

(declare-fun lt!638913 () SeekEntryResult!11831)

(declare-fun e!820180 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98582 (_ BitVec 32)) SeekEntryResult!11831)

(assert (=> b!1458067 (= e!820180 (= lt!638913 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638909 lt!638911 mask!2687)))))

(declare-fun e!820178 () Bool)

(declare-fun b!1458068 () Bool)

(assert (=> b!1458068 (= e!820178 (not (= lt!638913 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638912 lt!638909 lt!638911 mask!2687))))))

(declare-fun b!1458069 () Bool)

(declare-fun res!988268 () Bool)

(declare-fun e!820181 () Bool)

(assert (=> b!1458069 (=> (not res!988268) (not e!820181))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458069 (= res!988268 (validKeyInArray!0 (select (arr!47579 a!2862) i!1006)))))

(declare-fun res!988270 () Bool)

(assert (=> start!125134 (=> (not res!988270) (not e!820181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125134 (= res!988270 (validMask!0 mask!2687))))

(assert (=> start!125134 e!820181))

(assert (=> start!125134 true))

(declare-fun array_inv!36607 (array!98582) Bool)

(assert (=> start!125134 (array_inv!36607 a!2862)))

(declare-fun b!1458070 () Bool)

(declare-fun res!988264 () Bool)

(assert (=> b!1458070 (=> (not res!988264) (not e!820181))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458070 (= res!988264 (and (= (size!48129 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48129 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48129 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458071 () Bool)

(assert (=> b!1458071 (= e!820180 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638909 lt!638911 mask!2687) (seekEntryOrOpen!0 lt!638909 lt!638911 mask!2687)))))

(declare-fun b!1458072 () Bool)

(declare-fun e!820179 () Bool)

(declare-fun e!820174 () Bool)

(assert (=> b!1458072 (= e!820179 e!820174)))

(declare-fun res!988253 () Bool)

(assert (=> b!1458072 (=> (not res!988253) (not e!820174))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458072 (= res!988253 (= lt!638913 (Intermediate!11831 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458072 (= lt!638913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638909 mask!2687) lt!638909 lt!638911 mask!2687))))

(assert (=> b!1458072 (= lt!638909 (select (store (arr!47579 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458073 () Bool)

(declare-fun res!988263 () Bool)

(assert (=> b!1458073 (=> (not res!988263) (not e!820179))))

(declare-fun lt!638910 () SeekEntryResult!11831)

(assert (=> b!1458073 (= res!988263 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47579 a!2862) j!93) a!2862 mask!2687) lt!638910))))

(declare-fun b!1458074 () Bool)

(declare-fun res!988254 () Bool)

(assert (=> b!1458074 (=> (not res!988254) (not e!820181))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458074 (= res!988254 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48129 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48129 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48129 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458075 () Bool)

(declare-fun res!988256 () Bool)

(declare-fun e!820172 () Bool)

(assert (=> b!1458075 (=> (not res!988256) (not e!820172))))

(assert (=> b!1458075 (= res!988256 (= (seekEntryOrOpen!0 (select (arr!47579 a!2862) j!93) a!2862 mask!2687) (Found!11831 j!93)))))

(declare-fun b!1458076 () Bool)

(declare-fun res!988261 () Bool)

(assert (=> b!1458076 (=> (not res!988261) (not e!820181))))

(assert (=> b!1458076 (= res!988261 (validKeyInArray!0 (select (arr!47579 a!2862) j!93)))))

(declare-fun b!1458077 () Bool)

(assert (=> b!1458077 (= e!820176 true)))

(declare-fun lt!638907 () Bool)

(assert (=> b!1458077 (= lt!638907 e!820178)))

(declare-fun c!134418 () Bool)

(assert (=> b!1458077 (= c!134418 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458078 () Bool)

(assert (=> b!1458078 (= e!820174 (not e!820173))))

(declare-fun res!988267 () Bool)

(assert (=> b!1458078 (=> res!988267 e!820173)))

(assert (=> b!1458078 (= res!988267 (or (and (= (select (arr!47579 a!2862) index!646) (select (store (arr!47579 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47579 a!2862) index!646) (select (arr!47579 a!2862) j!93))) (= (select (arr!47579 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458078 e!820172))

(declare-fun res!988258 () Bool)

(assert (=> b!1458078 (=> (not res!988258) (not e!820172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98582 (_ BitVec 32)) Bool)

(assert (=> b!1458078 (= res!988258 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49158 0))(
  ( (Unit!49159) )
))
(declare-fun lt!638908 () Unit!49158)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49158)

(assert (=> b!1458078 (= lt!638908 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458079 () Bool)

(declare-fun res!988262 () Bool)

(assert (=> b!1458079 (=> (not res!988262) (not e!820181))))

(assert (=> b!1458079 (= res!988262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458080 () Bool)

(declare-fun res!988255 () Bool)

(assert (=> b!1458080 (=> (not res!988255) (not e!820174))))

(assert (=> b!1458080 (= res!988255 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458081 () Bool)

(declare-fun res!988260 () Bool)

(assert (=> b!1458081 (=> res!988260 e!820176)))

(assert (=> b!1458081 (= res!988260 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638912 (select (arr!47579 a!2862) j!93) a!2862 mask!2687) lt!638910)))))

(declare-fun b!1458082 () Bool)

(declare-fun e!820177 () Bool)

(assert (=> b!1458082 (= e!820177 e!820179)))

(declare-fun res!988266 () Bool)

(assert (=> b!1458082 (=> (not res!988266) (not e!820179))))

(assert (=> b!1458082 (= res!988266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47579 a!2862) j!93) mask!2687) (select (arr!47579 a!2862) j!93) a!2862 mask!2687) lt!638910))))

(assert (=> b!1458082 (= lt!638910 (Intermediate!11831 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458083 () Bool)

(declare-fun res!988257 () Bool)

(assert (=> b!1458083 (=> (not res!988257) (not e!820181))))

(declare-datatypes ((List!34080 0))(
  ( (Nil!34077) (Cons!34076 (h!35426 (_ BitVec 64)) (t!48774 List!34080)) )
))
(declare-fun arrayNoDuplicates!0 (array!98582 (_ BitVec 32) List!34080) Bool)

(assert (=> b!1458083 (= res!988257 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34077))))

(declare-fun b!1458084 () Bool)

(assert (=> b!1458084 (= e!820172 (and (or (= (select (arr!47579 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47579 a!2862) intermediateBeforeIndex!19) (select (arr!47579 a!2862) j!93))) (let ((bdg!53395 (select (store (arr!47579 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47579 a!2862) index!646) bdg!53395) (= (select (arr!47579 a!2862) index!646) (select (arr!47579 a!2862) j!93))) (= (select (arr!47579 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53395 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458085 () Bool)

(assert (=> b!1458085 (= e!820178 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638912 intermediateAfterIndex!19 lt!638909 lt!638911 mask!2687) lt!638906)))))

(declare-fun b!1458086 () Bool)

(assert (=> b!1458086 (= e!820181 e!820177)))

(declare-fun res!988259 () Bool)

(assert (=> b!1458086 (=> (not res!988259) (not e!820177))))

(assert (=> b!1458086 (= res!988259 (= (select (store (arr!47579 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458086 (= lt!638911 (array!98583 (store (arr!47579 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48129 a!2862)))))

(declare-fun b!1458087 () Bool)

(declare-fun res!988265 () Bool)

(assert (=> b!1458087 (=> (not res!988265) (not e!820174))))

(assert (=> b!1458087 (= res!988265 e!820180)))

(declare-fun c!134417 () Bool)

(assert (=> b!1458087 (= c!134417 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125134 res!988270) b!1458070))

(assert (= (and b!1458070 res!988264) b!1458069))

(assert (= (and b!1458069 res!988268) b!1458076))

(assert (= (and b!1458076 res!988261) b!1458079))

(assert (= (and b!1458079 res!988262) b!1458083))

(assert (= (and b!1458083 res!988257) b!1458074))

(assert (= (and b!1458074 res!988254) b!1458086))

(assert (= (and b!1458086 res!988259) b!1458082))

(assert (= (and b!1458082 res!988266) b!1458073))

(assert (= (and b!1458073 res!988263) b!1458072))

(assert (= (and b!1458072 res!988253) b!1458087))

(assert (= (and b!1458087 c!134417) b!1458067))

(assert (= (and b!1458087 (not c!134417)) b!1458071))

(assert (= (and b!1458087 res!988265) b!1458080))

(assert (= (and b!1458080 res!988255) b!1458078))

(assert (= (and b!1458078 res!988258) b!1458075))

(assert (= (and b!1458075 res!988256) b!1458084))

(assert (= (and b!1458078 (not res!988267)) b!1458066))

(assert (= (and b!1458066 (not res!988269)) b!1458081))

(assert (= (and b!1458081 (not res!988260)) b!1458077))

(assert (= (and b!1458077 c!134418) b!1458068))

(assert (= (and b!1458077 (not c!134418)) b!1458085))

(declare-fun m!1345969 () Bool)

(assert (=> b!1458082 m!1345969))

(assert (=> b!1458082 m!1345969))

(declare-fun m!1345971 () Bool)

(assert (=> b!1458082 m!1345971))

(assert (=> b!1458082 m!1345971))

(assert (=> b!1458082 m!1345969))

(declare-fun m!1345973 () Bool)

(assert (=> b!1458082 m!1345973))

(declare-fun m!1345975 () Bool)

(assert (=> b!1458066 m!1345975))

(declare-fun m!1345977 () Bool)

(assert (=> b!1458066 m!1345977))

(declare-fun m!1345979 () Bool)

(assert (=> b!1458066 m!1345979))

(declare-fun m!1345981 () Bool)

(assert (=> b!1458086 m!1345981))

(declare-fun m!1345983 () Bool)

(assert (=> b!1458086 m!1345983))

(declare-fun m!1345985 () Bool)

(assert (=> b!1458068 m!1345985))

(declare-fun m!1345987 () Bool)

(assert (=> start!125134 m!1345987))

(declare-fun m!1345989 () Bool)

(assert (=> start!125134 m!1345989))

(assert (=> b!1458071 m!1345977))

(assert (=> b!1458071 m!1345979))

(assert (=> b!1458076 m!1345969))

(assert (=> b!1458076 m!1345969))

(declare-fun m!1345991 () Bool)

(assert (=> b!1458076 m!1345991))

(assert (=> b!1458075 m!1345969))

(assert (=> b!1458075 m!1345969))

(declare-fun m!1345993 () Bool)

(assert (=> b!1458075 m!1345993))

(assert (=> b!1458084 m!1345981))

(declare-fun m!1345995 () Bool)

(assert (=> b!1458084 m!1345995))

(declare-fun m!1345997 () Bool)

(assert (=> b!1458084 m!1345997))

(declare-fun m!1345999 () Bool)

(assert (=> b!1458084 m!1345999))

(assert (=> b!1458084 m!1345969))

(declare-fun m!1346001 () Bool)

(assert (=> b!1458079 m!1346001))

(declare-fun m!1346003 () Bool)

(assert (=> b!1458067 m!1346003))

(declare-fun m!1346005 () Bool)

(assert (=> b!1458069 m!1346005))

(assert (=> b!1458069 m!1346005))

(declare-fun m!1346007 () Bool)

(assert (=> b!1458069 m!1346007))

(declare-fun m!1346009 () Bool)

(assert (=> b!1458078 m!1346009))

(assert (=> b!1458078 m!1345981))

(assert (=> b!1458078 m!1345997))

(assert (=> b!1458078 m!1345999))

(declare-fun m!1346011 () Bool)

(assert (=> b!1458078 m!1346011))

(assert (=> b!1458078 m!1345969))

(declare-fun m!1346013 () Bool)

(assert (=> b!1458072 m!1346013))

(assert (=> b!1458072 m!1346013))

(declare-fun m!1346015 () Bool)

(assert (=> b!1458072 m!1346015))

(assert (=> b!1458072 m!1345981))

(declare-fun m!1346017 () Bool)

(assert (=> b!1458072 m!1346017))

(declare-fun m!1346019 () Bool)

(assert (=> b!1458085 m!1346019))

(declare-fun m!1346021 () Bool)

(assert (=> b!1458083 m!1346021))

(assert (=> b!1458081 m!1345969))

(assert (=> b!1458081 m!1345969))

(declare-fun m!1346023 () Bool)

(assert (=> b!1458081 m!1346023))

(assert (=> b!1458073 m!1345969))

(assert (=> b!1458073 m!1345969))

(declare-fun m!1346025 () Bool)

(assert (=> b!1458073 m!1346025))

(push 1)

