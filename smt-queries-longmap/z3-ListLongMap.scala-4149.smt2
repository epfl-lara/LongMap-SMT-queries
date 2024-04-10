; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56584 () Bool)

(assert start!56584)

(declare-fun b!626814 () Bool)

(declare-fun e!359078 () Bool)

(declare-fun e!359079 () Bool)

(assert (=> b!626814 (= e!359078 e!359079)))

(declare-fun res!404518 () Bool)

(assert (=> b!626814 (=> (not res!404518) (not e!359079))))

(declare-datatypes ((SeekEntryResult!6618 0))(
  ( (MissingZero!6618 (index!28756 (_ BitVec 32))) (Found!6618 (index!28757 (_ BitVec 32))) (Intermediate!6618 (undefined!7430 Bool) (index!28758 (_ BitVec 32)) (x!57502 (_ BitVec 32))) (Undefined!6618) (MissingVacant!6618 (index!28759 (_ BitVec 32))) )
))
(declare-fun lt!290160 () SeekEntryResult!6618)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626814 (= res!404518 (or (= lt!290160 (MissingZero!6618 i!1108)) (= lt!290160 (MissingVacant!6618 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37876 0))(
  ( (array!37877 (arr!18178 (Array (_ BitVec 32) (_ BitVec 64))) (size!18542 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37876)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37876 (_ BitVec 32)) SeekEntryResult!6618)

(assert (=> b!626814 (= lt!290160 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626815 () Bool)

(assert (=> b!626815 (= e!359079 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290161 () SeekEntryResult!6618)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37876 (_ BitVec 32)) SeekEntryResult!6618)

(assert (=> b!626815 (= lt!290161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18178 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626816 () Bool)

(declare-fun res!404522 () Bool)

(assert (=> b!626816 (=> (not res!404522) (not e!359078))))

(assert (=> b!626816 (= res!404522 (and (= (size!18542 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18542 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18542 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626817 () Bool)

(declare-fun res!404515 () Bool)

(assert (=> b!626817 (=> (not res!404515) (not e!359079))))

(assert (=> b!626817 (= res!404515 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18178 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18178 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626818 () Bool)

(declare-fun res!404521 () Bool)

(assert (=> b!626818 (=> (not res!404521) (not e!359078))))

(declare-fun arrayContainsKey!0 (array!37876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626818 (= res!404521 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626819 () Bool)

(declare-fun res!404520 () Bool)

(assert (=> b!626819 (=> (not res!404520) (not e!359078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626819 (= res!404520 (validKeyInArray!0 (select (arr!18178 a!2986) j!136)))))

(declare-fun b!626820 () Bool)

(declare-fun res!404519 () Bool)

(assert (=> b!626820 (=> (not res!404519) (not e!359079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37876 (_ BitVec 32)) Bool)

(assert (=> b!626820 (= res!404519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626821 () Bool)

(declare-fun res!404517 () Bool)

(assert (=> b!626821 (=> (not res!404517) (not e!359079))))

(declare-datatypes ((List!12219 0))(
  ( (Nil!12216) (Cons!12215 (h!13260 (_ BitVec 64)) (t!18447 List!12219)) )
))
(declare-fun arrayNoDuplicates!0 (array!37876 (_ BitVec 32) List!12219) Bool)

(assert (=> b!626821 (= res!404517 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12216))))

(declare-fun b!626822 () Bool)

(declare-fun res!404516 () Bool)

(assert (=> b!626822 (=> (not res!404516) (not e!359078))))

(assert (=> b!626822 (= res!404516 (validKeyInArray!0 k0!1786))))

(declare-fun res!404514 () Bool)

(assert (=> start!56584 (=> (not res!404514) (not e!359078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56584 (= res!404514 (validMask!0 mask!3053))))

(assert (=> start!56584 e!359078))

(assert (=> start!56584 true))

(declare-fun array_inv!13974 (array!37876) Bool)

(assert (=> start!56584 (array_inv!13974 a!2986)))

(assert (= (and start!56584 res!404514) b!626816))

(assert (= (and b!626816 res!404522) b!626819))

(assert (= (and b!626819 res!404520) b!626822))

(assert (= (and b!626822 res!404516) b!626818))

(assert (= (and b!626818 res!404521) b!626814))

(assert (= (and b!626814 res!404518) b!626820))

(assert (= (and b!626820 res!404519) b!626821))

(assert (= (and b!626821 res!404517) b!626817))

(assert (= (and b!626817 res!404515) b!626815))

(declare-fun m!602177 () Bool)

(assert (=> b!626822 m!602177))

(declare-fun m!602179 () Bool)

(assert (=> b!626821 m!602179))

(declare-fun m!602181 () Bool)

(assert (=> b!626819 m!602181))

(assert (=> b!626819 m!602181))

(declare-fun m!602183 () Bool)

(assert (=> b!626819 m!602183))

(declare-fun m!602185 () Bool)

(assert (=> b!626818 m!602185))

(declare-fun m!602187 () Bool)

(assert (=> b!626814 m!602187))

(declare-fun m!602189 () Bool)

(assert (=> b!626817 m!602189))

(declare-fun m!602191 () Bool)

(assert (=> b!626817 m!602191))

(declare-fun m!602193 () Bool)

(assert (=> b!626817 m!602193))

(declare-fun m!602195 () Bool)

(assert (=> start!56584 m!602195))

(declare-fun m!602197 () Bool)

(assert (=> start!56584 m!602197))

(assert (=> b!626815 m!602181))

(assert (=> b!626815 m!602181))

(declare-fun m!602199 () Bool)

(assert (=> b!626815 m!602199))

(declare-fun m!602201 () Bool)

(assert (=> b!626820 m!602201))

(check-sat (not b!626819) (not b!626814) (not start!56584) (not b!626818) (not b!626815) (not b!626822) (not b!626821) (not b!626820))
(check-sat)
