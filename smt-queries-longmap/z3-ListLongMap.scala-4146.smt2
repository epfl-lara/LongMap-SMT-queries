; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56550 () Bool)

(assert start!56550)

(declare-fun b!626273 () Bool)

(declare-fun res!404119 () Bool)

(declare-fun e!358815 () Bool)

(assert (=> b!626273 (=> (not res!404119) (not e!358815))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626273 (= res!404119 (validKeyInArray!0 k0!1786))))

(declare-fun b!626274 () Bool)

(declare-fun res!404120 () Bool)

(assert (=> b!626274 (=> (not res!404120) (not e!358815))))

(declare-datatypes ((array!37854 0))(
  ( (array!37855 (arr!18167 (Array (_ BitVec 32) (_ BitVec 64))) (size!18532 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37854)

(declare-fun arrayContainsKey!0 (array!37854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626274 (= res!404120 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626275 () Bool)

(declare-fun res!404122 () Bool)

(declare-fun e!358813 () Bool)

(assert (=> b!626275 (=> (not res!404122) (not e!358813))))

(declare-datatypes ((List!12247 0))(
  ( (Nil!12244) (Cons!12243 (h!13288 (_ BitVec 64)) (t!18466 List!12247)) )
))
(declare-fun arrayNoDuplicates!0 (array!37854 (_ BitVec 32) List!12247) Bool)

(assert (=> b!626275 (= res!404122 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12244))))

(declare-fun b!626276 () Bool)

(declare-fun res!404117 () Bool)

(assert (=> b!626276 (=> (not res!404117) (not e!358815))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626276 (= res!404117 (validKeyInArray!0 (select (arr!18167 a!2986) j!136)))))

(declare-fun b!626277 () Bool)

(declare-fun res!404115 () Bool)

(assert (=> b!626277 (=> (not res!404115) (not e!358813))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626277 (= res!404115 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18167 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18167 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!404123 () Bool)

(assert (=> start!56550 (=> (not res!404123) (not e!358815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56550 (= res!404123 (validMask!0 mask!3053))))

(assert (=> start!56550 e!358815))

(assert (=> start!56550 true))

(declare-fun array_inv!14050 (array!37854) Bool)

(assert (=> start!56550 (array_inv!14050 a!2986)))

(declare-fun b!626278 () Bool)

(assert (=> b!626278 (= e!358815 e!358813)))

(declare-fun res!404116 () Bool)

(assert (=> b!626278 (=> (not res!404116) (not e!358813))))

(declare-datatypes ((SeekEntryResult!6604 0))(
  ( (MissingZero!6604 (index!28700 (_ BitVec 32))) (Found!6604 (index!28701 (_ BitVec 32))) (Intermediate!6604 (undefined!7416 Bool) (index!28702 (_ BitVec 32)) (x!57459 (_ BitVec 32))) (Undefined!6604) (MissingVacant!6604 (index!28703 (_ BitVec 32))) )
))
(declare-fun lt!289867 () SeekEntryResult!6604)

(assert (=> b!626278 (= res!404116 (or (= lt!289867 (MissingZero!6604 i!1108)) (= lt!289867 (MissingVacant!6604 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37854 (_ BitVec 32)) SeekEntryResult!6604)

(assert (=> b!626278 (= lt!289867 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626279 () Bool)

(declare-fun res!404121 () Bool)

(assert (=> b!626279 (=> (not res!404121) (not e!358813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37854 (_ BitVec 32)) Bool)

(assert (=> b!626279 (= res!404121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626280 () Bool)

(assert (=> b!626280 (= e!358813 false)))

(declare-fun lt!289866 () SeekEntryResult!6604)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37854 (_ BitVec 32)) SeekEntryResult!6604)

(assert (=> b!626280 (= lt!289866 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18167 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626281 () Bool)

(declare-fun res!404118 () Bool)

(assert (=> b!626281 (=> (not res!404118) (not e!358815))))

(assert (=> b!626281 (= res!404118 (and (= (size!18532 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18532 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18532 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56550 res!404123) b!626281))

(assert (= (and b!626281 res!404118) b!626276))

(assert (= (and b!626276 res!404117) b!626273))

(assert (= (and b!626273 res!404119) b!626274))

(assert (= (and b!626274 res!404120) b!626278))

(assert (= (and b!626278 res!404116) b!626279))

(assert (= (and b!626279 res!404121) b!626275))

(assert (= (and b!626275 res!404122) b!626277))

(assert (= (and b!626277 res!404115) b!626280))

(declare-fun m!601153 () Bool)

(assert (=> b!626273 m!601153))

(declare-fun m!601155 () Bool)

(assert (=> b!626275 m!601155))

(declare-fun m!601157 () Bool)

(assert (=> start!56550 m!601157))

(declare-fun m!601159 () Bool)

(assert (=> start!56550 m!601159))

(declare-fun m!601161 () Bool)

(assert (=> b!626277 m!601161))

(declare-fun m!601163 () Bool)

(assert (=> b!626277 m!601163))

(declare-fun m!601165 () Bool)

(assert (=> b!626277 m!601165))

(declare-fun m!601167 () Bool)

(assert (=> b!626274 m!601167))

(declare-fun m!601169 () Bool)

(assert (=> b!626280 m!601169))

(assert (=> b!626280 m!601169))

(declare-fun m!601171 () Bool)

(assert (=> b!626280 m!601171))

(declare-fun m!601173 () Bool)

(assert (=> b!626278 m!601173))

(assert (=> b!626276 m!601169))

(assert (=> b!626276 m!601169))

(declare-fun m!601175 () Bool)

(assert (=> b!626276 m!601175))

(declare-fun m!601177 () Bool)

(assert (=> b!626279 m!601177))

(check-sat (not start!56550) (not b!626280) (not b!626279) (not b!626276) (not b!626273) (not b!626274) (not b!626278) (not b!626275))
(check-sat)
