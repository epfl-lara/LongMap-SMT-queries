; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47770 () Bool)

(assert start!47770)

(declare-fun res!322664 () Bool)

(declare-fun e!306628 () Bool)

(assert (=> start!47770 (=> (not res!322664) (not e!306628))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47770 (= res!322664 (validMask!0 mask!3524))))

(assert (=> start!47770 e!306628))

(assert (=> start!47770 true))

(declare-datatypes ((array!33407 0))(
  ( (array!33408 (arr!16055 (Array (_ BitVec 32) (_ BitVec 64))) (size!16419 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33407)

(declare-fun array_inv!11851 (array!33407) Bool)

(assert (=> start!47770 (array_inv!11851 a!3235)))

(declare-fun b!525970 () Bool)

(declare-fun e!306625 () Bool)

(assert (=> b!525970 (= e!306628 e!306625)))

(declare-fun res!322668 () Bool)

(assert (=> b!525970 (=> (not res!322668) (not e!306625))))

(declare-datatypes ((SeekEntryResult!4522 0))(
  ( (MissingZero!4522 (index!20300 (_ BitVec 32))) (Found!4522 (index!20301 (_ BitVec 32))) (Intermediate!4522 (undefined!5334 Bool) (index!20302 (_ BitVec 32)) (x!49271 (_ BitVec 32))) (Undefined!4522) (MissingVacant!4522 (index!20303 (_ BitVec 32))) )
))
(declare-fun lt!241777 () SeekEntryResult!4522)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525970 (= res!322668 (or (= lt!241777 (MissingZero!4522 i!1204)) (= lt!241777 (MissingVacant!4522 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33407 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!525970 (= lt!241777 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525971 () Bool)

(declare-fun e!306629 () Bool)

(assert (=> b!525971 (= e!306625 (not e!306629))))

(declare-fun res!322662 () Bool)

(assert (=> b!525971 (=> res!322662 e!306629)))

(declare-fun lt!241783 () (_ BitVec 64))

(declare-fun lt!241775 () array!33407)

(declare-fun lt!241776 () (_ BitVec 32))

(declare-fun lt!241781 () SeekEntryResult!4522)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33407 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!525971 (= res!322662 (= lt!241781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241776 lt!241783 lt!241775 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241774 () (_ BitVec 32))

(assert (=> b!525971 (= lt!241781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241774 (select (arr!16055 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525971 (= lt!241776 (toIndex!0 lt!241783 mask!3524))))

(assert (=> b!525971 (= lt!241783 (select (store (arr!16055 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525971 (= lt!241774 (toIndex!0 (select (arr!16055 a!3235) j!176) mask!3524))))

(assert (=> b!525971 (= lt!241775 (array!33408 (store (arr!16055 a!3235) i!1204 k!2280) (size!16419 a!3235)))))

(declare-fun e!306627 () Bool)

(assert (=> b!525971 e!306627))

(declare-fun res!322669 () Bool)

(assert (=> b!525971 (=> (not res!322669) (not e!306627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33407 (_ BitVec 32)) Bool)

(assert (=> b!525971 (= res!322669 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16540 0))(
  ( (Unit!16541) )
))
(declare-fun lt!241782 () Unit!16540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16540)

(assert (=> b!525971 (= lt!241782 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525972 () Bool)

(declare-fun res!322660 () Bool)

(assert (=> b!525972 (=> (not res!322660) (not e!306625))))

(assert (=> b!525972 (= res!322660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525973 () Bool)

(declare-fun res!322666 () Bool)

(assert (=> b!525973 (=> (not res!322666) (not e!306628))))

(assert (=> b!525973 (= res!322666 (and (= (size!16419 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16419 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16419 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525974 () Bool)

(declare-fun e!306630 () Unit!16540)

(declare-fun Unit!16542 () Unit!16540)

(assert (=> b!525974 (= e!306630 Unit!16542)))

(declare-fun b!525975 () Bool)

(declare-fun res!322659 () Bool)

(assert (=> b!525975 (=> (not res!322659) (not e!306625))))

(declare-datatypes ((List!10213 0))(
  ( (Nil!10210) (Cons!10209 (h!11140 (_ BitVec 64)) (t!16441 List!10213)) )
))
(declare-fun arrayNoDuplicates!0 (array!33407 (_ BitVec 32) List!10213) Bool)

(assert (=> b!525975 (= res!322659 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10210))))

(declare-fun b!525976 () Bool)

(declare-fun res!322661 () Bool)

(assert (=> b!525976 (=> (not res!322661) (not e!306628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525976 (= res!322661 (validKeyInArray!0 (select (arr!16055 a!3235) j!176)))))

(declare-fun b!525977 () Bool)

(assert (=> b!525977 (= e!306629 true)))

(assert (=> b!525977 (= (index!20302 lt!241781) i!1204)))

(declare-fun lt!241779 () Unit!16540)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16540)

(assert (=> b!525977 (= lt!241779 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241774 #b00000000000000000000000000000000 (index!20302 lt!241781) (x!49271 lt!241781) mask!3524))))

(assert (=> b!525977 (and (or (= (select (arr!16055 a!3235) (index!20302 lt!241781)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16055 a!3235) (index!20302 lt!241781)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16055 a!3235) (index!20302 lt!241781)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16055 a!3235) (index!20302 lt!241781)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241778 () Unit!16540)

(assert (=> b!525977 (= lt!241778 e!306630)))

(declare-fun c!61961 () Bool)

(assert (=> b!525977 (= c!61961 (= (select (arr!16055 a!3235) (index!20302 lt!241781)) (select (arr!16055 a!3235) j!176)))))

(assert (=> b!525977 (and (bvslt (x!49271 lt!241781) #b01111111111111111111111111111110) (or (= (select (arr!16055 a!3235) (index!20302 lt!241781)) (select (arr!16055 a!3235) j!176)) (= (select (arr!16055 a!3235) (index!20302 lt!241781)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16055 a!3235) (index!20302 lt!241781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525978 () Bool)

(declare-fun e!306626 () Bool)

(assert (=> b!525978 (= e!306626 false)))

(declare-fun b!525979 () Bool)

(declare-fun Unit!16543 () Unit!16540)

(assert (=> b!525979 (= e!306630 Unit!16543)))

(declare-fun lt!241780 () Unit!16540)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16540)

(assert (=> b!525979 (= lt!241780 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241774 #b00000000000000000000000000000000 (index!20302 lt!241781) (x!49271 lt!241781) mask!3524))))

(declare-fun res!322670 () Bool)

(assert (=> b!525979 (= res!322670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241774 lt!241783 lt!241775 mask!3524) (Intermediate!4522 false (index!20302 lt!241781) (x!49271 lt!241781))))))

(assert (=> b!525979 (=> (not res!322670) (not e!306626))))

(assert (=> b!525979 e!306626))

(declare-fun b!525980 () Bool)

(assert (=> b!525980 (= e!306627 (= (seekEntryOrOpen!0 (select (arr!16055 a!3235) j!176) a!3235 mask!3524) (Found!4522 j!176)))))

(declare-fun b!525981 () Bool)

(declare-fun res!322663 () Bool)

(assert (=> b!525981 (=> res!322663 e!306629)))

(assert (=> b!525981 (= res!322663 (or (undefined!5334 lt!241781) (not (is-Intermediate!4522 lt!241781))))))

(declare-fun b!525982 () Bool)

(declare-fun res!322667 () Bool)

(assert (=> b!525982 (=> (not res!322667) (not e!306628))))

(declare-fun arrayContainsKey!0 (array!33407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525982 (= res!322667 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525983 () Bool)

(declare-fun res!322665 () Bool)

(assert (=> b!525983 (=> (not res!322665) (not e!306628))))

(assert (=> b!525983 (= res!322665 (validKeyInArray!0 k!2280))))

(assert (= (and start!47770 res!322664) b!525973))

(assert (= (and b!525973 res!322666) b!525976))

(assert (= (and b!525976 res!322661) b!525983))

(assert (= (and b!525983 res!322665) b!525982))

(assert (= (and b!525982 res!322667) b!525970))

(assert (= (and b!525970 res!322668) b!525972))

(assert (= (and b!525972 res!322660) b!525975))

(assert (= (and b!525975 res!322659) b!525971))

(assert (= (and b!525971 res!322669) b!525980))

(assert (= (and b!525971 (not res!322662)) b!525981))

(assert (= (and b!525981 (not res!322663)) b!525977))

(assert (= (and b!525977 c!61961) b!525979))

(assert (= (and b!525977 (not c!61961)) b!525974))

(assert (= (and b!525979 res!322670) b!525978))

(declare-fun m!506653 () Bool)

(assert (=> b!525977 m!506653))

(declare-fun m!506655 () Bool)

(assert (=> b!525977 m!506655))

(declare-fun m!506657 () Bool)

(assert (=> b!525977 m!506657))

(declare-fun m!506659 () Bool)

(assert (=> b!525970 m!506659))

(declare-fun m!506661 () Bool)

(assert (=> b!525979 m!506661))

(declare-fun m!506663 () Bool)

(assert (=> b!525979 m!506663))

(declare-fun m!506665 () Bool)

(assert (=> b!525972 m!506665))

(declare-fun m!506667 () Bool)

(assert (=> b!525971 m!506667))

(declare-fun m!506669 () Bool)

(assert (=> b!525971 m!506669))

(declare-fun m!506671 () Bool)

(assert (=> b!525971 m!506671))

(declare-fun m!506673 () Bool)

(assert (=> b!525971 m!506673))

(assert (=> b!525971 m!506657))

(declare-fun m!506675 () Bool)

(assert (=> b!525971 m!506675))

(assert (=> b!525971 m!506657))

(declare-fun m!506677 () Bool)

(assert (=> b!525971 m!506677))

(assert (=> b!525971 m!506657))

(declare-fun m!506679 () Bool)

(assert (=> b!525971 m!506679))

(declare-fun m!506681 () Bool)

(assert (=> b!525971 m!506681))

(assert (=> b!525980 m!506657))

(assert (=> b!525980 m!506657))

(declare-fun m!506683 () Bool)

(assert (=> b!525980 m!506683))

(declare-fun m!506685 () Bool)

(assert (=> b!525983 m!506685))

(declare-fun m!506687 () Bool)

(assert (=> b!525982 m!506687))

(declare-fun m!506689 () Bool)

(assert (=> start!47770 m!506689))

(declare-fun m!506691 () Bool)

(assert (=> start!47770 m!506691))

(assert (=> b!525976 m!506657))

(assert (=> b!525976 m!506657))

(declare-fun m!506693 () Bool)

(assert (=> b!525976 m!506693))

(declare-fun m!506695 () Bool)

(assert (=> b!525975 m!506695))

(push 1)

