; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69144 () Bool)

(assert start!69144)

(declare-fun b!806287 () Bool)

(declare-fun e!446483 () Bool)

(declare-fun e!446482 () Bool)

(assert (=> b!806287 (= e!446483 e!446482)))

(declare-fun res!550556 () Bool)

(assert (=> b!806287 (=> (not res!550556) (not e!446482))))

(declare-datatypes ((SeekEntryResult!8596 0))(
  ( (MissingZero!8596 (index!36752 (_ BitVec 32))) (Found!8596 (index!36753 (_ BitVec 32))) (Intermediate!8596 (undefined!9408 Bool) (index!36754 (_ BitVec 32)) (x!67579 (_ BitVec 32))) (Undefined!8596) (MissingVacant!8596 (index!36755 (_ BitVec 32))) )
))
(declare-fun lt!360965 () SeekEntryResult!8596)

(declare-fun lt!360961 () SeekEntryResult!8596)

(assert (=> b!806287 (= res!550556 (= lt!360965 lt!360961))))

(declare-datatypes ((array!43861 0))(
  ( (array!43862 (arr!21008 (Array (_ BitVec 32) (_ BitVec 64))) (size!21429 (_ BitVec 32))) )
))
(declare-fun lt!360964 () array!43861)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360962 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43861 (_ BitVec 32)) SeekEntryResult!8596)

(assert (=> b!806287 (= lt!360961 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360962 lt!360964 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43861 (_ BitVec 32)) SeekEntryResult!8596)

(assert (=> b!806287 (= lt!360965 (seekEntryOrOpen!0 lt!360962 lt!360964 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43861)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806287 (= lt!360962 (select (store (arr!21008 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806287 (= lt!360964 (array!43862 (store (arr!21008 a!3170) i!1163 k0!2044) (size!21429 a!3170)))))

(declare-fun b!806288 () Bool)

(declare-fun res!550550 () Bool)

(declare-fun e!446481 () Bool)

(assert (=> b!806288 (=> (not res!550550) (not e!446481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806288 (= res!550550 (validKeyInArray!0 (select (arr!21008 a!3170) j!153)))))

(declare-fun b!806289 () Bool)

(declare-fun e!446484 () Bool)

(assert (=> b!806289 (= e!446482 e!446484)))

(declare-fun res!550559 () Bool)

(assert (=> b!806289 (=> (not res!550559) (not e!446484))))

(declare-fun lt!360963 () SeekEntryResult!8596)

(declare-fun lt!360959 () SeekEntryResult!8596)

(assert (=> b!806289 (= res!550559 (and (= lt!360959 lt!360963) (= lt!360963 (Found!8596 j!153)) (= (select (arr!21008 a!3170) index!1236) (select (arr!21008 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806289 (= lt!360963 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21008 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806289 (= lt!360959 (seekEntryOrOpen!0 (select (arr!21008 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806290 () Bool)

(declare-fun res!550557 () Bool)

(assert (=> b!806290 (=> (not res!550557) (not e!446483))))

(assert (=> b!806290 (= res!550557 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21429 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21008 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21429 a!3170)) (= (select (arr!21008 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806291 () Bool)

(assert (=> b!806291 (= e!446481 e!446483)))

(declare-fun res!550552 () Bool)

(assert (=> b!806291 (=> (not res!550552) (not e!446483))))

(declare-fun lt!360960 () SeekEntryResult!8596)

(assert (=> b!806291 (= res!550552 (or (= lt!360960 (MissingZero!8596 i!1163)) (= lt!360960 (MissingVacant!8596 i!1163))))))

(assert (=> b!806291 (= lt!360960 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!550555 () Bool)

(assert (=> start!69144 (=> (not res!550555) (not e!446481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69144 (= res!550555 (validMask!0 mask!3266))))

(assert (=> start!69144 e!446481))

(assert (=> start!69144 true))

(declare-fun array_inv!16891 (array!43861) Bool)

(assert (=> start!69144 (array_inv!16891 a!3170)))

(declare-fun b!806292 () Bool)

(declare-fun res!550560 () Bool)

(assert (=> b!806292 (=> (not res!550560) (not e!446483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43861 (_ BitVec 32)) Bool)

(assert (=> b!806292 (= res!550560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806293 () Bool)

(declare-fun res!550554 () Bool)

(assert (=> b!806293 (=> (not res!550554) (not e!446481))))

(assert (=> b!806293 (= res!550554 (and (= (size!21429 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21429 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21429 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806294 () Bool)

(declare-fun res!550558 () Bool)

(assert (=> b!806294 (=> (not res!550558) (not e!446481))))

(assert (=> b!806294 (= res!550558 (validKeyInArray!0 k0!2044))))

(declare-fun b!806295 () Bool)

(declare-fun res!550553 () Bool)

(assert (=> b!806295 (=> (not res!550553) (not e!446483))))

(declare-datatypes ((List!15010 0))(
  ( (Nil!15007) (Cons!15006 (h!16135 (_ BitVec 64)) (t!21316 List!15010)) )
))
(declare-fun arrayNoDuplicates!0 (array!43861 (_ BitVec 32) List!15010) Bool)

(assert (=> b!806295 (= res!550553 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15007))))

(declare-fun b!806296 () Bool)

(declare-fun res!550551 () Bool)

(assert (=> b!806296 (=> (not res!550551) (not e!446481))))

(declare-fun arrayContainsKey!0 (array!43861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806296 (= res!550551 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806297 () Bool)

(assert (=> b!806297 (= e!446484 (not true))))

(assert (=> b!806297 (= lt!360961 (Found!8596 index!1236))))

(assert (= (and start!69144 res!550555) b!806293))

(assert (= (and b!806293 res!550554) b!806288))

(assert (= (and b!806288 res!550550) b!806294))

(assert (= (and b!806294 res!550558) b!806296))

(assert (= (and b!806296 res!550551) b!806291))

(assert (= (and b!806291 res!550552) b!806292))

(assert (= (and b!806292 res!550560) b!806295))

(assert (= (and b!806295 res!550553) b!806290))

(assert (= (and b!806290 res!550557) b!806287))

(assert (= (and b!806287 res!550556) b!806289))

(assert (= (and b!806289 res!550559) b!806297))

(declare-fun m!747727 () Bool)

(assert (=> b!806291 m!747727))

(declare-fun m!747729 () Bool)

(assert (=> b!806287 m!747729))

(declare-fun m!747731 () Bool)

(assert (=> b!806287 m!747731))

(declare-fun m!747733 () Bool)

(assert (=> b!806287 m!747733))

(declare-fun m!747735 () Bool)

(assert (=> b!806287 m!747735))

(declare-fun m!747737 () Bool)

(assert (=> b!806296 m!747737))

(declare-fun m!747739 () Bool)

(assert (=> b!806289 m!747739))

(declare-fun m!747741 () Bool)

(assert (=> b!806289 m!747741))

(assert (=> b!806289 m!747741))

(declare-fun m!747743 () Bool)

(assert (=> b!806289 m!747743))

(assert (=> b!806289 m!747741))

(declare-fun m!747745 () Bool)

(assert (=> b!806289 m!747745))

(assert (=> b!806288 m!747741))

(assert (=> b!806288 m!747741))

(declare-fun m!747747 () Bool)

(assert (=> b!806288 m!747747))

(declare-fun m!747749 () Bool)

(assert (=> b!806290 m!747749))

(declare-fun m!747751 () Bool)

(assert (=> b!806290 m!747751))

(declare-fun m!747753 () Bool)

(assert (=> b!806294 m!747753))

(declare-fun m!747755 () Bool)

(assert (=> b!806292 m!747755))

(declare-fun m!747757 () Bool)

(assert (=> start!69144 m!747757))

(declare-fun m!747759 () Bool)

(assert (=> start!69144 m!747759))

(declare-fun m!747761 () Bool)

(assert (=> b!806295 m!747761))

(check-sat (not b!806292) (not b!806288) (not b!806294) (not b!806295) (not b!806291) (not b!806289) (not b!806296) (not start!69144) (not b!806287))
(check-sat)
