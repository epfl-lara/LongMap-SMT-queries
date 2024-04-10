; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121128 () Bool)

(assert start!121128)

(declare-fun b!1408382 () Bool)

(declare-fun res!946109 () Bool)

(declare-fun e!797067 () Bool)

(assert (=> b!1408382 (=> (not res!946109) (not e!797067))))

(declare-datatypes ((array!96282 0))(
  ( (array!96283 (arr!46484 (Array (_ BitVec 32) (_ BitVec 64))) (size!47034 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96282)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96282 (_ BitVec 32)) Bool)

(assert (=> b!1408382 (= res!946109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408383 () Bool)

(declare-fun e!797069 () Bool)

(assert (=> b!1408383 (= e!797069 true)))

(declare-datatypes ((SeekEntryResult!10795 0))(
  ( (MissingZero!10795 (index!45557 (_ BitVec 32))) (Found!10795 (index!45558 (_ BitVec 32))) (Intermediate!10795 (undefined!11607 Bool) (index!45559 (_ BitVec 32)) (x!127164 (_ BitVec 32))) (Undefined!10795) (MissingVacant!10795 (index!45560 (_ BitVec 32))) )
))
(declare-fun lt!620326 () SeekEntryResult!10795)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96282 (_ BitVec 32)) SeekEntryResult!10795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408383 (= lt!620326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46484 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46484 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96283 (store (arr!46484 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47034 a!2901)) mask!2840))))

(declare-fun res!946107 () Bool)

(assert (=> start!121128 (=> (not res!946107) (not e!797067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121128 (= res!946107 (validMask!0 mask!2840))))

(assert (=> start!121128 e!797067))

(assert (=> start!121128 true))

(declare-fun array_inv!35512 (array!96282) Bool)

(assert (=> start!121128 (array_inv!35512 a!2901)))

(declare-fun b!1408384 () Bool)

(declare-fun res!946104 () Bool)

(assert (=> b!1408384 (=> (not res!946104) (not e!797067))))

(declare-datatypes ((List!33003 0))(
  ( (Nil!33000) (Cons!32999 (h!34262 (_ BitVec 64)) (t!47697 List!33003)) )
))
(declare-fun arrayNoDuplicates!0 (array!96282 (_ BitVec 32) List!33003) Bool)

(assert (=> b!1408384 (= res!946104 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33000))))

(declare-fun b!1408385 () Bool)

(declare-fun res!946111 () Bool)

(assert (=> b!1408385 (=> (not res!946111) (not e!797067))))

(assert (=> b!1408385 (= res!946111 (and (= (size!47034 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47034 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47034 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408386 () Bool)

(declare-fun res!946110 () Bool)

(assert (=> b!1408386 (=> (not res!946110) (not e!797067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408386 (= res!946110 (validKeyInArray!0 (select (arr!46484 a!2901) i!1037)))))

(declare-fun b!1408387 () Bool)

(declare-fun e!797066 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96282 (_ BitVec 32)) SeekEntryResult!10795)

(assert (=> b!1408387 (= e!797066 (= (seekEntryOrOpen!0 (select (arr!46484 a!2901) j!112) a!2901 mask!2840) (Found!10795 j!112)))))

(declare-fun b!1408388 () Bool)

(declare-fun res!946105 () Bool)

(assert (=> b!1408388 (=> (not res!946105) (not e!797067))))

(assert (=> b!1408388 (= res!946105 (validKeyInArray!0 (select (arr!46484 a!2901) j!112)))))

(declare-fun b!1408389 () Bool)

(assert (=> b!1408389 (= e!797067 (not e!797069))))

(declare-fun res!946108 () Bool)

(assert (=> b!1408389 (=> res!946108 e!797069)))

(declare-fun lt!620327 () SeekEntryResult!10795)

(assert (=> b!1408389 (= res!946108 (or (not (is-Intermediate!10795 lt!620327)) (undefined!11607 lt!620327)))))

(assert (=> b!1408389 e!797066))

(declare-fun res!946106 () Bool)

(assert (=> b!1408389 (=> (not res!946106) (not e!797066))))

(assert (=> b!1408389 (= res!946106 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47564 0))(
  ( (Unit!47565) )
))
(declare-fun lt!620328 () Unit!47564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47564)

(assert (=> b!1408389 (= lt!620328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408389 (= lt!620327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46484 a!2901) j!112) mask!2840) (select (arr!46484 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121128 res!946107) b!1408385))

(assert (= (and b!1408385 res!946111) b!1408386))

(assert (= (and b!1408386 res!946110) b!1408388))

(assert (= (and b!1408388 res!946105) b!1408382))

(assert (= (and b!1408382 res!946109) b!1408384))

(assert (= (and b!1408384 res!946104) b!1408389))

(assert (= (and b!1408389 res!946106) b!1408387))

(assert (= (and b!1408389 (not res!946108)) b!1408383))

(declare-fun m!1297659 () Bool)

(assert (=> b!1408389 m!1297659))

(declare-fun m!1297661 () Bool)

(assert (=> b!1408389 m!1297661))

(assert (=> b!1408389 m!1297659))

(declare-fun m!1297663 () Bool)

(assert (=> b!1408389 m!1297663))

(assert (=> b!1408389 m!1297661))

(assert (=> b!1408389 m!1297659))

(declare-fun m!1297665 () Bool)

(assert (=> b!1408389 m!1297665))

(declare-fun m!1297667 () Bool)

(assert (=> b!1408389 m!1297667))

(declare-fun m!1297669 () Bool)

(assert (=> start!121128 m!1297669))

(declare-fun m!1297671 () Bool)

(assert (=> start!121128 m!1297671))

(declare-fun m!1297673 () Bool)

(assert (=> b!1408384 m!1297673))

(declare-fun m!1297675 () Bool)

(assert (=> b!1408383 m!1297675))

(declare-fun m!1297677 () Bool)

(assert (=> b!1408383 m!1297677))

(assert (=> b!1408383 m!1297677))

(declare-fun m!1297679 () Bool)

(assert (=> b!1408383 m!1297679))

(assert (=> b!1408383 m!1297679))

(assert (=> b!1408383 m!1297677))

(declare-fun m!1297681 () Bool)

(assert (=> b!1408383 m!1297681))

(declare-fun m!1297683 () Bool)

(assert (=> b!1408386 m!1297683))

(assert (=> b!1408386 m!1297683))

(declare-fun m!1297685 () Bool)

(assert (=> b!1408386 m!1297685))

(declare-fun m!1297687 () Bool)

(assert (=> b!1408382 m!1297687))

(assert (=> b!1408388 m!1297659))

(assert (=> b!1408388 m!1297659))

(declare-fun m!1297689 () Bool)

(assert (=> b!1408388 m!1297689))

(assert (=> b!1408387 m!1297659))

(assert (=> b!1408387 m!1297659))

(declare-fun m!1297691 () Bool)

(assert (=> b!1408387 m!1297691))

(push 1)

(assert (not b!1408387))

(assert (not b!1408382))

(assert (not b!1408384))

(assert (not b!1408389))

(assert (not b!1408383))

(assert (not b!1408388))

(assert (not b!1408386))

(assert (not start!121128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

