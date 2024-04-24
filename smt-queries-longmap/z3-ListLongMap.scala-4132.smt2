; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56436 () Bool)

(assert start!56436)

(declare-fun b!625151 () Bool)

(declare-fun res!403058 () Bool)

(declare-fun e!358450 () Bool)

(assert (=> b!625151 (=> (not res!403058) (not e!358450))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37761 0))(
  ( (array!37762 (arr!18121 (Array (_ BitVec 32) (_ BitVec 64))) (size!18485 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37761)

(assert (=> b!625151 (= res!403058 (and (= (size!18485 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18485 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18485 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625152 () Bool)

(declare-fun e!358451 () Bool)

(assert (=> b!625152 (= e!358451 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6517 0))(
  ( (MissingZero!6517 (index!28352 (_ BitVec 32))) (Found!6517 (index!28353 (_ BitVec 32))) (Intermediate!6517 (undefined!7329 Bool) (index!28354 (_ BitVec 32)) (x!57262 (_ BitVec 32))) (Undefined!6517) (MissingVacant!6517 (index!28355 (_ BitVec 32))) )
))
(declare-fun lt!289827 () SeekEntryResult!6517)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37761 (_ BitVec 32)) SeekEntryResult!6517)

(assert (=> b!625152 (= lt!289827 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18121 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625153 () Bool)

(declare-fun res!403055 () Bool)

(assert (=> b!625153 (=> (not res!403055) (not e!358450))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625153 (= res!403055 (validKeyInArray!0 k0!1786))))

(declare-fun b!625154 () Bool)

(declare-fun res!403057 () Bool)

(assert (=> b!625154 (=> (not res!403057) (not e!358450))))

(declare-fun arrayContainsKey!0 (array!37761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625154 (= res!403057 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625155 () Bool)

(declare-fun res!403054 () Bool)

(assert (=> b!625155 (=> (not res!403054) (not e!358451))))

(assert (=> b!625155 (= res!403054 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18121 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18121 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625157 () Bool)

(declare-fun res!403060 () Bool)

(assert (=> b!625157 (=> (not res!403060) (not e!358451))))

(declare-datatypes ((List!12069 0))(
  ( (Nil!12066) (Cons!12065 (h!13113 (_ BitVec 64)) (t!18289 List!12069)) )
))
(declare-fun arrayNoDuplicates!0 (array!37761 (_ BitVec 32) List!12069) Bool)

(assert (=> b!625157 (= res!403060 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12066))))

(declare-fun b!625158 () Bool)

(declare-fun res!403052 () Bool)

(assert (=> b!625158 (=> (not res!403052) (not e!358450))))

(assert (=> b!625158 (= res!403052 (validKeyInArray!0 (select (arr!18121 a!2986) j!136)))))

(declare-fun b!625159 () Bool)

(assert (=> b!625159 (= e!358450 e!358451)))

(declare-fun res!403053 () Bool)

(assert (=> b!625159 (=> (not res!403053) (not e!358451))))

(declare-fun lt!289828 () SeekEntryResult!6517)

(assert (=> b!625159 (= res!403053 (or (= lt!289828 (MissingZero!6517 i!1108)) (= lt!289828 (MissingVacant!6517 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37761 (_ BitVec 32)) SeekEntryResult!6517)

(assert (=> b!625159 (= lt!289828 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625156 () Bool)

(declare-fun res!403059 () Bool)

(assert (=> b!625156 (=> (not res!403059) (not e!358451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37761 (_ BitVec 32)) Bool)

(assert (=> b!625156 (= res!403059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!403056 () Bool)

(assert (=> start!56436 (=> (not res!403056) (not e!358450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56436 (= res!403056 (validMask!0 mask!3053))))

(assert (=> start!56436 e!358450))

(assert (=> start!56436 true))

(declare-fun array_inv!13980 (array!37761) Bool)

(assert (=> start!56436 (array_inv!13980 a!2986)))

(assert (= (and start!56436 res!403056) b!625151))

(assert (= (and b!625151 res!403058) b!625158))

(assert (= (and b!625158 res!403052) b!625153))

(assert (= (and b!625153 res!403055) b!625154))

(assert (= (and b!625154 res!403057) b!625159))

(assert (= (and b!625159 res!403053) b!625156))

(assert (= (and b!625156 res!403059) b!625157))

(assert (= (and b!625157 res!403060) b!625155))

(assert (= (and b!625155 res!403054) b!625152))

(declare-fun m!601021 () Bool)

(assert (=> b!625152 m!601021))

(assert (=> b!625152 m!601021))

(declare-fun m!601023 () Bool)

(assert (=> b!625152 m!601023))

(assert (=> b!625158 m!601021))

(assert (=> b!625158 m!601021))

(declare-fun m!601025 () Bool)

(assert (=> b!625158 m!601025))

(declare-fun m!601027 () Bool)

(assert (=> start!56436 m!601027))

(declare-fun m!601029 () Bool)

(assert (=> start!56436 m!601029))

(declare-fun m!601031 () Bool)

(assert (=> b!625156 m!601031))

(declare-fun m!601033 () Bool)

(assert (=> b!625155 m!601033))

(declare-fun m!601035 () Bool)

(assert (=> b!625155 m!601035))

(declare-fun m!601037 () Bool)

(assert (=> b!625155 m!601037))

(declare-fun m!601039 () Bool)

(assert (=> b!625154 m!601039))

(declare-fun m!601041 () Bool)

(assert (=> b!625159 m!601041))

(declare-fun m!601043 () Bool)

(assert (=> b!625157 m!601043))

(declare-fun m!601045 () Bool)

(assert (=> b!625153 m!601045))

(check-sat (not b!625154) (not b!625157) (not start!56436) (not b!625159) (not b!625153) (not b!625156) (not b!625158) (not b!625152))
(check-sat)
