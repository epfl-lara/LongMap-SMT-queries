; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48010 () Bool)

(assert start!48010)

(declare-datatypes ((array!33503 0))(
  ( (array!33504 (arr!16100 (Array (_ BitVec 32) (_ BitVec 64))) (size!16464 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33503)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!528619 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!308062 () Bool)

(declare-datatypes ((SeekEntryResult!4567 0))(
  ( (MissingZero!4567 (index!20492 (_ BitVec 32))) (Found!4567 (index!20493 (_ BitVec 32))) (Intermediate!4567 (undefined!5379 Bool) (index!20494 (_ BitVec 32)) (x!49463 (_ BitVec 32))) (Undefined!4567) (MissingVacant!4567 (index!20495 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33503 (_ BitVec 32)) SeekEntryResult!4567)

(assert (=> b!528619 (= e!308062 (= (seekEntryOrOpen!0 (select (arr!16100 a!3235) j!176) a!3235 mask!3524) (Found!4567 j!176)))))

(declare-fun b!528620 () Bool)

(declare-fun res!324584 () Bool)

(declare-fun e!308065 () Bool)

(assert (=> b!528620 (=> (not res!324584) (not e!308065))))

(declare-datatypes ((List!10258 0))(
  ( (Nil!10255) (Cons!10254 (h!11191 (_ BitVec 64)) (t!16486 List!10258)) )
))
(declare-fun arrayNoDuplicates!0 (array!33503 (_ BitVec 32) List!10258) Bool)

(assert (=> b!528620 (= res!324584 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10255))))

(declare-fun b!528621 () Bool)

(declare-fun e!308064 () Bool)

(assert (=> b!528621 (= e!308064 false)))

(declare-fun b!528622 () Bool)

(declare-fun res!324592 () Bool)

(declare-fun e!308059 () Bool)

(assert (=> b!528622 (=> (not res!324592) (not e!308059))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528622 (= res!324592 (validKeyInArray!0 k!2280))))

(declare-fun b!528623 () Bool)

(declare-fun e!308066 () Bool)

(declare-fun e!308060 () Bool)

(assert (=> b!528623 (= e!308066 e!308060)))

(declare-fun res!324596 () Bool)

(assert (=> b!528623 (=> res!324596 e!308060)))

(declare-fun lt!243492 () (_ BitVec 32))

(declare-fun lt!243489 () SeekEntryResult!4567)

(assert (=> b!528623 (= res!324596 (or (bvsgt (x!49463 lt!243489) #b01111111111111111111111111111110) (bvslt lt!243492 #b00000000000000000000000000000000) (bvsge lt!243492 (size!16464 a!3235)) (bvslt (index!20494 lt!243489) #b00000000000000000000000000000000) (bvsge (index!20494 lt!243489) (size!16464 a!3235)) (not (= lt!243489 (Intermediate!4567 false (index!20494 lt!243489) (x!49463 lt!243489))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528623 (= (index!20494 lt!243489) i!1204)))

(declare-datatypes ((Unit!16720 0))(
  ( (Unit!16721) )
))
(declare-fun lt!243485 () Unit!16720)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16720)

(assert (=> b!528623 (= lt!243485 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243492 #b00000000000000000000000000000000 (index!20494 lt!243489) (x!49463 lt!243489) mask!3524))))

(assert (=> b!528623 (and (or (= (select (arr!16100 a!3235) (index!20494 lt!243489)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16100 a!3235) (index!20494 lt!243489)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16100 a!3235) (index!20494 lt!243489)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16100 a!3235) (index!20494 lt!243489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243482 () Unit!16720)

(declare-fun e!308067 () Unit!16720)

(assert (=> b!528623 (= lt!243482 e!308067)))

(declare-fun c!62327 () Bool)

(assert (=> b!528623 (= c!62327 (= (select (arr!16100 a!3235) (index!20494 lt!243489)) (select (arr!16100 a!3235) j!176)))))

(assert (=> b!528623 (and (bvslt (x!49463 lt!243489) #b01111111111111111111111111111110) (or (= (select (arr!16100 a!3235) (index!20494 lt!243489)) (select (arr!16100 a!3235) j!176)) (= (select (arr!16100 a!3235) (index!20494 lt!243489)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16100 a!3235) (index!20494 lt!243489)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528624 () Bool)

(declare-fun Unit!16722 () Unit!16720)

(assert (=> b!528624 (= e!308067 Unit!16722)))

(declare-fun lt!243488 () Unit!16720)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16720)

(assert (=> b!528624 (= lt!243488 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243492 #b00000000000000000000000000000000 (index!20494 lt!243489) (x!49463 lt!243489) mask!3524))))

(declare-fun res!324589 () Bool)

(declare-fun lt!243484 () array!33503)

(declare-fun lt!243483 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33503 (_ BitVec 32)) SeekEntryResult!4567)

(assert (=> b!528624 (= res!324589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243492 lt!243483 lt!243484 mask!3524) (Intermediate!4567 false (index!20494 lt!243489) (x!49463 lt!243489))))))

(assert (=> b!528624 (=> (not res!324589) (not e!308064))))

(assert (=> b!528624 e!308064))

(declare-fun b!528626 () Bool)

(declare-fun res!324594 () Bool)

(assert (=> b!528626 (=> (not res!324594) (not e!308059))))

(assert (=> b!528626 (= res!324594 (validKeyInArray!0 (select (arr!16100 a!3235) j!176)))))

(declare-fun b!528627 () Bool)

(declare-fun res!324595 () Bool)

(assert (=> b!528627 (=> res!324595 e!308060)))

(declare-fun e!308061 () Bool)

(assert (=> b!528627 (= res!324595 e!308061)))

(declare-fun res!324588 () Bool)

(assert (=> b!528627 (=> (not res!324588) (not e!308061))))

(assert (=> b!528627 (= res!324588 (bvsgt #b00000000000000000000000000000000 (x!49463 lt!243489)))))

(declare-fun b!528628 () Bool)

(assert (=> b!528628 (= e!308065 (not e!308066))))

(declare-fun res!324582 () Bool)

(assert (=> b!528628 (=> res!324582 e!308066)))

(declare-fun lt!243490 () SeekEntryResult!4567)

(assert (=> b!528628 (= res!324582 (or (= lt!243489 lt!243490) (undefined!5379 lt!243489) (not (is-Intermediate!4567 lt!243489))))))

(declare-fun lt!243487 () (_ BitVec 32))

(assert (=> b!528628 (= lt!243490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243487 lt!243483 lt!243484 mask!3524))))

(assert (=> b!528628 (= lt!243489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243492 (select (arr!16100 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528628 (= lt!243487 (toIndex!0 lt!243483 mask!3524))))

(assert (=> b!528628 (= lt!243483 (select (store (arr!16100 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528628 (= lt!243492 (toIndex!0 (select (arr!16100 a!3235) j!176) mask!3524))))

(assert (=> b!528628 (= lt!243484 (array!33504 (store (arr!16100 a!3235) i!1204 k!2280) (size!16464 a!3235)))))

(declare-fun lt!243491 () SeekEntryResult!4567)

(assert (=> b!528628 (= lt!243491 (Found!4567 j!176))))

(assert (=> b!528628 e!308062))

(declare-fun res!324583 () Bool)

(assert (=> b!528628 (=> (not res!324583) (not e!308062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33503 (_ BitVec 32)) Bool)

(assert (=> b!528628 (= res!324583 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243493 () Unit!16720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16720)

(assert (=> b!528628 (= lt!243493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528629 () Bool)

(declare-fun Unit!16723 () Unit!16720)

(assert (=> b!528629 (= e!308067 Unit!16723)))

(declare-fun b!528630 () Bool)

(declare-fun res!324593 () Bool)

(assert (=> b!528630 (=> (not res!324593) (not e!308065))))

(assert (=> b!528630 (= res!324593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528631 () Bool)

(declare-fun res!324587 () Bool)

(assert (=> b!528631 (=> (not res!324587) (not e!308059))))

(declare-fun arrayContainsKey!0 (array!33503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528631 (= res!324587 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528632 () Bool)

(assert (=> b!528632 (= e!308060 true)))

(assert (=> b!528632 (= (seekEntryOrOpen!0 lt!243483 lt!243484 mask!3524) lt!243491)))

(declare-fun lt!243481 () Unit!16720)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16720)

(assert (=> b!528632 (= lt!243481 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243492 #b00000000000000000000000000000000 (index!20494 lt!243489) (x!49463 lt!243489) mask!3524))))

(declare-fun b!528633 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33503 (_ BitVec 32)) SeekEntryResult!4567)

(assert (=> b!528633 (= e!308061 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243492 (index!20494 lt!243489) (select (arr!16100 a!3235) j!176) a!3235 mask!3524) lt!243491)))))

(declare-fun b!528634 () Bool)

(assert (=> b!528634 (= e!308059 e!308065)))

(declare-fun res!324585 () Bool)

(assert (=> b!528634 (=> (not res!324585) (not e!308065))))

(declare-fun lt!243486 () SeekEntryResult!4567)

(assert (=> b!528634 (= res!324585 (or (= lt!243486 (MissingZero!4567 i!1204)) (= lt!243486 (MissingVacant!4567 i!1204))))))

(assert (=> b!528634 (= lt!243486 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528635 () Bool)

(declare-fun res!324586 () Bool)

(assert (=> b!528635 (=> (not res!324586) (not e!308059))))

(assert (=> b!528635 (= res!324586 (and (= (size!16464 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16464 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16464 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528625 () Bool)

(declare-fun res!324590 () Bool)

(assert (=> b!528625 (=> res!324590 e!308060)))

(assert (=> b!528625 (= res!324590 (not (= lt!243490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243492 lt!243483 lt!243484 mask!3524))))))

(declare-fun res!324591 () Bool)

(assert (=> start!48010 (=> (not res!324591) (not e!308059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48010 (= res!324591 (validMask!0 mask!3524))))

(assert (=> start!48010 e!308059))

(assert (=> start!48010 true))

(declare-fun array_inv!11896 (array!33503) Bool)

(assert (=> start!48010 (array_inv!11896 a!3235)))

(assert (= (and start!48010 res!324591) b!528635))

(assert (= (and b!528635 res!324586) b!528626))

(assert (= (and b!528626 res!324594) b!528622))

(assert (= (and b!528622 res!324592) b!528631))

(assert (= (and b!528631 res!324587) b!528634))

(assert (= (and b!528634 res!324585) b!528630))

(assert (= (and b!528630 res!324593) b!528620))

(assert (= (and b!528620 res!324584) b!528628))

(assert (= (and b!528628 res!324583) b!528619))

(assert (= (and b!528628 (not res!324582)) b!528623))

(assert (= (and b!528623 c!62327) b!528624))

(assert (= (and b!528623 (not c!62327)) b!528629))

(assert (= (and b!528624 res!324589) b!528621))

(assert (= (and b!528623 (not res!324596)) b!528627))

(assert (= (and b!528627 res!324588) b!528633))

(assert (= (and b!528627 (not res!324595)) b!528625))

(assert (= (and b!528625 (not res!324590)) b!528632))

(declare-fun m!509155 () Bool)

(assert (=> b!528634 m!509155))

(declare-fun m!509157 () Bool)

(assert (=> b!528625 m!509157))

(declare-fun m!509159 () Bool)

(assert (=> b!528630 m!509159))

(declare-fun m!509161 () Bool)

(assert (=> b!528624 m!509161))

(assert (=> b!528624 m!509157))

(declare-fun m!509163 () Bool)

(assert (=> b!528631 m!509163))

(declare-fun m!509165 () Bool)

(assert (=> b!528628 m!509165))

(declare-fun m!509167 () Bool)

(assert (=> b!528628 m!509167))

(declare-fun m!509169 () Bool)

(assert (=> b!528628 m!509169))

(declare-fun m!509171 () Bool)

(assert (=> b!528628 m!509171))

(assert (=> b!528628 m!509169))

(declare-fun m!509173 () Bool)

(assert (=> b!528628 m!509173))

(declare-fun m!509175 () Bool)

(assert (=> b!528628 m!509175))

(assert (=> b!528628 m!509169))

(declare-fun m!509177 () Bool)

(assert (=> b!528628 m!509177))

(declare-fun m!509179 () Bool)

(assert (=> b!528628 m!509179))

(declare-fun m!509181 () Bool)

(assert (=> b!528628 m!509181))

(declare-fun m!509183 () Bool)

(assert (=> b!528620 m!509183))

(declare-fun m!509185 () Bool)

(assert (=> start!48010 m!509185))

(declare-fun m!509187 () Bool)

(assert (=> start!48010 m!509187))

(declare-fun m!509189 () Bool)

(assert (=> b!528623 m!509189))

(declare-fun m!509191 () Bool)

(assert (=> b!528623 m!509191))

(assert (=> b!528623 m!509169))

(assert (=> b!528626 m!509169))

(assert (=> b!528626 m!509169))

(declare-fun m!509193 () Bool)

(assert (=> b!528626 m!509193))

(assert (=> b!528619 m!509169))

(assert (=> b!528619 m!509169))

(declare-fun m!509195 () Bool)

(assert (=> b!528619 m!509195))

(assert (=> b!528633 m!509169))

(assert (=> b!528633 m!509169))

(declare-fun m!509197 () Bool)

(assert (=> b!528633 m!509197))

(declare-fun m!509199 () Bool)

(assert (=> b!528632 m!509199))

(declare-fun m!509201 () Bool)

(assert (=> b!528632 m!509201))

(declare-fun m!509203 () Bool)

(assert (=> b!528622 m!509203))

(push 1)

