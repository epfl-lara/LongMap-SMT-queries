; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56664 () Bool)

(assert start!56664)

(declare-fun b!627459 () Bool)

(declare-fun res!405057 () Bool)

(declare-fun e!359332 () Bool)

(assert (=> b!627459 (=> (not res!405057) (not e!359332))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37899 0))(
  ( (array!37900 (arr!18187 (Array (_ BitVec 32) (_ BitVec 64))) (size!18551 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37899)

(assert (=> b!627459 (= res!405057 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18187 a!2986) index!984) (select (arr!18187 a!2986) j!136))) (not (= (select (arr!18187 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627460 () Bool)

(declare-fun res!405059 () Bool)

(assert (=> b!627460 (=> (not res!405059) (not e!359332))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6583 0))(
  ( (MissingZero!6583 (index!28616 (_ BitVec 32))) (Found!6583 (index!28617 (_ BitVec 32))) (Intermediate!6583 (undefined!7395 Bool) (index!28618 (_ BitVec 32)) (x!57510 (_ BitVec 32))) (Undefined!6583) (MissingVacant!6583 (index!28619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37899 (_ BitVec 32)) SeekEntryResult!6583)

(assert (=> b!627460 (= res!405059 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18187 a!2986) j!136) a!2986 mask!3053) (Found!6583 j!136)))))

(declare-fun b!627461 () Bool)

(assert (=> b!627461 (= e!359332 false)))

(declare-fun lt!290346 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627461 (= lt!290346 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!627462 () Bool)

(declare-fun e!359333 () Bool)

(assert (=> b!627462 (= e!359333 e!359332)))

(declare-fun res!405064 () Bool)

(assert (=> b!627462 (=> (not res!405064) (not e!359332))))

(declare-fun lt!290347 () SeekEntryResult!6583)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627462 (= res!405064 (or (= lt!290347 (MissingZero!6583 i!1108)) (= lt!290347 (MissingVacant!6583 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37899 (_ BitVec 32)) SeekEntryResult!6583)

(assert (=> b!627462 (= lt!290347 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627463 () Bool)

(declare-fun res!405063 () Bool)

(assert (=> b!627463 (=> (not res!405063) (not e!359332))))

(assert (=> b!627463 (= res!405063 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18187 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18187 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627464 () Bool)

(declare-fun res!405055 () Bool)

(assert (=> b!627464 (=> (not res!405055) (not e!359333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627464 (= res!405055 (validKeyInArray!0 (select (arr!18187 a!2986) j!136)))))

(declare-fun b!627465 () Bool)

(declare-fun res!405060 () Bool)

(assert (=> b!627465 (=> (not res!405060) (not e!359332))))

(declare-datatypes ((List!12135 0))(
  ( (Nil!12132) (Cons!12131 (h!13179 (_ BitVec 64)) (t!18355 List!12135)) )
))
(declare-fun arrayNoDuplicates!0 (array!37899 (_ BitVec 32) List!12135) Bool)

(assert (=> b!627465 (= res!405060 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12132))))

(declare-fun b!627466 () Bool)

(declare-fun res!405054 () Bool)

(assert (=> b!627466 (=> (not res!405054) (not e!359333))))

(assert (=> b!627466 (= res!405054 (and (= (size!18551 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18551 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18551 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!405062 () Bool)

(assert (=> start!56664 (=> (not res!405062) (not e!359333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56664 (= res!405062 (validMask!0 mask!3053))))

(assert (=> start!56664 e!359333))

(assert (=> start!56664 true))

(declare-fun array_inv!14046 (array!37899) Bool)

(assert (=> start!56664 (array_inv!14046 a!2986)))

(declare-fun b!627467 () Bool)

(declare-fun res!405056 () Bool)

(assert (=> b!627467 (=> (not res!405056) (not e!359332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37899 (_ BitVec 32)) Bool)

(assert (=> b!627467 (= res!405056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627468 () Bool)

(declare-fun res!405058 () Bool)

(assert (=> b!627468 (=> (not res!405058) (not e!359333))))

(assert (=> b!627468 (= res!405058 (validKeyInArray!0 k0!1786))))

(declare-fun b!627469 () Bool)

(declare-fun res!405061 () Bool)

(assert (=> b!627469 (=> (not res!405061) (not e!359333))))

(declare-fun arrayContainsKey!0 (array!37899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627469 (= res!405061 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56664 res!405062) b!627466))

(assert (= (and b!627466 res!405054) b!627464))

(assert (= (and b!627464 res!405055) b!627468))

(assert (= (and b!627468 res!405058) b!627469))

(assert (= (and b!627469 res!405061) b!627462))

(assert (= (and b!627462 res!405064) b!627467))

(assert (= (and b!627467 res!405056) b!627465))

(assert (= (and b!627465 res!405060) b!627463))

(assert (= (and b!627463 res!405063) b!627460))

(assert (= (and b!627460 res!405059) b!627459))

(assert (= (and b!627459 res!405057) b!627461))

(declare-fun m!603067 () Bool)

(assert (=> b!627462 m!603067))

(declare-fun m!603069 () Bool)

(assert (=> start!56664 m!603069))

(declare-fun m!603071 () Bool)

(assert (=> start!56664 m!603071))

(declare-fun m!603073 () Bool)

(assert (=> b!627464 m!603073))

(assert (=> b!627464 m!603073))

(declare-fun m!603075 () Bool)

(assert (=> b!627464 m!603075))

(declare-fun m!603077 () Bool)

(assert (=> b!627461 m!603077))

(declare-fun m!603079 () Bool)

(assert (=> b!627469 m!603079))

(declare-fun m!603081 () Bool)

(assert (=> b!627467 m!603081))

(declare-fun m!603083 () Bool)

(assert (=> b!627463 m!603083))

(declare-fun m!603085 () Bool)

(assert (=> b!627463 m!603085))

(declare-fun m!603087 () Bool)

(assert (=> b!627463 m!603087))

(declare-fun m!603089 () Bool)

(assert (=> b!627468 m!603089))

(assert (=> b!627460 m!603073))

(assert (=> b!627460 m!603073))

(declare-fun m!603091 () Bool)

(assert (=> b!627460 m!603091))

(declare-fun m!603093 () Bool)

(assert (=> b!627465 m!603093))

(declare-fun m!603095 () Bool)

(assert (=> b!627459 m!603095))

(assert (=> b!627459 m!603073))

(check-sat (not b!627468) (not b!627467) (not b!627462) (not b!627465) (not b!627461) (not b!627464) (not start!56664) (not b!627469) (not b!627460))
(check-sat)
