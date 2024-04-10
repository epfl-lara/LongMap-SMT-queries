; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69230 () Bool)

(assert start!69230)

(declare-fun b!807635 () Bool)

(declare-fun res!551759 () Bool)

(declare-fun e!447141 () Bool)

(assert (=> b!807635 (=> (not res!551759) (not e!447141))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43930 0))(
  ( (array!43931 (arr!21042 (Array (_ BitVec 32) (_ BitVec 64))) (size!21463 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43930)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807635 (= res!551759 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21463 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21042 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21463 a!3170)) (= (select (arr!21042 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807636 () Bool)

(declare-fun e!447139 () Bool)

(declare-fun e!447143 () Bool)

(assert (=> b!807636 (= e!447139 e!447143)))

(declare-fun res!551763 () Bool)

(assert (=> b!807636 (=> (not res!551763) (not e!447143))))

(declare-datatypes ((SeekEntryResult!8633 0))(
  ( (MissingZero!8633 (index!36900 (_ BitVec 32))) (Found!8633 (index!36901 (_ BitVec 32))) (Intermediate!8633 (undefined!9445 Bool) (index!36902 (_ BitVec 32)) (x!67709 (_ BitVec 32))) (Undefined!8633) (MissingVacant!8633 (index!36903 (_ BitVec 32))) )
))
(declare-fun lt!361836 () SeekEntryResult!8633)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!361838 () SeekEntryResult!8633)

(assert (=> b!807636 (= res!551763 (and (= lt!361836 lt!361838) (= lt!361838 (Found!8633 j!153)) (not (= (select (arr!21042 a!3170) index!1236) (select (arr!21042 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43930 (_ BitVec 32)) SeekEntryResult!8633)

(assert (=> b!807636 (= lt!361838 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21042 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43930 (_ BitVec 32)) SeekEntryResult!8633)

(assert (=> b!807636 (= lt!361836 (seekEntryOrOpen!0 (select (arr!21042 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807637 () Bool)

(declare-fun res!551764 () Bool)

(declare-fun e!447140 () Bool)

(assert (=> b!807637 (=> (not res!551764) (not e!447140))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807637 (= res!551764 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807638 () Bool)

(declare-fun res!551760 () Bool)

(assert (=> b!807638 (=> (not res!551760) (not e!447140))))

(assert (=> b!807638 (= res!551760 (and (= (size!21463 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21463 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21463 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807639 () Bool)

(declare-fun res!551761 () Bool)

(assert (=> b!807639 (=> (not res!551761) (not e!447140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807639 (= res!551761 (validKeyInArray!0 (select (arr!21042 a!3170) j!153)))))

(declare-fun b!807640 () Bool)

(assert (=> b!807640 (= e!447140 e!447141)))

(declare-fun res!551765 () Bool)

(assert (=> b!807640 (=> (not res!551765) (not e!447141))))

(declare-fun lt!361839 () SeekEntryResult!8633)

(assert (=> b!807640 (= res!551765 (or (= lt!361839 (MissingZero!8633 i!1163)) (= lt!361839 (MissingVacant!8633 i!1163))))))

(assert (=> b!807640 (= lt!361839 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!551767 () Bool)

(assert (=> start!69230 (=> (not res!551767) (not e!447140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69230 (= res!551767 (validMask!0 mask!3266))))

(assert (=> start!69230 e!447140))

(assert (=> start!69230 true))

(declare-fun array_inv!16838 (array!43930) Bool)

(assert (=> start!69230 (array_inv!16838 a!3170)))

(declare-fun b!807641 () Bool)

(declare-fun res!551762 () Bool)

(assert (=> b!807641 (=> (not res!551762) (not e!447140))))

(assert (=> b!807641 (= res!551762 (validKeyInArray!0 k!2044))))

(declare-fun b!807642 () Bool)

(declare-fun res!551768 () Bool)

(assert (=> b!807642 (=> (not res!551768) (not e!447141))))

(declare-datatypes ((List!15005 0))(
  ( (Nil!15002) (Cons!15001 (h!16130 (_ BitVec 64)) (t!21320 List!15005)) )
))
(declare-fun arrayNoDuplicates!0 (array!43930 (_ BitVec 32) List!15005) Bool)

(assert (=> b!807642 (= res!551768 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15002))))

(declare-fun b!807643 () Bool)

(assert (=> b!807643 (= e!447141 e!447139)))

(declare-fun res!551766 () Bool)

(assert (=> b!807643 (=> (not res!551766) (not e!447139))))

(declare-fun lt!361841 () (_ BitVec 64))

(declare-fun lt!361837 () array!43930)

(assert (=> b!807643 (= res!551766 (= (seekEntryOrOpen!0 lt!361841 lt!361837 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361841 lt!361837 mask!3266)))))

(assert (=> b!807643 (= lt!361841 (select (store (arr!21042 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807643 (= lt!361837 (array!43931 (store (arr!21042 a!3170) i!1163 k!2044) (size!21463 a!3170)))))

(declare-fun b!807644 () Bool)

(declare-fun res!551758 () Bool)

(assert (=> b!807644 (=> (not res!551758) (not e!447141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43930 (_ BitVec 32)) Bool)

(assert (=> b!807644 (= res!551758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807645 () Bool)

(assert (=> b!807645 (= e!447143 false)))

(declare-fun lt!361840 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807645 (= lt!361840 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69230 res!551767) b!807638))

(assert (= (and b!807638 res!551760) b!807639))

(assert (= (and b!807639 res!551761) b!807641))

(assert (= (and b!807641 res!551762) b!807637))

(assert (= (and b!807637 res!551764) b!807640))

(assert (= (and b!807640 res!551765) b!807644))

(assert (= (and b!807644 res!551758) b!807642))

(assert (= (and b!807642 res!551768) b!807635))

(assert (= (and b!807635 res!551759) b!807643))

(assert (= (and b!807643 res!551766) b!807636))

(assert (= (and b!807636 res!551763) b!807645))

(declare-fun m!749699 () Bool)

(assert (=> start!69230 m!749699))

(declare-fun m!749701 () Bool)

(assert (=> start!69230 m!749701))

(declare-fun m!749703 () Bool)

(assert (=> b!807643 m!749703))

(declare-fun m!749705 () Bool)

(assert (=> b!807643 m!749705))

(declare-fun m!749707 () Bool)

(assert (=> b!807643 m!749707))

(declare-fun m!749709 () Bool)

(assert (=> b!807643 m!749709))

(declare-fun m!749711 () Bool)

(assert (=> b!807639 m!749711))

(assert (=> b!807639 m!749711))

(declare-fun m!749713 () Bool)

(assert (=> b!807639 m!749713))

(declare-fun m!749715 () Bool)

(assert (=> b!807645 m!749715))

(declare-fun m!749717 () Bool)

(assert (=> b!807644 m!749717))

(declare-fun m!749719 () Bool)

(assert (=> b!807642 m!749719))

(declare-fun m!749721 () Bool)

(assert (=> b!807636 m!749721))

(assert (=> b!807636 m!749711))

(assert (=> b!807636 m!749711))

(declare-fun m!749723 () Bool)

(assert (=> b!807636 m!749723))

(assert (=> b!807636 m!749711))

(declare-fun m!749725 () Bool)

(assert (=> b!807636 m!749725))

(declare-fun m!749727 () Bool)

(assert (=> b!807637 m!749727))

(declare-fun m!749729 () Bool)

(assert (=> b!807640 m!749729))

(declare-fun m!749731 () Bool)

(assert (=> b!807641 m!749731))

(declare-fun m!749733 () Bool)

(assert (=> b!807635 m!749733))

(declare-fun m!749735 () Bool)

(assert (=> b!807635 m!749735))

(push 1)

