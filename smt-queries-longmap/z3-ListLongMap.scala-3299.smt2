; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45740 () Bool)

(assert start!45740)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!505798 () Bool)

(declare-datatypes ((array!32496 0))(
  ( (array!32497 (arr!15628 (Array (_ BitVec 32) (_ BitVec 64))) (size!15992 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32496)

(declare-fun e!296073 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4095 0))(
  ( (MissingZero!4095 (index!18568 (_ BitVec 32))) (Found!4095 (index!18569 (_ BitVec 32))) (Intermediate!4095 (undefined!4907 Bool) (index!18570 (_ BitVec 32)) (x!47576 (_ BitVec 32))) (Undefined!4095) (MissingVacant!4095 (index!18571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32496 (_ BitVec 32)) SeekEntryResult!4095)

(assert (=> b!505798 (= e!296073 (= (seekEntryOrOpen!0 (select (arr!15628 a!3235) j!176) a!3235 mask!3524) (Found!4095 j!176)))))

(declare-fun lt!230639 () SeekEntryResult!4095)

(declare-fun b!505799 () Bool)

(declare-fun lt!230635 () (_ BitVec 32))

(declare-fun lt!230638 () SeekEntryResult!4095)

(declare-fun e!296071 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32496 (_ BitVec 32)) SeekEntryResult!4095)

(assert (=> b!505799 (= e!296071 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230635 (index!18570 lt!230638) (select (arr!15628 a!3235) j!176) a!3235 mask!3524) lt!230639)))))

(declare-fun res!306827 () Bool)

(declare-fun e!296077 () Bool)

(assert (=> start!45740 (=> (not res!306827) (not e!296077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45740 (= res!306827 (validMask!0 mask!3524))))

(assert (=> start!45740 e!296077))

(assert (=> start!45740 true))

(declare-fun array_inv!11424 (array!32496) Bool)

(assert (=> start!45740 (array_inv!11424 a!3235)))

(declare-fun b!505800 () Bool)

(declare-fun res!306833 () Bool)

(assert (=> b!505800 (=> (not res!306833) (not e!296077))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505800 (= res!306833 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505801 () Bool)

(declare-fun res!306821 () Bool)

(assert (=> b!505801 (=> (not res!306821) (not e!296077))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505801 (= res!306821 (and (= (size!15992 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15992 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15992 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505802 () Bool)

(declare-datatypes ((Unit!15456 0))(
  ( (Unit!15457) )
))
(declare-fun e!296075 () Unit!15456)

(declare-fun Unit!15458 () Unit!15456)

(assert (=> b!505802 (= e!296075 Unit!15458)))

(declare-fun b!505803 () Bool)

(declare-fun res!306825 () Bool)

(declare-fun e!296078 () Bool)

(assert (=> b!505803 (=> (not res!306825) (not e!296078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32496 (_ BitVec 32)) Bool)

(assert (=> b!505803 (= res!306825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505804 () Bool)

(declare-fun e!296072 () Bool)

(assert (=> b!505804 (= e!296072 false)))

(declare-fun b!505805 () Bool)

(declare-fun e!296079 () Bool)

(assert (=> b!505805 (= e!296079 true)))

(declare-fun lt!230644 () (_ BitVec 64))

(declare-fun lt!230641 () array!32496)

(assert (=> b!505805 (= (seekEntryOrOpen!0 lt!230644 lt!230641 mask!3524) lt!230639)))

(declare-fun lt!230642 () Unit!15456)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15456)

(assert (=> b!505805 (= lt!230642 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230635 #b00000000000000000000000000000000 (index!18570 lt!230638) (x!47576 lt!230638) mask!3524))))

(declare-fun b!505806 () Bool)

(assert (=> b!505806 (= e!296077 e!296078)))

(declare-fun res!306831 () Bool)

(assert (=> b!505806 (=> (not res!306831) (not e!296078))))

(declare-fun lt!230634 () SeekEntryResult!4095)

(assert (=> b!505806 (= res!306831 (or (= lt!230634 (MissingZero!4095 i!1204)) (= lt!230634 (MissingVacant!4095 i!1204))))))

(assert (=> b!505806 (= lt!230634 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505807 () Bool)

(declare-fun Unit!15459 () Unit!15456)

(assert (=> b!505807 (= e!296075 Unit!15459)))

(declare-fun lt!230636 () Unit!15456)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15456)

(assert (=> b!505807 (= lt!230636 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230635 #b00000000000000000000000000000000 (index!18570 lt!230638) (x!47576 lt!230638) mask!3524))))

(declare-fun res!306829 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32496 (_ BitVec 32)) SeekEntryResult!4095)

(assert (=> b!505807 (= res!306829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230635 lt!230644 lt!230641 mask!3524) (Intermediate!4095 false (index!18570 lt!230638) (x!47576 lt!230638))))))

(assert (=> b!505807 (=> (not res!306829) (not e!296072))))

(assert (=> b!505807 e!296072))

(declare-fun b!505808 () Bool)

(declare-fun res!306826 () Bool)

(assert (=> b!505808 (=> (not res!306826) (not e!296078))))

(declare-datatypes ((List!9786 0))(
  ( (Nil!9783) (Cons!9782 (h!10659 (_ BitVec 64)) (t!16014 List!9786)) )
))
(declare-fun arrayNoDuplicates!0 (array!32496 (_ BitVec 32) List!9786) Bool)

(assert (=> b!505808 (= res!306826 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9783))))

(declare-fun b!505809 () Bool)

(declare-fun res!306820 () Bool)

(assert (=> b!505809 (=> (not res!306820) (not e!296077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505809 (= res!306820 (validKeyInArray!0 (select (arr!15628 a!3235) j!176)))))

(declare-fun b!505810 () Bool)

(declare-fun res!306822 () Bool)

(assert (=> b!505810 (=> (not res!306822) (not e!296077))))

(assert (=> b!505810 (= res!306822 (validKeyInArray!0 k0!2280))))

(declare-fun b!505811 () Bool)

(declare-fun e!296076 () Bool)

(assert (=> b!505811 (= e!296078 (not e!296076))))

(declare-fun res!306830 () Bool)

(assert (=> b!505811 (=> res!306830 e!296076)))

(declare-fun lt!230632 () SeekEntryResult!4095)

(get-info :version)

(assert (=> b!505811 (= res!306830 (or (= lt!230638 lt!230632) (undefined!4907 lt!230638) (not ((_ is Intermediate!4095) lt!230638))))))

(declare-fun lt!230637 () (_ BitVec 32))

(assert (=> b!505811 (= lt!230632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230637 lt!230644 lt!230641 mask!3524))))

(assert (=> b!505811 (= lt!230638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230635 (select (arr!15628 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505811 (= lt!230637 (toIndex!0 lt!230644 mask!3524))))

(assert (=> b!505811 (= lt!230644 (select (store (arr!15628 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505811 (= lt!230635 (toIndex!0 (select (arr!15628 a!3235) j!176) mask!3524))))

(assert (=> b!505811 (= lt!230641 (array!32497 (store (arr!15628 a!3235) i!1204 k0!2280) (size!15992 a!3235)))))

(assert (=> b!505811 (= lt!230639 (Found!4095 j!176))))

(assert (=> b!505811 e!296073))

(declare-fun res!306819 () Bool)

(assert (=> b!505811 (=> (not res!306819) (not e!296073))))

(assert (=> b!505811 (= res!306819 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230640 () Unit!15456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15456)

(assert (=> b!505811 (= lt!230640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505812 () Bool)

(assert (=> b!505812 (= e!296076 e!296079)))

(declare-fun res!306823 () Bool)

(assert (=> b!505812 (=> res!306823 e!296079)))

(assert (=> b!505812 (= res!306823 (or (bvsgt (x!47576 lt!230638) #b01111111111111111111111111111110) (bvslt lt!230635 #b00000000000000000000000000000000) (bvsge lt!230635 (size!15992 a!3235)) (bvslt (index!18570 lt!230638) #b00000000000000000000000000000000) (bvsge (index!18570 lt!230638) (size!15992 a!3235)) (not (= lt!230638 (Intermediate!4095 false (index!18570 lt!230638) (x!47576 lt!230638))))))))

(assert (=> b!505812 (= (index!18570 lt!230638) i!1204)))

(declare-fun lt!230643 () Unit!15456)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15456)

(assert (=> b!505812 (= lt!230643 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230635 #b00000000000000000000000000000000 (index!18570 lt!230638) (x!47576 lt!230638) mask!3524))))

(assert (=> b!505812 (and (or (= (select (arr!15628 a!3235) (index!18570 lt!230638)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15628 a!3235) (index!18570 lt!230638)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15628 a!3235) (index!18570 lt!230638)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15628 a!3235) (index!18570 lt!230638)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230633 () Unit!15456)

(assert (=> b!505812 (= lt!230633 e!296075)))

(declare-fun c!59768 () Bool)

(assert (=> b!505812 (= c!59768 (= (select (arr!15628 a!3235) (index!18570 lt!230638)) (select (arr!15628 a!3235) j!176)))))

(assert (=> b!505812 (and (bvslt (x!47576 lt!230638) #b01111111111111111111111111111110) (or (= (select (arr!15628 a!3235) (index!18570 lt!230638)) (select (arr!15628 a!3235) j!176)) (= (select (arr!15628 a!3235) (index!18570 lt!230638)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15628 a!3235) (index!18570 lt!230638)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505813 () Bool)

(declare-fun res!306824 () Bool)

(assert (=> b!505813 (=> res!306824 e!296079)))

(assert (=> b!505813 (= res!306824 e!296071)))

(declare-fun res!306832 () Bool)

(assert (=> b!505813 (=> (not res!306832) (not e!296071))))

(assert (=> b!505813 (= res!306832 (bvsgt #b00000000000000000000000000000000 (x!47576 lt!230638)))))

(declare-fun b!505814 () Bool)

(declare-fun res!306828 () Bool)

(assert (=> b!505814 (=> res!306828 e!296079)))

(assert (=> b!505814 (= res!306828 (not (= lt!230632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230635 lt!230644 lt!230641 mask!3524))))))

(assert (= (and start!45740 res!306827) b!505801))

(assert (= (and b!505801 res!306821) b!505809))

(assert (= (and b!505809 res!306820) b!505810))

(assert (= (and b!505810 res!306822) b!505800))

(assert (= (and b!505800 res!306833) b!505806))

(assert (= (and b!505806 res!306831) b!505803))

(assert (= (and b!505803 res!306825) b!505808))

(assert (= (and b!505808 res!306826) b!505811))

(assert (= (and b!505811 res!306819) b!505798))

(assert (= (and b!505811 (not res!306830)) b!505812))

(assert (= (and b!505812 c!59768) b!505807))

(assert (= (and b!505812 (not c!59768)) b!505802))

(assert (= (and b!505807 res!306829) b!505804))

(assert (= (and b!505812 (not res!306823)) b!505813))

(assert (= (and b!505813 res!306832) b!505799))

(assert (= (and b!505813 (not res!306824)) b!505814))

(assert (= (and b!505814 (not res!306828)) b!505805))

(declare-fun m!486455 () Bool)

(assert (=> b!505812 m!486455))

(declare-fun m!486457 () Bool)

(assert (=> b!505812 m!486457))

(declare-fun m!486459 () Bool)

(assert (=> b!505812 m!486459))

(declare-fun m!486461 () Bool)

(assert (=> b!505810 m!486461))

(assert (=> b!505798 m!486459))

(assert (=> b!505798 m!486459))

(declare-fun m!486463 () Bool)

(assert (=> b!505798 m!486463))

(declare-fun m!486465 () Bool)

(assert (=> b!505800 m!486465))

(declare-fun m!486467 () Bool)

(assert (=> b!505803 m!486467))

(declare-fun m!486469 () Bool)

(assert (=> b!505811 m!486469))

(declare-fun m!486471 () Bool)

(assert (=> b!505811 m!486471))

(declare-fun m!486473 () Bool)

(assert (=> b!505811 m!486473))

(declare-fun m!486475 () Bool)

(assert (=> b!505811 m!486475))

(assert (=> b!505811 m!486459))

(declare-fun m!486477 () Bool)

(assert (=> b!505811 m!486477))

(assert (=> b!505811 m!486459))

(declare-fun m!486479 () Bool)

(assert (=> b!505811 m!486479))

(assert (=> b!505811 m!486459))

(declare-fun m!486481 () Bool)

(assert (=> b!505811 m!486481))

(declare-fun m!486483 () Bool)

(assert (=> b!505811 m!486483))

(declare-fun m!486485 () Bool)

(assert (=> b!505807 m!486485))

(declare-fun m!486487 () Bool)

(assert (=> b!505807 m!486487))

(declare-fun m!486489 () Bool)

(assert (=> start!45740 m!486489))

(declare-fun m!486491 () Bool)

(assert (=> start!45740 m!486491))

(assert (=> b!505799 m!486459))

(assert (=> b!505799 m!486459))

(declare-fun m!486493 () Bool)

(assert (=> b!505799 m!486493))

(assert (=> b!505814 m!486487))

(declare-fun m!486495 () Bool)

(assert (=> b!505805 m!486495))

(declare-fun m!486497 () Bool)

(assert (=> b!505805 m!486497))

(declare-fun m!486499 () Bool)

(assert (=> b!505806 m!486499))

(assert (=> b!505809 m!486459))

(assert (=> b!505809 m!486459))

(declare-fun m!486501 () Bool)

(assert (=> b!505809 m!486501))

(declare-fun m!486503 () Bool)

(assert (=> b!505808 m!486503))

(check-sat (not b!505805) (not b!505807) (not b!505814) (not b!505806) (not b!505800) (not b!505811) (not b!505799) (not start!45740) (not b!505798) (not b!505809) (not b!505812) (not b!505810) (not b!505803) (not b!505808))
(check-sat)
