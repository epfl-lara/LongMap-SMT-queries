; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54844 () Bool)

(assert start!54844)

(declare-fun b!599150 () Bool)

(declare-fun e!342537 () Bool)

(declare-fun e!342528 () Bool)

(assert (=> b!599150 (= e!342537 e!342528)))

(declare-fun res!384158 () Bool)

(assert (=> b!599150 (=> res!384158 e!342528)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272315 () (_ BitVec 64))

(declare-fun lt!272320 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37079 0))(
  ( (array!37080 (arr!17799 (Array (_ BitVec 32) (_ BitVec 64))) (size!18163 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37079)

(assert (=> b!599150 (= res!384158 (or (not (= (select (arr!17799 a!2986) j!136) lt!272320)) (not (= (select (arr!17799 a!2986) j!136) lt!272315)) (bvsge j!136 index!984)))))

(declare-fun b!599151 () Bool)

(declare-fun e!342535 () Bool)

(declare-fun e!342534 () Bool)

(assert (=> b!599151 (= e!342535 e!342534)))

(declare-fun res!384169 () Bool)

(assert (=> b!599151 (=> (not res!384169) (not e!342534))))

(declare-datatypes ((SeekEntryResult!6239 0))(
  ( (MissingZero!6239 (index!27213 (_ BitVec 32))) (Found!6239 (index!27214 (_ BitVec 32))) (Intermediate!6239 (undefined!7051 Bool) (index!27215 (_ BitVec 32)) (x!56022 (_ BitVec 32))) (Undefined!6239) (MissingVacant!6239 (index!27216 (_ BitVec 32))) )
))
(declare-fun lt!272316 () SeekEntryResult!6239)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599151 (= res!384169 (and (= lt!272316 (Found!6239 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17799 a!2986) index!984) (select (arr!17799 a!2986) j!136))) (not (= (select (arr!17799 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37079 (_ BitVec 32)) SeekEntryResult!6239)

(assert (=> b!599151 (= lt!272316 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17799 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!342531 () Bool)

(declare-fun lt!272313 () array!37079)

(declare-fun b!599152 () Bool)

(declare-fun arrayContainsKey!0 (array!37079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599152 (= e!342531 (arrayContainsKey!0 lt!272313 (select (arr!17799 a!2986) j!136) index!984))))

(declare-fun b!599153 () Bool)

(declare-fun e!342533 () Bool)

(declare-fun e!342532 () Bool)

(assert (=> b!599153 (= e!342533 e!342532)))

(declare-fun res!384161 () Bool)

(assert (=> b!599153 (=> res!384161 e!342532)))

(assert (=> b!599153 (= res!384161 (or (not (= (select (arr!17799 a!2986) j!136) lt!272320)) (not (= (select (arr!17799 a!2986) j!136) lt!272315)) (bvsge j!136 index!984)))))

(assert (=> b!599153 e!342537))

(declare-fun res!384162 () Bool)

(assert (=> b!599153 (=> (not res!384162) (not e!342537))))

(assert (=> b!599153 (= res!384162 (= lt!272315 (select (arr!17799 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!599153 (= lt!272315 (select (store (arr!17799 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599154 () Bool)

(declare-fun res!384159 () Bool)

(declare-fun e!342527 () Bool)

(assert (=> b!599154 (=> (not res!384159) (not e!342527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37079 (_ BitVec 32)) Bool)

(assert (=> b!599154 (= res!384159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599155 () Bool)

(declare-fun res!384170 () Bool)

(declare-fun e!342526 () Bool)

(assert (=> b!599155 (=> (not res!384170) (not e!342526))))

(assert (=> b!599155 (= res!384170 (and (= (size!18163 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18163 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18163 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599156 () Bool)

(declare-fun e!342536 () Bool)

(declare-fun lt!272319 () SeekEntryResult!6239)

(assert (=> b!599156 (= e!342536 (= lt!272316 lt!272319))))

(declare-fun b!599157 () Bool)

(assert (=> b!599157 (= e!342532 true)))

(declare-datatypes ((List!11840 0))(
  ( (Nil!11837) (Cons!11836 (h!12881 (_ BitVec 64)) (t!18068 List!11840)) )
))
(declare-fun arrayNoDuplicates!0 (array!37079 (_ BitVec 32) List!11840) Bool)

(assert (=> b!599157 (arrayNoDuplicates!0 lt!272313 #b00000000000000000000000000000000 Nil!11837)))

(declare-datatypes ((Unit!18874 0))(
  ( (Unit!18875) )
))
(declare-fun lt!272323 () Unit!18874)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37079 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11840) Unit!18874)

(assert (=> b!599157 (= lt!272323 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11837))))

(assert (=> b!599157 (arrayContainsKey!0 lt!272313 (select (arr!17799 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272317 () Unit!18874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37079 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18874)

(assert (=> b!599157 (= lt!272317 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272313 (select (arr!17799 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599158 () Bool)

(declare-fun res!384154 () Bool)

(assert (=> b!599158 (=> (not res!384154) (not e!342526))))

(assert (=> b!599158 (= res!384154 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!384157 () Bool)

(assert (=> start!54844 (=> (not res!384157) (not e!342526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54844 (= res!384157 (validMask!0 mask!3053))))

(assert (=> start!54844 e!342526))

(assert (=> start!54844 true))

(declare-fun array_inv!13595 (array!37079) Bool)

(assert (=> start!54844 (array_inv!13595 a!2986)))

(declare-fun b!599159 () Bool)

(assert (=> b!599159 (= e!342534 (not e!342533))))

(declare-fun res!384164 () Bool)

(assert (=> b!599159 (=> res!384164 e!342533)))

(declare-fun lt!272312 () SeekEntryResult!6239)

(assert (=> b!599159 (= res!384164 (not (= lt!272312 (Found!6239 index!984))))))

(declare-fun lt!272322 () Unit!18874)

(declare-fun e!342529 () Unit!18874)

(assert (=> b!599159 (= lt!272322 e!342529)))

(declare-fun c!67865 () Bool)

(assert (=> b!599159 (= c!67865 (= lt!272312 Undefined!6239))))

(assert (=> b!599159 (= lt!272312 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272320 lt!272313 mask!3053))))

(assert (=> b!599159 e!342536))

(declare-fun res!384156 () Bool)

(assert (=> b!599159 (=> (not res!384156) (not e!342536))))

(declare-fun lt!272314 () (_ BitVec 32))

(assert (=> b!599159 (= res!384156 (= lt!272319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272314 vacantSpotIndex!68 lt!272320 lt!272313 mask!3053)))))

(assert (=> b!599159 (= lt!272319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272314 vacantSpotIndex!68 (select (arr!17799 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599159 (= lt!272320 (select (store (arr!17799 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272321 () Unit!18874)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37079 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18874)

(assert (=> b!599159 (= lt!272321 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272314 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599159 (= lt!272314 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599160 () Bool)

(assert (=> b!599160 (= e!342528 e!342531)))

(declare-fun res!384155 () Bool)

(assert (=> b!599160 (=> (not res!384155) (not e!342531))))

(assert (=> b!599160 (= res!384155 (arrayContainsKey!0 lt!272313 (select (arr!17799 a!2986) j!136) j!136))))

(declare-fun b!599161 () Bool)

(declare-fun res!384168 () Bool)

(assert (=> b!599161 (=> (not res!384168) (not e!342527))))

(assert (=> b!599161 (= res!384168 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11837))))

(declare-fun b!599162 () Bool)

(declare-fun Unit!18876 () Unit!18874)

(assert (=> b!599162 (= e!342529 Unit!18876)))

(assert (=> b!599162 false))

(declare-fun b!599163 () Bool)

(declare-fun Unit!18877 () Unit!18874)

(assert (=> b!599163 (= e!342529 Unit!18877)))

(declare-fun b!599164 () Bool)

(assert (=> b!599164 (= e!342527 e!342535)))

(declare-fun res!384166 () Bool)

(assert (=> b!599164 (=> (not res!384166) (not e!342535))))

(assert (=> b!599164 (= res!384166 (= (select (store (arr!17799 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599164 (= lt!272313 (array!37080 (store (arr!17799 a!2986) i!1108 k!1786) (size!18163 a!2986)))))

(declare-fun b!599165 () Bool)

(declare-fun res!384167 () Bool)

(assert (=> b!599165 (=> (not res!384167) (not e!342526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599165 (= res!384167 (validKeyInArray!0 (select (arr!17799 a!2986) j!136)))))

(declare-fun b!599166 () Bool)

(assert (=> b!599166 (= e!342526 e!342527)))

(declare-fun res!384163 () Bool)

(assert (=> b!599166 (=> (not res!384163) (not e!342527))))

(declare-fun lt!272318 () SeekEntryResult!6239)

(assert (=> b!599166 (= res!384163 (or (= lt!272318 (MissingZero!6239 i!1108)) (= lt!272318 (MissingVacant!6239 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37079 (_ BitVec 32)) SeekEntryResult!6239)

(assert (=> b!599166 (= lt!272318 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599167 () Bool)

(declare-fun res!384160 () Bool)

(assert (=> b!599167 (=> (not res!384160) (not e!342527))))

(assert (=> b!599167 (= res!384160 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17799 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599168 () Bool)

(declare-fun res!384165 () Bool)

(assert (=> b!599168 (=> (not res!384165) (not e!342526))))

(assert (=> b!599168 (= res!384165 (validKeyInArray!0 k!1786))))

(assert (= (and start!54844 res!384157) b!599155))

(assert (= (and b!599155 res!384170) b!599165))

(assert (= (and b!599165 res!384167) b!599168))

(assert (= (and b!599168 res!384165) b!599158))

(assert (= (and b!599158 res!384154) b!599166))

(assert (= (and b!599166 res!384163) b!599154))

(assert (= (and b!599154 res!384159) b!599161))

(assert (= (and b!599161 res!384168) b!599167))

(assert (= (and b!599167 res!384160) b!599164))

(assert (= (and b!599164 res!384166) b!599151))

(assert (= (and b!599151 res!384169) b!599159))

(assert (= (and b!599159 res!384156) b!599156))

(assert (= (and b!599159 c!67865) b!599162))

(assert (= (and b!599159 (not c!67865)) b!599163))

(assert (= (and b!599159 (not res!384164)) b!599153))

(assert (= (and b!599153 res!384162) b!599150))

(assert (= (and b!599150 (not res!384158)) b!599160))

(assert (= (and b!599160 res!384155) b!599152))

(assert (= (and b!599153 (not res!384161)) b!599157))

(declare-fun m!576419 () Bool)

(assert (=> b!599153 m!576419))

(declare-fun m!576421 () Bool)

(assert (=> b!599153 m!576421))

(declare-fun m!576423 () Bool)

(assert (=> b!599153 m!576423))

(declare-fun m!576425 () Bool)

(assert (=> b!599167 m!576425))

(declare-fun m!576427 () Bool)

(assert (=> b!599168 m!576427))

(assert (=> b!599164 m!576421))

(declare-fun m!576429 () Bool)

(assert (=> b!599164 m!576429))

(declare-fun m!576431 () Bool)

(assert (=> b!599159 m!576431))

(declare-fun m!576433 () Bool)

(assert (=> b!599159 m!576433))

(assert (=> b!599159 m!576419))

(assert (=> b!599159 m!576421))

(assert (=> b!599159 m!576419))

(declare-fun m!576435 () Bool)

(assert (=> b!599159 m!576435))

(declare-fun m!576437 () Bool)

(assert (=> b!599159 m!576437))

(declare-fun m!576439 () Bool)

(assert (=> b!599159 m!576439))

(declare-fun m!576441 () Bool)

(assert (=> b!599159 m!576441))

(assert (=> b!599160 m!576419))

(assert (=> b!599160 m!576419))

(declare-fun m!576443 () Bool)

(assert (=> b!599160 m!576443))

(declare-fun m!576445 () Bool)

(assert (=> b!599151 m!576445))

(assert (=> b!599151 m!576419))

(assert (=> b!599151 m!576419))

(declare-fun m!576447 () Bool)

(assert (=> b!599151 m!576447))

(assert (=> b!599157 m!576419))

(assert (=> b!599157 m!576419))

(declare-fun m!576449 () Bool)

(assert (=> b!599157 m!576449))

(assert (=> b!599157 m!576419))

(declare-fun m!576451 () Bool)

(assert (=> b!599157 m!576451))

(declare-fun m!576453 () Bool)

(assert (=> b!599157 m!576453))

(declare-fun m!576455 () Bool)

(assert (=> b!599157 m!576455))

(declare-fun m!576457 () Bool)

(assert (=> start!54844 m!576457))

(declare-fun m!576459 () Bool)

(assert (=> start!54844 m!576459))

(declare-fun m!576461 () Bool)

(assert (=> b!599158 m!576461))

(declare-fun m!576463 () Bool)

(assert (=> b!599161 m!576463))

(assert (=> b!599152 m!576419))

(assert (=> b!599152 m!576419))

(declare-fun m!576465 () Bool)

(assert (=> b!599152 m!576465))

(assert (=> b!599165 m!576419))

(assert (=> b!599165 m!576419))

(declare-fun m!576467 () Bool)

(assert (=> b!599165 m!576467))

(declare-fun m!576469 () Bool)

(assert (=> b!599166 m!576469))

(assert (=> b!599150 m!576419))

(declare-fun m!576471 () Bool)

(assert (=> b!599154 m!576471))

(push 1)

