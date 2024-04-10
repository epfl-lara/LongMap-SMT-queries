; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47374 () Bool)

(assert start!47374)

(declare-fun b!520822 () Bool)

(declare-fun e!303912 () Bool)

(declare-fun e!303909 () Bool)

(assert (=> b!520822 (= e!303912 (not e!303909))))

(declare-fun res!318713 () Bool)

(assert (=> b!520822 (=> res!318713 e!303909)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!238565 () (_ BitVec 32))

(declare-datatypes ((array!33200 0))(
  ( (array!33201 (arr!15956 (Array (_ BitVec 32) (_ BitVec 64))) (size!16320 (_ BitVec 32))) )
))
(declare-fun lt!238562 () array!33200)

(declare-datatypes ((SeekEntryResult!4423 0))(
  ( (MissingZero!4423 (index!19895 (_ BitVec 32))) (Found!4423 (index!19896 (_ BitVec 32))) (Intermediate!4423 (undefined!5235 Bool) (index!19897 (_ BitVec 32)) (x!48881 (_ BitVec 32))) (Undefined!4423) (MissingVacant!4423 (index!19898 (_ BitVec 32))) )
))
(declare-fun lt!238563 () SeekEntryResult!4423)

(declare-fun lt!238568 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33200 (_ BitVec 32)) SeekEntryResult!4423)

(assert (=> b!520822 (= res!318713 (= lt!238563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238565 lt!238568 lt!238562 mask!3524)))))

(declare-fun a!3235 () array!33200)

(declare-fun lt!238566 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520822 (= lt!238563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238566 (select (arr!15956 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520822 (= lt!238565 (toIndex!0 lt!238568 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520822 (= lt!238568 (select (store (arr!15956 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520822 (= lt!238566 (toIndex!0 (select (arr!15956 a!3235) j!176) mask!3524))))

(assert (=> b!520822 (= lt!238562 (array!33201 (store (arr!15956 a!3235) i!1204 k!2280) (size!16320 a!3235)))))

(declare-fun e!303907 () Bool)

(assert (=> b!520822 e!303907))

(declare-fun res!318718 () Bool)

(assert (=> b!520822 (=> (not res!318718) (not e!303907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33200 (_ BitVec 32)) Bool)

(assert (=> b!520822 (= res!318718 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16144 0))(
  ( (Unit!16145) )
))
(declare-fun lt!238567 () Unit!16144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16144)

(assert (=> b!520822 (= lt!238567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520823 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33200 (_ BitVec 32)) SeekEntryResult!4423)

(assert (=> b!520823 (= e!303907 (= (seekEntryOrOpen!0 (select (arr!15956 a!3235) j!176) a!3235 mask!3524) (Found!4423 j!176)))))

(declare-fun b!520824 () Bool)

(declare-fun res!318716 () Bool)

(assert (=> b!520824 (=> (not res!318716) (not e!303912))))

(assert (=> b!520824 (= res!318716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520825 () Bool)

(declare-fun res!318714 () Bool)

(declare-fun e!303911 () Bool)

(assert (=> b!520825 (=> (not res!318714) (not e!303911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520825 (= res!318714 (validKeyInArray!0 (select (arr!15956 a!3235) j!176)))))

(declare-fun b!520827 () Bool)

(declare-fun res!318712 () Bool)

(assert (=> b!520827 (=> res!318712 e!303909)))

(assert (=> b!520827 (= res!318712 (or (undefined!5235 lt!238563) (not (is-Intermediate!4423 lt!238563))))))

(declare-fun b!520828 () Bool)

(declare-fun e!303908 () Unit!16144)

(declare-fun Unit!16146 () Unit!16144)

(assert (=> b!520828 (= e!303908 Unit!16146)))

(declare-fun lt!238564 () Unit!16144)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33200 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16144)

(assert (=> b!520828 (= lt!238564 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238566 #b00000000000000000000000000000000 (index!19897 lt!238563) (x!48881 lt!238563) mask!3524))))

(declare-fun res!318708 () Bool)

(assert (=> b!520828 (= res!318708 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238566 lt!238568 lt!238562 mask!3524) (Intermediate!4423 false (index!19897 lt!238563) (x!48881 lt!238563))))))

(declare-fun e!303910 () Bool)

(assert (=> b!520828 (=> (not res!318708) (not e!303910))))

(assert (=> b!520828 e!303910))

(declare-fun b!520829 () Bool)

(assert (=> b!520829 (= e!303909 (= (select (arr!15956 a!3235) (index!19897 lt!238563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520829 (and (or (= (select (arr!15956 a!3235) (index!19897 lt!238563)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15956 a!3235) (index!19897 lt!238563)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15956 a!3235) (index!19897 lt!238563)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238569 () Unit!16144)

(assert (=> b!520829 (= lt!238569 e!303908)))

(declare-fun c!61358 () Bool)

(assert (=> b!520829 (= c!61358 (= (select (arr!15956 a!3235) (index!19897 lt!238563)) (select (arr!15956 a!3235) j!176)))))

(assert (=> b!520829 (and (bvslt (x!48881 lt!238563) #b01111111111111111111111111111110) (or (= (select (arr!15956 a!3235) (index!19897 lt!238563)) (select (arr!15956 a!3235) j!176)) (= (select (arr!15956 a!3235) (index!19897 lt!238563)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15956 a!3235) (index!19897 lt!238563)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520830 () Bool)

(assert (=> b!520830 (= e!303910 false)))

(declare-fun b!520826 () Bool)

(declare-fun Unit!16147 () Unit!16144)

(assert (=> b!520826 (= e!303908 Unit!16147)))

(declare-fun res!318719 () Bool)

(assert (=> start!47374 (=> (not res!318719) (not e!303911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47374 (= res!318719 (validMask!0 mask!3524))))

(assert (=> start!47374 e!303911))

(assert (=> start!47374 true))

(declare-fun array_inv!11752 (array!33200) Bool)

(assert (=> start!47374 (array_inv!11752 a!3235)))

(declare-fun b!520831 () Bool)

(declare-fun res!318710 () Bool)

(assert (=> b!520831 (=> (not res!318710) (not e!303911))))

(declare-fun arrayContainsKey!0 (array!33200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520831 (= res!318710 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520832 () Bool)

(declare-fun res!318715 () Bool)

(assert (=> b!520832 (=> (not res!318715) (not e!303911))))

(assert (=> b!520832 (= res!318715 (and (= (size!16320 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16320 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16320 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520833 () Bool)

(assert (=> b!520833 (= e!303911 e!303912)))

(declare-fun res!318717 () Bool)

(assert (=> b!520833 (=> (not res!318717) (not e!303912))))

(declare-fun lt!238570 () SeekEntryResult!4423)

(assert (=> b!520833 (= res!318717 (or (= lt!238570 (MissingZero!4423 i!1204)) (= lt!238570 (MissingVacant!4423 i!1204))))))

(assert (=> b!520833 (= lt!238570 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!520834 () Bool)

(declare-fun res!318709 () Bool)

(assert (=> b!520834 (=> (not res!318709) (not e!303912))))

(declare-datatypes ((List!10114 0))(
  ( (Nil!10111) (Cons!10110 (h!11032 (_ BitVec 64)) (t!16342 List!10114)) )
))
(declare-fun arrayNoDuplicates!0 (array!33200 (_ BitVec 32) List!10114) Bool)

(assert (=> b!520834 (= res!318709 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10111))))

(declare-fun b!520835 () Bool)

(declare-fun res!318711 () Bool)

(assert (=> b!520835 (=> (not res!318711) (not e!303911))))

(assert (=> b!520835 (= res!318711 (validKeyInArray!0 k!2280))))

(assert (= (and start!47374 res!318719) b!520832))

(assert (= (and b!520832 res!318715) b!520825))

(assert (= (and b!520825 res!318714) b!520835))

(assert (= (and b!520835 res!318711) b!520831))

(assert (= (and b!520831 res!318710) b!520833))

(assert (= (and b!520833 res!318717) b!520824))

(assert (= (and b!520824 res!318716) b!520834))

(assert (= (and b!520834 res!318709) b!520822))

(assert (= (and b!520822 res!318718) b!520823))

(assert (= (and b!520822 (not res!318713)) b!520827))

(assert (= (and b!520827 (not res!318712)) b!520829))

(assert (= (and b!520829 c!61358) b!520828))

(assert (= (and b!520829 (not c!61358)) b!520826))

(assert (= (and b!520828 res!318708) b!520830))

(declare-fun m!501735 () Bool)

(assert (=> b!520823 m!501735))

(assert (=> b!520823 m!501735))

(declare-fun m!501737 () Bool)

(assert (=> b!520823 m!501737))

(declare-fun m!501739 () Bool)

(assert (=> b!520834 m!501739))

(declare-fun m!501741 () Bool)

(assert (=> b!520833 m!501741))

(assert (=> b!520825 m!501735))

(assert (=> b!520825 m!501735))

(declare-fun m!501743 () Bool)

(assert (=> b!520825 m!501743))

(declare-fun m!501745 () Bool)

(assert (=> start!47374 m!501745))

(declare-fun m!501747 () Bool)

(assert (=> start!47374 m!501747))

(declare-fun m!501749 () Bool)

(assert (=> b!520828 m!501749))

(declare-fun m!501751 () Bool)

(assert (=> b!520828 m!501751))

(declare-fun m!501753 () Bool)

(assert (=> b!520831 m!501753))

(declare-fun m!501755 () Bool)

(assert (=> b!520829 m!501755))

(assert (=> b!520829 m!501735))

(declare-fun m!501757 () Bool)

(assert (=> b!520835 m!501757))

(declare-fun m!501759 () Bool)

(assert (=> b!520824 m!501759))

(declare-fun m!501761 () Bool)

(assert (=> b!520822 m!501761))

(declare-fun m!501763 () Bool)

(assert (=> b!520822 m!501763))

(declare-fun m!501765 () Bool)

(assert (=> b!520822 m!501765))

(assert (=> b!520822 m!501735))

(declare-fun m!501767 () Bool)

(assert (=> b!520822 m!501767))

(assert (=> b!520822 m!501735))

(declare-fun m!501769 () Bool)

(assert (=> b!520822 m!501769))

(assert (=> b!520822 m!501735))

(declare-fun m!501771 () Bool)

(assert (=> b!520822 m!501771))

(declare-fun m!501773 () Bool)

(assert (=> b!520822 m!501773))

(declare-fun m!501775 () Bool)

(assert (=> b!520822 m!501775))

(push 1)

(assert (not b!520822))

(assert (not b!520831))

(assert (not start!47374))

