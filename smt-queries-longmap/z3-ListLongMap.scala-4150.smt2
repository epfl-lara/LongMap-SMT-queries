; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56640 () Bool)

(assert start!56640)

(declare-fun b!627077 () Bool)

(declare-fun res!404673 () Bool)

(declare-fun e!359225 () Bool)

(assert (=> b!627077 (=> (not res!404673) (not e!359225))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37875 0))(
  ( (array!37876 (arr!18175 (Array (_ BitVec 32) (_ BitVec 64))) (size!18539 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37875)

(assert (=> b!627077 (= res!404673 (and (= (size!18539 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18539 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18539 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627078 () Bool)

(declare-fun res!404677 () Bool)

(assert (=> b!627078 (=> (not res!404677) (not e!359225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627078 (= res!404677 (validKeyInArray!0 (select (arr!18175 a!2986) j!136)))))

(declare-fun b!627079 () Bool)

(declare-fun e!359224 () Bool)

(assert (=> b!627079 (= e!359224 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6571 0))(
  ( (MissingZero!6571 (index!28568 (_ BitVec 32))) (Found!6571 (index!28569 (_ BitVec 32))) (Intermediate!6571 (undefined!7383 Bool) (index!28570 (_ BitVec 32)) (x!57466 (_ BitVec 32))) (Undefined!6571) (MissingVacant!6571 (index!28571 (_ BitVec 32))) )
))
(declare-fun lt!290274 () SeekEntryResult!6571)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37875 (_ BitVec 32)) SeekEntryResult!6571)

(assert (=> b!627079 (= lt!290274 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18175 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!627080 () Bool)

(declare-fun res!404679 () Bool)

(assert (=> b!627080 (=> (not res!404679) (not e!359224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37875 (_ BitVec 32)) Bool)

(assert (=> b!627080 (= res!404679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627081 () Bool)

(declare-fun res!404674 () Bool)

(assert (=> b!627081 (=> (not res!404674) (not e!359224))))

(declare-datatypes ((List!12123 0))(
  ( (Nil!12120) (Cons!12119 (h!13167 (_ BitVec 64)) (t!18343 List!12123)) )
))
(declare-fun arrayNoDuplicates!0 (array!37875 (_ BitVec 32) List!12123) Bool)

(assert (=> b!627081 (= res!404674 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12120))))

(declare-fun res!404672 () Bool)

(assert (=> start!56640 (=> (not res!404672) (not e!359225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56640 (= res!404672 (validMask!0 mask!3053))))

(assert (=> start!56640 e!359225))

(assert (=> start!56640 true))

(declare-fun array_inv!14034 (array!37875) Bool)

(assert (=> start!56640 (array_inv!14034 a!2986)))

(declare-fun b!627082 () Bool)

(declare-fun res!404676 () Bool)

(assert (=> b!627082 (=> (not res!404676) (not e!359225))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627082 (= res!404676 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627083 () Bool)

(assert (=> b!627083 (= e!359225 e!359224)))

(declare-fun res!404678 () Bool)

(assert (=> b!627083 (=> (not res!404678) (not e!359224))))

(declare-fun lt!290275 () SeekEntryResult!6571)

(assert (=> b!627083 (= res!404678 (or (= lt!290275 (MissingZero!6571 i!1108)) (= lt!290275 (MissingVacant!6571 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37875 (_ BitVec 32)) SeekEntryResult!6571)

(assert (=> b!627083 (= lt!290275 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627084 () Bool)

(declare-fun res!404675 () Bool)

(assert (=> b!627084 (=> (not res!404675) (not e!359225))))

(assert (=> b!627084 (= res!404675 (validKeyInArray!0 k0!1786))))

(declare-fun b!627085 () Bool)

(declare-fun res!404680 () Bool)

(assert (=> b!627085 (=> (not res!404680) (not e!359224))))

(assert (=> b!627085 (= res!404680 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18175 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18175 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56640 res!404672) b!627077))

(assert (= (and b!627077 res!404673) b!627078))

(assert (= (and b!627078 res!404677) b!627084))

(assert (= (and b!627084 res!404675) b!627082))

(assert (= (and b!627082 res!404676) b!627083))

(assert (= (and b!627083 res!404678) b!627080))

(assert (= (and b!627080 res!404679) b!627081))

(assert (= (and b!627081 res!404674) b!627085))

(assert (= (and b!627085 res!404680) b!627079))

(declare-fun m!602719 () Bool)

(assert (=> b!627084 m!602719))

(declare-fun m!602721 () Bool)

(assert (=> start!56640 m!602721))

(declare-fun m!602723 () Bool)

(assert (=> start!56640 m!602723))

(declare-fun m!602725 () Bool)

(assert (=> b!627078 m!602725))

(assert (=> b!627078 m!602725))

(declare-fun m!602727 () Bool)

(assert (=> b!627078 m!602727))

(declare-fun m!602729 () Bool)

(assert (=> b!627080 m!602729))

(declare-fun m!602731 () Bool)

(assert (=> b!627083 m!602731))

(assert (=> b!627079 m!602725))

(assert (=> b!627079 m!602725))

(declare-fun m!602733 () Bool)

(assert (=> b!627079 m!602733))

(declare-fun m!602735 () Bool)

(assert (=> b!627082 m!602735))

(declare-fun m!602737 () Bool)

(assert (=> b!627085 m!602737))

(declare-fun m!602739 () Bool)

(assert (=> b!627085 m!602739))

(declare-fun m!602741 () Bool)

(assert (=> b!627085 m!602741))

(declare-fun m!602743 () Bool)

(assert (=> b!627081 m!602743))

(check-sat (not b!627078) (not b!627080) (not start!56640) (not b!627081) (not b!627082) (not b!627083) (not b!627084) (not b!627079))
(check-sat)
