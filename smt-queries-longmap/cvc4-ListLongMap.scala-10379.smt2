; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122200 () Bool)

(assert start!122200)

(declare-fun b!1417614 () Bool)

(declare-fun res!953350 () Bool)

(declare-fun e!802286 () Bool)

(assert (=> b!1417614 (=> (not res!953350) (not e!802286))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96784 0))(
  ( (array!96785 (arr!46720 (Array (_ BitVec 32) (_ BitVec 64))) (size!47270 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96784)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417614 (= res!953350 (and (= (size!47270 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47270 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47270 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417615 () Bool)

(assert (=> b!1417615 (= e!802286 (not true))))

(declare-fun e!802284 () Bool)

(assert (=> b!1417615 e!802284))

(declare-fun res!953347 () Bool)

(assert (=> b!1417615 (=> (not res!953347) (not e!802284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96784 (_ BitVec 32)) Bool)

(assert (=> b!1417615 (= res!953347 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48036 0))(
  ( (Unit!48037) )
))
(declare-fun lt!625422 () Unit!48036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48036)

(assert (=> b!1417615 (= lt!625422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11031 0))(
  ( (MissingZero!11031 (index!46516 (_ BitVec 32))) (Found!11031 (index!46517 (_ BitVec 32))) (Intermediate!11031 (undefined!11843 Bool) (index!46518 (_ BitVec 32)) (x!128114 (_ BitVec 32))) (Undefined!11031) (MissingVacant!11031 (index!46519 (_ BitVec 32))) )
))
(declare-fun lt!625421 () SeekEntryResult!11031)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96784 (_ BitVec 32)) SeekEntryResult!11031)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417615 (= lt!625421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46720 a!2901) j!112) mask!2840) (select (arr!46720 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!953348 () Bool)

(assert (=> start!122200 (=> (not res!953348) (not e!802286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122200 (= res!953348 (validMask!0 mask!2840))))

(assert (=> start!122200 e!802286))

(assert (=> start!122200 true))

(declare-fun array_inv!35748 (array!96784) Bool)

(assert (=> start!122200 (array_inv!35748 a!2901)))

(declare-fun b!1417616 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96784 (_ BitVec 32)) SeekEntryResult!11031)

(assert (=> b!1417616 (= e!802284 (= (seekEntryOrOpen!0 (select (arr!46720 a!2901) j!112) a!2901 mask!2840) (Found!11031 j!112)))))

(declare-fun b!1417617 () Bool)

(declare-fun res!953344 () Bool)

(assert (=> b!1417617 (=> (not res!953344) (not e!802286))))

(assert (=> b!1417617 (= res!953344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417618 () Bool)

(declare-fun res!953346 () Bool)

(assert (=> b!1417618 (=> (not res!953346) (not e!802286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417618 (= res!953346 (validKeyInArray!0 (select (arr!46720 a!2901) j!112)))))

(declare-fun b!1417619 () Bool)

(declare-fun res!953345 () Bool)

(assert (=> b!1417619 (=> (not res!953345) (not e!802286))))

(assert (=> b!1417619 (= res!953345 (validKeyInArray!0 (select (arr!46720 a!2901) i!1037)))))

(declare-fun b!1417620 () Bool)

(declare-fun res!953349 () Bool)

(assert (=> b!1417620 (=> (not res!953349) (not e!802286))))

(declare-datatypes ((List!33239 0))(
  ( (Nil!33236) (Cons!33235 (h!34528 (_ BitVec 64)) (t!47933 List!33239)) )
))
(declare-fun arrayNoDuplicates!0 (array!96784 (_ BitVec 32) List!33239) Bool)

(assert (=> b!1417620 (= res!953349 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33236))))

(assert (= (and start!122200 res!953348) b!1417614))

(assert (= (and b!1417614 res!953350) b!1417619))

(assert (= (and b!1417619 res!953345) b!1417618))

(assert (= (and b!1417618 res!953346) b!1417617))

(assert (= (and b!1417617 res!953344) b!1417620))

(assert (= (and b!1417620 res!953349) b!1417615))

(assert (= (and b!1417615 res!953347) b!1417616))

(declare-fun m!1308373 () Bool)

(assert (=> b!1417617 m!1308373))

(declare-fun m!1308375 () Bool)

(assert (=> start!122200 m!1308375))

(declare-fun m!1308377 () Bool)

(assert (=> start!122200 m!1308377))

(declare-fun m!1308379 () Bool)

(assert (=> b!1417616 m!1308379))

(assert (=> b!1417616 m!1308379))

(declare-fun m!1308381 () Bool)

(assert (=> b!1417616 m!1308381))

(assert (=> b!1417618 m!1308379))

(assert (=> b!1417618 m!1308379))

(declare-fun m!1308383 () Bool)

(assert (=> b!1417618 m!1308383))

(assert (=> b!1417615 m!1308379))

(declare-fun m!1308385 () Bool)

(assert (=> b!1417615 m!1308385))

(assert (=> b!1417615 m!1308379))

(declare-fun m!1308387 () Bool)

(assert (=> b!1417615 m!1308387))

(assert (=> b!1417615 m!1308385))

(assert (=> b!1417615 m!1308379))

(declare-fun m!1308389 () Bool)

(assert (=> b!1417615 m!1308389))

(declare-fun m!1308391 () Bool)

(assert (=> b!1417615 m!1308391))

(declare-fun m!1308393 () Bool)

(assert (=> b!1417619 m!1308393))

(assert (=> b!1417619 m!1308393))

(declare-fun m!1308395 () Bool)

(assert (=> b!1417619 m!1308395))

(declare-fun m!1308397 () Bool)

(assert (=> b!1417620 m!1308397))

(push 1)

(assert (not b!1417617))

(assert (not b!1417616))

(assert (not b!1417618))

(assert (not b!1417615))

(assert (not b!1417619))

(assert (not start!122200))

(assert (not b!1417620))

(check-sat)

(pop 1)

(push 1)

