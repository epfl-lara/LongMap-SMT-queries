; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124476 () Bool)

(assert start!124476)

(declare-fun b!1440265 () Bool)

(declare-fun res!972697 () Bool)

(declare-fun e!812131 () Bool)

(assert (=> b!1440265 (=> (not res!972697) (not e!812131))))

(declare-datatypes ((array!97924 0))(
  ( (array!97925 (arr!47250 (Array (_ BitVec 32) (_ BitVec 64))) (size!47800 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97924)

(declare-datatypes ((List!33751 0))(
  ( (Nil!33748) (Cons!33747 (h!35097 (_ BitVec 64)) (t!48445 List!33751)) )
))
(declare-fun arrayNoDuplicates!0 (array!97924 (_ BitVec 32) List!33751) Bool)

(assert (=> b!1440265 (= res!972697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33748))))

(declare-fun b!1440266 () Bool)

(declare-fun res!972696 () Bool)

(assert (=> b!1440266 (=> (not res!972696) (not e!812131))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440266 (= res!972696 (validKeyInArray!0 (select (arr!47250 a!2862) i!1006)))))

(declare-fun b!1440267 () Bool)

(declare-fun res!972695 () Bool)

(assert (=> b!1440267 (=> (not res!972695) (not e!812131))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1440267 (= res!972695 (and (= (size!47800 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47800 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47800 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440268 () Bool)

(declare-fun e!812130 () Bool)

(assert (=> b!1440268 (= e!812131 e!812130)))

(declare-fun res!972694 () Bool)

(assert (=> b!1440268 (=> (not res!972694) (not e!812130))))

(declare-datatypes ((SeekEntryResult!11502 0))(
  ( (MissingZero!11502 (index!48400 (_ BitVec 32))) (Found!11502 (index!48401 (_ BitVec 32))) (Intermediate!11502 (undefined!12314 Bool) (index!48402 (_ BitVec 32)) (x!130127 (_ BitVec 32))) (Undefined!11502) (MissingVacant!11502 (index!48403 (_ BitVec 32))) )
))
(declare-fun lt!632943 () SeekEntryResult!11502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97924 (_ BitVec 32)) SeekEntryResult!11502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440268 (= res!972694 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47250 a!2862) j!93) mask!2687) (select (arr!47250 a!2862) j!93) a!2862 mask!2687) lt!632943))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440268 (= lt!632943 (Intermediate!11502 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440270 () Bool)

(declare-fun res!972693 () Bool)

(assert (=> b!1440270 (=> (not res!972693) (not e!812131))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440270 (= res!972693 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47800 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47800 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47800 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47250 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440271 () Bool)

(declare-fun res!972692 () Bool)

(assert (=> b!1440271 (=> (not res!972692) (not e!812130))))

(assert (=> b!1440271 (= res!972692 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47250 a!2862) j!93) a!2862 mask!2687) lt!632943))))

(declare-fun b!1440272 () Bool)

(assert (=> b!1440272 (= e!812130 false)))

(declare-fun lt!632942 () SeekEntryResult!11502)

(assert (=> b!1440272 (= lt!632942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47250 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47250 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97925 (store (arr!47250 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47800 a!2862)) mask!2687))))

(declare-fun b!1440273 () Bool)

(declare-fun res!972699 () Bool)

(assert (=> b!1440273 (=> (not res!972699) (not e!812131))))

(assert (=> b!1440273 (= res!972699 (validKeyInArray!0 (select (arr!47250 a!2862) j!93)))))

(declare-fun b!1440269 () Bool)

(declare-fun res!972698 () Bool)

(assert (=> b!1440269 (=> (not res!972698) (not e!812131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97924 (_ BitVec 32)) Bool)

(assert (=> b!1440269 (= res!972698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972700 () Bool)

(assert (=> start!124476 (=> (not res!972700) (not e!812131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124476 (= res!972700 (validMask!0 mask!2687))))

(assert (=> start!124476 e!812131))

(assert (=> start!124476 true))

(declare-fun array_inv!36278 (array!97924) Bool)

(assert (=> start!124476 (array_inv!36278 a!2862)))

(assert (= (and start!124476 res!972700) b!1440267))

(assert (= (and b!1440267 res!972695) b!1440266))

(assert (= (and b!1440266 res!972696) b!1440273))

(assert (= (and b!1440273 res!972699) b!1440269))

(assert (= (and b!1440269 res!972698) b!1440265))

(assert (= (and b!1440265 res!972697) b!1440270))

(assert (= (and b!1440270 res!972693) b!1440268))

(assert (= (and b!1440268 res!972694) b!1440271))

(assert (= (and b!1440271 res!972692) b!1440272))

(declare-fun m!1329435 () Bool)

(assert (=> b!1440270 m!1329435))

(declare-fun m!1329437 () Bool)

(assert (=> b!1440270 m!1329437))

(declare-fun m!1329439 () Bool)

(assert (=> start!124476 m!1329439))

(declare-fun m!1329441 () Bool)

(assert (=> start!124476 m!1329441))

(declare-fun m!1329443 () Bool)

(assert (=> b!1440273 m!1329443))

(assert (=> b!1440273 m!1329443))

(declare-fun m!1329445 () Bool)

(assert (=> b!1440273 m!1329445))

(assert (=> b!1440271 m!1329443))

(assert (=> b!1440271 m!1329443))

(declare-fun m!1329447 () Bool)

(assert (=> b!1440271 m!1329447))

(declare-fun m!1329449 () Bool)

(assert (=> b!1440265 m!1329449))

(assert (=> b!1440272 m!1329435))

(declare-fun m!1329451 () Bool)

(assert (=> b!1440272 m!1329451))

(assert (=> b!1440272 m!1329451))

(declare-fun m!1329453 () Bool)

(assert (=> b!1440272 m!1329453))

(assert (=> b!1440272 m!1329453))

(assert (=> b!1440272 m!1329451))

(declare-fun m!1329455 () Bool)

(assert (=> b!1440272 m!1329455))

(declare-fun m!1329457 () Bool)

(assert (=> b!1440266 m!1329457))

(assert (=> b!1440266 m!1329457))

(declare-fun m!1329459 () Bool)

(assert (=> b!1440266 m!1329459))

(declare-fun m!1329461 () Bool)

(assert (=> b!1440269 m!1329461))

(assert (=> b!1440268 m!1329443))

(assert (=> b!1440268 m!1329443))

(declare-fun m!1329463 () Bool)

(assert (=> b!1440268 m!1329463))

(assert (=> b!1440268 m!1329463))

(assert (=> b!1440268 m!1329443))

(declare-fun m!1329465 () Bool)

(assert (=> b!1440268 m!1329465))

(check-sat (not start!124476) (not b!1440271) (not b!1440269) (not b!1440273) (not b!1440268) (not b!1440266) (not b!1440265) (not b!1440272))
(check-sat)
