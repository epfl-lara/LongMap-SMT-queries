; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121588 () Bool)

(assert start!121588)

(declare-fun b!1412436 () Bool)

(declare-fun res!949430 () Bool)

(declare-fun e!799299 () Bool)

(assert (=> b!1412436 (=> (not res!949430) (not e!799299))))

(declare-datatypes ((array!96526 0))(
  ( (array!96527 (arr!46600 (Array (_ BitVec 32) (_ BitVec 64))) (size!47150 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96526)

(declare-datatypes ((List!33119 0))(
  ( (Nil!33116) (Cons!33115 (h!34390 (_ BitVec 64)) (t!47813 List!33119)) )
))
(declare-fun arrayNoDuplicates!0 (array!96526 (_ BitVec 32) List!33119) Bool)

(assert (=> b!1412436 (= res!949430 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33116))))

(declare-fun res!949435 () Bool)

(assert (=> start!121588 (=> (not res!949435) (not e!799299))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121588 (= res!949435 (validMask!0 mask!2840))))

(assert (=> start!121588 e!799299))

(assert (=> start!121588 true))

(declare-fun array_inv!35628 (array!96526) Bool)

(assert (=> start!121588 (array_inv!35628 a!2901)))

(declare-fun b!1412437 () Bool)

(declare-fun res!949428 () Bool)

(assert (=> b!1412437 (=> (not res!949428) (not e!799299))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412437 (= res!949428 (validKeyInArray!0 (select (arr!46600 a!2901) i!1037)))))

(declare-fun b!1412438 () Bool)

(declare-fun res!949427 () Bool)

(assert (=> b!1412438 (=> (not res!949427) (not e!799299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96526 (_ BitVec 32)) Bool)

(assert (=> b!1412438 (= res!949427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412439 () Bool)

(declare-fun e!799304 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10911 0))(
  ( (MissingZero!10911 (index!46024 (_ BitVec 32))) (Found!10911 (index!46025 (_ BitVec 32))) (Intermediate!10911 (undefined!11723 Bool) (index!46026 (_ BitVec 32)) (x!127614 (_ BitVec 32))) (Undefined!10911) (MissingVacant!10911 (index!46027 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96526 (_ BitVec 32)) SeekEntryResult!10911)

(assert (=> b!1412439 (= e!799304 (= (seekEntryOrOpen!0 (select (arr!46600 a!2901) j!112) a!2901 mask!2840) (Found!10911 j!112)))))

(declare-fun b!1412440 () Bool)

(declare-fun res!949429 () Bool)

(assert (=> b!1412440 (=> (not res!949429) (not e!799299))))

(assert (=> b!1412440 (= res!949429 (validKeyInArray!0 (select (arr!46600 a!2901) j!112)))))

(declare-fun b!1412441 () Bool)

(declare-fun res!949433 () Bool)

(assert (=> b!1412441 (=> (not res!949433) (not e!799299))))

(assert (=> b!1412441 (= res!949433 (and (= (size!47150 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47150 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47150 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412442 () Bool)

(declare-fun e!799301 () Bool)

(assert (=> b!1412442 (= e!799299 (not e!799301))))

(declare-fun res!949432 () Bool)

(assert (=> b!1412442 (=> res!949432 e!799301)))

(declare-fun lt!622332 () SeekEntryResult!10911)

(assert (=> b!1412442 (= res!949432 (or (not (is-Intermediate!10911 lt!622332)) (undefined!11723 lt!622332)))))

(assert (=> b!1412442 e!799304))

(declare-fun res!949434 () Bool)

(assert (=> b!1412442 (=> (not res!949434) (not e!799304))))

(assert (=> b!1412442 (= res!949434 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47796 0))(
  ( (Unit!47797) )
))
(declare-fun lt!622335 () Unit!47796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47796)

(assert (=> b!1412442 (= lt!622335 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622334 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96526 (_ BitVec 32)) SeekEntryResult!10911)

(assert (=> b!1412442 (= lt!622332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622334 (select (arr!46600 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412442 (= lt!622334 (toIndex!0 (select (arr!46600 a!2901) j!112) mask!2840))))

(declare-fun b!1412443 () Bool)

(declare-fun e!799302 () Bool)

(assert (=> b!1412443 (= e!799301 e!799302)))

(declare-fun res!949431 () Bool)

(assert (=> b!1412443 (=> res!949431 e!799302)))

(declare-fun lt!622337 () SeekEntryResult!10911)

(assert (=> b!1412443 (= res!949431 (or (= lt!622332 lt!622337) (not (is-Intermediate!10911 lt!622337))))))

(declare-fun lt!622338 () array!96526)

(declare-fun lt!622336 () (_ BitVec 64))

(assert (=> b!1412443 (= lt!622337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622336 mask!2840) lt!622336 lt!622338 mask!2840))))

(assert (=> b!1412443 (= lt!622336 (select (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412443 (= lt!622338 (array!96527 (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47150 a!2901)))))

(declare-fun e!799300 () Bool)

(declare-fun b!1412444 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96526 (_ BitVec 32)) SeekEntryResult!10911)

(assert (=> b!1412444 (= e!799300 (= (seekEntryOrOpen!0 lt!622336 lt!622338 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127614 lt!622337) (index!46026 lt!622337) (index!46026 lt!622337) (select (arr!46600 a!2901) j!112) lt!622338 mask!2840)))))

(declare-fun b!1412445 () Bool)

(assert (=> b!1412445 (= e!799302 true)))

(assert (=> b!1412445 e!799300))

(declare-fun res!949426 () Bool)

(assert (=> b!1412445 (=> (not res!949426) (not e!799300))))

(assert (=> b!1412445 (= res!949426 (and (not (undefined!11723 lt!622337)) (= (index!46026 lt!622337) i!1037) (bvslt (x!127614 lt!622337) (x!127614 lt!622332)) (= (select (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46026 lt!622337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622333 () Unit!47796)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47796)

(assert (=> b!1412445 (= lt!622333 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622334 (x!127614 lt!622332) (index!46026 lt!622332) (x!127614 lt!622337) (index!46026 lt!622337) (undefined!11723 lt!622337) mask!2840))))

(assert (= (and start!121588 res!949435) b!1412441))

(assert (= (and b!1412441 res!949433) b!1412437))

(assert (= (and b!1412437 res!949428) b!1412440))

(assert (= (and b!1412440 res!949429) b!1412438))

(assert (= (and b!1412438 res!949427) b!1412436))

(assert (= (and b!1412436 res!949430) b!1412442))

(assert (= (and b!1412442 res!949434) b!1412439))

(assert (= (and b!1412442 (not res!949432)) b!1412443))

(assert (= (and b!1412443 (not res!949431)) b!1412445))

(assert (= (and b!1412445 res!949426) b!1412444))

(declare-fun m!1302459 () Bool)

(assert (=> b!1412439 m!1302459))

(assert (=> b!1412439 m!1302459))

(declare-fun m!1302461 () Bool)

(assert (=> b!1412439 m!1302461))

(declare-fun m!1302463 () Bool)

(assert (=> b!1412444 m!1302463))

(assert (=> b!1412444 m!1302459))

(assert (=> b!1412444 m!1302459))

(declare-fun m!1302465 () Bool)

(assert (=> b!1412444 m!1302465))

(declare-fun m!1302467 () Bool)

(assert (=> b!1412443 m!1302467))

(assert (=> b!1412443 m!1302467))

(declare-fun m!1302469 () Bool)

(assert (=> b!1412443 m!1302469))

(declare-fun m!1302471 () Bool)

(assert (=> b!1412443 m!1302471))

(declare-fun m!1302473 () Bool)

(assert (=> b!1412443 m!1302473))

(assert (=> b!1412445 m!1302471))

(declare-fun m!1302475 () Bool)

(assert (=> b!1412445 m!1302475))

(declare-fun m!1302477 () Bool)

(assert (=> b!1412445 m!1302477))

(declare-fun m!1302479 () Bool)

(assert (=> b!1412437 m!1302479))

(assert (=> b!1412437 m!1302479))

(declare-fun m!1302481 () Bool)

(assert (=> b!1412437 m!1302481))

(declare-fun m!1302483 () Bool)

(assert (=> b!1412438 m!1302483))

(declare-fun m!1302485 () Bool)

(assert (=> start!121588 m!1302485))

(declare-fun m!1302487 () Bool)

(assert (=> start!121588 m!1302487))

(declare-fun m!1302489 () Bool)

(assert (=> b!1412436 m!1302489))

(assert (=> b!1412440 m!1302459))

(assert (=> b!1412440 m!1302459))

(declare-fun m!1302491 () Bool)

(assert (=> b!1412440 m!1302491))

(assert (=> b!1412442 m!1302459))

(declare-fun m!1302493 () Bool)

(assert (=> b!1412442 m!1302493))

(assert (=> b!1412442 m!1302459))

(declare-fun m!1302495 () Bool)

(assert (=> b!1412442 m!1302495))

(assert (=> b!1412442 m!1302459))

(declare-fun m!1302497 () Bool)

(assert (=> b!1412442 m!1302497))

(declare-fun m!1302499 () Bool)

(assert (=> b!1412442 m!1302499))

(push 1)

