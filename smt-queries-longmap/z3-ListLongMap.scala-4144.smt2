; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56506 () Bool)

(assert start!56506)

(declare-fun res!404037 () Bool)

(declare-fun e!358808 () Bool)

(assert (=> start!56506 (=> (not res!404037) (not e!358808))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56506 (= res!404037 (validMask!0 mask!3053))))

(assert (=> start!56506 e!358808))

(assert (=> start!56506 true))

(declare-datatypes ((array!37843 0))(
  ( (array!37844 (arr!18163 (Array (_ BitVec 32) (_ BitVec 64))) (size!18527 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37843)

(declare-fun array_inv!13959 (array!37843) Bool)

(assert (=> start!56506 (array_inv!13959 a!2986)))

(declare-fun b!626189 () Bool)

(declare-fun res!404040 () Bool)

(assert (=> b!626189 (=> (not res!404040) (not e!358808))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626189 (= res!404040 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626190 () Bool)

(declare-fun res!404038 () Bool)

(declare-fun e!358809 () Bool)

(assert (=> b!626190 (=> (not res!404038) (not e!358809))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626190 (= res!404038 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18163 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18163 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626191 () Bool)

(declare-fun res!404033 () Bool)

(assert (=> b!626191 (=> (not res!404033) (not e!358808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626191 (= res!404033 (validKeyInArray!0 k0!1786))))

(declare-fun b!626192 () Bool)

(declare-fun res!404042 () Bool)

(assert (=> b!626192 (=> (not res!404042) (not e!358808))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626192 (= res!404042 (validKeyInArray!0 (select (arr!18163 a!2986) j!136)))))

(declare-fun b!626193 () Bool)

(declare-fun res!404036 () Bool)

(assert (=> b!626193 (=> (not res!404036) (not e!358809))))

(declare-datatypes ((List!12204 0))(
  ( (Nil!12201) (Cons!12200 (h!13245 (_ BitVec 64)) (t!18432 List!12204)) )
))
(declare-fun arrayNoDuplicates!0 (array!37843 (_ BitVec 32) List!12204) Bool)

(assert (=> b!626193 (= res!404036 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12201))))

(declare-fun b!626194 () Bool)

(declare-fun res!404041 () Bool)

(assert (=> b!626194 (=> (not res!404041) (not e!358808))))

(assert (=> b!626194 (= res!404041 (and (= (size!18527 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18527 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18527 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626195 () Bool)

(assert (=> b!626195 (= e!358808 e!358809)))

(declare-fun res!404034 () Bool)

(assert (=> b!626195 (=> (not res!404034) (not e!358809))))

(declare-datatypes ((SeekEntryResult!6603 0))(
  ( (MissingZero!6603 (index!28696 (_ BitVec 32))) (Found!6603 (index!28697 (_ BitVec 32))) (Intermediate!6603 (undefined!7415 Bool) (index!28698 (_ BitVec 32)) (x!57444 (_ BitVec 32))) (Undefined!6603) (MissingVacant!6603 (index!28699 (_ BitVec 32))) )
))
(declare-fun lt!290011 () SeekEntryResult!6603)

(assert (=> b!626195 (= res!404034 (or (= lt!290011 (MissingZero!6603 i!1108)) (= lt!290011 (MissingVacant!6603 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37843 (_ BitVec 32)) SeekEntryResult!6603)

(assert (=> b!626195 (= lt!290011 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626196 () Bool)

(declare-fun res!404035 () Bool)

(assert (=> b!626196 (=> (not res!404035) (not e!358809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37843 (_ BitVec 32)) Bool)

(assert (=> b!626196 (= res!404035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626197 () Bool)

(declare-fun res!404039 () Bool)

(assert (=> b!626197 (=> (not res!404039) (not e!358809))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37843 (_ BitVec 32)) SeekEntryResult!6603)

(assert (=> b!626197 (= res!404039 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18163 a!2986) j!136) a!2986 mask!3053) (Found!6603 j!136)))))

(declare-fun b!626198 () Bool)

(assert (=> b!626198 (= e!358809 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18163 a!2986) index!984) (select (arr!18163 a!2986) j!136))) (bvsge index!984 (size!18527 a!2986))))))

(assert (= (and start!56506 res!404037) b!626194))

(assert (= (and b!626194 res!404041) b!626192))

(assert (= (and b!626192 res!404042) b!626191))

(assert (= (and b!626191 res!404033) b!626189))

(assert (= (and b!626189 res!404040) b!626195))

(assert (= (and b!626195 res!404034) b!626196))

(assert (= (and b!626196 res!404035) b!626193))

(assert (= (and b!626193 res!404036) b!626190))

(assert (= (and b!626190 res!404038) b!626197))

(assert (= (and b!626197 res!404039) b!626198))

(declare-fun m!601657 () Bool)

(assert (=> b!626190 m!601657))

(declare-fun m!601659 () Bool)

(assert (=> b!626190 m!601659))

(declare-fun m!601661 () Bool)

(assert (=> b!626190 m!601661))

(declare-fun m!601663 () Bool)

(assert (=> b!626192 m!601663))

(assert (=> b!626192 m!601663))

(declare-fun m!601665 () Bool)

(assert (=> b!626192 m!601665))

(declare-fun m!601667 () Bool)

(assert (=> b!626196 m!601667))

(declare-fun m!601669 () Bool)

(assert (=> b!626191 m!601669))

(declare-fun m!601671 () Bool)

(assert (=> b!626198 m!601671))

(assert (=> b!626198 m!601663))

(declare-fun m!601673 () Bool)

(assert (=> start!56506 m!601673))

(declare-fun m!601675 () Bool)

(assert (=> start!56506 m!601675))

(declare-fun m!601677 () Bool)

(assert (=> b!626189 m!601677))

(assert (=> b!626197 m!601663))

(assert (=> b!626197 m!601663))

(declare-fun m!601679 () Bool)

(assert (=> b!626197 m!601679))

(declare-fun m!601681 () Bool)

(assert (=> b!626193 m!601681))

(declare-fun m!601683 () Bool)

(assert (=> b!626195 m!601683))

(check-sat (not b!626195) (not start!56506) (not b!626196) (not b!626193) (not b!626192) (not b!626197) (not b!626189) (not b!626191))
(check-sat)
