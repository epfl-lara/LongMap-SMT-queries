; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121594 () Bool)

(assert start!121594)

(declare-fun b!1412526 () Bool)

(declare-fun e!799356 () Bool)

(assert (=> b!1412526 (= e!799356 true)))

(declare-fun e!799357 () Bool)

(assert (=> b!1412526 e!799357))

(declare-fun res!949521 () Bool)

(assert (=> b!1412526 (=> (not res!949521) (not e!799357))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10914 0))(
  ( (MissingZero!10914 (index!46036 (_ BitVec 32))) (Found!10914 (index!46037 (_ BitVec 32))) (Intermediate!10914 (undefined!11726 Bool) (index!46038 (_ BitVec 32)) (x!127625 (_ BitVec 32))) (Undefined!10914) (MissingVacant!10914 (index!46039 (_ BitVec 32))) )
))
(declare-fun lt!622399 () SeekEntryResult!10914)

(declare-fun lt!622396 () SeekEntryResult!10914)

(declare-datatypes ((array!96532 0))(
  ( (array!96533 (arr!46603 (Array (_ BitVec 32) (_ BitVec 64))) (size!47153 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96532)

(assert (=> b!1412526 (= res!949521 (and (not (undefined!11726 lt!622396)) (= (index!46038 lt!622396) i!1037) (bvslt (x!127625 lt!622396) (x!127625 lt!622399)) (= (select (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46038 lt!622396)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622401 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47802 0))(
  ( (Unit!47803) )
))
(declare-fun lt!622395 () Unit!47802)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47802)

(assert (=> b!1412526 (= lt!622395 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622401 (x!127625 lt!622399) (index!46038 lt!622399) (x!127625 lt!622396) (index!46038 lt!622396) (undefined!11726 lt!622396) mask!2840))))

(declare-fun b!1412527 () Bool)

(declare-fun res!949516 () Bool)

(declare-fun e!799358 () Bool)

(assert (=> b!1412527 (=> (not res!949516) (not e!799358))))

(declare-datatypes ((List!33122 0))(
  ( (Nil!33119) (Cons!33118 (h!34393 (_ BitVec 64)) (t!47816 List!33122)) )
))
(declare-fun arrayNoDuplicates!0 (array!96532 (_ BitVec 32) List!33122) Bool)

(assert (=> b!1412527 (= res!949516 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33119))))

(declare-fun b!1412528 () Bool)

(declare-fun res!949525 () Bool)

(assert (=> b!1412528 (=> (not res!949525) (not e!799358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96532 (_ BitVec 32)) Bool)

(assert (=> b!1412528 (= res!949525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412529 () Bool)

(declare-fun res!949524 () Bool)

(assert (=> b!1412529 (=> (not res!949524) (not e!799358))))

(assert (=> b!1412529 (= res!949524 (and (= (size!47153 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47153 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47153 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!949523 () Bool)

(assert (=> start!121594 (=> (not res!949523) (not e!799358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121594 (= res!949523 (validMask!0 mask!2840))))

(assert (=> start!121594 e!799358))

(assert (=> start!121594 true))

(declare-fun array_inv!35631 (array!96532) Bool)

(assert (=> start!121594 (array_inv!35631 a!2901)))

(declare-fun lt!622398 () (_ BitVec 64))

(declare-fun b!1412530 () Bool)

(declare-fun lt!622400 () array!96532)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96532 (_ BitVec 32)) SeekEntryResult!10914)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96532 (_ BitVec 32)) SeekEntryResult!10914)

(assert (=> b!1412530 (= e!799357 (= (seekEntryOrOpen!0 lt!622398 lt!622400 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127625 lt!622396) (index!46038 lt!622396) (index!46038 lt!622396) (select (arr!46603 a!2901) j!112) lt!622400 mask!2840)))))

(declare-fun b!1412531 () Bool)

(declare-fun e!799353 () Bool)

(assert (=> b!1412531 (= e!799353 (= (seekEntryOrOpen!0 (select (arr!46603 a!2901) j!112) a!2901 mask!2840) (Found!10914 j!112)))))

(declare-fun b!1412532 () Bool)

(declare-fun res!949518 () Bool)

(assert (=> b!1412532 (=> (not res!949518) (not e!799358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412532 (= res!949518 (validKeyInArray!0 (select (arr!46603 a!2901) i!1037)))))

(declare-fun b!1412533 () Bool)

(declare-fun e!799355 () Bool)

(assert (=> b!1412533 (= e!799355 e!799356)))

(declare-fun res!949519 () Bool)

(assert (=> b!1412533 (=> res!949519 e!799356)))

(assert (=> b!1412533 (= res!949519 (or (= lt!622399 lt!622396) (not (is-Intermediate!10914 lt!622396))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96532 (_ BitVec 32)) SeekEntryResult!10914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412533 (= lt!622396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622398 mask!2840) lt!622398 lt!622400 mask!2840))))

(assert (=> b!1412533 (= lt!622398 (select (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412533 (= lt!622400 (array!96533 (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47153 a!2901)))))

(declare-fun b!1412534 () Bool)

(assert (=> b!1412534 (= e!799358 (not e!799355))))

(declare-fun res!949517 () Bool)

(assert (=> b!1412534 (=> res!949517 e!799355)))

(assert (=> b!1412534 (= res!949517 (or (not (is-Intermediate!10914 lt!622399)) (undefined!11726 lt!622399)))))

(assert (=> b!1412534 e!799353))

(declare-fun res!949522 () Bool)

(assert (=> b!1412534 (=> (not res!949522) (not e!799353))))

(assert (=> b!1412534 (= res!949522 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622397 () Unit!47802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47802)

(assert (=> b!1412534 (= lt!622397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412534 (= lt!622399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622401 (select (arr!46603 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412534 (= lt!622401 (toIndex!0 (select (arr!46603 a!2901) j!112) mask!2840))))

(declare-fun b!1412535 () Bool)

(declare-fun res!949520 () Bool)

(assert (=> b!1412535 (=> (not res!949520) (not e!799358))))

(assert (=> b!1412535 (= res!949520 (validKeyInArray!0 (select (arr!46603 a!2901) j!112)))))

(assert (= (and start!121594 res!949523) b!1412529))

(assert (= (and b!1412529 res!949524) b!1412532))

(assert (= (and b!1412532 res!949518) b!1412535))

(assert (= (and b!1412535 res!949520) b!1412528))

(assert (= (and b!1412528 res!949525) b!1412527))

(assert (= (and b!1412527 res!949516) b!1412534))

(assert (= (and b!1412534 res!949522) b!1412531))

(assert (= (and b!1412534 (not res!949517)) b!1412533))

(assert (= (and b!1412533 (not res!949519)) b!1412526))

(assert (= (and b!1412526 res!949521) b!1412530))

(declare-fun m!1302585 () Bool)

(assert (=> b!1412530 m!1302585))

(declare-fun m!1302587 () Bool)

(assert (=> b!1412530 m!1302587))

(assert (=> b!1412530 m!1302587))

(declare-fun m!1302589 () Bool)

(assert (=> b!1412530 m!1302589))

(declare-fun m!1302591 () Bool)

(assert (=> b!1412527 m!1302591))

(declare-fun m!1302593 () Bool)

(assert (=> b!1412526 m!1302593))

(declare-fun m!1302595 () Bool)

(assert (=> b!1412526 m!1302595))

(declare-fun m!1302597 () Bool)

(assert (=> b!1412526 m!1302597))

(assert (=> b!1412535 m!1302587))

(assert (=> b!1412535 m!1302587))

(declare-fun m!1302599 () Bool)

(assert (=> b!1412535 m!1302599))

(declare-fun m!1302601 () Bool)

(assert (=> b!1412528 m!1302601))

(declare-fun m!1302603 () Bool)

(assert (=> b!1412533 m!1302603))

(assert (=> b!1412533 m!1302603))

(declare-fun m!1302605 () Bool)

(assert (=> b!1412533 m!1302605))

(assert (=> b!1412533 m!1302593))

(declare-fun m!1302607 () Bool)

(assert (=> b!1412533 m!1302607))

(declare-fun m!1302609 () Bool)

(assert (=> start!121594 m!1302609))

(declare-fun m!1302611 () Bool)

(assert (=> start!121594 m!1302611))

(assert (=> b!1412534 m!1302587))

(declare-fun m!1302613 () Bool)

(assert (=> b!1412534 m!1302613))

(assert (=> b!1412534 m!1302587))

(assert (=> b!1412534 m!1302587))

(declare-fun m!1302615 () Bool)

(assert (=> b!1412534 m!1302615))

(declare-fun m!1302617 () Bool)

(assert (=> b!1412534 m!1302617))

(declare-fun m!1302619 () Bool)

(assert (=> b!1412534 m!1302619))

(declare-fun m!1302621 () Bool)

(assert (=> b!1412532 m!1302621))

(assert (=> b!1412532 m!1302621))

(declare-fun m!1302623 () Bool)

(assert (=> b!1412532 m!1302623))

(assert (=> b!1412531 m!1302587))

(assert (=> b!1412531 m!1302587))

(declare-fun m!1302625 () Bool)

(assert (=> b!1412531 m!1302625))

(push 1)

