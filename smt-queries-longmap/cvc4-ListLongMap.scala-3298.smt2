; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45736 () Bool)

(assert start!45736)

(declare-fun b!505696 () Bool)

(declare-fun e!296025 () Bool)

(declare-fun e!296017 () Bool)

(assert (=> b!505696 (= e!296025 (not e!296017))))

(declare-fun res!306735 () Bool)

(assert (=> b!505696 (=> res!306735 e!296017)))

(declare-datatypes ((SeekEntryResult!4093 0))(
  ( (MissingZero!4093 (index!18560 (_ BitVec 32))) (Found!4093 (index!18561 (_ BitVec 32))) (Intermediate!4093 (undefined!4905 Bool) (index!18562 (_ BitVec 32)) (x!47566 (_ BitVec 32))) (Undefined!4093) (MissingVacant!4093 (index!18563 (_ BitVec 32))) )
))
(declare-fun lt!230560 () SeekEntryResult!4093)

(declare-fun lt!230554 () SeekEntryResult!4093)

(assert (=> b!505696 (= res!306735 (or (= lt!230560 lt!230554) (undefined!4905 lt!230560) (not (is-Intermediate!4093 lt!230560))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230557 () (_ BitVec 32))

(declare-datatypes ((array!32492 0))(
  ( (array!32493 (arr!15626 (Array (_ BitVec 32) (_ BitVec 64))) (size!15990 (_ BitVec 32))) )
))
(declare-fun lt!230565 () array!32492)

(declare-fun lt!230562 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32492 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!505696 (= lt!230554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230557 lt!230562 lt!230565 mask!3524))))

(declare-fun lt!230556 () (_ BitVec 32))

(declare-fun a!3235 () array!32492)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505696 (= lt!230560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230556 (select (arr!15626 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505696 (= lt!230557 (toIndex!0 lt!230562 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505696 (= lt!230562 (select (store (arr!15626 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505696 (= lt!230556 (toIndex!0 (select (arr!15626 a!3235) j!176) mask!3524))))

(assert (=> b!505696 (= lt!230565 (array!32493 (store (arr!15626 a!3235) i!1204 k!2280) (size!15990 a!3235)))))

(declare-fun lt!230558 () SeekEntryResult!4093)

(assert (=> b!505696 (= lt!230558 (Found!4093 j!176))))

(declare-fun e!296024 () Bool)

(assert (=> b!505696 e!296024))

(declare-fun res!306732 () Bool)

(assert (=> b!505696 (=> (not res!306732) (not e!296024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32492 (_ BitVec 32)) Bool)

(assert (=> b!505696 (= res!306732 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15448 0))(
  ( (Unit!15449) )
))
(declare-fun lt!230555 () Unit!15448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15448)

(assert (=> b!505696 (= lt!230555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505697 () Bool)

(declare-fun res!306736 () Bool)

(declare-fun e!296018 () Bool)

(assert (=> b!505697 (=> (not res!306736) (not e!296018))))

(declare-fun arrayContainsKey!0 (array!32492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505697 (= res!306736 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505698 () Bool)

(declare-fun e!296023 () Unit!15448)

(declare-fun Unit!15450 () Unit!15448)

(assert (=> b!505698 (= e!296023 Unit!15450)))

(declare-fun b!505699 () Bool)

(declare-fun e!296021 () Bool)

(assert (=> b!505699 (= e!296021 false)))

(declare-fun b!505700 () Bool)

(declare-fun Unit!15451 () Unit!15448)

(assert (=> b!505700 (= e!296023 Unit!15451)))

(declare-fun lt!230559 () Unit!15448)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15448)

(assert (=> b!505700 (= lt!230559 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230556 #b00000000000000000000000000000000 (index!18562 lt!230560) (x!47566 lt!230560) mask!3524))))

(declare-fun res!306739 () Bool)

(assert (=> b!505700 (= res!306739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230556 lt!230562 lt!230565 mask!3524) (Intermediate!4093 false (index!18562 lt!230560) (x!47566 lt!230560))))))

(assert (=> b!505700 (=> (not res!306739) (not e!296021))))

(assert (=> b!505700 e!296021))

(declare-fun b!505701 () Bool)

(declare-fun res!306742 () Bool)

(assert (=> b!505701 (=> (not res!306742) (not e!296018))))

(assert (=> b!505701 (= res!306742 (and (= (size!15990 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15990 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15990 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505702 () Bool)

(declare-fun res!306730 () Bool)

(declare-fun e!296022 () Bool)

(assert (=> b!505702 (=> res!306730 e!296022)))

(assert (=> b!505702 (= res!306730 (not (= lt!230554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230556 lt!230562 lt!230565 mask!3524))))))

(declare-fun e!296020 () Bool)

(declare-fun b!505703 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32492 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!505703 (= e!296020 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230556 (index!18562 lt!230560) (select (arr!15626 a!3235) j!176) a!3235 mask!3524) lt!230558)))))

(declare-fun b!505704 () Bool)

(declare-fun res!306737 () Bool)

(assert (=> b!505704 (=> res!306737 e!296022)))

(assert (=> b!505704 (= res!306737 e!296020)))

(declare-fun res!306741 () Bool)

(assert (=> b!505704 (=> (not res!306741) (not e!296020))))

(assert (=> b!505704 (= res!306741 (bvsgt #b00000000000000000000000000000000 (x!47566 lt!230560)))))

(declare-fun b!505705 () Bool)

(declare-fun res!306738 () Bool)

(assert (=> b!505705 (=> (not res!306738) (not e!296018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505705 (= res!306738 (validKeyInArray!0 k!2280))))

(declare-fun b!505706 () Bool)

(assert (=> b!505706 (= e!296018 e!296025)))

(declare-fun res!306729 () Bool)

(assert (=> b!505706 (=> (not res!306729) (not e!296025))))

(declare-fun lt!230563 () SeekEntryResult!4093)

(assert (=> b!505706 (= res!306729 (or (= lt!230563 (MissingZero!4093 i!1204)) (= lt!230563 (MissingVacant!4093 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32492 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!505706 (= lt!230563 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505707 () Bool)

(assert (=> b!505707 (= e!296022 true)))

(assert (=> b!505707 (= (seekEntryOrOpen!0 lt!230562 lt!230565 mask!3524) lt!230558)))

(declare-fun lt!230564 () Unit!15448)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15448)

(assert (=> b!505707 (= lt!230564 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230556 #b00000000000000000000000000000000 (index!18562 lt!230560) (x!47566 lt!230560) mask!3524))))

(declare-fun b!505708 () Bool)

(declare-fun res!306733 () Bool)

(assert (=> b!505708 (=> (not res!306733) (not e!296025))))

(assert (=> b!505708 (= res!306733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505710 () Bool)

(declare-fun res!306740 () Bool)

(assert (=> b!505710 (=> (not res!306740) (not e!296018))))

(assert (=> b!505710 (= res!306740 (validKeyInArray!0 (select (arr!15626 a!3235) j!176)))))

(declare-fun b!505711 () Bool)

(assert (=> b!505711 (= e!296024 (= (seekEntryOrOpen!0 (select (arr!15626 a!3235) j!176) a!3235 mask!3524) (Found!4093 j!176)))))

(declare-fun b!505712 () Bool)

(declare-fun res!306731 () Bool)

(assert (=> b!505712 (=> (not res!306731) (not e!296025))))

(declare-datatypes ((List!9784 0))(
  ( (Nil!9781) (Cons!9780 (h!10657 (_ BitVec 64)) (t!16012 List!9784)) )
))
(declare-fun arrayNoDuplicates!0 (array!32492 (_ BitVec 32) List!9784) Bool)

(assert (=> b!505712 (= res!306731 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9781))))

(declare-fun res!306734 () Bool)

(assert (=> start!45736 (=> (not res!306734) (not e!296018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45736 (= res!306734 (validMask!0 mask!3524))))

(assert (=> start!45736 e!296018))

(assert (=> start!45736 true))

(declare-fun array_inv!11422 (array!32492) Bool)

(assert (=> start!45736 (array_inv!11422 a!3235)))

(declare-fun b!505709 () Bool)

(assert (=> b!505709 (= e!296017 e!296022)))

(declare-fun res!306743 () Bool)

(assert (=> b!505709 (=> res!306743 e!296022)))

(assert (=> b!505709 (= res!306743 (or (bvsgt (x!47566 lt!230560) #b01111111111111111111111111111110) (bvslt lt!230556 #b00000000000000000000000000000000) (bvsge lt!230556 (size!15990 a!3235)) (bvslt (index!18562 lt!230560) #b00000000000000000000000000000000) (bvsge (index!18562 lt!230560) (size!15990 a!3235)) (not (= lt!230560 (Intermediate!4093 false (index!18562 lt!230560) (x!47566 lt!230560))))))))

(assert (=> b!505709 (= (index!18562 lt!230560) i!1204)))

(declare-fun lt!230561 () Unit!15448)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15448)

(assert (=> b!505709 (= lt!230561 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230556 #b00000000000000000000000000000000 (index!18562 lt!230560) (x!47566 lt!230560) mask!3524))))

(assert (=> b!505709 (and (or (= (select (arr!15626 a!3235) (index!18562 lt!230560)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15626 a!3235) (index!18562 lt!230560)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15626 a!3235) (index!18562 lt!230560)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15626 a!3235) (index!18562 lt!230560)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230566 () Unit!15448)

(assert (=> b!505709 (= lt!230566 e!296023)))

(declare-fun c!59762 () Bool)

(assert (=> b!505709 (= c!59762 (= (select (arr!15626 a!3235) (index!18562 lt!230560)) (select (arr!15626 a!3235) j!176)))))

(assert (=> b!505709 (and (bvslt (x!47566 lt!230560) #b01111111111111111111111111111110) (or (= (select (arr!15626 a!3235) (index!18562 lt!230560)) (select (arr!15626 a!3235) j!176)) (= (select (arr!15626 a!3235) (index!18562 lt!230560)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15626 a!3235) (index!18562 lt!230560)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45736 res!306734) b!505701))

(assert (= (and b!505701 res!306742) b!505710))

(assert (= (and b!505710 res!306740) b!505705))

(assert (= (and b!505705 res!306738) b!505697))

(assert (= (and b!505697 res!306736) b!505706))

(assert (= (and b!505706 res!306729) b!505708))

(assert (= (and b!505708 res!306733) b!505712))

(assert (= (and b!505712 res!306731) b!505696))

(assert (= (and b!505696 res!306732) b!505711))

(assert (= (and b!505696 (not res!306735)) b!505709))

(assert (= (and b!505709 c!59762) b!505700))

(assert (= (and b!505709 (not c!59762)) b!505698))

(assert (= (and b!505700 res!306739) b!505699))

(assert (= (and b!505709 (not res!306743)) b!505704))

(assert (= (and b!505704 res!306741) b!505703))

(assert (= (and b!505704 (not res!306737)) b!505702))

(assert (= (and b!505702 (not res!306730)) b!505707))

(declare-fun m!486355 () Bool)

(assert (=> start!45736 m!486355))

(declare-fun m!486357 () Bool)

(assert (=> start!45736 m!486357))

(declare-fun m!486359 () Bool)

(assert (=> b!505696 m!486359))

(declare-fun m!486361 () Bool)

(assert (=> b!505696 m!486361))

(declare-fun m!486363 () Bool)

(assert (=> b!505696 m!486363))

(declare-fun m!486365 () Bool)

(assert (=> b!505696 m!486365))

(declare-fun m!486367 () Bool)

(assert (=> b!505696 m!486367))

(assert (=> b!505696 m!486365))

(declare-fun m!486369 () Bool)

(assert (=> b!505696 m!486369))

(declare-fun m!486371 () Bool)

(assert (=> b!505696 m!486371))

(assert (=> b!505696 m!486365))

(declare-fun m!486373 () Bool)

(assert (=> b!505696 m!486373))

(declare-fun m!486375 () Bool)

(assert (=> b!505696 m!486375))

(assert (=> b!505703 m!486365))

(assert (=> b!505703 m!486365))

(declare-fun m!486377 () Bool)

(assert (=> b!505703 m!486377))

(declare-fun m!486379 () Bool)

(assert (=> b!505712 m!486379))

(declare-fun m!486381 () Bool)

(assert (=> b!505697 m!486381))

(declare-fun m!486383 () Bool)

(assert (=> b!505702 m!486383))

(declare-fun m!486385 () Bool)

(assert (=> b!505706 m!486385))

(declare-fun m!486387 () Bool)

(assert (=> b!505705 m!486387))

(declare-fun m!486389 () Bool)

(assert (=> b!505708 m!486389))

(assert (=> b!505710 m!486365))

(assert (=> b!505710 m!486365))

(declare-fun m!486391 () Bool)

(assert (=> b!505710 m!486391))

(declare-fun m!486393 () Bool)

(assert (=> b!505700 m!486393))

(assert (=> b!505700 m!486383))

(assert (=> b!505711 m!486365))

(assert (=> b!505711 m!486365))

(declare-fun m!486395 () Bool)

(assert (=> b!505711 m!486395))

(declare-fun m!486397 () Bool)

(assert (=> b!505707 m!486397))

(declare-fun m!486399 () Bool)

(assert (=> b!505707 m!486399))

(declare-fun m!486401 () Bool)

(assert (=> b!505709 m!486401))

(declare-fun m!486403 () Bool)

(assert (=> b!505709 m!486403))

(assert (=> b!505709 m!486365))

(push 1)

