; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125324 () Bool)

(assert start!125324)

(declare-fun b!1464165 () Bool)

(declare-fun res!993292 () Bool)

(declare-fun e!822854 () Bool)

(assert (=> b!1464165 (=> (not res!993292) (not e!822854))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464165 (= res!993292 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464166 () Bool)

(declare-fun e!822860 () Bool)

(declare-fun e!822856 () Bool)

(assert (=> b!1464166 (= e!822860 e!822856)))

(declare-fun res!993290 () Bool)

(assert (=> b!1464166 (=> (not res!993290) (not e!822856))))

(declare-datatypes ((array!98772 0))(
  ( (array!98773 (arr!47674 (Array (_ BitVec 32) (_ BitVec 64))) (size!48224 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98772)

(assert (=> b!1464166 (= res!993290 (= (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641000 () array!98772)

(assert (=> b!1464166 (= lt!641000 (array!98773 (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48224 a!2862)))))

(declare-fun b!1464167 () Bool)

(declare-fun res!993285 () Bool)

(assert (=> b!1464167 (=> (not res!993285) (not e!822860))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98772 (_ BitVec 32)) Bool)

(assert (=> b!1464167 (= res!993285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464168 () Bool)

(declare-fun res!993289 () Bool)

(assert (=> b!1464168 (=> (not res!993289) (not e!822860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464168 (= res!993289 (validKeyInArray!0 (select (arr!47674 a!2862) i!1006)))))

(declare-fun lt!641001 () (_ BitVec 32))

(declare-fun lt!641002 () (_ BitVec 64))

(declare-fun e!822853 () Bool)

(declare-fun b!1464169 () Bool)

(declare-datatypes ((SeekEntryResult!11926 0))(
  ( (MissingZero!11926 (index!50096 (_ BitVec 32))) (Found!11926 (index!50097 (_ BitVec 32))) (Intermediate!11926 (undefined!12738 Bool) (index!50098 (_ BitVec 32)) (x!131679 (_ BitVec 32))) (Undefined!11926) (MissingVacant!11926 (index!50099 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98772 (_ BitVec 32)) SeekEntryResult!11926)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98772 (_ BitVec 32)) SeekEntryResult!11926)

(assert (=> b!1464169 (= e!822853 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641001 intermediateAfterIndex!19 lt!641002 lt!641000 mask!2687) (seekEntryOrOpen!0 lt!641002 lt!641000 mask!2687))))))

(declare-fun b!1464170 () Bool)

(declare-fun res!993295 () Bool)

(declare-fun e!822852 () Bool)

(assert (=> b!1464170 (=> (not res!993295) (not e!822852))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!641003 () SeekEntryResult!11926)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98772 (_ BitVec 32)) SeekEntryResult!11926)

(assert (=> b!1464170 (= res!993295 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!641003))))

(declare-fun b!1464172 () Bool)

(assert (=> b!1464172 (= e!822856 e!822852)))

(declare-fun res!993286 () Bool)

(assert (=> b!1464172 (=> (not res!993286) (not e!822852))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464172 (= res!993286 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!641003))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1464172 (= lt!641003 (Intermediate!11926 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464173 () Bool)

(declare-fun res!993298 () Bool)

(assert (=> b!1464173 (=> (not res!993298) (not e!822860))))

(assert (=> b!1464173 (= res!993298 (and (= (size!48224 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48224 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48224 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464174 () Bool)

(declare-fun e!822851 () Bool)

(assert (=> b!1464174 (= e!822851 true)))

(declare-fun lt!640999 () Bool)

(assert (=> b!1464174 (= lt!640999 e!822853)))

(declare-fun c!134952 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464174 (= c!134952 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464175 () Bool)

(declare-fun res!993300 () Bool)

(assert (=> b!1464175 (=> (not res!993300) (not e!822854))))

(declare-fun e!822859 () Bool)

(assert (=> b!1464175 (= res!993300 e!822859)))

(declare-fun c!134951 () Bool)

(assert (=> b!1464175 (= c!134951 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464176 () Bool)

(declare-fun e!822855 () Bool)

(assert (=> b!1464176 (= e!822855 e!822851)))

(declare-fun res!993299 () Bool)

(assert (=> b!1464176 (=> res!993299 e!822851)))

(assert (=> b!1464176 (= res!993299 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641001 #b00000000000000000000000000000000) (bvsge lt!641001 (size!48224 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464176 (= lt!641001 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464177 () Bool)

(assert (=> b!1464177 (= e!822854 (not e!822855))))

(declare-fun res!993288 () Bool)

(assert (=> b!1464177 (=> res!993288 e!822855)))

(assert (=> b!1464177 (= res!993288 (or (and (= (select (arr!47674 a!2862) index!646) (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47674 a!2862) index!646) (select (arr!47674 a!2862) j!93))) (= (select (arr!47674 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822857 () Bool)

(assert (=> b!1464177 e!822857))

(declare-fun res!993293 () Bool)

(assert (=> b!1464177 (=> (not res!993293) (not e!822857))))

(assert (=> b!1464177 (= res!993293 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49348 0))(
  ( (Unit!49349) )
))
(declare-fun lt!641004 () Unit!49348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49348)

(assert (=> b!1464177 (= lt!641004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464178 () Bool)

(declare-fun lt!640998 () SeekEntryResult!11926)

(assert (=> b!1464178 (= e!822859 (= lt!640998 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641002 lt!641000 mask!2687)))))

(declare-fun b!1464179 () Bool)

(declare-fun res!993301 () Bool)

(assert (=> b!1464179 (=> res!993301 e!822851)))

(assert (=> b!1464179 (= res!993301 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641001 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!641003)))))

(declare-fun b!1464180 () Bool)

(declare-fun res!993284 () Bool)

(assert (=> b!1464180 (=> (not res!993284) (not e!822860))))

(assert (=> b!1464180 (= res!993284 (validKeyInArray!0 (select (arr!47674 a!2862) j!93)))))

(declare-fun b!1464181 () Bool)

(declare-fun res!993291 () Bool)

(assert (=> b!1464181 (=> (not res!993291) (not e!822860))))

(declare-datatypes ((List!34175 0))(
  ( (Nil!34172) (Cons!34171 (h!35521 (_ BitVec 64)) (t!48869 List!34175)) )
))
(declare-fun arrayNoDuplicates!0 (array!98772 (_ BitVec 32) List!34175) Bool)

(assert (=> b!1464181 (= res!993291 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34172))))

(declare-fun b!1464182 () Bool)

(assert (=> b!1464182 (= e!822852 e!822854)))

(declare-fun res!993294 () Bool)

(assert (=> b!1464182 (=> (not res!993294) (not e!822854))))

(assert (=> b!1464182 (= res!993294 (= lt!640998 (Intermediate!11926 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464182 (= lt!640998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641002 mask!2687) lt!641002 lt!641000 mask!2687))))

(assert (=> b!1464182 (= lt!641002 (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464183 () Bool)

(assert (=> b!1464183 (= e!822853 (not (= lt!640998 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641001 lt!641002 lt!641000 mask!2687))))))

(declare-fun b!1464184 () Bool)

(assert (=> b!1464184 (= e!822857 (or (= (select (arr!47674 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47674 a!2862) intermediateBeforeIndex!19) (select (arr!47674 a!2862) j!93))))))

(declare-fun b!1464185 () Bool)

(declare-fun res!993297 () Bool)

(assert (=> b!1464185 (=> (not res!993297) (not e!822860))))

(assert (=> b!1464185 (= res!993297 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48224 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48224 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48224 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464186 () Bool)

(declare-fun res!993287 () Bool)

(assert (=> b!1464186 (=> (not res!993287) (not e!822857))))

(assert (=> b!1464186 (= res!993287 (= (seekEntryOrOpen!0 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) (Found!11926 j!93)))))

(declare-fun b!1464171 () Bool)

(assert (=> b!1464171 (= e!822859 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641002 lt!641000 mask!2687) (seekEntryOrOpen!0 lt!641002 lt!641000 mask!2687)))))

(declare-fun res!993296 () Bool)

(assert (=> start!125324 (=> (not res!993296) (not e!822860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125324 (= res!993296 (validMask!0 mask!2687))))

(assert (=> start!125324 e!822860))

(assert (=> start!125324 true))

(declare-fun array_inv!36702 (array!98772) Bool)

(assert (=> start!125324 (array_inv!36702 a!2862)))

(assert (= (and start!125324 res!993296) b!1464173))

(assert (= (and b!1464173 res!993298) b!1464168))

(assert (= (and b!1464168 res!993289) b!1464180))

(assert (= (and b!1464180 res!993284) b!1464167))

(assert (= (and b!1464167 res!993285) b!1464181))

(assert (= (and b!1464181 res!993291) b!1464185))

(assert (= (and b!1464185 res!993297) b!1464166))

(assert (= (and b!1464166 res!993290) b!1464172))

(assert (= (and b!1464172 res!993286) b!1464170))

(assert (= (and b!1464170 res!993295) b!1464182))

(assert (= (and b!1464182 res!993294) b!1464175))

(assert (= (and b!1464175 c!134951) b!1464178))

(assert (= (and b!1464175 (not c!134951)) b!1464171))

(assert (= (and b!1464175 res!993300) b!1464165))

(assert (= (and b!1464165 res!993292) b!1464177))

(assert (= (and b!1464177 res!993293) b!1464186))

(assert (= (and b!1464186 res!993287) b!1464184))

(assert (= (and b!1464177 (not res!993288)) b!1464176))

(assert (= (and b!1464176 (not res!993299)) b!1464179))

(assert (= (and b!1464179 (not res!993301)) b!1464174))

(assert (= (and b!1464174 c!134952) b!1464183))

(assert (= (and b!1464174 (not c!134952)) b!1464169))

(declare-fun m!1351413 () Bool)

(assert (=> b!1464184 m!1351413))

(declare-fun m!1351415 () Bool)

(assert (=> b!1464184 m!1351415))

(declare-fun m!1351417 () Bool)

(assert (=> b!1464166 m!1351417))

(declare-fun m!1351419 () Bool)

(assert (=> b!1464166 m!1351419))

(declare-fun m!1351421 () Bool)

(assert (=> b!1464182 m!1351421))

(assert (=> b!1464182 m!1351421))

(declare-fun m!1351423 () Bool)

(assert (=> b!1464182 m!1351423))

(assert (=> b!1464182 m!1351417))

(declare-fun m!1351425 () Bool)

(assert (=> b!1464182 m!1351425))

(assert (=> b!1464186 m!1351415))

(assert (=> b!1464186 m!1351415))

(declare-fun m!1351427 () Bool)

(assert (=> b!1464186 m!1351427))

(assert (=> b!1464180 m!1351415))

(assert (=> b!1464180 m!1351415))

(declare-fun m!1351429 () Bool)

(assert (=> b!1464180 m!1351429))

(declare-fun m!1351431 () Bool)

(assert (=> b!1464183 m!1351431))

(assert (=> b!1464170 m!1351415))

(assert (=> b!1464170 m!1351415))

(declare-fun m!1351433 () Bool)

(assert (=> b!1464170 m!1351433))

(declare-fun m!1351435 () Bool)

(assert (=> b!1464171 m!1351435))

(declare-fun m!1351437 () Bool)

(assert (=> b!1464171 m!1351437))

(assert (=> b!1464172 m!1351415))

(assert (=> b!1464172 m!1351415))

(declare-fun m!1351439 () Bool)

(assert (=> b!1464172 m!1351439))

(assert (=> b!1464172 m!1351439))

(assert (=> b!1464172 m!1351415))

(declare-fun m!1351441 () Bool)

(assert (=> b!1464172 m!1351441))

(assert (=> b!1464179 m!1351415))

(assert (=> b!1464179 m!1351415))

(declare-fun m!1351443 () Bool)

(assert (=> b!1464179 m!1351443))

(declare-fun m!1351445 () Bool)

(assert (=> b!1464178 m!1351445))

(declare-fun m!1351447 () Bool)

(assert (=> b!1464167 m!1351447))

(declare-fun m!1351449 () Bool)

(assert (=> start!125324 m!1351449))

(declare-fun m!1351451 () Bool)

(assert (=> start!125324 m!1351451))

(declare-fun m!1351453 () Bool)

(assert (=> b!1464177 m!1351453))

(assert (=> b!1464177 m!1351417))

(declare-fun m!1351455 () Bool)

(assert (=> b!1464177 m!1351455))

(declare-fun m!1351457 () Bool)

(assert (=> b!1464177 m!1351457))

(declare-fun m!1351459 () Bool)

(assert (=> b!1464177 m!1351459))

(assert (=> b!1464177 m!1351415))

(declare-fun m!1351461 () Bool)

(assert (=> b!1464169 m!1351461))

(assert (=> b!1464169 m!1351437))

(declare-fun m!1351463 () Bool)

(assert (=> b!1464176 m!1351463))

(declare-fun m!1351465 () Bool)

(assert (=> b!1464181 m!1351465))

(declare-fun m!1351467 () Bool)

(assert (=> b!1464168 m!1351467))

(assert (=> b!1464168 m!1351467))

(declare-fun m!1351469 () Bool)

(assert (=> b!1464168 m!1351469))

(push 1)

