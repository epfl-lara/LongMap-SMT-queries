; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121200 () Bool)

(assert start!121200)

(declare-fun b!1409213 () Bool)

(declare-fun res!946991 () Bool)

(declare-fun e!797484 () Bool)

(assert (=> b!1409213 (=> (not res!946991) (not e!797484))))

(declare-datatypes ((array!96307 0))(
  ( (array!96308 (arr!46497 (Array (_ BitVec 32) (_ BitVec 64))) (size!47049 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96307)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409213 (= res!946991 (validKeyInArray!0 (select (arr!46497 a!2901) i!1037)))))

(declare-fun b!1409214 () Bool)

(declare-fun res!946993 () Bool)

(assert (=> b!1409214 (=> (not res!946993) (not e!797484))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409214 (= res!946993 (validKeyInArray!0 (select (arr!46497 a!2901) j!112)))))

(declare-fun b!1409215 () Bool)

(declare-fun res!946988 () Bool)

(assert (=> b!1409215 (=> (not res!946988) (not e!797484))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1409215 (= res!946988 (and (= (size!47049 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47049 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47049 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409216 () Bool)

(declare-fun res!946990 () Bool)

(assert (=> b!1409216 (=> (not res!946990) (not e!797484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96307 (_ BitVec 32)) Bool)

(assert (=> b!1409216 (= res!946990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409217 () Bool)

(declare-fun e!797486 () Bool)

(assert (=> b!1409217 (= e!797486 true)))

(declare-datatypes ((SeekEntryResult!10834 0))(
  ( (MissingZero!10834 (index!45713 (_ BitVec 32))) (Found!10834 (index!45714 (_ BitVec 32))) (Intermediate!10834 (undefined!11646 Bool) (index!45715 (_ BitVec 32)) (x!127296 (_ BitVec 32))) (Undefined!10834) (MissingVacant!10834 (index!45716 (_ BitVec 32))) )
))
(declare-fun lt!620478 () SeekEntryResult!10834)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96307 (_ BitVec 32)) SeekEntryResult!10834)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409217 (= lt!620478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96308 (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47049 a!2901)) mask!2840))))

(declare-fun b!1409218 () Bool)

(declare-fun res!946987 () Bool)

(assert (=> b!1409218 (=> (not res!946987) (not e!797484))))

(declare-datatypes ((List!33094 0))(
  ( (Nil!33091) (Cons!33090 (h!34353 (_ BitVec 64)) (t!47780 List!33094)) )
))
(declare-fun arrayNoDuplicates!0 (array!96307 (_ BitVec 32) List!33094) Bool)

(assert (=> b!1409218 (= res!946987 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33091))))

(declare-fun res!946989 () Bool)

(assert (=> start!121200 (=> (not res!946989) (not e!797484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121200 (= res!946989 (validMask!0 mask!2840))))

(assert (=> start!121200 e!797484))

(assert (=> start!121200 true))

(declare-fun array_inv!35730 (array!96307) Bool)

(assert (=> start!121200 (array_inv!35730 a!2901)))

(declare-fun b!1409219 () Bool)

(assert (=> b!1409219 (= e!797484 (not e!797486))))

(declare-fun res!946986 () Bool)

(assert (=> b!1409219 (=> res!946986 e!797486)))

(declare-fun lt!620479 () SeekEntryResult!10834)

(assert (=> b!1409219 (= res!946986 (or (not (is-Intermediate!10834 lt!620479)) (undefined!11646 lt!620479)))))

(declare-fun e!797483 () Bool)

(assert (=> b!1409219 e!797483))

(declare-fun res!946992 () Bool)

(assert (=> b!1409219 (=> (not res!946992) (not e!797483))))

(assert (=> b!1409219 (= res!946992 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47485 0))(
  ( (Unit!47486) )
))
(declare-fun lt!620480 () Unit!47485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47485)

(assert (=> b!1409219 (= lt!620480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409219 (= lt!620479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46497 a!2901) j!112) mask!2840) (select (arr!46497 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409220 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96307 (_ BitVec 32)) SeekEntryResult!10834)

(assert (=> b!1409220 (= e!797483 (= (seekEntryOrOpen!0 (select (arr!46497 a!2901) j!112) a!2901 mask!2840) (Found!10834 j!112)))))

(assert (= (and start!121200 res!946989) b!1409215))

(assert (= (and b!1409215 res!946988) b!1409213))

(assert (= (and b!1409213 res!946991) b!1409214))

(assert (= (and b!1409214 res!946993) b!1409216))

(assert (= (and b!1409216 res!946990) b!1409218))

(assert (= (and b!1409218 res!946987) b!1409219))

(assert (= (and b!1409219 res!946992) b!1409220))

(assert (= (and b!1409219 (not res!946986)) b!1409217))

(declare-fun m!1298415 () Bool)

(assert (=> b!1409213 m!1298415))

(assert (=> b!1409213 m!1298415))

(declare-fun m!1298417 () Bool)

(assert (=> b!1409213 m!1298417))

(declare-fun m!1298419 () Bool)

(assert (=> b!1409219 m!1298419))

(declare-fun m!1298421 () Bool)

(assert (=> b!1409219 m!1298421))

(assert (=> b!1409219 m!1298419))

(declare-fun m!1298423 () Bool)

(assert (=> b!1409219 m!1298423))

(assert (=> b!1409219 m!1298421))

(assert (=> b!1409219 m!1298419))

(declare-fun m!1298425 () Bool)

(assert (=> b!1409219 m!1298425))

(declare-fun m!1298427 () Bool)

(assert (=> b!1409219 m!1298427))

(declare-fun m!1298429 () Bool)

(assert (=> b!1409216 m!1298429))

(declare-fun m!1298431 () Bool)

(assert (=> b!1409218 m!1298431))

(declare-fun m!1298433 () Bool)

(assert (=> b!1409217 m!1298433))

(declare-fun m!1298435 () Bool)

(assert (=> b!1409217 m!1298435))

(assert (=> b!1409217 m!1298435))

(declare-fun m!1298437 () Bool)

(assert (=> b!1409217 m!1298437))

(assert (=> b!1409217 m!1298437))

(assert (=> b!1409217 m!1298435))

(declare-fun m!1298439 () Bool)

(assert (=> b!1409217 m!1298439))

(declare-fun m!1298441 () Bool)

(assert (=> start!121200 m!1298441))

(declare-fun m!1298443 () Bool)

(assert (=> start!121200 m!1298443))

(assert (=> b!1409214 m!1298419))

(assert (=> b!1409214 m!1298419))

(declare-fun m!1298445 () Bool)

(assert (=> b!1409214 m!1298445))

(assert (=> b!1409220 m!1298419))

(assert (=> b!1409220 m!1298419))

(declare-fun m!1298447 () Bool)

(assert (=> b!1409220 m!1298447))

(push 1)

(assert (not b!1409213))

(assert (not b!1409218))

(assert (not b!1409219))

(assert (not b!1409216))

(assert (not b!1409217))

(assert (not b!1409214))

(assert (not b!1409220))

(assert (not start!121200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

