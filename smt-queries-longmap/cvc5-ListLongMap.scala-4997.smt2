; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68492 () Bool)

(assert start!68492)

(declare-fun b!796313 () Bool)

(declare-fun res!540839 () Bool)

(declare-fun e!441876 () Bool)

(assert (=> b!796313 (=> (not res!540839) (not e!441876))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796313 (= res!540839 (validKeyInArray!0 k!2044))))

(declare-fun b!796314 () Bool)

(declare-fun res!540835 () Bool)

(declare-fun e!441877 () Bool)

(assert (=> b!796314 (=> (not res!540835) (not e!441877))))

(declare-datatypes ((array!43282 0))(
  ( (array!43283 (arr!20721 (Array (_ BitVec 32) (_ BitVec 64))) (size!21142 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43282)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43282 (_ BitVec 32)) Bool)

(assert (=> b!796314 (= res!540835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796315 () Bool)

(declare-fun res!540833 () Bool)

(assert (=> b!796315 (=> (not res!540833) (not e!441876))))

(declare-fun arrayContainsKey!0 (array!43282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796315 (= res!540833 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796316 () Bool)

(declare-fun e!441878 () Bool)

(declare-fun e!441874 () Bool)

(assert (=> b!796316 (= e!441878 e!441874)))

(declare-fun res!540840 () Bool)

(assert (=> b!796316 (=> (not res!540840) (not e!441874))))

(declare-datatypes ((SeekEntryResult!8312 0))(
  ( (MissingZero!8312 (index!35616 (_ BitVec 32))) (Found!8312 (index!35617 (_ BitVec 32))) (Intermediate!8312 (undefined!9124 Bool) (index!35618 (_ BitVec 32)) (x!66526 (_ BitVec 32))) (Undefined!8312) (MissingVacant!8312 (index!35619 (_ BitVec 32))) )
))
(declare-fun lt!355051 () SeekEntryResult!8312)

(declare-fun lt!355052 () SeekEntryResult!8312)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796316 (= res!540840 (and (= lt!355052 lt!355051) (= lt!355051 (Found!8312 j!153)) (= (select (arr!20721 a!3170) index!1236) (select (arr!20721 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43282 (_ BitVec 32)) SeekEntryResult!8312)

(assert (=> b!796316 (= lt!355051 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20721 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43282 (_ BitVec 32)) SeekEntryResult!8312)

(assert (=> b!796316 (= lt!355052 (seekEntryOrOpen!0 (select (arr!20721 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796317 () Bool)

(declare-fun res!540837 () Bool)

(assert (=> b!796317 (=> (not res!540837) (not e!441876))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796317 (= res!540837 (and (= (size!21142 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21142 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21142 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796318 () Bool)

(declare-fun res!540836 () Bool)

(assert (=> b!796318 (=> (not res!540836) (not e!441876))))

(assert (=> b!796318 (= res!540836 (validKeyInArray!0 (select (arr!20721 a!3170) j!153)))))

(declare-fun b!796320 () Bool)

(assert (=> b!796320 (= e!441876 e!441877)))

(declare-fun res!540834 () Bool)

(assert (=> b!796320 (=> (not res!540834) (not e!441877))))

(declare-fun lt!355053 () SeekEntryResult!8312)

(assert (=> b!796320 (= res!540834 (or (= lt!355053 (MissingZero!8312 i!1163)) (= lt!355053 (MissingVacant!8312 i!1163))))))

(assert (=> b!796320 (= lt!355053 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796321 () Bool)

(assert (=> b!796321 (= e!441874 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!355055 () SeekEntryResult!8312)

(assert (=> b!796321 (= lt!355055 (Found!8312 index!1236))))

(declare-fun b!796322 () Bool)

(declare-fun res!540832 () Bool)

(assert (=> b!796322 (=> (not res!540832) (not e!441877))))

(declare-datatypes ((List!14684 0))(
  ( (Nil!14681) (Cons!14680 (h!15809 (_ BitVec 64)) (t!20999 List!14684)) )
))
(declare-fun arrayNoDuplicates!0 (array!43282 (_ BitVec 32) List!14684) Bool)

(assert (=> b!796322 (= res!540832 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14681))))

(declare-fun b!796323 () Bool)

(declare-fun res!540842 () Bool)

(assert (=> b!796323 (=> (not res!540842) (not e!441877))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!796323 (= res!540842 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21142 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20721 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21142 a!3170)) (= (select (arr!20721 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796319 () Bool)

(assert (=> b!796319 (= e!441877 e!441878)))

(declare-fun res!540838 () Bool)

(assert (=> b!796319 (=> (not res!540838) (not e!441878))))

(declare-fun lt!355050 () SeekEntryResult!8312)

(assert (=> b!796319 (= res!540838 (= lt!355050 lt!355055))))

(declare-fun lt!355049 () array!43282)

(declare-fun lt!355054 () (_ BitVec 64))

(assert (=> b!796319 (= lt!355055 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355054 lt!355049 mask!3266))))

(assert (=> b!796319 (= lt!355050 (seekEntryOrOpen!0 lt!355054 lt!355049 mask!3266))))

(assert (=> b!796319 (= lt!355054 (select (store (arr!20721 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796319 (= lt!355049 (array!43283 (store (arr!20721 a!3170) i!1163 k!2044) (size!21142 a!3170)))))

(declare-fun res!540841 () Bool)

(assert (=> start!68492 (=> (not res!540841) (not e!441876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68492 (= res!540841 (validMask!0 mask!3266))))

(assert (=> start!68492 e!441876))

(assert (=> start!68492 true))

(declare-fun array_inv!16517 (array!43282) Bool)

(assert (=> start!68492 (array_inv!16517 a!3170)))

(assert (= (and start!68492 res!540841) b!796317))

(assert (= (and b!796317 res!540837) b!796318))

(assert (= (and b!796318 res!540836) b!796313))

(assert (= (and b!796313 res!540839) b!796315))

(assert (= (and b!796315 res!540833) b!796320))

(assert (= (and b!796320 res!540834) b!796314))

(assert (= (and b!796314 res!540835) b!796322))

(assert (= (and b!796322 res!540832) b!796323))

(assert (= (and b!796323 res!540842) b!796319))

(assert (= (and b!796319 res!540838) b!796316))

(assert (= (and b!796316 res!540840) b!796321))

(declare-fun m!737087 () Bool)

(assert (=> b!796315 m!737087))

(declare-fun m!737089 () Bool)

(assert (=> b!796323 m!737089))

(declare-fun m!737091 () Bool)

(assert (=> b!796323 m!737091))

(declare-fun m!737093 () Bool)

(assert (=> b!796313 m!737093))

(declare-fun m!737095 () Bool)

(assert (=> start!68492 m!737095))

(declare-fun m!737097 () Bool)

(assert (=> start!68492 m!737097))

(declare-fun m!737099 () Bool)

(assert (=> b!796320 m!737099))

(declare-fun m!737101 () Bool)

(assert (=> b!796314 m!737101))

(declare-fun m!737103 () Bool)

(assert (=> b!796319 m!737103))

(declare-fun m!737105 () Bool)

(assert (=> b!796319 m!737105))

(declare-fun m!737107 () Bool)

(assert (=> b!796319 m!737107))

(declare-fun m!737109 () Bool)

(assert (=> b!796319 m!737109))

(declare-fun m!737111 () Bool)

(assert (=> b!796316 m!737111))

(declare-fun m!737113 () Bool)

(assert (=> b!796316 m!737113))

(assert (=> b!796316 m!737113))

(declare-fun m!737115 () Bool)

(assert (=> b!796316 m!737115))

(assert (=> b!796316 m!737113))

(declare-fun m!737117 () Bool)

(assert (=> b!796316 m!737117))

(assert (=> b!796318 m!737113))

(assert (=> b!796318 m!737113))

(declare-fun m!737119 () Bool)

(assert (=> b!796318 m!737119))

(declare-fun m!737121 () Bool)

(assert (=> b!796322 m!737121))

(push 1)

(assert (not start!68492))

(assert (not b!796318))

(assert (not b!796319))

(assert (not b!796314))

(assert (not b!796316))

(assert (not b!796320))

(assert (not b!796315))

(assert (not b!796322))

(assert (not b!796313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

