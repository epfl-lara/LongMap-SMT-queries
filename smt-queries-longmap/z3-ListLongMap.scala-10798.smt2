; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126654 () Bool)

(assert start!126654)

(declare-fun b!1483122 () Bool)

(declare-fun res!1007360 () Bool)

(declare-fun e!831928 () Bool)

(assert (=> b!1483122 (=> (not res!1007360) (not e!831928))))

(declare-fun e!831929 () Bool)

(assert (=> b!1483122 (= res!1007360 e!831929)))

(declare-fun c!137416 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483122 (= c!137416 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483123 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!831933 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99511 0))(
  ( (array!99512 (arr!48028 (Array (_ BitVec 32) (_ BitVec 64))) (size!48579 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99511)

(assert (=> b!1483123 (= e!831933 (and (or (= (select (arr!48028 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48028 a!2862) intermediateBeforeIndex!19) (select (arr!48028 a!2862) j!93))) (or (and (= (select (arr!48028 a!2862) index!646) (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48028 a!2862) index!646) (select (arr!48028 a!2862) j!93))) (= (select (arr!48028 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun lt!647406 () array!99511)

(declare-fun lt!647409 () (_ BitVec 64))

(declare-fun b!1483124 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12165 0))(
  ( (MissingZero!12165 (index!51052 (_ BitVec 32))) (Found!12165 (index!51053 (_ BitVec 32))) (Intermediate!12165 (undefined!12977 Bool) (index!51054 (_ BitVec 32)) (x!132825 (_ BitVec 32))) (Undefined!12165) (MissingVacant!12165 (index!51055 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99511 (_ BitVec 32)) SeekEntryResult!12165)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99511 (_ BitVec 32)) SeekEntryResult!12165)

(assert (=> b!1483124 (= e!831929 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647409 lt!647406 mask!2687) (seekEntryOrOpen!0 lt!647409 lt!647406 mask!2687)))))

(declare-fun res!1007362 () Bool)

(declare-fun e!831930 () Bool)

(assert (=> start!126654 (=> (not res!1007362) (not e!831930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126654 (= res!1007362 (validMask!0 mask!2687))))

(assert (=> start!126654 e!831930))

(assert (=> start!126654 true))

(declare-fun array_inv!37309 (array!99511) Bool)

(assert (=> start!126654 (array_inv!37309 a!2862)))

(declare-fun b!1483125 () Bool)

(assert (=> b!1483125 (= e!831928 (not (or (and (= (select (arr!48028 a!2862) index!646) (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48028 a!2862) index!646) (select (arr!48028 a!2862) j!93))) (= (select (arr!48028 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1483125 e!831933))

(declare-fun res!1007361 () Bool)

(assert (=> b!1483125 (=> (not res!1007361) (not e!831933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99511 (_ BitVec 32)) Bool)

(assert (=> b!1483125 (= res!1007361 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49703 0))(
  ( (Unit!49704) )
))
(declare-fun lt!647410 () Unit!49703)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49703)

(assert (=> b!1483125 (= lt!647410 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483126 () Bool)

(declare-fun res!1007358 () Bool)

(assert (=> b!1483126 (=> (not res!1007358) (not e!831930))))

(declare-datatypes ((List!34516 0))(
  ( (Nil!34513) (Cons!34512 (h!35897 (_ BitVec 64)) (t!49202 List!34516)) )
))
(declare-fun arrayNoDuplicates!0 (array!99511 (_ BitVec 32) List!34516) Bool)

(assert (=> b!1483126 (= res!1007358 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34513))))

(declare-fun b!1483127 () Bool)

(declare-fun res!1007365 () Bool)

(assert (=> b!1483127 (=> (not res!1007365) (not e!831930))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483127 (= res!1007365 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48579 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48579 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48579 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483128 () Bool)

(declare-fun res!1007359 () Bool)

(assert (=> b!1483128 (=> (not res!1007359) (not e!831930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483128 (= res!1007359 (validKeyInArray!0 (select (arr!48028 a!2862) j!93)))))

(declare-fun b!1483129 () Bool)

(declare-fun res!1007363 () Bool)

(declare-fun e!831927 () Bool)

(assert (=> b!1483129 (=> (not res!1007363) (not e!831927))))

(declare-fun lt!647408 () SeekEntryResult!12165)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99511 (_ BitVec 32)) SeekEntryResult!12165)

(assert (=> b!1483129 (= res!1007363 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48028 a!2862) j!93) a!2862 mask!2687) lt!647408))))

(declare-fun b!1483130 () Bool)

(declare-fun res!1007352 () Bool)

(assert (=> b!1483130 (=> (not res!1007352) (not e!831930))))

(assert (=> b!1483130 (= res!1007352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483131 () Bool)

(declare-fun e!831931 () Bool)

(assert (=> b!1483131 (= e!831931 e!831927)))

(declare-fun res!1007357 () Bool)

(assert (=> b!1483131 (=> (not res!1007357) (not e!831927))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483131 (= res!1007357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48028 a!2862) j!93) mask!2687) (select (arr!48028 a!2862) j!93) a!2862 mask!2687) lt!647408))))

(assert (=> b!1483131 (= lt!647408 (Intermediate!12165 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483132 () Bool)

(declare-fun res!1007356 () Bool)

(assert (=> b!1483132 (=> (not res!1007356) (not e!831930))))

(assert (=> b!1483132 (= res!1007356 (validKeyInArray!0 (select (arr!48028 a!2862) i!1006)))))

(declare-fun b!1483133 () Bool)

(declare-fun lt!647407 () SeekEntryResult!12165)

(assert (=> b!1483133 (= e!831929 (= lt!647407 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647409 lt!647406 mask!2687)))))

(declare-fun b!1483134 () Bool)

(assert (=> b!1483134 (= e!831930 e!831931)))

(declare-fun res!1007354 () Bool)

(assert (=> b!1483134 (=> (not res!1007354) (not e!831931))))

(assert (=> b!1483134 (= res!1007354 (= (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483134 (= lt!647406 (array!99512 (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48579 a!2862)))))

(declare-fun b!1483135 () Bool)

(declare-fun res!1007366 () Bool)

(assert (=> b!1483135 (=> (not res!1007366) (not e!831928))))

(assert (=> b!1483135 (= res!1007366 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483136 () Bool)

(declare-fun res!1007353 () Bool)

(assert (=> b!1483136 (=> (not res!1007353) (not e!831933))))

(assert (=> b!1483136 (= res!1007353 (= (seekEntryOrOpen!0 (select (arr!48028 a!2862) j!93) a!2862 mask!2687) (Found!12165 j!93)))))

(declare-fun b!1483137 () Bool)

(declare-fun res!1007355 () Bool)

(assert (=> b!1483137 (=> (not res!1007355) (not e!831930))))

(assert (=> b!1483137 (= res!1007355 (and (= (size!48579 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48579 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48579 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483138 () Bool)

(assert (=> b!1483138 (= e!831927 e!831928)))

(declare-fun res!1007364 () Bool)

(assert (=> b!1483138 (=> (not res!1007364) (not e!831928))))

(assert (=> b!1483138 (= res!1007364 (= lt!647407 (Intermediate!12165 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483138 (= lt!647407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647409 mask!2687) lt!647409 lt!647406 mask!2687))))

(assert (=> b!1483138 (= lt!647409 (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126654 res!1007362) b!1483137))

(assert (= (and b!1483137 res!1007355) b!1483132))

(assert (= (and b!1483132 res!1007356) b!1483128))

(assert (= (and b!1483128 res!1007359) b!1483130))

(assert (= (and b!1483130 res!1007352) b!1483126))

(assert (= (and b!1483126 res!1007358) b!1483127))

(assert (= (and b!1483127 res!1007365) b!1483134))

(assert (= (and b!1483134 res!1007354) b!1483131))

(assert (= (and b!1483131 res!1007357) b!1483129))

(assert (= (and b!1483129 res!1007363) b!1483138))

(assert (= (and b!1483138 res!1007364) b!1483122))

(assert (= (and b!1483122 c!137416) b!1483133))

(assert (= (and b!1483122 (not c!137416)) b!1483124))

(assert (= (and b!1483122 res!1007360) b!1483135))

(assert (= (and b!1483135 res!1007366) b!1483125))

(assert (= (and b!1483125 res!1007361) b!1483136))

(assert (= (and b!1483136 res!1007353) b!1483123))

(declare-fun m!1368841 () Bool)

(assert (=> b!1483131 m!1368841))

(assert (=> b!1483131 m!1368841))

(declare-fun m!1368843 () Bool)

(assert (=> b!1483131 m!1368843))

(assert (=> b!1483131 m!1368843))

(assert (=> b!1483131 m!1368841))

(declare-fun m!1368845 () Bool)

(assert (=> b!1483131 m!1368845))

(assert (=> b!1483136 m!1368841))

(assert (=> b!1483136 m!1368841))

(declare-fun m!1368847 () Bool)

(assert (=> b!1483136 m!1368847))

(declare-fun m!1368849 () Bool)

(assert (=> b!1483130 m!1368849))

(declare-fun m!1368851 () Bool)

(assert (=> b!1483125 m!1368851))

(declare-fun m!1368853 () Bool)

(assert (=> b!1483125 m!1368853))

(declare-fun m!1368855 () Bool)

(assert (=> b!1483125 m!1368855))

(declare-fun m!1368857 () Bool)

(assert (=> b!1483125 m!1368857))

(declare-fun m!1368859 () Bool)

(assert (=> b!1483125 m!1368859))

(assert (=> b!1483125 m!1368841))

(declare-fun m!1368861 () Bool)

(assert (=> b!1483138 m!1368861))

(assert (=> b!1483138 m!1368861))

(declare-fun m!1368863 () Bool)

(assert (=> b!1483138 m!1368863))

(assert (=> b!1483138 m!1368853))

(declare-fun m!1368865 () Bool)

(assert (=> b!1483138 m!1368865))

(declare-fun m!1368867 () Bool)

(assert (=> b!1483132 m!1368867))

(assert (=> b!1483132 m!1368867))

(declare-fun m!1368869 () Bool)

(assert (=> b!1483132 m!1368869))

(declare-fun m!1368871 () Bool)

(assert (=> b!1483126 m!1368871))

(assert (=> b!1483129 m!1368841))

(assert (=> b!1483129 m!1368841))

(declare-fun m!1368873 () Bool)

(assert (=> b!1483129 m!1368873))

(assert (=> b!1483123 m!1368853))

(declare-fun m!1368875 () Bool)

(assert (=> b!1483123 m!1368875))

(assert (=> b!1483123 m!1368855))

(assert (=> b!1483123 m!1368857))

(assert (=> b!1483123 m!1368841))

(assert (=> b!1483128 m!1368841))

(assert (=> b!1483128 m!1368841))

(declare-fun m!1368877 () Bool)

(assert (=> b!1483128 m!1368877))

(declare-fun m!1368879 () Bool)

(assert (=> start!126654 m!1368879))

(declare-fun m!1368881 () Bool)

(assert (=> start!126654 m!1368881))

(assert (=> b!1483134 m!1368853))

(declare-fun m!1368883 () Bool)

(assert (=> b!1483134 m!1368883))

(declare-fun m!1368885 () Bool)

(assert (=> b!1483133 m!1368885))

(declare-fun m!1368887 () Bool)

(assert (=> b!1483124 m!1368887))

(declare-fun m!1368889 () Bool)

(assert (=> b!1483124 m!1368889))

(check-sat (not b!1483132) (not b!1483138) (not b!1483126) (not b!1483128) (not b!1483136) (not b!1483125) (not b!1483131) (not start!126654) (not b!1483130) (not b!1483129) (not b!1483124) (not b!1483133))
(check-sat)
