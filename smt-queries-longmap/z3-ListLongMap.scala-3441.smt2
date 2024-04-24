; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47756 () Bool)

(assert start!47756)

(declare-fun b!525825 () Bool)

(declare-datatypes ((Unit!16495 0))(
  ( (Unit!16496) )
))
(declare-fun e!306547 () Unit!16495)

(declare-fun Unit!16497 () Unit!16495)

(assert (=> b!525825 (= e!306547 Unit!16497)))

(declare-datatypes ((SeekEntryResult!4471 0))(
  ( (MissingZero!4471 (index!20096 (_ BitVec 32))) (Found!4471 (index!20097 (_ BitVec 32))) (Intermediate!4471 (undefined!5283 Bool) (index!20098 (_ BitVec 32)) (x!49217 (_ BitVec 32))) (Undefined!4471) (MissingVacant!4471 (index!20099 (_ BitVec 32))) )
))
(declare-fun lt!241735 () SeekEntryResult!4471)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33394 0))(
  ( (array!33395 (arr!16048 (Array (_ BitVec 32) (_ BitVec 64))) (size!16412 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33394)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241727 () (_ BitVec 32))

(declare-fun lt!241733 () Unit!16495)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16495)

(assert (=> b!525825 (= lt!241733 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241727 #b00000000000000000000000000000000 (index!20098 lt!241735) (x!49217 lt!241735) mask!3524))))

(declare-fun lt!241730 () array!33394)

(declare-fun lt!241732 () (_ BitVec 64))

(declare-fun res!322588 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33394 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!525825 (= res!322588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241727 lt!241732 lt!241730 mask!3524) (Intermediate!4471 false (index!20098 lt!241735) (x!49217 lt!241735))))))

(declare-fun e!306543 () Bool)

(assert (=> b!525825 (=> (not res!322588) (not e!306543))))

(assert (=> b!525825 e!306543))

(declare-fun b!525826 () Bool)

(declare-fun e!306544 () Bool)

(assert (=> b!525826 (= e!306544 true)))

(assert (=> b!525826 (= (index!20098 lt!241735) i!1204)))

(declare-fun lt!241728 () Unit!16495)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16495)

(assert (=> b!525826 (= lt!241728 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241727 #b00000000000000000000000000000000 (index!20098 lt!241735) (x!49217 lt!241735) mask!3524))))

(assert (=> b!525826 (and (or (= (select (arr!16048 a!3235) (index!20098 lt!241735)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16048 a!3235) (index!20098 lt!241735)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16048 a!3235) (index!20098 lt!241735)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16048 a!3235) (index!20098 lt!241735)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241726 () Unit!16495)

(assert (=> b!525826 (= lt!241726 e!306547)))

(declare-fun c!61928 () Bool)

(assert (=> b!525826 (= c!61928 (= (select (arr!16048 a!3235) (index!20098 lt!241735)) (select (arr!16048 a!3235) j!176)))))

(assert (=> b!525826 (and (bvslt (x!49217 lt!241735) #b01111111111111111111111111111110) (or (= (select (arr!16048 a!3235) (index!20098 lt!241735)) (select (arr!16048 a!3235) j!176)) (= (select (arr!16048 a!3235) (index!20098 lt!241735)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16048 a!3235) (index!20098 lt!241735)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525827 () Bool)

(declare-fun res!322584 () Bool)

(declare-fun e!306548 () Bool)

(assert (=> b!525827 (=> (not res!322584) (not e!306548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525827 (= res!322584 (validKeyInArray!0 k0!2280))))

(declare-fun b!525828 () Bool)

(assert (=> b!525828 (= e!306543 false)))

(declare-fun b!525830 () Bool)

(declare-fun res!322580 () Bool)

(declare-fun e!306549 () Bool)

(assert (=> b!525830 (=> (not res!322580) (not e!306549))))

(declare-datatypes ((List!10113 0))(
  ( (Nil!10110) (Cons!10109 (h!11040 (_ BitVec 64)) (t!16333 List!10113)) )
))
(declare-fun arrayNoDuplicates!0 (array!33394 (_ BitVec 32) List!10113) Bool)

(assert (=> b!525830 (= res!322580 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10110))))

(declare-fun b!525831 () Bool)

(declare-fun Unit!16498 () Unit!16495)

(assert (=> b!525831 (= e!306547 Unit!16498)))

(declare-fun b!525832 () Bool)

(declare-fun res!322585 () Bool)

(assert (=> b!525832 (=> (not res!322585) (not e!306548))))

(assert (=> b!525832 (= res!322585 (and (= (size!16412 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16412 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16412 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525833 () Bool)

(declare-fun res!322587 () Bool)

(assert (=> b!525833 (=> res!322587 e!306544)))

(get-info :version)

(assert (=> b!525833 (= res!322587 (or (undefined!5283 lt!241735) (not ((_ is Intermediate!4471) lt!241735))))))

(declare-fun b!525834 () Bool)

(declare-fun res!322583 () Bool)

(assert (=> b!525834 (=> (not res!322583) (not e!306548))))

(assert (=> b!525834 (= res!322583 (validKeyInArray!0 (select (arr!16048 a!3235) j!176)))))

(declare-fun b!525835 () Bool)

(declare-fun e!306545 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33394 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!525835 (= e!306545 (= (seekEntryOrOpen!0 (select (arr!16048 a!3235) j!176) a!3235 mask!3524) (Found!4471 j!176)))))

(declare-fun b!525836 () Bool)

(declare-fun res!322581 () Bool)

(assert (=> b!525836 (=> (not res!322581) (not e!306549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33394 (_ BitVec 32)) Bool)

(assert (=> b!525836 (= res!322581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525829 () Bool)

(declare-fun res!322586 () Bool)

(assert (=> b!525829 (=> (not res!322586) (not e!306548))))

(declare-fun arrayContainsKey!0 (array!33394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525829 (= res!322586 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!322590 () Bool)

(assert (=> start!47756 (=> (not res!322590) (not e!306548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47756 (= res!322590 (validMask!0 mask!3524))))

(assert (=> start!47756 e!306548))

(assert (=> start!47756 true))

(declare-fun array_inv!11907 (array!33394) Bool)

(assert (=> start!47756 (array_inv!11907 a!3235)))

(declare-fun b!525837 () Bool)

(assert (=> b!525837 (= e!306549 (not e!306544))))

(declare-fun res!322589 () Bool)

(assert (=> b!525837 (=> res!322589 e!306544)))

(declare-fun lt!241731 () (_ BitVec 32))

(assert (=> b!525837 (= res!322589 (= lt!241735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241731 lt!241732 lt!241730 mask!3524)))))

(assert (=> b!525837 (= lt!241735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241727 (select (arr!16048 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525837 (= lt!241731 (toIndex!0 lt!241732 mask!3524))))

(assert (=> b!525837 (= lt!241732 (select (store (arr!16048 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525837 (= lt!241727 (toIndex!0 (select (arr!16048 a!3235) j!176) mask!3524))))

(assert (=> b!525837 (= lt!241730 (array!33395 (store (arr!16048 a!3235) i!1204 k0!2280) (size!16412 a!3235)))))

(assert (=> b!525837 e!306545))

(declare-fun res!322582 () Bool)

(assert (=> b!525837 (=> (not res!322582) (not e!306545))))

(assert (=> b!525837 (= res!322582 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241729 () Unit!16495)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16495)

(assert (=> b!525837 (= lt!241729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525838 () Bool)

(assert (=> b!525838 (= e!306548 e!306549)))

(declare-fun res!322591 () Bool)

(assert (=> b!525838 (=> (not res!322591) (not e!306549))))

(declare-fun lt!241734 () SeekEntryResult!4471)

(assert (=> b!525838 (= res!322591 (or (= lt!241734 (MissingZero!4471 i!1204)) (= lt!241734 (MissingVacant!4471 i!1204))))))

(assert (=> b!525838 (= lt!241734 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47756 res!322590) b!525832))

(assert (= (and b!525832 res!322585) b!525834))

(assert (= (and b!525834 res!322583) b!525827))

(assert (= (and b!525827 res!322584) b!525829))

(assert (= (and b!525829 res!322586) b!525838))

(assert (= (and b!525838 res!322591) b!525836))

(assert (= (and b!525836 res!322581) b!525830))

(assert (= (and b!525830 res!322580) b!525837))

(assert (= (and b!525837 res!322582) b!525835))

(assert (= (and b!525837 (not res!322589)) b!525833))

(assert (= (and b!525833 (not res!322587)) b!525826))

(assert (= (and b!525826 c!61928) b!525825))

(assert (= (and b!525826 (not c!61928)) b!525831))

(assert (= (and b!525825 res!322588) b!525828))

(declare-fun m!506749 () Bool)

(assert (=> b!525827 m!506749))

(declare-fun m!506751 () Bool)

(assert (=> b!525826 m!506751))

(declare-fun m!506753 () Bool)

(assert (=> b!525826 m!506753))

(declare-fun m!506755 () Bool)

(assert (=> b!525826 m!506755))

(declare-fun m!506757 () Bool)

(assert (=> b!525830 m!506757))

(declare-fun m!506759 () Bool)

(assert (=> b!525829 m!506759))

(declare-fun m!506761 () Bool)

(assert (=> b!525838 m!506761))

(assert (=> b!525835 m!506755))

(assert (=> b!525835 m!506755))

(declare-fun m!506763 () Bool)

(assert (=> b!525835 m!506763))

(declare-fun m!506765 () Bool)

(assert (=> start!47756 m!506765))

(declare-fun m!506767 () Bool)

(assert (=> start!47756 m!506767))

(assert (=> b!525834 m!506755))

(assert (=> b!525834 m!506755))

(declare-fun m!506769 () Bool)

(assert (=> b!525834 m!506769))

(declare-fun m!506771 () Bool)

(assert (=> b!525825 m!506771))

(declare-fun m!506773 () Bool)

(assert (=> b!525825 m!506773))

(assert (=> b!525837 m!506755))

(declare-fun m!506775 () Bool)

(assert (=> b!525837 m!506775))

(declare-fun m!506777 () Bool)

(assert (=> b!525837 m!506777))

(declare-fun m!506779 () Bool)

(assert (=> b!525837 m!506779))

(assert (=> b!525837 m!506755))

(declare-fun m!506781 () Bool)

(assert (=> b!525837 m!506781))

(declare-fun m!506783 () Bool)

(assert (=> b!525837 m!506783))

(assert (=> b!525837 m!506755))

(declare-fun m!506785 () Bool)

(assert (=> b!525837 m!506785))

(declare-fun m!506787 () Bool)

(assert (=> b!525837 m!506787))

(declare-fun m!506789 () Bool)

(assert (=> b!525837 m!506789))

(declare-fun m!506791 () Bool)

(assert (=> b!525836 m!506791))

(check-sat (not b!525834) (not b!525827) (not b!525836) (not b!525826) (not b!525835) (not start!47756) (not b!525829) (not b!525837) (not b!525825) (not b!525838) (not b!525830))
(check-sat)
