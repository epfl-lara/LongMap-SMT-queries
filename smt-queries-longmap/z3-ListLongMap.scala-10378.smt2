; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122192 () Bool)

(assert start!122192)

(declare-fun b!1417530 () Bool)

(declare-fun res!953266 () Bool)

(declare-fun e!802249 () Bool)

(assert (=> b!1417530 (=> (not res!953266) (not e!802249))))

(declare-datatypes ((array!96776 0))(
  ( (array!96777 (arr!46716 (Array (_ BitVec 32) (_ BitVec 64))) (size!47266 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96776)

(declare-datatypes ((List!33235 0))(
  ( (Nil!33232) (Cons!33231 (h!34524 (_ BitVec 64)) (t!47929 List!33235)) )
))
(declare-fun arrayNoDuplicates!0 (array!96776 (_ BitVec 32) List!33235) Bool)

(assert (=> b!1417530 (= res!953266 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33232))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!802248 () Bool)

(declare-fun b!1417531 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11027 0))(
  ( (MissingZero!11027 (index!46500 (_ BitVec 32))) (Found!11027 (index!46501 (_ BitVec 32))) (Intermediate!11027 (undefined!11839 Bool) (index!46502 (_ BitVec 32)) (x!128102 (_ BitVec 32))) (Undefined!11027) (MissingVacant!11027 (index!46503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96776 (_ BitVec 32)) SeekEntryResult!11027)

(assert (=> b!1417531 (= e!802248 (= (seekEntryOrOpen!0 (select (arr!46716 a!2901) j!112) a!2901 mask!2840) (Found!11027 j!112)))))

(declare-fun b!1417532 () Bool)

(declare-fun res!953261 () Bool)

(assert (=> b!1417532 (=> (not res!953261) (not e!802249))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417532 (= res!953261 (validKeyInArray!0 (select (arr!46716 a!2901) i!1037)))))

(declare-fun b!1417533 () Bool)

(declare-fun res!953263 () Bool)

(assert (=> b!1417533 (=> (not res!953263) (not e!802249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96776 (_ BitVec 32)) Bool)

(assert (=> b!1417533 (= res!953263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!953264 () Bool)

(assert (=> start!122192 (=> (not res!953264) (not e!802249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122192 (= res!953264 (validMask!0 mask!2840))))

(assert (=> start!122192 e!802249))

(assert (=> start!122192 true))

(declare-fun array_inv!35744 (array!96776) Bool)

(assert (=> start!122192 (array_inv!35744 a!2901)))

(declare-fun b!1417534 () Bool)

(declare-fun res!953260 () Bool)

(assert (=> b!1417534 (=> (not res!953260) (not e!802249))))

(assert (=> b!1417534 (= res!953260 (and (= (size!47266 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47266 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47266 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417535 () Bool)

(assert (=> b!1417535 (= e!802249 (not true))))

(assert (=> b!1417535 e!802248))

(declare-fun res!953262 () Bool)

(assert (=> b!1417535 (=> (not res!953262) (not e!802248))))

(assert (=> b!1417535 (= res!953262 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48028 0))(
  ( (Unit!48029) )
))
(declare-fun lt!625398 () Unit!48028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48028)

(assert (=> b!1417535 (= lt!625398 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625397 () SeekEntryResult!11027)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96776 (_ BitVec 32)) SeekEntryResult!11027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417535 (= lt!625397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46716 a!2901) j!112) mask!2840) (select (arr!46716 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417536 () Bool)

(declare-fun res!953265 () Bool)

(assert (=> b!1417536 (=> (not res!953265) (not e!802249))))

(assert (=> b!1417536 (= res!953265 (validKeyInArray!0 (select (arr!46716 a!2901) j!112)))))

(assert (= (and start!122192 res!953264) b!1417534))

(assert (= (and b!1417534 res!953260) b!1417532))

(assert (= (and b!1417532 res!953261) b!1417536))

(assert (= (and b!1417536 res!953265) b!1417533))

(assert (= (and b!1417533 res!953263) b!1417530))

(assert (= (and b!1417530 res!953266) b!1417535))

(assert (= (and b!1417535 res!953262) b!1417531))

(declare-fun m!1308269 () Bool)

(assert (=> b!1417536 m!1308269))

(assert (=> b!1417536 m!1308269))

(declare-fun m!1308271 () Bool)

(assert (=> b!1417536 m!1308271))

(assert (=> b!1417535 m!1308269))

(declare-fun m!1308273 () Bool)

(assert (=> b!1417535 m!1308273))

(assert (=> b!1417535 m!1308269))

(declare-fun m!1308275 () Bool)

(assert (=> b!1417535 m!1308275))

(assert (=> b!1417535 m!1308273))

(assert (=> b!1417535 m!1308269))

(declare-fun m!1308277 () Bool)

(assert (=> b!1417535 m!1308277))

(declare-fun m!1308279 () Bool)

(assert (=> b!1417535 m!1308279))

(declare-fun m!1308281 () Bool)

(assert (=> b!1417532 m!1308281))

(assert (=> b!1417532 m!1308281))

(declare-fun m!1308283 () Bool)

(assert (=> b!1417532 m!1308283))

(declare-fun m!1308285 () Bool)

(assert (=> b!1417533 m!1308285))

(declare-fun m!1308287 () Bool)

(assert (=> start!122192 m!1308287))

(declare-fun m!1308289 () Bool)

(assert (=> start!122192 m!1308289))

(assert (=> b!1417531 m!1308269))

(assert (=> b!1417531 m!1308269))

(declare-fun m!1308291 () Bool)

(assert (=> b!1417531 m!1308291))

(declare-fun m!1308293 () Bool)

(assert (=> b!1417530 m!1308293))

(check-sat (not b!1417536) (not b!1417535) (not b!1417531) (not b!1417532) (not b!1417533) (not b!1417530) (not start!122192))
(check-sat)
