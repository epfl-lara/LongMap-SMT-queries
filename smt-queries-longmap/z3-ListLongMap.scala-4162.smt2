; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56712 () Bool)

(assert start!56712)

(declare-fun b!628251 () Bool)

(declare-fun res!405856 () Bool)

(declare-fun e!359549 () Bool)

(assert (=> b!628251 (=> (not res!405856) (not e!359549))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37947 0))(
  ( (array!37948 (arr!18211 (Array (_ BitVec 32) (_ BitVec 64))) (size!18575 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37947)

(declare-datatypes ((SeekEntryResult!6607 0))(
  ( (MissingZero!6607 (index!28712 (_ BitVec 32))) (Found!6607 (index!28713 (_ BitVec 32))) (Intermediate!6607 (undefined!7419 Bool) (index!28714 (_ BitVec 32)) (x!57598 (_ BitVec 32))) (Undefined!6607) (MissingVacant!6607 (index!28715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37947 (_ BitVec 32)) SeekEntryResult!6607)

(assert (=> b!628251 (= res!405856 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18211 a!2986) j!136) a!2986 mask!3053) (Found!6607 j!136)))))

(declare-fun b!628252 () Bool)

(declare-fun res!405852 () Bool)

(declare-fun e!359548 () Bool)

(assert (=> b!628252 (=> (not res!405852) (not e!359548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628252 (= res!405852 (validKeyInArray!0 (select (arr!18211 a!2986) j!136)))))

(declare-fun b!628253 () Bool)

(declare-fun res!405853 () Bool)

(assert (=> b!628253 (=> (not res!405853) (not e!359549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37947 (_ BitVec 32)) Bool)

(assert (=> b!628253 (= res!405853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628254 () Bool)

(declare-fun res!405850 () Bool)

(assert (=> b!628254 (=> (not res!405850) (not e!359549))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!628254 (= res!405850 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18211 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18211 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628255 () Bool)

(declare-fun res!405848 () Bool)

(assert (=> b!628255 (=> (not res!405848) (not e!359548))))

(assert (=> b!628255 (= res!405848 (validKeyInArray!0 k0!1786))))

(declare-fun res!405854 () Bool)

(assert (=> start!56712 (=> (not res!405854) (not e!359548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56712 (= res!405854 (validMask!0 mask!3053))))

(assert (=> start!56712 e!359548))

(assert (=> start!56712 true))

(declare-fun array_inv!14070 (array!37947) Bool)

(assert (=> start!56712 (array_inv!14070 a!2986)))

(declare-fun b!628256 () Bool)

(assert (=> b!628256 (= e!359549 false)))

(declare-fun lt!290490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628256 (= lt!290490 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!628257 () Bool)

(declare-fun res!405851 () Bool)

(assert (=> b!628257 (=> (not res!405851) (not e!359549))))

(declare-datatypes ((List!12159 0))(
  ( (Nil!12156) (Cons!12155 (h!13203 (_ BitVec 64)) (t!18379 List!12159)) )
))
(declare-fun arrayNoDuplicates!0 (array!37947 (_ BitVec 32) List!12159) Bool)

(assert (=> b!628257 (= res!405851 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12156))))

(declare-fun b!628258 () Bool)

(declare-fun res!405846 () Bool)

(assert (=> b!628258 (=> (not res!405846) (not e!359548))))

(assert (=> b!628258 (= res!405846 (and (= (size!18575 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18575 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18575 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628259 () Bool)

(assert (=> b!628259 (= e!359548 e!359549)))

(declare-fun res!405855 () Bool)

(assert (=> b!628259 (=> (not res!405855) (not e!359549))))

(declare-fun lt!290491 () SeekEntryResult!6607)

(assert (=> b!628259 (= res!405855 (or (= lt!290491 (MissingZero!6607 i!1108)) (= lt!290491 (MissingVacant!6607 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37947 (_ BitVec 32)) SeekEntryResult!6607)

(assert (=> b!628259 (= lt!290491 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628260 () Bool)

(declare-fun res!405847 () Bool)

(assert (=> b!628260 (=> (not res!405847) (not e!359549))))

(assert (=> b!628260 (= res!405847 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18211 a!2986) index!984) (select (arr!18211 a!2986) j!136))) (not (= (select (arr!18211 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628261 () Bool)

(declare-fun res!405849 () Bool)

(assert (=> b!628261 (=> (not res!405849) (not e!359548))))

(declare-fun arrayContainsKey!0 (array!37947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628261 (= res!405849 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56712 res!405854) b!628258))

(assert (= (and b!628258 res!405846) b!628252))

(assert (= (and b!628252 res!405852) b!628255))

(assert (= (and b!628255 res!405848) b!628261))

(assert (= (and b!628261 res!405849) b!628259))

(assert (= (and b!628259 res!405855) b!628253))

(assert (= (and b!628253 res!405853) b!628257))

(assert (= (and b!628257 res!405851) b!628254))

(assert (= (and b!628254 res!405850) b!628251))

(assert (= (and b!628251 res!405856) b!628260))

(assert (= (and b!628260 res!405847) b!628256))

(declare-fun m!603787 () Bool)

(assert (=> b!628252 m!603787))

(assert (=> b!628252 m!603787))

(declare-fun m!603789 () Bool)

(assert (=> b!628252 m!603789))

(declare-fun m!603791 () Bool)

(assert (=> b!628253 m!603791))

(declare-fun m!603793 () Bool)

(assert (=> b!628254 m!603793))

(declare-fun m!603795 () Bool)

(assert (=> b!628254 m!603795))

(declare-fun m!603797 () Bool)

(assert (=> b!628254 m!603797))

(declare-fun m!603799 () Bool)

(assert (=> b!628261 m!603799))

(declare-fun m!603801 () Bool)

(assert (=> b!628259 m!603801))

(declare-fun m!603803 () Bool)

(assert (=> b!628256 m!603803))

(declare-fun m!603805 () Bool)

(assert (=> start!56712 m!603805))

(declare-fun m!603807 () Bool)

(assert (=> start!56712 m!603807))

(declare-fun m!603809 () Bool)

(assert (=> b!628255 m!603809))

(declare-fun m!603811 () Bool)

(assert (=> b!628257 m!603811))

(declare-fun m!603813 () Bool)

(assert (=> b!628260 m!603813))

(assert (=> b!628260 m!603787))

(assert (=> b!628251 m!603787))

(assert (=> b!628251 m!603787))

(declare-fun m!603815 () Bool)

(assert (=> b!628251 m!603815))

(check-sat (not b!628256) (not b!628252) (not b!628261) (not b!628257) (not start!56712) (not b!628253) (not b!628255) (not b!628259) (not b!628251))
(check-sat)
