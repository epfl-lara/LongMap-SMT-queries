; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68534 () Bool)

(assert start!68534)

(declare-fun b!797024 () Bool)

(declare-fun res!541548 () Bool)

(declare-fun e!442209 () Bool)

(assert (=> b!797024 (=> (not res!541548) (not e!442209))))

(declare-datatypes ((array!43324 0))(
  ( (array!43325 (arr!20742 (Array (_ BitVec 32) (_ BitVec 64))) (size!21163 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43324)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797024 (= res!541548 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797025 () Bool)

(declare-fun res!541543 () Bool)

(assert (=> b!797025 (=> (not res!541543) (not e!442209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797025 (= res!541543 (validKeyInArray!0 k!2044))))

(declare-fun b!797026 () Bool)

(declare-fun e!442211 () Bool)

(declare-fun e!442210 () Bool)

(assert (=> b!797026 (= e!442211 e!442210)))

(declare-fun res!541544 () Bool)

(assert (=> b!797026 (=> (not res!541544) (not e!442210))))

(declare-datatypes ((SeekEntryResult!8333 0))(
  ( (MissingZero!8333 (index!35700 (_ BitVec 32))) (Found!8333 (index!35701 (_ BitVec 32))) (Intermediate!8333 (undefined!9145 Bool) (index!35702 (_ BitVec 32)) (x!66603 (_ BitVec 32))) (Undefined!8333) (MissingVacant!8333 (index!35703 (_ BitVec 32))) )
))
(declare-fun lt!355500 () SeekEntryResult!8333)

(declare-fun lt!355499 () SeekEntryResult!8333)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797026 (= res!541544 (and (= lt!355500 lt!355499) (= lt!355499 (Found!8333 j!153)) (= (select (arr!20742 a!3170) index!1236) (select (arr!20742 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43324 (_ BitVec 32)) SeekEntryResult!8333)

(assert (=> b!797026 (= lt!355499 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20742 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43324 (_ BitVec 32)) SeekEntryResult!8333)

(assert (=> b!797026 (= lt!355500 (seekEntryOrOpen!0 (select (arr!20742 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797027 () Bool)

(assert (=> b!797027 (= e!442210 (not true))))

(declare-fun lt!355503 () SeekEntryResult!8333)

(assert (=> b!797027 (= lt!355503 (Found!8333 index!1236))))

(declare-fun b!797028 () Bool)

(declare-fun e!442207 () Bool)

(assert (=> b!797028 (= e!442207 e!442211)))

(declare-fun res!541547 () Bool)

(assert (=> b!797028 (=> (not res!541547) (not e!442211))))

(declare-fun lt!355501 () SeekEntryResult!8333)

(assert (=> b!797028 (= res!541547 (= lt!355501 lt!355503))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355505 () array!43324)

(declare-fun lt!355502 () (_ BitVec 64))

(assert (=> b!797028 (= lt!355503 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355502 lt!355505 mask!3266))))

(assert (=> b!797028 (= lt!355501 (seekEntryOrOpen!0 lt!355502 lt!355505 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797028 (= lt!355502 (select (store (arr!20742 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797028 (= lt!355505 (array!43325 (store (arr!20742 a!3170) i!1163 k!2044) (size!21163 a!3170)))))

(declare-fun b!797029 () Bool)

(assert (=> b!797029 (= e!442209 e!442207)))

(declare-fun res!541553 () Bool)

(assert (=> b!797029 (=> (not res!541553) (not e!442207))))

(declare-fun lt!355504 () SeekEntryResult!8333)

(assert (=> b!797029 (= res!541553 (or (= lt!355504 (MissingZero!8333 i!1163)) (= lt!355504 (MissingVacant!8333 i!1163))))))

(assert (=> b!797029 (= lt!355504 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797030 () Bool)

(declare-fun res!541545 () Bool)

(assert (=> b!797030 (=> (not res!541545) (not e!442207))))

(declare-datatypes ((List!14705 0))(
  ( (Nil!14702) (Cons!14701 (h!15830 (_ BitVec 64)) (t!21020 List!14705)) )
))
(declare-fun arrayNoDuplicates!0 (array!43324 (_ BitVec 32) List!14705) Bool)

(assert (=> b!797030 (= res!541545 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14702))))

(declare-fun b!797031 () Bool)

(declare-fun res!541546 () Bool)

(assert (=> b!797031 (=> (not res!541546) (not e!442209))))

(assert (=> b!797031 (= res!541546 (validKeyInArray!0 (select (arr!20742 a!3170) j!153)))))

(declare-fun b!797032 () Bool)

(declare-fun res!541550 () Bool)

(assert (=> b!797032 (=> (not res!541550) (not e!442209))))

(assert (=> b!797032 (= res!541550 (and (= (size!21163 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21163 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21163 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797033 () Bool)

(declare-fun res!541552 () Bool)

(assert (=> b!797033 (=> (not res!541552) (not e!442207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43324 (_ BitVec 32)) Bool)

(assert (=> b!797033 (= res!541552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!541551 () Bool)

(assert (=> start!68534 (=> (not res!541551) (not e!442209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68534 (= res!541551 (validMask!0 mask!3266))))

(assert (=> start!68534 e!442209))

(assert (=> start!68534 true))

(declare-fun array_inv!16538 (array!43324) Bool)

(assert (=> start!68534 (array_inv!16538 a!3170)))

(declare-fun b!797034 () Bool)

(declare-fun res!541549 () Bool)

(assert (=> b!797034 (=> (not res!541549) (not e!442207))))

(assert (=> b!797034 (= res!541549 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21163 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20742 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21163 a!3170)) (= (select (arr!20742 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68534 res!541551) b!797032))

(assert (= (and b!797032 res!541550) b!797031))

(assert (= (and b!797031 res!541546) b!797025))

(assert (= (and b!797025 res!541543) b!797024))

(assert (= (and b!797024 res!541548) b!797029))

(assert (= (and b!797029 res!541553) b!797033))

(assert (= (and b!797033 res!541552) b!797030))

(assert (= (and b!797030 res!541545) b!797034))

(assert (= (and b!797034 res!541549) b!797028))

(assert (= (and b!797028 res!541547) b!797026))

(assert (= (and b!797026 res!541544) b!797027))

(declare-fun m!737861 () Bool)

(assert (=> b!797026 m!737861))

(declare-fun m!737863 () Bool)

(assert (=> b!797026 m!737863))

(assert (=> b!797026 m!737863))

(declare-fun m!737865 () Bool)

(assert (=> b!797026 m!737865))

(assert (=> b!797026 m!737863))

(declare-fun m!737867 () Bool)

(assert (=> b!797026 m!737867))

(declare-fun m!737869 () Bool)

(assert (=> b!797025 m!737869))

(declare-fun m!737871 () Bool)

(assert (=> b!797029 m!737871))

(assert (=> b!797031 m!737863))

(assert (=> b!797031 m!737863))

(declare-fun m!737873 () Bool)

(assert (=> b!797031 m!737873))

(declare-fun m!737875 () Bool)

(assert (=> start!68534 m!737875))

(declare-fun m!737877 () Bool)

(assert (=> start!68534 m!737877))

(declare-fun m!737879 () Bool)

(assert (=> b!797034 m!737879))

(declare-fun m!737881 () Bool)

(assert (=> b!797034 m!737881))

(declare-fun m!737883 () Bool)

(assert (=> b!797024 m!737883))

(declare-fun m!737885 () Bool)

(assert (=> b!797030 m!737885))

(declare-fun m!737887 () Bool)

(assert (=> b!797033 m!737887))

(declare-fun m!737889 () Bool)

(assert (=> b!797028 m!737889))

(declare-fun m!737891 () Bool)

(assert (=> b!797028 m!737891))

(declare-fun m!737893 () Bool)

(assert (=> b!797028 m!737893))

(declare-fun m!737895 () Bool)

(assert (=> b!797028 m!737895))

(push 1)

(assert (not b!797026))

(assert (not b!797028))

(assert (not b!797025))

(assert (not b!797029))

(assert (not b!797030))

(assert (not b!797024))

(assert (not start!68534))

(assert (not b!797033))

