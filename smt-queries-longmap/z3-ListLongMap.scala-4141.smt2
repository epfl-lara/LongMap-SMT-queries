; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56442 () Bool)

(assert start!56442)

(declare-fun b!625707 () Bool)

(declare-fun res!403713 () Bool)

(declare-fun e!358573 () Bool)

(assert (=> b!625707 (=> (not res!403713) (not e!358573))))

(declare-datatypes ((array!37822 0))(
  ( (array!37823 (arr!18154 (Array (_ BitVec 32) (_ BitVec 64))) (size!18518 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37822)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625707 (= res!403713 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625708 () Bool)

(declare-fun res!403721 () Bool)

(declare-fun e!358574 () Bool)

(assert (=> b!625708 (=> (not res!403721) (not e!358574))))

(declare-datatypes ((List!12195 0))(
  ( (Nil!12192) (Cons!12191 (h!13236 (_ BitVec 64)) (t!18423 List!12195)) )
))
(declare-fun arrayNoDuplicates!0 (array!37822 (_ BitVec 32) List!12195) Bool)

(assert (=> b!625708 (= res!403721 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12192))))

(declare-fun b!625709 () Bool)

(declare-fun res!403717 () Bool)

(assert (=> b!625709 (=> (not res!403717) (not e!358574))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37822 (_ BitVec 32)) Bool)

(assert (=> b!625709 (= res!403717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625710 () Bool)

(assert (=> b!625710 (= e!358574 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6594 0))(
  ( (MissingZero!6594 (index!28660 (_ BitVec 32))) (Found!6594 (index!28661 (_ BitVec 32))) (Intermediate!6594 (undefined!7406 Bool) (index!28662 (_ BitVec 32)) (x!57408 (_ BitVec 32))) (Undefined!6594) (MissingVacant!6594 (index!28663 (_ BitVec 32))) )
))
(declare-fun lt!289885 () SeekEntryResult!6594)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37822 (_ BitVec 32)) SeekEntryResult!6594)

(assert (=> b!625710 (= lt!289885 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18154 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!403720 () Bool)

(assert (=> start!56442 (=> (not res!403720) (not e!358573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56442 (= res!403720 (validMask!0 mask!3053))))

(assert (=> start!56442 e!358573))

(assert (=> start!56442 true))

(declare-fun array_inv!13950 (array!37822) Bool)

(assert (=> start!56442 (array_inv!13950 a!2986)))

(declare-fun b!625711 () Bool)

(declare-fun res!403718 () Bool)

(assert (=> b!625711 (=> (not res!403718) (not e!358574))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625711 (= res!403718 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18154 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18154 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625712 () Bool)

(declare-fun res!403714 () Bool)

(assert (=> b!625712 (=> (not res!403714) (not e!358573))))

(assert (=> b!625712 (= res!403714 (and (= (size!18518 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18518 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18518 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625713 () Bool)

(declare-fun res!403715 () Bool)

(assert (=> b!625713 (=> (not res!403715) (not e!358573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625713 (= res!403715 (validKeyInArray!0 (select (arr!18154 a!2986) j!136)))))

(declare-fun b!625714 () Bool)

(assert (=> b!625714 (= e!358573 e!358574)))

(declare-fun res!403716 () Bool)

(assert (=> b!625714 (=> (not res!403716) (not e!358574))))

(declare-fun lt!289884 () SeekEntryResult!6594)

(assert (=> b!625714 (= res!403716 (or (= lt!289884 (MissingZero!6594 i!1108)) (= lt!289884 (MissingVacant!6594 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37822 (_ BitVec 32)) SeekEntryResult!6594)

(assert (=> b!625714 (= lt!289884 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625715 () Bool)

(declare-fun res!403719 () Bool)

(assert (=> b!625715 (=> (not res!403719) (not e!358573))))

(assert (=> b!625715 (= res!403719 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56442 res!403720) b!625712))

(assert (= (and b!625712 res!403714) b!625713))

(assert (= (and b!625713 res!403715) b!625715))

(assert (= (and b!625715 res!403719) b!625707))

(assert (= (and b!625707 res!403713) b!625714))

(assert (= (and b!625714 res!403716) b!625709))

(assert (= (and b!625709 res!403717) b!625708))

(assert (= (and b!625708 res!403721) b!625711))

(assert (= (and b!625711 res!403718) b!625710))

(declare-fun m!601267 () Bool)

(assert (=> b!625713 m!601267))

(assert (=> b!625713 m!601267))

(declare-fun m!601269 () Bool)

(assert (=> b!625713 m!601269))

(declare-fun m!601271 () Bool)

(assert (=> b!625708 m!601271))

(declare-fun m!601273 () Bool)

(assert (=> b!625707 m!601273))

(declare-fun m!601275 () Bool)

(assert (=> start!56442 m!601275))

(declare-fun m!601277 () Bool)

(assert (=> start!56442 m!601277))

(declare-fun m!601279 () Bool)

(assert (=> b!625709 m!601279))

(declare-fun m!601281 () Bool)

(assert (=> b!625711 m!601281))

(declare-fun m!601283 () Bool)

(assert (=> b!625711 m!601283))

(declare-fun m!601285 () Bool)

(assert (=> b!625711 m!601285))

(assert (=> b!625710 m!601267))

(assert (=> b!625710 m!601267))

(declare-fun m!601287 () Bool)

(assert (=> b!625710 m!601287))

(declare-fun m!601289 () Bool)

(assert (=> b!625714 m!601289))

(declare-fun m!601291 () Bool)

(assert (=> b!625715 m!601291))

(check-sat (not b!625714) (not b!625713) (not b!625715) (not start!56442) (not b!625710) (not b!625708) (not b!625707) (not b!625709))
(check-sat)
