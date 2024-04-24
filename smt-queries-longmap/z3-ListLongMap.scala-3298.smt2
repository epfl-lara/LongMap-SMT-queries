; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45722 () Bool)

(assert start!45722)

(declare-fun b!505533 () Bool)

(declare-fun e!295924 () Bool)

(declare-fun e!295931 () Bool)

(assert (=> b!505533 (= e!295924 (not e!295931))))

(declare-fun res!306646 () Bool)

(assert (=> b!505533 (=> res!306646 e!295931)))

(declare-datatypes ((SeekEntryResult!4042 0))(
  ( (MissingZero!4042 (index!18356 (_ BitVec 32))) (Found!4042 (index!18357 (_ BitVec 32))) (Intermediate!4042 (undefined!4854 Bool) (index!18358 (_ BitVec 32)) (x!47512 (_ BitVec 32))) (Undefined!4042) (MissingVacant!4042 (index!18359 (_ BitVec 32))) )
))
(declare-fun lt!230499 () SeekEntryResult!4042)

(declare-fun lt!230495 () SeekEntryResult!4042)

(get-info :version)

(assert (=> b!505533 (= res!306646 (or (= lt!230499 lt!230495) (undefined!4854 lt!230499) (not ((_ is Intermediate!4042) lt!230499))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230497 () (_ BitVec 64))

(declare-fun lt!230498 () (_ BitVec 32))

(declare-datatypes ((array!32479 0))(
  ( (array!32480 (arr!15619 (Array (_ BitVec 32) (_ BitVec 64))) (size!15983 (_ BitVec 32))) )
))
(declare-fun lt!230496 () array!32479)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32479 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!505533 (= lt!230495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230498 lt!230497 lt!230496 mask!3524))))

(declare-fun a!3235 () array!32479)

(declare-fun lt!230494 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505533 (= lt!230499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230494 (select (arr!15619 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505533 (= lt!230498 (toIndex!0 lt!230497 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505533 (= lt!230497 (select (store (arr!15619 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505533 (= lt!230494 (toIndex!0 (select (arr!15619 a!3235) j!176) mask!3524))))

(assert (=> b!505533 (= lt!230496 (array!32480 (store (arr!15619 a!3235) i!1204 k0!2280) (size!15983 a!3235)))))

(declare-fun lt!230500 () SeekEntryResult!4042)

(assert (=> b!505533 (= lt!230500 (Found!4042 j!176))))

(declare-fun e!295932 () Bool)

(assert (=> b!505533 e!295932))

(declare-fun res!306645 () Bool)

(assert (=> b!505533 (=> (not res!306645) (not e!295932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32479 (_ BitVec 32)) Bool)

(assert (=> b!505533 (= res!306645 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15403 0))(
  ( (Unit!15404) )
))
(declare-fun lt!230490 () Unit!15403)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15403)

(assert (=> b!505533 (= lt!230490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505534 () Bool)

(declare-fun e!295925 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32479 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!505534 (= e!295925 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230494 (index!18358 lt!230499) (select (arr!15619 a!3235) j!176) a!3235 mask!3524) lt!230500)))))

(declare-fun b!505535 () Bool)

(declare-fun res!306636 () Bool)

(assert (=> b!505535 (=> (not res!306636) (not e!295924))))

(assert (=> b!505535 (= res!306636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505537 () Bool)

(declare-fun e!295926 () Bool)

(assert (=> b!505537 (= e!295931 e!295926)))

(declare-fun res!306642 () Bool)

(assert (=> b!505537 (=> res!306642 e!295926)))

(assert (=> b!505537 (= res!306642 (or (bvsgt (x!47512 lt!230499) #b01111111111111111111111111111110) (bvslt lt!230494 #b00000000000000000000000000000000) (bvsge lt!230494 (size!15983 a!3235)) (bvslt (index!18358 lt!230499) #b00000000000000000000000000000000) (bvsge (index!18358 lt!230499) (size!15983 a!3235)) (not (= lt!230499 (Intermediate!4042 false (index!18358 lt!230499) (x!47512 lt!230499))))))))

(assert (=> b!505537 (= (index!18358 lt!230499) i!1204)))

(declare-fun lt!230492 () Unit!15403)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15403)

(assert (=> b!505537 (= lt!230492 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230494 #b00000000000000000000000000000000 (index!18358 lt!230499) (x!47512 lt!230499) mask!3524))))

(assert (=> b!505537 (and (or (= (select (arr!15619 a!3235) (index!18358 lt!230499)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15619 a!3235) (index!18358 lt!230499)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15619 a!3235) (index!18358 lt!230499)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15619 a!3235) (index!18358 lt!230499)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230491 () Unit!15403)

(declare-fun e!295929 () Unit!15403)

(assert (=> b!505537 (= lt!230491 e!295929)))

(declare-fun c!59729 () Bool)

(assert (=> b!505537 (= c!59729 (= (select (arr!15619 a!3235) (index!18358 lt!230499)) (select (arr!15619 a!3235) j!176)))))

(assert (=> b!505537 (and (bvslt (x!47512 lt!230499) #b01111111111111111111111111111110) (or (= (select (arr!15619 a!3235) (index!18358 lt!230499)) (select (arr!15619 a!3235) j!176)) (= (select (arr!15619 a!3235) (index!18358 lt!230499)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15619 a!3235) (index!18358 lt!230499)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505538 () Bool)

(declare-fun e!295928 () Bool)

(assert (=> b!505538 (= e!295928 e!295924)))

(declare-fun res!306637 () Bool)

(assert (=> b!505538 (=> (not res!306637) (not e!295924))))

(declare-fun lt!230493 () SeekEntryResult!4042)

(assert (=> b!505538 (= res!306637 (or (= lt!230493 (MissingZero!4042 i!1204)) (= lt!230493 (MissingVacant!4042 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32479 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!505538 (= lt!230493 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505539 () Bool)

(assert (=> b!505539 (= e!295926 true)))

(assert (=> b!505539 (= (seekEntryOrOpen!0 lt!230497 lt!230496 mask!3524) lt!230500)))

(declare-fun lt!230489 () Unit!15403)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15403)

(assert (=> b!505539 (= lt!230489 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230494 #b00000000000000000000000000000000 (index!18358 lt!230499) (x!47512 lt!230499) mask!3524))))

(declare-fun b!505540 () Bool)

(declare-fun e!295927 () Bool)

(assert (=> b!505540 (= e!295927 false)))

(declare-fun b!505541 () Bool)

(assert (=> b!505541 (= e!295932 (= (seekEntryOrOpen!0 (select (arr!15619 a!3235) j!176) a!3235 mask!3524) (Found!4042 j!176)))))

(declare-fun b!505542 () Bool)

(declare-fun Unit!15405 () Unit!15403)

(assert (=> b!505542 (= e!295929 Unit!15405)))

(declare-fun lt!230488 () Unit!15403)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15403)

(assert (=> b!505542 (= lt!230488 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230494 #b00000000000000000000000000000000 (index!18358 lt!230499) (x!47512 lt!230499) mask!3524))))

(declare-fun res!306632 () Bool)

(assert (=> b!505542 (= res!306632 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230494 lt!230497 lt!230496 mask!3524) (Intermediate!4042 false (index!18358 lt!230499) (x!47512 lt!230499))))))

(assert (=> b!505542 (=> (not res!306632) (not e!295927))))

(assert (=> b!505542 e!295927))

(declare-fun b!505543 () Bool)

(declare-fun res!306634 () Bool)

(assert (=> b!505543 (=> (not res!306634) (not e!295928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505543 (= res!306634 (validKeyInArray!0 (select (arr!15619 a!3235) j!176)))))

(declare-fun b!505544 () Bool)

(declare-fun res!306641 () Bool)

(assert (=> b!505544 (=> res!306641 e!295926)))

(assert (=> b!505544 (= res!306641 (not (= lt!230495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230494 lt!230497 lt!230496 mask!3524))))))

(declare-fun b!505545 () Bool)

(declare-fun Unit!15406 () Unit!15403)

(assert (=> b!505545 (= e!295929 Unit!15406)))

(declare-fun b!505546 () Bool)

(declare-fun res!306639 () Bool)

(assert (=> b!505546 (=> (not res!306639) (not e!295928))))

(assert (=> b!505546 (= res!306639 (and (= (size!15983 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15983 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15983 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505547 () Bool)

(declare-fun res!306633 () Bool)

(assert (=> b!505547 (=> res!306633 e!295926)))

(assert (=> b!505547 (= res!306633 e!295925)))

(declare-fun res!306644 () Bool)

(assert (=> b!505547 (=> (not res!306644) (not e!295925))))

(assert (=> b!505547 (= res!306644 (bvsgt #b00000000000000000000000000000000 (x!47512 lt!230499)))))

(declare-fun res!306643 () Bool)

(assert (=> start!45722 (=> (not res!306643) (not e!295928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45722 (= res!306643 (validMask!0 mask!3524))))

(assert (=> start!45722 e!295928))

(assert (=> start!45722 true))

(declare-fun array_inv!11478 (array!32479) Bool)

(assert (=> start!45722 (array_inv!11478 a!3235)))

(declare-fun b!505536 () Bool)

(declare-fun res!306640 () Bool)

(assert (=> b!505536 (=> (not res!306640) (not e!295924))))

(declare-datatypes ((List!9684 0))(
  ( (Nil!9681) (Cons!9680 (h!10557 (_ BitVec 64)) (t!15904 List!9684)) )
))
(declare-fun arrayNoDuplicates!0 (array!32479 (_ BitVec 32) List!9684) Bool)

(assert (=> b!505536 (= res!306640 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9681))))

(declare-fun b!505548 () Bool)

(declare-fun res!306638 () Bool)

(assert (=> b!505548 (=> (not res!306638) (not e!295928))))

(assert (=> b!505548 (= res!306638 (validKeyInArray!0 k0!2280))))

(declare-fun b!505549 () Bool)

(declare-fun res!306635 () Bool)

(assert (=> b!505549 (=> (not res!306635) (not e!295928))))

(declare-fun arrayContainsKey!0 (array!32479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505549 (= res!306635 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45722 res!306643) b!505546))

(assert (= (and b!505546 res!306639) b!505543))

(assert (= (and b!505543 res!306634) b!505548))

(assert (= (and b!505548 res!306638) b!505549))

(assert (= (and b!505549 res!306635) b!505538))

(assert (= (and b!505538 res!306637) b!505535))

(assert (= (and b!505535 res!306636) b!505536))

(assert (= (and b!505536 res!306640) b!505533))

(assert (= (and b!505533 res!306645) b!505541))

(assert (= (and b!505533 (not res!306646)) b!505537))

(assert (= (and b!505537 c!59729) b!505542))

(assert (= (and b!505537 (not c!59729)) b!505545))

(assert (= (and b!505542 res!306632) b!505540))

(assert (= (and b!505537 (not res!306642)) b!505547))

(assert (= (and b!505547 res!306644) b!505534))

(assert (= (and b!505547 (not res!306633)) b!505544))

(assert (= (and b!505544 (not res!306641)) b!505539))

(declare-fun m!486439 () Bool)

(assert (=> b!505534 m!486439))

(assert (=> b!505534 m!486439))

(declare-fun m!486441 () Bool)

(assert (=> b!505534 m!486441))

(assert (=> b!505541 m!486439))

(assert (=> b!505541 m!486439))

(declare-fun m!486443 () Bool)

(assert (=> b!505541 m!486443))

(declare-fun m!486445 () Bool)

(assert (=> start!45722 m!486445))

(declare-fun m!486447 () Bool)

(assert (=> start!45722 m!486447))

(declare-fun m!486449 () Bool)

(assert (=> b!505536 m!486449))

(declare-fun m!486451 () Bool)

(assert (=> b!505548 m!486451))

(declare-fun m!486453 () Bool)

(assert (=> b!505538 m!486453))

(declare-fun m!486455 () Bool)

(assert (=> b!505539 m!486455))

(declare-fun m!486457 () Bool)

(assert (=> b!505539 m!486457))

(declare-fun m!486459 () Bool)

(assert (=> b!505537 m!486459))

(declare-fun m!486461 () Bool)

(assert (=> b!505537 m!486461))

(assert (=> b!505537 m!486439))

(declare-fun m!486463 () Bool)

(assert (=> b!505549 m!486463))

(declare-fun m!486465 () Bool)

(assert (=> b!505542 m!486465))

(declare-fun m!486467 () Bool)

(assert (=> b!505542 m!486467))

(declare-fun m!486469 () Bool)

(assert (=> b!505535 m!486469))

(assert (=> b!505543 m!486439))

(assert (=> b!505543 m!486439))

(declare-fun m!486471 () Bool)

(assert (=> b!505543 m!486471))

(assert (=> b!505544 m!486467))

(declare-fun m!486473 () Bool)

(assert (=> b!505533 m!486473))

(declare-fun m!486475 () Bool)

(assert (=> b!505533 m!486475))

(declare-fun m!486477 () Bool)

(assert (=> b!505533 m!486477))

(declare-fun m!486479 () Bool)

(assert (=> b!505533 m!486479))

(assert (=> b!505533 m!486439))

(declare-fun m!486481 () Bool)

(assert (=> b!505533 m!486481))

(assert (=> b!505533 m!486439))

(declare-fun m!486483 () Bool)

(assert (=> b!505533 m!486483))

(declare-fun m!486485 () Bool)

(assert (=> b!505533 m!486485))

(assert (=> b!505533 m!486439))

(declare-fun m!486487 () Bool)

(assert (=> b!505533 m!486487))

(check-sat (not b!505542) (not b!505538) (not b!505549) (not b!505539) (not b!505537) (not b!505548) (not b!505544) (not b!505543) (not b!505535) (not b!505541) (not b!505533) (not start!45722) (not b!505534) (not b!505536))
(check-sat)
