; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68992 () Bool)

(assert start!68992)

(declare-fun b!804819 () Bool)

(declare-fun e!445802 () Bool)

(declare-fun e!445799 () Bool)

(assert (=> b!804819 (= e!445802 e!445799)))

(declare-fun res!549338 () Bool)

(assert (=> b!804819 (=> (not res!549338) (not e!445799))))

(declare-datatypes ((SeekEntryResult!8562 0))(
  ( (MissingZero!8562 (index!36616 (_ BitVec 32))) (Found!8562 (index!36617 (_ BitVec 32))) (Intermediate!8562 (undefined!9374 Bool) (index!36618 (_ BitVec 32)) (x!67440 (_ BitVec 32))) (Undefined!8562) (MissingVacant!8562 (index!36619 (_ BitVec 32))) )
))
(declare-fun lt!360318 () SeekEntryResult!8562)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804819 (= res!549338 (or (= lt!360318 (MissingZero!8562 i!1163)) (= lt!360318 (MissingVacant!8562 i!1163))))))

(declare-datatypes ((array!43782 0))(
  ( (array!43783 (arr!20971 (Array (_ BitVec 32) (_ BitVec 64))) (size!21392 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43782)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43782 (_ BitVec 32)) SeekEntryResult!8562)

(assert (=> b!804819 (= lt!360318 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804820 () Bool)

(declare-fun res!549339 () Bool)

(assert (=> b!804820 (=> (not res!549339) (not e!445802))))

(declare-fun arrayContainsKey!0 (array!43782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804820 (= res!549339 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804821 () Bool)

(declare-fun e!445801 () Bool)

(assert (=> b!804821 (= e!445799 e!445801)))

(declare-fun res!549344 () Bool)

(assert (=> b!804821 (=> (not res!549344) (not e!445801))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360317 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!360316 () array!43782)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43782 (_ BitVec 32)) SeekEntryResult!8562)

(assert (=> b!804821 (= res!549344 (= (seekEntryOrOpen!0 lt!360317 lt!360316 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360317 lt!360316 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804821 (= lt!360317 (select (store (arr!20971 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804821 (= lt!360316 (array!43783 (store (arr!20971 a!3170) i!1163 k0!2044) (size!21392 a!3170)))))

(declare-fun b!804822 () Bool)

(declare-fun res!549346 () Bool)

(assert (=> b!804822 (=> (not res!549346) (not e!445799))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804822 (= res!549346 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21392 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20971 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21392 a!3170)) (= (select (arr!20971 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804823 () Bool)

(declare-fun res!549345 () Bool)

(assert (=> b!804823 (=> (not res!549345) (not e!445802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804823 (= res!549345 (validKeyInArray!0 k0!2044))))

(declare-fun res!549343 () Bool)

(assert (=> start!68992 (=> (not res!549343) (not e!445802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68992 (= res!549343 (validMask!0 mask!3266))))

(assert (=> start!68992 e!445802))

(assert (=> start!68992 true))

(declare-fun array_inv!16767 (array!43782) Bool)

(assert (=> start!68992 (array_inv!16767 a!3170)))

(declare-fun b!804824 () Bool)

(declare-fun res!549342 () Bool)

(assert (=> b!804824 (=> (not res!549342) (not e!445799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43782 (_ BitVec 32)) Bool)

(assert (=> b!804824 (= res!549342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804825 () Bool)

(declare-fun res!549347 () Bool)

(assert (=> b!804825 (=> (not res!549347) (not e!445802))))

(assert (=> b!804825 (= res!549347 (validKeyInArray!0 (select (arr!20971 a!3170) j!153)))))

(declare-fun b!804826 () Bool)

(declare-fun res!549341 () Bool)

(assert (=> b!804826 (=> (not res!549341) (not e!445802))))

(assert (=> b!804826 (= res!549341 (and (= (size!21392 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21392 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21392 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804827 () Bool)

(assert (=> b!804827 (= e!445801 false)))

(declare-fun lt!360320 () SeekEntryResult!8562)

(assert (=> b!804827 (= lt!360320 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20971 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360319 () SeekEntryResult!8562)

(assert (=> b!804827 (= lt!360319 (seekEntryOrOpen!0 (select (arr!20971 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804828 () Bool)

(declare-fun res!549340 () Bool)

(assert (=> b!804828 (=> (not res!549340) (not e!445799))))

(declare-datatypes ((List!14934 0))(
  ( (Nil!14931) (Cons!14930 (h!16059 (_ BitVec 64)) (t!21249 List!14934)) )
))
(declare-fun arrayNoDuplicates!0 (array!43782 (_ BitVec 32) List!14934) Bool)

(assert (=> b!804828 (= res!549340 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14931))))

(assert (= (and start!68992 res!549343) b!804826))

(assert (= (and b!804826 res!549341) b!804825))

(assert (= (and b!804825 res!549347) b!804823))

(assert (= (and b!804823 res!549345) b!804820))

(assert (= (and b!804820 res!549339) b!804819))

(assert (= (and b!804819 res!549338) b!804824))

(assert (= (and b!804824 res!549342) b!804828))

(assert (= (and b!804828 res!549340) b!804822))

(assert (= (and b!804822 res!549346) b!804821))

(assert (= (and b!804821 res!549344) b!804827))

(declare-fun m!746685 () Bool)

(assert (=> start!68992 m!746685))

(declare-fun m!746687 () Bool)

(assert (=> start!68992 m!746687))

(declare-fun m!746689 () Bool)

(assert (=> b!804819 m!746689))

(declare-fun m!746691 () Bool)

(assert (=> b!804823 m!746691))

(declare-fun m!746693 () Bool)

(assert (=> b!804828 m!746693))

(declare-fun m!746695 () Bool)

(assert (=> b!804825 m!746695))

(assert (=> b!804825 m!746695))

(declare-fun m!746697 () Bool)

(assert (=> b!804825 m!746697))

(assert (=> b!804827 m!746695))

(assert (=> b!804827 m!746695))

(declare-fun m!746699 () Bool)

(assert (=> b!804827 m!746699))

(assert (=> b!804827 m!746695))

(declare-fun m!746701 () Bool)

(assert (=> b!804827 m!746701))

(declare-fun m!746703 () Bool)

(assert (=> b!804821 m!746703))

(declare-fun m!746705 () Bool)

(assert (=> b!804821 m!746705))

(declare-fun m!746707 () Bool)

(assert (=> b!804821 m!746707))

(declare-fun m!746709 () Bool)

(assert (=> b!804821 m!746709))

(declare-fun m!746711 () Bool)

(assert (=> b!804820 m!746711))

(declare-fun m!746713 () Bool)

(assert (=> b!804822 m!746713))

(declare-fun m!746715 () Bool)

(assert (=> b!804822 m!746715))

(declare-fun m!746717 () Bool)

(assert (=> b!804824 m!746717))

(check-sat (not b!804828) (not b!804827) (not b!804820) (not b!804825) (not b!804819) (not b!804824) (not start!68992) (not b!804821) (not b!804823))
(check-sat)
