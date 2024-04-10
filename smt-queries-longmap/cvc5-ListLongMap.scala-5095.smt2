; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69176 () Bool)

(assert start!69176)

(declare-fun b!806735 () Bool)

(declare-fun res!550865 () Bool)

(declare-fun e!446727 () Bool)

(assert (=> b!806735 (=> (not res!550865) (not e!446727))))

(declare-datatypes ((array!43876 0))(
  ( (array!43877 (arr!21015 (Array (_ BitVec 32) (_ BitVec 64))) (size!21436 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43876)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43876 (_ BitVec 32)) Bool)

(assert (=> b!806735 (= res!550865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806736 () Bool)

(declare-fun e!446725 () Bool)

(assert (=> b!806736 (= e!446727 e!446725)))

(declare-fun res!550860 () Bool)

(assert (=> b!806736 (=> (not res!550860) (not e!446725))))

(declare-datatypes ((SeekEntryResult!8606 0))(
  ( (MissingZero!8606 (index!36792 (_ BitVec 32))) (Found!8606 (index!36793 (_ BitVec 32))) (Intermediate!8606 (undefined!9418 Bool) (index!36794 (_ BitVec 32)) (x!67610 (_ BitVec 32))) (Undefined!8606) (MissingVacant!8606 (index!36795 (_ BitVec 32))) )
))
(declare-fun lt!361328 () SeekEntryResult!8606)

(declare-fun lt!361329 () SeekEntryResult!8606)

(assert (=> b!806736 (= res!550860 (= lt!361328 lt!361329))))

(declare-fun lt!361327 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361331 () array!43876)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43876 (_ BitVec 32)) SeekEntryResult!8606)

(assert (=> b!806736 (= lt!361329 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361327 lt!361331 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43876 (_ BitVec 32)) SeekEntryResult!8606)

(assert (=> b!806736 (= lt!361328 (seekEntryOrOpen!0 lt!361327 lt!361331 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806736 (= lt!361327 (select (store (arr!21015 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806736 (= lt!361331 (array!43877 (store (arr!21015 a!3170) i!1163 k!2044) (size!21436 a!3170)))))

(declare-fun b!806737 () Bool)

(declare-fun e!446726 () Bool)

(assert (=> b!806737 (= e!446725 e!446726)))

(declare-fun res!550858 () Bool)

(assert (=> b!806737 (=> (not res!550858) (not e!446726))))

(declare-fun lt!361330 () SeekEntryResult!8606)

(declare-fun lt!361325 () SeekEntryResult!8606)

(assert (=> b!806737 (= res!550858 (and (= lt!361325 lt!361330) (= lt!361330 (Found!8606 j!153)) (= (select (arr!21015 a!3170) index!1236) (select (arr!21015 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806737 (= lt!361330 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21015 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806737 (= lt!361325 (seekEntryOrOpen!0 (select (arr!21015 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806738 () Bool)

(declare-fun res!550866 () Bool)

(assert (=> b!806738 (=> (not res!550866) (not e!446727))))

(assert (=> b!806738 (= res!550866 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21436 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21015 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21436 a!3170)) (= (select (arr!21015 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806739 () Bool)

(declare-fun res!550861 () Bool)

(declare-fun e!446729 () Bool)

(assert (=> b!806739 (=> (not res!550861) (not e!446729))))

(assert (=> b!806739 (= res!550861 (and (= (size!21436 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21436 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21436 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806740 () Bool)

(assert (=> b!806740 (= e!446729 e!446727)))

(declare-fun res!550859 () Bool)

(assert (=> b!806740 (=> (not res!550859) (not e!446727))))

(declare-fun lt!361326 () SeekEntryResult!8606)

(assert (=> b!806740 (= res!550859 (or (= lt!361326 (MissingZero!8606 i!1163)) (= lt!361326 (MissingVacant!8606 i!1163))))))

(assert (=> b!806740 (= lt!361326 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!550863 () Bool)

(assert (=> start!69176 (=> (not res!550863) (not e!446729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69176 (= res!550863 (validMask!0 mask!3266))))

(assert (=> start!69176 e!446729))

(assert (=> start!69176 true))

(declare-fun array_inv!16811 (array!43876) Bool)

(assert (=> start!69176 (array_inv!16811 a!3170)))

(declare-fun b!806741 () Bool)

(assert (=> b!806741 (= e!446726 (not true))))

(assert (=> b!806741 (= lt!361329 (Found!8606 index!1236))))

(declare-fun b!806742 () Bool)

(declare-fun res!550868 () Bool)

(assert (=> b!806742 (=> (not res!550868) (not e!446729))))

(declare-fun arrayContainsKey!0 (array!43876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806742 (= res!550868 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806743 () Bool)

(declare-fun res!550862 () Bool)

(assert (=> b!806743 (=> (not res!550862) (not e!446727))))

(declare-datatypes ((List!14978 0))(
  ( (Nil!14975) (Cons!14974 (h!16103 (_ BitVec 64)) (t!21293 List!14978)) )
))
(declare-fun arrayNoDuplicates!0 (array!43876 (_ BitVec 32) List!14978) Bool)

(assert (=> b!806743 (= res!550862 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14975))))

(declare-fun b!806744 () Bool)

(declare-fun res!550864 () Bool)

(assert (=> b!806744 (=> (not res!550864) (not e!446729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806744 (= res!550864 (validKeyInArray!0 (select (arr!21015 a!3170) j!153)))))

(declare-fun b!806745 () Bool)

(declare-fun res!550867 () Bool)

(assert (=> b!806745 (=> (not res!550867) (not e!446729))))

(assert (=> b!806745 (= res!550867 (validKeyInArray!0 k!2044))))

(assert (= (and start!69176 res!550863) b!806739))

(assert (= (and b!806739 res!550861) b!806744))

(assert (= (and b!806744 res!550864) b!806745))

(assert (= (and b!806745 res!550867) b!806742))

(assert (= (and b!806742 res!550868) b!806740))

(assert (= (and b!806740 res!550859) b!806735))

(assert (= (and b!806735 res!550865) b!806743))

(assert (= (and b!806743 res!550862) b!806738))

(assert (= (and b!806738 res!550866) b!806736))

(assert (= (and b!806736 res!550860) b!806737))

(assert (= (and b!806737 res!550858) b!806741))

(declare-fun m!748685 () Bool)

(assert (=> b!806745 m!748685))

(declare-fun m!748687 () Bool)

(assert (=> b!806742 m!748687))

(declare-fun m!748689 () Bool)

(assert (=> b!806735 m!748689))

(declare-fun m!748691 () Bool)

(assert (=> b!806743 m!748691))

(declare-fun m!748693 () Bool)

(assert (=> b!806738 m!748693))

(declare-fun m!748695 () Bool)

(assert (=> b!806738 m!748695))

(declare-fun m!748697 () Bool)

(assert (=> start!69176 m!748697))

(declare-fun m!748699 () Bool)

(assert (=> start!69176 m!748699))

(declare-fun m!748701 () Bool)

(assert (=> b!806744 m!748701))

(assert (=> b!806744 m!748701))

(declare-fun m!748703 () Bool)

(assert (=> b!806744 m!748703))

(declare-fun m!748705 () Bool)

(assert (=> b!806736 m!748705))

(declare-fun m!748707 () Bool)

(assert (=> b!806736 m!748707))

(declare-fun m!748709 () Bool)

(assert (=> b!806736 m!748709))

(declare-fun m!748711 () Bool)

(assert (=> b!806736 m!748711))

(declare-fun m!748713 () Bool)

(assert (=> b!806740 m!748713))

(declare-fun m!748715 () Bool)

(assert (=> b!806737 m!748715))

(assert (=> b!806737 m!748701))

(assert (=> b!806737 m!748701))

(declare-fun m!748717 () Bool)

(assert (=> b!806737 m!748717))

(assert (=> b!806737 m!748701))

(declare-fun m!748719 () Bool)

(assert (=> b!806737 m!748719))

(push 1)

