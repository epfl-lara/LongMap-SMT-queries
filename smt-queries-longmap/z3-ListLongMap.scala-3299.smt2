; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45728 () Bool)

(assert start!45728)

(declare-fun b!505686 () Bool)

(declare-fun res!306776 () Bool)

(declare-fun e!296013 () Bool)

(assert (=> b!505686 (=> (not res!306776) (not e!296013))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505686 (= res!306776 (validKeyInArray!0 k0!2280))))

(declare-fun b!505687 () Bool)

(declare-datatypes ((Unit!15415 0))(
  ( (Unit!15416) )
))
(declare-fun e!296007 () Unit!15415)

(declare-fun Unit!15417 () Unit!15415)

(assert (=> b!505687 (= e!296007 Unit!15417)))

(declare-datatypes ((SeekEntryResult!4045 0))(
  ( (MissingZero!4045 (index!18368 (_ BitVec 32))) (Found!4045 (index!18369 (_ BitVec 32))) (Intermediate!4045 (undefined!4857 Bool) (index!18370 (_ BitVec 32)) (x!47523 (_ BitVec 32))) (Undefined!4045) (MissingVacant!4045 (index!18371 (_ BitVec 32))) )
))
(declare-fun lt!230615 () SeekEntryResult!4045)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32485 0))(
  ( (array!32486 (arr!15622 (Array (_ BitVec 32) (_ BitVec 64))) (size!15986 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32485)

(declare-fun lt!230616 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!230609 () Unit!15415)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15415)

(assert (=> b!505687 (= lt!230609 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230616 #b00000000000000000000000000000000 (index!18370 lt!230615) (x!47523 lt!230615) mask!3524))))

(declare-fun res!306780 () Bool)

(declare-fun lt!230606 () array!32485)

(declare-fun lt!230611 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32485 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!505687 (= res!306780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230616 lt!230611 lt!230606 mask!3524) (Intermediate!4045 false (index!18370 lt!230615) (x!47523 lt!230615))))))

(declare-fun e!296008 () Bool)

(assert (=> b!505687 (=> (not res!306780) (not e!296008))))

(assert (=> b!505687 e!296008))

(declare-fun b!505688 () Bool)

(declare-fun res!306774 () Bool)

(declare-fun e!296005 () Bool)

(assert (=> b!505688 (=> (not res!306774) (not e!296005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32485 (_ BitVec 32)) Bool)

(assert (=> b!505688 (= res!306774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505689 () Bool)

(declare-fun res!306775 () Bool)

(declare-fun e!296009 () Bool)

(assert (=> b!505689 (=> res!306775 e!296009)))

(declare-fun lt!230614 () SeekEntryResult!4045)

(assert (=> b!505689 (= res!306775 (not (= lt!230614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230616 lt!230611 lt!230606 mask!3524))))))

(declare-fun b!505690 () Bool)

(declare-fun res!306770 () Bool)

(assert (=> b!505690 (=> (not res!306770) (not e!296013))))

(declare-fun arrayContainsKey!0 (array!32485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505690 (= res!306770 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505691 () Bool)

(declare-fun e!296006 () Bool)

(assert (=> b!505691 (= e!296006 e!296009)))

(declare-fun res!306767 () Bool)

(assert (=> b!505691 (=> res!306767 e!296009)))

(assert (=> b!505691 (= res!306767 (or (bvsgt (x!47523 lt!230615) #b01111111111111111111111111111110) (bvslt lt!230616 #b00000000000000000000000000000000) (bvsge lt!230616 (size!15986 a!3235)) (bvslt (index!18370 lt!230615) #b00000000000000000000000000000000) (bvsge (index!18370 lt!230615) (size!15986 a!3235)) (not (= lt!230615 (Intermediate!4045 false (index!18370 lt!230615) (x!47523 lt!230615))))))))

(assert (=> b!505691 (= (index!18370 lt!230615) i!1204)))

(declare-fun lt!230617 () Unit!15415)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15415)

(assert (=> b!505691 (= lt!230617 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230616 #b00000000000000000000000000000000 (index!18370 lt!230615) (x!47523 lt!230615) mask!3524))))

(assert (=> b!505691 (and (or (= (select (arr!15622 a!3235) (index!18370 lt!230615)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15622 a!3235) (index!18370 lt!230615)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15622 a!3235) (index!18370 lt!230615)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15622 a!3235) (index!18370 lt!230615)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230607 () Unit!15415)

(assert (=> b!505691 (= lt!230607 e!296007)))

(declare-fun c!59738 () Bool)

(assert (=> b!505691 (= c!59738 (= (select (arr!15622 a!3235) (index!18370 lt!230615)) (select (arr!15622 a!3235) j!176)))))

(assert (=> b!505691 (and (bvslt (x!47523 lt!230615) #b01111111111111111111111111111110) (or (= (select (arr!15622 a!3235) (index!18370 lt!230615)) (select (arr!15622 a!3235) j!176)) (= (select (arr!15622 a!3235) (index!18370 lt!230615)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15622 a!3235) (index!18370 lt!230615)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505692 () Bool)

(declare-fun res!306781 () Bool)

(assert (=> b!505692 (=> (not res!306781) (not e!296005))))

(declare-datatypes ((List!9687 0))(
  ( (Nil!9684) (Cons!9683 (h!10560 (_ BitVec 64)) (t!15907 List!9687)) )
))
(declare-fun arrayNoDuplicates!0 (array!32485 (_ BitVec 32) List!9687) Bool)

(assert (=> b!505692 (= res!306781 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9684))))

(declare-fun b!505693 () Bool)

(assert (=> b!505693 (= e!296008 false)))

(declare-fun res!306769 () Bool)

(assert (=> start!45728 (=> (not res!306769) (not e!296013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45728 (= res!306769 (validMask!0 mask!3524))))

(assert (=> start!45728 e!296013))

(assert (=> start!45728 true))

(declare-fun array_inv!11481 (array!32485) Bool)

(assert (=> start!45728 (array_inv!11481 a!3235)))

(declare-fun b!505694 () Bool)

(declare-fun res!306768 () Bool)

(assert (=> b!505694 (=> (not res!306768) (not e!296013))))

(assert (=> b!505694 (= res!306768 (and (= (size!15986 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15986 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15986 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505695 () Bool)

(declare-fun res!306778 () Bool)

(assert (=> b!505695 (=> res!306778 e!296009)))

(declare-fun e!296010 () Bool)

(assert (=> b!505695 (= res!306778 e!296010)))

(declare-fun res!306779 () Bool)

(assert (=> b!505695 (=> (not res!306779) (not e!296010))))

(assert (=> b!505695 (= res!306779 (bvsgt #b00000000000000000000000000000000 (x!47523 lt!230615)))))

(declare-fun b!505696 () Bool)

(assert (=> b!505696 (= e!296005 (not e!296006))))

(declare-fun res!306771 () Bool)

(assert (=> b!505696 (=> res!306771 e!296006)))

(get-info :version)

(assert (=> b!505696 (= res!306771 (or (= lt!230615 lt!230614) (undefined!4857 lt!230615) (not ((_ is Intermediate!4045) lt!230615))))))

(declare-fun lt!230613 () (_ BitVec 32))

(assert (=> b!505696 (= lt!230614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230613 lt!230611 lt!230606 mask!3524))))

(assert (=> b!505696 (= lt!230615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230616 (select (arr!15622 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505696 (= lt!230613 (toIndex!0 lt!230611 mask!3524))))

(assert (=> b!505696 (= lt!230611 (select (store (arr!15622 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505696 (= lt!230616 (toIndex!0 (select (arr!15622 a!3235) j!176) mask!3524))))

(assert (=> b!505696 (= lt!230606 (array!32486 (store (arr!15622 a!3235) i!1204 k0!2280) (size!15986 a!3235)))))

(declare-fun lt!230605 () SeekEntryResult!4045)

(assert (=> b!505696 (= lt!230605 (Found!4045 j!176))))

(declare-fun e!296012 () Bool)

(assert (=> b!505696 e!296012))

(declare-fun res!306773 () Bool)

(assert (=> b!505696 (=> (not res!306773) (not e!296012))))

(assert (=> b!505696 (= res!306773 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230612 () Unit!15415)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15415)

(assert (=> b!505696 (= lt!230612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505697 () Bool)

(declare-fun Unit!15418 () Unit!15415)

(assert (=> b!505697 (= e!296007 Unit!15418)))

(declare-fun b!505698 () Bool)

(declare-fun res!306772 () Bool)

(assert (=> b!505698 (=> (not res!306772) (not e!296013))))

(assert (=> b!505698 (= res!306772 (validKeyInArray!0 (select (arr!15622 a!3235) j!176)))))

(declare-fun b!505699 () Bool)

(assert (=> b!505699 (= e!296009 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32485 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!505699 (= (seekEntryOrOpen!0 lt!230611 lt!230606 mask!3524) lt!230605)))

(declare-fun lt!230608 () Unit!15415)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15415)

(assert (=> b!505699 (= lt!230608 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230616 #b00000000000000000000000000000000 (index!18370 lt!230615) (x!47523 lt!230615) mask!3524))))

(declare-fun b!505700 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32485 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!505700 (= e!296010 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230616 (index!18370 lt!230615) (select (arr!15622 a!3235) j!176) a!3235 mask!3524) lt!230605)))))

(declare-fun b!505701 () Bool)

(assert (=> b!505701 (= e!296013 e!296005)))

(declare-fun res!306777 () Bool)

(assert (=> b!505701 (=> (not res!306777) (not e!296005))))

(declare-fun lt!230610 () SeekEntryResult!4045)

(assert (=> b!505701 (= res!306777 (or (= lt!230610 (MissingZero!4045 i!1204)) (= lt!230610 (MissingVacant!4045 i!1204))))))

(assert (=> b!505701 (= lt!230610 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505702 () Bool)

(assert (=> b!505702 (= e!296012 (= (seekEntryOrOpen!0 (select (arr!15622 a!3235) j!176) a!3235 mask!3524) (Found!4045 j!176)))))

(assert (= (and start!45728 res!306769) b!505694))

(assert (= (and b!505694 res!306768) b!505698))

(assert (= (and b!505698 res!306772) b!505686))

(assert (= (and b!505686 res!306776) b!505690))

(assert (= (and b!505690 res!306770) b!505701))

(assert (= (and b!505701 res!306777) b!505688))

(assert (= (and b!505688 res!306774) b!505692))

(assert (= (and b!505692 res!306781) b!505696))

(assert (= (and b!505696 res!306773) b!505702))

(assert (= (and b!505696 (not res!306771)) b!505691))

(assert (= (and b!505691 c!59738) b!505687))

(assert (= (and b!505691 (not c!59738)) b!505697))

(assert (= (and b!505687 res!306780) b!505693))

(assert (= (and b!505691 (not res!306767)) b!505695))

(assert (= (and b!505695 res!306779) b!505700))

(assert (= (and b!505695 (not res!306778)) b!505689))

(assert (= (and b!505689 (not res!306775)) b!505699))

(declare-fun m!486589 () Bool)

(assert (=> b!505699 m!486589))

(declare-fun m!486591 () Bool)

(assert (=> b!505699 m!486591))

(declare-fun m!486593 () Bool)

(assert (=> start!45728 m!486593))

(declare-fun m!486595 () Bool)

(assert (=> start!45728 m!486595))

(declare-fun m!486597 () Bool)

(assert (=> b!505700 m!486597))

(assert (=> b!505700 m!486597))

(declare-fun m!486599 () Bool)

(assert (=> b!505700 m!486599))

(declare-fun m!486601 () Bool)

(assert (=> b!505689 m!486601))

(declare-fun m!486603 () Bool)

(assert (=> b!505686 m!486603))

(declare-fun m!486605 () Bool)

(assert (=> b!505692 m!486605))

(declare-fun m!486607 () Bool)

(assert (=> b!505688 m!486607))

(assert (=> b!505698 m!486597))

(assert (=> b!505698 m!486597))

(declare-fun m!486609 () Bool)

(assert (=> b!505698 m!486609))

(declare-fun m!486611 () Bool)

(assert (=> b!505687 m!486611))

(assert (=> b!505687 m!486601))

(declare-fun m!486613 () Bool)

(assert (=> b!505696 m!486613))

(declare-fun m!486615 () Bool)

(assert (=> b!505696 m!486615))

(assert (=> b!505696 m!486597))

(declare-fun m!486617 () Bool)

(assert (=> b!505696 m!486617))

(declare-fun m!486619 () Bool)

(assert (=> b!505696 m!486619))

(assert (=> b!505696 m!486597))

(declare-fun m!486621 () Bool)

(assert (=> b!505696 m!486621))

(assert (=> b!505696 m!486597))

(declare-fun m!486623 () Bool)

(assert (=> b!505696 m!486623))

(declare-fun m!486625 () Bool)

(assert (=> b!505696 m!486625))

(declare-fun m!486627 () Bool)

(assert (=> b!505696 m!486627))

(declare-fun m!486629 () Bool)

(assert (=> b!505691 m!486629))

(declare-fun m!486631 () Bool)

(assert (=> b!505691 m!486631))

(assert (=> b!505691 m!486597))

(assert (=> b!505702 m!486597))

(assert (=> b!505702 m!486597))

(declare-fun m!486633 () Bool)

(assert (=> b!505702 m!486633))

(declare-fun m!486635 () Bool)

(assert (=> b!505690 m!486635))

(declare-fun m!486637 () Bool)

(assert (=> b!505701 m!486637))

(check-sat (not b!505701) (not b!505699) (not start!45728) (not b!505696) (not b!505687) (not b!505689) (not b!505690) (not b!505688) (not b!505700) (not b!505698) (not b!505686) (not b!505692) (not b!505691) (not b!505702))
(check-sat)
