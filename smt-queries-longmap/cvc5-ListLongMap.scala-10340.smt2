; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121590 () Bool)

(assert start!121590)

(declare-datatypes ((array!96528 0))(
  ( (array!96529 (arr!46601 (Array (_ BitVec 32) (_ BitVec 64))) (size!47151 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96528)

(declare-fun b!1412466 () Bool)

(declare-fun e!799319 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622355 () array!96528)

(declare-fun lt!622356 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10912 0))(
  ( (MissingZero!10912 (index!46028 (_ BitVec 32))) (Found!10912 (index!46029 (_ BitVec 32))) (Intermediate!10912 (undefined!11724 Bool) (index!46030 (_ BitVec 32)) (x!127623 (_ BitVec 32))) (Undefined!10912) (MissingVacant!10912 (index!46031 (_ BitVec 32))) )
))
(declare-fun lt!622354 () SeekEntryResult!10912)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96528 (_ BitVec 32)) SeekEntryResult!10912)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96528 (_ BitVec 32)) SeekEntryResult!10912)

(assert (=> b!1412466 (= e!799319 (= (seekEntryOrOpen!0 lt!622356 lt!622355 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127623 lt!622354) (index!46030 lt!622354) (index!46030 lt!622354) (select (arr!46601 a!2901) j!112) lt!622355 mask!2840)))))

(declare-fun b!1412467 () Bool)

(declare-fun e!799322 () Bool)

(assert (=> b!1412467 (= e!799322 (= (seekEntryOrOpen!0 (select (arr!46601 a!2901) j!112) a!2901 mask!2840) (Found!10912 j!112)))))

(declare-fun b!1412468 () Bool)

(declare-fun res!949457 () Bool)

(declare-fun e!799317 () Bool)

(assert (=> b!1412468 (=> (not res!949457) (not e!799317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96528 (_ BitVec 32)) Bool)

(assert (=> b!1412468 (= res!949457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!949456 () Bool)

(assert (=> start!121590 (=> (not res!949456) (not e!799317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121590 (= res!949456 (validMask!0 mask!2840))))

(assert (=> start!121590 e!799317))

(assert (=> start!121590 true))

(declare-fun array_inv!35629 (array!96528) Bool)

(assert (=> start!121590 (array_inv!35629 a!2901)))

(declare-fun b!1412469 () Bool)

(declare-fun res!949461 () Bool)

(assert (=> b!1412469 (=> (not res!949461) (not e!799317))))

(declare-datatypes ((List!33120 0))(
  ( (Nil!33117) (Cons!33116 (h!34391 (_ BitVec 64)) (t!47814 List!33120)) )
))
(declare-fun arrayNoDuplicates!0 (array!96528 (_ BitVec 32) List!33120) Bool)

(assert (=> b!1412469 (= res!949461 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33117))))

(declare-fun b!1412470 () Bool)

(declare-fun e!799320 () Bool)

(assert (=> b!1412470 (= e!799320 true)))

(assert (=> b!1412470 e!799319))

(declare-fun res!949464 () Bool)

(assert (=> b!1412470 (=> (not res!949464) (not e!799319))))

(declare-fun lt!622359 () SeekEntryResult!10912)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412470 (= res!949464 (and (not (undefined!11724 lt!622354)) (= (index!46030 lt!622354) i!1037) (bvslt (x!127623 lt!622354) (x!127623 lt!622359)) (= (select (store (arr!46601 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46030 lt!622354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622357 () (_ BitVec 32))

(declare-datatypes ((Unit!47798 0))(
  ( (Unit!47799) )
))
(declare-fun lt!622358 () Unit!47798)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47798)

(assert (=> b!1412470 (= lt!622358 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622357 (x!127623 lt!622359) (index!46030 lt!622359) (x!127623 lt!622354) (index!46030 lt!622354) (undefined!11724 lt!622354) mask!2840))))

(declare-fun b!1412471 () Bool)

(declare-fun res!949460 () Bool)

(assert (=> b!1412471 (=> (not res!949460) (not e!799317))))

(assert (=> b!1412471 (= res!949460 (and (= (size!47151 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47151 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47151 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412472 () Bool)

(declare-fun res!949462 () Bool)

(assert (=> b!1412472 (=> (not res!949462) (not e!799317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412472 (= res!949462 (validKeyInArray!0 (select (arr!46601 a!2901) i!1037)))))

(declare-fun b!1412473 () Bool)

(declare-fun e!799318 () Bool)

(assert (=> b!1412473 (= e!799318 e!799320)))

(declare-fun res!949459 () Bool)

(assert (=> b!1412473 (=> res!949459 e!799320)))

(assert (=> b!1412473 (= res!949459 (or (= lt!622359 lt!622354) (not (is-Intermediate!10912 lt!622354))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96528 (_ BitVec 32)) SeekEntryResult!10912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412473 (= lt!622354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622356 mask!2840) lt!622356 lt!622355 mask!2840))))

(assert (=> b!1412473 (= lt!622356 (select (store (arr!46601 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412473 (= lt!622355 (array!96529 (store (arr!46601 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47151 a!2901)))))

(declare-fun b!1412474 () Bool)

(assert (=> b!1412474 (= e!799317 (not e!799318))))

(declare-fun res!949463 () Bool)

(assert (=> b!1412474 (=> res!949463 e!799318)))

(assert (=> b!1412474 (= res!949463 (or (not (is-Intermediate!10912 lt!622359)) (undefined!11724 lt!622359)))))

(assert (=> b!1412474 e!799322))

(declare-fun res!949465 () Bool)

(assert (=> b!1412474 (=> (not res!949465) (not e!799322))))

(assert (=> b!1412474 (= res!949465 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622353 () Unit!47798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47798)

(assert (=> b!1412474 (= lt!622353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412474 (= lt!622359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622357 (select (arr!46601 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412474 (= lt!622357 (toIndex!0 (select (arr!46601 a!2901) j!112) mask!2840))))

(declare-fun b!1412475 () Bool)

(declare-fun res!949458 () Bool)

(assert (=> b!1412475 (=> (not res!949458) (not e!799317))))

(assert (=> b!1412475 (= res!949458 (validKeyInArray!0 (select (arr!46601 a!2901) j!112)))))

(assert (= (and start!121590 res!949456) b!1412471))

(assert (= (and b!1412471 res!949460) b!1412472))

(assert (= (and b!1412472 res!949462) b!1412475))

(assert (= (and b!1412475 res!949458) b!1412468))

(assert (= (and b!1412468 res!949457) b!1412469))

(assert (= (and b!1412469 res!949461) b!1412474))

(assert (= (and b!1412474 res!949465) b!1412467))

(assert (= (and b!1412474 (not res!949463)) b!1412473))

(assert (= (and b!1412473 (not res!949459)) b!1412470))

(assert (= (and b!1412470 res!949464) b!1412466))

(declare-fun m!1302501 () Bool)

(assert (=> b!1412468 m!1302501))

(declare-fun m!1302503 () Bool)

(assert (=> b!1412467 m!1302503))

(assert (=> b!1412467 m!1302503))

(declare-fun m!1302505 () Bool)

(assert (=> b!1412467 m!1302505))

(declare-fun m!1302507 () Bool)

(assert (=> b!1412472 m!1302507))

(assert (=> b!1412472 m!1302507))

(declare-fun m!1302509 () Bool)

(assert (=> b!1412472 m!1302509))

(assert (=> b!1412475 m!1302503))

(assert (=> b!1412475 m!1302503))

(declare-fun m!1302511 () Bool)

(assert (=> b!1412475 m!1302511))

(declare-fun m!1302513 () Bool)

(assert (=> b!1412470 m!1302513))

(declare-fun m!1302515 () Bool)

(assert (=> b!1412470 m!1302515))

(declare-fun m!1302517 () Bool)

(assert (=> b!1412470 m!1302517))

(declare-fun m!1302519 () Bool)

(assert (=> b!1412469 m!1302519))

(declare-fun m!1302521 () Bool)

(assert (=> start!121590 m!1302521))

(declare-fun m!1302523 () Bool)

(assert (=> start!121590 m!1302523))

(declare-fun m!1302525 () Bool)

(assert (=> b!1412473 m!1302525))

(assert (=> b!1412473 m!1302525))

(declare-fun m!1302527 () Bool)

(assert (=> b!1412473 m!1302527))

(assert (=> b!1412473 m!1302513))

(declare-fun m!1302529 () Bool)

(assert (=> b!1412473 m!1302529))

(assert (=> b!1412474 m!1302503))

(declare-fun m!1302531 () Bool)

(assert (=> b!1412474 m!1302531))

(assert (=> b!1412474 m!1302503))

(declare-fun m!1302533 () Bool)

(assert (=> b!1412474 m!1302533))

(assert (=> b!1412474 m!1302503))

(declare-fun m!1302535 () Bool)

(assert (=> b!1412474 m!1302535))

(declare-fun m!1302537 () Bool)

(assert (=> b!1412474 m!1302537))

(declare-fun m!1302539 () Bool)

(assert (=> b!1412466 m!1302539))

(assert (=> b!1412466 m!1302503))

(assert (=> b!1412466 m!1302503))

(declare-fun m!1302541 () Bool)

(assert (=> b!1412466 m!1302541))

(push 1)

