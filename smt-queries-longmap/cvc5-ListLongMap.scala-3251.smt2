; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45378 () Bool)

(assert start!45378)

(declare-fun b!498468 () Bool)

(declare-fun res!300563 () Bool)

(declare-fun e!292153 () Bool)

(assert (=> b!498468 (=> (not res!300563) (not e!292153))))

(declare-datatypes ((array!32203 0))(
  ( (array!32204 (arr!15483 (Array (_ BitVec 32) (_ BitVec 64))) (size!15847 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32203)

(declare-datatypes ((List!9641 0))(
  ( (Nil!9638) (Cons!9637 (h!10511 (_ BitVec 64)) (t!15869 List!9641)) )
))
(declare-fun arrayNoDuplicates!0 (array!32203 (_ BitVec 32) List!9641) Bool)

(assert (=> b!498468 (= res!300563 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9638))))

(declare-fun b!498469 () Bool)

(declare-fun res!300568 () Bool)

(declare-fun e!292155 () Bool)

(assert (=> b!498469 (=> (not res!300568) (not e!292155))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498469 (= res!300568 (validKeyInArray!0 (select (arr!15483 a!3235) j!176)))))

(declare-fun b!498470 () Bool)

(declare-datatypes ((Unit!14876 0))(
  ( (Unit!14877) )
))
(declare-fun e!292158 () Unit!14876)

(declare-fun Unit!14878 () Unit!14876)

(assert (=> b!498470 (= e!292158 Unit!14878)))

(declare-fun b!498471 () Bool)

(declare-fun e!292151 () Bool)

(assert (=> b!498471 (= e!292151 false)))

(declare-fun b!498472 () Bool)

(declare-fun e!292157 () Bool)

(assert (=> b!498472 (= e!292157 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3950 0))(
  ( (MissingZero!3950 (index!17982 (_ BitVec 32))) (Found!3950 (index!17983 (_ BitVec 32))) (Intermediate!3950 (undefined!4762 Bool) (index!17984 (_ BitVec 32)) (x!47035 (_ BitVec 32))) (Undefined!3950) (MissingVacant!3950 (index!17985 (_ BitVec 32))) )
))
(declare-fun lt!225807 () SeekEntryResult!3950)

(declare-fun lt!225800 () (_ BitVec 32))

(declare-fun lt!225806 () array!32203)

(declare-fun lt!225808 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32203 (_ BitVec 32)) SeekEntryResult!3950)

(assert (=> b!498472 (= lt!225807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225800 lt!225808 lt!225806 mask!3524))))

(declare-fun b!498473 () Bool)

(assert (=> b!498473 (= e!292155 e!292153)))

(declare-fun res!300562 () Bool)

(assert (=> b!498473 (=> (not res!300562) (not e!292153))))

(declare-fun lt!225802 () SeekEntryResult!3950)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498473 (= res!300562 (or (= lt!225802 (MissingZero!3950 i!1204)) (= lt!225802 (MissingVacant!3950 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32203 (_ BitVec 32)) SeekEntryResult!3950)

(assert (=> b!498473 (= lt!225802 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498474 () Bool)

(declare-fun res!300567 () Bool)

(assert (=> b!498474 (=> (not res!300567) (not e!292153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32203 (_ BitVec 32)) Bool)

(assert (=> b!498474 (= res!300567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498475 () Bool)

(declare-fun e!292156 () Bool)

(assert (=> b!498475 (= e!292156 (= (seekEntryOrOpen!0 (select (arr!15483 a!3235) j!176) a!3235 mask!3524) (Found!3950 j!176)))))

(declare-fun res!300565 () Bool)

(assert (=> start!45378 (=> (not res!300565) (not e!292155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45378 (= res!300565 (validMask!0 mask!3524))))

(assert (=> start!45378 e!292155))

(assert (=> start!45378 true))

(declare-fun array_inv!11279 (array!32203) Bool)

(assert (=> start!45378 (array_inv!11279 a!3235)))

(declare-fun b!498476 () Bool)

(declare-fun res!300561 () Bool)

(assert (=> b!498476 (=> (not res!300561) (not e!292155))))

(assert (=> b!498476 (= res!300561 (and (= (size!15847 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15847 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15847 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498477 () Bool)

(declare-fun res!300570 () Bool)

(assert (=> b!498477 (=> (not res!300570) (not e!292155))))

(assert (=> b!498477 (= res!300570 (validKeyInArray!0 k!2280))))

(declare-fun b!498478 () Bool)

(declare-fun e!292154 () Bool)

(assert (=> b!498478 (= e!292153 (not e!292154))))

(declare-fun res!300572 () Bool)

(assert (=> b!498478 (=> res!300572 e!292154)))

(declare-fun lt!225801 () SeekEntryResult!3950)

(declare-fun lt!225805 () (_ BitVec 32))

(assert (=> b!498478 (= res!300572 (= lt!225801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225805 lt!225808 lt!225806 mask!3524)))))

(assert (=> b!498478 (= lt!225801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225800 (select (arr!15483 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498478 (= lt!225805 (toIndex!0 lt!225808 mask!3524))))

(assert (=> b!498478 (= lt!225808 (select (store (arr!15483 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498478 (= lt!225800 (toIndex!0 (select (arr!15483 a!3235) j!176) mask!3524))))

(assert (=> b!498478 (= lt!225806 (array!32204 (store (arr!15483 a!3235) i!1204 k!2280) (size!15847 a!3235)))))

(assert (=> b!498478 e!292156))

(declare-fun res!300571 () Bool)

(assert (=> b!498478 (=> (not res!300571) (not e!292156))))

(assert (=> b!498478 (= res!300571 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225803 () Unit!14876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14876)

(assert (=> b!498478 (= lt!225803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498479 () Bool)

(declare-fun Unit!14879 () Unit!14876)

(assert (=> b!498479 (= e!292158 Unit!14879)))

(declare-fun lt!225804 () Unit!14876)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14876)

(assert (=> b!498479 (= lt!225804 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225800 #b00000000000000000000000000000000 (index!17984 lt!225801) (x!47035 lt!225801) mask!3524))))

(declare-fun res!300569 () Bool)

(assert (=> b!498479 (= res!300569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225800 lt!225808 lt!225806 mask!3524) (Intermediate!3950 false (index!17984 lt!225801) (x!47035 lt!225801))))))

(assert (=> b!498479 (=> (not res!300569) (not e!292151))))

(assert (=> b!498479 e!292151))

(declare-fun b!498480 () Bool)

(assert (=> b!498480 (= e!292154 e!292157)))

(declare-fun res!300564 () Bool)

(assert (=> b!498480 (=> res!300564 e!292157)))

(assert (=> b!498480 (= res!300564 (or (bvsgt #b00000000000000000000000000000000 (x!47035 lt!225801)) (bvsgt (x!47035 lt!225801) #b01111111111111111111111111111110) (bvslt lt!225800 #b00000000000000000000000000000000) (bvsge lt!225800 (size!15847 a!3235)) (bvslt (index!17984 lt!225801) #b00000000000000000000000000000000) (bvsge (index!17984 lt!225801) (size!15847 a!3235)) (not (= lt!225801 (Intermediate!3950 false (index!17984 lt!225801) (x!47035 lt!225801))))))))

(assert (=> b!498480 (and (or (= (select (arr!15483 a!3235) (index!17984 lt!225801)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15483 a!3235) (index!17984 lt!225801)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15483 a!3235) (index!17984 lt!225801)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15483 a!3235) (index!17984 lt!225801)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225799 () Unit!14876)

(assert (=> b!498480 (= lt!225799 e!292158)))

(declare-fun c!59231 () Bool)

(assert (=> b!498480 (= c!59231 (= (select (arr!15483 a!3235) (index!17984 lt!225801)) (select (arr!15483 a!3235) j!176)))))

(assert (=> b!498480 (and (bvslt (x!47035 lt!225801) #b01111111111111111111111111111110) (or (= (select (arr!15483 a!3235) (index!17984 lt!225801)) (select (arr!15483 a!3235) j!176)) (= (select (arr!15483 a!3235) (index!17984 lt!225801)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15483 a!3235) (index!17984 lt!225801)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498481 () Bool)

(declare-fun res!300560 () Bool)

(assert (=> b!498481 (=> (not res!300560) (not e!292155))))

(declare-fun arrayContainsKey!0 (array!32203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498481 (= res!300560 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498482 () Bool)

(declare-fun res!300566 () Bool)

(assert (=> b!498482 (=> res!300566 e!292154)))

(assert (=> b!498482 (= res!300566 (or (undefined!4762 lt!225801) (not (is-Intermediate!3950 lt!225801))))))

(assert (= (and start!45378 res!300565) b!498476))

(assert (= (and b!498476 res!300561) b!498469))

(assert (= (and b!498469 res!300568) b!498477))

(assert (= (and b!498477 res!300570) b!498481))

(assert (= (and b!498481 res!300560) b!498473))

(assert (= (and b!498473 res!300562) b!498474))

(assert (= (and b!498474 res!300567) b!498468))

(assert (= (and b!498468 res!300563) b!498478))

(assert (= (and b!498478 res!300571) b!498475))

(assert (= (and b!498478 (not res!300572)) b!498482))

(assert (= (and b!498482 (not res!300566)) b!498480))

(assert (= (and b!498480 c!59231) b!498479))

(assert (= (and b!498480 (not c!59231)) b!498470))

(assert (= (and b!498479 res!300569) b!498471))

(assert (= (and b!498480 (not res!300564)) b!498472))

(declare-fun m!479733 () Bool)

(assert (=> b!498469 m!479733))

(assert (=> b!498469 m!479733))

(declare-fun m!479735 () Bool)

(assert (=> b!498469 m!479735))

(declare-fun m!479737 () Bool)

(assert (=> b!498473 m!479737))

(declare-fun m!479739 () Bool)

(assert (=> b!498478 m!479739))

(declare-fun m!479741 () Bool)

(assert (=> b!498478 m!479741))

(declare-fun m!479743 () Bool)

(assert (=> b!498478 m!479743))

(assert (=> b!498478 m!479733))

(declare-fun m!479745 () Bool)

(assert (=> b!498478 m!479745))

(assert (=> b!498478 m!479733))

(declare-fun m!479747 () Bool)

(assert (=> b!498478 m!479747))

(declare-fun m!479749 () Bool)

(assert (=> b!498478 m!479749))

(assert (=> b!498478 m!479733))

(declare-fun m!479751 () Bool)

(assert (=> b!498478 m!479751))

(declare-fun m!479753 () Bool)

(assert (=> b!498478 m!479753))

(declare-fun m!479755 () Bool)

(assert (=> b!498481 m!479755))

(declare-fun m!479757 () Bool)

(assert (=> b!498480 m!479757))

(assert (=> b!498480 m!479733))

(declare-fun m!479759 () Bool)

(assert (=> b!498477 m!479759))

(declare-fun m!479761 () Bool)

(assert (=> start!45378 m!479761))

(declare-fun m!479763 () Bool)

(assert (=> start!45378 m!479763))

(declare-fun m!479765 () Bool)

(assert (=> b!498472 m!479765))

(declare-fun m!479767 () Bool)

(assert (=> b!498474 m!479767))

(declare-fun m!479769 () Bool)

(assert (=> b!498479 m!479769))

(assert (=> b!498479 m!479765))

(declare-fun m!479771 () Bool)

(assert (=> b!498468 m!479771))

(assert (=> b!498475 m!479733))

(assert (=> b!498475 m!479733))

(declare-fun m!479773 () Bool)

(assert (=> b!498475 m!479773))

(push 1)

