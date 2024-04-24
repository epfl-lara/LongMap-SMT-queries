; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56442 () Bool)

(assert start!56442)

(declare-fun b!625232 () Bool)

(declare-fun res!403138 () Bool)

(declare-fun e!358479 () Bool)

(assert (=> b!625232 (=> (not res!403138) (not e!358479))))

(declare-datatypes ((array!37767 0))(
  ( (array!37768 (arr!18124 (Array (_ BitVec 32) (_ BitVec 64))) (size!18488 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37767)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625232 (= res!403138 (validKeyInArray!0 (select (arr!18124 a!2986) j!136)))))

(declare-fun b!625233 () Bool)

(declare-fun res!403141 () Bool)

(assert (=> b!625233 (=> (not res!403141) (not e!358479))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625233 (= res!403141 (and (= (size!18488 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18488 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18488 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625234 () Bool)

(declare-fun e!358478 () Bool)

(assert (=> b!625234 (= e!358478 false)))

(declare-datatypes ((SeekEntryResult!6520 0))(
  ( (MissingZero!6520 (index!28364 (_ BitVec 32))) (Found!6520 (index!28365 (_ BitVec 32))) (Intermediate!6520 (undefined!7332 Bool) (index!28366 (_ BitVec 32)) (x!57273 (_ BitVec 32))) (Undefined!6520) (MissingVacant!6520 (index!28367 (_ BitVec 32))) )
))
(declare-fun lt!289845 () SeekEntryResult!6520)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37767 (_ BitVec 32)) SeekEntryResult!6520)

(assert (=> b!625234 (= lt!289845 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18124 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625235 () Bool)

(assert (=> b!625235 (= e!358479 e!358478)))

(declare-fun res!403135 () Bool)

(assert (=> b!625235 (=> (not res!403135) (not e!358478))))

(declare-fun lt!289846 () SeekEntryResult!6520)

(assert (=> b!625235 (= res!403135 (or (= lt!289846 (MissingZero!6520 i!1108)) (= lt!289846 (MissingVacant!6520 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37767 (_ BitVec 32)) SeekEntryResult!6520)

(assert (=> b!625235 (= lt!289846 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625237 () Bool)

(declare-fun res!403133 () Bool)

(assert (=> b!625237 (=> (not res!403133) (not e!358479))))

(declare-fun arrayContainsKey!0 (array!37767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625237 (= res!403133 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625238 () Bool)

(declare-fun res!403137 () Bool)

(assert (=> b!625238 (=> (not res!403137) (not e!358478))))

(assert (=> b!625238 (= res!403137 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18124 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18124 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625239 () Bool)

(declare-fun res!403140 () Bool)

(assert (=> b!625239 (=> (not res!403140) (not e!358478))))

(declare-datatypes ((List!12072 0))(
  ( (Nil!12069) (Cons!12068 (h!13116 (_ BitVec 64)) (t!18292 List!12072)) )
))
(declare-fun arrayNoDuplicates!0 (array!37767 (_ BitVec 32) List!12072) Bool)

(assert (=> b!625239 (= res!403140 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12069))))

(declare-fun b!625240 () Bool)

(declare-fun res!403136 () Bool)

(assert (=> b!625240 (=> (not res!403136) (not e!358479))))

(assert (=> b!625240 (= res!403136 (validKeyInArray!0 k0!1786))))

(declare-fun b!625236 () Bool)

(declare-fun res!403139 () Bool)

(assert (=> b!625236 (=> (not res!403139) (not e!358478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37767 (_ BitVec 32)) Bool)

(assert (=> b!625236 (= res!403139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!403134 () Bool)

(assert (=> start!56442 (=> (not res!403134) (not e!358479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56442 (= res!403134 (validMask!0 mask!3053))))

(assert (=> start!56442 e!358479))

(assert (=> start!56442 true))

(declare-fun array_inv!13983 (array!37767) Bool)

(assert (=> start!56442 (array_inv!13983 a!2986)))

(assert (= (and start!56442 res!403134) b!625233))

(assert (= (and b!625233 res!403141) b!625232))

(assert (= (and b!625232 res!403138) b!625240))

(assert (= (and b!625240 res!403136) b!625237))

(assert (= (and b!625237 res!403133) b!625235))

(assert (= (and b!625235 res!403135) b!625236))

(assert (= (and b!625236 res!403139) b!625239))

(assert (= (and b!625239 res!403140) b!625238))

(assert (= (and b!625238 res!403137) b!625234))

(declare-fun m!601099 () Bool)

(assert (=> b!625232 m!601099))

(assert (=> b!625232 m!601099))

(declare-fun m!601101 () Bool)

(assert (=> b!625232 m!601101))

(declare-fun m!601103 () Bool)

(assert (=> b!625239 m!601103))

(declare-fun m!601105 () Bool)

(assert (=> b!625238 m!601105))

(declare-fun m!601107 () Bool)

(assert (=> b!625238 m!601107))

(declare-fun m!601109 () Bool)

(assert (=> b!625238 m!601109))

(assert (=> b!625234 m!601099))

(assert (=> b!625234 m!601099))

(declare-fun m!601111 () Bool)

(assert (=> b!625234 m!601111))

(declare-fun m!601113 () Bool)

(assert (=> b!625240 m!601113))

(declare-fun m!601115 () Bool)

(assert (=> b!625237 m!601115))

(declare-fun m!601117 () Bool)

(assert (=> b!625236 m!601117))

(declare-fun m!601119 () Bool)

(assert (=> b!625235 m!601119))

(declare-fun m!601121 () Bool)

(assert (=> start!56442 m!601121))

(declare-fun m!601123 () Bool)

(assert (=> start!56442 m!601123))

(check-sat (not b!625234) (not b!625235) (not b!625239) (not start!56442) (not b!625240) (not b!625236) (not b!625232) (not b!625237))
(check-sat)
