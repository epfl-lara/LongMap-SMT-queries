; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121226 () Bool)

(assert start!121226)

(declare-fun b!1409558 () Bool)

(declare-fun res!947284 () Bool)

(declare-fun e!797655 () Bool)

(assert (=> b!1409558 (=> (not res!947284) (not e!797655))))

(declare-datatypes ((array!96380 0))(
  ( (array!96381 (arr!46533 (Array (_ BitVec 32) (_ BitVec 64))) (size!47083 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96380)

(declare-datatypes ((List!33052 0))(
  ( (Nil!33049) (Cons!33048 (h!34311 (_ BitVec 64)) (t!47746 List!33052)) )
))
(declare-fun arrayNoDuplicates!0 (array!96380 (_ BitVec 32) List!33052) Bool)

(assert (=> b!1409558 (= res!947284 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33049))))

(declare-fun res!947283 () Bool)

(assert (=> start!121226 (=> (not res!947283) (not e!797655))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121226 (= res!947283 (validMask!0 mask!2840))))

(assert (=> start!121226 e!797655))

(assert (=> start!121226 true))

(declare-fun array_inv!35561 (array!96380) Bool)

(assert (=> start!121226 (array_inv!35561 a!2901)))

(declare-fun e!797656 () Bool)

(declare-fun b!1409559 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10844 0))(
  ( (MissingZero!10844 (index!45753 (_ BitVec 32))) (Found!10844 (index!45754 (_ BitVec 32))) (Intermediate!10844 (undefined!11656 Bool) (index!45755 (_ BitVec 32)) (x!127341 (_ BitVec 32))) (Undefined!10844) (MissingVacant!10844 (index!45756 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96380 (_ BitVec 32)) SeekEntryResult!10844)

(assert (=> b!1409559 (= e!797656 (= (seekEntryOrOpen!0 (select (arr!46533 a!2901) j!112) a!2901 mask!2840) (Found!10844 j!112)))))

(declare-fun b!1409560 () Bool)

(declare-fun e!797657 () Bool)

(assert (=> b!1409560 (= e!797655 (not e!797657))))

(declare-fun res!947287 () Bool)

(assert (=> b!1409560 (=> res!947287 e!797657)))

(declare-fun lt!620767 () SeekEntryResult!10844)

(get-info :version)

(assert (=> b!1409560 (= res!947287 (or (not ((_ is Intermediate!10844) lt!620767)) (undefined!11656 lt!620767)))))

(assert (=> b!1409560 e!797656))

(declare-fun res!947285 () Bool)

(assert (=> b!1409560 (=> (not res!947285) (not e!797656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96380 (_ BitVec 32)) Bool)

(assert (=> b!1409560 (= res!947285 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47662 0))(
  ( (Unit!47663) )
))
(declare-fun lt!620769 () Unit!47662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47662)

(assert (=> b!1409560 (= lt!620769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96380 (_ BitVec 32)) SeekEntryResult!10844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409560 (= lt!620767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46533 a!2901) j!112) mask!2840) (select (arr!46533 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409561 () Bool)

(declare-fun res!947286 () Bool)

(assert (=> b!1409561 (=> (not res!947286) (not e!797655))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409561 (= res!947286 (validKeyInArray!0 (select (arr!46533 a!2901) i!1037)))))

(declare-fun b!1409562 () Bool)

(declare-fun res!947280 () Bool)

(assert (=> b!1409562 (=> (not res!947280) (not e!797655))))

(assert (=> b!1409562 (= res!947280 (validKeyInArray!0 (select (arr!46533 a!2901) j!112)))))

(declare-fun b!1409563 () Bool)

(declare-fun res!947281 () Bool)

(assert (=> b!1409563 (=> (not res!947281) (not e!797655))))

(assert (=> b!1409563 (= res!947281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409564 () Bool)

(assert (=> b!1409564 (= e!797657 true)))

(declare-fun lt!620768 () SeekEntryResult!10844)

(assert (=> b!1409564 (= lt!620768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46533 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46533 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96381 (store (arr!46533 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47083 a!2901)) mask!2840))))

(declare-fun b!1409565 () Bool)

(declare-fun res!947282 () Bool)

(assert (=> b!1409565 (=> (not res!947282) (not e!797655))))

(assert (=> b!1409565 (= res!947282 (and (= (size!47083 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47083 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47083 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121226 res!947283) b!1409565))

(assert (= (and b!1409565 res!947282) b!1409561))

(assert (= (and b!1409561 res!947286) b!1409562))

(assert (= (and b!1409562 res!947280) b!1409563))

(assert (= (and b!1409563 res!947281) b!1409558))

(assert (= (and b!1409558 res!947284) b!1409560))

(assert (= (and b!1409560 res!947285) b!1409559))

(assert (= (and b!1409560 (not res!947287)) b!1409564))

(declare-fun m!1299325 () Bool)

(assert (=> b!1409559 m!1299325))

(assert (=> b!1409559 m!1299325))

(declare-fun m!1299327 () Bool)

(assert (=> b!1409559 m!1299327))

(declare-fun m!1299329 () Bool)

(assert (=> start!121226 m!1299329))

(declare-fun m!1299331 () Bool)

(assert (=> start!121226 m!1299331))

(declare-fun m!1299333 () Bool)

(assert (=> b!1409564 m!1299333))

(declare-fun m!1299335 () Bool)

(assert (=> b!1409564 m!1299335))

(assert (=> b!1409564 m!1299335))

(declare-fun m!1299337 () Bool)

(assert (=> b!1409564 m!1299337))

(assert (=> b!1409564 m!1299337))

(assert (=> b!1409564 m!1299335))

(declare-fun m!1299339 () Bool)

(assert (=> b!1409564 m!1299339))

(declare-fun m!1299341 () Bool)

(assert (=> b!1409561 m!1299341))

(assert (=> b!1409561 m!1299341))

(declare-fun m!1299343 () Bool)

(assert (=> b!1409561 m!1299343))

(declare-fun m!1299345 () Bool)

(assert (=> b!1409558 m!1299345))

(declare-fun m!1299347 () Bool)

(assert (=> b!1409563 m!1299347))

(assert (=> b!1409562 m!1299325))

(assert (=> b!1409562 m!1299325))

(declare-fun m!1299349 () Bool)

(assert (=> b!1409562 m!1299349))

(assert (=> b!1409560 m!1299325))

(declare-fun m!1299351 () Bool)

(assert (=> b!1409560 m!1299351))

(assert (=> b!1409560 m!1299325))

(declare-fun m!1299353 () Bool)

(assert (=> b!1409560 m!1299353))

(assert (=> b!1409560 m!1299351))

(assert (=> b!1409560 m!1299325))

(declare-fun m!1299355 () Bool)

(assert (=> b!1409560 m!1299355))

(declare-fun m!1299357 () Bool)

(assert (=> b!1409560 m!1299357))

(check-sat (not b!1409558) (not start!121226) (not b!1409562) (not b!1409563) (not b!1409560) (not b!1409559) (not b!1409564) (not b!1409561))
