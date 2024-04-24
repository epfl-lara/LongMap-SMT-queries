; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121320 () Bool)

(assert start!121320)

(declare-fun b!1409570 () Bool)

(declare-fun e!797828 () Bool)

(declare-fun e!797831 () Bool)

(assert (=> b!1409570 (= e!797828 (not e!797831))))

(declare-fun res!946613 () Bool)

(assert (=> b!1409570 (=> res!946613 e!797831)))

(declare-datatypes ((SeekEntryResult!10753 0))(
  ( (MissingZero!10753 (index!45389 (_ BitVec 32))) (Found!10753 (index!45390 (_ BitVec 32))) (Intermediate!10753 (undefined!11565 Bool) (index!45391 (_ BitVec 32)) (x!127141 (_ BitVec 32))) (Undefined!10753) (MissingVacant!10753 (index!45392 (_ BitVec 32))) )
))
(declare-fun lt!620742 () SeekEntryResult!10753)

(assert (=> b!1409570 (= res!946613 (or (not (is-Intermediate!10753 lt!620742)) (undefined!11565 lt!620742)))))

(declare-fun e!797829 () Bool)

(assert (=> b!1409570 e!797829))

(declare-fun res!946609 () Bool)

(assert (=> b!1409570 (=> (not res!946609) (not e!797829))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96396 0))(
  ( (array!96397 (arr!46539 (Array (_ BitVec 32) (_ BitVec 64))) (size!47090 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96396)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96396 (_ BitVec 32)) Bool)

(assert (=> b!1409570 (= res!946609 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47507 0))(
  ( (Unit!47508) )
))
(declare-fun lt!620744 () Unit!47507)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47507)

(assert (=> b!1409570 (= lt!620744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96396 (_ BitVec 32)) SeekEntryResult!10753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409570 (= lt!620742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) (select (arr!46539 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409571 () Bool)

(declare-fun res!946615 () Bool)

(assert (=> b!1409571 (=> (not res!946615) (not e!797828))))

(assert (=> b!1409571 (= res!946615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409572 () Bool)

(declare-fun res!946610 () Bool)

(assert (=> b!1409572 (=> (not res!946610) (not e!797828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409572 (= res!946610 (validKeyInArray!0 (select (arr!46539 a!2901) j!112)))))

(declare-fun res!946612 () Bool)

(assert (=> start!121320 (=> (not res!946612) (not e!797828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121320 (= res!946612 (validMask!0 mask!2840))))

(assert (=> start!121320 e!797828))

(assert (=> start!121320 true))

(declare-fun array_inv!35820 (array!96396) Bool)

(assert (=> start!121320 (array_inv!35820 a!2901)))

(declare-fun b!1409573 () Bool)

(declare-fun res!946614 () Bool)

(assert (=> b!1409573 (=> (not res!946614) (not e!797828))))

(declare-datatypes ((List!33045 0))(
  ( (Nil!33042) (Cons!33041 (h!34312 (_ BitVec 64)) (t!47731 List!33045)) )
))
(declare-fun arrayNoDuplicates!0 (array!96396 (_ BitVec 32) List!33045) Bool)

(assert (=> b!1409573 (= res!946614 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33042))))

(declare-fun b!1409574 () Bool)

(declare-fun res!946611 () Bool)

(assert (=> b!1409574 (=> (not res!946611) (not e!797828))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409574 (= res!946611 (and (= (size!47090 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47090 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47090 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409575 () Bool)

(declare-fun res!946608 () Bool)

(assert (=> b!1409575 (=> (not res!946608) (not e!797828))))

(assert (=> b!1409575 (= res!946608 (validKeyInArray!0 (select (arr!46539 a!2901) i!1037)))))

(declare-fun b!1409576 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96396 (_ BitVec 32)) SeekEntryResult!10753)

(assert (=> b!1409576 (= e!797829 (= (seekEntryOrOpen!0 (select (arr!46539 a!2901) j!112) a!2901 mask!2840) (Found!10753 j!112)))))

(declare-fun b!1409577 () Bool)

(assert (=> b!1409577 (= e!797831 true)))

(declare-fun lt!620743 () SeekEntryResult!10753)

(assert (=> b!1409577 (= lt!620743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96397 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)) mask!2840))))

(assert (= (and start!121320 res!946612) b!1409574))

(assert (= (and b!1409574 res!946611) b!1409575))

(assert (= (and b!1409575 res!946608) b!1409572))

(assert (= (and b!1409572 res!946610) b!1409571))

(assert (= (and b!1409571 res!946615) b!1409573))

(assert (= (and b!1409573 res!946614) b!1409570))

(assert (= (and b!1409570 res!946609) b!1409576))

(assert (= (and b!1409570 (not res!946613)) b!1409577))

(declare-fun m!1299099 () Bool)

(assert (=> b!1409576 m!1299099))

(assert (=> b!1409576 m!1299099))

(declare-fun m!1299101 () Bool)

(assert (=> b!1409576 m!1299101))

(declare-fun m!1299103 () Bool)

(assert (=> start!121320 m!1299103))

(declare-fun m!1299105 () Bool)

(assert (=> start!121320 m!1299105))

(declare-fun m!1299107 () Bool)

(assert (=> b!1409571 m!1299107))

(declare-fun m!1299109 () Bool)

(assert (=> b!1409573 m!1299109))

(assert (=> b!1409570 m!1299099))

(declare-fun m!1299111 () Bool)

(assert (=> b!1409570 m!1299111))

(assert (=> b!1409570 m!1299099))

(declare-fun m!1299113 () Bool)

(assert (=> b!1409570 m!1299113))

(assert (=> b!1409570 m!1299111))

(assert (=> b!1409570 m!1299099))

(declare-fun m!1299115 () Bool)

(assert (=> b!1409570 m!1299115))

(declare-fun m!1299117 () Bool)

(assert (=> b!1409570 m!1299117))

(assert (=> b!1409572 m!1299099))

(assert (=> b!1409572 m!1299099))

(declare-fun m!1299119 () Bool)

(assert (=> b!1409572 m!1299119))

(declare-fun m!1299121 () Bool)

(assert (=> b!1409575 m!1299121))

(assert (=> b!1409575 m!1299121))

(declare-fun m!1299123 () Bool)

(assert (=> b!1409575 m!1299123))

(declare-fun m!1299125 () Bool)

(assert (=> b!1409577 m!1299125))

(declare-fun m!1299127 () Bool)

(assert (=> b!1409577 m!1299127))

(assert (=> b!1409577 m!1299127))

(declare-fun m!1299129 () Bool)

(assert (=> b!1409577 m!1299129))

(assert (=> b!1409577 m!1299129))

(assert (=> b!1409577 m!1299127))

(declare-fun m!1299131 () Bool)

(assert (=> b!1409577 m!1299131))

(push 1)

(assert (not b!1409576))

(assert (not start!121320))

(assert (not b!1409575))

(assert (not b!1409573))

(assert (not b!1409571))

(assert (not b!1409572))

(assert (not b!1409577))

(assert (not b!1409570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

