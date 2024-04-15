; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47700 () Bool)

(assert start!47700)

(declare-fun res!321497 () Bool)

(declare-fun e!305847 () Bool)

(assert (=> start!47700 (=> (not res!321497) (not e!305847))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47700 (= res!321497 (validMask!0 mask!3524))))

(assert (=> start!47700 e!305847))

(assert (=> start!47700 true))

(declare-datatypes ((array!33347 0))(
  ( (array!33348 (arr!16025 (Array (_ BitVec 32) (_ BitVec 64))) (size!16390 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33347)

(declare-fun array_inv!11908 (array!33347) Bool)

(assert (=> start!47700 (array_inv!11908 a!3235)))

(declare-fun b!524481 () Bool)

(declare-fun res!321495 () Bool)

(assert (=> b!524481 (=> (not res!321495) (not e!305847))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524481 (= res!321495 (validKeyInArray!0 (select (arr!16025 a!3235) j!176)))))

(declare-fun b!524482 () Bool)

(declare-datatypes ((Unit!16402 0))(
  ( (Unit!16403) )
))
(declare-fun e!305845 () Unit!16402)

(declare-fun Unit!16404 () Unit!16402)

(assert (=> b!524482 (= e!305845 Unit!16404)))

(declare-fun b!524483 () Bool)

(declare-fun res!321494 () Bool)

(declare-fun e!305844 () Bool)

(assert (=> b!524483 (=> res!321494 e!305844)))

(declare-datatypes ((SeekEntryResult!4489 0))(
  ( (MissingZero!4489 (index!20168 (_ BitVec 32))) (Found!4489 (index!20169 (_ BitVec 32))) (Intermediate!4489 (undefined!5301 Bool) (index!20170 (_ BitVec 32)) (x!49161 (_ BitVec 32))) (Undefined!4489) (MissingVacant!4489 (index!20171 (_ BitVec 32))) )
))
(declare-fun lt!240679 () SeekEntryResult!4489)

(get-info :version)

(assert (=> b!524483 (= res!321494 (or (undefined!5301 lt!240679) (not ((_ is Intermediate!4489) lt!240679))))))

(declare-fun b!524484 () Bool)

(declare-fun e!305843 () Bool)

(assert (=> b!524484 (= e!305843 (not e!305844))))

(declare-fun res!321493 () Bool)

(assert (=> b!524484 (=> res!321493 e!305844)))

(declare-fun lt!240671 () (_ BitVec 32))

(declare-fun lt!240670 () (_ BitVec 64))

(declare-fun lt!240675 () array!33347)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33347 (_ BitVec 32)) SeekEntryResult!4489)

(assert (=> b!524484 (= res!321493 (= lt!240679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240671 lt!240670 lt!240675 mask!3524)))))

(declare-fun lt!240673 () (_ BitVec 32))

(assert (=> b!524484 (= lt!240679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240673 (select (arr!16025 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524484 (= lt!240671 (toIndex!0 lt!240670 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524484 (= lt!240670 (select (store (arr!16025 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524484 (= lt!240673 (toIndex!0 (select (arr!16025 a!3235) j!176) mask!3524))))

(assert (=> b!524484 (= lt!240675 (array!33348 (store (arr!16025 a!3235) i!1204 k0!2280) (size!16390 a!3235)))))

(declare-fun e!305846 () Bool)

(assert (=> b!524484 e!305846))

(declare-fun res!321487 () Bool)

(assert (=> b!524484 (=> (not res!321487) (not e!305846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33347 (_ BitVec 32)) Bool)

(assert (=> b!524484 (= res!321487 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240678 () Unit!16402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16402)

(assert (=> b!524484 (= lt!240678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524485 () Bool)

(declare-fun res!321492 () Bool)

(assert (=> b!524485 (=> (not res!321492) (not e!305847))))

(declare-fun arrayContainsKey!0 (array!33347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524485 (= res!321492 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524486 () Bool)

(declare-fun e!305841 () Bool)

(assert (=> b!524486 (= e!305841 false)))

(declare-fun b!524487 () Bool)

(declare-fun res!321490 () Bool)

(assert (=> b!524487 (=> (not res!321490) (not e!305843))))

(assert (=> b!524487 (= res!321490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524488 () Bool)

(declare-fun res!321491 () Bool)

(assert (=> b!524488 (=> (not res!321491) (not e!305847))))

(assert (=> b!524488 (= res!321491 (and (= (size!16390 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16390 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16390 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524489 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33347 (_ BitVec 32)) SeekEntryResult!4489)

(assert (=> b!524489 (= e!305846 (= (seekEntryOrOpen!0 (select (arr!16025 a!3235) j!176) a!3235 mask!3524) (Found!4489 j!176)))))

(declare-fun b!524490 () Bool)

(declare-fun res!321496 () Bool)

(assert (=> b!524490 (=> (not res!321496) (not e!305847))))

(assert (=> b!524490 (= res!321496 (validKeyInArray!0 k0!2280))))

(declare-fun b!524491 () Bool)

(assert (=> b!524491 (= e!305847 e!305843)))

(declare-fun res!321489 () Bool)

(assert (=> b!524491 (=> (not res!321489) (not e!305843))))

(declare-fun lt!240677 () SeekEntryResult!4489)

(assert (=> b!524491 (= res!321489 (or (= lt!240677 (MissingZero!4489 i!1204)) (= lt!240677 (MissingVacant!4489 i!1204))))))

(assert (=> b!524491 (= lt!240677 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524492 () Bool)

(assert (=> b!524492 (= e!305844 true)))

(assert (=> b!524492 (= (index!20170 lt!240679) i!1204)))

(declare-fun lt!240676 () Unit!16402)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16402)

(assert (=> b!524492 (= lt!240676 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!240673 #b00000000000000000000000000000000 (index!20170 lt!240679) (x!49161 lt!240679) mask!3524))))

(assert (=> b!524492 (and (or (= (select (arr!16025 a!3235) (index!20170 lt!240679)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16025 a!3235) (index!20170 lt!240679)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16025 a!3235) (index!20170 lt!240679)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16025 a!3235) (index!20170 lt!240679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240672 () Unit!16402)

(assert (=> b!524492 (= lt!240672 e!305845)))

(declare-fun c!61803 () Bool)

(assert (=> b!524492 (= c!61803 (= (select (arr!16025 a!3235) (index!20170 lt!240679)) (select (arr!16025 a!3235) j!176)))))

(assert (=> b!524492 (and (bvslt (x!49161 lt!240679) #b01111111111111111111111111111110) (or (= (select (arr!16025 a!3235) (index!20170 lt!240679)) (select (arr!16025 a!3235) j!176)) (= (select (arr!16025 a!3235) (index!20170 lt!240679)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16025 a!3235) (index!20170 lt!240679)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524493 () Bool)

(declare-fun res!321488 () Bool)

(assert (=> b!524493 (=> (not res!321488) (not e!305843))))

(declare-datatypes ((List!10222 0))(
  ( (Nil!10219) (Cons!10218 (h!11149 (_ BitVec 64)) (t!16441 List!10222)) )
))
(declare-fun arrayNoDuplicates!0 (array!33347 (_ BitVec 32) List!10222) Bool)

(assert (=> b!524493 (= res!321488 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10219))))

(declare-fun b!524494 () Bool)

(declare-fun Unit!16405 () Unit!16402)

(assert (=> b!524494 (= e!305845 Unit!16405)))

(declare-fun lt!240674 () Unit!16402)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16402)

(assert (=> b!524494 (= lt!240674 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240673 #b00000000000000000000000000000000 (index!20170 lt!240679) (x!49161 lt!240679) mask!3524))))

(declare-fun res!321486 () Bool)

(assert (=> b!524494 (= res!321486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240673 lt!240670 lt!240675 mask!3524) (Intermediate!4489 false (index!20170 lt!240679) (x!49161 lt!240679))))))

(assert (=> b!524494 (=> (not res!321486) (not e!305841))))

(assert (=> b!524494 e!305841))

(assert (= (and start!47700 res!321497) b!524488))

(assert (= (and b!524488 res!321491) b!524481))

(assert (= (and b!524481 res!321495) b!524490))

(assert (= (and b!524490 res!321496) b!524485))

(assert (= (and b!524485 res!321492) b!524491))

(assert (= (and b!524491 res!321489) b!524487))

(assert (= (and b!524487 res!321490) b!524493))

(assert (= (and b!524493 res!321488) b!524484))

(assert (= (and b!524484 res!321487) b!524489))

(assert (= (and b!524484 (not res!321493)) b!524483))

(assert (= (and b!524483 (not res!321494)) b!524492))

(assert (= (and b!524492 c!61803) b!524494))

(assert (= (and b!524492 (not c!61803)) b!524482))

(assert (= (and b!524494 res!321486) b!524486))

(declare-fun m!504625 () Bool)

(assert (=> b!524481 m!504625))

(assert (=> b!524481 m!504625))

(declare-fun m!504627 () Bool)

(assert (=> b!524481 m!504627))

(declare-fun m!504629 () Bool)

(assert (=> start!47700 m!504629))

(declare-fun m!504631 () Bool)

(assert (=> start!47700 m!504631))

(declare-fun m!504633 () Bool)

(assert (=> b!524493 m!504633))

(assert (=> b!524489 m!504625))

(assert (=> b!524489 m!504625))

(declare-fun m!504635 () Bool)

(assert (=> b!524489 m!504635))

(declare-fun m!504637 () Bool)

(assert (=> b!524485 m!504637))

(declare-fun m!504639 () Bool)

(assert (=> b!524491 m!504639))

(declare-fun m!504641 () Bool)

(assert (=> b!524490 m!504641))

(declare-fun m!504643 () Bool)

(assert (=> b!524484 m!504643))

(declare-fun m!504645 () Bool)

(assert (=> b!524484 m!504645))

(declare-fun m!504647 () Bool)

(assert (=> b!524484 m!504647))

(declare-fun m!504649 () Bool)

(assert (=> b!524484 m!504649))

(assert (=> b!524484 m!504625))

(declare-fun m!504651 () Bool)

(assert (=> b!524484 m!504651))

(assert (=> b!524484 m!504625))

(declare-fun m!504653 () Bool)

(assert (=> b!524484 m!504653))

(assert (=> b!524484 m!504625))

(declare-fun m!504655 () Bool)

(assert (=> b!524484 m!504655))

(declare-fun m!504657 () Bool)

(assert (=> b!524484 m!504657))

(declare-fun m!504659 () Bool)

(assert (=> b!524492 m!504659))

(declare-fun m!504661 () Bool)

(assert (=> b!524492 m!504661))

(assert (=> b!524492 m!504625))

(declare-fun m!504663 () Bool)

(assert (=> b!524487 m!504663))

(declare-fun m!504665 () Bool)

(assert (=> b!524494 m!504665))

(declare-fun m!504667 () Bool)

(assert (=> b!524494 m!504667))

(check-sat (not b!524484) (not b!524490) (not b!524491) (not start!47700) (not b!524489) (not b!524485) (not b!524487) (not b!524493) (not b!524494) (not b!524492) (not b!524481))
(check-sat)
