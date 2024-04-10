; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121170 () Bool)

(assert start!121170)

(declare-fun b!1408886 () Bool)

(declare-fun e!797321 () Bool)

(declare-fun e!797320 () Bool)

(assert (=> b!1408886 (= e!797321 (not e!797320))))

(declare-fun res!946608 () Bool)

(assert (=> b!1408886 (=> res!946608 e!797320)))

(declare-datatypes ((SeekEntryResult!10816 0))(
  ( (MissingZero!10816 (index!45641 (_ BitVec 32))) (Found!10816 (index!45642 (_ BitVec 32))) (Intermediate!10816 (undefined!11628 Bool) (index!45643 (_ BitVec 32)) (x!127241 (_ BitVec 32))) (Undefined!10816) (MissingVacant!10816 (index!45644 (_ BitVec 32))) )
))
(declare-fun lt!620517 () SeekEntryResult!10816)

(assert (=> b!1408886 (= res!946608 (or (not (is-Intermediate!10816 lt!620517)) (undefined!11628 lt!620517)))))

(declare-fun e!797318 () Bool)

(assert (=> b!1408886 e!797318))

(declare-fun res!946614 () Bool)

(assert (=> b!1408886 (=> (not res!946614) (not e!797318))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96324 0))(
  ( (array!96325 (arr!46505 (Array (_ BitVec 32) (_ BitVec 64))) (size!47055 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96324)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96324 (_ BitVec 32)) Bool)

(assert (=> b!1408886 (= res!946614 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47606 0))(
  ( (Unit!47607) )
))
(declare-fun lt!620515 () Unit!47606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47606)

(assert (=> b!1408886 (= lt!620515 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96324 (_ BitVec 32)) SeekEntryResult!10816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408886 (= lt!620517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46505 a!2901) j!112) mask!2840) (select (arr!46505 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408887 () Bool)

(declare-fun res!946609 () Bool)

(assert (=> b!1408887 (=> (not res!946609) (not e!797321))))

(assert (=> b!1408887 (= res!946609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!946615 () Bool)

(assert (=> start!121170 (=> (not res!946615) (not e!797321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121170 (= res!946615 (validMask!0 mask!2840))))

(assert (=> start!121170 e!797321))

(assert (=> start!121170 true))

(declare-fun array_inv!35533 (array!96324) Bool)

(assert (=> start!121170 (array_inv!35533 a!2901)))

(declare-fun b!1408888 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96324 (_ BitVec 32)) SeekEntryResult!10816)

(assert (=> b!1408888 (= e!797318 (= (seekEntryOrOpen!0 (select (arr!46505 a!2901) j!112) a!2901 mask!2840) (Found!10816 j!112)))))

(declare-fun b!1408889 () Bool)

(assert (=> b!1408889 (= e!797320 true)))

(declare-fun lt!620516 () SeekEntryResult!10816)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408889 (= lt!620516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46505 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46505 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96325 (store (arr!46505 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)) mask!2840))))

(declare-fun b!1408890 () Bool)

(declare-fun res!946613 () Bool)

(assert (=> b!1408890 (=> (not res!946613) (not e!797321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408890 (= res!946613 (validKeyInArray!0 (select (arr!46505 a!2901) j!112)))))

(declare-fun b!1408891 () Bool)

(declare-fun res!946611 () Bool)

(assert (=> b!1408891 (=> (not res!946611) (not e!797321))))

(assert (=> b!1408891 (= res!946611 (validKeyInArray!0 (select (arr!46505 a!2901) i!1037)))))

(declare-fun b!1408892 () Bool)

(declare-fun res!946610 () Bool)

(assert (=> b!1408892 (=> (not res!946610) (not e!797321))))

(declare-datatypes ((List!33024 0))(
  ( (Nil!33021) (Cons!33020 (h!34283 (_ BitVec 64)) (t!47718 List!33024)) )
))
(declare-fun arrayNoDuplicates!0 (array!96324 (_ BitVec 32) List!33024) Bool)

(assert (=> b!1408892 (= res!946610 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33021))))

(declare-fun b!1408893 () Bool)

(declare-fun res!946612 () Bool)

(assert (=> b!1408893 (=> (not res!946612) (not e!797321))))

(assert (=> b!1408893 (= res!946612 (and (= (size!47055 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47055 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47055 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121170 res!946615) b!1408893))

(assert (= (and b!1408893 res!946612) b!1408891))

(assert (= (and b!1408891 res!946611) b!1408890))

(assert (= (and b!1408890 res!946613) b!1408887))

(assert (= (and b!1408887 res!946609) b!1408892))

(assert (= (and b!1408892 res!946610) b!1408886))

(assert (= (and b!1408886 res!946614) b!1408888))

(assert (= (and b!1408886 (not res!946608)) b!1408889))

(declare-fun m!1298373 () Bool)

(assert (=> b!1408890 m!1298373))

(assert (=> b!1408890 m!1298373))

(declare-fun m!1298375 () Bool)

(assert (=> b!1408890 m!1298375))

(declare-fun m!1298377 () Bool)

(assert (=> start!121170 m!1298377))

(declare-fun m!1298379 () Bool)

(assert (=> start!121170 m!1298379))

(declare-fun m!1298381 () Bool)

(assert (=> b!1408891 m!1298381))

(assert (=> b!1408891 m!1298381))

(declare-fun m!1298383 () Bool)

(assert (=> b!1408891 m!1298383))

(assert (=> b!1408886 m!1298373))

(declare-fun m!1298385 () Bool)

(assert (=> b!1408886 m!1298385))

(assert (=> b!1408886 m!1298373))

(declare-fun m!1298387 () Bool)

(assert (=> b!1408886 m!1298387))

(assert (=> b!1408886 m!1298385))

(assert (=> b!1408886 m!1298373))

(declare-fun m!1298389 () Bool)

(assert (=> b!1408886 m!1298389))

(declare-fun m!1298391 () Bool)

(assert (=> b!1408886 m!1298391))

(assert (=> b!1408888 m!1298373))

(assert (=> b!1408888 m!1298373))

(declare-fun m!1298393 () Bool)

(assert (=> b!1408888 m!1298393))

(declare-fun m!1298395 () Bool)

(assert (=> b!1408889 m!1298395))

(declare-fun m!1298397 () Bool)

(assert (=> b!1408889 m!1298397))

(assert (=> b!1408889 m!1298397))

(declare-fun m!1298399 () Bool)

(assert (=> b!1408889 m!1298399))

(assert (=> b!1408889 m!1298399))

(assert (=> b!1408889 m!1298397))

(declare-fun m!1298401 () Bool)

(assert (=> b!1408889 m!1298401))

(declare-fun m!1298403 () Bool)

(assert (=> b!1408887 m!1298403))

(declare-fun m!1298405 () Bool)

(assert (=> b!1408892 m!1298405))

(push 1)

(assert (not b!1408892))

(assert (not b!1408891))

(assert (not b!1408887))

(assert (not start!121170))

(assert (not b!1408888))

(assert (not b!1408890))

(assert (not b!1408886))

(assert (not b!1408889))

(check-sat)

(pop 1)

