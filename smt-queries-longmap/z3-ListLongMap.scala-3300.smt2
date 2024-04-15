; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45732 () Bool)

(assert start!45732)

(declare-fun b!505629 () Bool)

(declare-fun e!295956 () Bool)

(declare-fun e!295952 () Bool)

(assert (=> b!505629 (= e!295956 (not e!295952))))

(declare-fun res!306781 () Bool)

(assert (=> b!505629 (=> res!306781 e!295952)))

(declare-datatypes ((SeekEntryResult!4093 0))(
  ( (MissingZero!4093 (index!18560 (_ BitVec 32))) (Found!4093 (index!18561 (_ BitVec 32))) (Intermediate!4093 (undefined!4905 Bool) (index!18562 (_ BitVec 32)) (x!47577 (_ BitVec 32))) (Undefined!4093) (MissingVacant!4093 (index!18563 (_ BitVec 32))) )
))
(declare-fun lt!230488 () SeekEntryResult!4093)

(declare-fun lt!230487 () SeekEntryResult!4093)

(get-info :version)

(assert (=> b!505629 (= res!306781 (or (= lt!230488 lt!230487) (undefined!4905 lt!230488) (not ((_ is Intermediate!4093) lt!230488))))))

(declare-fun lt!230478 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32498 0))(
  ( (array!32499 (arr!15629 (Array (_ BitVec 32) (_ BitVec 64))) (size!15994 (_ BitVec 32))) )
))
(declare-fun lt!230480 () array!32498)

(declare-fun lt!230476 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32498 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!505629 (= lt!230487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230478 lt!230476 lt!230480 mask!3524))))

(declare-fun a!3235 () array!32498)

(declare-fun lt!230482 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505629 (= lt!230488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230482 (select (arr!15629 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505629 (= lt!230478 (toIndex!0 lt!230476 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505629 (= lt!230476 (select (store (arr!15629 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505629 (= lt!230482 (toIndex!0 (select (arr!15629 a!3235) j!176) mask!3524))))

(assert (=> b!505629 (= lt!230480 (array!32499 (store (arr!15629 a!3235) i!1204 k0!2280) (size!15994 a!3235)))))

(declare-fun lt!230483 () SeekEntryResult!4093)

(assert (=> b!505629 (= lt!230483 (Found!4093 j!176))))

(declare-fun e!295958 () Bool)

(assert (=> b!505629 e!295958))

(declare-fun res!306786 () Bool)

(assert (=> b!505629 (=> (not res!306786) (not e!295958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32498 (_ BitVec 32)) Bool)

(assert (=> b!505629 (= res!306786 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15442 0))(
  ( (Unit!15443) )
))
(declare-fun lt!230486 () Unit!15442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15442)

(assert (=> b!505629 (= lt!230486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505630 () Bool)

(declare-fun res!306783 () Bool)

(declare-fun e!295951 () Bool)

(assert (=> b!505630 (=> res!306783 e!295951)))

(declare-fun e!295955 () Bool)

(assert (=> b!505630 (= res!306783 e!295955)))

(declare-fun res!306787 () Bool)

(assert (=> b!505630 (=> (not res!306787) (not e!295955))))

(assert (=> b!505630 (= res!306787 (bvsgt #b00000000000000000000000000000000 (x!47577 lt!230488)))))

(declare-fun res!306794 () Bool)

(declare-fun e!295957 () Bool)

(assert (=> start!45732 (=> (not res!306794) (not e!295957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45732 (= res!306794 (validMask!0 mask!3524))))

(assert (=> start!45732 e!295957))

(assert (=> start!45732 true))

(declare-fun array_inv!11512 (array!32498) Bool)

(assert (=> start!45732 (array_inv!11512 a!3235)))

(declare-fun b!505631 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32498 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!505631 (= e!295955 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230482 (index!18562 lt!230488) (select (arr!15629 a!3235) j!176) a!3235 mask!3524) lt!230483)))))

(declare-fun b!505632 () Bool)

(declare-fun res!306782 () Bool)

(assert (=> b!505632 (=> (not res!306782) (not e!295956))))

(declare-datatypes ((List!9826 0))(
  ( (Nil!9823) (Cons!9822 (h!10699 (_ BitVec 64)) (t!16045 List!9826)) )
))
(declare-fun arrayNoDuplicates!0 (array!32498 (_ BitVec 32) List!9826) Bool)

(assert (=> b!505632 (= res!306782 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9823))))

(declare-fun b!505633 () Bool)

(assert (=> b!505633 (= e!295952 e!295951)))

(declare-fun res!306793 () Bool)

(assert (=> b!505633 (=> res!306793 e!295951)))

(assert (=> b!505633 (= res!306793 (or (bvsgt (x!47577 lt!230488) #b01111111111111111111111111111110) (bvslt lt!230482 #b00000000000000000000000000000000) (bvsge lt!230482 (size!15994 a!3235)) (bvslt (index!18562 lt!230488) #b00000000000000000000000000000000) (bvsge (index!18562 lt!230488) (size!15994 a!3235)) (not (= lt!230488 (Intermediate!4093 false (index!18562 lt!230488) (x!47577 lt!230488))))))))

(assert (=> b!505633 (= (index!18562 lt!230488) i!1204)))

(declare-fun lt!230481 () Unit!15442)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15442)

(assert (=> b!505633 (= lt!230481 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230482 #b00000000000000000000000000000000 (index!18562 lt!230488) (x!47577 lt!230488) mask!3524))))

(assert (=> b!505633 (and (or (= (select (arr!15629 a!3235) (index!18562 lt!230488)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15629 a!3235) (index!18562 lt!230488)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15629 a!3235) (index!18562 lt!230488)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15629 a!3235) (index!18562 lt!230488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230485 () Unit!15442)

(declare-fun e!295953 () Unit!15442)

(assert (=> b!505633 (= lt!230485 e!295953)))

(declare-fun c!59703 () Bool)

(assert (=> b!505633 (= c!59703 (= (select (arr!15629 a!3235) (index!18562 lt!230488)) (select (arr!15629 a!3235) j!176)))))

(assert (=> b!505633 (and (bvslt (x!47577 lt!230488) #b01111111111111111111111111111110) (or (= (select (arr!15629 a!3235) (index!18562 lt!230488)) (select (arr!15629 a!3235) j!176)) (= (select (arr!15629 a!3235) (index!18562 lt!230488)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15629 a!3235) (index!18562 lt!230488)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505634 () Bool)

(declare-fun res!306780 () Bool)

(assert (=> b!505634 (=> (not res!306780) (not e!295957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505634 (= res!306780 (validKeyInArray!0 (select (arr!15629 a!3235) j!176)))))

(declare-fun b!505635 () Bool)

(assert (=> b!505635 (= e!295951 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32498 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!505635 (= (seekEntryOrOpen!0 lt!230476 lt!230480 mask!3524) lt!230483)))

(declare-fun lt!230477 () Unit!15442)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15442)

(assert (=> b!505635 (= lt!230477 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230482 #b00000000000000000000000000000000 (index!18562 lt!230488) (x!47577 lt!230488) mask!3524))))

(declare-fun b!505636 () Bool)

(declare-fun Unit!15444 () Unit!15442)

(assert (=> b!505636 (= e!295953 Unit!15444)))

(declare-fun lt!230479 () Unit!15442)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15442)

(assert (=> b!505636 (= lt!230479 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230482 #b00000000000000000000000000000000 (index!18562 lt!230488) (x!47577 lt!230488) mask!3524))))

(declare-fun res!306788 () Bool)

(assert (=> b!505636 (= res!306788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230482 lt!230476 lt!230480 mask!3524) (Intermediate!4093 false (index!18562 lt!230488) (x!47577 lt!230488))))))

(declare-fun e!295954 () Bool)

(assert (=> b!505636 (=> (not res!306788) (not e!295954))))

(assert (=> b!505636 e!295954))

(declare-fun b!505637 () Bool)

(declare-fun Unit!15445 () Unit!15442)

(assert (=> b!505637 (= e!295953 Unit!15445)))

(declare-fun b!505638 () Bool)

(declare-fun res!306784 () Bool)

(assert (=> b!505638 (=> (not res!306784) (not e!295957))))

(assert (=> b!505638 (= res!306784 (validKeyInArray!0 k0!2280))))

(declare-fun b!505639 () Bool)

(declare-fun res!306790 () Bool)

(assert (=> b!505639 (=> (not res!306790) (not e!295956))))

(assert (=> b!505639 (= res!306790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505640 () Bool)

(declare-fun res!306785 () Bool)

(assert (=> b!505640 (=> (not res!306785) (not e!295957))))

(assert (=> b!505640 (= res!306785 (and (= (size!15994 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15994 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15994 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505641 () Bool)

(assert (=> b!505641 (= e!295957 e!295956)))

(declare-fun res!306791 () Bool)

(assert (=> b!505641 (=> (not res!306791) (not e!295956))))

(declare-fun lt!230484 () SeekEntryResult!4093)

(assert (=> b!505641 (= res!306791 (or (= lt!230484 (MissingZero!4093 i!1204)) (= lt!230484 (MissingVacant!4093 i!1204))))))

(assert (=> b!505641 (= lt!230484 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505642 () Bool)

(assert (=> b!505642 (= e!295954 false)))

(declare-fun b!505643 () Bool)

(declare-fun res!306789 () Bool)

(assert (=> b!505643 (=> (not res!306789) (not e!295957))))

(declare-fun arrayContainsKey!0 (array!32498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505643 (= res!306789 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505644 () Bool)

(assert (=> b!505644 (= e!295958 (= (seekEntryOrOpen!0 (select (arr!15629 a!3235) j!176) a!3235 mask!3524) (Found!4093 j!176)))))

(declare-fun b!505645 () Bool)

(declare-fun res!306792 () Bool)

(assert (=> b!505645 (=> res!306792 e!295951)))

(assert (=> b!505645 (= res!306792 (not (= lt!230487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230482 lt!230476 lt!230480 mask!3524))))))

(assert (= (and start!45732 res!306794) b!505640))

(assert (= (and b!505640 res!306785) b!505634))

(assert (= (and b!505634 res!306780) b!505638))

(assert (= (and b!505638 res!306784) b!505643))

(assert (= (and b!505643 res!306789) b!505641))

(assert (= (and b!505641 res!306791) b!505639))

(assert (= (and b!505639 res!306790) b!505632))

(assert (= (and b!505632 res!306782) b!505629))

(assert (= (and b!505629 res!306786) b!505644))

(assert (= (and b!505629 (not res!306781)) b!505633))

(assert (= (and b!505633 c!59703) b!505636))

(assert (= (and b!505633 (not c!59703)) b!505637))

(assert (= (and b!505636 res!306788) b!505642))

(assert (= (and b!505633 (not res!306793)) b!505630))

(assert (= (and b!505630 res!306787) b!505631))

(assert (= (and b!505630 (not res!306783)) b!505645))

(assert (= (and b!505645 (not res!306792)) b!505635))

(declare-fun m!485803 () Bool)

(assert (=> b!505629 m!485803))

(declare-fun m!485805 () Bool)

(assert (=> b!505629 m!485805))

(declare-fun m!485807 () Bool)

(assert (=> b!505629 m!485807))

(declare-fun m!485809 () Bool)

(assert (=> b!505629 m!485809))

(assert (=> b!505629 m!485807))

(declare-fun m!485811 () Bool)

(assert (=> b!505629 m!485811))

(declare-fun m!485813 () Bool)

(assert (=> b!505629 m!485813))

(declare-fun m!485815 () Bool)

(assert (=> b!505629 m!485815))

(assert (=> b!505629 m!485807))

(declare-fun m!485817 () Bool)

(assert (=> b!505629 m!485817))

(declare-fun m!485819 () Bool)

(assert (=> b!505629 m!485819))

(declare-fun m!485821 () Bool)

(assert (=> b!505636 m!485821))

(declare-fun m!485823 () Bool)

(assert (=> b!505636 m!485823))

(assert (=> b!505645 m!485823))

(declare-fun m!485825 () Bool)

(assert (=> b!505632 m!485825))

(declare-fun m!485827 () Bool)

(assert (=> b!505643 m!485827))

(assert (=> b!505644 m!485807))

(assert (=> b!505644 m!485807))

(declare-fun m!485829 () Bool)

(assert (=> b!505644 m!485829))

(declare-fun m!485831 () Bool)

(assert (=> b!505641 m!485831))

(declare-fun m!485833 () Bool)

(assert (=> b!505638 m!485833))

(declare-fun m!485835 () Bool)

(assert (=> start!45732 m!485835))

(declare-fun m!485837 () Bool)

(assert (=> start!45732 m!485837))

(assert (=> b!505631 m!485807))

(assert (=> b!505631 m!485807))

(declare-fun m!485839 () Bool)

(assert (=> b!505631 m!485839))

(declare-fun m!485841 () Bool)

(assert (=> b!505633 m!485841))

(declare-fun m!485843 () Bool)

(assert (=> b!505633 m!485843))

(assert (=> b!505633 m!485807))

(assert (=> b!505634 m!485807))

(assert (=> b!505634 m!485807))

(declare-fun m!485845 () Bool)

(assert (=> b!505634 m!485845))

(declare-fun m!485847 () Bool)

(assert (=> b!505639 m!485847))

(declare-fun m!485849 () Bool)

(assert (=> b!505635 m!485849))

(declare-fun m!485851 () Bool)

(assert (=> b!505635 m!485851))

(check-sat (not b!505631) (not b!505638) (not b!505632) (not b!505635) (not b!505645) (not b!505639) (not b!505634) (not b!505636) (not b!505643) (not b!505641) (not b!505629) (not b!505633) (not b!505644) (not start!45732))
(check-sat)
