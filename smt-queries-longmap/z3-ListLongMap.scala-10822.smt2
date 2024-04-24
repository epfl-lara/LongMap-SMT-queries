; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126924 () Bool)

(assert start!126924)

(declare-fun b!1488149 () Bool)

(declare-fun res!1011409 () Bool)

(declare-fun e!834341 () Bool)

(assert (=> b!1488149 (=> (not res!1011409) (not e!834341))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99661 0))(
  ( (array!99662 (arr!48100 (Array (_ BitVec 32) (_ BitVec 64))) (size!48651 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99661)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488149 (= res!1011409 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48651 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48651 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48651 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488150 () Bool)

(declare-fun e!834337 () Bool)

(assert (=> b!1488150 (= e!834337 true)))

(declare-fun lt!649110 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488150 (= lt!649110 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1488151 () Bool)

(declare-fun res!1011407 () Bool)

(declare-fun e!834339 () Bool)

(assert (=> b!1488151 (=> (not res!1011407) (not e!834339))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12237 0))(
  ( (MissingZero!12237 (index!51340 (_ BitVec 32))) (Found!12237 (index!51341 (_ BitVec 32))) (Intermediate!12237 (undefined!13049 Bool) (index!51342 (_ BitVec 32)) (x!133110 (_ BitVec 32))) (Undefined!12237) (MissingVacant!12237 (index!51343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99661 (_ BitVec 32)) SeekEntryResult!12237)

(assert (=> b!1488151 (= res!1011407 (= (seekEntryOrOpen!0 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) (Found!12237 j!93)))))

(declare-fun lt!649109 () SeekEntryResult!12237)

(declare-fun lt!649111 () array!99661)

(declare-fun b!1488152 () Bool)

(declare-fun e!834344 () Bool)

(declare-fun lt!649107 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99661 (_ BitVec 32)) SeekEntryResult!12237)

(assert (=> b!1488152 (= e!834344 (= lt!649109 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649107 lt!649111 mask!2687)))))

(declare-fun b!1488154 () Bool)

(declare-fun res!1011413 () Bool)

(declare-fun e!834345 () Bool)

(assert (=> b!1488154 (=> (not res!1011413) (not e!834345))))

(assert (=> b!1488154 (= res!1011413 e!834344)))

(declare-fun c!137908 () Bool)

(assert (=> b!1488154 (= c!137908 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488155 () Bool)

(declare-fun e!834340 () Bool)

(assert (=> b!1488155 (= e!834339 e!834340)))

(declare-fun res!1011414 () Bool)

(assert (=> b!1488155 (=> res!1011414 e!834340)))

(declare-fun lt!649108 () (_ BitVec 64))

(assert (=> b!1488155 (= res!1011414 (or (and (= (select (arr!48100 a!2862) index!646) lt!649108) (= (select (arr!48100 a!2862) index!646) (select (arr!48100 a!2862) j!93))) (= (select (arr!48100 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488155 (= lt!649108 (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1488156 () Bool)

(declare-fun e!834336 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99661 (_ BitVec 32)) SeekEntryResult!12237)

(assert (=> b!1488156 (= e!834336 (= (seekEntryOrOpen!0 lt!649107 lt!649111 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649107 lt!649111 mask!2687)))))

(declare-fun b!1488157 () Bool)

(declare-fun e!834343 () Bool)

(declare-fun e!834342 () Bool)

(assert (=> b!1488157 (= e!834343 e!834342)))

(declare-fun res!1011416 () Bool)

(assert (=> b!1488157 (=> (not res!1011416) (not e!834342))))

(declare-fun lt!649105 () SeekEntryResult!12237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488157 (= res!1011416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!649105))))

(assert (=> b!1488157 (= lt!649105 (Intermediate!12237 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488158 () Bool)

(declare-fun res!1011410 () Bool)

(assert (=> b!1488158 (=> (not res!1011410) (not e!834341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488158 (= res!1011410 (validKeyInArray!0 (select (arr!48100 a!2862) j!93)))))

(declare-fun b!1488159 () Bool)

(assert (=> b!1488159 (= e!834340 e!834336)))

(declare-fun res!1011405 () Bool)

(assert (=> b!1488159 (=> (not res!1011405) (not e!834336))))

(assert (=> b!1488159 (= res!1011405 (and (= index!646 intermediateAfterIndex!19) (= lt!649108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488160 () Bool)

(declare-fun res!1011406 () Bool)

(assert (=> b!1488160 (=> (not res!1011406) (not e!834342))))

(assert (=> b!1488160 (= res!1011406 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!649105))))

(declare-fun b!1488161 () Bool)

(assert (=> b!1488161 (= e!834342 e!834345)))

(declare-fun res!1011408 () Bool)

(assert (=> b!1488161 (=> (not res!1011408) (not e!834345))))

(assert (=> b!1488161 (= res!1011408 (= lt!649109 (Intermediate!12237 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488161 (= lt!649109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649107 mask!2687) lt!649107 lt!649111 mask!2687))))

(assert (=> b!1488161 (= lt!649107 (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488162 () Bool)

(declare-fun res!1011404 () Bool)

(assert (=> b!1488162 (=> (not res!1011404) (not e!834341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99661 (_ BitVec 32)) Bool)

(assert (=> b!1488162 (= res!1011404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1011411 () Bool)

(assert (=> start!126924 (=> (not res!1011411) (not e!834341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126924 (= res!1011411 (validMask!0 mask!2687))))

(assert (=> start!126924 e!834341))

(assert (=> start!126924 true))

(declare-fun array_inv!37381 (array!99661) Bool)

(assert (=> start!126924 (array_inv!37381 a!2862)))

(declare-fun b!1488153 () Bool)

(declare-fun res!1011403 () Bool)

(assert (=> b!1488153 (=> (not res!1011403) (not e!834341))))

(assert (=> b!1488153 (= res!1011403 (validKeyInArray!0 (select (arr!48100 a!2862) i!1006)))))

(declare-fun b!1488163 () Bool)

(assert (=> b!1488163 (= e!834345 (not e!834337))))

(declare-fun res!1011417 () Bool)

(assert (=> b!1488163 (=> res!1011417 e!834337)))

(assert (=> b!1488163 (= res!1011417 (or (and (= (select (arr!48100 a!2862) index!646) (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48100 a!2862) index!646) (select (arr!48100 a!2862) j!93))) (= (select (arr!48100 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488163 e!834339))

(declare-fun res!1011402 () Bool)

(assert (=> b!1488163 (=> (not res!1011402) (not e!834339))))

(assert (=> b!1488163 (= res!1011402 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49847 0))(
  ( (Unit!49848) )
))
(declare-fun lt!649106 () Unit!49847)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49847)

(assert (=> b!1488163 (= lt!649106 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488164 () Bool)

(declare-fun res!1011412 () Bool)

(assert (=> b!1488164 (=> (not res!1011412) (not e!834341))))

(declare-datatypes ((List!34588 0))(
  ( (Nil!34585) (Cons!34584 (h!35975 (_ BitVec 64)) (t!49274 List!34588)) )
))
(declare-fun arrayNoDuplicates!0 (array!99661 (_ BitVec 32) List!34588) Bool)

(assert (=> b!1488164 (= res!1011412 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34585))))

(declare-fun b!1488165 () Bool)

(assert (=> b!1488165 (= e!834344 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649107 lt!649111 mask!2687) (seekEntryOrOpen!0 lt!649107 lt!649111 mask!2687)))))

(declare-fun b!1488166 () Bool)

(declare-fun res!1011401 () Bool)

(assert (=> b!1488166 (=> (not res!1011401) (not e!834339))))

(assert (=> b!1488166 (= res!1011401 (or (= (select (arr!48100 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48100 a!2862) intermediateBeforeIndex!19) (select (arr!48100 a!2862) j!93))))))

(declare-fun b!1488167 () Bool)

(declare-fun res!1011418 () Bool)

(assert (=> b!1488167 (=> (not res!1011418) (not e!834341))))

(assert (=> b!1488167 (= res!1011418 (and (= (size!48651 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48651 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48651 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488168 () Bool)

(declare-fun res!1011415 () Bool)

(assert (=> b!1488168 (=> (not res!1011415) (not e!834345))))

(assert (=> b!1488168 (= res!1011415 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488169 () Bool)

(assert (=> b!1488169 (= e!834341 e!834343)))

(declare-fun res!1011419 () Bool)

(assert (=> b!1488169 (=> (not res!1011419) (not e!834343))))

(assert (=> b!1488169 (= res!1011419 (= (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488169 (= lt!649111 (array!99662 (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48651 a!2862)))))

(assert (= (and start!126924 res!1011411) b!1488167))

(assert (= (and b!1488167 res!1011418) b!1488153))

(assert (= (and b!1488153 res!1011403) b!1488158))

(assert (= (and b!1488158 res!1011410) b!1488162))

(assert (= (and b!1488162 res!1011404) b!1488164))

(assert (= (and b!1488164 res!1011412) b!1488149))

(assert (= (and b!1488149 res!1011409) b!1488169))

(assert (= (and b!1488169 res!1011419) b!1488157))

(assert (= (and b!1488157 res!1011416) b!1488160))

(assert (= (and b!1488160 res!1011406) b!1488161))

(assert (= (and b!1488161 res!1011408) b!1488154))

(assert (= (and b!1488154 c!137908) b!1488152))

(assert (= (and b!1488154 (not c!137908)) b!1488165))

(assert (= (and b!1488154 res!1011413) b!1488168))

(assert (= (and b!1488168 res!1011415) b!1488163))

(assert (= (and b!1488163 res!1011402) b!1488151))

(assert (= (and b!1488151 res!1011407) b!1488166))

(assert (= (and b!1488166 res!1011401) b!1488155))

(assert (= (and b!1488155 (not res!1011414)) b!1488159))

(assert (= (and b!1488159 res!1011405) b!1488156))

(assert (= (and b!1488163 (not res!1011417)) b!1488150))

(declare-fun m!1373011 () Bool)

(assert (=> b!1488156 m!1373011))

(declare-fun m!1373013 () Bool)

(assert (=> b!1488156 m!1373013))

(assert (=> b!1488165 m!1373013))

(assert (=> b!1488165 m!1373011))

(declare-fun m!1373015 () Bool)

(assert (=> b!1488162 m!1373015))

(declare-fun m!1373017 () Bool)

(assert (=> b!1488169 m!1373017))

(declare-fun m!1373019 () Bool)

(assert (=> b!1488169 m!1373019))

(declare-fun m!1373021 () Bool)

(assert (=> start!126924 m!1373021))

(declare-fun m!1373023 () Bool)

(assert (=> start!126924 m!1373023))

(declare-fun m!1373025 () Bool)

(assert (=> b!1488164 m!1373025))

(declare-fun m!1373027 () Bool)

(assert (=> b!1488166 m!1373027))

(declare-fun m!1373029 () Bool)

(assert (=> b!1488166 m!1373029))

(assert (=> b!1488151 m!1373029))

(assert (=> b!1488151 m!1373029))

(declare-fun m!1373031 () Bool)

(assert (=> b!1488151 m!1373031))

(declare-fun m!1373033 () Bool)

(assert (=> b!1488152 m!1373033))

(assert (=> b!1488160 m!1373029))

(assert (=> b!1488160 m!1373029))

(declare-fun m!1373035 () Bool)

(assert (=> b!1488160 m!1373035))

(declare-fun m!1373037 () Bool)

(assert (=> b!1488153 m!1373037))

(assert (=> b!1488153 m!1373037))

(declare-fun m!1373039 () Bool)

(assert (=> b!1488153 m!1373039))

(assert (=> b!1488158 m!1373029))

(assert (=> b!1488158 m!1373029))

(declare-fun m!1373041 () Bool)

(assert (=> b!1488158 m!1373041))

(declare-fun m!1373043 () Bool)

(assert (=> b!1488155 m!1373043))

(assert (=> b!1488155 m!1373029))

(assert (=> b!1488155 m!1373017))

(declare-fun m!1373045 () Bool)

(assert (=> b!1488155 m!1373045))

(declare-fun m!1373047 () Bool)

(assert (=> b!1488150 m!1373047))

(declare-fun m!1373049 () Bool)

(assert (=> b!1488161 m!1373049))

(assert (=> b!1488161 m!1373049))

(declare-fun m!1373051 () Bool)

(assert (=> b!1488161 m!1373051))

(assert (=> b!1488161 m!1373017))

(declare-fun m!1373053 () Bool)

(assert (=> b!1488161 m!1373053))

(declare-fun m!1373055 () Bool)

(assert (=> b!1488163 m!1373055))

(assert (=> b!1488163 m!1373017))

(assert (=> b!1488163 m!1373045))

(assert (=> b!1488163 m!1373043))

(declare-fun m!1373057 () Bool)

(assert (=> b!1488163 m!1373057))

(assert (=> b!1488163 m!1373029))

(assert (=> b!1488157 m!1373029))

(assert (=> b!1488157 m!1373029))

(declare-fun m!1373059 () Bool)

(assert (=> b!1488157 m!1373059))

(assert (=> b!1488157 m!1373059))

(assert (=> b!1488157 m!1373029))

(declare-fun m!1373061 () Bool)

(assert (=> b!1488157 m!1373061))

(check-sat (not b!1488150) (not b!1488163) (not b!1488151) (not b!1488158) (not b!1488157) (not b!1488161) (not b!1488152) (not b!1488160) (not b!1488162) (not start!126924) (not b!1488164) (not b!1488153) (not b!1488165) (not b!1488156))
(check-sat)
