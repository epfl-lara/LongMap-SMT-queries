; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121140 () Bool)

(assert start!121140)

(declare-fun res!946253 () Bool)

(declare-fun e!797141 () Bool)

(assert (=> start!121140 (=> (not res!946253) (not e!797141))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121140 (= res!946253 (validMask!0 mask!2840))))

(assert (=> start!121140 e!797141))

(assert (=> start!121140 true))

(declare-datatypes ((array!96294 0))(
  ( (array!96295 (arr!46490 (Array (_ BitVec 32) (_ BitVec 64))) (size!47040 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96294)

(declare-fun array_inv!35518 (array!96294) Bool)

(assert (=> start!121140 (array_inv!35518 a!2901)))

(declare-fun b!1408526 () Bool)

(declare-fun e!797138 () Bool)

(assert (=> b!1408526 (= e!797141 (not e!797138))))

(declare-fun res!946251 () Bool)

(assert (=> b!1408526 (=> res!946251 e!797138)))

(declare-datatypes ((SeekEntryResult!10801 0))(
  ( (MissingZero!10801 (index!45581 (_ BitVec 32))) (Found!10801 (index!45582 (_ BitVec 32))) (Intermediate!10801 (undefined!11613 Bool) (index!45583 (_ BitVec 32)) (x!127186 (_ BitVec 32))) (Undefined!10801) (MissingVacant!10801 (index!45584 (_ BitVec 32))) )
))
(declare-fun lt!620382 () SeekEntryResult!10801)

(assert (=> b!1408526 (= res!946251 (or (not (is-Intermediate!10801 lt!620382)) (undefined!11613 lt!620382)))))

(declare-fun e!797140 () Bool)

(assert (=> b!1408526 e!797140))

(declare-fun res!946250 () Bool)

(assert (=> b!1408526 (=> (not res!946250) (not e!797140))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96294 (_ BitVec 32)) Bool)

(assert (=> b!1408526 (= res!946250 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47576 0))(
  ( (Unit!47577) )
))
(declare-fun lt!620380 () Unit!47576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47576)

(assert (=> b!1408526 (= lt!620380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96294 (_ BitVec 32)) SeekEntryResult!10801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408526 (= lt!620382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46490 a!2901) j!112) mask!2840) (select (arr!46490 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408527 () Bool)

(assert (=> b!1408527 (= e!797138 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620381 () SeekEntryResult!10801)

(assert (=> b!1408527 (= lt!620381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46490 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46490 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96295 (store (arr!46490 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47040 a!2901)) mask!2840))))

(declare-fun b!1408528 () Bool)

(declare-fun res!946248 () Bool)

(assert (=> b!1408528 (=> (not res!946248) (not e!797141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408528 (= res!946248 (validKeyInArray!0 (select (arr!46490 a!2901) j!112)))))

(declare-fun b!1408529 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96294 (_ BitVec 32)) SeekEntryResult!10801)

(assert (=> b!1408529 (= e!797140 (= (seekEntryOrOpen!0 (select (arr!46490 a!2901) j!112) a!2901 mask!2840) (Found!10801 j!112)))))

(declare-fun b!1408530 () Bool)

(declare-fun res!946252 () Bool)

(assert (=> b!1408530 (=> (not res!946252) (not e!797141))))

(assert (=> b!1408530 (= res!946252 (validKeyInArray!0 (select (arr!46490 a!2901) i!1037)))))

(declare-fun b!1408531 () Bool)

(declare-fun res!946254 () Bool)

(assert (=> b!1408531 (=> (not res!946254) (not e!797141))))

(declare-datatypes ((List!33009 0))(
  ( (Nil!33006) (Cons!33005 (h!34268 (_ BitVec 64)) (t!47703 List!33009)) )
))
(declare-fun arrayNoDuplicates!0 (array!96294 (_ BitVec 32) List!33009) Bool)

(assert (=> b!1408531 (= res!946254 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33006))))

(declare-fun b!1408532 () Bool)

(declare-fun res!946255 () Bool)

(assert (=> b!1408532 (=> (not res!946255) (not e!797141))))

(assert (=> b!1408532 (= res!946255 (and (= (size!47040 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47040 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47040 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408533 () Bool)

(declare-fun res!946249 () Bool)

(assert (=> b!1408533 (=> (not res!946249) (not e!797141))))

(assert (=> b!1408533 (= res!946249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121140 res!946253) b!1408532))

(assert (= (and b!1408532 res!946255) b!1408530))

(assert (= (and b!1408530 res!946252) b!1408528))

(assert (= (and b!1408528 res!946248) b!1408533))

(assert (= (and b!1408533 res!946249) b!1408531))

(assert (= (and b!1408531 res!946254) b!1408526))

(assert (= (and b!1408526 res!946250) b!1408529))

(assert (= (and b!1408526 (not res!946251)) b!1408527))

(declare-fun m!1297863 () Bool)

(assert (=> b!1408530 m!1297863))

(assert (=> b!1408530 m!1297863))

(declare-fun m!1297865 () Bool)

(assert (=> b!1408530 m!1297865))

(declare-fun m!1297867 () Bool)

(assert (=> b!1408529 m!1297867))

(assert (=> b!1408529 m!1297867))

(declare-fun m!1297869 () Bool)

(assert (=> b!1408529 m!1297869))

(declare-fun m!1297871 () Bool)

(assert (=> start!121140 m!1297871))

(declare-fun m!1297873 () Bool)

(assert (=> start!121140 m!1297873))

(declare-fun m!1297875 () Bool)

(assert (=> b!1408531 m!1297875))

(assert (=> b!1408528 m!1297867))

(assert (=> b!1408528 m!1297867))

(declare-fun m!1297877 () Bool)

(assert (=> b!1408528 m!1297877))

(declare-fun m!1297879 () Bool)

(assert (=> b!1408527 m!1297879))

(declare-fun m!1297881 () Bool)

(assert (=> b!1408527 m!1297881))

(assert (=> b!1408527 m!1297881))

(declare-fun m!1297883 () Bool)

(assert (=> b!1408527 m!1297883))

(assert (=> b!1408527 m!1297883))

(assert (=> b!1408527 m!1297881))

(declare-fun m!1297885 () Bool)

(assert (=> b!1408527 m!1297885))

(assert (=> b!1408526 m!1297867))

(declare-fun m!1297887 () Bool)

(assert (=> b!1408526 m!1297887))

(assert (=> b!1408526 m!1297867))

(declare-fun m!1297889 () Bool)

(assert (=> b!1408526 m!1297889))

(assert (=> b!1408526 m!1297887))

(assert (=> b!1408526 m!1297867))

(declare-fun m!1297891 () Bool)

(assert (=> b!1408526 m!1297891))

(declare-fun m!1297893 () Bool)

(assert (=> b!1408526 m!1297893))

(declare-fun m!1297895 () Bool)

(assert (=> b!1408533 m!1297895))

(push 1)

(assert (not b!1408530))

(assert (not b!1408527))

(assert (not b!1408533))

(assert (not b!1408529))

(assert (not b!1408531))

(assert (not b!1408528))

(assert (not start!121140))

(assert (not b!1408526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

