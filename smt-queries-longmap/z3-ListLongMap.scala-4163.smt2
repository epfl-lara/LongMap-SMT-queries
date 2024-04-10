; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56668 () Bool)

(assert start!56668)

(declare-fun b!628174 () Bool)

(declare-fun res!405877 () Bool)

(declare-fun e!359457 () Bool)

(assert (=> b!628174 (=> (not res!405877) (not e!359457))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37960 0))(
  ( (array!37961 (arr!18220 (Array (_ BitVec 32) (_ BitVec 64))) (size!18584 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37960)

(assert (=> b!628174 (= res!405877 (and (= (size!18584 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18584 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18584 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628175 () Bool)

(declare-fun res!405881 () Bool)

(assert (=> b!628175 (=> (not res!405881) (not e!359457))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628175 (= res!405881 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628176 () Bool)

(declare-fun e!359456 () Bool)

(assert (=> b!628176 (= e!359457 e!359456)))

(declare-fun res!405883 () Bool)

(assert (=> b!628176 (=> (not res!405883) (not e!359456))))

(declare-datatypes ((SeekEntryResult!6660 0))(
  ( (MissingZero!6660 (index!28924 (_ BitVec 32))) (Found!6660 (index!28925 (_ BitVec 32))) (Intermediate!6660 (undefined!7472 Bool) (index!28926 (_ BitVec 32)) (x!57656 (_ BitVec 32))) (Undefined!6660) (MissingVacant!6660 (index!28927 (_ BitVec 32))) )
))
(declare-fun lt!290413 () SeekEntryResult!6660)

(assert (=> b!628176 (= res!405883 (or (= lt!290413 (MissingZero!6660 i!1108)) (= lt!290413 (MissingVacant!6660 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37960 (_ BitVec 32)) SeekEntryResult!6660)

(assert (=> b!628176 (= lt!290413 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628177 () Bool)

(declare-fun res!405876 () Bool)

(assert (=> b!628177 (=> (not res!405876) (not e!359457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628177 (= res!405876 (validKeyInArray!0 (select (arr!18220 a!2986) j!136)))))

(declare-fun b!628178 () Bool)

(declare-fun res!405884 () Bool)

(assert (=> b!628178 (=> (not res!405884) (not e!359456))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37960 (_ BitVec 32)) SeekEntryResult!6660)

(assert (=> b!628178 (= res!405884 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18220 a!2986) j!136) a!2986 mask!3053) (Found!6660 j!136)))))

(declare-fun res!405879 () Bool)

(assert (=> start!56668 (=> (not res!405879) (not e!359457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56668 (= res!405879 (validMask!0 mask!3053))))

(assert (=> start!56668 e!359457))

(assert (=> start!56668 true))

(declare-fun array_inv!14016 (array!37960) Bool)

(assert (=> start!56668 (array_inv!14016 a!2986)))

(declare-fun b!628179 () Bool)

(declare-fun res!405882 () Bool)

(assert (=> b!628179 (=> (not res!405882) (not e!359456))))

(declare-datatypes ((List!12261 0))(
  ( (Nil!12258) (Cons!12257 (h!13302 (_ BitVec 64)) (t!18489 List!12261)) )
))
(declare-fun arrayNoDuplicates!0 (array!37960 (_ BitVec 32) List!12261) Bool)

(assert (=> b!628179 (= res!405882 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12258))))

(declare-fun b!628180 () Bool)

(declare-fun res!405875 () Bool)

(assert (=> b!628180 (=> (not res!405875) (not e!359456))))

(assert (=> b!628180 (= res!405875 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18220 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18220 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628181 () Bool)

(declare-fun res!405878 () Bool)

(assert (=> b!628181 (=> (not res!405878) (not e!359456))))

(assert (=> b!628181 (= res!405878 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18220 a!2986) index!984) (select (arr!18220 a!2986) j!136))) (not (= (select (arr!18220 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628182 () Bool)

(declare-fun res!405880 () Bool)

(assert (=> b!628182 (=> (not res!405880) (not e!359457))))

(assert (=> b!628182 (= res!405880 (validKeyInArray!0 k0!1786))))

(declare-fun b!628183 () Bool)

(assert (=> b!628183 (= e!359456 false)))

(declare-fun lt!290412 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628183 (= lt!290412 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628184 () Bool)

(declare-fun res!405874 () Bool)

(assert (=> b!628184 (=> (not res!405874) (not e!359456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37960 (_ BitVec 32)) Bool)

(assert (=> b!628184 (= res!405874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56668 res!405879) b!628174))

(assert (= (and b!628174 res!405877) b!628177))

(assert (= (and b!628177 res!405876) b!628182))

(assert (= (and b!628182 res!405880) b!628175))

(assert (= (and b!628175 res!405881) b!628176))

(assert (= (and b!628176 res!405883) b!628184))

(assert (= (and b!628184 res!405874) b!628179))

(assert (= (and b!628179 res!405882) b!628180))

(assert (= (and b!628180 res!405875) b!628178))

(assert (= (and b!628178 res!405884) b!628181))

(assert (= (and b!628181 res!405878) b!628183))

(declare-fun m!603417 () Bool)

(assert (=> start!56668 m!603417))

(declare-fun m!603419 () Bool)

(assert (=> start!56668 m!603419))

(declare-fun m!603421 () Bool)

(assert (=> b!628184 m!603421))

(declare-fun m!603423 () Bool)

(assert (=> b!628182 m!603423))

(declare-fun m!603425 () Bool)

(assert (=> b!628178 m!603425))

(assert (=> b!628178 m!603425))

(declare-fun m!603427 () Bool)

(assert (=> b!628178 m!603427))

(declare-fun m!603429 () Bool)

(assert (=> b!628183 m!603429))

(declare-fun m!603431 () Bool)

(assert (=> b!628176 m!603431))

(declare-fun m!603433 () Bool)

(assert (=> b!628181 m!603433))

(assert (=> b!628181 m!603425))

(declare-fun m!603435 () Bool)

(assert (=> b!628180 m!603435))

(declare-fun m!603437 () Bool)

(assert (=> b!628180 m!603437))

(declare-fun m!603439 () Bool)

(assert (=> b!628180 m!603439))

(declare-fun m!603441 () Bool)

(assert (=> b!628175 m!603441))

(assert (=> b!628177 m!603425))

(assert (=> b!628177 m!603425))

(declare-fun m!603443 () Bool)

(assert (=> b!628177 m!603443))

(declare-fun m!603445 () Bool)

(assert (=> b!628179 m!603445))

(check-sat (not b!628177) (not b!628176) (not b!628178) (not b!628179) (not b!628183) (not start!56668) (not b!628175) (not b!628184) (not b!628182))
(check-sat)
