; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47702 () Bool)

(assert start!47702)

(declare-fun b!524692 () Bool)

(declare-fun e!305976 () Bool)

(declare-fun e!305978 () Bool)

(assert (=> b!524692 (= e!305976 e!305978)))

(declare-fun res!321616 () Bool)

(assert (=> b!524692 (=> (not res!321616) (not e!305978))))

(declare-datatypes ((SeekEntryResult!4444 0))(
  ( (MissingZero!4444 (index!19988 (_ BitVec 32))) (Found!4444 (index!19989 (_ BitVec 32))) (Intermediate!4444 (undefined!5256 Bool) (index!19990 (_ BitVec 32)) (x!49118 (_ BitVec 32))) (Undefined!4444) (MissingVacant!4444 (index!19991 (_ BitVec 32))) )
))
(declare-fun lt!240924 () SeekEntryResult!4444)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524692 (= res!321616 (or (= lt!240924 (MissingZero!4444 i!1204)) (= lt!240924 (MissingVacant!4444 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33340 0))(
  ( (array!33341 (arr!16021 (Array (_ BitVec 32) (_ BitVec 64))) (size!16385 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33340)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33340 (_ BitVec 32)) SeekEntryResult!4444)

(assert (=> b!524692 (= lt!240924 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524693 () Bool)

(declare-fun e!305981 () Bool)

(assert (=> b!524693 (= e!305981 true)))

(declare-fun lt!240916 () SeekEntryResult!4444)

(assert (=> b!524693 (= (index!19990 lt!240916) i!1204)))

(declare-fun lt!240918 () (_ BitVec 32))

(declare-datatypes ((Unit!16387 0))(
  ( (Unit!16388) )
))
(declare-fun lt!240925 () Unit!16387)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33340 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16387)

(assert (=> b!524693 (= lt!240925 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!240918 #b00000000000000000000000000000000 (index!19990 lt!240916) (x!49118 lt!240916) mask!3524))))

(assert (=> b!524693 (and (or (= (select (arr!16021 a!3235) (index!19990 lt!240916)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16021 a!3235) (index!19990 lt!240916)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16021 a!3235) (index!19990 lt!240916)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16021 a!3235) (index!19990 lt!240916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240919 () Unit!16387)

(declare-fun e!305979 () Unit!16387)

(assert (=> b!524693 (= lt!240919 e!305979)))

(declare-fun c!61847 () Bool)

(assert (=> b!524693 (= c!61847 (= (select (arr!16021 a!3235) (index!19990 lt!240916)) (select (arr!16021 a!3235) j!176)))))

(assert (=> b!524693 (and (bvslt (x!49118 lt!240916) #b01111111111111111111111111111110) (or (= (select (arr!16021 a!3235) (index!19990 lt!240916)) (select (arr!16021 a!3235) j!176)) (= (select (arr!16021 a!3235) (index!19990 lt!240916)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16021 a!3235) (index!19990 lt!240916)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524694 () Bool)

(assert (=> b!524694 (= e!305978 (not e!305981))))

(declare-fun res!321618 () Bool)

(assert (=> b!524694 (=> res!321618 e!305981)))

(declare-fun lt!240920 () array!33340)

(declare-fun lt!240923 () (_ BitVec 64))

(declare-fun lt!240922 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33340 (_ BitVec 32)) SeekEntryResult!4444)

(assert (=> b!524694 (= res!321618 (= lt!240916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240922 lt!240923 lt!240920 mask!3524)))))

(assert (=> b!524694 (= lt!240916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240918 (select (arr!16021 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524694 (= lt!240922 (toIndex!0 lt!240923 mask!3524))))

(assert (=> b!524694 (= lt!240923 (select (store (arr!16021 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524694 (= lt!240918 (toIndex!0 (select (arr!16021 a!3235) j!176) mask!3524))))

(assert (=> b!524694 (= lt!240920 (array!33341 (store (arr!16021 a!3235) i!1204 k0!2280) (size!16385 a!3235)))))

(declare-fun e!305982 () Bool)

(assert (=> b!524694 e!305982))

(declare-fun res!321615 () Bool)

(assert (=> b!524694 (=> (not res!321615) (not e!305982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33340 (_ BitVec 32)) Bool)

(assert (=> b!524694 (= res!321615 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240917 () Unit!16387)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16387)

(assert (=> b!524694 (= lt!240917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524695 () Bool)

(declare-fun res!321612 () Bool)

(assert (=> b!524695 (=> (not res!321612) (not e!305976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524695 (= res!321612 (validKeyInArray!0 (select (arr!16021 a!3235) j!176)))))

(declare-fun b!524696 () Bool)

(declare-fun Unit!16389 () Unit!16387)

(assert (=> b!524696 (= e!305979 Unit!16389)))

(declare-fun b!524697 () Bool)

(assert (=> b!524697 (= e!305982 (= (seekEntryOrOpen!0 (select (arr!16021 a!3235) j!176) a!3235 mask!3524) (Found!4444 j!176)))))

(declare-fun b!524698 () Bool)

(declare-fun res!321613 () Bool)

(assert (=> b!524698 (=> (not res!321613) (not e!305976))))

(assert (=> b!524698 (= res!321613 (and (= (size!16385 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16385 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16385 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524699 () Bool)

(declare-fun Unit!16390 () Unit!16387)

(assert (=> b!524699 (= e!305979 Unit!16390)))

(declare-fun lt!240921 () Unit!16387)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33340 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16387)

(assert (=> b!524699 (= lt!240921 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240918 #b00000000000000000000000000000000 (index!19990 lt!240916) (x!49118 lt!240916) mask!3524))))

(declare-fun res!321609 () Bool)

(assert (=> b!524699 (= res!321609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240918 lt!240923 lt!240920 mask!3524) (Intermediate!4444 false (index!19990 lt!240916) (x!49118 lt!240916))))))

(declare-fun e!305977 () Bool)

(assert (=> b!524699 (=> (not res!321609) (not e!305977))))

(assert (=> b!524699 e!305977))

(declare-fun res!321619 () Bool)

(assert (=> start!47702 (=> (not res!321619) (not e!305976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47702 (= res!321619 (validMask!0 mask!3524))))

(assert (=> start!47702 e!305976))

(assert (=> start!47702 true))

(declare-fun array_inv!11880 (array!33340) Bool)

(assert (=> start!47702 (array_inv!11880 a!3235)))

(declare-fun b!524691 () Bool)

(declare-fun res!321617 () Bool)

(assert (=> b!524691 (=> (not res!321617) (not e!305978))))

(assert (=> b!524691 (= res!321617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524700 () Bool)

(declare-fun res!321610 () Bool)

(assert (=> b!524700 (=> (not res!321610) (not e!305978))))

(declare-datatypes ((List!10086 0))(
  ( (Nil!10083) (Cons!10082 (h!11013 (_ BitVec 64)) (t!16306 List!10086)) )
))
(declare-fun arrayNoDuplicates!0 (array!33340 (_ BitVec 32) List!10086) Bool)

(assert (=> b!524700 (= res!321610 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10083))))

(declare-fun b!524701 () Bool)

(declare-fun res!321611 () Bool)

(assert (=> b!524701 (=> (not res!321611) (not e!305976))))

(declare-fun arrayContainsKey!0 (array!33340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524701 (= res!321611 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524702 () Bool)

(declare-fun res!321614 () Bool)

(assert (=> b!524702 (=> res!321614 e!305981)))

(get-info :version)

(assert (=> b!524702 (= res!321614 (or (undefined!5256 lt!240916) (not ((_ is Intermediate!4444) lt!240916))))))

(declare-fun b!524703 () Bool)

(assert (=> b!524703 (= e!305977 false)))

(declare-fun b!524704 () Bool)

(declare-fun res!321608 () Bool)

(assert (=> b!524704 (=> (not res!321608) (not e!305976))))

(assert (=> b!524704 (= res!321608 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47702 res!321619) b!524698))

(assert (= (and b!524698 res!321613) b!524695))

(assert (= (and b!524695 res!321612) b!524704))

(assert (= (and b!524704 res!321608) b!524701))

(assert (= (and b!524701 res!321611) b!524692))

(assert (= (and b!524692 res!321616) b!524691))

(assert (= (and b!524691 res!321617) b!524700))

(assert (= (and b!524700 res!321610) b!524694))

(assert (= (and b!524694 res!321615) b!524697))

(assert (= (and b!524694 (not res!321618)) b!524702))

(assert (= (and b!524702 (not res!321614)) b!524693))

(assert (= (and b!524693 c!61847) b!524699))

(assert (= (and b!524693 (not c!61847)) b!524696))

(assert (= (and b!524699 res!321609) b!524703))

(declare-fun m!505561 () Bool)

(assert (=> b!524699 m!505561))

(declare-fun m!505563 () Bool)

(assert (=> b!524699 m!505563))

(declare-fun m!505565 () Bool)

(assert (=> b!524704 m!505565))

(declare-fun m!505567 () Bool)

(assert (=> b!524700 m!505567))

(declare-fun m!505569 () Bool)

(assert (=> b!524697 m!505569))

(assert (=> b!524697 m!505569))

(declare-fun m!505571 () Bool)

(assert (=> b!524697 m!505571))

(declare-fun m!505573 () Bool)

(assert (=> b!524692 m!505573))

(declare-fun m!505575 () Bool)

(assert (=> b!524691 m!505575))

(declare-fun m!505577 () Bool)

(assert (=> b!524701 m!505577))

(declare-fun m!505579 () Bool)

(assert (=> start!47702 m!505579))

(declare-fun m!505581 () Bool)

(assert (=> start!47702 m!505581))

(assert (=> b!524695 m!505569))

(assert (=> b!524695 m!505569))

(declare-fun m!505583 () Bool)

(assert (=> b!524695 m!505583))

(declare-fun m!505585 () Bool)

(assert (=> b!524694 m!505585))

(declare-fun m!505587 () Bool)

(assert (=> b!524694 m!505587))

(declare-fun m!505589 () Bool)

(assert (=> b!524694 m!505589))

(declare-fun m!505591 () Bool)

(assert (=> b!524694 m!505591))

(assert (=> b!524694 m!505569))

(declare-fun m!505593 () Bool)

(assert (=> b!524694 m!505593))

(assert (=> b!524694 m!505569))

(declare-fun m!505595 () Bool)

(assert (=> b!524694 m!505595))

(assert (=> b!524694 m!505569))

(declare-fun m!505597 () Bool)

(assert (=> b!524694 m!505597))

(declare-fun m!505599 () Bool)

(assert (=> b!524694 m!505599))

(declare-fun m!505601 () Bool)

(assert (=> b!524693 m!505601))

(declare-fun m!505603 () Bool)

(assert (=> b!524693 m!505603))

(assert (=> b!524693 m!505569))

(check-sat (not b!524695) (not start!47702) (not b!524704) (not b!524694) (not b!524701) (not b!524693) (not b!524699) (not b!524691) (not b!524700) (not b!524697) (not b!524692))
(check-sat)
