; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45686 () Bool)

(assert start!45686)

(declare-fun b!504615 () Bool)

(declare-fun res!305827 () Bool)

(declare-fun e!295438 () Bool)

(assert (=> b!504615 (=> (not res!305827) (not e!295438))))

(declare-datatypes ((array!32443 0))(
  ( (array!32444 (arr!15601 (Array (_ BitVec 32) (_ BitVec 64))) (size!15965 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32443)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32443 (_ BitVec 32)) Bool)

(assert (=> b!504615 (= res!305827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504616 () Bool)

(declare-fun res!305828 () Bool)

(declare-fun e!295444 () Bool)

(assert (=> b!504616 (=> res!305828 e!295444)))

(declare-datatypes ((SeekEntryResult!4024 0))(
  ( (MissingZero!4024 (index!18284 (_ BitVec 32))) (Found!4024 (index!18285 (_ BitVec 32))) (Intermediate!4024 (undefined!4836 Bool) (index!18286 (_ BitVec 32)) (x!47446 (_ BitVec 32))) (Undefined!4024) (MissingVacant!4024 (index!18287 (_ BitVec 32))) )
))
(declare-fun lt!229837 () SeekEntryResult!4024)

(get-info :version)

(assert (=> b!504616 (= res!305828 (or (undefined!4836 lt!229837) (not ((_ is Intermediate!4024) lt!229837))))))

(declare-fun b!504617 () Bool)

(declare-fun res!305830 () Bool)

(declare-fun e!295443 () Bool)

(assert (=> b!504617 (=> (not res!305830) (not e!295443))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504617 (= res!305830 (and (= (size!15965 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15965 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15965 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504618 () Bool)

(declare-fun e!295446 () Bool)

(assert (=> b!504618 (= e!295444 e!295446)))

(declare-fun res!305826 () Bool)

(assert (=> b!504618 (=> res!305826 e!295446)))

(declare-fun lt!229842 () (_ BitVec 32))

(assert (=> b!504618 (= res!305826 (or (bvsgt (x!47446 lt!229837) #b01111111111111111111111111111110) (bvslt lt!229842 #b00000000000000000000000000000000) (bvsge lt!229842 (size!15965 a!3235)) (bvslt (index!18286 lt!229837) #b00000000000000000000000000000000) (bvsge (index!18286 lt!229837) (size!15965 a!3235)) (not (= lt!229837 (Intermediate!4024 false (index!18286 lt!229837) (x!47446 lt!229837))))))))

(assert (=> b!504618 (= (index!18286 lt!229837) i!1204)))

(declare-datatypes ((Unit!15331 0))(
  ( (Unit!15332) )
))
(declare-fun lt!229843 () Unit!15331)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15331)

(assert (=> b!504618 (= lt!229843 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229842 #b00000000000000000000000000000000 (index!18286 lt!229837) (x!47446 lt!229837) mask!3524))))

(assert (=> b!504618 (and (or (= (select (arr!15601 a!3235) (index!18286 lt!229837)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15601 a!3235) (index!18286 lt!229837)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15601 a!3235) (index!18286 lt!229837)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15601 a!3235) (index!18286 lt!229837)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229840 () Unit!15331)

(declare-fun e!295442 () Unit!15331)

(assert (=> b!504618 (= lt!229840 e!295442)))

(declare-fun c!59675 () Bool)

(assert (=> b!504618 (= c!59675 (= (select (arr!15601 a!3235) (index!18286 lt!229837)) (select (arr!15601 a!3235) j!176)))))

(assert (=> b!504618 (and (bvslt (x!47446 lt!229837) #b01111111111111111111111111111110) (or (= (select (arr!15601 a!3235) (index!18286 lt!229837)) (select (arr!15601 a!3235) j!176)) (= (select (arr!15601 a!3235) (index!18286 lt!229837)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15601 a!3235) (index!18286 lt!229837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!305836 () Bool)

(assert (=> start!45686 (=> (not res!305836) (not e!295443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45686 (= res!305836 (validMask!0 mask!3524))))

(assert (=> start!45686 e!295443))

(assert (=> start!45686 true))

(declare-fun array_inv!11460 (array!32443) Bool)

(assert (=> start!45686 (array_inv!11460 a!3235)))

(declare-fun b!504619 () Bool)

(assert (=> b!504619 (= e!295443 e!295438)))

(declare-fun res!305835 () Bool)

(assert (=> b!504619 (=> (not res!305835) (not e!295438))))

(declare-fun lt!229836 () SeekEntryResult!4024)

(assert (=> b!504619 (= res!305835 (or (= lt!229836 (MissingZero!4024 i!1204)) (= lt!229836 (MissingVacant!4024 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32443 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!504619 (= lt!229836 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504620 () Bool)

(declare-fun res!305831 () Bool)

(assert (=> b!504620 (=> res!305831 e!295446)))

(declare-fun e!295445 () Bool)

(assert (=> b!504620 (= res!305831 e!295445)))

(declare-fun res!305823 () Bool)

(assert (=> b!504620 (=> (not res!305823) (not e!295445))))

(assert (=> b!504620 (= res!305823 (bvsgt #b00000000000000000000000000000000 (x!47446 lt!229837)))))

(declare-fun b!504621 () Bool)

(declare-fun res!305834 () Bool)

(assert (=> b!504621 (=> (not res!305834) (not e!295443))))

(declare-fun arrayContainsKey!0 (array!32443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504621 (= res!305834 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504622 () Bool)

(assert (=> b!504622 (= e!295438 (not e!295444))))

(declare-fun res!305829 () Bool)

(assert (=> b!504622 (=> res!305829 e!295444)))

(declare-fun lt!229838 () (_ BitVec 64))

(declare-fun lt!229839 () (_ BitVec 32))

(declare-fun lt!229846 () array!32443)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32443 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!504622 (= res!305829 (= lt!229837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229839 lt!229838 lt!229846 mask!3524)))))

(assert (=> b!504622 (= lt!229837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229842 (select (arr!15601 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504622 (= lt!229839 (toIndex!0 lt!229838 mask!3524))))

(assert (=> b!504622 (= lt!229838 (select (store (arr!15601 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504622 (= lt!229842 (toIndex!0 (select (arr!15601 a!3235) j!176) mask!3524))))

(assert (=> b!504622 (= lt!229846 (array!32444 (store (arr!15601 a!3235) i!1204 k0!2280) (size!15965 a!3235)))))

(declare-fun e!295439 () Bool)

(assert (=> b!504622 e!295439))

(declare-fun res!305833 () Bool)

(assert (=> b!504622 (=> (not res!305833) (not e!295439))))

(assert (=> b!504622 (= res!305833 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229841 () Unit!15331)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15331)

(assert (=> b!504622 (= lt!229841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504623 () Bool)

(declare-fun res!305825 () Bool)

(assert (=> b!504623 (=> (not res!305825) (not e!295443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504623 (= res!305825 (validKeyInArray!0 k0!2280))))

(declare-fun b!504624 () Bool)

(declare-fun res!305824 () Bool)

(assert (=> b!504624 (=> (not res!305824) (not e!295443))))

(assert (=> b!504624 (= res!305824 (validKeyInArray!0 (select (arr!15601 a!3235) j!176)))))

(declare-fun b!504625 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32443 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!504625 (= e!295445 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229842 (index!18286 lt!229837) (select (arr!15601 a!3235) j!176) a!3235 mask!3524) (Found!4024 j!176))))))

(declare-fun b!504626 () Bool)

(assert (=> b!504626 (= e!295439 (= (seekEntryOrOpen!0 (select (arr!15601 a!3235) j!176) a!3235 mask!3524) (Found!4024 j!176)))))

(declare-fun b!504627 () Bool)

(declare-fun res!305822 () Bool)

(assert (=> b!504627 (=> (not res!305822) (not e!295438))))

(declare-datatypes ((List!9666 0))(
  ( (Nil!9663) (Cons!9662 (h!10539 (_ BitVec 64)) (t!15886 List!9666)) )
))
(declare-fun arrayNoDuplicates!0 (array!32443 (_ BitVec 32) List!9666) Bool)

(assert (=> b!504627 (= res!305822 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9663))))

(declare-fun b!504628 () Bool)

(declare-fun Unit!15333 () Unit!15331)

(assert (=> b!504628 (= e!295442 Unit!15333)))

(declare-fun b!504629 () Bool)

(declare-fun Unit!15334 () Unit!15331)

(assert (=> b!504629 (= e!295442 Unit!15334)))

(declare-fun lt!229844 () Unit!15331)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15331)

(assert (=> b!504629 (= lt!229844 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229842 #b00000000000000000000000000000000 (index!18286 lt!229837) (x!47446 lt!229837) mask!3524))))

(declare-fun res!305832 () Bool)

(assert (=> b!504629 (= res!305832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229842 lt!229838 lt!229846 mask!3524) (Intermediate!4024 false (index!18286 lt!229837) (x!47446 lt!229837))))))

(declare-fun e!295440 () Bool)

(assert (=> b!504629 (=> (not res!305832) (not e!295440))))

(assert (=> b!504629 e!295440))

(declare-fun b!504630 () Bool)

(assert (=> b!504630 (= e!295446 true)))

(declare-fun lt!229845 () SeekEntryResult!4024)

(assert (=> b!504630 (= lt!229845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229842 lt!229838 lt!229846 mask!3524))))

(declare-fun b!504631 () Bool)

(assert (=> b!504631 (= e!295440 false)))

(assert (= (and start!45686 res!305836) b!504617))

(assert (= (and b!504617 res!305830) b!504624))

(assert (= (and b!504624 res!305824) b!504623))

(assert (= (and b!504623 res!305825) b!504621))

(assert (= (and b!504621 res!305834) b!504619))

(assert (= (and b!504619 res!305835) b!504615))

(assert (= (and b!504615 res!305827) b!504627))

(assert (= (and b!504627 res!305822) b!504622))

(assert (= (and b!504622 res!305833) b!504626))

(assert (= (and b!504622 (not res!305829)) b!504616))

(assert (= (and b!504616 (not res!305828)) b!504618))

(assert (= (and b!504618 c!59675) b!504629))

(assert (= (and b!504618 (not c!59675)) b!504628))

(assert (= (and b!504629 res!305832) b!504631))

(assert (= (and b!504618 (not res!305826)) b!504620))

(assert (= (and b!504620 res!305823) b!504625))

(assert (= (and b!504620 (not res!305831)) b!504630))

(declare-fun m!485575 () Bool)

(assert (=> b!504622 m!485575))

(declare-fun m!485577 () Bool)

(assert (=> b!504622 m!485577))

(declare-fun m!485579 () Bool)

(assert (=> b!504622 m!485579))

(declare-fun m!485581 () Bool)

(assert (=> b!504622 m!485581))

(declare-fun m!485583 () Bool)

(assert (=> b!504622 m!485583))

(declare-fun m!485585 () Bool)

(assert (=> b!504622 m!485585))

(declare-fun m!485587 () Bool)

(assert (=> b!504622 m!485587))

(assert (=> b!504622 m!485579))

(declare-fun m!485589 () Bool)

(assert (=> b!504622 m!485589))

(assert (=> b!504622 m!485579))

(declare-fun m!485591 () Bool)

(assert (=> b!504622 m!485591))

(declare-fun m!485593 () Bool)

(assert (=> b!504618 m!485593))

(declare-fun m!485595 () Bool)

(assert (=> b!504618 m!485595))

(assert (=> b!504618 m!485579))

(declare-fun m!485597 () Bool)

(assert (=> b!504623 m!485597))

(declare-fun m!485599 () Bool)

(assert (=> b!504627 m!485599))

(declare-fun m!485601 () Bool)

(assert (=> b!504619 m!485601))

(declare-fun m!485603 () Bool)

(assert (=> b!504621 m!485603))

(declare-fun m!485605 () Bool)

(assert (=> b!504630 m!485605))

(declare-fun m!485607 () Bool)

(assert (=> start!45686 m!485607))

(declare-fun m!485609 () Bool)

(assert (=> start!45686 m!485609))

(assert (=> b!504625 m!485579))

(assert (=> b!504625 m!485579))

(declare-fun m!485611 () Bool)

(assert (=> b!504625 m!485611))

(assert (=> b!504626 m!485579))

(assert (=> b!504626 m!485579))

(declare-fun m!485613 () Bool)

(assert (=> b!504626 m!485613))

(declare-fun m!485615 () Bool)

(assert (=> b!504629 m!485615))

(assert (=> b!504629 m!485605))

(assert (=> b!504624 m!485579))

(assert (=> b!504624 m!485579))

(declare-fun m!485617 () Bool)

(assert (=> b!504624 m!485617))

(declare-fun m!485619 () Bool)

(assert (=> b!504615 m!485619))

(check-sat (not b!504623) (not b!504615) (not b!504621) (not b!504629) (not b!504618) (not b!504630) (not start!45686) (not b!504622) (not b!504625) (not b!504619) (not b!504626) (not b!504627) (not b!504624))
(check-sat)
