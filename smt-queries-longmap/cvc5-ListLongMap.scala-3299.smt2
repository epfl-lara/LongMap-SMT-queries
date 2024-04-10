; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45738 () Bool)

(assert start!45738)

(declare-fun res!306787 () Bool)

(declare-fun e!296046 () Bool)

(assert (=> start!45738 (=> (not res!306787) (not e!296046))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45738 (= res!306787 (validMask!0 mask!3524))))

(assert (=> start!45738 e!296046))

(assert (=> start!45738 true))

(declare-datatypes ((array!32494 0))(
  ( (array!32495 (arr!15627 (Array (_ BitVec 32) (_ BitVec 64))) (size!15991 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32494)

(declare-fun array_inv!11423 (array!32494) Bool)

(assert (=> start!45738 (array_inv!11423 a!3235)))

(declare-fun b!505747 () Bool)

(declare-fun e!296047 () Bool)

(declare-fun e!296044 () Bool)

(assert (=> b!505747 (= e!296047 e!296044)))

(declare-fun res!306782 () Bool)

(assert (=> b!505747 (=> res!306782 e!296044)))

(declare-datatypes ((SeekEntryResult!4094 0))(
  ( (MissingZero!4094 (index!18564 (_ BitVec 32))) (Found!4094 (index!18565 (_ BitVec 32))) (Intermediate!4094 (undefined!4906 Bool) (index!18566 (_ BitVec 32)) (x!47575 (_ BitVec 32))) (Undefined!4094) (MissingVacant!4094 (index!18567 (_ BitVec 32))) )
))
(declare-fun lt!230594 () SeekEntryResult!4094)

(declare-fun lt!230601 () (_ BitVec 32))

(assert (=> b!505747 (= res!306782 (or (bvsgt (x!47575 lt!230594) #b01111111111111111111111111111110) (bvslt lt!230601 #b00000000000000000000000000000000) (bvsge lt!230601 (size!15991 a!3235)) (bvslt (index!18566 lt!230594) #b00000000000000000000000000000000) (bvsge (index!18566 lt!230594) (size!15991 a!3235)) (not (= lt!230594 (Intermediate!4094 false (index!18566 lt!230594) (x!47575 lt!230594))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505747 (= (index!18566 lt!230594) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15452 0))(
  ( (Unit!15453) )
))
(declare-fun lt!230597 () Unit!15452)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15452)

(assert (=> b!505747 (= lt!230597 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230601 #b00000000000000000000000000000000 (index!18566 lt!230594) (x!47575 lt!230594) mask!3524))))

(assert (=> b!505747 (and (or (= (select (arr!15627 a!3235) (index!18566 lt!230594)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15627 a!3235) (index!18566 lt!230594)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15627 a!3235) (index!18566 lt!230594)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15627 a!3235) (index!18566 lt!230594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230600 () Unit!15452)

(declare-fun e!296049 () Unit!15452)

(assert (=> b!505747 (= lt!230600 e!296049)))

(declare-fun c!59765 () Bool)

(assert (=> b!505747 (= c!59765 (= (select (arr!15627 a!3235) (index!18566 lt!230594)) (select (arr!15627 a!3235) j!176)))))

(assert (=> b!505747 (and (bvslt (x!47575 lt!230594) #b01111111111111111111111111111110) (or (= (select (arr!15627 a!3235) (index!18566 lt!230594)) (select (arr!15627 a!3235) j!176)) (= (select (arr!15627 a!3235) (index!18566 lt!230594)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15627 a!3235) (index!18566 lt!230594)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505748 () Bool)

(declare-fun Unit!15454 () Unit!15452)

(assert (=> b!505748 (= e!296049 Unit!15454)))

(declare-fun b!505749 () Bool)

(declare-fun res!306781 () Bool)

(declare-fun e!296051 () Bool)

(assert (=> b!505749 (=> (not res!306781) (not e!296051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32494 (_ BitVec 32)) Bool)

(assert (=> b!505749 (= res!306781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505750 () Bool)

(declare-fun res!306785 () Bool)

(assert (=> b!505750 (=> (not res!306785) (not e!296051))))

(declare-datatypes ((List!9785 0))(
  ( (Nil!9782) (Cons!9781 (h!10658 (_ BitVec 64)) (t!16013 List!9785)) )
))
(declare-fun arrayNoDuplicates!0 (array!32494 (_ BitVec 32) List!9785) Bool)

(assert (=> b!505750 (= res!306785 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9782))))

(declare-fun b!505751 () Bool)

(assert (=> b!505751 (= e!296051 (not e!296047))))

(declare-fun res!306784 () Bool)

(assert (=> b!505751 (=> res!306784 e!296047)))

(declare-fun lt!230603 () SeekEntryResult!4094)

(assert (=> b!505751 (= res!306784 (or (= lt!230594 lt!230603) (undefined!4906 lt!230594) (not (is-Intermediate!4094 lt!230594))))))

(declare-fun lt!230598 () (_ BitVec 64))

(declare-fun lt!230593 () (_ BitVec 32))

(declare-fun lt!230599 () array!32494)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32494 (_ BitVec 32)) SeekEntryResult!4094)

(assert (=> b!505751 (= lt!230603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230593 lt!230598 lt!230599 mask!3524))))

(assert (=> b!505751 (= lt!230594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230601 (select (arr!15627 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505751 (= lt!230593 (toIndex!0 lt!230598 mask!3524))))

(assert (=> b!505751 (= lt!230598 (select (store (arr!15627 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505751 (= lt!230601 (toIndex!0 (select (arr!15627 a!3235) j!176) mask!3524))))

(assert (=> b!505751 (= lt!230599 (array!32495 (store (arr!15627 a!3235) i!1204 k!2280) (size!15991 a!3235)))))

(declare-fun lt!230605 () SeekEntryResult!4094)

(assert (=> b!505751 (= lt!230605 (Found!4094 j!176))))

(declare-fun e!296050 () Bool)

(assert (=> b!505751 e!296050))

(declare-fun res!306778 () Bool)

(assert (=> b!505751 (=> (not res!306778) (not e!296050))))

(assert (=> b!505751 (= res!306778 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230602 () Unit!15452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15452)

(assert (=> b!505751 (= lt!230602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505752 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32494 (_ BitVec 32)) SeekEntryResult!4094)

(assert (=> b!505752 (= e!296050 (= (seekEntryOrOpen!0 (select (arr!15627 a!3235) j!176) a!3235 mask!3524) (Found!4094 j!176)))))

(declare-fun b!505753 () Bool)

(declare-fun res!306783 () Bool)

(assert (=> b!505753 (=> res!306783 e!296044)))

(declare-fun e!296052 () Bool)

(assert (=> b!505753 (= res!306783 e!296052)))

(declare-fun res!306779 () Bool)

(assert (=> b!505753 (=> (not res!306779) (not e!296052))))

(assert (=> b!505753 (= res!306779 (bvsgt #b00000000000000000000000000000000 (x!47575 lt!230594)))))

(declare-fun b!505754 () Bool)

(assert (=> b!505754 (= e!296046 e!296051)))

(declare-fun res!306776 () Bool)

(assert (=> b!505754 (=> (not res!306776) (not e!296051))))

(declare-fun lt!230595 () SeekEntryResult!4094)

(assert (=> b!505754 (= res!306776 (or (= lt!230595 (MissingZero!4094 i!1204)) (= lt!230595 (MissingVacant!4094 i!1204))))))

(assert (=> b!505754 (= lt!230595 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505755 () Bool)

(declare-fun res!306786 () Bool)

(assert (=> b!505755 (=> (not res!306786) (not e!296046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505755 (= res!306786 (validKeyInArray!0 (select (arr!15627 a!3235) j!176)))))

(declare-fun b!505756 () Bool)

(declare-fun res!306777 () Bool)

(assert (=> b!505756 (=> (not res!306777) (not e!296046))))

(declare-fun arrayContainsKey!0 (array!32494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505756 (= res!306777 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505757 () Bool)

(declare-fun res!306780 () Bool)

(assert (=> b!505757 (=> res!306780 e!296044)))

(assert (=> b!505757 (= res!306780 (not (= lt!230603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230601 lt!230598 lt!230599 mask!3524))))))

(declare-fun b!505758 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32494 (_ BitVec 32)) SeekEntryResult!4094)

(assert (=> b!505758 (= e!296052 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230601 (index!18566 lt!230594) (select (arr!15627 a!3235) j!176) a!3235 mask!3524) lt!230605)))))

(declare-fun b!505759 () Bool)

(declare-fun Unit!15455 () Unit!15452)

(assert (=> b!505759 (= e!296049 Unit!15455)))

(declare-fun lt!230596 () Unit!15452)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15452)

(assert (=> b!505759 (= lt!230596 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230601 #b00000000000000000000000000000000 (index!18566 lt!230594) (x!47575 lt!230594) mask!3524))))

(declare-fun res!306788 () Bool)

(assert (=> b!505759 (= res!306788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230601 lt!230598 lt!230599 mask!3524) (Intermediate!4094 false (index!18566 lt!230594) (x!47575 lt!230594))))))

(declare-fun e!296048 () Bool)

(assert (=> b!505759 (=> (not res!306788) (not e!296048))))

(assert (=> b!505759 e!296048))

(declare-fun b!505760 () Bool)

(declare-fun res!306774 () Bool)

(assert (=> b!505760 (=> (not res!306774) (not e!296046))))

(assert (=> b!505760 (= res!306774 (and (= (size!15991 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15991 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15991 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505761 () Bool)

(assert (=> b!505761 (= e!296048 false)))

(declare-fun b!505762 () Bool)

(assert (=> b!505762 (= e!296044 true)))

(assert (=> b!505762 (= (seekEntryOrOpen!0 lt!230598 lt!230599 mask!3524) lt!230605)))

(declare-fun lt!230604 () Unit!15452)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15452)

(assert (=> b!505762 (= lt!230604 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230601 #b00000000000000000000000000000000 (index!18566 lt!230594) (x!47575 lt!230594) mask!3524))))

(declare-fun b!505763 () Bool)

(declare-fun res!306775 () Bool)

(assert (=> b!505763 (=> (not res!306775) (not e!296046))))

(assert (=> b!505763 (= res!306775 (validKeyInArray!0 k!2280))))

(assert (= (and start!45738 res!306787) b!505760))

(assert (= (and b!505760 res!306774) b!505755))

(assert (= (and b!505755 res!306786) b!505763))

(assert (= (and b!505763 res!306775) b!505756))

(assert (= (and b!505756 res!306777) b!505754))

(assert (= (and b!505754 res!306776) b!505749))

(assert (= (and b!505749 res!306781) b!505750))

(assert (= (and b!505750 res!306785) b!505751))

(assert (= (and b!505751 res!306778) b!505752))

(assert (= (and b!505751 (not res!306784)) b!505747))

(assert (= (and b!505747 c!59765) b!505759))

(assert (= (and b!505747 (not c!59765)) b!505748))

(assert (= (and b!505759 res!306788) b!505761))

(assert (= (and b!505747 (not res!306782)) b!505753))

(assert (= (and b!505753 res!306779) b!505758))

(assert (= (and b!505753 (not res!306783)) b!505757))

(assert (= (and b!505757 (not res!306780)) b!505762))

(declare-fun m!486405 () Bool)

(assert (=> b!505755 m!486405))

(assert (=> b!505755 m!486405))

(declare-fun m!486407 () Bool)

(assert (=> b!505755 m!486407))

(declare-fun m!486409 () Bool)

(assert (=> b!505750 m!486409))

(declare-fun m!486411 () Bool)

(assert (=> b!505747 m!486411))

(declare-fun m!486413 () Bool)

(assert (=> b!505747 m!486413))

(assert (=> b!505747 m!486405))

(declare-fun m!486415 () Bool)

(assert (=> b!505759 m!486415))

(declare-fun m!486417 () Bool)

(assert (=> b!505759 m!486417))

(assert (=> b!505757 m!486417))

(declare-fun m!486419 () Bool)

(assert (=> b!505756 m!486419))

(declare-fun m!486421 () Bool)

(assert (=> b!505751 m!486421))

(declare-fun m!486423 () Bool)

(assert (=> b!505751 m!486423))

(declare-fun m!486425 () Bool)

(assert (=> b!505751 m!486425))

(assert (=> b!505751 m!486405))

(declare-fun m!486427 () Bool)

(assert (=> b!505751 m!486427))

(declare-fun m!486429 () Bool)

(assert (=> b!505751 m!486429))

(assert (=> b!505751 m!486405))

(declare-fun m!486431 () Bool)

(assert (=> b!505751 m!486431))

(assert (=> b!505751 m!486405))

(declare-fun m!486433 () Bool)

(assert (=> b!505751 m!486433))

(declare-fun m!486435 () Bool)

(assert (=> b!505751 m!486435))

(declare-fun m!486437 () Bool)

(assert (=> b!505754 m!486437))

(declare-fun m!486439 () Bool)

(assert (=> b!505762 m!486439))

(declare-fun m!486441 () Bool)

(assert (=> b!505762 m!486441))

(declare-fun m!486443 () Bool)

(assert (=> b!505749 m!486443))

(declare-fun m!486445 () Bool)

(assert (=> b!505763 m!486445))

(assert (=> b!505752 m!486405))

(assert (=> b!505752 m!486405))

(declare-fun m!486447 () Bool)

(assert (=> b!505752 m!486447))

(assert (=> b!505758 m!486405))

(assert (=> b!505758 m!486405))

(declare-fun m!486449 () Bool)

(assert (=> b!505758 m!486449))

(declare-fun m!486451 () Bool)

(assert (=> start!45738 m!486451))

(declare-fun m!486453 () Bool)

(assert (=> start!45738 m!486453))

(push 1)

