; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119626 () Bool)

(assert start!119626)

(declare-fun b!1393452 () Bool)

(declare-fun res!932862 () Bool)

(declare-fun e!789024 () Bool)

(assert (=> b!1393452 (=> (not res!932862) (not e!789024))))

(declare-datatypes ((array!95308 0))(
  ( (array!95309 (arr!46012 (Array (_ BitVec 32) (_ BitVec 64))) (size!46562 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95308)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393452 (= res!932862 (validKeyInArray!0 (select (arr!46012 a!2901) i!1037)))))

(declare-fun b!1393453 () Bool)

(declare-fun e!789025 () Bool)

(assert (=> b!1393453 (= e!789025 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10329 0))(
  ( (MissingZero!10329 (index!43687 (_ BitVec 32))) (Found!10329 (index!43688 (_ BitVec 32))) (Intermediate!10329 (undefined!11141 Bool) (index!43689 (_ BitVec 32)) (x!125365 (_ BitVec 32))) (Undefined!10329) (MissingVacant!10329 (index!43690 (_ BitVec 32))) )
))
(declare-fun lt!611996 () SeekEntryResult!10329)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95308 (_ BitVec 32)) SeekEntryResult!10329)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393453 (= lt!611996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46012 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46012 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95309 (store (arr!46012 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46562 a!2901)) mask!2840))))

(declare-fun b!1393454 () Bool)

(declare-fun res!932863 () Bool)

(assert (=> b!1393454 (=> (not res!932863) (not e!789024))))

(assert (=> b!1393454 (= res!932863 (and (= (size!46562 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46562 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46562 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393455 () Bool)

(declare-fun res!932866 () Bool)

(assert (=> b!1393455 (=> (not res!932866) (not e!789024))))

(assert (=> b!1393455 (= res!932866 (validKeyInArray!0 (select (arr!46012 a!2901) j!112)))))

(declare-fun b!1393456 () Bool)

(assert (=> b!1393456 (= e!789024 (not e!789025))))

(declare-fun res!932861 () Bool)

(assert (=> b!1393456 (=> res!932861 e!789025)))

(declare-fun lt!611995 () SeekEntryResult!10329)

(assert (=> b!1393456 (= res!932861 (or (not (is-Intermediate!10329 lt!611995)) (undefined!11141 lt!611995)))))

(declare-fun e!789026 () Bool)

(assert (=> b!1393456 e!789026))

(declare-fun res!932859 () Bool)

(assert (=> b!1393456 (=> (not res!932859) (not e!789026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95308 (_ BitVec 32)) Bool)

(assert (=> b!1393456 (= res!932859 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46662 0))(
  ( (Unit!46663) )
))
(declare-fun lt!611997 () Unit!46662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46662)

(assert (=> b!1393456 (= lt!611997 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393456 (= lt!611995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46012 a!2901) j!112) mask!2840) (select (arr!46012 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393457 () Bool)

(declare-fun res!932865 () Bool)

(assert (=> b!1393457 (=> (not res!932865) (not e!789024))))

(assert (=> b!1393457 (= res!932865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393458 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95308 (_ BitVec 32)) SeekEntryResult!10329)

(assert (=> b!1393458 (= e!789026 (= (seekEntryOrOpen!0 (select (arr!46012 a!2901) j!112) a!2901 mask!2840) (Found!10329 j!112)))))

(declare-fun res!932864 () Bool)

(assert (=> start!119626 (=> (not res!932864) (not e!789024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119626 (= res!932864 (validMask!0 mask!2840))))

(assert (=> start!119626 e!789024))

(assert (=> start!119626 true))

(declare-fun array_inv!35040 (array!95308) Bool)

(assert (=> start!119626 (array_inv!35040 a!2901)))

(declare-fun b!1393451 () Bool)

(declare-fun res!932860 () Bool)

(assert (=> b!1393451 (=> (not res!932860) (not e!789024))))

(declare-datatypes ((List!32531 0))(
  ( (Nil!32528) (Cons!32527 (h!33760 (_ BitVec 64)) (t!47225 List!32531)) )
))
(declare-fun arrayNoDuplicates!0 (array!95308 (_ BitVec 32) List!32531) Bool)

(assert (=> b!1393451 (= res!932860 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32528))))

(assert (= (and start!119626 res!932864) b!1393454))

(assert (= (and b!1393454 res!932863) b!1393452))

(assert (= (and b!1393452 res!932862) b!1393455))

(assert (= (and b!1393455 res!932866) b!1393457))

(assert (= (and b!1393457 res!932865) b!1393451))

(assert (= (and b!1393451 res!932860) b!1393456))

(assert (= (and b!1393456 res!932859) b!1393458))

(assert (= (and b!1393456 (not res!932861)) b!1393453))

(declare-fun m!1279367 () Bool)

(assert (=> b!1393457 m!1279367))

(declare-fun m!1279369 () Bool)

(assert (=> b!1393456 m!1279369))

(declare-fun m!1279371 () Bool)

(assert (=> b!1393456 m!1279371))

(assert (=> b!1393456 m!1279369))

(declare-fun m!1279373 () Bool)

(assert (=> b!1393456 m!1279373))

(assert (=> b!1393456 m!1279371))

(assert (=> b!1393456 m!1279369))

(declare-fun m!1279375 () Bool)

(assert (=> b!1393456 m!1279375))

(declare-fun m!1279377 () Bool)

(assert (=> b!1393456 m!1279377))

(assert (=> b!1393458 m!1279369))

(assert (=> b!1393458 m!1279369))

(declare-fun m!1279379 () Bool)

(assert (=> b!1393458 m!1279379))

(declare-fun m!1279381 () Bool)

(assert (=> start!119626 m!1279381))

(declare-fun m!1279383 () Bool)

(assert (=> start!119626 m!1279383))

(declare-fun m!1279385 () Bool)

(assert (=> b!1393452 m!1279385))

(assert (=> b!1393452 m!1279385))

(declare-fun m!1279387 () Bool)

(assert (=> b!1393452 m!1279387))

(declare-fun m!1279389 () Bool)

(assert (=> b!1393451 m!1279389))

(assert (=> b!1393455 m!1279369))

(assert (=> b!1393455 m!1279369))

(declare-fun m!1279391 () Bool)

(assert (=> b!1393455 m!1279391))

(declare-fun m!1279393 () Bool)

(assert (=> b!1393453 m!1279393))

(declare-fun m!1279395 () Bool)

(assert (=> b!1393453 m!1279395))

(assert (=> b!1393453 m!1279395))

(declare-fun m!1279397 () Bool)

(assert (=> b!1393453 m!1279397))

(assert (=> b!1393453 m!1279397))

(assert (=> b!1393453 m!1279395))

(declare-fun m!1279399 () Bool)

(assert (=> b!1393453 m!1279399))

(push 1)

(assert (not b!1393451))

(assert (not b!1393455))

(assert (not b!1393452))

(assert (not start!119626))

(assert (not b!1393458))

(assert (not b!1393456))

(assert (not b!1393457))

(assert (not b!1393453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

