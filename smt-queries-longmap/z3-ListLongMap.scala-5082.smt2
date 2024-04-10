; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69004 () Bool)

(assert start!69004)

(declare-fun b!804999 () Bool)

(declare-fun res!549525 () Bool)

(declare-fun e!445872 () Bool)

(assert (=> b!804999 (=> (not res!549525) (not e!445872))))

(declare-datatypes ((array!43794 0))(
  ( (array!43795 (arr!20977 (Array (_ BitVec 32) (_ BitVec 64))) (size!21398 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43794)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804999 (= res!549525 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!549527 () Bool)

(assert (=> start!69004 (=> (not res!549527) (not e!445872))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69004 (= res!549527 (validMask!0 mask!3266))))

(assert (=> start!69004 e!445872))

(assert (=> start!69004 true))

(declare-fun array_inv!16773 (array!43794) Bool)

(assert (=> start!69004 (array_inv!16773 a!3170)))

(declare-fun b!805000 () Bool)

(declare-fun res!549522 () Bool)

(declare-fun e!445873 () Bool)

(assert (=> b!805000 (=> (not res!549522) (not e!445873))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805000 (= res!549522 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21398 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20977 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21398 a!3170)) (= (select (arr!20977 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805001 () Bool)

(declare-fun res!549524 () Bool)

(assert (=> b!805001 (=> (not res!549524) (not e!445873))))

(declare-datatypes ((List!14940 0))(
  ( (Nil!14937) (Cons!14936 (h!16065 (_ BitVec 64)) (t!21255 List!14940)) )
))
(declare-fun arrayNoDuplicates!0 (array!43794 (_ BitVec 32) List!14940) Bool)

(assert (=> b!805001 (= res!549524 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14937))))

(declare-fun b!805002 () Bool)

(declare-fun res!549520 () Bool)

(assert (=> b!805002 (=> (not res!549520) (not e!445873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43794 (_ BitVec 32)) Bool)

(assert (=> b!805002 (= res!549520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805003 () Bool)

(declare-fun res!549518 () Bool)

(assert (=> b!805003 (=> (not res!549518) (not e!445872))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805003 (= res!549518 (validKeyInArray!0 (select (arr!20977 a!3170) j!153)))))

(declare-fun b!805004 () Bool)

(declare-fun res!549521 () Bool)

(assert (=> b!805004 (=> (not res!549521) (not e!445872))))

(assert (=> b!805004 (= res!549521 (and (= (size!21398 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21398 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21398 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805005 () Bool)

(declare-fun res!549526 () Bool)

(assert (=> b!805005 (=> (not res!549526) (not e!445872))))

(assert (=> b!805005 (= res!549526 (validKeyInArray!0 k0!2044))))

(declare-fun b!805006 () Bool)

(declare-fun e!445874 () Bool)

(assert (=> b!805006 (= e!445874 false)))

(declare-datatypes ((SeekEntryResult!8568 0))(
  ( (MissingZero!8568 (index!36640 (_ BitVec 32))) (Found!8568 (index!36641 (_ BitVec 32))) (Intermediate!8568 (undefined!9380 Bool) (index!36642 (_ BitVec 32)) (x!67462 (_ BitVec 32))) (Undefined!8568) (MissingVacant!8568 (index!36643 (_ BitVec 32))) )
))
(declare-fun lt!360407 () SeekEntryResult!8568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43794 (_ BitVec 32)) SeekEntryResult!8568)

(assert (=> b!805006 (= lt!360407 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20977 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360410 () SeekEntryResult!8568)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43794 (_ BitVec 32)) SeekEntryResult!8568)

(assert (=> b!805006 (= lt!360410 (seekEntryOrOpen!0 (select (arr!20977 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805007 () Bool)

(assert (=> b!805007 (= e!445872 e!445873)))

(declare-fun res!549519 () Bool)

(assert (=> b!805007 (=> (not res!549519) (not e!445873))))

(declare-fun lt!360406 () SeekEntryResult!8568)

(assert (=> b!805007 (= res!549519 (or (= lt!360406 (MissingZero!8568 i!1163)) (= lt!360406 (MissingVacant!8568 i!1163))))))

(assert (=> b!805007 (= lt!360406 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805008 () Bool)

(assert (=> b!805008 (= e!445873 e!445874)))

(declare-fun res!549523 () Bool)

(assert (=> b!805008 (=> (not res!549523) (not e!445874))))

(declare-fun lt!360409 () array!43794)

(declare-fun lt!360408 () (_ BitVec 64))

(assert (=> b!805008 (= res!549523 (= (seekEntryOrOpen!0 lt!360408 lt!360409 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360408 lt!360409 mask!3266)))))

(assert (=> b!805008 (= lt!360408 (select (store (arr!20977 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805008 (= lt!360409 (array!43795 (store (arr!20977 a!3170) i!1163 k0!2044) (size!21398 a!3170)))))

(assert (= (and start!69004 res!549527) b!805004))

(assert (= (and b!805004 res!549521) b!805003))

(assert (= (and b!805003 res!549518) b!805005))

(assert (= (and b!805005 res!549526) b!804999))

(assert (= (and b!804999 res!549525) b!805007))

(assert (= (and b!805007 res!549519) b!805002))

(assert (= (and b!805002 res!549520) b!805001))

(assert (= (and b!805001 res!549524) b!805000))

(assert (= (and b!805000 res!549522) b!805008))

(assert (= (and b!805008 res!549523) b!805006))

(declare-fun m!746889 () Bool)

(assert (=> start!69004 m!746889))

(declare-fun m!746891 () Bool)

(assert (=> start!69004 m!746891))

(declare-fun m!746893 () Bool)

(assert (=> b!804999 m!746893))

(declare-fun m!746895 () Bool)

(assert (=> b!805007 m!746895))

(declare-fun m!746897 () Bool)

(assert (=> b!805000 m!746897))

(declare-fun m!746899 () Bool)

(assert (=> b!805000 m!746899))

(declare-fun m!746901 () Bool)

(assert (=> b!805006 m!746901))

(assert (=> b!805006 m!746901))

(declare-fun m!746903 () Bool)

(assert (=> b!805006 m!746903))

(assert (=> b!805006 m!746901))

(declare-fun m!746905 () Bool)

(assert (=> b!805006 m!746905))

(declare-fun m!746907 () Bool)

(assert (=> b!805005 m!746907))

(declare-fun m!746909 () Bool)

(assert (=> b!805001 m!746909))

(assert (=> b!805003 m!746901))

(assert (=> b!805003 m!746901))

(declare-fun m!746911 () Bool)

(assert (=> b!805003 m!746911))

(declare-fun m!746913 () Bool)

(assert (=> b!805002 m!746913))

(declare-fun m!746915 () Bool)

(assert (=> b!805008 m!746915))

(declare-fun m!746917 () Bool)

(assert (=> b!805008 m!746917))

(declare-fun m!746919 () Bool)

(assert (=> b!805008 m!746919))

(declare-fun m!746921 () Bool)

(assert (=> b!805008 m!746921))

(check-sat (not start!69004) (not b!805008) (not b!805002) (not b!805007) (not b!805003) (not b!805001) (not b!805006) (not b!804999) (not b!805005))
(check-sat)
