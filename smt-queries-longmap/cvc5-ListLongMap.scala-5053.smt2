; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68828 () Bool)

(assert start!68828)

(declare-fun b!802345 () Bool)

(declare-fun res!546874 () Bool)

(declare-fun e!444671 () Bool)

(assert (=> b!802345 (=> (not res!546874) (not e!444671))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43618 0))(
  ( (array!43619 (arr!20889 (Array (_ BitVec 32) (_ BitVec 64))) (size!21310 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43618)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802345 (= res!546874 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21310 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20889 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21310 a!3170)) (= (select (arr!20889 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802346 () Bool)

(declare-fun res!546866 () Bool)

(declare-fun e!444667 () Bool)

(assert (=> b!802346 (=> (not res!546866) (not e!444667))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802346 (= res!546866 (and (= (size!21310 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21310 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21310 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802347 () Bool)

(declare-fun res!546865 () Bool)

(assert (=> b!802347 (=> (not res!546865) (not e!444671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43618 (_ BitVec 32)) Bool)

(assert (=> b!802347 (= res!546865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!546867 () Bool)

(assert (=> start!68828 (=> (not res!546867) (not e!444667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68828 (= res!546867 (validMask!0 mask!3266))))

(assert (=> start!68828 e!444667))

(assert (=> start!68828 true))

(declare-fun array_inv!16685 (array!43618) Bool)

(assert (=> start!68828 (array_inv!16685 a!3170)))

(declare-fun b!802348 () Bool)

(declare-fun res!546873 () Bool)

(assert (=> b!802348 (=> (not res!546873) (not e!444671))))

(declare-datatypes ((List!14852 0))(
  ( (Nil!14849) (Cons!14848 (h!15977 (_ BitVec 64)) (t!21167 List!14852)) )
))
(declare-fun arrayNoDuplicates!0 (array!43618 (_ BitVec 32) List!14852) Bool)

(assert (=> b!802348 (= res!546873 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14849))))

(declare-fun b!802349 () Bool)

(declare-fun res!546870 () Bool)

(assert (=> b!802349 (=> (not res!546870) (not e!444667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802349 (= res!546870 (validKeyInArray!0 (select (arr!20889 a!3170) j!153)))))

(declare-fun b!802350 () Bool)

(declare-fun e!444670 () Bool)

(assert (=> b!802350 (= e!444671 e!444670)))

(declare-fun res!546864 () Bool)

(assert (=> b!802350 (=> (not res!546864) (not e!444670))))

(declare-fun lt!358794 () (_ BitVec 64))

(declare-fun lt!358799 () array!43618)

(declare-datatypes ((SeekEntryResult!8480 0))(
  ( (MissingZero!8480 (index!36288 (_ BitVec 32))) (Found!8480 (index!36289 (_ BitVec 32))) (Intermediate!8480 (undefined!9292 Bool) (index!36290 (_ BitVec 32)) (x!67142 (_ BitVec 32))) (Undefined!8480) (MissingVacant!8480 (index!36291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43618 (_ BitVec 32)) SeekEntryResult!8480)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43618 (_ BitVec 32)) SeekEntryResult!8480)

(assert (=> b!802350 (= res!546864 (= (seekEntryOrOpen!0 lt!358794 lt!358799 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358794 lt!358799 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!802350 (= lt!358794 (select (store (arr!20889 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802350 (= lt!358799 (array!43619 (store (arr!20889 a!3170) i!1163 k!2044) (size!21310 a!3170)))))

(declare-fun b!802351 () Bool)

(declare-fun res!546868 () Bool)

(assert (=> b!802351 (=> (not res!546868) (not e!444667))))

(declare-fun arrayContainsKey!0 (array!43618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802351 (= res!546868 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802352 () Bool)

(declare-fun e!444668 () Bool)

(assert (=> b!802352 (= e!444668 (validKeyInArray!0 lt!358794))))

(declare-fun b!802353 () Bool)

(declare-fun e!444669 () Bool)

(assert (=> b!802353 (= e!444670 e!444669)))

(declare-fun res!546872 () Bool)

(assert (=> b!802353 (=> (not res!546872) (not e!444669))))

(declare-fun lt!358795 () SeekEntryResult!8480)

(declare-fun lt!358798 () SeekEntryResult!8480)

(assert (=> b!802353 (= res!546872 (and (= lt!358798 lt!358795) (= lt!358795 (Found!8480 j!153)) (not (= (select (arr!20889 a!3170) index!1236) (select (arr!20889 a!3170) j!153)))))))

(assert (=> b!802353 (= lt!358795 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20889 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802353 (= lt!358798 (seekEntryOrOpen!0 (select (arr!20889 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802354 () Bool)

(assert (=> b!802354 (= e!444669 (not e!444668))))

(declare-fun res!546875 () Bool)

(assert (=> b!802354 (=> res!546875 e!444668)))

(assert (=> b!802354 (= res!546875 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20889 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358793 () (_ BitVec 32))

(assert (=> b!802354 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358793 vacantAfter!23 lt!358794 lt!358799 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358793 vacantBefore!23 (select (arr!20889 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27500 0))(
  ( (Unit!27501) )
))
(declare-fun lt!358797 () Unit!27500)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43618 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27500)

(assert (=> b!802354 (= lt!358797 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358793 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802354 (= lt!358793 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802355 () Bool)

(assert (=> b!802355 (= e!444667 e!444671)))

(declare-fun res!546871 () Bool)

(assert (=> b!802355 (=> (not res!546871) (not e!444671))))

(declare-fun lt!358796 () SeekEntryResult!8480)

(assert (=> b!802355 (= res!546871 (or (= lt!358796 (MissingZero!8480 i!1163)) (= lt!358796 (MissingVacant!8480 i!1163))))))

(assert (=> b!802355 (= lt!358796 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802356 () Bool)

(declare-fun res!546869 () Bool)

(assert (=> b!802356 (=> (not res!546869) (not e!444667))))

(assert (=> b!802356 (= res!546869 (validKeyInArray!0 k!2044))))

(assert (= (and start!68828 res!546867) b!802346))

(assert (= (and b!802346 res!546866) b!802349))

(assert (= (and b!802349 res!546870) b!802356))

(assert (= (and b!802356 res!546869) b!802351))

(assert (= (and b!802351 res!546868) b!802355))

(assert (= (and b!802355 res!546871) b!802347))

(assert (= (and b!802347 res!546865) b!802348))

(assert (= (and b!802348 res!546873) b!802345))

(assert (= (and b!802345 res!546874) b!802350))

(assert (= (and b!802350 res!546864) b!802353))

(assert (= (and b!802353 res!546872) b!802354))

(assert (= (and b!802354 (not res!546875)) b!802352))

(declare-fun m!743765 () Bool)

(assert (=> b!802345 m!743765))

(declare-fun m!743767 () Bool)

(assert (=> b!802345 m!743767))

(declare-fun m!743769 () Bool)

(assert (=> b!802351 m!743769))

(declare-fun m!743771 () Bool)

(assert (=> b!802347 m!743771))

(declare-fun m!743773 () Bool)

(assert (=> b!802352 m!743773))

(declare-fun m!743775 () Bool)

(assert (=> b!802350 m!743775))

(declare-fun m!743777 () Bool)

(assert (=> b!802350 m!743777))

(declare-fun m!743779 () Bool)

(assert (=> b!802350 m!743779))

(declare-fun m!743781 () Bool)

(assert (=> b!802350 m!743781))

(declare-fun m!743783 () Bool)

(assert (=> b!802353 m!743783))

(declare-fun m!743785 () Bool)

(assert (=> b!802353 m!743785))

(assert (=> b!802353 m!743785))

(declare-fun m!743787 () Bool)

(assert (=> b!802353 m!743787))

(assert (=> b!802353 m!743785))

(declare-fun m!743789 () Bool)

(assert (=> b!802353 m!743789))

(assert (=> b!802354 m!743785))

(declare-fun m!743791 () Bool)

(assert (=> b!802354 m!743791))

(assert (=> b!802354 m!743785))

(declare-fun m!743793 () Bool)

(assert (=> b!802354 m!743793))

(declare-fun m!743795 () Bool)

(assert (=> b!802354 m!743795))

(assert (=> b!802354 m!743779))

(declare-fun m!743797 () Bool)

(assert (=> b!802354 m!743797))

(declare-fun m!743799 () Bool)

(assert (=> b!802354 m!743799))

(declare-fun m!743801 () Bool)

(assert (=> start!68828 m!743801))

(declare-fun m!743803 () Bool)

(assert (=> start!68828 m!743803))

(assert (=> b!802349 m!743785))

(assert (=> b!802349 m!743785))

(declare-fun m!743805 () Bool)

(assert (=> b!802349 m!743805))

(declare-fun m!743807 () Bool)

(assert (=> b!802355 m!743807))

(declare-fun m!743809 () Bool)

(assert (=> b!802348 m!743809))

(declare-fun m!743811 () Bool)

(assert (=> b!802356 m!743811))

(push 1)

