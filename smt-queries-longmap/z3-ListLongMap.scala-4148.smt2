; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56578 () Bool)

(assert start!56578)

(declare-fun b!626733 () Bool)

(declare-fun res!404434 () Bool)

(declare-fun e!359052 () Bool)

(assert (=> b!626733 (=> (not res!404434) (not e!359052))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37870 0))(
  ( (array!37871 (arr!18175 (Array (_ BitVec 32) (_ BitVec 64))) (size!18539 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37870)

(assert (=> b!626733 (= res!404434 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18175 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18175 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626734 () Bool)

(declare-fun e!359051 () Bool)

(assert (=> b!626734 (= e!359051 e!359052)))

(declare-fun res!404441 () Bool)

(assert (=> b!626734 (=> (not res!404441) (not e!359052))))

(declare-datatypes ((SeekEntryResult!6615 0))(
  ( (MissingZero!6615 (index!28744 (_ BitVec 32))) (Found!6615 (index!28745 (_ BitVec 32))) (Intermediate!6615 (undefined!7427 Bool) (index!28746 (_ BitVec 32)) (x!57491 (_ BitVec 32))) (Undefined!6615) (MissingVacant!6615 (index!28747 (_ BitVec 32))) )
))
(declare-fun lt!290142 () SeekEntryResult!6615)

(assert (=> b!626734 (= res!404441 (or (= lt!290142 (MissingZero!6615 i!1108)) (= lt!290142 (MissingVacant!6615 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37870 (_ BitVec 32)) SeekEntryResult!6615)

(assert (=> b!626734 (= lt!290142 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626735 () Bool)

(declare-fun res!404433 () Bool)

(assert (=> b!626735 (=> (not res!404433) (not e!359051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626735 (= res!404433 (validKeyInArray!0 k0!1786))))

(declare-fun b!626736 () Bool)

(declare-fun res!404437 () Bool)

(assert (=> b!626736 (=> (not res!404437) (not e!359051))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626736 (= res!404437 (validKeyInArray!0 (select (arr!18175 a!2986) j!136)))))

(declare-fun b!626737 () Bool)

(declare-fun res!404438 () Bool)

(assert (=> b!626737 (=> (not res!404438) (not e!359051))))

(declare-fun arrayContainsKey!0 (array!37870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626737 (= res!404438 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626738 () Bool)

(assert (=> b!626738 (= e!359052 false)))

(declare-fun lt!290143 () SeekEntryResult!6615)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37870 (_ BitVec 32)) SeekEntryResult!6615)

(assert (=> b!626738 (= lt!290143 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18175 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!404439 () Bool)

(assert (=> start!56578 (=> (not res!404439) (not e!359051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56578 (= res!404439 (validMask!0 mask!3053))))

(assert (=> start!56578 e!359051))

(assert (=> start!56578 true))

(declare-fun array_inv!13971 (array!37870) Bool)

(assert (=> start!56578 (array_inv!13971 a!2986)))

(declare-fun b!626739 () Bool)

(declare-fun res!404436 () Bool)

(assert (=> b!626739 (=> (not res!404436) (not e!359052))))

(declare-datatypes ((List!12216 0))(
  ( (Nil!12213) (Cons!12212 (h!13257 (_ BitVec 64)) (t!18444 List!12216)) )
))
(declare-fun arrayNoDuplicates!0 (array!37870 (_ BitVec 32) List!12216) Bool)

(assert (=> b!626739 (= res!404436 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12213))))

(declare-fun b!626740 () Bool)

(declare-fun res!404435 () Bool)

(assert (=> b!626740 (=> (not res!404435) (not e!359051))))

(assert (=> b!626740 (= res!404435 (and (= (size!18539 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18539 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18539 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626741 () Bool)

(declare-fun res!404440 () Bool)

(assert (=> b!626741 (=> (not res!404440) (not e!359052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37870 (_ BitVec 32)) Bool)

(assert (=> b!626741 (= res!404440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56578 res!404439) b!626740))

(assert (= (and b!626740 res!404435) b!626736))

(assert (= (and b!626736 res!404437) b!626735))

(assert (= (and b!626735 res!404433) b!626737))

(assert (= (and b!626737 res!404438) b!626734))

(assert (= (and b!626734 res!404441) b!626741))

(assert (= (and b!626741 res!404440) b!626739))

(assert (= (and b!626739 res!404436) b!626733))

(assert (= (and b!626733 res!404434) b!626738))

(declare-fun m!602099 () Bool)

(assert (=> b!626739 m!602099))

(declare-fun m!602101 () Bool)

(assert (=> b!626741 m!602101))

(declare-fun m!602103 () Bool)

(assert (=> b!626734 m!602103))

(declare-fun m!602105 () Bool)

(assert (=> b!626736 m!602105))

(assert (=> b!626736 m!602105))

(declare-fun m!602107 () Bool)

(assert (=> b!626736 m!602107))

(declare-fun m!602109 () Bool)

(assert (=> b!626737 m!602109))

(declare-fun m!602111 () Bool)

(assert (=> b!626735 m!602111))

(assert (=> b!626738 m!602105))

(assert (=> b!626738 m!602105))

(declare-fun m!602113 () Bool)

(assert (=> b!626738 m!602113))

(declare-fun m!602115 () Bool)

(assert (=> start!56578 m!602115))

(declare-fun m!602117 () Bool)

(assert (=> start!56578 m!602117))

(declare-fun m!602119 () Bool)

(assert (=> b!626733 m!602119))

(declare-fun m!602121 () Bool)

(assert (=> b!626733 m!602121))

(declare-fun m!602123 () Bool)

(assert (=> b!626733 m!602123))

(check-sat (not b!626735) (not start!56578) (not b!626741) (not b!626737) (not b!626736) (not b!626734) (not b!626738) (not b!626739))
(check-sat)
