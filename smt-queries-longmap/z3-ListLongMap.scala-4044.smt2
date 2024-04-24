; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55188 () Bool)

(assert start!55188)

(declare-fun b!604170 () Bool)

(declare-datatypes ((Unit!19171 0))(
  ( (Unit!19172) )
))
(declare-fun e!345674 () Unit!19171)

(declare-fun Unit!19173 () Unit!19171)

(assert (=> b!604170 (= e!345674 Unit!19173)))

(declare-fun lt!275449 () Unit!19171)

(declare-datatypes ((array!37206 0))(
  ( (array!37207 (arr!17857 (Array (_ BitVec 32) (_ BitVec 64))) (size!18221 (_ BitVec 32))) )
))
(declare-fun lt!275435 () array!37206)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37206 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19171)

(assert (=> b!604170 (= lt!275449 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275435 (select (arr!17857 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604170 (arrayContainsKey!0 lt!275435 (select (arr!17857 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!275441 () Unit!19171)

(declare-datatypes ((List!11805 0))(
  ( (Nil!11802) (Cons!11801 (h!12849 (_ BitVec 64)) (t!18025 List!11805)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37206 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11805) Unit!19171)

(assert (=> b!604170 (= lt!275441 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11802))))

(declare-fun arrayNoDuplicates!0 (array!37206 (_ BitVec 32) List!11805) Bool)

(assert (=> b!604170 (arrayNoDuplicates!0 lt!275435 #b00000000000000000000000000000000 Nil!11802)))

(declare-fun lt!275439 () Unit!19171)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37206 (_ BitVec 32) (_ BitVec 32)) Unit!19171)

(assert (=> b!604170 (= lt!275439 (lemmaNoDuplicateFromThenFromBigger!0 lt!275435 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604170 (arrayNoDuplicates!0 lt!275435 j!136 Nil!11802)))

(declare-fun lt!275447 () Unit!19171)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37206 (_ BitVec 64) (_ BitVec 32) List!11805) Unit!19171)

(assert (=> b!604170 (= lt!275447 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275435 (select (arr!17857 a!2986) j!136) j!136 Nil!11802))))

(assert (=> b!604170 false))

(declare-fun e!345677 () Bool)

(declare-fun b!604171 () Bool)

(assert (=> b!604171 (= e!345677 (arrayContainsKey!0 lt!275435 (select (arr!17857 a!2986) j!136) index!984))))

(declare-fun b!604172 () Bool)

(declare-fun e!345684 () Bool)

(declare-fun e!345678 () Bool)

(assert (=> b!604172 (= e!345684 e!345678)))

(declare-fun res!388071 () Bool)

(assert (=> b!604172 (=> res!388071 e!345678)))

(assert (=> b!604172 (= res!388071 (bvsge index!984 j!136))))

(declare-fun lt!275448 () Unit!19171)

(assert (=> b!604172 (= lt!275448 e!345674)))

(declare-fun c!68419 () Bool)

(assert (=> b!604172 (= c!68419 (bvslt j!136 index!984))))

(declare-fun b!604173 () Bool)

(declare-fun e!345681 () Unit!19171)

(declare-fun Unit!19174 () Unit!19171)

(assert (=> b!604173 (= e!345681 Unit!19174)))

(declare-fun b!604174 () Bool)

(declare-fun res!388083 () Bool)

(declare-fun e!345675 () Bool)

(assert (=> b!604174 (=> (not res!388083) (not e!345675))))

(assert (=> b!604174 (= res!388083 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!388073 () Bool)

(assert (=> start!55188 (=> (not res!388073) (not e!345675))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55188 (= res!388073 (validMask!0 mask!3053))))

(assert (=> start!55188 e!345675))

(assert (=> start!55188 true))

(declare-fun array_inv!13716 (array!37206) Bool)

(assert (=> start!55188 (array_inv!13716 a!2986)))

(declare-fun b!604175 () Bool)

(declare-fun res!388087 () Bool)

(assert (=> b!604175 (=> (not res!388087) (not e!345675))))

(assert (=> b!604175 (= res!388087 (and (= (size!18221 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18221 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18221 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604176 () Bool)

(declare-fun res!388085 () Bool)

(assert (=> b!604176 (=> (not res!388085) (not e!345675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604176 (= res!388085 (validKeyInArray!0 k0!1786))))

(declare-fun b!604177 () Bool)

(declare-fun res!388075 () Bool)

(declare-fun e!345672 () Bool)

(assert (=> b!604177 (=> (not res!388075) (not e!345672))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!604177 (= res!388075 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17857 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604178 () Bool)

(assert (=> b!604178 (= e!345678 true)))

(assert (=> b!604178 e!345677))

(declare-fun res!388081 () Bool)

(assert (=> b!604178 (=> (not res!388081) (not e!345677))))

(assert (=> b!604178 (= res!388081 (arrayContainsKey!0 lt!275435 (select (arr!17857 a!2986) j!136) j!136))))

(declare-fun b!604179 () Bool)

(assert (=> b!604179 (= e!345675 e!345672)))

(declare-fun res!388086 () Bool)

(assert (=> b!604179 (=> (not res!388086) (not e!345672))))

(declare-datatypes ((SeekEntryResult!6253 0))(
  ( (MissingZero!6253 (index!27275 (_ BitVec 32))) (Found!6253 (index!27276 (_ BitVec 32))) (Intermediate!6253 (undefined!7065 Bool) (index!27277 (_ BitVec 32)) (x!56225 (_ BitVec 32))) (Undefined!6253) (MissingVacant!6253 (index!27278 (_ BitVec 32))) )
))
(declare-fun lt!275440 () SeekEntryResult!6253)

(assert (=> b!604179 (= res!388086 (or (= lt!275440 (MissingZero!6253 i!1108)) (= lt!275440 (MissingVacant!6253 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37206 (_ BitVec 32)) SeekEntryResult!6253)

(assert (=> b!604179 (= lt!275440 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604180 () Bool)

(declare-fun Unit!19175 () Unit!19171)

(assert (=> b!604180 (= e!345674 Unit!19175)))

(declare-fun b!604181 () Bool)

(declare-fun e!345683 () Bool)

(assert (=> b!604181 (= e!345672 e!345683)))

(declare-fun res!388084 () Bool)

(assert (=> b!604181 (=> (not res!388084) (not e!345683))))

(assert (=> b!604181 (= res!388084 (= (select (store (arr!17857 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604181 (= lt!275435 (array!37207 (store (arr!17857 a!2986) i!1108 k0!1786) (size!18221 a!2986)))))

(declare-fun b!604182 () Bool)

(declare-fun e!345680 () Bool)

(declare-fun e!345682 () Bool)

(assert (=> b!604182 (= e!345680 e!345682)))

(declare-fun res!388072 () Bool)

(assert (=> b!604182 (=> (not res!388072) (not e!345682))))

(assert (=> b!604182 (= res!388072 (arrayContainsKey!0 lt!275435 (select (arr!17857 a!2986) j!136) j!136))))

(declare-fun b!604183 () Bool)

(declare-fun e!345670 () Bool)

(assert (=> b!604183 (= e!345683 e!345670)))

(declare-fun res!388074 () Bool)

(assert (=> b!604183 (=> (not res!388074) (not e!345670))))

(declare-fun lt!275442 () SeekEntryResult!6253)

(assert (=> b!604183 (= res!388074 (and (= lt!275442 (Found!6253 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17857 a!2986) index!984) (select (arr!17857 a!2986) j!136))) (not (= (select (arr!17857 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37206 (_ BitVec 32)) SeekEntryResult!6253)

(assert (=> b!604183 (= lt!275442 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17857 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604184 () Bool)

(declare-fun res!388082 () Bool)

(assert (=> b!604184 (=> (not res!388082) (not e!345672))))

(assert (=> b!604184 (= res!388082 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11802))))

(declare-fun b!604185 () Bool)

(declare-fun e!345671 () Bool)

(assert (=> b!604185 (= e!345671 e!345680)))

(declare-fun res!388078 () Bool)

(assert (=> b!604185 (=> res!388078 e!345680)))

(declare-fun lt!275437 () (_ BitVec 64))

(declare-fun lt!275444 () (_ BitVec 64))

(assert (=> b!604185 (= res!388078 (or (not (= (select (arr!17857 a!2986) j!136) lt!275437)) (not (= (select (arr!17857 a!2986) j!136) lt!275444)) (bvsge j!136 index!984)))))

(declare-fun b!604186 () Bool)

(declare-fun e!345679 () Bool)

(assert (=> b!604186 (= e!345670 (not e!345679))))

(declare-fun res!388079 () Bool)

(assert (=> b!604186 (=> res!388079 e!345679)))

(declare-fun lt!275436 () SeekEntryResult!6253)

(assert (=> b!604186 (= res!388079 (not (= lt!275436 (Found!6253 index!984))))))

(declare-fun lt!275443 () Unit!19171)

(assert (=> b!604186 (= lt!275443 e!345681)))

(declare-fun c!68420 () Bool)

(assert (=> b!604186 (= c!68420 (= lt!275436 Undefined!6253))))

(assert (=> b!604186 (= lt!275436 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275437 lt!275435 mask!3053))))

(declare-fun e!345676 () Bool)

(assert (=> b!604186 e!345676))

(declare-fun res!388070 () Bool)

(assert (=> b!604186 (=> (not res!388070) (not e!345676))))

(declare-fun lt!275446 () SeekEntryResult!6253)

(declare-fun lt!275438 () (_ BitVec 32))

(assert (=> b!604186 (= res!388070 (= lt!275446 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275438 vacantSpotIndex!68 lt!275437 lt!275435 mask!3053)))))

(assert (=> b!604186 (= lt!275446 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275438 vacantSpotIndex!68 (select (arr!17857 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604186 (= lt!275437 (select (store (arr!17857 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275445 () Unit!19171)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37206 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19171)

(assert (=> b!604186 (= lt!275445 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275438 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604186 (= lt!275438 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!604187 () Bool)

(assert (=> b!604187 (= e!345676 (= lt!275442 lt!275446))))

(declare-fun b!604188 () Bool)

(declare-fun res!388069 () Bool)

(assert (=> b!604188 (=> (not res!388069) (not e!345675))))

(assert (=> b!604188 (= res!388069 (validKeyInArray!0 (select (arr!17857 a!2986) j!136)))))

(declare-fun b!604189 () Bool)

(assert (=> b!604189 (= e!345679 e!345684)))

(declare-fun res!388077 () Bool)

(assert (=> b!604189 (=> res!388077 e!345684)))

(assert (=> b!604189 (= res!388077 (or (not (= (select (arr!17857 a!2986) j!136) lt!275437)) (not (= (select (arr!17857 a!2986) j!136) lt!275444))))))

(assert (=> b!604189 e!345671))

(declare-fun res!388076 () Bool)

(assert (=> b!604189 (=> (not res!388076) (not e!345671))))

(assert (=> b!604189 (= res!388076 (= lt!275444 (select (arr!17857 a!2986) j!136)))))

(assert (=> b!604189 (= lt!275444 (select (store (arr!17857 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604190 () Bool)

(declare-fun res!388080 () Bool)

(assert (=> b!604190 (=> (not res!388080) (not e!345672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37206 (_ BitVec 32)) Bool)

(assert (=> b!604190 (= res!388080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604191 () Bool)

(assert (=> b!604191 (= e!345682 (arrayContainsKey!0 lt!275435 (select (arr!17857 a!2986) j!136) index!984))))

(declare-fun b!604192 () Bool)

(declare-fun Unit!19176 () Unit!19171)

(assert (=> b!604192 (= e!345681 Unit!19176)))

(assert (=> b!604192 false))

(assert (= (and start!55188 res!388073) b!604175))

(assert (= (and b!604175 res!388087) b!604188))

(assert (= (and b!604188 res!388069) b!604176))

(assert (= (and b!604176 res!388085) b!604174))

(assert (= (and b!604174 res!388083) b!604179))

(assert (= (and b!604179 res!388086) b!604190))

(assert (= (and b!604190 res!388080) b!604184))

(assert (= (and b!604184 res!388082) b!604177))

(assert (= (and b!604177 res!388075) b!604181))

(assert (= (and b!604181 res!388084) b!604183))

(assert (= (and b!604183 res!388074) b!604186))

(assert (= (and b!604186 res!388070) b!604187))

(assert (= (and b!604186 c!68420) b!604192))

(assert (= (and b!604186 (not c!68420)) b!604173))

(assert (= (and b!604186 (not res!388079)) b!604189))

(assert (= (and b!604189 res!388076) b!604185))

(assert (= (and b!604185 (not res!388078)) b!604182))

(assert (= (and b!604182 res!388072) b!604191))

(assert (= (and b!604189 (not res!388077)) b!604172))

(assert (= (and b!604172 c!68419) b!604170))

(assert (= (and b!604172 (not c!68419)) b!604180))

(assert (= (and b!604172 (not res!388071)) b!604178))

(assert (= (and b!604178 res!388081) b!604171))

(declare-fun m!581357 () Bool)

(assert (=> b!604186 m!581357))

(declare-fun m!581359 () Bool)

(assert (=> b!604186 m!581359))

(declare-fun m!581361 () Bool)

(assert (=> b!604186 m!581361))

(assert (=> b!604186 m!581361))

(declare-fun m!581363 () Bool)

(assert (=> b!604186 m!581363))

(declare-fun m!581365 () Bool)

(assert (=> b!604186 m!581365))

(declare-fun m!581367 () Bool)

(assert (=> b!604186 m!581367))

(declare-fun m!581369 () Bool)

(assert (=> b!604186 m!581369))

(declare-fun m!581371 () Bool)

(assert (=> b!604186 m!581371))

(assert (=> b!604188 m!581361))

(assert (=> b!604188 m!581361))

(declare-fun m!581373 () Bool)

(assert (=> b!604188 m!581373))

(assert (=> b!604178 m!581361))

(assert (=> b!604178 m!581361))

(declare-fun m!581375 () Bool)

(assert (=> b!604178 m!581375))

(assert (=> b!604182 m!581361))

(assert (=> b!604182 m!581361))

(assert (=> b!604182 m!581375))

(assert (=> b!604181 m!581365))

(declare-fun m!581377 () Bool)

(assert (=> b!604181 m!581377))

(declare-fun m!581379 () Bool)

(assert (=> b!604183 m!581379))

(assert (=> b!604183 m!581361))

(assert (=> b!604183 m!581361))

(declare-fun m!581381 () Bool)

(assert (=> b!604183 m!581381))

(assert (=> b!604185 m!581361))

(assert (=> b!604189 m!581361))

(assert (=> b!604189 m!581365))

(declare-fun m!581383 () Bool)

(assert (=> b!604189 m!581383))

(declare-fun m!581385 () Bool)

(assert (=> b!604177 m!581385))

(declare-fun m!581387 () Bool)

(assert (=> start!55188 m!581387))

(declare-fun m!581389 () Bool)

(assert (=> start!55188 m!581389))

(assert (=> b!604171 m!581361))

(assert (=> b!604171 m!581361))

(declare-fun m!581391 () Bool)

(assert (=> b!604171 m!581391))

(declare-fun m!581393 () Bool)

(assert (=> b!604190 m!581393))

(assert (=> b!604191 m!581361))

(assert (=> b!604191 m!581361))

(assert (=> b!604191 m!581391))

(declare-fun m!581395 () Bool)

(assert (=> b!604176 m!581395))

(declare-fun m!581397 () Bool)

(assert (=> b!604179 m!581397))

(declare-fun m!581399 () Bool)

(assert (=> b!604184 m!581399))

(declare-fun m!581401 () Bool)

(assert (=> b!604170 m!581401))

(assert (=> b!604170 m!581361))

(declare-fun m!581403 () Bool)

(assert (=> b!604170 m!581403))

(declare-fun m!581405 () Bool)

(assert (=> b!604170 m!581405))

(assert (=> b!604170 m!581361))

(declare-fun m!581407 () Bool)

(assert (=> b!604170 m!581407))

(assert (=> b!604170 m!581361))

(declare-fun m!581409 () Bool)

(assert (=> b!604170 m!581409))

(assert (=> b!604170 m!581361))

(declare-fun m!581411 () Bool)

(assert (=> b!604170 m!581411))

(declare-fun m!581413 () Bool)

(assert (=> b!604170 m!581413))

(declare-fun m!581415 () Bool)

(assert (=> b!604174 m!581415))

(check-sat (not b!604178) (not b!604191) (not b!604183) (not b!604176) (not b!604170) (not b!604188) (not b!604186) (not b!604171) (not b!604179) (not start!55188) (not b!604174) (not b!604190) (not b!604184) (not b!604182))
(check-sat)
