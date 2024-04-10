; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120868 () Bool)

(assert start!120868)

(declare-fun b!1406360 () Bool)

(declare-fun res!944577 () Bool)

(declare-fun e!796004 () Bool)

(assert (=> b!1406360 (=> (not res!944577) (not e!796004))))

(declare-datatypes ((array!96175 0))(
  ( (array!96176 (arr!46435 (Array (_ BitVec 32) (_ BitVec 64))) (size!46985 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96175)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406360 (= res!944577 (validKeyInArray!0 (select (arr!46435 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!796001 () Bool)

(declare-fun b!1406361 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10746 0))(
  ( (MissingZero!10746 (index!45361 (_ BitVec 32))) (Found!10746 (index!45362 (_ BitVec 32))) (Intermediate!10746 (undefined!11558 Bool) (index!45363 (_ BitVec 32)) (x!126961 (_ BitVec 32))) (Undefined!10746) (MissingVacant!10746 (index!45364 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96175 (_ BitVec 32)) SeekEntryResult!10746)

(assert (=> b!1406361 (= e!796001 (= (seekEntryOrOpen!0 (select (arr!46435 a!2901) j!112) a!2901 mask!2840) (Found!10746 j!112)))))

(declare-fun res!944579 () Bool)

(assert (=> start!120868 (=> (not res!944579) (not e!796004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120868 (= res!944579 (validMask!0 mask!2840))))

(assert (=> start!120868 e!796004))

(assert (=> start!120868 true))

(declare-fun array_inv!35463 (array!96175) Bool)

(assert (=> start!120868 (array_inv!35463 a!2901)))

(declare-fun b!1406362 () Bool)

(declare-fun res!944582 () Bool)

(assert (=> b!1406362 (=> (not res!944582) (not e!796004))))

(declare-datatypes ((List!32954 0))(
  ( (Nil!32951) (Cons!32950 (h!34204 (_ BitVec 64)) (t!47648 List!32954)) )
))
(declare-fun arrayNoDuplicates!0 (array!96175 (_ BitVec 32) List!32954) Bool)

(assert (=> b!1406362 (= res!944582 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32951))))

(declare-fun b!1406363 () Bool)

(declare-fun res!944581 () Bool)

(assert (=> b!1406363 (=> (not res!944581) (not e!796004))))

(assert (=> b!1406363 (= res!944581 (validKeyInArray!0 (select (arr!46435 a!2901) j!112)))))

(declare-fun b!1406364 () Bool)

(declare-fun e!796003 () Bool)

(assert (=> b!1406364 (= e!796003 true)))

(declare-fun lt!619354 () SeekEntryResult!10746)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96175 (_ BitVec 32)) SeekEntryResult!10746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406364 (= lt!619354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46435 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46435 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96176 (store (arr!46435 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46985 a!2901)) mask!2840))))

(declare-fun b!1406365 () Bool)

(declare-fun res!944583 () Bool)

(assert (=> b!1406365 (=> (not res!944583) (not e!796004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96175 (_ BitVec 32)) Bool)

(assert (=> b!1406365 (= res!944583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406366 () Bool)

(declare-fun res!944584 () Bool)

(assert (=> b!1406366 (=> (not res!944584) (not e!796004))))

(assert (=> b!1406366 (= res!944584 (and (= (size!46985 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46985 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46985 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406367 () Bool)

(assert (=> b!1406367 (= e!796004 (not e!796003))))

(declare-fun res!944578 () Bool)

(assert (=> b!1406367 (=> res!944578 e!796003)))

(declare-fun lt!619355 () SeekEntryResult!10746)

(assert (=> b!1406367 (= res!944578 (or (not (is-Intermediate!10746 lt!619355)) (undefined!11558 lt!619355)))))

(assert (=> b!1406367 e!796001))

(declare-fun res!944580 () Bool)

(assert (=> b!1406367 (=> (not res!944580) (not e!796001))))

(assert (=> b!1406367 (= res!944580 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47466 0))(
  ( (Unit!47467) )
))
(declare-fun lt!619356 () Unit!47466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47466)

(assert (=> b!1406367 (= lt!619356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406367 (= lt!619355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46435 a!2901) j!112) mask!2840) (select (arr!46435 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120868 res!944579) b!1406366))

(assert (= (and b!1406366 res!944584) b!1406360))

(assert (= (and b!1406360 res!944577) b!1406363))

(assert (= (and b!1406363 res!944581) b!1406365))

(assert (= (and b!1406365 res!944583) b!1406362))

(assert (= (and b!1406362 res!944582) b!1406367))

(assert (= (and b!1406367 res!944580) b!1406361))

(assert (= (and b!1406367 (not res!944578)) b!1406364))

(declare-fun m!1295471 () Bool)

(assert (=> b!1406362 m!1295471))

(declare-fun m!1295473 () Bool)

(assert (=> start!120868 m!1295473))

(declare-fun m!1295475 () Bool)

(assert (=> start!120868 m!1295475))

(declare-fun m!1295477 () Bool)

(assert (=> b!1406367 m!1295477))

(declare-fun m!1295479 () Bool)

(assert (=> b!1406367 m!1295479))

(assert (=> b!1406367 m!1295477))

(declare-fun m!1295481 () Bool)

(assert (=> b!1406367 m!1295481))

(assert (=> b!1406367 m!1295479))

(assert (=> b!1406367 m!1295477))

(declare-fun m!1295483 () Bool)

(assert (=> b!1406367 m!1295483))

(declare-fun m!1295485 () Bool)

(assert (=> b!1406367 m!1295485))

(declare-fun m!1295487 () Bool)

(assert (=> b!1406364 m!1295487))

(declare-fun m!1295489 () Bool)

(assert (=> b!1406364 m!1295489))

(assert (=> b!1406364 m!1295489))

(declare-fun m!1295491 () Bool)

(assert (=> b!1406364 m!1295491))

(assert (=> b!1406364 m!1295491))

(assert (=> b!1406364 m!1295489))

(declare-fun m!1295493 () Bool)

(assert (=> b!1406364 m!1295493))

(declare-fun m!1295495 () Bool)

(assert (=> b!1406365 m!1295495))

(declare-fun m!1295497 () Bool)

(assert (=> b!1406360 m!1295497))

(assert (=> b!1406360 m!1295497))

(declare-fun m!1295499 () Bool)

(assert (=> b!1406360 m!1295499))

(assert (=> b!1406363 m!1295477))

(assert (=> b!1406363 m!1295477))

(declare-fun m!1295501 () Bool)

(assert (=> b!1406363 m!1295501))

(assert (=> b!1406361 m!1295477))

(assert (=> b!1406361 m!1295477))

(declare-fun m!1295503 () Bool)

(assert (=> b!1406361 m!1295503))

(push 1)

(assert (not b!1406364))

(assert (not start!120868))

(assert (not b!1406365))

(assert (not b!1406361))

(assert (not b!1406360))

(assert (not b!1406362))

(assert (not b!1406363))

(assert (not b!1406367))

(check-sat)

