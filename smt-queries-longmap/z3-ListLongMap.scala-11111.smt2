; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130152 () Bool)

(assert start!130152)

(declare-fun b!1525474 () Bool)

(declare-fun res!1042897 () Bool)

(declare-fun e!850666 () Bool)

(assert (=> b!1525474 (=> (not res!1042897) (not e!850666))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101485 0))(
  ( (array!101486 (arr!48967 (Array (_ BitVec 32) (_ BitVec 64))) (size!49518 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101485)

(assert (=> b!1525474 (= res!1042897 (and (= (size!49518 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49518 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49518 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525475 () Bool)

(declare-fun res!1042900 () Bool)

(assert (=> b!1525475 (=> (not res!1042900) (not e!850666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525475 (= res!1042900 (validKeyInArray!0 (select (arr!48967 a!2804) j!70)))))

(declare-fun b!1525476 () Bool)

(declare-fun e!850665 () Bool)

(assert (=> b!1525476 (= e!850665 (not true))))

(declare-fun e!850664 () Bool)

(assert (=> b!1525476 e!850664))

(declare-fun res!1042895 () Bool)

(assert (=> b!1525476 (=> (not res!1042895) (not e!850664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101485 (_ BitVec 32)) Bool)

(assert (=> b!1525476 (= res!1042895 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50869 0))(
  ( (Unit!50870) )
))
(declare-fun lt!660757 () Unit!50869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50869)

(assert (=> b!1525476 (= lt!660757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525477 () Bool)

(declare-fun res!1042902 () Bool)

(assert (=> b!1525477 (=> (not res!1042902) (not e!850666))))

(assert (=> b!1525477 (= res!1042902 (validKeyInArray!0 (select (arr!48967 a!2804) i!961)))))

(declare-fun b!1525478 () Bool)

(declare-fun res!1042905 () Bool)

(assert (=> b!1525478 (=> (not res!1042905) (not e!850666))))

(declare-datatypes ((List!35437 0))(
  ( (Nil!35434) (Cons!35433 (h!36875 (_ BitVec 64)) (t!50123 List!35437)) )
))
(declare-fun arrayNoDuplicates!0 (array!101485 (_ BitVec 32) List!35437) Bool)

(assert (=> b!1525478 (= res!1042905 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35434))))

(declare-fun res!1042896 () Bool)

(assert (=> start!130152 (=> (not res!1042896) (not e!850666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130152 (= res!1042896 (validMask!0 mask!2512))))

(assert (=> start!130152 e!850666))

(assert (=> start!130152 true))

(declare-fun array_inv!38248 (array!101485) Bool)

(assert (=> start!130152 (array_inv!38248 a!2804)))

(declare-fun b!1525479 () Bool)

(declare-fun res!1042901 () Bool)

(assert (=> b!1525479 (=> (not res!1042901) (not e!850665))))

(declare-datatypes ((SeekEntryResult!13025 0))(
  ( (MissingZero!13025 (index!54495 (_ BitVec 32))) (Found!13025 (index!54496 (_ BitVec 32))) (Intermediate!13025 (undefined!13837 Bool) (index!54497 (_ BitVec 32)) (x!136398 (_ BitVec 32))) (Undefined!13025) (MissingVacant!13025 (index!54498 (_ BitVec 32))) )
))
(declare-fun lt!660758 () SeekEntryResult!13025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525479 (= res!1042901 (= lt!660758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101486 (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49518 a!2804)) mask!2512)))))

(declare-fun b!1525480 () Bool)

(declare-fun res!1042898 () Bool)

(assert (=> b!1525480 (=> (not res!1042898) (not e!850666))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525480 (= res!1042898 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49518 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49518 a!2804))))))

(declare-fun b!1525481 () Bool)

(declare-fun res!1042904 () Bool)

(assert (=> b!1525481 (=> (not res!1042904) (not e!850666))))

(assert (=> b!1525481 (= res!1042904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525482 () Bool)

(declare-fun res!1042903 () Bool)

(assert (=> b!1525482 (=> (not res!1042903) (not e!850665))))

(declare-fun lt!660759 () SeekEntryResult!13025)

(assert (=> b!1525482 (= res!1042903 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) lt!660759))))

(declare-fun b!1525483 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13025)

(assert (=> b!1525483 (= e!850664 (= (seekEntry!0 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) (Found!13025 j!70)))))

(declare-fun b!1525484 () Bool)

(assert (=> b!1525484 (= e!850666 e!850665)))

(declare-fun res!1042899 () Bool)

(assert (=> b!1525484 (=> (not res!1042899) (not e!850665))))

(assert (=> b!1525484 (= res!1042899 (= lt!660758 lt!660759))))

(assert (=> b!1525484 (= lt!660759 (Intermediate!13025 false resIndex!21 resX!21))))

(assert (=> b!1525484 (= lt!660758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48967 a!2804) j!70) mask!2512) (select (arr!48967 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130152 res!1042896) b!1525474))

(assert (= (and b!1525474 res!1042897) b!1525477))

(assert (= (and b!1525477 res!1042902) b!1525475))

(assert (= (and b!1525475 res!1042900) b!1525481))

(assert (= (and b!1525481 res!1042904) b!1525478))

(assert (= (and b!1525478 res!1042905) b!1525480))

(assert (= (and b!1525480 res!1042898) b!1525484))

(assert (= (and b!1525484 res!1042899) b!1525482))

(assert (= (and b!1525482 res!1042903) b!1525479))

(assert (= (and b!1525479 res!1042901) b!1525476))

(assert (= (and b!1525476 res!1042895) b!1525483))

(declare-fun m!1408417 () Bool)

(assert (=> b!1525475 m!1408417))

(assert (=> b!1525475 m!1408417))

(declare-fun m!1408419 () Bool)

(assert (=> b!1525475 m!1408419))

(assert (=> b!1525483 m!1408417))

(assert (=> b!1525483 m!1408417))

(declare-fun m!1408421 () Bool)

(assert (=> b!1525483 m!1408421))

(assert (=> b!1525484 m!1408417))

(assert (=> b!1525484 m!1408417))

(declare-fun m!1408423 () Bool)

(assert (=> b!1525484 m!1408423))

(assert (=> b!1525484 m!1408423))

(assert (=> b!1525484 m!1408417))

(declare-fun m!1408425 () Bool)

(assert (=> b!1525484 m!1408425))

(declare-fun m!1408427 () Bool)

(assert (=> b!1525481 m!1408427))

(declare-fun m!1408429 () Bool)

(assert (=> b!1525477 m!1408429))

(assert (=> b!1525477 m!1408429))

(declare-fun m!1408431 () Bool)

(assert (=> b!1525477 m!1408431))

(declare-fun m!1408433 () Bool)

(assert (=> b!1525479 m!1408433))

(declare-fun m!1408435 () Bool)

(assert (=> b!1525479 m!1408435))

(assert (=> b!1525479 m!1408435))

(declare-fun m!1408437 () Bool)

(assert (=> b!1525479 m!1408437))

(assert (=> b!1525479 m!1408437))

(assert (=> b!1525479 m!1408435))

(declare-fun m!1408439 () Bool)

(assert (=> b!1525479 m!1408439))

(declare-fun m!1408441 () Bool)

(assert (=> start!130152 m!1408441))

(declare-fun m!1408443 () Bool)

(assert (=> start!130152 m!1408443))

(assert (=> b!1525482 m!1408417))

(assert (=> b!1525482 m!1408417))

(declare-fun m!1408445 () Bool)

(assert (=> b!1525482 m!1408445))

(declare-fun m!1408447 () Bool)

(assert (=> b!1525478 m!1408447))

(declare-fun m!1408449 () Bool)

(assert (=> b!1525476 m!1408449))

(declare-fun m!1408451 () Bool)

(assert (=> b!1525476 m!1408451))

(check-sat (not b!1525477) (not b!1525476) (not b!1525475) (not b!1525481) (not b!1525478) (not b!1525484) (not b!1525482) (not start!130152) (not b!1525483) (not b!1525479))
(check-sat)
