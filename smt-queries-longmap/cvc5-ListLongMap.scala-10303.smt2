; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121140 () Bool)

(assert start!121140)

(declare-fun b!1408493 () Bool)

(declare-fun res!946267 () Bool)

(declare-fun e!797126 () Bool)

(assert (=> b!1408493 (=> (not res!946267) (not e!797126))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96247 0))(
  ( (array!96248 (arr!46467 (Array (_ BitVec 32) (_ BitVec 64))) (size!47019 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96247)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408493 (= res!946267 (and (= (size!47019 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47019 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47019 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946269 () Bool)

(assert (=> start!121140 (=> (not res!946269) (not e!797126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121140 (= res!946269 (validMask!0 mask!2840))))

(assert (=> start!121140 e!797126))

(assert (=> start!121140 true))

(declare-fun array_inv!35700 (array!96247) Bool)

(assert (=> start!121140 (array_inv!35700 a!2901)))

(declare-fun e!797124 () Bool)

(declare-fun b!1408494 () Bool)

(declare-datatypes ((SeekEntryResult!10804 0))(
  ( (MissingZero!10804 (index!45593 (_ BitVec 32))) (Found!10804 (index!45594 (_ BitVec 32))) (Intermediate!10804 (undefined!11616 Bool) (index!45595 (_ BitVec 32)) (x!127186 (_ BitVec 32))) (Undefined!10804) (MissingVacant!10804 (index!45596 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96247 (_ BitVec 32)) SeekEntryResult!10804)

(assert (=> b!1408494 (= e!797124 (= (seekEntryOrOpen!0 (select (arr!46467 a!2901) j!112) a!2901 mask!2840) (Found!10804 j!112)))))

(declare-fun b!1408495 () Bool)

(declare-fun e!797123 () Bool)

(assert (=> b!1408495 (= e!797126 (not e!797123))))

(declare-fun res!946271 () Bool)

(assert (=> b!1408495 (=> res!946271 e!797123)))

(declare-fun lt!620208 () SeekEntryResult!10804)

(assert (=> b!1408495 (= res!946271 (or (not (is-Intermediate!10804 lt!620208)) (undefined!11616 lt!620208)))))

(assert (=> b!1408495 e!797124))

(declare-fun res!946272 () Bool)

(assert (=> b!1408495 (=> (not res!946272) (not e!797124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96247 (_ BitVec 32)) Bool)

(assert (=> b!1408495 (= res!946272 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47425 0))(
  ( (Unit!47426) )
))
(declare-fun lt!620210 () Unit!47425)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47425)

(assert (=> b!1408495 (= lt!620210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96247 (_ BitVec 32)) SeekEntryResult!10804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408495 (= lt!620208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46467 a!2901) j!112) mask!2840) (select (arr!46467 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408496 () Bool)

(declare-fun res!946270 () Bool)

(assert (=> b!1408496 (=> (not res!946270) (not e!797126))))

(assert (=> b!1408496 (= res!946270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408497 () Bool)

(declare-fun res!946273 () Bool)

(assert (=> b!1408497 (=> (not res!946273) (not e!797126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408497 (= res!946273 (validKeyInArray!0 (select (arr!46467 a!2901) i!1037)))))

(declare-fun b!1408498 () Bool)

(assert (=> b!1408498 (= e!797123 true)))

(declare-fun lt!620209 () SeekEntryResult!10804)

(assert (=> b!1408498 (= lt!620209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96248 (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47019 a!2901)) mask!2840))))

(declare-fun b!1408499 () Bool)

(declare-fun res!946268 () Bool)

(assert (=> b!1408499 (=> (not res!946268) (not e!797126))))

(declare-datatypes ((List!33064 0))(
  ( (Nil!33061) (Cons!33060 (h!34323 (_ BitVec 64)) (t!47750 List!33064)) )
))
(declare-fun arrayNoDuplicates!0 (array!96247 (_ BitVec 32) List!33064) Bool)

(assert (=> b!1408499 (= res!946268 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33061))))

(declare-fun b!1408500 () Bool)

(declare-fun res!946266 () Bool)

(assert (=> b!1408500 (=> (not res!946266) (not e!797126))))

(assert (=> b!1408500 (= res!946266 (validKeyInArray!0 (select (arr!46467 a!2901) j!112)))))

(assert (= (and start!121140 res!946269) b!1408493))

(assert (= (and b!1408493 res!946267) b!1408497))

(assert (= (and b!1408497 res!946273) b!1408500))

(assert (= (and b!1408500 res!946266) b!1408496))

(assert (= (and b!1408496 res!946270) b!1408499))

(assert (= (and b!1408499 res!946268) b!1408495))

(assert (= (and b!1408495 res!946272) b!1408494))

(assert (= (and b!1408495 (not res!946271)) b!1408498))

(declare-fun m!1297395 () Bool)

(assert (=> start!121140 m!1297395))

(declare-fun m!1297397 () Bool)

(assert (=> start!121140 m!1297397))

(declare-fun m!1297399 () Bool)

(assert (=> b!1408499 m!1297399))

(declare-fun m!1297401 () Bool)

(assert (=> b!1408497 m!1297401))

(assert (=> b!1408497 m!1297401))

(declare-fun m!1297403 () Bool)

(assert (=> b!1408497 m!1297403))

(declare-fun m!1297405 () Bool)

(assert (=> b!1408498 m!1297405))

(declare-fun m!1297407 () Bool)

(assert (=> b!1408498 m!1297407))

(assert (=> b!1408498 m!1297407))

(declare-fun m!1297409 () Bool)

(assert (=> b!1408498 m!1297409))

(assert (=> b!1408498 m!1297409))

(assert (=> b!1408498 m!1297407))

(declare-fun m!1297411 () Bool)

(assert (=> b!1408498 m!1297411))

(declare-fun m!1297413 () Bool)

(assert (=> b!1408496 m!1297413))

(declare-fun m!1297415 () Bool)

(assert (=> b!1408500 m!1297415))

(assert (=> b!1408500 m!1297415))

(declare-fun m!1297417 () Bool)

(assert (=> b!1408500 m!1297417))

(assert (=> b!1408495 m!1297415))

(declare-fun m!1297419 () Bool)

(assert (=> b!1408495 m!1297419))

(assert (=> b!1408495 m!1297415))

(declare-fun m!1297421 () Bool)

(assert (=> b!1408495 m!1297421))

(assert (=> b!1408495 m!1297419))

(assert (=> b!1408495 m!1297415))

(declare-fun m!1297423 () Bool)

(assert (=> b!1408495 m!1297423))

(declare-fun m!1297425 () Bool)

(assert (=> b!1408495 m!1297425))

(assert (=> b!1408494 m!1297415))

(assert (=> b!1408494 m!1297415))

(declare-fun m!1297427 () Bool)

(assert (=> b!1408494 m!1297427))

(push 1)

(assert (not b!1408498))

(assert (not start!121140))

(assert (not b!1408497))

(assert (not b!1408500))

(assert (not b!1408494))

(assert (not b!1408499))

(assert (not b!1408496))

(assert (not b!1408495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

