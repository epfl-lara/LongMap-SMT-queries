; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45218 () Bool)

(assert start!45218)

(declare-fun b!496420 () Bool)

(declare-fun res!298812 () Bool)

(declare-fun e!291116 () Bool)

(assert (=> b!496420 (=> (not res!298812) (not e!291116))))

(declare-datatypes ((array!32106 0))(
  ( (array!32107 (arr!15436 (Array (_ BitVec 32) (_ BitVec 64))) (size!15800 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32106)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496420 (= res!298812 (validKeyInArray!0 (select (arr!15436 a!3235) j!176)))))

(declare-fun b!496421 () Bool)

(declare-fun e!291113 () Bool)

(assert (=> b!496421 (= e!291113 true)))

(declare-datatypes ((SeekEntryResult!3903 0))(
  ( (MissingZero!3903 (index!17791 (_ BitVec 32))) (Found!3903 (index!17792 (_ BitVec 32))) (Intermediate!3903 (undefined!4715 Bool) (index!17793 (_ BitVec 32)) (x!46851 (_ BitVec 32))) (Undefined!3903) (MissingVacant!3903 (index!17794 (_ BitVec 32))) )
))
(declare-fun lt!224737 () SeekEntryResult!3903)

(assert (=> b!496421 (and (bvslt (x!46851 lt!224737) #b01111111111111111111111111111110) (or (= (select (arr!15436 a!3235) (index!17793 lt!224737)) (select (arr!15436 a!3235) j!176)) (= (select (arr!15436 a!3235) (index!17793 lt!224737)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15436 a!3235) (index!17793 lt!224737)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496422 () Bool)

(declare-fun res!298810 () Bool)

(assert (=> b!496422 (=> res!298810 e!291113)))

(get-info :version)

(assert (=> b!496422 (= res!298810 (or (undefined!4715 lt!224737) (not ((_ is Intermediate!3903) lt!224737))))))

(declare-fun res!298807 () Bool)

(assert (=> start!45218 (=> (not res!298807) (not e!291116))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45218 (= res!298807 (validMask!0 mask!3524))))

(assert (=> start!45218 e!291116))

(assert (=> start!45218 true))

(declare-fun array_inv!11232 (array!32106) Bool)

(assert (=> start!45218 (array_inv!11232 a!3235)))

(declare-fun b!496423 () Bool)

(declare-fun e!291114 () Bool)

(assert (=> b!496423 (= e!291116 e!291114)))

(declare-fun res!298809 () Bool)

(assert (=> b!496423 (=> (not res!298809) (not e!291114))))

(declare-fun lt!224735 () SeekEntryResult!3903)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496423 (= res!298809 (or (= lt!224735 (MissingZero!3903 i!1204)) (= lt!224735 (MissingVacant!3903 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32106 (_ BitVec 32)) SeekEntryResult!3903)

(assert (=> b!496423 (= lt!224735 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!291117 () Bool)

(declare-fun b!496424 () Bool)

(assert (=> b!496424 (= e!291117 (= (seekEntryOrOpen!0 (select (arr!15436 a!3235) j!176) a!3235 mask!3524) (Found!3903 j!176)))))

(declare-fun b!496425 () Bool)

(assert (=> b!496425 (= e!291114 (not e!291113))))

(declare-fun res!298815 () Bool)

(assert (=> b!496425 (=> res!298815 e!291113)))

(declare-fun lt!224734 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32106 (_ BitVec 32)) SeekEntryResult!3903)

(assert (=> b!496425 (= res!298815 (= lt!224737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224734 (select (store (arr!15436 a!3235) i!1204 k0!2280) j!176) (array!32107 (store (arr!15436 a!3235) i!1204 k0!2280) (size!15800 a!3235)) mask!3524)))))

(declare-fun lt!224733 () (_ BitVec 32))

(assert (=> b!496425 (= lt!224737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224733 (select (arr!15436 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496425 (= lt!224734 (toIndex!0 (select (store (arr!15436 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496425 (= lt!224733 (toIndex!0 (select (arr!15436 a!3235) j!176) mask!3524))))

(assert (=> b!496425 e!291117))

(declare-fun res!298808 () Bool)

(assert (=> b!496425 (=> (not res!298808) (not e!291117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32106 (_ BitVec 32)) Bool)

(assert (=> b!496425 (= res!298808 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14752 0))(
  ( (Unit!14753) )
))
(declare-fun lt!224736 () Unit!14752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14752)

(assert (=> b!496425 (= lt!224736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496426 () Bool)

(declare-fun res!298817 () Bool)

(assert (=> b!496426 (=> (not res!298817) (not e!291116))))

(assert (=> b!496426 (= res!298817 (validKeyInArray!0 k0!2280))))

(declare-fun b!496427 () Bool)

(declare-fun res!298814 () Bool)

(assert (=> b!496427 (=> (not res!298814) (not e!291116))))

(assert (=> b!496427 (= res!298814 (and (= (size!15800 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15800 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15800 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496428 () Bool)

(declare-fun res!298813 () Bool)

(assert (=> b!496428 (=> (not res!298813) (not e!291116))))

(declare-fun arrayContainsKey!0 (array!32106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496428 (= res!298813 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496429 () Bool)

(declare-fun res!298811 () Bool)

(assert (=> b!496429 (=> (not res!298811) (not e!291114))))

(assert (=> b!496429 (= res!298811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496430 () Bool)

(declare-fun res!298816 () Bool)

(assert (=> b!496430 (=> (not res!298816) (not e!291114))))

(declare-datatypes ((List!9594 0))(
  ( (Nil!9591) (Cons!9590 (h!10461 (_ BitVec 64)) (t!15822 List!9594)) )
))
(declare-fun arrayNoDuplicates!0 (array!32106 (_ BitVec 32) List!9594) Bool)

(assert (=> b!496430 (= res!298816 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9591))))

(assert (= (and start!45218 res!298807) b!496427))

(assert (= (and b!496427 res!298814) b!496420))

(assert (= (and b!496420 res!298812) b!496426))

(assert (= (and b!496426 res!298817) b!496428))

(assert (= (and b!496428 res!298813) b!496423))

(assert (= (and b!496423 res!298809) b!496429))

(assert (= (and b!496429 res!298811) b!496430))

(assert (= (and b!496430 res!298816) b!496425))

(assert (= (and b!496425 res!298808) b!496424))

(assert (= (and b!496425 (not res!298815)) b!496422))

(assert (= (and b!496422 (not res!298810)) b!496421))

(declare-fun m!477653 () Bool)

(assert (=> b!496426 m!477653))

(declare-fun m!477655 () Bool)

(assert (=> start!45218 m!477655))

(declare-fun m!477657 () Bool)

(assert (=> start!45218 m!477657))

(declare-fun m!477659 () Bool)

(assert (=> b!496429 m!477659))

(declare-fun m!477661 () Bool)

(assert (=> b!496421 m!477661))

(declare-fun m!477663 () Bool)

(assert (=> b!496421 m!477663))

(assert (=> b!496420 m!477663))

(assert (=> b!496420 m!477663))

(declare-fun m!477665 () Bool)

(assert (=> b!496420 m!477665))

(declare-fun m!477667 () Bool)

(assert (=> b!496423 m!477667))

(declare-fun m!477669 () Bool)

(assert (=> b!496425 m!477669))

(declare-fun m!477671 () Bool)

(assert (=> b!496425 m!477671))

(declare-fun m!477673 () Bool)

(assert (=> b!496425 m!477673))

(declare-fun m!477675 () Bool)

(assert (=> b!496425 m!477675))

(assert (=> b!496425 m!477669))

(assert (=> b!496425 m!477663))

(declare-fun m!477677 () Bool)

(assert (=> b!496425 m!477677))

(assert (=> b!496425 m!477663))

(declare-fun m!477679 () Bool)

(assert (=> b!496425 m!477679))

(assert (=> b!496425 m!477669))

(declare-fun m!477681 () Bool)

(assert (=> b!496425 m!477681))

(assert (=> b!496425 m!477663))

(declare-fun m!477683 () Bool)

(assert (=> b!496425 m!477683))

(declare-fun m!477685 () Bool)

(assert (=> b!496428 m!477685))

(declare-fun m!477687 () Bool)

(assert (=> b!496430 m!477687))

(assert (=> b!496424 m!477663))

(assert (=> b!496424 m!477663))

(declare-fun m!477689 () Bool)

(assert (=> b!496424 m!477689))

(check-sat (not b!496426) (not start!45218) (not b!496429) (not b!496423) (not b!496430) (not b!496420) (not b!496428) (not b!496425) (not b!496424))
