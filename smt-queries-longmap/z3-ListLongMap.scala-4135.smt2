; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56454 () Bool)

(assert start!56454)

(declare-fun b!625394 () Bool)

(declare-fun res!403297 () Bool)

(declare-fun e!358532 () Bool)

(assert (=> b!625394 (=> (not res!403297) (not e!358532))))

(declare-datatypes ((array!37779 0))(
  ( (array!37780 (arr!18130 (Array (_ BitVec 32) (_ BitVec 64))) (size!18494 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37779)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625394 (= res!403297 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625395 () Bool)

(declare-fun res!403296 () Bool)

(declare-fun e!358533 () Bool)

(assert (=> b!625395 (=> (not res!403296) (not e!358533))))

(declare-datatypes ((List!12078 0))(
  ( (Nil!12075) (Cons!12074 (h!13122 (_ BitVec 64)) (t!18298 List!12078)) )
))
(declare-fun arrayNoDuplicates!0 (array!37779 (_ BitVec 32) List!12078) Bool)

(assert (=> b!625395 (= res!403296 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12075))))

(declare-fun b!625396 () Bool)

(declare-fun res!403303 () Bool)

(assert (=> b!625396 (=> (not res!403303) (not e!358533))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625396 (= res!403303 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18130 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18130 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625397 () Bool)

(assert (=> b!625397 (= e!358533 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6526 0))(
  ( (MissingZero!6526 (index!28388 (_ BitVec 32))) (Found!6526 (index!28389 (_ BitVec 32))) (Intermediate!6526 (undefined!7338 Bool) (index!28390 (_ BitVec 32)) (x!57295 (_ BitVec 32))) (Undefined!6526) (MissingVacant!6526 (index!28391 (_ BitVec 32))) )
))
(declare-fun lt!289882 () SeekEntryResult!6526)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37779 (_ BitVec 32)) SeekEntryResult!6526)

(assert (=> b!625397 (= lt!289882 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18130 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625398 () Bool)

(declare-fun res!403301 () Bool)

(assert (=> b!625398 (=> (not res!403301) (not e!358532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625398 (= res!403301 (validKeyInArray!0 (select (arr!18130 a!2986) j!136)))))

(declare-fun b!625399 () Bool)

(declare-fun res!403298 () Bool)

(assert (=> b!625399 (=> (not res!403298) (not e!358532))))

(assert (=> b!625399 (= res!403298 (validKeyInArray!0 k0!1786))))

(declare-fun b!625400 () Bool)

(assert (=> b!625400 (= e!358532 e!358533)))

(declare-fun res!403300 () Bool)

(assert (=> b!625400 (=> (not res!403300) (not e!358533))))

(declare-fun lt!289881 () SeekEntryResult!6526)

(assert (=> b!625400 (= res!403300 (or (= lt!289881 (MissingZero!6526 i!1108)) (= lt!289881 (MissingVacant!6526 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37779 (_ BitVec 32)) SeekEntryResult!6526)

(assert (=> b!625400 (= lt!289881 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!403302 () Bool)

(assert (=> start!56454 (=> (not res!403302) (not e!358532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56454 (= res!403302 (validMask!0 mask!3053))))

(assert (=> start!56454 e!358532))

(assert (=> start!56454 true))

(declare-fun array_inv!13989 (array!37779) Bool)

(assert (=> start!56454 (array_inv!13989 a!2986)))

(declare-fun b!625401 () Bool)

(declare-fun res!403295 () Bool)

(assert (=> b!625401 (=> (not res!403295) (not e!358533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37779 (_ BitVec 32)) Bool)

(assert (=> b!625401 (= res!403295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625402 () Bool)

(declare-fun res!403299 () Bool)

(assert (=> b!625402 (=> (not res!403299) (not e!358532))))

(assert (=> b!625402 (= res!403299 (and (= (size!18494 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18494 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18494 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56454 res!403302) b!625402))

(assert (= (and b!625402 res!403299) b!625398))

(assert (= (and b!625398 res!403301) b!625399))

(assert (= (and b!625399 res!403298) b!625394))

(assert (= (and b!625394 res!403297) b!625400))

(assert (= (and b!625400 res!403300) b!625401))

(assert (= (and b!625401 res!403295) b!625395))

(assert (= (and b!625395 res!403296) b!625396))

(assert (= (and b!625396 res!403303) b!625397))

(declare-fun m!601255 () Bool)

(assert (=> b!625400 m!601255))

(declare-fun m!601257 () Bool)

(assert (=> b!625399 m!601257))

(declare-fun m!601259 () Bool)

(assert (=> b!625394 m!601259))

(declare-fun m!601261 () Bool)

(assert (=> b!625401 m!601261))

(declare-fun m!601263 () Bool)

(assert (=> b!625397 m!601263))

(assert (=> b!625397 m!601263))

(declare-fun m!601265 () Bool)

(assert (=> b!625397 m!601265))

(declare-fun m!601267 () Bool)

(assert (=> b!625396 m!601267))

(declare-fun m!601269 () Bool)

(assert (=> b!625396 m!601269))

(declare-fun m!601271 () Bool)

(assert (=> b!625396 m!601271))

(declare-fun m!601273 () Bool)

(assert (=> b!625395 m!601273))

(declare-fun m!601275 () Bool)

(assert (=> start!56454 m!601275))

(declare-fun m!601277 () Bool)

(assert (=> start!56454 m!601277))

(assert (=> b!625398 m!601263))

(assert (=> b!625398 m!601263))

(declare-fun m!601279 () Bool)

(assert (=> b!625398 m!601279))

(check-sat (not start!56454) (not b!625400) (not b!625401) (not b!625394) (not b!625399) (not b!625397) (not b!625398) (not b!625395))
(check-sat)
