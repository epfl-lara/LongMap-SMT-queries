; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69156 () Bool)

(assert start!69156)

(declare-fun b!806485 () Bool)

(declare-fun e!446572 () Bool)

(declare-fun e!446571 () Bool)

(assert (=> b!806485 (= e!446572 e!446571)))

(declare-fun res!550752 () Bool)

(assert (=> b!806485 (=> (not res!550752) (not e!446571))))

(declare-datatypes ((SeekEntryResult!8602 0))(
  ( (MissingZero!8602 (index!36776 (_ BitVec 32))) (Found!8602 (index!36777 (_ BitVec 32))) (Intermediate!8602 (undefined!9414 Bool) (index!36778 (_ BitVec 32)) (x!67601 (_ BitVec 32))) (Undefined!8602) (MissingVacant!8602 (index!36779 (_ BitVec 32))) )
))
(declare-fun lt!361089 () SeekEntryResult!8602)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806485 (= res!550752 (or (= lt!361089 (MissingZero!8602 i!1163)) (= lt!361089 (MissingVacant!8602 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43873 0))(
  ( (array!43874 (arr!21014 (Array (_ BitVec 32) (_ BitVec 64))) (size!21435 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43873)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43873 (_ BitVec 32)) SeekEntryResult!8602)

(assert (=> b!806485 (= lt!361089 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806486 () Bool)

(declare-fun res!550755 () Bool)

(assert (=> b!806486 (=> (not res!550755) (not e!446572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806486 (= res!550755 (validKeyInArray!0 k0!2044))))

(declare-fun b!806487 () Bool)

(declare-fun res!550758 () Bool)

(assert (=> b!806487 (=> (not res!550758) (not e!446572))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806487 (= res!550758 (validKeyInArray!0 (select (arr!21014 a!3170) j!153)))))

(declare-fun b!806488 () Bool)

(declare-fun res!550757 () Bool)

(assert (=> b!806488 (=> (not res!550757) (not e!446572))))

(assert (=> b!806488 (= res!550757 (and (= (size!21435 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21435 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21435 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!550753 () Bool)

(assert (=> start!69156 (=> (not res!550753) (not e!446572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69156 (= res!550753 (validMask!0 mask!3266))))

(assert (=> start!69156 e!446572))

(assert (=> start!69156 true))

(declare-fun array_inv!16897 (array!43873) Bool)

(assert (=> start!69156 (array_inv!16897 a!3170)))

(declare-fun b!806489 () Bool)

(declare-fun res!550750 () Bool)

(assert (=> b!806489 (=> (not res!550750) (not e!446571))))

(declare-datatypes ((List!15016 0))(
  ( (Nil!15013) (Cons!15012 (h!16141 (_ BitVec 64)) (t!21322 List!15016)) )
))
(declare-fun arrayNoDuplicates!0 (array!43873 (_ BitVec 32) List!15016) Bool)

(assert (=> b!806489 (= res!550750 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15013))))

(declare-fun b!806490 () Bool)

(declare-fun res!550749 () Bool)

(assert (=> b!806490 (=> (not res!550749) (not e!446571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43873 (_ BitVec 32)) Bool)

(assert (=> b!806490 (= res!550749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806491 () Bool)

(declare-fun res!550748 () Bool)

(assert (=> b!806491 (=> (not res!550748) (not e!446572))))

(declare-fun arrayContainsKey!0 (array!43873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806491 (= res!550748 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806492 () Bool)

(declare-fun e!446573 () Bool)

(declare-fun e!446574 () Bool)

(assert (=> b!806492 (= e!446573 e!446574)))

(declare-fun res!550754 () Bool)

(assert (=> b!806492 (=> (not res!550754) (not e!446574))))

(declare-fun lt!361085 () SeekEntryResult!8602)

(declare-fun lt!361091 () SeekEntryResult!8602)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806492 (= res!550754 (and (= lt!361085 lt!361091) (= lt!361091 (Found!8602 j!153)) (= (select (arr!21014 a!3170) index!1236) (select (arr!21014 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43873 (_ BitVec 32)) SeekEntryResult!8602)

(assert (=> b!806492 (= lt!361091 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21014 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806492 (= lt!361085 (seekEntryOrOpen!0 (select (arr!21014 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806493 () Bool)

(assert (=> b!806493 (= e!446571 e!446573)))

(declare-fun res!550756 () Bool)

(assert (=> b!806493 (=> (not res!550756) (not e!446573))))

(declare-fun lt!361087 () SeekEntryResult!8602)

(declare-fun lt!361090 () SeekEntryResult!8602)

(assert (=> b!806493 (= res!550756 (= lt!361087 lt!361090))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361088 () (_ BitVec 64))

(declare-fun lt!361086 () array!43873)

(assert (=> b!806493 (= lt!361090 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361088 lt!361086 mask!3266))))

(assert (=> b!806493 (= lt!361087 (seekEntryOrOpen!0 lt!361088 lt!361086 mask!3266))))

(assert (=> b!806493 (= lt!361088 (select (store (arr!21014 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806493 (= lt!361086 (array!43874 (store (arr!21014 a!3170) i!1163 k0!2044) (size!21435 a!3170)))))

(declare-fun b!806494 () Bool)

(declare-fun res!550751 () Bool)

(assert (=> b!806494 (=> (not res!550751) (not e!446571))))

(assert (=> b!806494 (= res!550751 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21435 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21014 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21435 a!3170)) (= (select (arr!21014 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806495 () Bool)

(assert (=> b!806495 (= e!446574 (not true))))

(assert (=> b!806495 (= lt!361090 (Found!8602 index!1236))))

(assert (= (and start!69156 res!550753) b!806488))

(assert (= (and b!806488 res!550757) b!806487))

(assert (= (and b!806487 res!550758) b!806486))

(assert (= (and b!806486 res!550755) b!806491))

(assert (= (and b!806491 res!550748) b!806485))

(assert (= (and b!806485 res!550752) b!806490))

(assert (= (and b!806490 res!550749) b!806489))

(assert (= (and b!806489 res!550750) b!806494))

(assert (= (and b!806494 res!550751) b!806493))

(assert (= (and b!806493 res!550756) b!806492))

(assert (= (and b!806492 res!550754) b!806495))

(declare-fun m!747943 () Bool)

(assert (=> b!806493 m!747943))

(declare-fun m!747945 () Bool)

(assert (=> b!806493 m!747945))

(declare-fun m!747947 () Bool)

(assert (=> b!806493 m!747947))

(declare-fun m!747949 () Bool)

(assert (=> b!806493 m!747949))

(declare-fun m!747951 () Bool)

(assert (=> b!806487 m!747951))

(assert (=> b!806487 m!747951))

(declare-fun m!747953 () Bool)

(assert (=> b!806487 m!747953))

(declare-fun m!747955 () Bool)

(assert (=> b!806492 m!747955))

(assert (=> b!806492 m!747951))

(assert (=> b!806492 m!747951))

(declare-fun m!747957 () Bool)

(assert (=> b!806492 m!747957))

(assert (=> b!806492 m!747951))

(declare-fun m!747959 () Bool)

(assert (=> b!806492 m!747959))

(declare-fun m!747961 () Bool)

(assert (=> b!806490 m!747961))

(declare-fun m!747963 () Bool)

(assert (=> b!806494 m!747963))

(declare-fun m!747965 () Bool)

(assert (=> b!806494 m!747965))

(declare-fun m!747967 () Bool)

(assert (=> b!806485 m!747967))

(declare-fun m!747969 () Bool)

(assert (=> b!806491 m!747969))

(declare-fun m!747971 () Bool)

(assert (=> b!806489 m!747971))

(declare-fun m!747973 () Bool)

(assert (=> b!806486 m!747973))

(declare-fun m!747975 () Bool)

(assert (=> start!69156 m!747975))

(declare-fun m!747977 () Bool)

(assert (=> start!69156 m!747977))

(check-sat (not b!806486) (not start!69156) (not b!806490) (not b!806485) (not b!806491) (not b!806492) (not b!806493) (not b!806487) (not b!806489))
(check-sat)
