; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126404 () Bool)

(assert start!126404)

(declare-fun b!1482129 () Bool)

(declare-fun e!831164 () Bool)

(declare-fun e!831162 () Bool)

(assert (=> b!1482129 (= e!831164 e!831162)))

(declare-fun res!1007383 () Bool)

(assert (=> b!1482129 (=> (not res!1007383) (not e!831162))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12229 0))(
  ( (MissingZero!12229 (index!51308 (_ BitVec 32))) (Found!12229 (index!51309 (_ BitVec 32))) (Intermediate!12229 (undefined!13041 Bool) (index!51310 (_ BitVec 32)) (x!132888 (_ BitVec 32))) (Undefined!12229) (MissingVacant!12229 (index!51311 (_ BitVec 32))) )
))
(declare-fun lt!646983 () SeekEntryResult!12229)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482129 (= res!1007383 (= lt!646983 (Intermediate!12229 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99423 0))(
  ( (array!99424 (arr!47989 (Array (_ BitVec 32) (_ BitVec 64))) (size!48539 (_ BitVec 32))) )
))
(declare-fun lt!646980 () array!99423)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!646979 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99423 (_ BitVec 32)) SeekEntryResult!12229)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482129 (= lt!646983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646979 mask!2687) lt!646979 lt!646980 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99423)

(assert (=> b!1482129 (= lt!646979 (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482130 () Bool)

(declare-fun e!831161 () Bool)

(assert (=> b!1482130 (= e!831161 e!831164)))

(declare-fun res!1007375 () Bool)

(assert (=> b!1482130 (=> (not res!1007375) (not e!831164))))

(declare-fun lt!646981 () SeekEntryResult!12229)

(assert (=> b!1482130 (= res!1007375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47989 a!2862) j!93) mask!2687) (select (arr!47989 a!2862) j!93) a!2862 mask!2687) lt!646981))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482130 (= lt!646981 (Intermediate!12229 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482131 () Bool)

(declare-fun e!831159 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99423 (_ BitVec 32)) SeekEntryResult!12229)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99423 (_ BitVec 32)) SeekEntryResult!12229)

(assert (=> b!1482131 (= e!831159 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646979 lt!646980 mask!2687) (seekEntryOrOpen!0 lt!646979 lt!646980 mask!2687)))))

(declare-fun b!1482132 () Bool)

(declare-fun res!1007374 () Bool)

(declare-fun e!831158 () Bool)

(assert (=> b!1482132 (=> (not res!1007374) (not e!831158))))

(assert (=> b!1482132 (= res!1007374 (and (= (size!48539 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48539 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48539 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482133 () Bool)

(declare-fun res!1007373 () Bool)

(assert (=> b!1482133 (=> (not res!1007373) (not e!831162))))

(assert (=> b!1482133 (= res!1007373 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482134 () Bool)

(declare-fun res!1007381 () Bool)

(assert (=> b!1482134 (=> (not res!1007381) (not e!831164))))

(assert (=> b!1482134 (= res!1007381 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47989 a!2862) j!93) a!2862 mask!2687) lt!646981))))

(declare-fun b!1482135 () Bool)

(declare-fun res!1007385 () Bool)

(assert (=> b!1482135 (=> (not res!1007385) (not e!831158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482135 (= res!1007385 (validKeyInArray!0 (select (arr!47989 a!2862) j!93)))))

(declare-fun b!1482136 () Bool)

(declare-fun res!1007386 () Bool)

(declare-fun e!831160 () Bool)

(assert (=> b!1482136 (=> (not res!1007386) (not e!831160))))

(assert (=> b!1482136 (= res!1007386 (= (seekEntryOrOpen!0 (select (arr!47989 a!2862) j!93) a!2862 mask!2687) (Found!12229 j!93)))))

(declare-fun b!1482137 () Bool)

(declare-fun res!1007382 () Bool)

(assert (=> b!1482137 (=> (not res!1007382) (not e!831162))))

(assert (=> b!1482137 (= res!1007382 e!831159)))

(declare-fun c!136899 () Bool)

(assert (=> b!1482137 (= c!136899 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482138 () Bool)

(assert (=> b!1482138 (= e!831158 e!831161)))

(declare-fun res!1007380 () Bool)

(assert (=> b!1482138 (=> (not res!1007380) (not e!831161))))

(assert (=> b!1482138 (= res!1007380 (= (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482138 (= lt!646980 (array!99424 (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48539 a!2862)))))

(declare-fun b!1482139 () Bool)

(declare-fun res!1007378 () Bool)

(assert (=> b!1482139 (=> (not res!1007378) (not e!831158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99423 (_ BitVec 32)) Bool)

(assert (=> b!1482139 (= res!1007378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482140 () Bool)

(declare-fun res!1007372 () Bool)

(assert (=> b!1482140 (=> (not res!1007372) (not e!831158))))

(assert (=> b!1482140 (= res!1007372 (validKeyInArray!0 (select (arr!47989 a!2862) i!1006)))))

(declare-fun b!1482128 () Bool)

(assert (=> b!1482128 (= e!831160 (and (or (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47989 a!2862) intermediateBeforeIndex!19) (select (arr!47989 a!2862) j!93))) (or (and (= (select (arr!47989 a!2862) index!646) (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47989 a!2862) index!646) (select (arr!47989 a!2862) j!93))) (= (select (arr!47989 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47989 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!1007384 () Bool)

(assert (=> start!126404 (=> (not res!1007384) (not e!831158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126404 (= res!1007384 (validMask!0 mask!2687))))

(assert (=> start!126404 e!831158))

(assert (=> start!126404 true))

(declare-fun array_inv!37017 (array!99423) Bool)

(assert (=> start!126404 (array_inv!37017 a!2862)))

(declare-fun b!1482141 () Bool)

(declare-fun res!1007377 () Bool)

(assert (=> b!1482141 (=> (not res!1007377) (not e!831158))))

(declare-datatypes ((List!34490 0))(
  ( (Nil!34487) (Cons!34486 (h!35857 (_ BitVec 64)) (t!49184 List!34490)) )
))
(declare-fun arrayNoDuplicates!0 (array!99423 (_ BitVec 32) List!34490) Bool)

(assert (=> b!1482141 (= res!1007377 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34487))))

(declare-fun b!1482142 () Bool)

(assert (=> b!1482142 (= e!831159 (= lt!646983 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646979 lt!646980 mask!2687)))))

(declare-fun b!1482143 () Bool)

(declare-fun res!1007376 () Bool)

(assert (=> b!1482143 (=> (not res!1007376) (not e!831158))))

(assert (=> b!1482143 (= res!1007376 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48539 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48539 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48539 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482144 () Bool)

(assert (=> b!1482144 (= e!831162 (not true))))

(assert (=> b!1482144 e!831160))

(declare-fun res!1007379 () Bool)

(assert (=> b!1482144 (=> (not res!1007379) (not e!831160))))

(assert (=> b!1482144 (= res!1007379 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49798 0))(
  ( (Unit!49799) )
))
(declare-fun lt!646982 () Unit!49798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49798)

(assert (=> b!1482144 (= lt!646982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126404 res!1007384) b!1482132))

(assert (= (and b!1482132 res!1007374) b!1482140))

(assert (= (and b!1482140 res!1007372) b!1482135))

(assert (= (and b!1482135 res!1007385) b!1482139))

(assert (= (and b!1482139 res!1007378) b!1482141))

(assert (= (and b!1482141 res!1007377) b!1482143))

(assert (= (and b!1482143 res!1007376) b!1482138))

(assert (= (and b!1482138 res!1007380) b!1482130))

(assert (= (and b!1482130 res!1007375) b!1482134))

(assert (= (and b!1482134 res!1007381) b!1482129))

(assert (= (and b!1482129 res!1007383) b!1482137))

(assert (= (and b!1482137 c!136899) b!1482142))

(assert (= (and b!1482137 (not c!136899)) b!1482131))

(assert (= (and b!1482137 res!1007382) b!1482133))

(assert (= (and b!1482133 res!1007373) b!1482144))

(assert (= (and b!1482144 res!1007379) b!1482136))

(assert (= (and b!1482136 res!1007386) b!1482128))

(declare-fun m!1367855 () Bool)

(assert (=> b!1482144 m!1367855))

(declare-fun m!1367857 () Bool)

(assert (=> b!1482144 m!1367857))

(declare-fun m!1367859 () Bool)

(assert (=> start!126404 m!1367859))

(declare-fun m!1367861 () Bool)

(assert (=> start!126404 m!1367861))

(declare-fun m!1367863 () Bool)

(assert (=> b!1482130 m!1367863))

(assert (=> b!1482130 m!1367863))

(declare-fun m!1367865 () Bool)

(assert (=> b!1482130 m!1367865))

(assert (=> b!1482130 m!1367865))

(assert (=> b!1482130 m!1367863))

(declare-fun m!1367867 () Bool)

(assert (=> b!1482130 m!1367867))

(assert (=> b!1482134 m!1367863))

(assert (=> b!1482134 m!1367863))

(declare-fun m!1367869 () Bool)

(assert (=> b!1482134 m!1367869))

(declare-fun m!1367871 () Bool)

(assert (=> b!1482129 m!1367871))

(assert (=> b!1482129 m!1367871))

(declare-fun m!1367873 () Bool)

(assert (=> b!1482129 m!1367873))

(declare-fun m!1367875 () Bool)

(assert (=> b!1482129 m!1367875))

(declare-fun m!1367877 () Bool)

(assert (=> b!1482129 m!1367877))

(assert (=> b!1482136 m!1367863))

(assert (=> b!1482136 m!1367863))

(declare-fun m!1367879 () Bool)

(assert (=> b!1482136 m!1367879))

(declare-fun m!1367881 () Bool)

(assert (=> b!1482131 m!1367881))

(declare-fun m!1367883 () Bool)

(assert (=> b!1482131 m!1367883))

(declare-fun m!1367885 () Bool)

(assert (=> b!1482141 m!1367885))

(declare-fun m!1367887 () Bool)

(assert (=> b!1482139 m!1367887))

(declare-fun m!1367889 () Bool)

(assert (=> b!1482142 m!1367889))

(assert (=> b!1482135 m!1367863))

(assert (=> b!1482135 m!1367863))

(declare-fun m!1367891 () Bool)

(assert (=> b!1482135 m!1367891))

(assert (=> b!1482138 m!1367875))

(declare-fun m!1367893 () Bool)

(assert (=> b!1482138 m!1367893))

(assert (=> b!1482128 m!1367875))

(declare-fun m!1367895 () Bool)

(assert (=> b!1482128 m!1367895))

(declare-fun m!1367897 () Bool)

(assert (=> b!1482128 m!1367897))

(declare-fun m!1367899 () Bool)

(assert (=> b!1482128 m!1367899))

(assert (=> b!1482128 m!1367863))

(declare-fun m!1367901 () Bool)

(assert (=> b!1482140 m!1367901))

(assert (=> b!1482140 m!1367901))

(declare-fun m!1367903 () Bool)

(assert (=> b!1482140 m!1367903))

(push 1)

