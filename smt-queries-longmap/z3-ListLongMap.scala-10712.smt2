; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125412 () Bool)

(assert start!125412)

(declare-fun b!1467069 () Bool)

(declare-fun e!824115 () Bool)

(declare-fun e!824113 () Bool)

(assert (=> b!1467069 (= e!824115 e!824113)))

(declare-fun res!995669 () Bool)

(assert (=> b!1467069 (=> res!995669 e!824113)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641985 () (_ BitVec 32))

(declare-datatypes ((array!98860 0))(
  ( (array!98861 (arr!47718 (Array (_ BitVec 32) (_ BitVec 64))) (size!48268 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98860)

(assert (=> b!1467069 (= res!995669 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641985 #b00000000000000000000000000000000) (bvsge lt!641985 (size!48268 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467069 (= lt!641985 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!995676 () Bool)

(declare-fun e!824119 () Bool)

(assert (=> start!125412 (=> (not res!995676) (not e!824119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125412 (= res!995676 (validMask!0 mask!2687))))

(assert (=> start!125412 e!824119))

(assert (=> start!125412 true))

(declare-fun array_inv!36746 (array!98860) Bool)

(assert (=> start!125412 (array_inv!36746 a!2862)))

(declare-fun b!1467070 () Bool)

(declare-fun res!995667 () Bool)

(assert (=> b!1467070 (=> (not res!995667) (not e!824119))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467070 (= res!995667 (validKeyInArray!0 (select (arr!47718 a!2862) i!1006)))))

(declare-fun b!1467071 () Bool)

(declare-fun e!824112 () Bool)

(assert (=> b!1467071 (= e!824112 (not e!824115))))

(declare-fun res!995666 () Bool)

(assert (=> b!1467071 (=> res!995666 e!824115)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467071 (= res!995666 (or (and (= (select (arr!47718 a!2862) index!646) (select (store (arr!47718 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47718 a!2862) index!646) (select (arr!47718 a!2862) j!93))) (= (select (arr!47718 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11970 0))(
  ( (MissingZero!11970 (index!50272 (_ BitVec 32))) (Found!11970 (index!50273 (_ BitVec 32))) (Intermediate!11970 (undefined!12782 Bool) (index!50274 (_ BitVec 32)) (x!131843 (_ BitVec 32))) (Undefined!11970) (MissingVacant!11970 (index!50275 (_ BitVec 32))) )
))
(declare-fun lt!641984 () SeekEntryResult!11970)

(assert (=> b!1467071 (and (= lt!641984 (Found!11970 j!93)) (or (= (select (arr!47718 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47718 a!2862) intermediateBeforeIndex!19) (select (arr!47718 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98860 (_ BitVec 32)) SeekEntryResult!11970)

(assert (=> b!1467071 (= lt!641984 (seekEntryOrOpen!0 (select (arr!47718 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98860 (_ BitVec 32)) Bool)

(assert (=> b!1467071 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49436 0))(
  ( (Unit!49437) )
))
(declare-fun lt!641981 () Unit!49436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49436)

(assert (=> b!1467071 (= lt!641981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467072 () Bool)

(declare-fun res!995675 () Bool)

(declare-fun e!824118 () Bool)

(assert (=> b!1467072 (=> (not res!995675) (not e!824118))))

(declare-fun lt!641988 () SeekEntryResult!11970)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98860 (_ BitVec 32)) SeekEntryResult!11970)

(assert (=> b!1467072 (= res!995675 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47718 a!2862) j!93) a!2862 mask!2687) lt!641988))))

(declare-fun e!824117 () Bool)

(declare-fun lt!641987 () (_ BitVec 64))

(declare-fun b!1467073 () Bool)

(declare-fun lt!641983 () SeekEntryResult!11970)

(declare-fun lt!641986 () array!98860)

(assert (=> b!1467073 (= e!824117 (not (= lt!641983 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641985 lt!641987 lt!641986 mask!2687))))))

(declare-fun b!1467074 () Bool)

(declare-fun res!995677 () Bool)

(assert (=> b!1467074 (=> (not res!995677) (not e!824119))))

(declare-datatypes ((List!34219 0))(
  ( (Nil!34216) (Cons!34215 (h!35565 (_ BitVec 64)) (t!48913 List!34219)) )
))
(declare-fun arrayNoDuplicates!0 (array!98860 (_ BitVec 32) List!34219) Bool)

(assert (=> b!1467074 (= res!995677 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34216))))

(declare-fun b!1467075 () Bool)

(declare-fun res!995674 () Bool)

(assert (=> b!1467075 (=> (not res!995674) (not e!824112))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467075 (= res!995674 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467076 () Bool)

(declare-fun res!995670 () Bool)

(assert (=> b!1467076 (=> (not res!995670) (not e!824112))))

(declare-fun e!824120 () Bool)

(assert (=> b!1467076 (= res!995670 e!824120)))

(declare-fun c!135215 () Bool)

(assert (=> b!1467076 (= c!135215 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467077 () Bool)

(declare-fun res!995660 () Bool)

(assert (=> b!1467077 (=> (not res!995660) (not e!824119))))

(assert (=> b!1467077 (= res!995660 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48268 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48268 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48268 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467078 () Bool)

(assert (=> b!1467078 (= e!824118 e!824112)))

(declare-fun res!995671 () Bool)

(assert (=> b!1467078 (=> (not res!995671) (not e!824112))))

(assert (=> b!1467078 (= res!995671 (= lt!641983 (Intermediate!11970 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467078 (= lt!641983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641987 mask!2687) lt!641987 lt!641986 mask!2687))))

(assert (=> b!1467078 (= lt!641987 (select (store (arr!47718 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467079 () Bool)

(declare-fun res!995664 () Bool)

(assert (=> b!1467079 (=> (not res!995664) (not e!824119))))

(assert (=> b!1467079 (= res!995664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467080 () Bool)

(declare-fun res!995662 () Bool)

(assert (=> b!1467080 (=> res!995662 e!824113)))

(assert (=> b!1467080 (= res!995662 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641985 (select (arr!47718 a!2862) j!93) a!2862 mask!2687) lt!641988)))))

(declare-fun b!1467081 () Bool)

(declare-fun res!995663 () Bool)

(assert (=> b!1467081 (=> (not res!995663) (not e!824119))))

(assert (=> b!1467081 (= res!995663 (validKeyInArray!0 (select (arr!47718 a!2862) j!93)))))

(declare-fun b!1467082 () Bool)

(declare-fun e!824116 () Bool)

(assert (=> b!1467082 (= e!824116 e!824118)))

(declare-fun res!995668 () Bool)

(assert (=> b!1467082 (=> (not res!995668) (not e!824118))))

(assert (=> b!1467082 (= res!995668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47718 a!2862) j!93) mask!2687) (select (arr!47718 a!2862) j!93) a!2862 mask!2687) lt!641988))))

(assert (=> b!1467082 (= lt!641988 (Intermediate!11970 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467083 () Bool)

(assert (=> b!1467083 (= e!824120 (= lt!641983 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641987 lt!641986 mask!2687)))))

(declare-fun b!1467084 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98860 (_ BitVec 32)) SeekEntryResult!11970)

(assert (=> b!1467084 (= e!824117 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641985 intermediateAfterIndex!19 lt!641987 lt!641986 mask!2687) (seekEntryOrOpen!0 lt!641987 lt!641986 mask!2687))))))

(declare-fun b!1467085 () Bool)

(assert (=> b!1467085 (= e!824113 true)))

(assert (=> b!1467085 (= lt!641984 (seekEntryOrOpen!0 lt!641987 lt!641986 mask!2687))))

(declare-fun lt!641982 () Unit!49436)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49436)

(assert (=> b!1467085 (= lt!641982 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641985 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467086 () Bool)

(assert (=> b!1467086 (= e!824120 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641987 lt!641986 mask!2687) (seekEntryOrOpen!0 lt!641987 lt!641986 mask!2687)))))

(declare-fun b!1467087 () Bool)

(assert (=> b!1467087 (= e!824119 e!824116)))

(declare-fun res!995673 () Bool)

(assert (=> b!1467087 (=> (not res!995673) (not e!824116))))

(assert (=> b!1467087 (= res!995673 (= (select (store (arr!47718 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467087 (= lt!641986 (array!98861 (store (arr!47718 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48268 a!2862)))))

(declare-fun b!1467088 () Bool)

(declare-fun res!995672 () Bool)

(assert (=> b!1467088 (=> (not res!995672) (not e!824119))))

(assert (=> b!1467088 (= res!995672 (and (= (size!48268 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48268 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48268 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467089 () Bool)

(declare-fun res!995661 () Bool)

(assert (=> b!1467089 (=> res!995661 e!824113)))

(assert (=> b!1467089 (= res!995661 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467090 () Bool)

(declare-fun res!995665 () Bool)

(assert (=> b!1467090 (=> res!995665 e!824113)))

(assert (=> b!1467090 (= res!995665 e!824117)))

(declare-fun c!135216 () Bool)

(assert (=> b!1467090 (= c!135216 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125412 res!995676) b!1467088))

(assert (= (and b!1467088 res!995672) b!1467070))

(assert (= (and b!1467070 res!995667) b!1467081))

(assert (= (and b!1467081 res!995663) b!1467079))

(assert (= (and b!1467079 res!995664) b!1467074))

(assert (= (and b!1467074 res!995677) b!1467077))

(assert (= (and b!1467077 res!995660) b!1467087))

(assert (= (and b!1467087 res!995673) b!1467082))

(assert (= (and b!1467082 res!995668) b!1467072))

(assert (= (and b!1467072 res!995675) b!1467078))

(assert (= (and b!1467078 res!995671) b!1467076))

(assert (= (and b!1467076 c!135215) b!1467083))

(assert (= (and b!1467076 (not c!135215)) b!1467086))

(assert (= (and b!1467076 res!995670) b!1467075))

(assert (= (and b!1467075 res!995674) b!1467071))

(assert (= (and b!1467071 (not res!995666)) b!1467069))

(assert (= (and b!1467069 (not res!995669)) b!1467080))

(assert (= (and b!1467080 (not res!995662)) b!1467090))

(assert (= (and b!1467090 c!135216) b!1467073))

(assert (= (and b!1467090 (not c!135216)) b!1467084))

(assert (= (and b!1467090 (not res!995665)) b!1467089))

(assert (= (and b!1467089 (not res!995661)) b!1467085))

(declare-fun m!1354003 () Bool)

(assert (=> b!1467073 m!1354003))

(declare-fun m!1354005 () Bool)

(assert (=> b!1467069 m!1354005))

(declare-fun m!1354007 () Bool)

(assert (=> b!1467078 m!1354007))

(assert (=> b!1467078 m!1354007))

(declare-fun m!1354009 () Bool)

(assert (=> b!1467078 m!1354009))

(declare-fun m!1354011 () Bool)

(assert (=> b!1467078 m!1354011))

(declare-fun m!1354013 () Bool)

(assert (=> b!1467078 m!1354013))

(declare-fun m!1354015 () Bool)

(assert (=> b!1467081 m!1354015))

(assert (=> b!1467081 m!1354015))

(declare-fun m!1354017 () Bool)

(assert (=> b!1467081 m!1354017))

(assert (=> b!1467080 m!1354015))

(assert (=> b!1467080 m!1354015))

(declare-fun m!1354019 () Bool)

(assert (=> b!1467080 m!1354019))

(declare-fun m!1354021 () Bool)

(assert (=> b!1467070 m!1354021))

(assert (=> b!1467070 m!1354021))

(declare-fun m!1354023 () Bool)

(assert (=> b!1467070 m!1354023))

(declare-fun m!1354025 () Bool)

(assert (=> b!1467071 m!1354025))

(assert (=> b!1467071 m!1354011))

(declare-fun m!1354027 () Bool)

(assert (=> b!1467071 m!1354027))

(declare-fun m!1354029 () Bool)

(assert (=> b!1467071 m!1354029))

(declare-fun m!1354031 () Bool)

(assert (=> b!1467071 m!1354031))

(assert (=> b!1467071 m!1354015))

(declare-fun m!1354033 () Bool)

(assert (=> b!1467071 m!1354033))

(declare-fun m!1354035 () Bool)

(assert (=> b!1467071 m!1354035))

(assert (=> b!1467071 m!1354015))

(declare-fun m!1354037 () Bool)

(assert (=> b!1467085 m!1354037))

(declare-fun m!1354039 () Bool)

(assert (=> b!1467085 m!1354039))

(declare-fun m!1354041 () Bool)

(assert (=> b!1467086 m!1354041))

(assert (=> b!1467086 m!1354037))

(declare-fun m!1354043 () Bool)

(assert (=> b!1467084 m!1354043))

(assert (=> b!1467084 m!1354037))

(assert (=> b!1467072 m!1354015))

(assert (=> b!1467072 m!1354015))

(declare-fun m!1354045 () Bool)

(assert (=> b!1467072 m!1354045))

(assert (=> b!1467082 m!1354015))

(assert (=> b!1467082 m!1354015))

(declare-fun m!1354047 () Bool)

(assert (=> b!1467082 m!1354047))

(assert (=> b!1467082 m!1354047))

(assert (=> b!1467082 m!1354015))

(declare-fun m!1354049 () Bool)

(assert (=> b!1467082 m!1354049))

(declare-fun m!1354051 () Bool)

(assert (=> b!1467079 m!1354051))

(declare-fun m!1354053 () Bool)

(assert (=> b!1467074 m!1354053))

(declare-fun m!1354055 () Bool)

(assert (=> b!1467083 m!1354055))

(assert (=> b!1467087 m!1354011))

(declare-fun m!1354057 () Bool)

(assert (=> b!1467087 m!1354057))

(declare-fun m!1354059 () Bool)

(assert (=> start!125412 m!1354059))

(declare-fun m!1354061 () Bool)

(assert (=> start!125412 m!1354061))

(check-sat (not b!1467086) (not b!1467070) (not b!1467073) (not b!1467085) (not b!1467080) (not b!1467078) (not b!1467074) (not b!1467082) (not start!125412) (not b!1467079) (not b!1467071) (not b!1467072) (not b!1467084) (not b!1467081) (not b!1467069) (not b!1467083))
(check-sat)
