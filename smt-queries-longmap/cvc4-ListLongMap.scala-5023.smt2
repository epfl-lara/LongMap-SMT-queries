; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68652 () Bool)

(assert start!68652)

(declare-fun b!799041 () Bool)

(declare-fun res!543571 () Bool)

(declare-fun e!443149 () Bool)

(assert (=> b!799041 (=> (not res!543571) (not e!443149))))

(declare-datatypes ((array!43442 0))(
  ( (array!43443 (arr!20801 (Array (_ BitVec 32) (_ BitVec 64))) (size!21222 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43442)

(declare-datatypes ((List!14764 0))(
  ( (Nil!14761) (Cons!14760 (h!15889 (_ BitVec 64)) (t!21079 List!14764)) )
))
(declare-fun arrayNoDuplicates!0 (array!43442 (_ BitVec 32) List!14764) Bool)

(assert (=> b!799041 (= res!543571 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14761))))

(declare-fun b!799042 () Bool)

(declare-fun e!443150 () Bool)

(declare-fun e!443147 () Bool)

(assert (=> b!799042 (= e!443150 e!443147)))

(declare-fun res!543570 () Bool)

(assert (=> b!799042 (=> (not res!543570) (not e!443147))))

(declare-fun lt!356748 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!799042 (= res!543570 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356748 #b00000000000000000000000000000000) (bvslt lt!356748 (size!21222 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799042 (= lt!356748 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799043 () Bool)

(declare-fun res!543565 () Bool)

(assert (=> b!799043 (=> (not res!543565) (not e!443147))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356752 () array!43442)

(declare-datatypes ((SeekEntryResult!8392 0))(
  ( (MissingZero!8392 (index!35936 (_ BitVec 32))) (Found!8392 (index!35937 (_ BitVec 32))) (Intermediate!8392 (undefined!9204 Bool) (index!35938 (_ BitVec 32)) (x!66814 (_ BitVec 32))) (Undefined!8392) (MissingVacant!8392 (index!35939 (_ BitVec 32))) )
))
(declare-fun lt!356750 () SeekEntryResult!8392)

(declare-fun lt!356747 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43442 (_ BitVec 32)) SeekEntryResult!8392)

(assert (=> b!799043 (= res!543565 (= lt!356750 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356748 vacantAfter!23 lt!356747 lt!356752 mask!3266)))))

(declare-fun res!543572 () Bool)

(declare-fun e!443148 () Bool)

(assert (=> start!68652 (=> (not res!543572) (not e!443148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68652 (= res!543572 (validMask!0 mask!3266))))

(assert (=> start!68652 e!443148))

(assert (=> start!68652 true))

(declare-fun array_inv!16597 (array!43442) Bool)

(assert (=> start!68652 (array_inv!16597 a!3170)))

(declare-fun b!799044 () Bool)

(assert (=> b!799044 (= e!443147 false)))

(declare-fun lt!356746 () SeekEntryResult!8392)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799044 (= lt!356746 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356748 vacantBefore!23 (select (arr!20801 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799045 () Bool)

(declare-fun res!543566 () Bool)

(assert (=> b!799045 (=> (not res!543566) (not e!443149))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799045 (= res!543566 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21222 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20801 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21222 a!3170)) (= (select (arr!20801 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799046 () Bool)

(declare-fun res!543560 () Bool)

(assert (=> b!799046 (=> (not res!543560) (not e!443148))))

(assert (=> b!799046 (= res!543560 (and (= (size!21222 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21222 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21222 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799047 () Bool)

(declare-fun res!543568 () Bool)

(assert (=> b!799047 (=> (not res!543568) (not e!443148))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799047 (= res!543568 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799048 () Bool)

(declare-fun e!443146 () Bool)

(assert (=> b!799048 (= e!443149 e!443146)))

(declare-fun res!543563 () Bool)

(assert (=> b!799048 (=> (not res!543563) (not e!443146))))

(assert (=> b!799048 (= res!543563 (= lt!356750 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356747 lt!356752 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43442 (_ BitVec 32)) SeekEntryResult!8392)

(assert (=> b!799048 (= lt!356750 (seekEntryOrOpen!0 lt!356747 lt!356752 mask!3266))))

(assert (=> b!799048 (= lt!356747 (select (store (arr!20801 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799048 (= lt!356752 (array!43443 (store (arr!20801 a!3170) i!1163 k!2044) (size!21222 a!3170)))))

(declare-fun b!799049 () Bool)

(assert (=> b!799049 (= e!443146 e!443150)))

(declare-fun res!543564 () Bool)

(assert (=> b!799049 (=> (not res!543564) (not e!443150))))

(declare-fun lt!356753 () SeekEntryResult!8392)

(declare-fun lt!356751 () SeekEntryResult!8392)

(assert (=> b!799049 (= res!543564 (and (= lt!356751 lt!356753) (= lt!356753 (Found!8392 j!153)) (not (= (select (arr!20801 a!3170) index!1236) (select (arr!20801 a!3170) j!153)))))))

(assert (=> b!799049 (= lt!356753 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20801 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799049 (= lt!356751 (seekEntryOrOpen!0 (select (arr!20801 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799050 () Bool)

(assert (=> b!799050 (= e!443148 e!443149)))

(declare-fun res!543562 () Bool)

(assert (=> b!799050 (=> (not res!543562) (not e!443149))))

(declare-fun lt!356749 () SeekEntryResult!8392)

(assert (=> b!799050 (= res!543562 (or (= lt!356749 (MissingZero!8392 i!1163)) (= lt!356749 (MissingVacant!8392 i!1163))))))

(assert (=> b!799050 (= lt!356749 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799051 () Bool)

(declare-fun res!543569 () Bool)

(assert (=> b!799051 (=> (not res!543569) (not e!443148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799051 (= res!543569 (validKeyInArray!0 (select (arr!20801 a!3170) j!153)))))

(declare-fun b!799052 () Bool)

(declare-fun res!543561 () Bool)

(assert (=> b!799052 (=> (not res!543561) (not e!443148))))

(assert (=> b!799052 (= res!543561 (validKeyInArray!0 k!2044))))

(declare-fun b!799053 () Bool)

(declare-fun res!543567 () Bool)

(assert (=> b!799053 (=> (not res!543567) (not e!443149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43442 (_ BitVec 32)) Bool)

(assert (=> b!799053 (= res!543567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68652 res!543572) b!799046))

(assert (= (and b!799046 res!543560) b!799051))

(assert (= (and b!799051 res!543569) b!799052))

(assert (= (and b!799052 res!543561) b!799047))

(assert (= (and b!799047 res!543568) b!799050))

(assert (= (and b!799050 res!543562) b!799053))

(assert (= (and b!799053 res!543567) b!799041))

(assert (= (and b!799041 res!543571) b!799045))

(assert (= (and b!799045 res!543566) b!799048))

(assert (= (and b!799048 res!543563) b!799049))

(assert (= (and b!799049 res!543564) b!799042))

(assert (= (and b!799042 res!543570) b!799043))

(assert (= (and b!799043 res!543565) b!799044))

(declare-fun m!740021 () Bool)

(assert (=> b!799048 m!740021))

(declare-fun m!740023 () Bool)

(assert (=> b!799048 m!740023))

(declare-fun m!740025 () Bool)

(assert (=> b!799048 m!740025))

(declare-fun m!740027 () Bool)

(assert (=> b!799048 m!740027))

(declare-fun m!740029 () Bool)

(assert (=> b!799047 m!740029))

(declare-fun m!740031 () Bool)

(assert (=> b!799045 m!740031))

(declare-fun m!740033 () Bool)

(assert (=> b!799045 m!740033))

(declare-fun m!740035 () Bool)

(assert (=> b!799050 m!740035))

(declare-fun m!740037 () Bool)

(assert (=> b!799049 m!740037))

(declare-fun m!740039 () Bool)

(assert (=> b!799049 m!740039))

(assert (=> b!799049 m!740039))

(declare-fun m!740041 () Bool)

(assert (=> b!799049 m!740041))

(assert (=> b!799049 m!740039))

(declare-fun m!740043 () Bool)

(assert (=> b!799049 m!740043))

(declare-fun m!740045 () Bool)

(assert (=> b!799042 m!740045))

(assert (=> b!799051 m!740039))

(assert (=> b!799051 m!740039))

(declare-fun m!740047 () Bool)

(assert (=> b!799051 m!740047))

(declare-fun m!740049 () Bool)

(assert (=> b!799052 m!740049))

(declare-fun m!740051 () Bool)

(assert (=> b!799041 m!740051))

(declare-fun m!740053 () Bool)

(assert (=> b!799053 m!740053))

(assert (=> b!799044 m!740039))

(assert (=> b!799044 m!740039))

(declare-fun m!740055 () Bool)

(assert (=> b!799044 m!740055))

(declare-fun m!740057 () Bool)

(assert (=> start!68652 m!740057))

(declare-fun m!740059 () Bool)

(assert (=> start!68652 m!740059))

(declare-fun m!740061 () Bool)

(assert (=> b!799043 m!740061))

(push 1)

