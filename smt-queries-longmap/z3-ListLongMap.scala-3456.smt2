; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48008 () Bool)

(assert start!48008)

(declare-fun b!528568 () Bool)

(declare-datatypes ((Unit!16716 0))(
  ( (Unit!16717) )
))
(declare-fun e!308035 () Unit!16716)

(declare-fun Unit!16718 () Unit!16716)

(assert (=> b!528568 (= e!308035 Unit!16718)))

(declare-fun b!528569 () Bool)

(declare-fun e!308037 () Bool)

(assert (=> b!528569 (= e!308037 false)))

(declare-fun e!308039 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33501 0))(
  ( (array!33502 (arr!16099 (Array (_ BitVec 32) (_ BitVec 64))) (size!16463 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33501)

(declare-fun b!528570 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4566 0))(
  ( (MissingZero!4566 (index!20488 (_ BitVec 32))) (Found!4566 (index!20489 (_ BitVec 32))) (Intermediate!4566 (undefined!5378 Bool) (index!20490 (_ BitVec 32)) (x!49462 (_ BitVec 32))) (Undefined!4566) (MissingVacant!4566 (index!20491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33501 (_ BitVec 32)) SeekEntryResult!4566)

(assert (=> b!528570 (= e!308039 (= (seekEntryOrOpen!0 (select (arr!16099 a!3235) j!176) a!3235 mask!3524) (Found!4566 j!176)))))

(declare-fun b!528571 () Bool)

(declare-fun res!324550 () Bool)

(declare-fun e!308036 () Bool)

(assert (=> b!528571 (=> res!324550 e!308036)))

(declare-fun e!308038 () Bool)

(assert (=> b!528571 (= res!324550 e!308038)))

(declare-fun res!324543 () Bool)

(assert (=> b!528571 (=> (not res!324543) (not e!308038))))

(declare-fun lt!243449 () SeekEntryResult!4566)

(assert (=> b!528571 (= res!324543 (bvsgt #b00000000000000000000000000000000 (x!49462 lt!243449)))))

(declare-fun lt!243450 () (_ BitVec 32))

(declare-fun b!528572 () Bool)

(declare-fun lt!243442 () SeekEntryResult!4566)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33501 (_ BitVec 32)) SeekEntryResult!4566)

(assert (=> b!528572 (= e!308038 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243450 (index!20490 lt!243449) (select (arr!16099 a!3235) j!176) a!3235 mask!3524) lt!243442)))))

(declare-fun b!528573 () Bool)

(declare-fun res!324539 () Bool)

(declare-fun e!308033 () Bool)

(assert (=> b!528573 (=> (not res!324539) (not e!308033))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528573 (= res!324539 (validKeyInArray!0 k0!2280))))

(declare-fun b!528574 () Bool)

(declare-fun res!324549 () Bool)

(declare-fun e!308040 () Bool)

(assert (=> b!528574 (=> (not res!324549) (not e!308040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33501 (_ BitVec 32)) Bool)

(assert (=> b!528574 (= res!324549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528576 () Bool)

(declare-fun res!324551 () Bool)

(assert (=> b!528576 (=> (not res!324551) (not e!308033))))

(declare-fun arrayContainsKey!0 (array!33501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528576 (= res!324551 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528577 () Bool)

(declare-fun res!324541 () Bool)

(assert (=> b!528577 (=> (not res!324541) (not e!308040))))

(declare-datatypes ((List!10257 0))(
  ( (Nil!10254) (Cons!10253 (h!11190 (_ BitVec 64)) (t!16485 List!10257)) )
))
(declare-fun arrayNoDuplicates!0 (array!33501 (_ BitVec 32) List!10257) Bool)

(assert (=> b!528577 (= res!324541 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10254))))

(declare-fun b!528578 () Bool)

(declare-fun e!308032 () Bool)

(assert (=> b!528578 (= e!308040 (not e!308032))))

(declare-fun res!324542 () Bool)

(assert (=> b!528578 (=> res!324542 e!308032)))

(declare-fun lt!243448 () SeekEntryResult!4566)

(get-info :version)

(assert (=> b!528578 (= res!324542 (or (= lt!243449 lt!243448) (undefined!5378 lt!243449) (not ((_ is Intermediate!4566) lt!243449))))))

(declare-fun lt!243453 () (_ BitVec 32))

(declare-fun lt!243445 () (_ BitVec 64))

(declare-fun lt!243446 () array!33501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33501 (_ BitVec 32)) SeekEntryResult!4566)

(assert (=> b!528578 (= lt!243448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243453 lt!243445 lt!243446 mask!3524))))

(assert (=> b!528578 (= lt!243449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243450 (select (arr!16099 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528578 (= lt!243453 (toIndex!0 lt!243445 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528578 (= lt!243445 (select (store (arr!16099 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528578 (= lt!243450 (toIndex!0 (select (arr!16099 a!3235) j!176) mask!3524))))

(assert (=> b!528578 (= lt!243446 (array!33502 (store (arr!16099 a!3235) i!1204 k0!2280) (size!16463 a!3235)))))

(assert (=> b!528578 (= lt!243442 (Found!4566 j!176))))

(assert (=> b!528578 e!308039))

(declare-fun res!324538 () Bool)

(assert (=> b!528578 (=> (not res!324538) (not e!308039))))

(assert (=> b!528578 (= res!324538 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243443 () Unit!16716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16716)

(assert (=> b!528578 (= lt!243443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528579 () Bool)

(declare-fun res!324547 () Bool)

(assert (=> b!528579 (=> (not res!324547) (not e!308033))))

(assert (=> b!528579 (= res!324547 (validKeyInArray!0 (select (arr!16099 a!3235) j!176)))))

(declare-fun b!528580 () Bool)

(declare-fun res!324545 () Bool)

(assert (=> b!528580 (=> (not res!324545) (not e!308033))))

(assert (=> b!528580 (= res!324545 (and (= (size!16463 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16463 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16463 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!324537 () Bool)

(assert (=> start!48008 (=> (not res!324537) (not e!308033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48008 (= res!324537 (validMask!0 mask!3524))))

(assert (=> start!48008 e!308033))

(assert (=> start!48008 true))

(declare-fun array_inv!11895 (array!33501) Bool)

(assert (=> start!48008 (array_inv!11895 a!3235)))

(declare-fun b!528575 () Bool)

(declare-fun res!324546 () Bool)

(assert (=> b!528575 (=> res!324546 e!308036)))

(assert (=> b!528575 (= res!324546 (not (= lt!243448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243450 lt!243445 lt!243446 mask!3524))))))

(declare-fun b!528581 () Bool)

(assert (=> b!528581 (= e!308033 e!308040)))

(declare-fun res!324540 () Bool)

(assert (=> b!528581 (=> (not res!324540) (not e!308040))))

(declare-fun lt!243451 () SeekEntryResult!4566)

(assert (=> b!528581 (= res!324540 (or (= lt!243451 (MissingZero!4566 i!1204)) (= lt!243451 (MissingVacant!4566 i!1204))))))

(assert (=> b!528581 (= lt!243451 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528582 () Bool)

(declare-fun Unit!16719 () Unit!16716)

(assert (=> b!528582 (= e!308035 Unit!16719)))

(declare-fun lt!243444 () Unit!16716)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16716)

(assert (=> b!528582 (= lt!243444 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243450 #b00000000000000000000000000000000 (index!20490 lt!243449) (x!49462 lt!243449) mask!3524))))

(declare-fun res!324548 () Bool)

(assert (=> b!528582 (= res!324548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243450 lt!243445 lt!243446 mask!3524) (Intermediate!4566 false (index!20490 lt!243449) (x!49462 lt!243449))))))

(assert (=> b!528582 (=> (not res!324548) (not e!308037))))

(assert (=> b!528582 e!308037))

(declare-fun b!528583 () Bool)

(assert (=> b!528583 (= e!308032 e!308036)))

(declare-fun res!324544 () Bool)

(assert (=> b!528583 (=> res!324544 e!308036)))

(assert (=> b!528583 (= res!324544 (or (bvsgt (x!49462 lt!243449) #b01111111111111111111111111111110) (bvslt lt!243450 #b00000000000000000000000000000000) (bvsge lt!243450 (size!16463 a!3235)) (bvslt (index!20490 lt!243449) #b00000000000000000000000000000000) (bvsge (index!20490 lt!243449) (size!16463 a!3235)) (not (= lt!243449 (Intermediate!4566 false (index!20490 lt!243449) (x!49462 lt!243449))))))))

(assert (=> b!528583 (= (index!20490 lt!243449) i!1204)))

(declare-fun lt!243454 () Unit!16716)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16716)

(assert (=> b!528583 (= lt!243454 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243450 #b00000000000000000000000000000000 (index!20490 lt!243449) (x!49462 lt!243449) mask!3524))))

(assert (=> b!528583 (and (or (= (select (arr!16099 a!3235) (index!20490 lt!243449)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16099 a!3235) (index!20490 lt!243449)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16099 a!3235) (index!20490 lt!243449)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16099 a!3235) (index!20490 lt!243449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243447 () Unit!16716)

(assert (=> b!528583 (= lt!243447 e!308035)))

(declare-fun c!62324 () Bool)

(assert (=> b!528583 (= c!62324 (= (select (arr!16099 a!3235) (index!20490 lt!243449)) (select (arr!16099 a!3235) j!176)))))

(assert (=> b!528583 (and (bvslt (x!49462 lt!243449) #b01111111111111111111111111111110) (or (= (select (arr!16099 a!3235) (index!20490 lt!243449)) (select (arr!16099 a!3235) j!176)) (= (select (arr!16099 a!3235) (index!20490 lt!243449)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16099 a!3235) (index!20490 lt!243449)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528584 () Bool)

(assert (=> b!528584 (= e!308036 true)))

(assert (=> b!528584 (= (seekEntryOrOpen!0 lt!243445 lt!243446 mask!3524) lt!243442)))

(declare-fun lt!243452 () Unit!16716)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16716)

(assert (=> b!528584 (= lt!243452 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243450 #b00000000000000000000000000000000 (index!20490 lt!243449) (x!49462 lt!243449) mask!3524))))

(assert (= (and start!48008 res!324537) b!528580))

(assert (= (and b!528580 res!324545) b!528579))

(assert (= (and b!528579 res!324547) b!528573))

(assert (= (and b!528573 res!324539) b!528576))

(assert (= (and b!528576 res!324551) b!528581))

(assert (= (and b!528581 res!324540) b!528574))

(assert (= (and b!528574 res!324549) b!528577))

(assert (= (and b!528577 res!324541) b!528578))

(assert (= (and b!528578 res!324538) b!528570))

(assert (= (and b!528578 (not res!324542)) b!528583))

(assert (= (and b!528583 c!62324) b!528582))

(assert (= (and b!528583 (not c!62324)) b!528568))

(assert (= (and b!528582 res!324548) b!528569))

(assert (= (and b!528583 (not res!324544)) b!528571))

(assert (= (and b!528571 res!324543) b!528572))

(assert (= (and b!528571 (not res!324550)) b!528575))

(assert (= (and b!528575 (not res!324546)) b!528584))

(declare-fun m!509105 () Bool)

(assert (=> b!528577 m!509105))

(declare-fun m!509107 () Bool)

(assert (=> b!528576 m!509107))

(declare-fun m!509109 () Bool)

(assert (=> b!528572 m!509109))

(assert (=> b!528572 m!509109))

(declare-fun m!509111 () Bool)

(assert (=> b!528572 m!509111))

(declare-fun m!509113 () Bool)

(assert (=> b!528578 m!509113))

(assert (=> b!528578 m!509109))

(declare-fun m!509115 () Bool)

(assert (=> b!528578 m!509115))

(declare-fun m!509117 () Bool)

(assert (=> b!528578 m!509117))

(assert (=> b!528578 m!509109))

(declare-fun m!509119 () Bool)

(assert (=> b!528578 m!509119))

(assert (=> b!528578 m!509109))

(declare-fun m!509121 () Bool)

(assert (=> b!528578 m!509121))

(declare-fun m!509123 () Bool)

(assert (=> b!528578 m!509123))

(declare-fun m!509125 () Bool)

(assert (=> b!528578 m!509125))

(declare-fun m!509127 () Bool)

(assert (=> b!528578 m!509127))

(declare-fun m!509129 () Bool)

(assert (=> b!528581 m!509129))

(declare-fun m!509131 () Bool)

(assert (=> b!528573 m!509131))

(declare-fun m!509133 () Bool)

(assert (=> b!528583 m!509133))

(declare-fun m!509135 () Bool)

(assert (=> b!528583 m!509135))

(assert (=> b!528583 m!509109))

(declare-fun m!509137 () Bool)

(assert (=> b!528584 m!509137))

(declare-fun m!509139 () Bool)

(assert (=> b!528584 m!509139))

(assert (=> b!528579 m!509109))

(assert (=> b!528579 m!509109))

(declare-fun m!509141 () Bool)

(assert (=> b!528579 m!509141))

(declare-fun m!509143 () Bool)

(assert (=> start!48008 m!509143))

(declare-fun m!509145 () Bool)

(assert (=> start!48008 m!509145))

(declare-fun m!509147 () Bool)

(assert (=> b!528582 m!509147))

(declare-fun m!509149 () Bool)

(assert (=> b!528582 m!509149))

(assert (=> b!528575 m!509149))

(assert (=> b!528570 m!509109))

(assert (=> b!528570 m!509109))

(declare-fun m!509151 () Bool)

(assert (=> b!528570 m!509151))

(declare-fun m!509153 () Bool)

(assert (=> b!528574 m!509153))

(check-sat (not b!528576) (not start!48008) (not b!528574) (not b!528583) (not b!528582) (not b!528575) (not b!528570) (not b!528581) (not b!528578) (not b!528577) (not b!528584) (not b!528579) (not b!528573) (not b!528572))
(check-sat)
