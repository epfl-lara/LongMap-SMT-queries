; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56626 () Bool)

(assert start!56626)

(declare-fun b!627481 () Bool)

(declare-fun e!359267 () Bool)

(assert (=> b!627481 (= e!359267 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290286 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627481 (= lt!290286 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627482 () Bool)

(declare-fun res!405191 () Bool)

(assert (=> b!627482 (=> (not res!405191) (not e!359267))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37918 0))(
  ( (array!37919 (arr!18199 (Array (_ BitVec 32) (_ BitVec 64))) (size!18563 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37918)

(declare-datatypes ((SeekEntryResult!6639 0))(
  ( (MissingZero!6639 (index!28840 (_ BitVec 32))) (Found!6639 (index!28841 (_ BitVec 32))) (Intermediate!6639 (undefined!7451 Bool) (index!28842 (_ BitVec 32)) (x!57579 (_ BitVec 32))) (Undefined!6639) (MissingVacant!6639 (index!28843 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37918 (_ BitVec 32)) SeekEntryResult!6639)

(assert (=> b!627482 (= res!405191 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18199 a!2986) j!136) a!2986 mask!3053) (Found!6639 j!136)))))

(declare-fun b!627483 () Bool)

(declare-fun res!405181 () Bool)

(assert (=> b!627483 (=> (not res!405181) (not e!359267))))

(declare-datatypes ((List!12240 0))(
  ( (Nil!12237) (Cons!12236 (h!13281 (_ BitVec 64)) (t!18468 List!12240)) )
))
(declare-fun arrayNoDuplicates!0 (array!37918 (_ BitVec 32) List!12240) Bool)

(assert (=> b!627483 (= res!405181 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12237))))

(declare-fun b!627484 () Bool)

(declare-fun res!405182 () Bool)

(declare-fun e!359266 () Bool)

(assert (=> b!627484 (=> (not res!405182) (not e!359266))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627484 (= res!405182 (validKeyInArray!0 k0!1786))))

(declare-fun b!627485 () Bool)

(declare-fun res!405188 () Bool)

(assert (=> b!627485 (=> (not res!405188) (not e!359266))))

(declare-fun arrayContainsKey!0 (array!37918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627485 (= res!405188 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627486 () Bool)

(declare-fun res!405189 () Bool)

(assert (=> b!627486 (=> (not res!405189) (not e!359267))))

(assert (=> b!627486 (= res!405189 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18199 a!2986) index!984) (select (arr!18199 a!2986) j!136))) (not (= (select (arr!18199 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627488 () Bool)

(declare-fun res!405184 () Bool)

(assert (=> b!627488 (=> (not res!405184) (not e!359267))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627488 (= res!405184 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18199 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18199 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627489 () Bool)

(declare-fun res!405185 () Bool)

(assert (=> b!627489 (=> (not res!405185) (not e!359266))))

(assert (=> b!627489 (= res!405185 (and (= (size!18563 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18563 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18563 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627490 () Bool)

(declare-fun res!405183 () Bool)

(assert (=> b!627490 (=> (not res!405183) (not e!359267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37918 (_ BitVec 32)) Bool)

(assert (=> b!627490 (= res!405183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627491 () Bool)

(declare-fun res!405190 () Bool)

(assert (=> b!627491 (=> (not res!405190) (not e!359266))))

(assert (=> b!627491 (= res!405190 (validKeyInArray!0 (select (arr!18199 a!2986) j!136)))))

(declare-fun b!627487 () Bool)

(assert (=> b!627487 (= e!359266 e!359267)))

(declare-fun res!405187 () Bool)

(assert (=> b!627487 (=> (not res!405187) (not e!359267))))

(declare-fun lt!290287 () SeekEntryResult!6639)

(assert (=> b!627487 (= res!405187 (or (= lt!290287 (MissingZero!6639 i!1108)) (= lt!290287 (MissingVacant!6639 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37918 (_ BitVec 32)) SeekEntryResult!6639)

(assert (=> b!627487 (= lt!290287 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!405186 () Bool)

(assert (=> start!56626 (=> (not res!405186) (not e!359266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56626 (= res!405186 (validMask!0 mask!3053))))

(assert (=> start!56626 e!359266))

(assert (=> start!56626 true))

(declare-fun array_inv!13995 (array!37918) Bool)

(assert (=> start!56626 (array_inv!13995 a!2986)))

(assert (= (and start!56626 res!405186) b!627489))

(assert (= (and b!627489 res!405185) b!627491))

(assert (= (and b!627491 res!405190) b!627484))

(assert (= (and b!627484 res!405182) b!627485))

(assert (= (and b!627485 res!405188) b!627487))

(assert (= (and b!627487 res!405187) b!627490))

(assert (= (and b!627490 res!405183) b!627483))

(assert (= (and b!627483 res!405181) b!627488))

(assert (= (and b!627488 res!405184) b!627482))

(assert (= (and b!627482 res!405191) b!627486))

(assert (= (and b!627486 res!405189) b!627481))

(declare-fun m!602787 () Bool)

(assert (=> b!627483 m!602787))

(declare-fun m!602789 () Bool)

(assert (=> b!627482 m!602789))

(assert (=> b!627482 m!602789))

(declare-fun m!602791 () Bool)

(assert (=> b!627482 m!602791))

(declare-fun m!602793 () Bool)

(assert (=> start!56626 m!602793))

(declare-fun m!602795 () Bool)

(assert (=> start!56626 m!602795))

(declare-fun m!602797 () Bool)

(assert (=> b!627481 m!602797))

(declare-fun m!602799 () Bool)

(assert (=> b!627485 m!602799))

(assert (=> b!627491 m!602789))

(assert (=> b!627491 m!602789))

(declare-fun m!602801 () Bool)

(assert (=> b!627491 m!602801))

(declare-fun m!602803 () Bool)

(assert (=> b!627490 m!602803))

(declare-fun m!602805 () Bool)

(assert (=> b!627487 m!602805))

(declare-fun m!602807 () Bool)

(assert (=> b!627486 m!602807))

(assert (=> b!627486 m!602789))

(declare-fun m!602809 () Bool)

(assert (=> b!627484 m!602809))

(declare-fun m!602811 () Bool)

(assert (=> b!627488 m!602811))

(declare-fun m!602813 () Bool)

(assert (=> b!627488 m!602813))

(declare-fun m!602815 () Bool)

(assert (=> b!627488 m!602815))

(check-sat (not b!627491) (not b!627487) (not start!56626) (not b!627485) (not b!627490) (not b!627484) (not b!627481) (not b!627482) (not b!627483))
(check-sat)
