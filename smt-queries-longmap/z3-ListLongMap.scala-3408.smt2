; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47372 () Bool)

(assert start!47372)

(declare-fun e!303886 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33198 0))(
  ( (array!33199 (arr!15955 (Array (_ BitVec 32) (_ BitVec 64))) (size!16319 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33198)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!520780 () Bool)

(declare-datatypes ((SeekEntryResult!4422 0))(
  ( (MissingZero!4422 (index!19891 (_ BitVec 32))) (Found!4422 (index!19892 (_ BitVec 32))) (Intermediate!4422 (undefined!5234 Bool) (index!19893 (_ BitVec 32)) (x!48880 (_ BitVec 32))) (Undefined!4422) (MissingVacant!4422 (index!19894 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33198 (_ BitVec 32)) SeekEntryResult!4422)

(assert (=> b!520780 (= e!303886 (= (seekEntryOrOpen!0 (select (arr!15955 a!3235) j!176) a!3235 mask!3524) (Found!4422 j!176)))))

(declare-fun b!520781 () Bool)

(declare-datatypes ((Unit!16140 0))(
  ( (Unit!16141) )
))
(declare-fun e!303887 () Unit!16140)

(declare-fun Unit!16142 () Unit!16140)

(assert (=> b!520781 (= e!303887 Unit!16142)))

(declare-fun lt!238537 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!238542 () Unit!16140)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!238539 () SeekEntryResult!4422)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33198 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16140)

(assert (=> b!520781 (= lt!238542 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238537 #b00000000000000000000000000000000 (index!19893 lt!238539) (x!48880 lt!238539) mask!3524))))

(declare-fun lt!238543 () array!33198)

(declare-fun res!318681 () Bool)

(declare-fun lt!238538 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33198 (_ BitVec 32)) SeekEntryResult!4422)

(assert (=> b!520781 (= res!318681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238537 lt!238538 lt!238543 mask!3524) (Intermediate!4422 false (index!19893 lt!238539) (x!48880 lt!238539))))))

(declare-fun e!303885 () Bool)

(assert (=> b!520781 (=> (not res!318681) (not e!303885))))

(assert (=> b!520781 e!303885))

(declare-fun b!520782 () Bool)

(declare-fun res!318680 () Bool)

(declare-fun e!303889 () Bool)

(assert (=> b!520782 (=> (not res!318680) (not e!303889))))

(declare-fun arrayContainsKey!0 (array!33198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520782 (= res!318680 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520783 () Bool)

(declare-fun res!318675 () Bool)

(assert (=> b!520783 (=> (not res!318675) (not e!303889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520783 (= res!318675 (validKeyInArray!0 (select (arr!15955 a!3235) j!176)))))

(declare-fun res!318673 () Bool)

(assert (=> start!47372 (=> (not res!318673) (not e!303889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47372 (= res!318673 (validMask!0 mask!3524))))

(assert (=> start!47372 e!303889))

(assert (=> start!47372 true))

(declare-fun array_inv!11751 (array!33198) Bool)

(assert (=> start!47372 (array_inv!11751 a!3235)))

(declare-fun b!520784 () Bool)

(declare-fun res!318682 () Bool)

(assert (=> b!520784 (=> (not res!318682) (not e!303889))))

(assert (=> b!520784 (= res!318682 (and (= (size!16319 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16319 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16319 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520785 () Bool)

(declare-fun e!303891 () Bool)

(assert (=> b!520785 (= e!303891 (= (select (arr!15955 a!3235) (index!19893 lt!238539)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520785 (and (or (= (select (arr!15955 a!3235) (index!19893 lt!238539)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15955 a!3235) (index!19893 lt!238539)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15955 a!3235) (index!19893 lt!238539)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238535 () Unit!16140)

(assert (=> b!520785 (= lt!238535 e!303887)))

(declare-fun c!61355 () Bool)

(assert (=> b!520785 (= c!61355 (= (select (arr!15955 a!3235) (index!19893 lt!238539)) (select (arr!15955 a!3235) j!176)))))

(assert (=> b!520785 (and (bvslt (x!48880 lt!238539) #b01111111111111111111111111111110) (or (= (select (arr!15955 a!3235) (index!19893 lt!238539)) (select (arr!15955 a!3235) j!176)) (= (select (arr!15955 a!3235) (index!19893 lt!238539)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15955 a!3235) (index!19893 lt!238539)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520786 () Bool)

(declare-fun res!318674 () Bool)

(assert (=> b!520786 (=> res!318674 e!303891)))

(get-info :version)

(assert (=> b!520786 (= res!318674 (or (undefined!5234 lt!238539) (not ((_ is Intermediate!4422) lt!238539))))))

(declare-fun b!520787 () Bool)

(declare-fun e!303890 () Bool)

(assert (=> b!520787 (= e!303889 e!303890)))

(declare-fun res!318676 () Bool)

(assert (=> b!520787 (=> (not res!318676) (not e!303890))))

(declare-fun lt!238541 () SeekEntryResult!4422)

(assert (=> b!520787 (= res!318676 (or (= lt!238541 (MissingZero!4422 i!1204)) (= lt!238541 (MissingVacant!4422 i!1204))))))

(assert (=> b!520787 (= lt!238541 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520788 () Bool)

(declare-fun Unit!16143 () Unit!16140)

(assert (=> b!520788 (= e!303887 Unit!16143)))

(declare-fun b!520789 () Bool)

(assert (=> b!520789 (= e!303890 (not e!303891))))

(declare-fun res!318677 () Bool)

(assert (=> b!520789 (=> res!318677 e!303891)))

(declare-fun lt!238536 () (_ BitVec 32))

(assert (=> b!520789 (= res!318677 (= lt!238539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238536 lt!238538 lt!238543 mask!3524)))))

(assert (=> b!520789 (= lt!238539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238537 (select (arr!15955 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520789 (= lt!238536 (toIndex!0 lt!238538 mask!3524))))

(assert (=> b!520789 (= lt!238538 (select (store (arr!15955 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520789 (= lt!238537 (toIndex!0 (select (arr!15955 a!3235) j!176) mask!3524))))

(assert (=> b!520789 (= lt!238543 (array!33199 (store (arr!15955 a!3235) i!1204 k0!2280) (size!16319 a!3235)))))

(assert (=> b!520789 e!303886))

(declare-fun res!318679 () Bool)

(assert (=> b!520789 (=> (not res!318679) (not e!303886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33198 (_ BitVec 32)) Bool)

(assert (=> b!520789 (= res!318679 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238540 () Unit!16140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16140)

(assert (=> b!520789 (= lt!238540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520790 () Bool)

(declare-fun res!318672 () Bool)

(assert (=> b!520790 (=> (not res!318672) (not e!303889))))

(assert (=> b!520790 (= res!318672 (validKeyInArray!0 k0!2280))))

(declare-fun b!520791 () Bool)

(assert (=> b!520791 (= e!303885 false)))

(declare-fun b!520792 () Bool)

(declare-fun res!318683 () Bool)

(assert (=> b!520792 (=> (not res!318683) (not e!303890))))

(assert (=> b!520792 (= res!318683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520793 () Bool)

(declare-fun res!318678 () Bool)

(assert (=> b!520793 (=> (not res!318678) (not e!303890))))

(declare-datatypes ((List!10113 0))(
  ( (Nil!10110) (Cons!10109 (h!11031 (_ BitVec 64)) (t!16341 List!10113)) )
))
(declare-fun arrayNoDuplicates!0 (array!33198 (_ BitVec 32) List!10113) Bool)

(assert (=> b!520793 (= res!318678 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10110))))

(assert (= (and start!47372 res!318673) b!520784))

(assert (= (and b!520784 res!318682) b!520783))

(assert (= (and b!520783 res!318675) b!520790))

(assert (= (and b!520790 res!318672) b!520782))

(assert (= (and b!520782 res!318680) b!520787))

(assert (= (and b!520787 res!318676) b!520792))

(assert (= (and b!520792 res!318683) b!520793))

(assert (= (and b!520793 res!318678) b!520789))

(assert (= (and b!520789 res!318679) b!520780))

(assert (= (and b!520789 (not res!318677)) b!520786))

(assert (= (and b!520786 (not res!318674)) b!520785))

(assert (= (and b!520785 c!61355) b!520781))

(assert (= (and b!520785 (not c!61355)) b!520788))

(assert (= (and b!520781 res!318681) b!520791))

(declare-fun m!501693 () Bool)

(assert (=> start!47372 m!501693))

(declare-fun m!501695 () Bool)

(assert (=> start!47372 m!501695))

(declare-fun m!501697 () Bool)

(assert (=> b!520783 m!501697))

(assert (=> b!520783 m!501697))

(declare-fun m!501699 () Bool)

(assert (=> b!520783 m!501699))

(declare-fun m!501701 () Bool)

(assert (=> b!520782 m!501701))

(declare-fun m!501703 () Bool)

(assert (=> b!520781 m!501703))

(declare-fun m!501705 () Bool)

(assert (=> b!520781 m!501705))

(declare-fun m!501707 () Bool)

(assert (=> b!520787 m!501707))

(declare-fun m!501709 () Bool)

(assert (=> b!520790 m!501709))

(declare-fun m!501711 () Bool)

(assert (=> b!520789 m!501711))

(declare-fun m!501713 () Bool)

(assert (=> b!520789 m!501713))

(declare-fun m!501715 () Bool)

(assert (=> b!520789 m!501715))

(declare-fun m!501717 () Bool)

(assert (=> b!520789 m!501717))

(declare-fun m!501719 () Bool)

(assert (=> b!520789 m!501719))

(assert (=> b!520789 m!501697))

(declare-fun m!501721 () Bool)

(assert (=> b!520789 m!501721))

(assert (=> b!520789 m!501697))

(declare-fun m!501723 () Bool)

(assert (=> b!520789 m!501723))

(assert (=> b!520789 m!501697))

(declare-fun m!501725 () Bool)

(assert (=> b!520789 m!501725))

(declare-fun m!501727 () Bool)

(assert (=> b!520785 m!501727))

(assert (=> b!520785 m!501697))

(declare-fun m!501729 () Bool)

(assert (=> b!520793 m!501729))

(assert (=> b!520780 m!501697))

(assert (=> b!520780 m!501697))

(declare-fun m!501731 () Bool)

(assert (=> b!520780 m!501731))

(declare-fun m!501733 () Bool)

(assert (=> b!520792 m!501733))

(check-sat (not b!520782) (not b!520783) (not b!520792) (not b!520780) (not b!520789) (not start!47372) (not b!520793) (not b!520787) (not b!520790) (not b!520781))
(check-sat)
