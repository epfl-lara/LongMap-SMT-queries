; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69250 () Bool)

(assert start!69250)

(declare-fun b!807965 () Bool)

(declare-fun e!447291 () Bool)

(declare-fun e!447289 () Bool)

(assert (=> b!807965 (= e!447291 e!447289)))

(declare-fun res!552094 () Bool)

(assert (=> b!807965 (=> (not res!552094) (not e!447289))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43950 0))(
  ( (array!43951 (arr!21052 (Array (_ BitVec 32) (_ BitVec 64))) (size!21473 (_ BitVec 32))) )
))
(declare-fun lt!362017 () array!43950)

(declare-fun lt!362021 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8643 0))(
  ( (MissingZero!8643 (index!36940 (_ BitVec 32))) (Found!8643 (index!36941 (_ BitVec 32))) (Intermediate!8643 (undefined!9455 Bool) (index!36942 (_ BitVec 32)) (x!67743 (_ BitVec 32))) (Undefined!8643) (MissingVacant!8643 (index!36943 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43950 (_ BitVec 32)) SeekEntryResult!8643)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43950 (_ BitVec 32)) SeekEntryResult!8643)

(assert (=> b!807965 (= res!552094 (= (seekEntryOrOpen!0 lt!362021 lt!362017 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362021 lt!362017 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43950)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807965 (= lt!362021 (select (store (arr!21052 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807965 (= lt!362017 (array!43951 (store (arr!21052 a!3170) i!1163 k0!2044) (size!21473 a!3170)))))

(declare-fun res!552098 () Bool)

(declare-fun e!447293 () Bool)

(assert (=> start!69250 (=> (not res!552098) (not e!447293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69250 (= res!552098 (validMask!0 mask!3266))))

(assert (=> start!69250 e!447293))

(assert (=> start!69250 true))

(declare-fun array_inv!16848 (array!43950) Bool)

(assert (=> start!69250 (array_inv!16848 a!3170)))

(declare-fun b!807966 () Bool)

(declare-fun res!552095 () Bool)

(assert (=> b!807966 (=> (not res!552095) (not e!447293))))

(assert (=> b!807966 (= res!552095 (and (= (size!21473 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21473 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21473 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807967 () Bool)

(declare-fun e!447290 () Bool)

(assert (=> b!807967 (= e!447289 e!447290)))

(declare-fun res!552088 () Bool)

(assert (=> b!807967 (=> (not res!552088) (not e!447290))))

(declare-fun lt!362016 () SeekEntryResult!8643)

(declare-fun lt!362018 () SeekEntryResult!8643)

(assert (=> b!807967 (= res!552088 (and (= lt!362018 lt!362016) (= lt!362016 (Found!8643 j!153)) (not (= (select (arr!21052 a!3170) index!1236) (select (arr!21052 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807967 (= lt!362016 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21052 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807967 (= lt!362018 (seekEntryOrOpen!0 (select (arr!21052 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807968 () Bool)

(assert (=> b!807968 (= e!447290 false)))

(declare-fun lt!362020 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807968 (= lt!362020 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807969 () Bool)

(declare-fun res!552089 () Bool)

(assert (=> b!807969 (=> (not res!552089) (not e!447291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43950 (_ BitVec 32)) Bool)

(assert (=> b!807969 (= res!552089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807970 () Bool)

(declare-fun res!552093 () Bool)

(assert (=> b!807970 (=> (not res!552093) (not e!447293))))

(declare-fun arrayContainsKey!0 (array!43950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807970 (= res!552093 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807971 () Bool)

(declare-fun res!552090 () Bool)

(assert (=> b!807971 (=> (not res!552090) (not e!447291))))

(assert (=> b!807971 (= res!552090 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21473 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21052 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21473 a!3170)) (= (select (arr!21052 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807972 () Bool)

(assert (=> b!807972 (= e!447293 e!447291)))

(declare-fun res!552096 () Bool)

(assert (=> b!807972 (=> (not res!552096) (not e!447291))))

(declare-fun lt!362019 () SeekEntryResult!8643)

(assert (=> b!807972 (= res!552096 (or (= lt!362019 (MissingZero!8643 i!1163)) (= lt!362019 (MissingVacant!8643 i!1163))))))

(assert (=> b!807972 (= lt!362019 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807973 () Bool)

(declare-fun res!552091 () Bool)

(assert (=> b!807973 (=> (not res!552091) (not e!447291))))

(declare-datatypes ((List!15015 0))(
  ( (Nil!15012) (Cons!15011 (h!16140 (_ BitVec 64)) (t!21330 List!15015)) )
))
(declare-fun arrayNoDuplicates!0 (array!43950 (_ BitVec 32) List!15015) Bool)

(assert (=> b!807973 (= res!552091 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15012))))

(declare-fun b!807974 () Bool)

(declare-fun res!552092 () Bool)

(assert (=> b!807974 (=> (not res!552092) (not e!447293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807974 (= res!552092 (validKeyInArray!0 k0!2044))))

(declare-fun b!807975 () Bool)

(declare-fun res!552097 () Bool)

(assert (=> b!807975 (=> (not res!552097) (not e!447293))))

(assert (=> b!807975 (= res!552097 (validKeyInArray!0 (select (arr!21052 a!3170) j!153)))))

(assert (= (and start!69250 res!552098) b!807966))

(assert (= (and b!807966 res!552095) b!807975))

(assert (= (and b!807975 res!552097) b!807974))

(assert (= (and b!807974 res!552092) b!807970))

(assert (= (and b!807970 res!552093) b!807972))

(assert (= (and b!807972 res!552096) b!807969))

(assert (= (and b!807969 res!552089) b!807973))

(assert (= (and b!807973 res!552091) b!807971))

(assert (= (and b!807971 res!552090) b!807965))

(assert (= (and b!807965 res!552094) b!807967))

(assert (= (and b!807967 res!552088) b!807968))

(declare-fun m!750079 () Bool)

(assert (=> b!807971 m!750079))

(declare-fun m!750081 () Bool)

(assert (=> b!807971 m!750081))

(declare-fun m!750083 () Bool)

(assert (=> b!807974 m!750083))

(declare-fun m!750085 () Bool)

(assert (=> b!807973 m!750085))

(declare-fun m!750087 () Bool)

(assert (=> b!807965 m!750087))

(declare-fun m!750089 () Bool)

(assert (=> b!807965 m!750089))

(declare-fun m!750091 () Bool)

(assert (=> b!807965 m!750091))

(declare-fun m!750093 () Bool)

(assert (=> b!807965 m!750093))

(declare-fun m!750095 () Bool)

(assert (=> b!807969 m!750095))

(declare-fun m!750097 () Bool)

(assert (=> b!807970 m!750097))

(declare-fun m!750099 () Bool)

(assert (=> b!807972 m!750099))

(declare-fun m!750101 () Bool)

(assert (=> b!807975 m!750101))

(assert (=> b!807975 m!750101))

(declare-fun m!750103 () Bool)

(assert (=> b!807975 m!750103))

(declare-fun m!750105 () Bool)

(assert (=> start!69250 m!750105))

(declare-fun m!750107 () Bool)

(assert (=> start!69250 m!750107))

(declare-fun m!750109 () Bool)

(assert (=> b!807968 m!750109))

(declare-fun m!750111 () Bool)

(assert (=> b!807967 m!750111))

(assert (=> b!807967 m!750101))

(assert (=> b!807967 m!750101))

(declare-fun m!750113 () Bool)

(assert (=> b!807967 m!750113))

(assert (=> b!807967 m!750101))

(declare-fun m!750115 () Bool)

(assert (=> b!807967 m!750115))

(check-sat (not b!807965) (not b!807974) (not b!807972) (not b!807967) (not b!807970) (not b!807969) (not b!807968) (not start!69250) (not b!807975) (not b!807973))
(check-sat)
