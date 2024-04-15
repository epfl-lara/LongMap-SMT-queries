; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119804 () Bool)

(assert start!119804)

(declare-fun res!934563 () Bool)

(declare-fun e!789922 () Bool)

(assert (=> start!119804 (=> (not res!934563) (not e!789922))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119804 (= res!934563 (validMask!0 mask!2840))))

(assert (=> start!119804 e!789922))

(assert (=> start!119804 true))

(declare-datatypes ((array!95388 0))(
  ( (array!95389 (arr!46051 (Array (_ BitVec 32) (_ BitVec 64))) (size!46603 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95388)

(declare-fun array_inv!35284 (array!95388) Bool)

(assert (=> start!119804 (array_inv!35284 a!2901)))

(declare-fun b!1395262 () Bool)

(declare-fun res!934556 () Bool)

(assert (=> b!1395262 (=> (not res!934556) (not e!789922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95388 (_ BitVec 32)) Bool)

(assert (=> b!1395262 (= res!934556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395263 () Bool)

(declare-fun res!934564 () Bool)

(assert (=> b!1395263 (=> (not res!934564) (not e!789922))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395263 (= res!934564 (validKeyInArray!0 (select (arr!46051 a!2901) j!112)))))

(declare-fun b!1395264 () Bool)

(declare-fun res!934559 () Bool)

(assert (=> b!1395264 (=> (not res!934559) (not e!789922))))

(declare-datatypes ((List!32648 0))(
  ( (Nil!32645) (Cons!32644 (h!33880 (_ BitVec 64)) (t!47334 List!32648)) )
))
(declare-fun arrayNoDuplicates!0 (array!95388 (_ BitVec 32) List!32648) Bool)

(assert (=> b!1395264 (= res!934559 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32645))))

(declare-fun b!1395265 () Bool)

(declare-fun e!789923 () Bool)

(assert (=> b!1395265 (= e!789922 (not e!789923))))

(declare-fun res!934558 () Bool)

(assert (=> b!1395265 (=> res!934558 e!789923)))

(declare-datatypes ((SeekEntryResult!10394 0))(
  ( (MissingZero!10394 (index!43947 (_ BitVec 32))) (Found!10394 (index!43948 (_ BitVec 32))) (Intermediate!10394 (undefined!11206 Bool) (index!43949 (_ BitVec 32)) (x!125609 (_ BitVec 32))) (Undefined!10394) (MissingVacant!10394 (index!43950 (_ BitVec 32))) )
))
(declare-fun lt!612769 () SeekEntryResult!10394)

(get-info :version)

(assert (=> b!1395265 (= res!934558 (or (not ((_ is Intermediate!10394) lt!612769)) (undefined!11206 lt!612769)))))

(declare-fun e!789920 () Bool)

(assert (=> b!1395265 e!789920))

(declare-fun res!934560 () Bool)

(assert (=> b!1395265 (=> (not res!934560) (not e!789920))))

(assert (=> b!1395265 (= res!934560 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46635 0))(
  ( (Unit!46636) )
))
(declare-fun lt!612770 () Unit!46635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46635)

(assert (=> b!1395265 (= lt!612770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95388 (_ BitVec 32)) SeekEntryResult!10394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395265 (= lt!612769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46051 a!2901) j!112) mask!2840) (select (arr!46051 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395266 () Bool)

(assert (=> b!1395266 (= e!789923 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1395267 () Bool)

(declare-fun res!934561 () Bool)

(assert (=> b!1395267 (=> res!934561 e!789923)))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395267 (= res!934561 (= lt!612769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46051 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46051 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95389 (store (arr!46051 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46603 a!2901)) mask!2840)))))

(declare-fun b!1395268 () Bool)

(declare-fun res!934557 () Bool)

(assert (=> b!1395268 (=> (not res!934557) (not e!789922))))

(assert (=> b!1395268 (= res!934557 (validKeyInArray!0 (select (arr!46051 a!2901) i!1037)))))

(declare-fun b!1395269 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95388 (_ BitVec 32)) SeekEntryResult!10394)

(assert (=> b!1395269 (= e!789920 (= (seekEntryOrOpen!0 (select (arr!46051 a!2901) j!112) a!2901 mask!2840) (Found!10394 j!112)))))

(declare-fun b!1395270 () Bool)

(declare-fun res!934562 () Bool)

(assert (=> b!1395270 (=> (not res!934562) (not e!789922))))

(assert (=> b!1395270 (= res!934562 (and (= (size!46603 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46603 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46603 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119804 res!934563) b!1395270))

(assert (= (and b!1395270 res!934562) b!1395268))

(assert (= (and b!1395268 res!934557) b!1395263))

(assert (= (and b!1395263 res!934564) b!1395262))

(assert (= (and b!1395262 res!934556) b!1395264))

(assert (= (and b!1395264 res!934559) b!1395265))

(assert (= (and b!1395265 res!934560) b!1395269))

(assert (= (and b!1395265 (not res!934558)) b!1395267))

(assert (= (and b!1395267 (not res!934561)) b!1395266))

(declare-fun m!1281259 () Bool)

(assert (=> b!1395267 m!1281259))

(declare-fun m!1281261 () Bool)

(assert (=> b!1395267 m!1281261))

(assert (=> b!1395267 m!1281261))

(declare-fun m!1281263 () Bool)

(assert (=> b!1395267 m!1281263))

(assert (=> b!1395267 m!1281263))

(assert (=> b!1395267 m!1281261))

(declare-fun m!1281265 () Bool)

(assert (=> b!1395267 m!1281265))

(declare-fun m!1281267 () Bool)

(assert (=> b!1395262 m!1281267))

(declare-fun m!1281269 () Bool)

(assert (=> b!1395264 m!1281269))

(declare-fun m!1281271 () Bool)

(assert (=> b!1395268 m!1281271))

(assert (=> b!1395268 m!1281271))

(declare-fun m!1281273 () Bool)

(assert (=> b!1395268 m!1281273))

(declare-fun m!1281275 () Bool)

(assert (=> b!1395263 m!1281275))

(assert (=> b!1395263 m!1281275))

(declare-fun m!1281277 () Bool)

(assert (=> b!1395263 m!1281277))

(assert (=> b!1395265 m!1281275))

(declare-fun m!1281279 () Bool)

(assert (=> b!1395265 m!1281279))

(assert (=> b!1395265 m!1281275))

(declare-fun m!1281281 () Bool)

(assert (=> b!1395265 m!1281281))

(assert (=> b!1395265 m!1281279))

(assert (=> b!1395265 m!1281275))

(declare-fun m!1281283 () Bool)

(assert (=> b!1395265 m!1281283))

(declare-fun m!1281285 () Bool)

(assert (=> b!1395265 m!1281285))

(declare-fun m!1281287 () Bool)

(assert (=> start!119804 m!1281287))

(declare-fun m!1281289 () Bool)

(assert (=> start!119804 m!1281289))

(assert (=> b!1395269 m!1281275))

(assert (=> b!1395269 m!1281275))

(declare-fun m!1281291 () Bool)

(assert (=> b!1395269 m!1281291))

(check-sat (not b!1395265) (not b!1395264) (not b!1395269) (not b!1395268) (not start!119804) (not b!1395263) (not b!1395262) (not b!1395267))
(check-sat)
