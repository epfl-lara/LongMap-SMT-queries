; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124954 () Bool)

(assert start!124954)

(declare-fun b!1452971 () Bool)

(declare-fun res!984137 () Bool)

(declare-fun e!817832 () Bool)

(assert (=> b!1452971 (=> (not res!984137) (not e!817832))))

(declare-fun e!817839 () Bool)

(assert (=> b!1452971 (= res!984137 e!817839)))

(declare-fun c!133936 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452971 (= c!133936 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452972 () Bool)

(declare-fun res!984127 () Bool)

(declare-fun e!817837 () Bool)

(assert (=> b!1452972 (=> (not res!984127) (not e!817837))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98380 0))(
  ( (array!98381 (arr!47479 (Array (_ BitVec 32) (_ BitVec 64))) (size!48031 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98380)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452972 (= res!984127 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48031 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48031 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48031 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452973 () Bool)

(declare-fun res!984135 () Bool)

(declare-fun e!817834 () Bool)

(assert (=> b!1452973 (=> (not res!984135) (not e!817834))))

(declare-datatypes ((SeekEntryResult!11756 0))(
  ( (MissingZero!11756 (index!49416 (_ BitVec 32))) (Found!11756 (index!49417 (_ BitVec 32))) (Intermediate!11756 (undefined!12568 Bool) (index!49418 (_ BitVec 32)) (x!131056 (_ BitVec 32))) (Undefined!11756) (MissingVacant!11756 (index!49419 (_ BitVec 32))) )
))
(declare-fun lt!636926 () SeekEntryResult!11756)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98380 (_ BitVec 32)) SeekEntryResult!11756)

(assert (=> b!1452973 (= res!984135 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47479 a!2862) j!93) a!2862 mask!2687) lt!636926))))

(declare-fun b!1452974 () Bool)

(declare-fun res!984138 () Bool)

(assert (=> b!1452974 (=> (not res!984138) (not e!817837))))

(declare-datatypes ((List!34058 0))(
  ( (Nil!34055) (Cons!34054 (h!35404 (_ BitVec 64)) (t!48744 List!34058)) )
))
(declare-fun arrayNoDuplicates!0 (array!98380 (_ BitVec 32) List!34058) Bool)

(assert (=> b!1452974 (= res!984138 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34055))))

(declare-fun b!1452975 () Bool)

(declare-fun res!984128 () Bool)

(assert (=> b!1452975 (=> (not res!984128) (not e!817832))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452975 (= res!984128 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452976 () Bool)

(declare-fun res!984129 () Bool)

(assert (=> b!1452976 (=> (not res!984129) (not e!817837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98380 (_ BitVec 32)) Bool)

(assert (=> b!1452976 (= res!984129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452977 () Bool)

(assert (=> b!1452977 (= e!817832 (not (or (and (= (select (arr!47479 a!2862) index!646) (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47479 a!2862) index!646) (select (arr!47479 a!2862) j!93))) (= (select (arr!47479 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817838 () Bool)

(assert (=> b!1452977 e!817838))

(declare-fun res!984130 () Bool)

(assert (=> b!1452977 (=> (not res!984130) (not e!817838))))

(assert (=> b!1452977 (= res!984130 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48849 0))(
  ( (Unit!48850) )
))
(declare-fun lt!636925 () Unit!48849)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48849)

(assert (=> b!1452977 (= lt!636925 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452978 () Bool)

(declare-fun e!817836 () Bool)

(assert (=> b!1452978 (= e!817837 e!817836)))

(declare-fun res!984134 () Bool)

(assert (=> b!1452978 (=> (not res!984134) (not e!817836))))

(assert (=> b!1452978 (= res!984134 (= (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636923 () array!98380)

(assert (=> b!1452978 (= lt!636923 (array!98381 (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48031 a!2862)))))

(declare-fun b!1452979 () Bool)

(declare-fun e!817831 () Bool)

(assert (=> b!1452979 (= e!817838 e!817831)))

(declare-fun res!984142 () Bool)

(assert (=> b!1452979 (=> res!984142 e!817831)))

(declare-fun lt!636927 () (_ BitVec 64))

(assert (=> b!1452979 (= res!984142 (or (and (= (select (arr!47479 a!2862) index!646) lt!636927) (= (select (arr!47479 a!2862) index!646) (select (arr!47479 a!2862) j!93))) (= (select (arr!47479 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1452979 (= lt!636927 (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1452980 () Bool)

(declare-fun lt!636924 () (_ BitVec 64))

(declare-fun lt!636922 () SeekEntryResult!11756)

(assert (=> b!1452980 (= e!817839 (= lt!636922 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636924 lt!636923 mask!2687)))))

(declare-fun b!1452981 () Bool)

(assert (=> b!1452981 (= e!817834 e!817832)))

(declare-fun res!984125 () Bool)

(assert (=> b!1452981 (=> (not res!984125) (not e!817832))))

(assert (=> b!1452981 (= res!984125 (= lt!636922 (Intermediate!11756 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452981 (= lt!636922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636924 mask!2687) lt!636924 lt!636923 mask!2687))))

(assert (=> b!1452981 (= lt!636924 (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452982 () Bool)

(assert (=> b!1452982 (= e!817836 e!817834)))

(declare-fun res!984141 () Bool)

(assert (=> b!1452982 (=> (not res!984141) (not e!817834))))

(assert (=> b!1452982 (= res!984141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47479 a!2862) j!93) mask!2687) (select (arr!47479 a!2862) j!93) a!2862 mask!2687) lt!636926))))

(assert (=> b!1452982 (= lt!636926 (Intermediate!11756 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452983 () Bool)

(declare-fun res!984132 () Bool)

(assert (=> b!1452983 (=> (not res!984132) (not e!817837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452983 (= res!984132 (validKeyInArray!0 (select (arr!47479 a!2862) j!93)))))

(declare-fun b!1452984 () Bool)

(declare-fun e!817833 () Bool)

(assert (=> b!1452984 (= e!817831 e!817833)))

(declare-fun res!984140 () Bool)

(assert (=> b!1452984 (=> (not res!984140) (not e!817833))))

(assert (=> b!1452984 (= res!984140 (and (= index!646 intermediateAfterIndex!19) (= lt!636927 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1452985 () Bool)

(declare-fun res!984131 () Bool)

(assert (=> b!1452985 (=> (not res!984131) (not e!817837))))

(assert (=> b!1452985 (= res!984131 (validKeyInArray!0 (select (arr!47479 a!2862) i!1006)))))

(declare-fun b!1452986 () Bool)

(declare-fun res!984133 () Bool)

(assert (=> b!1452986 (=> (not res!984133) (not e!817837))))

(assert (=> b!1452986 (= res!984133 (and (= (size!48031 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48031 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48031 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452987 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98380 (_ BitVec 32)) SeekEntryResult!11756)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98380 (_ BitVec 32)) SeekEntryResult!11756)

(assert (=> b!1452987 (= e!817839 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636924 lt!636923 mask!2687) (seekEntryOrOpen!0 lt!636924 lt!636923 mask!2687)))))

(declare-fun b!1452988 () Bool)

(declare-fun res!984139 () Bool)

(assert (=> b!1452988 (=> (not res!984139) (not e!817838))))

(assert (=> b!1452988 (= res!984139 (or (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) (select (arr!47479 a!2862) j!93))))))

(declare-fun res!984136 () Bool)

(assert (=> start!124954 (=> (not res!984136) (not e!817837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124954 (= res!984136 (validMask!0 mask!2687))))

(assert (=> start!124954 e!817837))

(assert (=> start!124954 true))

(declare-fun array_inv!36712 (array!98380) Bool)

(assert (=> start!124954 (array_inv!36712 a!2862)))

(declare-fun b!1452989 () Bool)

(assert (=> b!1452989 (= e!817833 (= (seekEntryOrOpen!0 lt!636924 lt!636923 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636924 lt!636923 mask!2687)))))

(declare-fun b!1452990 () Bool)

(declare-fun res!984126 () Bool)

(assert (=> b!1452990 (=> (not res!984126) (not e!817838))))

(assert (=> b!1452990 (= res!984126 (= (seekEntryOrOpen!0 (select (arr!47479 a!2862) j!93) a!2862 mask!2687) (Found!11756 j!93)))))

(assert (= (and start!124954 res!984136) b!1452986))

(assert (= (and b!1452986 res!984133) b!1452985))

(assert (= (and b!1452985 res!984131) b!1452983))

(assert (= (and b!1452983 res!984132) b!1452976))

(assert (= (and b!1452976 res!984129) b!1452974))

(assert (= (and b!1452974 res!984138) b!1452972))

(assert (= (and b!1452972 res!984127) b!1452978))

(assert (= (and b!1452978 res!984134) b!1452982))

(assert (= (and b!1452982 res!984141) b!1452973))

(assert (= (and b!1452973 res!984135) b!1452981))

(assert (= (and b!1452981 res!984125) b!1452971))

(assert (= (and b!1452971 c!133936) b!1452980))

(assert (= (and b!1452971 (not c!133936)) b!1452987))

(assert (= (and b!1452971 res!984137) b!1452975))

(assert (= (and b!1452975 res!984128) b!1452977))

(assert (= (and b!1452977 res!984130) b!1452990))

(assert (= (and b!1452990 res!984126) b!1452988))

(assert (= (and b!1452988 res!984139) b!1452979))

(assert (= (and b!1452979 (not res!984142)) b!1452984))

(assert (= (and b!1452984 res!984140) b!1452989))

(declare-fun m!1341015 () Bool)

(assert (=> b!1452974 m!1341015))

(declare-fun m!1341017 () Bool)

(assert (=> b!1452983 m!1341017))

(assert (=> b!1452983 m!1341017))

(declare-fun m!1341019 () Bool)

(assert (=> b!1452983 m!1341019))

(declare-fun m!1341021 () Bool)

(assert (=> b!1452987 m!1341021))

(declare-fun m!1341023 () Bool)

(assert (=> b!1452987 m!1341023))

(assert (=> b!1452973 m!1341017))

(assert (=> b!1452973 m!1341017))

(declare-fun m!1341025 () Bool)

(assert (=> b!1452973 m!1341025))

(declare-fun m!1341027 () Bool)

(assert (=> b!1452979 m!1341027))

(assert (=> b!1452979 m!1341017))

(declare-fun m!1341029 () Bool)

(assert (=> b!1452979 m!1341029))

(declare-fun m!1341031 () Bool)

(assert (=> b!1452979 m!1341031))

(assert (=> b!1452990 m!1341017))

(assert (=> b!1452990 m!1341017))

(declare-fun m!1341033 () Bool)

(assert (=> b!1452990 m!1341033))

(assert (=> b!1452989 m!1341023))

(assert (=> b!1452989 m!1341021))

(declare-fun m!1341035 () Bool)

(assert (=> b!1452985 m!1341035))

(assert (=> b!1452985 m!1341035))

(declare-fun m!1341037 () Bool)

(assert (=> b!1452985 m!1341037))

(declare-fun m!1341039 () Bool)

(assert (=> b!1452977 m!1341039))

(assert (=> b!1452977 m!1341029))

(assert (=> b!1452977 m!1341031))

(assert (=> b!1452977 m!1341027))

(declare-fun m!1341041 () Bool)

(assert (=> b!1452977 m!1341041))

(assert (=> b!1452977 m!1341017))

(assert (=> b!1452982 m!1341017))

(assert (=> b!1452982 m!1341017))

(declare-fun m!1341043 () Bool)

(assert (=> b!1452982 m!1341043))

(assert (=> b!1452982 m!1341043))

(assert (=> b!1452982 m!1341017))

(declare-fun m!1341045 () Bool)

(assert (=> b!1452982 m!1341045))

(declare-fun m!1341047 () Bool)

(assert (=> b!1452976 m!1341047))

(assert (=> b!1452978 m!1341029))

(declare-fun m!1341049 () Bool)

(assert (=> b!1452978 m!1341049))

(declare-fun m!1341051 () Bool)

(assert (=> b!1452981 m!1341051))

(assert (=> b!1452981 m!1341051))

(declare-fun m!1341053 () Bool)

(assert (=> b!1452981 m!1341053))

(assert (=> b!1452981 m!1341029))

(declare-fun m!1341055 () Bool)

(assert (=> b!1452981 m!1341055))

(declare-fun m!1341057 () Bool)

(assert (=> b!1452988 m!1341057))

(assert (=> b!1452988 m!1341017))

(declare-fun m!1341059 () Bool)

(assert (=> b!1452980 m!1341059))

(declare-fun m!1341061 () Bool)

(assert (=> start!124954 m!1341061))

(declare-fun m!1341063 () Bool)

(assert (=> start!124954 m!1341063))

(check-sat (not b!1452981) (not b!1452980) (not b!1452982) (not b!1452974) (not b!1452976) (not b!1452985) (not b!1452987) (not b!1452977) (not b!1452983) (not b!1452989) (not start!124954) (not b!1452973) (not b!1452990))
(check-sat)
