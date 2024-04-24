; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69044 () Bool)

(assert start!69044)

(declare-fun b!804072 () Bool)

(declare-fun e!445651 () Bool)

(declare-fun e!445648 () Bool)

(assert (=> b!804072 (= e!445651 e!445648)))

(declare-fun res!548050 () Bool)

(assert (=> b!804072 (=> (not res!548050) (not e!445648))))

(declare-datatypes ((array!43666 0))(
  ( (array!43667 (arr!20908 (Array (_ BitVec 32) (_ BitVec 64))) (size!21328 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43666)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8455 0))(
  ( (MissingZero!8455 (index!36188 (_ BitVec 32))) (Found!8455 (index!36189 (_ BitVec 32))) (Intermediate!8455 (undefined!9267 Bool) (index!36190 (_ BitVec 32)) (x!67195 (_ BitVec 32))) (Undefined!8455) (MissingVacant!8455 (index!36191 (_ BitVec 32))) )
))
(declare-fun lt!359774 () SeekEntryResult!8455)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359770 () SeekEntryResult!8455)

(assert (=> b!804072 (= res!548050 (and (= lt!359774 lt!359770) (not (= (select (arr!20908 a!3170) index!1236) (select (arr!20908 a!3170) j!153)))))))

(assert (=> b!804072 (= lt!359770 (Found!8455 j!153))))

(declare-fun b!804073 () Bool)

(declare-fun res!548044 () Bool)

(declare-fun e!445647 () Bool)

(assert (=> b!804073 (=> (not res!548044) (not e!445647))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804073 (= res!548044 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21328 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20908 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21328 a!3170)) (= (select (arr!20908 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804074 () Bool)

(declare-fun e!445645 () Bool)

(assert (=> b!804074 (= e!445648 (not e!445645))))

(declare-fun res!548055 () Bool)

(assert (=> b!804074 (=> res!548055 e!445645)))

(declare-fun lt!359776 () SeekEntryResult!8455)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804074 (= res!548055 (or (not (= lt!359776 lt!359770)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20908 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359775 () array!43666)

(declare-fun lt!359768 () (_ BitVec 32))

(declare-fun lt!359773 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43666 (_ BitVec 32)) SeekEntryResult!8455)

(assert (=> b!804074 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359768 vacantAfter!23 lt!359773 lt!359775 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359768 vacantBefore!23 (select (arr!20908 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27535 0))(
  ( (Unit!27536) )
))
(declare-fun lt!359769 () Unit!27535)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43666 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27535)

(assert (=> b!804074 (= lt!359769 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359768 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804074 (= lt!359768 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804075 () Bool)

(declare-fun e!445649 () Bool)

(assert (=> b!804075 (= e!445649 e!445651)))

(declare-fun res!548054 () Bool)

(assert (=> b!804075 (=> (not res!548054) (not e!445651))))

(declare-fun lt!359772 () SeekEntryResult!8455)

(assert (=> b!804075 (= res!548054 (= lt!359772 lt!359774))))

(assert (=> b!804075 (= lt!359774 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20908 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43666 (_ BitVec 32)) SeekEntryResult!8455)

(assert (=> b!804075 (= lt!359772 (seekEntryOrOpen!0 (select (arr!20908 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804076 () Bool)

(declare-fun res!548048 () Bool)

(assert (=> b!804076 (=> (not res!548048) (not e!445647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43666 (_ BitVec 32)) Bool)

(assert (=> b!804076 (= res!548048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804077 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804077 (= e!445645 (validKeyInArray!0 lt!359773))))

(declare-fun b!804078 () Bool)

(declare-fun res!548049 () Bool)

(declare-fun e!445646 () Bool)

(assert (=> b!804078 (=> (not res!548049) (not e!445646))))

(declare-fun arrayContainsKey!0 (array!43666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804078 (= res!548049 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804079 () Bool)

(assert (=> b!804079 (= e!445646 e!445647)))

(declare-fun res!548052 () Bool)

(assert (=> b!804079 (=> (not res!548052) (not e!445647))))

(declare-fun lt!359777 () SeekEntryResult!8455)

(assert (=> b!804079 (= res!548052 (or (= lt!359777 (MissingZero!8455 i!1163)) (= lt!359777 (MissingVacant!8455 i!1163))))))

(assert (=> b!804079 (= lt!359777 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804080 () Bool)

(declare-fun res!548046 () Bool)

(assert (=> b!804080 (=> (not res!548046) (not e!445646))))

(assert (=> b!804080 (= res!548046 (validKeyInArray!0 (select (arr!20908 a!3170) j!153)))))

(declare-fun res!548047 () Bool)

(assert (=> start!69044 (=> (not res!548047) (not e!445646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69044 (= res!548047 (validMask!0 mask!3266))))

(assert (=> start!69044 e!445646))

(assert (=> start!69044 true))

(declare-fun array_inv!16767 (array!43666) Bool)

(assert (=> start!69044 (array_inv!16767 a!3170)))

(declare-fun b!804081 () Bool)

(assert (=> b!804081 (= e!445647 e!445649)))

(declare-fun res!548051 () Bool)

(assert (=> b!804081 (=> (not res!548051) (not e!445649))))

(declare-fun lt!359771 () SeekEntryResult!8455)

(assert (=> b!804081 (= res!548051 (= lt!359771 lt!359776))))

(assert (=> b!804081 (= lt!359776 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359773 lt!359775 mask!3266))))

(assert (=> b!804081 (= lt!359771 (seekEntryOrOpen!0 lt!359773 lt!359775 mask!3266))))

(assert (=> b!804081 (= lt!359773 (select (store (arr!20908 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804081 (= lt!359775 (array!43667 (store (arr!20908 a!3170) i!1163 k0!2044) (size!21328 a!3170)))))

(declare-fun b!804082 () Bool)

(declare-fun res!548045 () Bool)

(assert (=> b!804082 (=> (not res!548045) (not e!445646))))

(assert (=> b!804082 (= res!548045 (validKeyInArray!0 k0!2044))))

(declare-fun b!804083 () Bool)

(declare-fun res!548043 () Bool)

(assert (=> b!804083 (=> (not res!548043) (not e!445646))))

(assert (=> b!804083 (= res!548043 (and (= (size!21328 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21328 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21328 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804084 () Bool)

(declare-fun res!548053 () Bool)

(assert (=> b!804084 (=> (not res!548053) (not e!445647))))

(declare-datatypes ((List!14778 0))(
  ( (Nil!14775) (Cons!14774 (h!15909 (_ BitVec 64)) (t!21085 List!14778)) )
))
(declare-fun arrayNoDuplicates!0 (array!43666 (_ BitVec 32) List!14778) Bool)

(assert (=> b!804084 (= res!548053 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14775))))

(assert (= (and start!69044 res!548047) b!804083))

(assert (= (and b!804083 res!548043) b!804080))

(assert (= (and b!804080 res!548046) b!804082))

(assert (= (and b!804082 res!548045) b!804078))

(assert (= (and b!804078 res!548049) b!804079))

(assert (= (and b!804079 res!548052) b!804076))

(assert (= (and b!804076 res!548048) b!804084))

(assert (= (and b!804084 res!548053) b!804073))

(assert (= (and b!804073 res!548044) b!804081))

(assert (= (and b!804081 res!548051) b!804075))

(assert (= (and b!804075 res!548054) b!804072))

(assert (= (and b!804072 res!548050) b!804074))

(assert (= (and b!804074 (not res!548055)) b!804077))

(declare-fun m!746095 () Bool)

(assert (=> start!69044 m!746095))

(declare-fun m!746097 () Bool)

(assert (=> start!69044 m!746097))

(declare-fun m!746099 () Bool)

(assert (=> b!804072 m!746099))

(declare-fun m!746101 () Bool)

(assert (=> b!804072 m!746101))

(assert (=> b!804075 m!746101))

(assert (=> b!804075 m!746101))

(declare-fun m!746103 () Bool)

(assert (=> b!804075 m!746103))

(assert (=> b!804075 m!746101))

(declare-fun m!746105 () Bool)

(assert (=> b!804075 m!746105))

(declare-fun m!746107 () Bool)

(assert (=> b!804084 m!746107))

(declare-fun m!746109 () Bool)

(assert (=> b!804082 m!746109))

(assert (=> b!804074 m!746101))

(assert (=> b!804074 m!746101))

(declare-fun m!746111 () Bool)

(assert (=> b!804074 m!746111))

(declare-fun m!746113 () Bool)

(assert (=> b!804074 m!746113))

(declare-fun m!746115 () Bool)

(assert (=> b!804074 m!746115))

(declare-fun m!746117 () Bool)

(assert (=> b!804074 m!746117))

(declare-fun m!746119 () Bool)

(assert (=> b!804074 m!746119))

(declare-fun m!746121 () Bool)

(assert (=> b!804074 m!746121))

(declare-fun m!746123 () Bool)

(assert (=> b!804078 m!746123))

(declare-fun m!746125 () Bool)

(assert (=> b!804073 m!746125))

(declare-fun m!746127 () Bool)

(assert (=> b!804073 m!746127))

(declare-fun m!746129 () Bool)

(assert (=> b!804076 m!746129))

(assert (=> b!804080 m!746101))

(assert (=> b!804080 m!746101))

(declare-fun m!746131 () Bool)

(assert (=> b!804080 m!746131))

(declare-fun m!746133 () Bool)

(assert (=> b!804077 m!746133))

(declare-fun m!746135 () Bool)

(assert (=> b!804079 m!746135))

(declare-fun m!746137 () Bool)

(assert (=> b!804081 m!746137))

(declare-fun m!746139 () Bool)

(assert (=> b!804081 m!746139))

(assert (=> b!804081 m!746121))

(declare-fun m!746141 () Bool)

(assert (=> b!804081 m!746141))

(check-sat (not start!69044) (not b!804076) (not b!804082) (not b!804075) (not b!804079) (not b!804078) (not b!804084) (not b!804077) (not b!804074) (not b!804081) (not b!804080))
(check-sat)
