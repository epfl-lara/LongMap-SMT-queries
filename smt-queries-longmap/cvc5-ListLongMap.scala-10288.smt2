; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120888 () Bool)

(assert start!120888)

(declare-fun res!944836 () Bool)

(declare-fun e!796109 () Bool)

(assert (=> start!120888 (=> (not res!944836) (not e!796109))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120888 (= res!944836 (validMask!0 mask!2840))))

(assert (=> start!120888 e!796109))

(assert (=> start!120888 true))

(declare-datatypes ((array!96148 0))(
  ( (array!96149 (arr!46422 (Array (_ BitVec 32) (_ BitVec 64))) (size!46974 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96148)

(declare-fun array_inv!35655 (array!96148) Bool)

(assert (=> start!120888 (array_inv!35655 a!2901)))

(declare-fun b!1406567 () Bool)

(declare-fun res!944840 () Bool)

(assert (=> b!1406567 (=> (not res!944840) (not e!796109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96148 (_ BitVec 32)) Bool)

(assert (=> b!1406567 (= res!944840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406568 () Bool)

(declare-fun e!796106 () Bool)

(assert (=> b!1406568 (= e!796106 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10759 0))(
  ( (MissingZero!10759 (index!45413 (_ BitVec 32))) (Found!10759 (index!45414 (_ BitVec 32))) (Intermediate!10759 (undefined!11571 Bool) (index!45415 (_ BitVec 32)) (x!127003 (_ BitVec 32))) (Undefined!10759) (MissingVacant!10759 (index!45416 (_ BitVec 32))) )
))
(declare-fun lt!619274 () SeekEntryResult!10759)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96148 (_ BitVec 32)) SeekEntryResult!10759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406568 (= lt!619274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46422 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46422 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96149 (store (arr!46422 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46974 a!2901)) mask!2840))))

(declare-fun b!1406569 () Bool)

(assert (=> b!1406569 (= e!796109 (not e!796106))))

(declare-fun res!944838 () Bool)

(assert (=> b!1406569 (=> res!944838 e!796106)))

(declare-fun lt!619272 () SeekEntryResult!10759)

(assert (=> b!1406569 (= res!944838 (or (not (is-Intermediate!10759 lt!619272)) (undefined!11571 lt!619272)))))

(declare-fun e!796108 () Bool)

(assert (=> b!1406569 e!796108))

(declare-fun res!944841 () Bool)

(assert (=> b!1406569 (=> (not res!944841) (not e!796108))))

(assert (=> b!1406569 (= res!944841 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47335 0))(
  ( (Unit!47336) )
))
(declare-fun lt!619273 () Unit!47335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47335)

(assert (=> b!1406569 (= lt!619273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406569 (= lt!619272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46422 a!2901) j!112) mask!2840) (select (arr!46422 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406570 () Bool)

(declare-fun res!944835 () Bool)

(assert (=> b!1406570 (=> (not res!944835) (not e!796109))))

(assert (=> b!1406570 (= res!944835 (and (= (size!46974 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46974 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46974 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406571 () Bool)

(declare-fun res!944837 () Bool)

(assert (=> b!1406571 (=> (not res!944837) (not e!796109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406571 (= res!944837 (validKeyInArray!0 (select (arr!46422 a!2901) i!1037)))))

(declare-fun b!1406572 () Bool)

(declare-fun res!944839 () Bool)

(assert (=> b!1406572 (=> (not res!944839) (not e!796109))))

(declare-datatypes ((List!33019 0))(
  ( (Nil!33016) (Cons!33015 (h!34269 (_ BitVec 64)) (t!47705 List!33019)) )
))
(declare-fun arrayNoDuplicates!0 (array!96148 (_ BitVec 32) List!33019) Bool)

(assert (=> b!1406572 (= res!944839 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33016))))

(declare-fun b!1406573 () Bool)

(declare-fun res!944842 () Bool)

(assert (=> b!1406573 (=> (not res!944842) (not e!796109))))

(assert (=> b!1406573 (= res!944842 (validKeyInArray!0 (select (arr!46422 a!2901) j!112)))))

(declare-fun b!1406574 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96148 (_ BitVec 32)) SeekEntryResult!10759)

(assert (=> b!1406574 (= e!796108 (= (seekEntryOrOpen!0 (select (arr!46422 a!2901) j!112) a!2901 mask!2840) (Found!10759 j!112)))))

(assert (= (and start!120888 res!944836) b!1406570))

(assert (= (and b!1406570 res!944835) b!1406571))

(assert (= (and b!1406571 res!944837) b!1406573))

(assert (= (and b!1406573 res!944842) b!1406567))

(assert (= (and b!1406567 res!944840) b!1406572))

(assert (= (and b!1406572 res!944839) b!1406569))

(assert (= (and b!1406569 res!944841) b!1406574))

(assert (= (and b!1406569 (not res!944838)) b!1406568))

(declare-fun m!1295343 () Bool)

(assert (=> b!1406572 m!1295343))

(declare-fun m!1295345 () Bool)

(assert (=> b!1406571 m!1295345))

(assert (=> b!1406571 m!1295345))

(declare-fun m!1295347 () Bool)

(assert (=> b!1406571 m!1295347))

(declare-fun m!1295349 () Bool)

(assert (=> b!1406569 m!1295349))

(declare-fun m!1295351 () Bool)

(assert (=> b!1406569 m!1295351))

(assert (=> b!1406569 m!1295349))

(declare-fun m!1295353 () Bool)

(assert (=> b!1406569 m!1295353))

(assert (=> b!1406569 m!1295351))

(assert (=> b!1406569 m!1295349))

(declare-fun m!1295355 () Bool)

(assert (=> b!1406569 m!1295355))

(declare-fun m!1295357 () Bool)

(assert (=> b!1406569 m!1295357))

(declare-fun m!1295359 () Bool)

(assert (=> b!1406568 m!1295359))

(declare-fun m!1295361 () Bool)

(assert (=> b!1406568 m!1295361))

(assert (=> b!1406568 m!1295361))

(declare-fun m!1295363 () Bool)

(assert (=> b!1406568 m!1295363))

(assert (=> b!1406568 m!1295363))

(assert (=> b!1406568 m!1295361))

(declare-fun m!1295365 () Bool)

(assert (=> b!1406568 m!1295365))

(declare-fun m!1295367 () Bool)

(assert (=> b!1406567 m!1295367))

(declare-fun m!1295369 () Bool)

(assert (=> start!120888 m!1295369))

(declare-fun m!1295371 () Bool)

(assert (=> start!120888 m!1295371))

(assert (=> b!1406574 m!1295349))

(assert (=> b!1406574 m!1295349))

(declare-fun m!1295373 () Bool)

(assert (=> b!1406574 m!1295373))

(assert (=> b!1406573 m!1295349))

(assert (=> b!1406573 m!1295349))

(declare-fun m!1295375 () Bool)

(assert (=> b!1406573 m!1295375))

(push 1)

(assert (not b!1406573))

(assert (not start!120888))

(assert (not b!1406569))

(assert (not b!1406568))

(assert (not b!1406574))

(assert (not b!1406571))

(assert (not b!1406567))

(assert (not b!1406572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

