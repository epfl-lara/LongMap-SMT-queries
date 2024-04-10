; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121124 () Bool)

(assert start!121124)

(declare-fun b!1408330 () Bool)

(declare-fun res!946055 () Bool)

(declare-fun e!797044 () Bool)

(assert (=> b!1408330 (=> res!946055 e!797044)))

(declare-datatypes ((SeekEntryResult!10793 0))(
  ( (MissingZero!10793 (index!45549 (_ BitVec 32))) (Found!10793 (index!45550 (_ BitVec 32))) (Intermediate!10793 (undefined!11605 Bool) (index!45551 (_ BitVec 32)) (x!127154 (_ BitVec 32))) (Undefined!10793) (MissingVacant!10793 (index!45552 (_ BitVec 32))) )
))
(declare-fun lt!620298 () SeekEntryResult!10793)

(declare-fun lt!620295 () (_ BitVec 32))

(declare-datatypes ((array!96278 0))(
  ( (array!96279 (arr!46482 (Array (_ BitVec 32) (_ BitVec 64))) (size!47032 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96278)

(assert (=> b!1408330 (= res!946055 (or (bvslt (x!127154 lt!620298) #b00000000000000000000000000000000) (bvsgt (x!127154 lt!620298) #b01111111111111111111111111111110) (bvslt lt!620295 #b00000000000000000000000000000000) (bvsge lt!620295 (size!47032 a!2901)) (bvslt (index!45551 lt!620298) #b00000000000000000000000000000000) (bvsge (index!45551 lt!620298) (size!47032 a!2901)) (not (= lt!620298 (Intermediate!10793 false (index!45551 lt!620298) (x!127154 lt!620298))))))))

(declare-fun b!1408331 () Bool)

(declare-fun res!946058 () Bool)

(declare-fun e!797045 () Bool)

(assert (=> b!1408331 (=> (not res!946058) (not e!797045))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408331 (= res!946058 (and (= (size!47032 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47032 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47032 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408332 () Bool)

(declare-fun res!946052 () Bool)

(assert (=> b!1408332 (=> (not res!946052) (not e!797045))))

(declare-datatypes ((List!33001 0))(
  ( (Nil!32998) (Cons!32997 (h!34260 (_ BitVec 64)) (t!47695 List!33001)) )
))
(declare-fun arrayNoDuplicates!0 (array!96278 (_ BitVec 32) List!33001) Bool)

(assert (=> b!1408332 (= res!946052 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32998))))

(declare-fun b!1408333 () Bool)

(declare-fun res!946054 () Bool)

(assert (=> b!1408333 (=> (not res!946054) (not e!797045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408333 (= res!946054 (validKeyInArray!0 (select (arr!46482 a!2901) i!1037)))))

(declare-fun b!1408334 () Bool)

(declare-fun e!797042 () Bool)

(assert (=> b!1408334 (= e!797045 (not e!797042))))

(declare-fun res!946060 () Bool)

(assert (=> b!1408334 (=> res!946060 e!797042)))

(get-info :version)

(assert (=> b!1408334 (= res!946060 (or (not ((_ is Intermediate!10793) lt!620298)) (undefined!11605 lt!620298)))))

(declare-fun lt!620296 () SeekEntryResult!10793)

(assert (=> b!1408334 (= lt!620296 (Found!10793 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96278 (_ BitVec 32)) SeekEntryResult!10793)

(assert (=> b!1408334 (= lt!620296 (seekEntryOrOpen!0 (select (arr!46482 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96278 (_ BitVec 32)) Bool)

(assert (=> b!1408334 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47560 0))(
  ( (Unit!47561) )
))
(declare-fun lt!620294 () Unit!47560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47560)

(assert (=> b!1408334 (= lt!620294 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96278 (_ BitVec 32)) SeekEntryResult!10793)

(assert (=> b!1408334 (= lt!620298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620295 (select (arr!46482 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408334 (= lt!620295 (toIndex!0 (select (arr!46482 a!2901) j!112) mask!2840))))

(declare-fun res!946057 () Bool)

(assert (=> start!121124 (=> (not res!946057) (not e!797045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121124 (= res!946057 (validMask!0 mask!2840))))

(assert (=> start!121124 e!797045))

(assert (=> start!121124 true))

(declare-fun array_inv!35510 (array!96278) Bool)

(assert (=> start!121124 (array_inv!35510 a!2901)))

(declare-fun b!1408335 () Bool)

(declare-fun res!946053 () Bool)

(assert (=> b!1408335 (=> (not res!946053) (not e!797045))))

(assert (=> b!1408335 (= res!946053 (validKeyInArray!0 (select (arr!46482 a!2901) j!112)))))

(declare-fun b!1408336 () Bool)

(assert (=> b!1408336 (= e!797044 true)))

(declare-fun lt!620293 () array!96278)

(declare-fun lt!620297 () (_ BitVec 64))

(assert (=> b!1408336 (= lt!620296 (seekEntryOrOpen!0 lt!620297 lt!620293 mask!2840))))

(declare-fun lt!620292 () Unit!47560)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47560)

(assert (=> b!1408336 (= lt!620292 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620295 (x!127154 lt!620298) (index!45551 lt!620298) mask!2840))))

(declare-fun b!1408337 () Bool)

(declare-fun res!946056 () Bool)

(assert (=> b!1408337 (=> (not res!946056) (not e!797045))))

(assert (=> b!1408337 (= res!946056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408338 () Bool)

(assert (=> b!1408338 (= e!797042 e!797044)))

(declare-fun res!946059 () Bool)

(assert (=> b!1408338 (=> res!946059 e!797044)))

(assert (=> b!1408338 (= res!946059 (not (= lt!620298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620297 mask!2840) lt!620297 lt!620293 mask!2840))))))

(assert (=> b!1408338 (= lt!620297 (select (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408338 (= lt!620293 (array!96279 (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47032 a!2901)))))

(assert (= (and start!121124 res!946057) b!1408331))

(assert (= (and b!1408331 res!946058) b!1408333))

(assert (= (and b!1408333 res!946054) b!1408335))

(assert (= (and b!1408335 res!946053) b!1408337))

(assert (= (and b!1408337 res!946056) b!1408332))

(assert (= (and b!1408332 res!946052) b!1408334))

(assert (= (and b!1408334 (not res!946060)) b!1408338))

(assert (= (and b!1408338 (not res!946059)) b!1408330))

(assert (= (and b!1408330 (not res!946055)) b!1408336))

(declare-fun m!1297583 () Bool)

(assert (=> b!1408338 m!1297583))

(assert (=> b!1408338 m!1297583))

(declare-fun m!1297585 () Bool)

(assert (=> b!1408338 m!1297585))

(declare-fun m!1297587 () Bool)

(assert (=> b!1408338 m!1297587))

(declare-fun m!1297589 () Bool)

(assert (=> b!1408338 m!1297589))

(declare-fun m!1297591 () Bool)

(assert (=> b!1408337 m!1297591))

(declare-fun m!1297593 () Bool)

(assert (=> b!1408336 m!1297593))

(declare-fun m!1297595 () Bool)

(assert (=> b!1408336 m!1297595))

(declare-fun m!1297597 () Bool)

(assert (=> b!1408332 m!1297597))

(declare-fun m!1297599 () Bool)

(assert (=> b!1408334 m!1297599))

(declare-fun m!1297601 () Bool)

(assert (=> b!1408334 m!1297601))

(assert (=> b!1408334 m!1297599))

(declare-fun m!1297603 () Bool)

(assert (=> b!1408334 m!1297603))

(assert (=> b!1408334 m!1297599))

(declare-fun m!1297605 () Bool)

(assert (=> b!1408334 m!1297605))

(assert (=> b!1408334 m!1297599))

(declare-fun m!1297607 () Bool)

(assert (=> b!1408334 m!1297607))

(declare-fun m!1297609 () Bool)

(assert (=> b!1408334 m!1297609))

(assert (=> b!1408335 m!1297599))

(assert (=> b!1408335 m!1297599))

(declare-fun m!1297611 () Bool)

(assert (=> b!1408335 m!1297611))

(declare-fun m!1297613 () Bool)

(assert (=> b!1408333 m!1297613))

(assert (=> b!1408333 m!1297613))

(declare-fun m!1297615 () Bool)

(assert (=> b!1408333 m!1297615))

(declare-fun m!1297617 () Bool)

(assert (=> start!121124 m!1297617))

(declare-fun m!1297619 () Bool)

(assert (=> start!121124 m!1297619))

(check-sat (not b!1408334) (not b!1408336) (not b!1408332) (not b!1408338) (not b!1408335) (not b!1408337) (not start!121124) (not b!1408333))
(check-sat)
