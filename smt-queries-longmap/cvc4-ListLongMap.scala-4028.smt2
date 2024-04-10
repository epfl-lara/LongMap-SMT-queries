; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54878 () Bool)

(assert start!54878)

(declare-fun b!600251 () Bool)

(declare-fun res!385164 () Bool)

(declare-fun e!343192 () Bool)

(assert (=> b!600251 (=> res!385164 e!343192)))

(declare-datatypes ((List!11857 0))(
  ( (Nil!11854) (Cons!11853 (h!12898 (_ BitVec 64)) (t!18085 List!11857)) )
))
(declare-fun contains!2973 (List!11857 (_ BitVec 64)) Bool)

(assert (=> b!600251 (= res!385164 (contains!2973 Nil!11854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!600252 () Bool)

(declare-fun e!343182 () Bool)

(declare-datatypes ((array!37113 0))(
  ( (array!37114 (arr!17816 (Array (_ BitVec 32) (_ BitVec 64))) (size!18180 (_ BitVec 32))) )
))
(declare-fun lt!273015 () array!37113)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37113)

(declare-fun arrayContainsKey!0 (array!37113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600252 (= e!343182 (arrayContainsKey!0 lt!273015 (select (arr!17816 a!2986) j!136) index!984))))

(declare-fun b!600253 () Bool)

(declare-fun res!385169 () Bool)

(assert (=> b!600253 (=> res!385169 e!343192)))

(declare-fun noDuplicate!290 (List!11857) Bool)

(assert (=> b!600253 (= res!385169 (not (noDuplicate!290 Nil!11854)))))

(declare-fun b!600254 () Bool)

(declare-fun e!343184 () Bool)

(assert (=> b!600254 (= e!343184 e!343192)))

(declare-fun res!385165 () Bool)

(assert (=> b!600254 (=> res!385165 e!343192)))

(assert (=> b!600254 (= res!385165 (or (bvsge (size!18180 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18180 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37113 (_ BitVec 32) List!11857) Bool)

(assert (=> b!600254 (arrayNoDuplicates!0 lt!273015 j!136 Nil!11854)))

(declare-datatypes ((Unit!18942 0))(
  ( (Unit!18943) )
))
(declare-fun lt!273022 () Unit!18942)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37113 (_ BitVec 32) (_ BitVec 32)) Unit!18942)

(assert (=> b!600254 (= lt!273022 (lemmaNoDuplicateFromThenFromBigger!0 lt!273015 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600254 (arrayNoDuplicates!0 lt!273015 #b00000000000000000000000000000000 Nil!11854)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!273016 () Unit!18942)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11857) Unit!18942)

(assert (=> b!600254 (= lt!273016 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11854))))

(assert (=> b!600254 (arrayContainsKey!0 lt!273015 (select (arr!17816 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273023 () Unit!18942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18942)

(assert (=> b!600254 (= lt!273023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273015 (select (arr!17816 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600255 () Bool)

(declare-fun res!385167 () Bool)

(declare-fun e!343183 () Bool)

(assert (=> b!600255 (=> (not res!385167) (not e!343183))))

(assert (=> b!600255 (= res!385167 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600256 () Bool)

(declare-fun e!343191 () Bool)

(declare-fun e!343193 () Bool)

(assert (=> b!600256 (= e!343191 (not e!343193))))

(declare-fun res!385166 () Bool)

(assert (=> b!600256 (=> res!385166 e!343193)))

(declare-datatypes ((SeekEntryResult!6256 0))(
  ( (MissingZero!6256 (index!27281 (_ BitVec 32))) (Found!6256 (index!27282 (_ BitVec 32))) (Intermediate!6256 (undefined!7068 Bool) (index!27283 (_ BitVec 32)) (x!56079 (_ BitVec 32))) (Undefined!6256) (MissingVacant!6256 (index!27284 (_ BitVec 32))) )
))
(declare-fun lt!273012 () SeekEntryResult!6256)

(assert (=> b!600256 (= res!385166 (not (= lt!273012 (Found!6256 index!984))))))

(declare-fun lt!273024 () Unit!18942)

(declare-fun e!343190 () Unit!18942)

(assert (=> b!600256 (= lt!273024 e!343190)))

(declare-fun c!67916 () Bool)

(assert (=> b!600256 (= c!67916 (= lt!273012 Undefined!6256))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!273017 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37113 (_ BitVec 32)) SeekEntryResult!6256)

(assert (=> b!600256 (= lt!273012 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273017 lt!273015 mask!3053))))

(declare-fun e!343185 () Bool)

(assert (=> b!600256 e!343185))

(declare-fun res!385171 () Bool)

(assert (=> b!600256 (=> (not res!385171) (not e!343185))))

(declare-fun lt!273020 () (_ BitVec 32))

(declare-fun lt!273019 () SeekEntryResult!6256)

(assert (=> b!600256 (= res!385171 (= lt!273019 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273020 vacantSpotIndex!68 lt!273017 lt!273015 mask!3053)))))

(assert (=> b!600256 (= lt!273019 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273020 vacantSpotIndex!68 (select (arr!17816 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600256 (= lt!273017 (select (store (arr!17816 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273025 () Unit!18942)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18942)

(assert (=> b!600256 (= lt!273025 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273020 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600256 (= lt!273020 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600257 () Bool)

(declare-fun res!385170 () Bool)

(assert (=> b!600257 (=> (not res!385170) (not e!343183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600257 (= res!385170 (validKeyInArray!0 (select (arr!17816 a!2986) j!136)))))

(declare-fun b!600259 () Bool)

(declare-fun e!343186 () Bool)

(assert (=> b!600259 (= e!343186 e!343182)))

(declare-fun res!385154 () Bool)

(assert (=> b!600259 (=> (not res!385154) (not e!343182))))

(assert (=> b!600259 (= res!385154 (arrayContainsKey!0 lt!273015 (select (arr!17816 a!2986) j!136) j!136))))

(declare-fun b!600260 () Bool)

(declare-fun e!343194 () Bool)

(assert (=> b!600260 (= e!343194 e!343191)))

(declare-fun res!385163 () Bool)

(assert (=> b!600260 (=> (not res!385163) (not e!343191))))

(declare-fun lt!273018 () SeekEntryResult!6256)

(assert (=> b!600260 (= res!385163 (and (= lt!273018 (Found!6256 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17816 a!2986) index!984) (select (arr!17816 a!2986) j!136))) (not (= (select (arr!17816 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600260 (= lt!273018 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17816 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600261 () Bool)

(declare-fun e!343187 () Bool)

(assert (=> b!600261 (= e!343187 e!343186)))

(declare-fun res!385159 () Bool)

(assert (=> b!600261 (=> res!385159 e!343186)))

(declare-fun lt!273021 () (_ BitVec 64))

(assert (=> b!600261 (= res!385159 (or (not (= (select (arr!17816 a!2986) j!136) lt!273017)) (not (= (select (arr!17816 a!2986) j!136) lt!273021)) (bvsge j!136 index!984)))))

(declare-fun b!600262 () Bool)

(declare-fun Unit!18944 () Unit!18942)

(assert (=> b!600262 (= e!343190 Unit!18944)))

(declare-fun b!600263 () Bool)

(declare-fun e!343188 () Bool)

(assert (=> b!600263 (= e!343183 e!343188)))

(declare-fun res!385155 () Bool)

(assert (=> b!600263 (=> (not res!385155) (not e!343188))))

(declare-fun lt!273014 () SeekEntryResult!6256)

(assert (=> b!600263 (= res!385155 (or (= lt!273014 (MissingZero!6256 i!1108)) (= lt!273014 (MissingVacant!6256 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37113 (_ BitVec 32)) SeekEntryResult!6256)

(assert (=> b!600263 (= lt!273014 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600264 () Bool)

(assert (=> b!600264 (= e!343188 e!343194)))

(declare-fun res!385162 () Bool)

(assert (=> b!600264 (=> (not res!385162) (not e!343194))))

(assert (=> b!600264 (= res!385162 (= (select (store (arr!17816 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600264 (= lt!273015 (array!37114 (store (arr!17816 a!2986) i!1108 k!1786) (size!18180 a!2986)))))

(declare-fun b!600265 () Bool)

(declare-fun res!385156 () Bool)

(assert (=> b!600265 (=> (not res!385156) (not e!343183))))

(assert (=> b!600265 (= res!385156 (validKeyInArray!0 k!1786))))

(declare-fun b!600266 () Bool)

(declare-fun res!385168 () Bool)

(assert (=> b!600266 (=> (not res!385168) (not e!343188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37113 (_ BitVec 32)) Bool)

(assert (=> b!600266 (= res!385168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600267 () Bool)

(declare-fun Unit!18945 () Unit!18942)

(assert (=> b!600267 (= e!343190 Unit!18945)))

(assert (=> b!600267 false))

(declare-fun b!600268 () Bool)

(declare-fun res!385160 () Bool)

(assert (=> b!600268 (=> (not res!385160) (not e!343188))))

(assert (=> b!600268 (= res!385160 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11854))))

(declare-fun b!600269 () Bool)

(assert (=> b!600269 (= e!343185 (= lt!273018 lt!273019))))

(declare-fun b!600270 () Bool)

(declare-fun res!385158 () Bool)

(assert (=> b!600270 (=> (not res!385158) (not e!343183))))

(assert (=> b!600270 (= res!385158 (and (= (size!18180 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18180 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18180 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600258 () Bool)

(assert (=> b!600258 (= e!343192 true)))

(declare-fun lt!273013 () Bool)

(assert (=> b!600258 (= lt!273013 (contains!2973 Nil!11854 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!385153 () Bool)

(assert (=> start!54878 (=> (not res!385153) (not e!343183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54878 (= res!385153 (validMask!0 mask!3053))))

(assert (=> start!54878 e!343183))

(assert (=> start!54878 true))

(declare-fun array_inv!13612 (array!37113) Bool)

(assert (=> start!54878 (array_inv!13612 a!2986)))

(declare-fun b!600271 () Bool)

(declare-fun res!385157 () Bool)

(assert (=> b!600271 (=> (not res!385157) (not e!343188))))

(assert (=> b!600271 (= res!385157 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17816 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600272 () Bool)

(assert (=> b!600272 (= e!343193 e!343184)))

(declare-fun res!385172 () Bool)

(assert (=> b!600272 (=> res!385172 e!343184)))

(assert (=> b!600272 (= res!385172 (or (not (= (select (arr!17816 a!2986) j!136) lt!273017)) (not (= (select (arr!17816 a!2986) j!136) lt!273021)) (bvsge j!136 index!984)))))

(assert (=> b!600272 e!343187))

(declare-fun res!385161 () Bool)

(assert (=> b!600272 (=> (not res!385161) (not e!343187))))

(assert (=> b!600272 (= res!385161 (= lt!273021 (select (arr!17816 a!2986) j!136)))))

(assert (=> b!600272 (= lt!273021 (select (store (arr!17816 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!54878 res!385153) b!600270))

(assert (= (and b!600270 res!385158) b!600257))

(assert (= (and b!600257 res!385170) b!600265))

(assert (= (and b!600265 res!385156) b!600255))

(assert (= (and b!600255 res!385167) b!600263))

(assert (= (and b!600263 res!385155) b!600266))

(assert (= (and b!600266 res!385168) b!600268))

(assert (= (and b!600268 res!385160) b!600271))

(assert (= (and b!600271 res!385157) b!600264))

(assert (= (and b!600264 res!385162) b!600260))

(assert (= (and b!600260 res!385163) b!600256))

(assert (= (and b!600256 res!385171) b!600269))

(assert (= (and b!600256 c!67916) b!600267))

(assert (= (and b!600256 (not c!67916)) b!600262))

(assert (= (and b!600256 (not res!385166)) b!600272))

(assert (= (and b!600272 res!385161) b!600261))

(assert (= (and b!600261 (not res!385159)) b!600259))

(assert (= (and b!600259 res!385154) b!600252))

(assert (= (and b!600272 (not res!385172)) b!600254))

(assert (= (and b!600254 (not res!385165)) b!600253))

(assert (= (and b!600253 (not res!385169)) b!600251))

(assert (= (and b!600251 (not res!385164)) b!600258))

(declare-fun m!577477 () Bool)

(assert (=> b!600266 m!577477))

(declare-fun m!577479 () Bool)

(assert (=> b!600258 m!577479))

(declare-fun m!577481 () Bool)

(assert (=> b!600261 m!577481))

(declare-fun m!577483 () Bool)

(assert (=> b!600265 m!577483))

(declare-fun m!577485 () Bool)

(assert (=> b!600264 m!577485))

(declare-fun m!577487 () Bool)

(assert (=> b!600264 m!577487))

(declare-fun m!577489 () Bool)

(assert (=> b!600255 m!577489))

(declare-fun m!577491 () Bool)

(assert (=> start!54878 m!577491))

(declare-fun m!577493 () Bool)

(assert (=> start!54878 m!577493))

(declare-fun m!577495 () Bool)

(assert (=> b!600263 m!577495))

(assert (=> b!600259 m!577481))

(assert (=> b!600259 m!577481))

(declare-fun m!577497 () Bool)

(assert (=> b!600259 m!577497))

(assert (=> b!600272 m!577481))

(assert (=> b!600272 m!577485))

(declare-fun m!577499 () Bool)

(assert (=> b!600272 m!577499))

(declare-fun m!577501 () Bool)

(assert (=> b!600271 m!577501))

(declare-fun m!577503 () Bool)

(assert (=> b!600260 m!577503))

(assert (=> b!600260 m!577481))

(assert (=> b!600260 m!577481))

(declare-fun m!577505 () Bool)

(assert (=> b!600260 m!577505))

(declare-fun m!577507 () Bool)

(assert (=> b!600268 m!577507))

(assert (=> b!600257 m!577481))

(assert (=> b!600257 m!577481))

(declare-fun m!577509 () Bool)

(assert (=> b!600257 m!577509))

(declare-fun m!577511 () Bool)

(assert (=> b!600253 m!577511))

(assert (=> b!600252 m!577481))

(assert (=> b!600252 m!577481))

(declare-fun m!577513 () Bool)

(assert (=> b!600252 m!577513))

(assert (=> b!600254 m!577481))

(declare-fun m!577515 () Bool)

(assert (=> b!600254 m!577515))

(assert (=> b!600254 m!577481))

(declare-fun m!577517 () Bool)

(assert (=> b!600254 m!577517))

(assert (=> b!600254 m!577481))

(declare-fun m!577519 () Bool)

(assert (=> b!600254 m!577519))

(declare-fun m!577521 () Bool)

(assert (=> b!600254 m!577521))

(declare-fun m!577523 () Bool)

(assert (=> b!600254 m!577523))

(declare-fun m!577525 () Bool)

(assert (=> b!600254 m!577525))

(declare-fun m!577527 () Bool)

(assert (=> b!600256 m!577527))

(declare-fun m!577529 () Bool)

(assert (=> b!600256 m!577529))

(declare-fun m!577531 () Bool)

(assert (=> b!600256 m!577531))

(assert (=> b!600256 m!577481))

(declare-fun m!577533 () Bool)

(assert (=> b!600256 m!577533))

(assert (=> b!600256 m!577485))

(assert (=> b!600256 m!577481))

(declare-fun m!577535 () Bool)

(assert (=> b!600256 m!577535))

(declare-fun m!577537 () Bool)

(assert (=> b!600256 m!577537))

(declare-fun m!577539 () Bool)

(assert (=> b!600251 m!577539))

(push 1)

