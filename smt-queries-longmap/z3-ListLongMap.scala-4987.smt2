; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68556 () Bool)

(assert start!68556)

(declare-fun b!796026 () Bool)

(declare-fun res!540179 () Bool)

(declare-fun e!441901 () Bool)

(assert (=> b!796026 (=> (not res!540179) (not e!441901))))

(declare-datatypes ((array!43220 0))(
  ( (array!43221 (arr!20686 (Array (_ BitVec 32) (_ BitVec 64))) (size!21106 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43220)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796026 (= res!540179 (validKeyInArray!0 (select (arr!20686 a!3170) j!153)))))

(declare-fun b!796027 () Bool)

(declare-fun res!540171 () Bool)

(assert (=> b!796027 (=> (not res!540171) (not e!441901))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!796027 (= res!540171 (validKeyInArray!0 k0!2044))))

(declare-fun res!540177 () Bool)

(assert (=> start!68556 (=> (not res!540177) (not e!441901))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68556 (= res!540177 (validMask!0 mask!3266))))

(assert (=> start!68556 e!441901))

(assert (=> start!68556 true))

(declare-fun array_inv!16545 (array!43220) Bool)

(assert (=> start!68556 (array_inv!16545 a!3170)))

(declare-fun b!796028 () Bool)

(declare-fun res!540174 () Bool)

(assert (=> b!796028 (=> (not res!540174) (not e!441901))))

(declare-fun arrayContainsKey!0 (array!43220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796028 (= res!540174 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796029 () Bool)

(declare-fun res!540176 () Bool)

(assert (=> b!796029 (=> (not res!540176) (not e!441901))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796029 (= res!540176 (and (= (size!21106 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21106 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21106 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796030 () Bool)

(declare-fun e!441899 () Bool)

(declare-fun e!441898 () Bool)

(assert (=> b!796030 (= e!441899 e!441898)))

(declare-fun res!540180 () Bool)

(assert (=> b!796030 (=> (not res!540180) (not e!441898))))

(declare-fun lt!354817 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354815 () array!43220)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8233 0))(
  ( (MissingZero!8233 (index!35300 (_ BitVec 32))) (Found!8233 (index!35301 (_ BitVec 32))) (Intermediate!8233 (undefined!9045 Bool) (index!35302 (_ BitVec 32)) (x!66378 (_ BitVec 32))) (Undefined!8233) (MissingVacant!8233 (index!35303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43220 (_ BitVec 32)) SeekEntryResult!8233)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43220 (_ BitVec 32)) SeekEntryResult!8233)

(assert (=> b!796030 (= res!540180 (= (seekEntryOrOpen!0 lt!354817 lt!354815 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354817 lt!354815 mask!3266)))))

(assert (=> b!796030 (= lt!354817 (select (store (arr!20686 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796030 (= lt!354815 (array!43221 (store (arr!20686 a!3170) i!1163 k0!2044) (size!21106 a!3170)))))

(declare-fun lt!354813 () SeekEntryResult!8233)

(declare-fun lt!354816 () SeekEntryResult!8233)

(declare-fun b!796031 () Bool)

(assert (=> b!796031 (= e!441898 (and (= lt!354813 lt!354816) (= lt!354816 (Found!8233 j!153)) (= (select (arr!20686 a!3170) index!1236) (select (arr!20686 a!3170) j!153)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796031 (= lt!354816 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20686 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796031 (= lt!354813 (seekEntryOrOpen!0 (select (arr!20686 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796032 () Bool)

(declare-fun res!540175 () Bool)

(assert (=> b!796032 (=> (not res!540175) (not e!441899))))

(declare-datatypes ((List!14556 0))(
  ( (Nil!14553) (Cons!14552 (h!15687 (_ BitVec 64)) (t!20863 List!14556)) )
))
(declare-fun arrayNoDuplicates!0 (array!43220 (_ BitVec 32) List!14556) Bool)

(assert (=> b!796032 (= res!540175 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14553))))

(declare-fun b!796033 () Bool)

(assert (=> b!796033 (= e!441901 e!441899)))

(declare-fun res!540173 () Bool)

(assert (=> b!796033 (=> (not res!540173) (not e!441899))))

(declare-fun lt!354814 () SeekEntryResult!8233)

(assert (=> b!796033 (= res!540173 (or (= lt!354814 (MissingZero!8233 i!1163)) (= lt!354814 (MissingVacant!8233 i!1163))))))

(assert (=> b!796033 (= lt!354814 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796034 () Bool)

(declare-fun res!540172 () Bool)

(assert (=> b!796034 (=> (not res!540172) (not e!441899))))

(assert (=> b!796034 (= res!540172 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21106 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20686 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21106 a!3170)) (= (select (arr!20686 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796035 () Bool)

(declare-fun res!540178 () Bool)

(assert (=> b!796035 (=> (not res!540178) (not e!441899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43220 (_ BitVec 32)) Bool)

(assert (=> b!796035 (= res!540178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68556 res!540177) b!796029))

(assert (= (and b!796029 res!540176) b!796026))

(assert (= (and b!796026 res!540179) b!796027))

(assert (= (and b!796027 res!540171) b!796028))

(assert (= (and b!796028 res!540174) b!796033))

(assert (= (and b!796033 res!540173) b!796035))

(assert (= (and b!796035 res!540178) b!796032))

(assert (= (and b!796032 res!540175) b!796034))

(assert (= (and b!796034 res!540172) b!796030))

(assert (= (and b!796030 res!540180) b!796031))

(declare-fun m!737081 () Bool)

(assert (=> b!796031 m!737081))

(declare-fun m!737083 () Bool)

(assert (=> b!796031 m!737083))

(assert (=> b!796031 m!737083))

(declare-fun m!737085 () Bool)

(assert (=> b!796031 m!737085))

(assert (=> b!796031 m!737083))

(declare-fun m!737087 () Bool)

(assert (=> b!796031 m!737087))

(declare-fun m!737089 () Bool)

(assert (=> b!796028 m!737089))

(declare-fun m!737091 () Bool)

(assert (=> start!68556 m!737091))

(declare-fun m!737093 () Bool)

(assert (=> start!68556 m!737093))

(declare-fun m!737095 () Bool)

(assert (=> b!796034 m!737095))

(declare-fun m!737097 () Bool)

(assert (=> b!796034 m!737097))

(declare-fun m!737099 () Bool)

(assert (=> b!796035 m!737099))

(assert (=> b!796026 m!737083))

(assert (=> b!796026 m!737083))

(declare-fun m!737101 () Bool)

(assert (=> b!796026 m!737101))

(declare-fun m!737103 () Bool)

(assert (=> b!796030 m!737103))

(declare-fun m!737105 () Bool)

(assert (=> b!796030 m!737105))

(declare-fun m!737107 () Bool)

(assert (=> b!796030 m!737107))

(declare-fun m!737109 () Bool)

(assert (=> b!796030 m!737109))

(declare-fun m!737111 () Bool)

(assert (=> b!796032 m!737111))

(declare-fun m!737113 () Bool)

(assert (=> b!796027 m!737113))

(declare-fun m!737115 () Bool)

(assert (=> b!796033 m!737115))

(check-sat (not b!796030) (not b!796028) (not b!796035) (not b!796026) (not start!68556) (not b!796031) (not b!796032) (not b!796027) (not b!796033))
(check-sat)
