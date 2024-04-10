; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121212 () Bool)

(assert start!121212)

(declare-fun b!1409390 () Bool)

(declare-fun res!947117 () Bool)

(declare-fun e!797570 () Bool)

(assert (=> b!1409390 (=> (not res!947117) (not e!797570))))

(declare-datatypes ((array!96366 0))(
  ( (array!96367 (arr!46526 (Array (_ BitVec 32) (_ BitVec 64))) (size!47076 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96366)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96366 (_ BitVec 32)) Bool)

(assert (=> b!1409390 (= res!947117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409391 () Bool)

(declare-fun res!947116 () Bool)

(assert (=> b!1409391 (=> (not res!947116) (not e!797570))))

(declare-datatypes ((List!33045 0))(
  ( (Nil!33042) (Cons!33041 (h!34304 (_ BitVec 64)) (t!47739 List!33045)) )
))
(declare-fun arrayNoDuplicates!0 (array!96366 (_ BitVec 32) List!33045) Bool)

(assert (=> b!1409391 (= res!947116 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33042))))

(declare-fun b!1409392 () Bool)

(declare-fun e!797571 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10837 0))(
  ( (MissingZero!10837 (index!45725 (_ BitVec 32))) (Found!10837 (index!45726 (_ BitVec 32))) (Intermediate!10837 (undefined!11649 Bool) (index!45727 (_ BitVec 32)) (x!127318 (_ BitVec 32))) (Undefined!10837) (MissingVacant!10837 (index!45728 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96366 (_ BitVec 32)) SeekEntryResult!10837)

(assert (=> b!1409392 (= e!797571 (= (seekEntryOrOpen!0 (select (arr!46526 a!2901) j!112) a!2901 mask!2840) (Found!10837 j!112)))))

(declare-fun b!1409394 () Bool)

(declare-fun res!947114 () Bool)

(assert (=> b!1409394 (=> (not res!947114) (not e!797570))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409394 (= res!947114 (validKeyInArray!0 (select (arr!46526 a!2901) i!1037)))))

(declare-fun b!1409395 () Bool)

(declare-fun res!947119 () Bool)

(assert (=> b!1409395 (=> (not res!947119) (not e!797570))))

(assert (=> b!1409395 (= res!947119 (and (= (size!47076 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47076 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47076 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!947118 () Bool)

(assert (=> start!121212 (=> (not res!947118) (not e!797570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121212 (= res!947118 (validMask!0 mask!2840))))

(assert (=> start!121212 e!797570))

(assert (=> start!121212 true))

(declare-fun array_inv!35554 (array!96366) Bool)

(assert (=> start!121212 (array_inv!35554 a!2901)))

(declare-fun b!1409393 () Bool)

(declare-fun e!797572 () Bool)

(assert (=> b!1409393 (= e!797570 (not e!797572))))

(declare-fun res!947113 () Bool)

(assert (=> b!1409393 (=> res!947113 e!797572)))

(declare-fun lt!620706 () SeekEntryResult!10837)

(assert (=> b!1409393 (= res!947113 (or (not (is-Intermediate!10837 lt!620706)) (undefined!11649 lt!620706)))))

(assert (=> b!1409393 e!797571))

(declare-fun res!947112 () Bool)

(assert (=> b!1409393 (=> (not res!947112) (not e!797571))))

(assert (=> b!1409393 (= res!947112 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47648 0))(
  ( (Unit!47649) )
))
(declare-fun lt!620705 () Unit!47648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47648)

(assert (=> b!1409393 (= lt!620705 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96366 (_ BitVec 32)) SeekEntryResult!10837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409393 (= lt!620706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46526 a!2901) j!112) mask!2840) (select (arr!46526 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409396 () Bool)

(declare-fun res!947115 () Bool)

(assert (=> b!1409396 (=> (not res!947115) (not e!797570))))

(assert (=> b!1409396 (= res!947115 (validKeyInArray!0 (select (arr!46526 a!2901) j!112)))))

(declare-fun b!1409397 () Bool)

(assert (=> b!1409397 (= e!797572 true)))

(declare-fun lt!620704 () SeekEntryResult!10837)

(assert (=> b!1409397 (= lt!620704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46526 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46526 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96367 (store (arr!46526 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47076 a!2901)) mask!2840))))

(assert (= (and start!121212 res!947118) b!1409395))

(assert (= (and b!1409395 res!947119) b!1409394))

(assert (= (and b!1409394 res!947114) b!1409396))

(assert (= (and b!1409396 res!947115) b!1409390))

(assert (= (and b!1409390 res!947117) b!1409391))

(assert (= (and b!1409391 res!947116) b!1409393))

(assert (= (and b!1409393 res!947112) b!1409392))

(assert (= (and b!1409393 (not res!947113)) b!1409397))

(declare-fun m!1299087 () Bool)

(assert (=> b!1409396 m!1299087))

(assert (=> b!1409396 m!1299087))

(declare-fun m!1299089 () Bool)

(assert (=> b!1409396 m!1299089))

(assert (=> b!1409393 m!1299087))

(declare-fun m!1299091 () Bool)

(assert (=> b!1409393 m!1299091))

(assert (=> b!1409393 m!1299087))

(declare-fun m!1299093 () Bool)

(assert (=> b!1409393 m!1299093))

(assert (=> b!1409393 m!1299091))

(assert (=> b!1409393 m!1299087))

(declare-fun m!1299095 () Bool)

(assert (=> b!1409393 m!1299095))

(declare-fun m!1299097 () Bool)

(assert (=> b!1409393 m!1299097))

(declare-fun m!1299099 () Bool)

(assert (=> b!1409390 m!1299099))

(declare-fun m!1299101 () Bool)

(assert (=> b!1409397 m!1299101))

(declare-fun m!1299103 () Bool)

(assert (=> b!1409397 m!1299103))

(assert (=> b!1409397 m!1299103))

(declare-fun m!1299105 () Bool)

(assert (=> b!1409397 m!1299105))

(assert (=> b!1409397 m!1299105))

(assert (=> b!1409397 m!1299103))

(declare-fun m!1299107 () Bool)

(assert (=> b!1409397 m!1299107))

(assert (=> b!1409392 m!1299087))

(assert (=> b!1409392 m!1299087))

(declare-fun m!1299109 () Bool)

(assert (=> b!1409392 m!1299109))

(declare-fun m!1299111 () Bool)

(assert (=> start!121212 m!1299111))

(declare-fun m!1299113 () Bool)

(assert (=> start!121212 m!1299113))

(declare-fun m!1299115 () Bool)

(assert (=> b!1409391 m!1299115))

(declare-fun m!1299117 () Bool)

(assert (=> b!1409394 m!1299117))

(assert (=> b!1409394 m!1299117))

(declare-fun m!1299119 () Bool)

(assert (=> b!1409394 m!1299119))

(push 1)

(assert (not b!1409392))

(assert (not b!1409396))

(assert (not start!121212))

(assert (not b!1409397))

(assert (not b!1409390))

(assert (not b!1409393))

(assert (not b!1409394))

(assert (not b!1409391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

