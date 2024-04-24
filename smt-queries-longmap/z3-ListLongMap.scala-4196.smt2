; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57324 () Bool)

(assert start!57324)

(declare-fun b!634142 () Bool)

(declare-fun res!410140 () Bool)

(declare-fun e!362615 () Bool)

(assert (=> b!634142 (=> (not res!410140) (not e!362615))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634142 (= res!410140 (validKeyInArray!0 k0!1786))))

(declare-fun b!634143 () Bool)

(declare-fun res!410138 () Bool)

(assert (=> b!634143 (=> (not res!410138) (not e!362615))))

(declare-datatypes ((array!38172 0))(
  ( (array!38173 (arr!18313 (Array (_ BitVec 32) (_ BitVec 64))) (size!18677 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38172)

(declare-fun arrayContainsKey!0 (array!38172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634143 (= res!410138 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634144 () Bool)

(declare-fun e!362624 () Bool)

(assert (=> b!634144 (= e!362615 e!362624)))

(declare-fun res!410144 () Bool)

(assert (=> b!634144 (=> (not res!410144) (not e!362624))))

(declare-datatypes ((SeekEntryResult!6709 0))(
  ( (MissingZero!6709 (index!29135 (_ BitVec 32))) (Found!6709 (index!29136 (_ BitVec 32))) (Intermediate!6709 (undefined!7521 Bool) (index!29137 (_ BitVec 32)) (x!58029 (_ BitVec 32))) (Undefined!6709) (MissingVacant!6709 (index!29138 (_ BitVec 32))) )
))
(declare-fun lt!293142 () SeekEntryResult!6709)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634144 (= res!410144 (or (= lt!293142 (MissingZero!6709 i!1108)) (= lt!293142 (MissingVacant!6709 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38172 (_ BitVec 32)) SeekEntryResult!6709)

(assert (=> b!634144 (= lt!293142 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634145 () Bool)

(declare-fun e!362623 () Bool)

(assert (=> b!634145 (= e!362623 true)))

(declare-fun e!362617 () Bool)

(assert (=> b!634145 e!362617))

(declare-fun res!410132 () Bool)

(assert (=> b!634145 (=> (not res!410132) (not e!362617))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293136 () (_ BitVec 64))

(assert (=> b!634145 (= res!410132 (= lt!293136 (select (arr!18313 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634145 (= lt!293136 (select (store (arr!18313 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!410133 () Bool)

(assert (=> start!57324 (=> (not res!410133) (not e!362615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57324 (= res!410133 (validMask!0 mask!3053))))

(assert (=> start!57324 e!362615))

(assert (=> start!57324 true))

(declare-fun array_inv!14172 (array!38172) Bool)

(assert (=> start!57324 (array_inv!14172 a!2986)))

(declare-fun b!634146 () Bool)

(declare-fun e!362621 () Bool)

(assert (=> b!634146 (= e!362617 e!362621)))

(declare-fun res!410146 () Bool)

(assert (=> b!634146 (=> res!410146 e!362621)))

(declare-fun lt!293143 () (_ BitVec 64))

(assert (=> b!634146 (= res!410146 (or (not (= (select (arr!18313 a!2986) j!136) lt!293143)) (not (= (select (arr!18313 a!2986) j!136) lt!293136)) (bvsge j!136 index!984)))))

(declare-fun b!634147 () Bool)

(declare-fun e!362622 () Bool)

(assert (=> b!634147 (= e!362624 e!362622)))

(declare-fun res!410135 () Bool)

(assert (=> b!634147 (=> (not res!410135) (not e!362622))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!634147 (= res!410135 (= (select (store (arr!18313 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293137 () array!38172)

(assert (=> b!634147 (= lt!293137 (array!38173 (store (arr!18313 a!2986) i!1108 k0!1786) (size!18677 a!2986)))))

(declare-fun b!634148 () Bool)

(declare-fun res!410136 () Bool)

(assert (=> b!634148 (=> (not res!410136) (not e!362624))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!634148 (= res!410136 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18313 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634149 () Bool)

(declare-fun e!362619 () Bool)

(assert (=> b!634149 (= e!362619 (not e!362623))))

(declare-fun res!410145 () Bool)

(assert (=> b!634149 (=> res!410145 e!362623)))

(declare-fun lt!293138 () SeekEntryResult!6709)

(assert (=> b!634149 (= res!410145 (not (= lt!293138 (Found!6709 index!984))))))

(declare-datatypes ((Unit!21345 0))(
  ( (Unit!21346) )
))
(declare-fun lt!293135 () Unit!21345)

(declare-fun e!362620 () Unit!21345)

(assert (=> b!634149 (= lt!293135 e!362620)))

(declare-fun c!72374 () Bool)

(assert (=> b!634149 (= c!72374 (= lt!293138 Undefined!6709))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38172 (_ BitVec 32)) SeekEntryResult!6709)

(assert (=> b!634149 (= lt!293138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293143 lt!293137 mask!3053))))

(declare-fun e!362625 () Bool)

(assert (=> b!634149 e!362625))

(declare-fun res!410142 () Bool)

(assert (=> b!634149 (=> (not res!410142) (not e!362625))))

(declare-fun lt!293139 () SeekEntryResult!6709)

(declare-fun lt!293140 () (_ BitVec 32))

(assert (=> b!634149 (= res!410142 (= lt!293139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293140 vacantSpotIndex!68 lt!293143 lt!293137 mask!3053)))))

(assert (=> b!634149 (= lt!293139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293140 vacantSpotIndex!68 (select (arr!18313 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634149 (= lt!293143 (select (store (arr!18313 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293134 () Unit!21345)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38172 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21345)

(assert (=> b!634149 (= lt!293134 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293140 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634149 (= lt!293140 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!634150 () Bool)

(declare-fun e!362616 () Bool)

(assert (=> b!634150 (= e!362621 e!362616)))

(declare-fun res!410137 () Bool)

(assert (=> b!634150 (=> (not res!410137) (not e!362616))))

(assert (=> b!634150 (= res!410137 (arrayContainsKey!0 lt!293137 (select (arr!18313 a!2986) j!136) j!136))))

(declare-fun b!634151 () Bool)

(assert (=> b!634151 (= e!362622 e!362619)))

(declare-fun res!410131 () Bool)

(assert (=> b!634151 (=> (not res!410131) (not e!362619))))

(declare-fun lt!293141 () SeekEntryResult!6709)

(assert (=> b!634151 (= res!410131 (and (= lt!293141 (Found!6709 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18313 a!2986) index!984) (select (arr!18313 a!2986) j!136))) (not (= (select (arr!18313 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634151 (= lt!293141 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18313 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634152 () Bool)

(declare-fun res!410143 () Bool)

(assert (=> b!634152 (=> (not res!410143) (not e!362615))))

(assert (=> b!634152 (= res!410143 (and (= (size!18677 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18677 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18677 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634153 () Bool)

(assert (=> b!634153 (= e!362616 (arrayContainsKey!0 lt!293137 (select (arr!18313 a!2986) j!136) index!984))))

(declare-fun b!634154 () Bool)

(declare-fun res!410141 () Bool)

(assert (=> b!634154 (=> (not res!410141) (not e!362615))))

(assert (=> b!634154 (= res!410141 (validKeyInArray!0 (select (arr!18313 a!2986) j!136)))))

(declare-fun b!634155 () Bool)

(declare-fun res!410134 () Bool)

(assert (=> b!634155 (=> (not res!410134) (not e!362624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38172 (_ BitVec 32)) Bool)

(assert (=> b!634155 (= res!410134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634156 () Bool)

(declare-fun res!410139 () Bool)

(assert (=> b!634156 (=> (not res!410139) (not e!362624))))

(declare-datatypes ((List!12261 0))(
  ( (Nil!12258) (Cons!12257 (h!13305 (_ BitVec 64)) (t!18481 List!12261)) )
))
(declare-fun arrayNoDuplicates!0 (array!38172 (_ BitVec 32) List!12261) Bool)

(assert (=> b!634156 (= res!410139 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12258))))

(declare-fun b!634157 () Bool)

(declare-fun Unit!21347 () Unit!21345)

(assert (=> b!634157 (= e!362620 Unit!21347)))

(assert (=> b!634157 false))

(declare-fun b!634158 () Bool)

(assert (=> b!634158 (= e!362625 (= lt!293141 lt!293139))))

(declare-fun b!634159 () Bool)

(declare-fun Unit!21348 () Unit!21345)

(assert (=> b!634159 (= e!362620 Unit!21348)))

(assert (= (and start!57324 res!410133) b!634152))

(assert (= (and b!634152 res!410143) b!634154))

(assert (= (and b!634154 res!410141) b!634142))

(assert (= (and b!634142 res!410140) b!634143))

(assert (= (and b!634143 res!410138) b!634144))

(assert (= (and b!634144 res!410144) b!634155))

(assert (= (and b!634155 res!410134) b!634156))

(assert (= (and b!634156 res!410139) b!634148))

(assert (= (and b!634148 res!410136) b!634147))

(assert (= (and b!634147 res!410135) b!634151))

(assert (= (and b!634151 res!410131) b!634149))

(assert (= (and b!634149 res!410142) b!634158))

(assert (= (and b!634149 c!72374) b!634157))

(assert (= (and b!634149 (not c!72374)) b!634159))

(assert (= (and b!634149 (not res!410145)) b!634145))

(assert (= (and b!634145 res!410132) b!634146))

(assert (= (and b!634146 (not res!410146)) b!634150))

(assert (= (and b!634150 res!410137) b!634153))

(declare-fun m!609061 () Bool)

(assert (=> b!634142 m!609061))

(declare-fun m!609063 () Bool)

(assert (=> b!634150 m!609063))

(assert (=> b!634150 m!609063))

(declare-fun m!609065 () Bool)

(assert (=> b!634150 m!609065))

(declare-fun m!609067 () Bool)

(assert (=> b!634149 m!609067))

(declare-fun m!609069 () Bool)

(assert (=> b!634149 m!609069))

(declare-fun m!609071 () Bool)

(assert (=> b!634149 m!609071))

(assert (=> b!634149 m!609063))

(declare-fun m!609073 () Bool)

(assert (=> b!634149 m!609073))

(declare-fun m!609075 () Bool)

(assert (=> b!634149 m!609075))

(assert (=> b!634149 m!609063))

(declare-fun m!609077 () Bool)

(assert (=> b!634149 m!609077))

(declare-fun m!609079 () Bool)

(assert (=> b!634149 m!609079))

(declare-fun m!609081 () Bool)

(assert (=> b!634143 m!609081))

(declare-fun m!609083 () Bool)

(assert (=> b!634148 m!609083))

(assert (=> b!634154 m!609063))

(assert (=> b!634154 m!609063))

(declare-fun m!609085 () Bool)

(assert (=> b!634154 m!609085))

(assert (=> b!634146 m!609063))

(declare-fun m!609087 () Bool)

(assert (=> b!634151 m!609087))

(assert (=> b!634151 m!609063))

(assert (=> b!634151 m!609063))

(declare-fun m!609089 () Bool)

(assert (=> b!634151 m!609089))

(declare-fun m!609091 () Bool)

(assert (=> b!634144 m!609091))

(declare-fun m!609093 () Bool)

(assert (=> b!634155 m!609093))

(declare-fun m!609095 () Bool)

(assert (=> b!634156 m!609095))

(assert (=> b!634147 m!609073))

(declare-fun m!609097 () Bool)

(assert (=> b!634147 m!609097))

(declare-fun m!609099 () Bool)

(assert (=> start!57324 m!609099))

(declare-fun m!609101 () Bool)

(assert (=> start!57324 m!609101))

(assert (=> b!634153 m!609063))

(assert (=> b!634153 m!609063))

(declare-fun m!609103 () Bool)

(assert (=> b!634153 m!609103))

(assert (=> b!634145 m!609063))

(assert (=> b!634145 m!609073))

(declare-fun m!609105 () Bool)

(assert (=> b!634145 m!609105))

(check-sat (not b!634156) (not b!634149) (not b!634153) (not start!57324) (not b!634150) (not b!634151) (not b!634144) (not b!634143) (not b!634155) (not b!634142) (not b!634154))
(check-sat)
