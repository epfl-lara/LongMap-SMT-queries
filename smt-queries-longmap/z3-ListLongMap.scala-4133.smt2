; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56394 () Bool)

(assert start!56394)

(declare-fun b!625050 () Bool)

(declare-fun res!403059 () Bool)

(declare-fun e!358359 () Bool)

(assert (=> b!625050 (=> (not res!403059) (not e!358359))))

(declare-datatypes ((array!37774 0))(
  ( (array!37775 (arr!18130 (Array (_ BitVec 32) (_ BitVec 64))) (size!18494 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37774)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37774 (_ BitVec 32)) Bool)

(assert (=> b!625050 (= res!403059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625051 () Bool)

(declare-fun res!403058 () Bool)

(assert (=> b!625051 (=> (not res!403058) (not e!358359))))

(declare-datatypes ((List!12171 0))(
  ( (Nil!12168) (Cons!12167 (h!13212 (_ BitVec 64)) (t!18399 List!12171)) )
))
(declare-fun arrayNoDuplicates!0 (array!37774 (_ BitVec 32) List!12171) Bool)

(assert (=> b!625051 (= res!403058 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12168))))

(declare-fun b!625052 () Bool)

(declare-fun res!403064 () Bool)

(declare-fun e!358357 () Bool)

(assert (=> b!625052 (=> (not res!403064) (not e!358357))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625052 (= res!403064 (validKeyInArray!0 (select (arr!18130 a!2986) j!136)))))

(declare-fun b!625053 () Bool)

(declare-fun res!403061 () Bool)

(assert (=> b!625053 (=> (not res!403061) (not e!358357))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625053 (= res!403061 (and (= (size!18494 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18494 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18494 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625054 () Bool)

(declare-fun res!403056 () Bool)

(assert (=> b!625054 (=> (not res!403056) (not e!358357))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625054 (= res!403056 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625055 () Bool)

(declare-fun res!403057 () Bool)

(assert (=> b!625055 (=> (not res!403057) (not e!358359))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625055 (= res!403057 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18130 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18130 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625056 () Bool)

(assert (=> b!625056 (= e!358357 e!358359)))

(declare-fun res!403060 () Bool)

(assert (=> b!625056 (=> (not res!403060) (not e!358359))))

(declare-datatypes ((SeekEntryResult!6570 0))(
  ( (MissingZero!6570 (index!28564 (_ BitVec 32))) (Found!6570 (index!28565 (_ BitVec 32))) (Intermediate!6570 (undefined!7382 Bool) (index!28566 (_ BitVec 32)) (x!57320 (_ BitVec 32))) (Undefined!6570) (MissingVacant!6570 (index!28567 (_ BitVec 32))) )
))
(declare-fun lt!289749 () SeekEntryResult!6570)

(assert (=> b!625056 (= res!403060 (or (= lt!289749 (MissingZero!6570 i!1108)) (= lt!289749 (MissingVacant!6570 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37774 (_ BitVec 32)) SeekEntryResult!6570)

(assert (=> b!625056 (= lt!289749 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625057 () Bool)

(assert (=> b!625057 (= e!358359 false)))

(declare-fun lt!289750 () SeekEntryResult!6570)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37774 (_ BitVec 32)) SeekEntryResult!6570)

(assert (=> b!625057 (= lt!289750 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18130 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625058 () Bool)

(declare-fun res!403063 () Bool)

(assert (=> b!625058 (=> (not res!403063) (not e!358357))))

(assert (=> b!625058 (= res!403063 (validKeyInArray!0 k0!1786))))

(declare-fun res!403062 () Bool)

(assert (=> start!56394 (=> (not res!403062) (not e!358357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56394 (= res!403062 (validMask!0 mask!3053))))

(assert (=> start!56394 e!358357))

(assert (=> start!56394 true))

(declare-fun array_inv!13926 (array!37774) Bool)

(assert (=> start!56394 (array_inv!13926 a!2986)))

(assert (= (and start!56394 res!403062) b!625053))

(assert (= (and b!625053 res!403061) b!625052))

(assert (= (and b!625052 res!403064) b!625058))

(assert (= (and b!625058 res!403063) b!625054))

(assert (= (and b!625054 res!403056) b!625056))

(assert (= (and b!625056 res!403060) b!625050))

(assert (= (and b!625050 res!403059) b!625051))

(assert (= (and b!625051 res!403058) b!625055))

(assert (= (and b!625055 res!403057) b!625057))

(declare-fun m!600643 () Bool)

(assert (=> b!625054 m!600643))

(declare-fun m!600645 () Bool)

(assert (=> b!625050 m!600645))

(declare-fun m!600647 () Bool)

(assert (=> b!625056 m!600647))

(declare-fun m!600649 () Bool)

(assert (=> b!625058 m!600649))

(declare-fun m!600651 () Bool)

(assert (=> start!56394 m!600651))

(declare-fun m!600653 () Bool)

(assert (=> start!56394 m!600653))

(declare-fun m!600655 () Bool)

(assert (=> b!625052 m!600655))

(assert (=> b!625052 m!600655))

(declare-fun m!600657 () Bool)

(assert (=> b!625052 m!600657))

(declare-fun m!600659 () Bool)

(assert (=> b!625051 m!600659))

(assert (=> b!625057 m!600655))

(assert (=> b!625057 m!600655))

(declare-fun m!600661 () Bool)

(assert (=> b!625057 m!600661))

(declare-fun m!600663 () Bool)

(assert (=> b!625055 m!600663))

(declare-fun m!600665 () Bool)

(assert (=> b!625055 m!600665))

(declare-fun m!600667 () Bool)

(assert (=> b!625055 m!600667))

(check-sat (not b!625050) (not start!56394) (not b!625057) (not b!625056) (not b!625054) (not b!625052) (not b!625051) (not b!625058))
(check-sat)
