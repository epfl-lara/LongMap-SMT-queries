; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69088 () Bool)

(assert start!69088)

(declare-fun b!805805 () Bool)

(declare-fun res!550127 () Bool)

(declare-fun e!446254 () Bool)

(assert (=> b!805805 (=> (not res!550127) (not e!446254))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43833 0))(
  ( (array!43834 (arr!20995 (Array (_ BitVec 32) (_ BitVec 64))) (size!21416 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43833)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805805 (= res!550127 (and (= (size!21416 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21416 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21416 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805806 () Bool)

(declare-fun e!446255 () Bool)

(assert (=> b!805806 (= e!446255 (not true))))

(declare-datatypes ((SeekEntryResult!8586 0))(
  ( (MissingZero!8586 (index!36712 (_ BitVec 32))) (Found!8586 (index!36713 (_ BitVec 32))) (Intermediate!8586 (undefined!9398 Bool) (index!36714 (_ BitVec 32)) (x!67531 (_ BitVec 32))) (Undefined!8586) (MissingVacant!8586 (index!36715 (_ BitVec 32))) )
))
(declare-fun lt!360803 () SeekEntryResult!8586)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805806 (= lt!360803 (Found!8586 index!1236))))

(declare-fun b!805807 () Bool)

(declare-fun res!550135 () Bool)

(assert (=> b!805807 (=> (not res!550135) (not e!446254))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805807 (= res!550135 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805808 () Bool)

(declare-fun res!550133 () Bool)

(declare-fun e!446256 () Bool)

(assert (=> b!805808 (=> (not res!550133) (not e!446256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43833 (_ BitVec 32)) Bool)

(assert (=> b!805808 (= res!550133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805809 () Bool)

(declare-fun res!550130 () Bool)

(assert (=> b!805809 (=> (not res!550130) (not e!446256))))

(declare-datatypes ((List!14958 0))(
  ( (Nil!14955) (Cons!14954 (h!16083 (_ BitVec 64)) (t!21273 List!14958)) )
))
(declare-fun arrayNoDuplicates!0 (array!43833 (_ BitVec 32) List!14958) Bool)

(assert (=> b!805809 (= res!550130 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14955))))

(declare-fun b!805810 () Bool)

(declare-fun res!550136 () Bool)

(assert (=> b!805810 (=> (not res!550136) (not e!446254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805810 (= res!550136 (validKeyInArray!0 k0!2044))))

(declare-fun b!805811 () Bool)

(declare-fun res!550126 () Bool)

(assert (=> b!805811 (=> (not res!550126) (not e!446254))))

(assert (=> b!805811 (= res!550126 (validKeyInArray!0 (select (arr!20995 a!3170) j!153)))))

(declare-fun res!550131 () Bool)

(assert (=> start!69088 (=> (not res!550131) (not e!446254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69088 (= res!550131 (validMask!0 mask!3266))))

(assert (=> start!69088 e!446254))

(assert (=> start!69088 true))

(declare-fun array_inv!16791 (array!43833) Bool)

(assert (=> start!69088 (array_inv!16791 a!3170)))

(declare-fun b!805812 () Bool)

(declare-fun e!446258 () Bool)

(assert (=> b!805812 (= e!446256 e!446258)))

(declare-fun res!550128 () Bool)

(assert (=> b!805812 (=> (not res!550128) (not e!446258))))

(declare-fun lt!360805 () SeekEntryResult!8586)

(assert (=> b!805812 (= res!550128 (= lt!360805 lt!360803))))

(declare-fun lt!360802 () array!43833)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360804 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43833 (_ BitVec 32)) SeekEntryResult!8586)

(assert (=> b!805812 (= lt!360803 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360804 lt!360802 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43833 (_ BitVec 32)) SeekEntryResult!8586)

(assert (=> b!805812 (= lt!360805 (seekEntryOrOpen!0 lt!360804 lt!360802 mask!3266))))

(assert (=> b!805812 (= lt!360804 (select (store (arr!20995 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805812 (= lt!360802 (array!43834 (store (arr!20995 a!3170) i!1163 k0!2044) (size!21416 a!3170)))))

(declare-fun b!805813 () Bool)

(declare-fun res!550134 () Bool)

(assert (=> b!805813 (=> (not res!550134) (not e!446256))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805813 (= res!550134 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21416 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20995 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21416 a!3170)) (= (select (arr!20995 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805814 () Bool)

(assert (=> b!805814 (= e!446254 e!446256)))

(declare-fun res!550129 () Bool)

(assert (=> b!805814 (=> (not res!550129) (not e!446256))))

(declare-fun lt!360806 () SeekEntryResult!8586)

(assert (=> b!805814 (= res!550129 (or (= lt!360806 (MissingZero!8586 i!1163)) (= lt!360806 (MissingVacant!8586 i!1163))))))

(assert (=> b!805814 (= lt!360806 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805815 () Bool)

(assert (=> b!805815 (= e!446258 e!446255)))

(declare-fun res!550132 () Bool)

(assert (=> b!805815 (=> (not res!550132) (not e!446255))))

(declare-fun lt!360801 () SeekEntryResult!8586)

(declare-fun lt!360800 () SeekEntryResult!8586)

(assert (=> b!805815 (= res!550132 (and (= lt!360801 lt!360800) (= lt!360800 (Found!8586 j!153)) (= (select (arr!20995 a!3170) index!1236) (select (arr!20995 a!3170) j!153))))))

(assert (=> b!805815 (= lt!360800 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20995 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805815 (= lt!360801 (seekEntryOrOpen!0 (select (arr!20995 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69088 res!550131) b!805805))

(assert (= (and b!805805 res!550127) b!805811))

(assert (= (and b!805811 res!550126) b!805810))

(assert (= (and b!805810 res!550136) b!805807))

(assert (= (and b!805807 res!550135) b!805814))

(assert (= (and b!805814 res!550129) b!805808))

(assert (= (and b!805808 res!550133) b!805809))

(assert (= (and b!805809 res!550130) b!805813))

(assert (= (and b!805813 res!550134) b!805812))

(assert (= (and b!805812 res!550128) b!805815))

(assert (= (and b!805815 res!550132) b!805806))

(declare-fun m!747737 () Bool)

(assert (=> b!805812 m!747737))

(declare-fun m!747739 () Bool)

(assert (=> b!805812 m!747739))

(declare-fun m!747741 () Bool)

(assert (=> b!805812 m!747741))

(declare-fun m!747743 () Bool)

(assert (=> b!805812 m!747743))

(declare-fun m!747745 () Bool)

(assert (=> b!805815 m!747745))

(declare-fun m!747747 () Bool)

(assert (=> b!805815 m!747747))

(assert (=> b!805815 m!747747))

(declare-fun m!747749 () Bool)

(assert (=> b!805815 m!747749))

(assert (=> b!805815 m!747747))

(declare-fun m!747751 () Bool)

(assert (=> b!805815 m!747751))

(declare-fun m!747753 () Bool)

(assert (=> b!805813 m!747753))

(declare-fun m!747755 () Bool)

(assert (=> b!805813 m!747755))

(declare-fun m!747757 () Bool)

(assert (=> start!69088 m!747757))

(declare-fun m!747759 () Bool)

(assert (=> start!69088 m!747759))

(assert (=> b!805811 m!747747))

(assert (=> b!805811 m!747747))

(declare-fun m!747761 () Bool)

(assert (=> b!805811 m!747761))

(declare-fun m!747763 () Bool)

(assert (=> b!805810 m!747763))

(declare-fun m!747765 () Bool)

(assert (=> b!805808 m!747765))

(declare-fun m!747767 () Bool)

(assert (=> b!805809 m!747767))

(declare-fun m!747769 () Bool)

(assert (=> b!805807 m!747769))

(declare-fun m!747771 () Bool)

(assert (=> b!805814 m!747771))

(check-sat (not b!805808) (not start!69088) (not b!805810) (not b!805807) (not b!805815) (not b!805812) (not b!805814) (not b!805809) (not b!805811))
