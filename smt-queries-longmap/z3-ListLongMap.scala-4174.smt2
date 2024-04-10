; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56902 () Bool)

(assert start!56902)

(declare-fun b!629965 () Bool)

(declare-fun res!407183 () Bool)

(declare-fun e!360249 () Bool)

(assert (=> b!629965 (=> (not res!407183) (not e!360249))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38035 0))(
  ( (array!38036 (arr!18253 (Array (_ BitVec 32) (_ BitVec 64))) (size!18617 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38035)

(assert (=> b!629965 (= res!407183 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18253 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18253 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629966 () Bool)

(declare-fun res!407188 () Bool)

(assert (=> b!629966 (=> (not res!407188) (not e!360249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38035 (_ BitVec 32)) Bool)

(assert (=> b!629966 (= res!407188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629967 () Bool)

(declare-fun e!360252 () Bool)

(assert (=> b!629967 (= e!360252 (not true))))

(declare-fun e!360251 () Bool)

(assert (=> b!629967 e!360251))

(declare-fun res!407185 () Bool)

(assert (=> b!629967 (=> (not res!407185) (not e!360251))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6693 0))(
  ( (MissingZero!6693 (index!29059 (_ BitVec 32))) (Found!6693 (index!29060 (_ BitVec 32))) (Intermediate!6693 (undefined!7505 Bool) (index!29061 (_ BitVec 32)) (x!57798 (_ BitVec 32))) (Undefined!6693) (MissingVacant!6693 (index!29062 (_ BitVec 32))) )
))
(declare-fun lt!290961 () SeekEntryResult!6693)

(declare-fun lt!290958 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38035 (_ BitVec 32)) SeekEntryResult!6693)

(assert (=> b!629967 (= res!407185 (= lt!290961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290958 vacantSpotIndex!68 (select (store (arr!18253 a!2986) i!1108 k0!1786) j!136) (array!38036 (store (arr!18253 a!2986) i!1108 k0!1786) (size!18617 a!2986)) mask!3053)))))

(assert (=> b!629967 (= lt!290961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290958 vacantSpotIndex!68 (select (arr!18253 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21128 0))(
  ( (Unit!21129) )
))
(declare-fun lt!290960 () Unit!21128)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21128)

(assert (=> b!629967 (= lt!290960 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290958 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629967 (= lt!290958 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629968 () Bool)

(declare-fun e!360250 () Bool)

(assert (=> b!629968 (= e!360250 e!360249)))

(declare-fun res!407186 () Bool)

(assert (=> b!629968 (=> (not res!407186) (not e!360249))))

(declare-fun lt!290959 () SeekEntryResult!6693)

(assert (=> b!629968 (= res!407186 (or (= lt!290959 (MissingZero!6693 i!1108)) (= lt!290959 (MissingVacant!6693 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38035 (_ BitVec 32)) SeekEntryResult!6693)

(assert (=> b!629968 (= lt!290959 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629969 () Bool)

(declare-fun res!407187 () Bool)

(assert (=> b!629969 (=> (not res!407187) (not e!360250))))

(assert (=> b!629969 (= res!407187 (and (= (size!18617 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18617 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18617 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629971 () Bool)

(assert (=> b!629971 (= e!360249 e!360252)))

(declare-fun res!407184 () Bool)

(assert (=> b!629971 (=> (not res!407184) (not e!360252))))

(declare-fun lt!290962 () SeekEntryResult!6693)

(assert (=> b!629971 (= res!407184 (and (= lt!290962 (Found!6693 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18253 a!2986) index!984) (select (arr!18253 a!2986) j!136))) (not (= (select (arr!18253 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!629971 (= lt!290962 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18253 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629972 () Bool)

(declare-fun res!407180 () Bool)

(assert (=> b!629972 (=> (not res!407180) (not e!360250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629972 (= res!407180 (validKeyInArray!0 k0!1786))))

(declare-fun b!629973 () Bool)

(declare-fun res!407189 () Bool)

(assert (=> b!629973 (=> (not res!407189) (not e!360250))))

(declare-fun arrayContainsKey!0 (array!38035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629973 (= res!407189 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629970 () Bool)

(declare-fun res!407182 () Bool)

(assert (=> b!629970 (=> (not res!407182) (not e!360249))))

(declare-datatypes ((List!12294 0))(
  ( (Nil!12291) (Cons!12290 (h!13335 (_ BitVec 64)) (t!18522 List!12294)) )
))
(declare-fun arrayNoDuplicates!0 (array!38035 (_ BitVec 32) List!12294) Bool)

(assert (=> b!629970 (= res!407182 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12291))))

(declare-fun res!407181 () Bool)

(assert (=> start!56902 (=> (not res!407181) (not e!360250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56902 (= res!407181 (validMask!0 mask!3053))))

(assert (=> start!56902 e!360250))

(assert (=> start!56902 true))

(declare-fun array_inv!14049 (array!38035) Bool)

(assert (=> start!56902 (array_inv!14049 a!2986)))

(declare-fun b!629974 () Bool)

(declare-fun res!407179 () Bool)

(assert (=> b!629974 (=> (not res!407179) (not e!360250))))

(assert (=> b!629974 (= res!407179 (validKeyInArray!0 (select (arr!18253 a!2986) j!136)))))

(declare-fun b!629975 () Bool)

(assert (=> b!629975 (= e!360251 (= lt!290962 lt!290961))))

(assert (= (and start!56902 res!407181) b!629969))

(assert (= (and b!629969 res!407187) b!629974))

(assert (= (and b!629974 res!407179) b!629972))

(assert (= (and b!629972 res!407180) b!629973))

(assert (= (and b!629973 res!407189) b!629968))

(assert (= (and b!629968 res!407186) b!629966))

(assert (= (and b!629966 res!407188) b!629970))

(assert (= (and b!629970 res!407182) b!629965))

(assert (= (and b!629965 res!407183) b!629971))

(assert (= (and b!629971 res!407184) b!629967))

(assert (= (and b!629967 res!407185) b!629975))

(declare-fun m!604949 () Bool)

(assert (=> b!629970 m!604949))

(declare-fun m!604951 () Bool)

(assert (=> b!629973 m!604951))

(declare-fun m!604953 () Bool)

(assert (=> b!629972 m!604953))

(declare-fun m!604955 () Bool)

(assert (=> b!629967 m!604955))

(declare-fun m!604957 () Bool)

(assert (=> b!629967 m!604957))

(declare-fun m!604959 () Bool)

(assert (=> b!629967 m!604959))

(assert (=> b!629967 m!604959))

(declare-fun m!604961 () Bool)

(assert (=> b!629967 m!604961))

(declare-fun m!604963 () Bool)

(assert (=> b!629967 m!604963))

(assert (=> b!629967 m!604957))

(declare-fun m!604965 () Bool)

(assert (=> b!629967 m!604965))

(declare-fun m!604967 () Bool)

(assert (=> b!629967 m!604967))

(assert (=> b!629974 m!604959))

(assert (=> b!629974 m!604959))

(declare-fun m!604969 () Bool)

(assert (=> b!629974 m!604969))

(declare-fun m!604971 () Bool)

(assert (=> b!629971 m!604971))

(assert (=> b!629971 m!604959))

(assert (=> b!629971 m!604959))

(declare-fun m!604973 () Bool)

(assert (=> b!629971 m!604973))

(declare-fun m!604975 () Bool)

(assert (=> b!629965 m!604975))

(assert (=> b!629965 m!604963))

(declare-fun m!604977 () Bool)

(assert (=> b!629965 m!604977))

(declare-fun m!604979 () Bool)

(assert (=> b!629968 m!604979))

(declare-fun m!604981 () Bool)

(assert (=> b!629966 m!604981))

(declare-fun m!604983 () Bool)

(assert (=> start!56902 m!604983))

(declare-fun m!604985 () Bool)

(assert (=> start!56902 m!604985))

(check-sat (not b!629966) (not b!629973) (not b!629967) (not b!629974) (not b!629970) (not b!629968) (not b!629972) (not start!56902) (not b!629971))
(check-sat)
