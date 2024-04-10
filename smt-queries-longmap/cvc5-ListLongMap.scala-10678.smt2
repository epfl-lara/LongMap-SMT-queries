; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125206 () Bool)

(assert start!125206)

(declare-fun b!1460396 () Bool)

(declare-fun res!990177 () Bool)

(declare-fun e!821159 () Bool)

(assert (=> b!1460396 (=> (not res!990177) (not e!821159))))

(declare-datatypes ((array!98654 0))(
  ( (array!98655 (arr!47615 (Array (_ BitVec 32) (_ BitVec 64))) (size!48165 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98654)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460396 (= res!990177 (validKeyInArray!0 (select (arr!47615 a!2862) i!1006)))))

(declare-fun res!990180 () Bool)

(assert (=> start!125206 (=> (not res!990180) (not e!821159))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125206 (= res!990180 (validMask!0 mask!2687))))

(assert (=> start!125206 e!821159))

(assert (=> start!125206 true))

(declare-fun array_inv!36643 (array!98654) Bool)

(assert (=> start!125206 (array_inv!36643 a!2862)))

(declare-fun b!1460397 () Bool)

(declare-fun res!990184 () Bool)

(declare-fun e!821161 () Bool)

(assert (=> b!1460397 (=> (not res!990184) (not e!821161))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11867 0))(
  ( (MissingZero!11867 (index!49860 (_ BitVec 32))) (Found!11867 (index!49861 (_ BitVec 32))) (Intermediate!11867 (undefined!12679 Bool) (index!49862 (_ BitVec 32)) (x!131468 (_ BitVec 32))) (Undefined!11867) (MissingVacant!11867 (index!49863 (_ BitVec 32))) )
))
(declare-fun lt!639809 () SeekEntryResult!11867)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98654 (_ BitVec 32)) SeekEntryResult!11867)

(assert (=> b!1460397 (= res!990184 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47615 a!2862) j!93) a!2862 mask!2687) lt!639809))))

(declare-fun b!1460398 () Bool)

(declare-fun res!990175 () Bool)

(assert (=> b!1460398 (=> (not res!990175) (not e!821159))))

(declare-datatypes ((List!34116 0))(
  ( (Nil!34113) (Cons!34112 (h!35462 (_ BitVec 64)) (t!48810 List!34116)) )
))
(declare-fun arrayNoDuplicates!0 (array!98654 (_ BitVec 32) List!34116) Bool)

(assert (=> b!1460398 (= res!990175 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34113))))

(declare-fun b!1460399 () Bool)

(declare-fun res!990181 () Bool)

(assert (=> b!1460399 (=> (not res!990181) (not e!821159))))

(assert (=> b!1460399 (= res!990181 (and (= (size!48165 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48165 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48165 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460400 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!821158 () Bool)

(assert (=> b!1460400 (= e!821158 (or (= (select (arr!47615 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47615 a!2862) intermediateBeforeIndex!19) (select (arr!47615 a!2862) j!93))))))

(declare-fun b!1460401 () Bool)

(declare-fun e!821160 () Bool)

(assert (=> b!1460401 (= e!821159 e!821160)))

(declare-fun res!990187 () Bool)

(assert (=> b!1460401 (=> (not res!990187) (not e!821160))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460401 (= res!990187 (= (select (store (arr!47615 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639810 () array!98654)

(assert (=> b!1460401 (= lt!639810 (array!98655 (store (arr!47615 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48165 a!2862)))))

(declare-fun b!1460402 () Bool)

(declare-fun res!990185 () Bool)

(declare-fun e!821162 () Bool)

(assert (=> b!1460402 (=> (not res!990185) (not e!821162))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460402 (= res!990185 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460403 () Bool)

(declare-fun res!990179 () Bool)

(assert (=> b!1460403 (=> (not res!990179) (not e!821159))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460403 (= res!990179 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48165 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48165 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48165 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460404 () Bool)

(declare-fun e!821156 () Bool)

(declare-fun lt!639813 () (_ BitVec 64))

(declare-fun lt!639812 () SeekEntryResult!11867)

(assert (=> b!1460404 (= e!821156 (= lt!639812 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639813 lt!639810 mask!2687)))))

(declare-fun b!1460405 () Bool)

(assert (=> b!1460405 (= e!821162 (not (or (and (= (select (arr!47615 a!2862) index!646) (select (store (arr!47615 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47615 a!2862) index!646) (select (arr!47615 a!2862) j!93))) (= (select (arr!47615 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1460405 e!821158))

(declare-fun res!990178 () Bool)

(assert (=> b!1460405 (=> (not res!990178) (not e!821158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98654 (_ BitVec 32)) Bool)

(assert (=> b!1460405 (= res!990178 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49230 0))(
  ( (Unit!49231) )
))
(declare-fun lt!639811 () Unit!49230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49230)

(assert (=> b!1460405 (= lt!639811 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460406 () Bool)

(declare-fun res!990174 () Bool)

(assert (=> b!1460406 (=> (not res!990174) (not e!821162))))

(assert (=> b!1460406 (= res!990174 e!821156)))

(declare-fun c!134622 () Bool)

(assert (=> b!1460406 (= c!134622 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460407 () Bool)

(declare-fun res!990176 () Bool)

(assert (=> b!1460407 (=> (not res!990176) (not e!821158))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98654 (_ BitVec 32)) SeekEntryResult!11867)

(assert (=> b!1460407 (= res!990176 (= (seekEntryOrOpen!0 (select (arr!47615 a!2862) j!93) a!2862 mask!2687) (Found!11867 j!93)))))

(declare-fun b!1460408 () Bool)

(assert (=> b!1460408 (= e!821161 e!821162)))

(declare-fun res!990173 () Bool)

(assert (=> b!1460408 (=> (not res!990173) (not e!821162))))

(assert (=> b!1460408 (= res!990173 (= lt!639812 (Intermediate!11867 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460408 (= lt!639812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639813 mask!2687) lt!639813 lt!639810 mask!2687))))

(assert (=> b!1460408 (= lt!639813 (select (store (arr!47615 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460409 () Bool)

(assert (=> b!1460409 (= e!821160 e!821161)))

(declare-fun res!990186 () Bool)

(assert (=> b!1460409 (=> (not res!990186) (not e!821161))))

(assert (=> b!1460409 (= res!990186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47615 a!2862) j!93) mask!2687) (select (arr!47615 a!2862) j!93) a!2862 mask!2687) lt!639809))))

(assert (=> b!1460409 (= lt!639809 (Intermediate!11867 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460410 () Bool)

(declare-fun res!990182 () Bool)

(assert (=> b!1460410 (=> (not res!990182) (not e!821159))))

(assert (=> b!1460410 (= res!990182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460411 () Bool)

(declare-fun res!990183 () Bool)

(assert (=> b!1460411 (=> (not res!990183) (not e!821159))))

(assert (=> b!1460411 (= res!990183 (validKeyInArray!0 (select (arr!47615 a!2862) j!93)))))

(declare-fun b!1460412 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98654 (_ BitVec 32)) SeekEntryResult!11867)

(assert (=> b!1460412 (= e!821156 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639813 lt!639810 mask!2687) (seekEntryOrOpen!0 lt!639813 lt!639810 mask!2687)))))

(assert (= (and start!125206 res!990180) b!1460399))

(assert (= (and b!1460399 res!990181) b!1460396))

(assert (= (and b!1460396 res!990177) b!1460411))

(assert (= (and b!1460411 res!990183) b!1460410))

(assert (= (and b!1460410 res!990182) b!1460398))

(assert (= (and b!1460398 res!990175) b!1460403))

(assert (= (and b!1460403 res!990179) b!1460401))

(assert (= (and b!1460401 res!990187) b!1460409))

(assert (= (and b!1460409 res!990186) b!1460397))

(assert (= (and b!1460397 res!990184) b!1460408))

(assert (= (and b!1460408 res!990173) b!1460406))

(assert (= (and b!1460406 c!134622) b!1460404))

(assert (= (and b!1460406 (not c!134622)) b!1460412))

(assert (= (and b!1460406 res!990174) b!1460402))

(assert (= (and b!1460402 res!990185) b!1460405))

(assert (= (and b!1460405 res!990178) b!1460407))

(assert (= (and b!1460407 res!990176) b!1460400))

(declare-fun m!1348075 () Bool)

(assert (=> b!1460404 m!1348075))

(declare-fun m!1348077 () Bool)

(assert (=> b!1460407 m!1348077))

(assert (=> b!1460407 m!1348077))

(declare-fun m!1348079 () Bool)

(assert (=> b!1460407 m!1348079))

(declare-fun m!1348081 () Bool)

(assert (=> b!1460401 m!1348081))

(declare-fun m!1348083 () Bool)

(assert (=> b!1460401 m!1348083))

(declare-fun m!1348085 () Bool)

(assert (=> b!1460400 m!1348085))

(assert (=> b!1460400 m!1348077))

(declare-fun m!1348087 () Bool)

(assert (=> b!1460396 m!1348087))

(assert (=> b!1460396 m!1348087))

(declare-fun m!1348089 () Bool)

(assert (=> b!1460396 m!1348089))

(declare-fun m!1348091 () Bool)

(assert (=> b!1460408 m!1348091))

(assert (=> b!1460408 m!1348091))

(declare-fun m!1348093 () Bool)

(assert (=> b!1460408 m!1348093))

(assert (=> b!1460408 m!1348081))

(declare-fun m!1348095 () Bool)

(assert (=> b!1460408 m!1348095))

(assert (=> b!1460397 m!1348077))

(assert (=> b!1460397 m!1348077))

(declare-fun m!1348097 () Bool)

(assert (=> b!1460397 m!1348097))

(assert (=> b!1460409 m!1348077))

(assert (=> b!1460409 m!1348077))

(declare-fun m!1348099 () Bool)

(assert (=> b!1460409 m!1348099))

(assert (=> b!1460409 m!1348099))

(assert (=> b!1460409 m!1348077))

(declare-fun m!1348101 () Bool)

(assert (=> b!1460409 m!1348101))

(declare-fun m!1348103 () Bool)

(assert (=> b!1460405 m!1348103))

(assert (=> b!1460405 m!1348081))

(declare-fun m!1348105 () Bool)

(assert (=> b!1460405 m!1348105))

(declare-fun m!1348107 () Bool)

(assert (=> b!1460405 m!1348107))

(declare-fun m!1348109 () Bool)

(assert (=> b!1460405 m!1348109))

(assert (=> b!1460405 m!1348077))

(declare-fun m!1348111 () Bool)

(assert (=> b!1460412 m!1348111))

(declare-fun m!1348113 () Bool)

(assert (=> b!1460412 m!1348113))

(declare-fun m!1348115 () Bool)

(assert (=> b!1460398 m!1348115))

(assert (=> b!1460411 m!1348077))

(assert (=> b!1460411 m!1348077))

(declare-fun m!1348117 () Bool)

(assert (=> b!1460411 m!1348117))

(declare-fun m!1348119 () Bool)

(assert (=> start!125206 m!1348119))

(declare-fun m!1348121 () Bool)

(assert (=> start!125206 m!1348121))

(declare-fun m!1348123 () Bool)

(assert (=> b!1460410 m!1348123))

(push 1)

