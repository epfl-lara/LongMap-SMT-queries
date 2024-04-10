; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121168 () Bool)

(assert start!121168)

(declare-fun b!1408862 () Bool)

(declare-fun e!797307 () Bool)

(declare-fun e!797308 () Bool)

(assert (=> b!1408862 (= e!797307 (not e!797308))))

(declare-fun res!946584 () Bool)

(assert (=> b!1408862 (=> res!946584 e!797308)))

(declare-datatypes ((SeekEntryResult!10815 0))(
  ( (MissingZero!10815 (index!45637 (_ BitVec 32))) (Found!10815 (index!45638 (_ BitVec 32))) (Intermediate!10815 (undefined!11627 Bool) (index!45639 (_ BitVec 32)) (x!127232 (_ BitVec 32))) (Undefined!10815) (MissingVacant!10815 (index!45640 (_ BitVec 32))) )
))
(declare-fun lt!620506 () SeekEntryResult!10815)

(assert (=> b!1408862 (= res!946584 (or (not (is-Intermediate!10815 lt!620506)) (undefined!11627 lt!620506)))))

(declare-fun e!797306 () Bool)

(assert (=> b!1408862 e!797306))

(declare-fun res!946586 () Bool)

(assert (=> b!1408862 (=> (not res!946586) (not e!797306))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96322 0))(
  ( (array!96323 (arr!46504 (Array (_ BitVec 32) (_ BitVec 64))) (size!47054 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96322)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96322 (_ BitVec 32)) Bool)

(assert (=> b!1408862 (= res!946586 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47604 0))(
  ( (Unit!47605) )
))
(declare-fun lt!620508 () Unit!47604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47604)

(assert (=> b!1408862 (= lt!620508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96322 (_ BitVec 32)) SeekEntryResult!10815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408862 (= lt!620506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) (select (arr!46504 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408863 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96322 (_ BitVec 32)) SeekEntryResult!10815)

(assert (=> b!1408863 (= e!797306 (= (seekEntryOrOpen!0 (select (arr!46504 a!2901) j!112) a!2901 mask!2840) (Found!10815 j!112)))))

(declare-fun b!1408864 () Bool)

(declare-fun res!946588 () Bool)

(assert (=> b!1408864 (=> (not res!946588) (not e!797307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408864 (= res!946588 (validKeyInArray!0 (select (arr!46504 a!2901) j!112)))))

(declare-fun b!1408865 () Bool)

(declare-fun res!946585 () Bool)

(assert (=> b!1408865 (=> (not res!946585) (not e!797307))))

(assert (=> b!1408865 (= res!946585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408866 () Bool)

(declare-fun res!946589 () Bool)

(assert (=> b!1408866 (=> (not res!946589) (not e!797307))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408866 (= res!946589 (and (= (size!47054 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47054 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47054 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408867 () Bool)

(assert (=> b!1408867 (= e!797308 true)))

(declare-fun lt!620507 () SeekEntryResult!10815)

(assert (=> b!1408867 (= lt!620507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96323 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47054 a!2901)) mask!2840))))

(declare-fun res!946591 () Bool)

(assert (=> start!121168 (=> (not res!946591) (not e!797307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121168 (= res!946591 (validMask!0 mask!2840))))

(assert (=> start!121168 e!797307))

(assert (=> start!121168 true))

(declare-fun array_inv!35532 (array!96322) Bool)

(assert (=> start!121168 (array_inv!35532 a!2901)))

(declare-fun b!1408868 () Bool)

(declare-fun res!946590 () Bool)

(assert (=> b!1408868 (=> (not res!946590) (not e!797307))))

(declare-datatypes ((List!33023 0))(
  ( (Nil!33020) (Cons!33019 (h!34282 (_ BitVec 64)) (t!47717 List!33023)) )
))
(declare-fun arrayNoDuplicates!0 (array!96322 (_ BitVec 32) List!33023) Bool)

(assert (=> b!1408868 (= res!946590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33020))))

(declare-fun b!1408869 () Bool)

(declare-fun res!946587 () Bool)

(assert (=> b!1408869 (=> (not res!946587) (not e!797307))))

(assert (=> b!1408869 (= res!946587 (validKeyInArray!0 (select (arr!46504 a!2901) i!1037)))))

(assert (= (and start!121168 res!946591) b!1408866))

(assert (= (and b!1408866 res!946589) b!1408869))

(assert (= (and b!1408869 res!946587) b!1408864))

(assert (= (and b!1408864 res!946588) b!1408865))

(assert (= (and b!1408865 res!946585) b!1408868))

(assert (= (and b!1408868 res!946590) b!1408862))

(assert (= (and b!1408862 res!946586) b!1408863))

(assert (= (and b!1408862 (not res!946584)) b!1408867))

(declare-fun m!1298339 () Bool)

(assert (=> b!1408864 m!1298339))

(assert (=> b!1408864 m!1298339))

(declare-fun m!1298341 () Bool)

(assert (=> b!1408864 m!1298341))

(declare-fun m!1298343 () Bool)

(assert (=> start!121168 m!1298343))

(declare-fun m!1298345 () Bool)

(assert (=> start!121168 m!1298345))

(declare-fun m!1298347 () Bool)

(assert (=> b!1408867 m!1298347))

(declare-fun m!1298349 () Bool)

(assert (=> b!1408867 m!1298349))

(assert (=> b!1408867 m!1298349))

(declare-fun m!1298351 () Bool)

(assert (=> b!1408867 m!1298351))

(assert (=> b!1408867 m!1298351))

(assert (=> b!1408867 m!1298349))

(declare-fun m!1298353 () Bool)

(assert (=> b!1408867 m!1298353))

(declare-fun m!1298355 () Bool)

(assert (=> b!1408868 m!1298355))

(assert (=> b!1408862 m!1298339))

(declare-fun m!1298357 () Bool)

(assert (=> b!1408862 m!1298357))

(assert (=> b!1408862 m!1298339))

(declare-fun m!1298359 () Bool)

(assert (=> b!1408862 m!1298359))

(assert (=> b!1408862 m!1298357))

(assert (=> b!1408862 m!1298339))

(declare-fun m!1298361 () Bool)

(assert (=> b!1408862 m!1298361))

(declare-fun m!1298363 () Bool)

(assert (=> b!1408862 m!1298363))

(declare-fun m!1298365 () Bool)

(assert (=> b!1408865 m!1298365))

(assert (=> b!1408863 m!1298339))

(assert (=> b!1408863 m!1298339))

(declare-fun m!1298367 () Bool)

(assert (=> b!1408863 m!1298367))

(declare-fun m!1298369 () Bool)

(assert (=> b!1408869 m!1298369))

(assert (=> b!1408869 m!1298369))

(declare-fun m!1298371 () Bool)

(assert (=> b!1408869 m!1298371))

(push 1)

(assert (not b!1408868))

(assert (not b!1408867))

(assert (not b!1408864))

(assert (not b!1408865))

(assert (not b!1408869))

(assert (not b!1408863))

(assert (not b!1408862))

(assert (not start!121168))

(check-sat)

(pop 1)

