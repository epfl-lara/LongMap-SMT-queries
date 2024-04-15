; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126482 () Bool)

(assert start!126482)

(declare-fun b!1484179 () Bool)

(declare-fun res!1009178 () Bool)

(declare-fun e!832106 () Bool)

(assert (=> b!1484179 (=> (not res!1009178) (not e!832106))))

(declare-datatypes ((array!99442 0))(
  ( (array!99443 (arr!47998 (Array (_ BitVec 32) (_ BitVec 64))) (size!48550 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99442)

(declare-datatypes ((List!34577 0))(
  ( (Nil!34574) (Cons!34573 (h!35947 (_ BitVec 64)) (t!49263 List!34577)) )
))
(declare-fun arrayNoDuplicates!0 (array!99442 (_ BitVec 32) List!34577) Bool)

(assert (=> b!1484179 (= res!1009178 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34574))))

(declare-fun res!1009182 () Bool)

(assert (=> start!126482 (=> (not res!1009182) (not e!832106))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126482 (= res!1009182 (validMask!0 mask!2687))))

(assert (=> start!126482 e!832106))

(assert (=> start!126482 true))

(declare-fun array_inv!37231 (array!99442) Bool)

(assert (=> start!126482 (array_inv!37231 a!2862)))

(declare-fun b!1484180 () Bool)

(declare-fun e!832104 () Bool)

(declare-fun e!832105 () Bool)

(assert (=> b!1484180 (= e!832104 e!832105)))

(declare-fun res!1009172 () Bool)

(assert (=> b!1484180 (=> (not res!1009172) (not e!832105))))

(declare-datatypes ((SeekEntryResult!12263 0))(
  ( (MissingZero!12263 (index!51444 (_ BitVec 32))) (Found!12263 (index!51445 (_ BitVec 32))) (Intermediate!12263 (undefined!13075 Bool) (index!51446 (_ BitVec 32)) (x!133020 (_ BitVec 32))) (Undefined!12263) (MissingVacant!12263 (index!51447 (_ BitVec 32))) )
))
(declare-fun lt!647497 () SeekEntryResult!12263)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484180 (= res!1009172 (= lt!647497 (Intermediate!12263 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647496 () array!99442)

(declare-fun lt!647494 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99442 (_ BitVec 32)) SeekEntryResult!12263)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484180 (= lt!647497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647494 mask!2687) lt!647494 lt!647496 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484180 (= lt!647494 (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484181 () Bool)

(declare-fun e!832103 () Bool)

(assert (=> b!1484181 (= e!832106 e!832103)))

(declare-fun res!1009171 () Bool)

(assert (=> b!1484181 (=> (not res!1009171) (not e!832103))))

(assert (=> b!1484181 (= res!1009171 (= (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484181 (= lt!647496 (array!99443 (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48550 a!2862)))))

(declare-fun b!1484182 () Bool)

(declare-fun e!832107 () Bool)

(declare-fun e!832109 () Bool)

(assert (=> b!1484182 (= e!832107 e!832109)))

(declare-fun res!1009189 () Bool)

(assert (=> b!1484182 (=> (not res!1009189) (not e!832109))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647493 () (_ BitVec 64))

(assert (=> b!1484182 (= res!1009189 (and (= index!646 intermediateAfterIndex!19) (= lt!647493 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484183 () Bool)

(declare-fun res!1009173 () Bool)

(assert (=> b!1484183 (=> (not res!1009173) (not e!832104))))

(declare-fun lt!647495 () SeekEntryResult!12263)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1484183 (= res!1009173 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!647495))))

(declare-fun b!1484184 () Bool)

(declare-fun e!832102 () Bool)

(assert (=> b!1484184 (= e!832105 (not e!832102))))

(declare-fun res!1009185 () Bool)

(assert (=> b!1484184 (=> res!1009185 e!832102)))

(assert (=> b!1484184 (= res!1009185 (or (and (= (select (arr!47998 a!2862) index!646) (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47998 a!2862) index!646) (select (arr!47998 a!2862) j!93))) (= (select (arr!47998 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832100 () Bool)

(assert (=> b!1484184 e!832100))

(declare-fun res!1009176 () Bool)

(assert (=> b!1484184 (=> (not res!1009176) (not e!832100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99442 (_ BitVec 32)) Bool)

(assert (=> b!1484184 (= res!1009176 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49707 0))(
  ( (Unit!49708) )
))
(declare-fun lt!647498 () Unit!49707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49707)

(assert (=> b!1484184 (= lt!647498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484185 () Bool)

(declare-fun res!1009177 () Bool)

(assert (=> b!1484185 (=> (not res!1009177) (not e!832106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484185 (= res!1009177 (validKeyInArray!0 (select (arr!47998 a!2862) i!1006)))))

(declare-fun b!1484186 () Bool)

(declare-fun res!1009174 () Bool)

(assert (=> b!1484186 (=> (not res!1009174) (not e!832106))))

(assert (=> b!1484186 (= res!1009174 (and (= (size!48550 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48550 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48550 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484187 () Bool)

(declare-fun res!1009180 () Bool)

(assert (=> b!1484187 (=> (not res!1009180) (not e!832106))))

(assert (=> b!1484187 (= res!1009180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484188 () Bool)

(assert (=> b!1484188 (= e!832103 e!832104)))

(declare-fun res!1009179 () Bool)

(assert (=> b!1484188 (=> (not res!1009179) (not e!832104))))

(assert (=> b!1484188 (= res!1009179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!647495))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484188 (= lt!647495 (Intermediate!12263 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484189 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99442 (_ BitVec 32)) SeekEntryResult!12263)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99442 (_ BitVec 32)) SeekEntryResult!12263)

(assert (=> b!1484189 (= e!832109 (= (seekEntryOrOpen!0 lt!647494 lt!647496 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647494 lt!647496 mask!2687)))))

(declare-fun b!1484190 () Bool)

(declare-fun res!1009181 () Bool)

(assert (=> b!1484190 (=> (not res!1009181) (not e!832100))))

(assert (=> b!1484190 (= res!1009181 (or (= (select (arr!47998 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47998 a!2862) intermediateBeforeIndex!19) (select (arr!47998 a!2862) j!93))))))

(declare-fun b!1484191 () Bool)

(declare-fun res!1009184 () Bool)

(assert (=> b!1484191 (=> (not res!1009184) (not e!832105))))

(declare-fun e!832108 () Bool)

(assert (=> b!1484191 (= res!1009184 e!832108)))

(declare-fun c!137029 () Bool)

(assert (=> b!1484191 (= c!137029 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484192 () Bool)

(declare-fun res!1009188 () Bool)

(assert (=> b!1484192 (=> (not res!1009188) (not e!832100))))

(assert (=> b!1484192 (= res!1009188 (= (seekEntryOrOpen!0 (select (arr!47998 a!2862) j!93) a!2862 mask!2687) (Found!12263 j!93)))))

(declare-fun b!1484193 () Bool)

(assert (=> b!1484193 (= e!832100 e!832107)))

(declare-fun res!1009186 () Bool)

(assert (=> b!1484193 (=> res!1009186 e!832107)))

(assert (=> b!1484193 (= res!1009186 (or (and (= (select (arr!47998 a!2862) index!646) lt!647493) (= (select (arr!47998 a!2862) index!646) (select (arr!47998 a!2862) j!93))) (= (select (arr!47998 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484193 (= lt!647493 (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484194 () Bool)

(assert (=> b!1484194 (= e!832108 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647494 lt!647496 mask!2687) (seekEntryOrOpen!0 lt!647494 lt!647496 mask!2687)))))

(declare-fun b!1484195 () Bool)

(declare-fun res!1009187 () Bool)

(assert (=> b!1484195 (=> (not res!1009187) (not e!832106))))

(assert (=> b!1484195 (= res!1009187 (validKeyInArray!0 (select (arr!47998 a!2862) j!93)))))

(declare-fun b!1484196 () Bool)

(assert (=> b!1484196 (= e!832102 true)))

(declare-fun lt!647492 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484196 (= lt!647492 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484197 () Bool)

(declare-fun res!1009175 () Bool)

(assert (=> b!1484197 (=> (not res!1009175) (not e!832105))))

(assert (=> b!1484197 (= res!1009175 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484198 () Bool)

(assert (=> b!1484198 (= e!832108 (= lt!647497 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647494 lt!647496 mask!2687)))))

(declare-fun b!1484199 () Bool)

(declare-fun res!1009183 () Bool)

(assert (=> b!1484199 (=> (not res!1009183) (not e!832106))))

(assert (=> b!1484199 (= res!1009183 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48550 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48550 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48550 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126482 res!1009182) b!1484186))

(assert (= (and b!1484186 res!1009174) b!1484185))

(assert (= (and b!1484185 res!1009177) b!1484195))

(assert (= (and b!1484195 res!1009187) b!1484187))

(assert (= (and b!1484187 res!1009180) b!1484179))

(assert (= (and b!1484179 res!1009178) b!1484199))

(assert (= (and b!1484199 res!1009183) b!1484181))

(assert (= (and b!1484181 res!1009171) b!1484188))

(assert (= (and b!1484188 res!1009179) b!1484183))

(assert (= (and b!1484183 res!1009173) b!1484180))

(assert (= (and b!1484180 res!1009172) b!1484191))

(assert (= (and b!1484191 c!137029) b!1484198))

(assert (= (and b!1484191 (not c!137029)) b!1484194))

(assert (= (and b!1484191 res!1009184) b!1484197))

(assert (= (and b!1484197 res!1009175) b!1484184))

(assert (= (and b!1484184 res!1009176) b!1484192))

(assert (= (and b!1484192 res!1009188) b!1484190))

(assert (= (and b!1484190 res!1009181) b!1484193))

(assert (= (and b!1484193 (not res!1009186)) b!1484182))

(assert (= (and b!1484182 res!1009189) b!1484189))

(assert (= (and b!1484184 (not res!1009185)) b!1484196))

(declare-fun m!1368933 () Bool)

(assert (=> b!1484190 m!1368933))

(declare-fun m!1368935 () Bool)

(assert (=> b!1484190 m!1368935))

(declare-fun m!1368937 () Bool)

(assert (=> b!1484198 m!1368937))

(declare-fun m!1368939 () Bool)

(assert (=> b!1484194 m!1368939))

(declare-fun m!1368941 () Bool)

(assert (=> b!1484194 m!1368941))

(assert (=> b!1484189 m!1368941))

(assert (=> b!1484189 m!1368939))

(assert (=> b!1484183 m!1368935))

(assert (=> b!1484183 m!1368935))

(declare-fun m!1368943 () Bool)

(assert (=> b!1484183 m!1368943))

(declare-fun m!1368945 () Bool)

(assert (=> b!1484196 m!1368945))

(declare-fun m!1368947 () Bool)

(assert (=> b!1484185 m!1368947))

(assert (=> b!1484185 m!1368947))

(declare-fun m!1368949 () Bool)

(assert (=> b!1484185 m!1368949))

(declare-fun m!1368951 () Bool)

(assert (=> b!1484181 m!1368951))

(declare-fun m!1368953 () Bool)

(assert (=> b!1484181 m!1368953))

(declare-fun m!1368955 () Bool)

(assert (=> b!1484193 m!1368955))

(assert (=> b!1484193 m!1368935))

(assert (=> b!1484193 m!1368951))

(declare-fun m!1368957 () Bool)

(assert (=> b!1484193 m!1368957))

(declare-fun m!1368959 () Bool)

(assert (=> b!1484180 m!1368959))

(assert (=> b!1484180 m!1368959))

(declare-fun m!1368961 () Bool)

(assert (=> b!1484180 m!1368961))

(assert (=> b!1484180 m!1368951))

(declare-fun m!1368963 () Bool)

(assert (=> b!1484180 m!1368963))

(declare-fun m!1368965 () Bool)

(assert (=> start!126482 m!1368965))

(declare-fun m!1368967 () Bool)

(assert (=> start!126482 m!1368967))

(assert (=> b!1484188 m!1368935))

(assert (=> b!1484188 m!1368935))

(declare-fun m!1368969 () Bool)

(assert (=> b!1484188 m!1368969))

(assert (=> b!1484188 m!1368969))

(assert (=> b!1484188 m!1368935))

(declare-fun m!1368971 () Bool)

(assert (=> b!1484188 m!1368971))

(declare-fun m!1368973 () Bool)

(assert (=> b!1484184 m!1368973))

(assert (=> b!1484184 m!1368951))

(assert (=> b!1484184 m!1368957))

(assert (=> b!1484184 m!1368955))

(declare-fun m!1368975 () Bool)

(assert (=> b!1484184 m!1368975))

(assert (=> b!1484184 m!1368935))

(declare-fun m!1368977 () Bool)

(assert (=> b!1484179 m!1368977))

(assert (=> b!1484192 m!1368935))

(assert (=> b!1484192 m!1368935))

(declare-fun m!1368979 () Bool)

(assert (=> b!1484192 m!1368979))

(declare-fun m!1368981 () Bool)

(assert (=> b!1484187 m!1368981))

(assert (=> b!1484195 m!1368935))

(assert (=> b!1484195 m!1368935))

(declare-fun m!1368983 () Bool)

(assert (=> b!1484195 m!1368983))

(check-sat (not b!1484192) (not b!1484188) (not b!1484194) (not start!126482) (not b!1484198) (not b!1484185) (not b!1484196) (not b!1484187) (not b!1484189) (not b!1484184) (not b!1484180) (not b!1484179) (not b!1484183) (not b!1484195))
(check-sat)
