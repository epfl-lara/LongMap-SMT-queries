; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69080 () Bool)

(assert start!69080)

(declare-fun b!804700 () Bool)

(declare-fun res!548680 () Bool)

(declare-fun e!445950 () Bool)

(assert (=> b!804700 (=> (not res!548680) (not e!445950))))

(declare-datatypes ((array!43702 0))(
  ( (array!43703 (arr!20926 (Array (_ BitVec 32) (_ BitVec 64))) (size!21346 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43702)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804700 (= res!548680 (validKeyInArray!0 (select (arr!20926 a!3170) j!153)))))

(declare-fun b!804701 () Bool)

(declare-fun res!548675 () Bool)

(declare-fun e!445949 () Bool)

(assert (=> b!804701 (=> (not res!548675) (not e!445949))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43702 (_ BitVec 32)) Bool)

(assert (=> b!804701 (= res!548675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548676 () Bool)

(assert (=> start!69080 (=> (not res!548676) (not e!445950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69080 (= res!548676 (validMask!0 mask!3266))))

(assert (=> start!69080 e!445950))

(assert (=> start!69080 true))

(declare-fun array_inv!16785 (array!43702) Bool)

(assert (=> start!69080 (array_inv!16785 a!3170)))

(declare-fun b!804702 () Bool)

(declare-fun res!548677 () Bool)

(assert (=> b!804702 (=> (not res!548677) (not e!445949))))

(declare-datatypes ((List!14796 0))(
  ( (Nil!14793) (Cons!14792 (h!15927 (_ BitVec 64)) (t!21103 List!14796)) )
))
(declare-fun arrayNoDuplicates!0 (array!43702 (_ BitVec 32) List!14796) Bool)

(assert (=> b!804702 (= res!548677 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14793))))

(declare-fun b!804703 () Bool)

(declare-fun res!548682 () Bool)

(assert (=> b!804703 (=> (not res!548682) (not e!445949))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804703 (= res!548682 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21346 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20926 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21346 a!3170)) (= (select (arr!20926 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804704 () Bool)

(declare-fun res!548681 () Bool)

(assert (=> b!804704 (=> (not res!548681) (not e!445950))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804704 (= res!548681 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804705 () Bool)

(declare-fun e!445954 () Bool)

(declare-fun e!445952 () Bool)

(assert (=> b!804705 (= e!445954 e!445952)))

(declare-fun res!548671 () Bool)

(assert (=> b!804705 (=> (not res!548671) (not e!445952))))

(declare-datatypes ((SeekEntryResult!8473 0))(
  ( (MissingZero!8473 (index!36260 (_ BitVec 32))) (Found!8473 (index!36261 (_ BitVec 32))) (Intermediate!8473 (undefined!9285 Bool) (index!36262 (_ BitVec 32)) (x!67261 (_ BitVec 32))) (Undefined!8473) (MissingVacant!8473 (index!36263 (_ BitVec 32))) )
))
(declare-fun lt!360230 () SeekEntryResult!8473)

(declare-fun lt!360231 () SeekEntryResult!8473)

(assert (=> b!804705 (= res!548671 (= lt!360230 lt!360231))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43702 (_ BitVec 32)) SeekEntryResult!8473)

(assert (=> b!804705 (= lt!360231 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20926 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43702 (_ BitVec 32)) SeekEntryResult!8473)

(assert (=> b!804705 (= lt!360230 (seekEntryOrOpen!0 (select (arr!20926 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804706 () Bool)

(declare-fun res!548672 () Bool)

(assert (=> b!804706 (=> (not res!548672) (not e!445950))))

(assert (=> b!804706 (= res!548672 (and (= (size!21346 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21346 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21346 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804707 () Bool)

(declare-fun e!445951 () Bool)

(assert (=> b!804707 (= e!445952 e!445951)))

(declare-fun res!548678 () Bool)

(assert (=> b!804707 (=> (not res!548678) (not e!445951))))

(declare-fun lt!360227 () SeekEntryResult!8473)

(assert (=> b!804707 (= res!548678 (and (= lt!360231 lt!360227) (not (= (select (arr!20926 a!3170) index!1236) (select (arr!20926 a!3170) j!153)))))))

(assert (=> b!804707 (= lt!360227 (Found!8473 j!153))))

(declare-fun b!804708 () Bool)

(declare-fun res!548673 () Bool)

(assert (=> b!804708 (=> (not res!548673) (not e!445950))))

(assert (=> b!804708 (= res!548673 (validKeyInArray!0 k0!2044))))

(declare-fun b!804709 () Bool)

(declare-fun lt!360234 () SeekEntryResult!8473)

(assert (=> b!804709 (= e!445951 (not (or (not (= lt!360234 lt!360227)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(declare-fun lt!360236 () (_ BitVec 64))

(declare-fun lt!360229 () (_ BitVec 32))

(declare-fun lt!360232 () array!43702)

(assert (=> b!804709 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360229 vacantAfter!23 lt!360236 lt!360232 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360229 vacantBefore!23 (select (arr!20926 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27571 0))(
  ( (Unit!27572) )
))
(declare-fun lt!360233 () Unit!27571)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43702 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27571)

(assert (=> b!804709 (= lt!360233 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360229 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804709 (= lt!360229 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804710 () Bool)

(assert (=> b!804710 (= e!445950 e!445949)))

(declare-fun res!548679 () Bool)

(assert (=> b!804710 (=> (not res!548679) (not e!445949))))

(declare-fun lt!360235 () SeekEntryResult!8473)

(assert (=> b!804710 (= res!548679 (or (= lt!360235 (MissingZero!8473 i!1163)) (= lt!360235 (MissingVacant!8473 i!1163))))))

(assert (=> b!804710 (= lt!360235 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804711 () Bool)

(assert (=> b!804711 (= e!445949 e!445954)))

(declare-fun res!548674 () Bool)

(assert (=> b!804711 (=> (not res!548674) (not e!445954))))

(declare-fun lt!360228 () SeekEntryResult!8473)

(assert (=> b!804711 (= res!548674 (= lt!360228 lt!360234))))

(assert (=> b!804711 (= lt!360234 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360236 lt!360232 mask!3266))))

(assert (=> b!804711 (= lt!360228 (seekEntryOrOpen!0 lt!360236 lt!360232 mask!3266))))

(assert (=> b!804711 (= lt!360236 (select (store (arr!20926 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804711 (= lt!360232 (array!43703 (store (arr!20926 a!3170) i!1163 k0!2044) (size!21346 a!3170)))))

(assert (= (and start!69080 res!548676) b!804706))

(assert (= (and b!804706 res!548672) b!804700))

(assert (= (and b!804700 res!548680) b!804708))

(assert (= (and b!804708 res!548673) b!804704))

(assert (= (and b!804704 res!548681) b!804710))

(assert (= (and b!804710 res!548679) b!804701))

(assert (= (and b!804701 res!548675) b!804702))

(assert (= (and b!804702 res!548677) b!804703))

(assert (= (and b!804703 res!548682) b!804711))

(assert (= (and b!804711 res!548674) b!804705))

(assert (= (and b!804705 res!548671) b!804707))

(assert (= (and b!804707 res!548678) b!804709))

(declare-fun m!746899 () Bool)

(assert (=> b!804703 m!746899))

(declare-fun m!746901 () Bool)

(assert (=> b!804703 m!746901))

(declare-fun m!746903 () Bool)

(assert (=> b!804705 m!746903))

(assert (=> b!804705 m!746903))

(declare-fun m!746905 () Bool)

(assert (=> b!804705 m!746905))

(assert (=> b!804705 m!746903))

(declare-fun m!746907 () Bool)

(assert (=> b!804705 m!746907))

(assert (=> b!804700 m!746903))

(assert (=> b!804700 m!746903))

(declare-fun m!746909 () Bool)

(assert (=> b!804700 m!746909))

(declare-fun m!746911 () Bool)

(assert (=> b!804710 m!746911))

(declare-fun m!746913 () Bool)

(assert (=> start!69080 m!746913))

(declare-fun m!746915 () Bool)

(assert (=> start!69080 m!746915))

(declare-fun m!746917 () Bool)

(assert (=> b!804702 m!746917))

(assert (=> b!804709 m!746903))

(declare-fun m!746919 () Bool)

(assert (=> b!804709 m!746919))

(declare-fun m!746921 () Bool)

(assert (=> b!804709 m!746921))

(declare-fun m!746923 () Bool)

(assert (=> b!804709 m!746923))

(assert (=> b!804709 m!746903))

(declare-fun m!746925 () Bool)

(assert (=> b!804709 m!746925))

(declare-fun m!746927 () Bool)

(assert (=> b!804711 m!746927))

(declare-fun m!746929 () Bool)

(assert (=> b!804711 m!746929))

(declare-fun m!746931 () Bool)

(assert (=> b!804711 m!746931))

(declare-fun m!746933 () Bool)

(assert (=> b!804711 m!746933))

(declare-fun m!746935 () Bool)

(assert (=> b!804707 m!746935))

(assert (=> b!804707 m!746903))

(declare-fun m!746937 () Bool)

(assert (=> b!804708 m!746937))

(declare-fun m!746939 () Bool)

(assert (=> b!804704 m!746939))

(declare-fun m!746941 () Bool)

(assert (=> b!804701 m!746941))

(check-sat (not b!804708) (not b!804710) (not b!804704) (not b!804705) (not b!804709) (not b!804700) (not b!804711) (not b!804701) (not start!69080) (not b!804702))
(check-sat)
